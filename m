Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 62B4F6AC1E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Aug 2015 17:23:06 +0000 (UTC)
Received: by widdq5 with SMTP id dq5so56889683wid.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Aug 2015 10:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=eGCg6RjuEnrQ5tSlQ6YXtCt6LpA9njwxhg2la+nmvCE=;
	b=MuuT2NUpSlcXFBRa0H/BNOhV8L5s34u5c9saQVCyNIE3lfrFvtVPzoeIyrrNBjWdt7
	/LxV+7e9rscBdnO2tmvJGcyCsMx6NS/+OmT/n7kPVb+R2um+OU7mOZN4hSZnYlhQKd5O
	W0V1EeVNMiMYHjvTAdqbFywbLfQYqhDli8F1sZQ3MIhJX+DUsDT9jWQuVlLFXz8uECLF
	TB4IEH1lHFk8HDwZe713k/+EsjNA3MgnGpQ64Feegj3lKr0Pk3cDJS2Q9XpLCAiHolQa
	quXxgoglt7t/RlAHoSb7sR9U7ml41QW3HRVzwWy5xaFZBPL8SbAc8S+Y0C7d7UoMHeR7
	FDDA==
X-Received: by 10.180.76.232 with SMTP id n8mr32245021wiw.72.1440436987014;
	Mon, 24 Aug 2015 10:23:07 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	ir5sm24120258wjb.23.2015.08.24.10.23.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Aug 2015 10:23:06 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Aug 2015 19:23:06 +0200
Message-Id: <1440436986-30016-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.5.0
Subject: [meta-networking][PATCH] tcpdump: add PACKAGECONFIG for smi
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 24 Aug 2015 17:23:11 -0000

* libsmi is autodetected in configure, but in most cases disabled because of
  cross-compilation so keep it explicitly disabled
* resolves following difference in builds with and without libsmi built
  before tcpdump:
  4.7.4-r0-with/temp/log.do_configure:checking smi.h usability... yes
  4.7.4-r0-with/temp/log.do_configure:checking smi.h presence... yes
  4.7.4-r0-with/temp/log.do_configure:checking for smi.h... yes
  4.7.4-r0-with/temp/log.do_configure:checking for smiInit in -lsmi... yes
  4.7.4-r0-with/temp/log.do_configure:checking whether to enable libsmi... not when cross-compiling

  4.7.4-r0-without/temp/log.do_configure:checking smi.h usability... no
  4.7.4-r0-without/temp/log.do_configure:checking smi.h presence... no
  4.7.4-r0-without/temp/log.do_configure:checking for smi.h... no

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-networking/recipes-support/tcpdump/tcpdump_4.7.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-support/tcpdump/tcpdump_4.7.4.bb b/meta-networking/recipes-support/tcpdump/tcpdump_4.7.4.bb
index b0b8e9d..0ffe589 100644
--- a/meta-networking/recipes-support/tcpdump/tcpdump_4.7.4.bb
+++ b/meta-networking/recipes-support/tcpdump/tcpdump_4.7.4.bb
@@ -22,6 +22,7 @@ CACHED_CONFIGUREVARS = "ac_cv_linux_vers=${ac_cv_linux_vers=2}"
 PACKAGECONFIG ??= "openssl ipv6"
 PACKAGECONFIG[openssl] = "--with-crypto=yes, --without-openssl --without-crypto, openssl"
 PACKAGECONFIG[ipv6] = "--enable-ipv6, --disable-ipv6,"
+PACKAGECONFIG[smi] = "--with-smi, --without-smi,libsmi"
 
 EXTRA_AUTORECONF += " -I m4"
 
-- 
2.5.0


