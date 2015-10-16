Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id AFE237711D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Oct 2015 13:58:07 +0000 (UTC)
Received: by wicll6 with SMTP id ll6so12366044wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Oct 2015 06:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=sNKPe1O2xqXOcJwpId8AvAbqflEDEIXb0jbrZzV37YA=;
	b=aKH9IxOHwgkQV11Fbq0/szJGcTNroaWRvRfuti+RppfeMSUf2pLzBZwuq+/OJdKFtO
	dbMvOi8TpAPdT4X+CTOc41x0GHp3wdWrxzJAfdJJBVkrfVAoPJNY7ZydXVKHmeHTOki0
	MDTifT7F/W2wGqGPDtRDkPKdJXLWDPP+OoY8QQL0DkrI/Zkv8fr1S7S4tANfwHRmR0us
	HQvFffq6yQR5LSzOKT20cRNibmKir63WKM69rDAoxnhaJRy85fYVYr2uPDD9w1go0h6k
	f0sJygtn0GnQDkweF8eK2ZI/EqYzlbQOl5Rbhyw+t/vb73Lzfbn44UZ5ZEu7YvC5w982
	y1pQ==
X-Received: by 10.180.96.166 with SMTP id dt6mr5104099wib.38.1445003887957;
	Fri, 16 Oct 2015 06:58:07 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	w1sm22701334wjz.37.2015.10.16.06.58.06
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 16 Oct 2015 06:58:06 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Oct 2015 15:58:29 +0200
Message-Id: <1445003910-6444-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.1
In-Reply-To: <1445003910-6444-1-git-send-email-Martin.Jansa@gmail.com>
References: <1445003910-6444-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-oe][dizzy 3/4] tcpdump: add PACKAGECONFIG for smi
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
X-List-Received-Date: Fri, 16 Oct 2015 13:58:09 -0000

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
 meta-networking/recipes-support/tcpdump/tcpdump_4.6.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-support/tcpdump/tcpdump_4.6.1.bb b/meta-networking/recipes-support/tcpdump/tcpdump_4.6.1.bb
index 1fdaf30..1919b87 100644
--- a/meta-networking/recipes-support/tcpdump/tcpdump_4.6.1.bb
+++ b/meta-networking/recipes-support/tcpdump/tcpdump_4.6.1.bb
@@ -24,6 +24,7 @@ CACHED_CONFIGUREVARS = "ac_cv_linux_vers=${ac_cv_linux_vers=2}"
 PACKAGECONFIG ??= "openssl ipv6"
 PACKAGECONFIG[openssl] = "--with-crypto=yes, --without-openssl --without-crypto, openssl"
 PACKAGECONFIG[ipv6] = "--enable-ipv6, --disable-ipv6,"
+PACKAGECONFIG[smi] = "--with-smi, --without-smi,libsmi"
 
 EXTRA_AUTORECONF += " -I m4"
 
-- 
2.6.1


