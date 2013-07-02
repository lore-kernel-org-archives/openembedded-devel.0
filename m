Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f51.google.com (mail-ee0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id 0DB406A468
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Jul 2013 18:31:57 +0000 (UTC)
Received: by mail-ee0-f51.google.com with SMTP id e52so2901087eek.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Jul 2013 11:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=XKY93xojhnFrklyd/2IRmNAsHGZpl0VyDH7SUJSqiFw=;
	b=lbXUpopl61Q0GkKQV7QoEBVxE/YPNfy6D68FpYcInY1O9i5FOoM4OY5oIPhN6m2OMt
	A3h3qv0EWEljH6b/BgrBuosq5euOkaB8ktxLM518LuLIh54p9f7UtQ8FzfBRjKOxv3fZ
	1jnQSjGP+GGCsFdnZnebRW3fQREf/HcGV2SeO4m80rHXuprBzwk3i/pubPrYeLG3k3cW
	hsjrACjRSODlBGXTVXB9HzvLQbxN0iL/fou342XnEO5j+QiYko0xVNNCIxZXbvUw8J1M
	ioJs4uQ9aACE2wPli8oUoZd86QzxOibuEZDWkUB0iopWe3r0of/CSeOTUfb72X4NBqgL
	3+4A==
X-Received: by 10.15.33.13 with SMTP id b13mr27582297eev.0.1372789918716;
	Tue, 02 Jul 2013 11:31:58 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	c44sm38148152eeb.8.2013.07.02.11.31.57 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 02 Jul 2013 11:31:58 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  2 Jul 2013 20:31:56 +0200
Message-Id: <1372789916-2672-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
Subject: [meta-networking][PATCH] vsftpd: add missing dependency on openssl
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
X-List-Received-Date: Tue, 02 Jul 2013 18:31:58 -0000

* Fails without openssl in sysroot:
  | i586-webos-linux-gcc  -m32 -march=i586 --sysroot=/OE/sysroots/qemux86 -o vsftpd main.o utility.o prelogin.o ftpcmdio.o postlogin.o privsock.o tunables.o ftpdataio.o secbuf.o ls.o postprivparent.o logging.o str.o netstr.o sysstr.o strlist.o banner.o filestr.o parseconf.o secutil.o ascii.o oneprocess.o twoprocess.o privops.o standalone.o hash.o tcpwrap.o ipaddrparse.o access.o features.o readwrite.o opts.o ssl.o sslslave.o ptracesandbox.o ftppolicy.o sysutil.o sysdeputil.o  -lssl -lcrypto -lnsl -lresolv -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -lcrypt -lcap
  | /OE/sysroots/x86_64-linux/usr/libexec/i586-webos-linux/gcc/i586-webos-linux/4.7.2/ld: cannot find -lssl
  | /OE/sysroots/x86_64-linux/usr/libexec/i586-webos-linux/gcc/i586-webos-linux/4.7.2/ld: cannot find -lcrypto
  | collect2: error: ld returned 1 exit status

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
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
1.8.2.1


