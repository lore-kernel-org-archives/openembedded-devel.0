Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f179.google.com (mail-ea0-f179.google.com
	[209.85.215.179])
	by mail.openembedded.org (Postfix) with ESMTP id 9F1A56B5F8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 07:18:54 +0000 (UTC)
Received: by mail-ea0-f179.google.com with SMTP id b10so183397eae.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 00:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=bUOfgsZHRhWooeW7Qo36n904LWfhFHQtaznfwpjI2Sk=;
	b=xLB87h39Zq+r+ZxujWpM5+ZjFUnFTZmu5oK+jEIYV7rnxWz92ssjE+VcLbtkKBZEYW
	CHacWPKkmrU5RagMcLxvZOfFjwYoR/f9WXIrwEzxr3at+8pcSaE0ZXEy5kAHihFlY6Hr
	vkoGtErCyJKM2bz+vCrM2FHh8Zn345wBl7O/OvILJusjZiv31LjCB5TrXH0eXDZrluMk
	N4J8891uxGPtBdyuE2O0pOEciD4DdruPl/Jq8zK2vUovNmhzNdD6V8NdYWo3Zuv69NDJ
	GFQW5Or+EwDEs3tmmWxbi1e4fz3NmqmzEr405k8P2/aQy8yqsuc7I3vcQOmiCzs06fqU
	saRQ==
X-Received: by 10.15.111.136 with SMTP id cj8mr112648eeb.91.1376551135034;
	Thu, 15 Aug 2013 00:18:55 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	bp43sm81923003eeb.4.2013.08.15.00.18.54
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 00:18:54 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Aug 2013 09:18:41 +0200
Message-Id: <5411441637085de90af2ab2d2b2feadf3898f092.1376551135.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][dylan][PATCH 01/60] vsftpd: add missing dependency on openssl
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
X-List-Received-Date: Thu, 15 Aug 2013 07:18:55 -0000

From: Martin Jansa <martin.jansa@gmail.com>

* Fails without openssl in sysroot:
  | i586-webos-linux-gcc  -m32 -march=i586 --sysroot=/OE/sysroots/qemux86 -o vsftpd main.o utility.o prelogin.o ftpcmdio.o postlogin.o privsock.o tunables.o ftpdataio.o secbuf.o ls.o postprivparent.o logging.o str.o netstr.o sysstr.o strlist.o banner.o filestr.o parseconf.o secutil.o ascii.o oneprocess.o twoprocess.o privops.o standalone.o hash.o tcpwrap.o ipaddrparse.o access.o features.o readwrite.o opts.o ssl.o sslslave.o ptracesandbox.o ftppolicy.o sysutil.o sysdeputil.o  -lssl -lcrypto -lnsl -lresolv -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -lcrypt -lcap
  | /OE/sysroots/x86_64-linux/usr/libexec/i586-webos-linux/gcc/i586-webos-linux/4.7.2/ld: cannot find -lssl
  | /OE/sysroots/x86_64-linux/usr/libexec/i586-webos-linux/gcc/i586-webos-linux/4.7.2/ld: cannot find -lcrypto
  | collect2: error: ld returned 1 exit status

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Joe MacDonald <joe.macdonald@windriver.com>
---
 meta-networking/recipes-daemons/vsftpd/vsftpd_2.3.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd_2.3.5.bb b/meta-networking/recipes-daemons/vsftpd/vsftpd_2.3.5.bb
index c02ee9c..f146910 100644
--- a/meta-networking/recipes-daemons/vsftpd/vsftpd_2.3.5.bb
+++ b/meta-networking/recipes-daemons/vsftpd/vsftpd_2.3.5.bb
@@ -4,7 +4,7 @@ SECTION = "network"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6067ad950b28336613aed9dd47b1271"
 
-DEPENDS = "libcap"
+DEPENDS = "libcap openssl"
 
 SRC_URI = "https://security.appspot.com/downloads/vsftpd-${PV}.tar.gz \
            file://makefile-destdir.patch \
-- 
1.8.3.2


