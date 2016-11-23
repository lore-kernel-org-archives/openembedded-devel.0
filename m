Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 2554871AC5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 09:22:33 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id 3so673436pgd.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 01:22:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=LrPlQqHlUVftNMa8G+AxQQnGKh9osN9FwzXTSEJJQRg=;
	b=ts7NWTJe7+Db17miPmGb88bBeAfAg/rBA5PL76zru0WsIouBZmHYP08fCAPHjt067y
	heImOIsC1xX/7O8YpwaU7yO/aNg9pyDzM9b1I7BHibEojNt0Drb/FB+EZLWdBvqTobN3
	93/9LDVN6vOD/kSMnw9ZmBJtGh7Z9Qg1SnTInZ+H0EK/nnCn5A7IBvcVMmAT2ioigtd1
	1EuIXbC+cALPn0bQ0pUKvEafavXxmabS8nFKWt7RyKW2E73dN1Ga4m7rh4qCakHHFCn9
	y/GG0enAYGjCV5MZ2lW06hcx23A+LIHGbsq0SEzKhsxatARM9pPLgcJeOSeMl+Hjk4WO
	mGFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=LrPlQqHlUVftNMa8G+AxQQnGKh9osN9FwzXTSEJJQRg=;
	b=Jnudk1oGFHPGOruVwsDsp3llustV0iVdhpabRZh72jZwjwh93wvQGdwOffdtitqNXK
	iOAox454DEPlZ9GFB3P5bf4AnU4fCUFN/CZEkV1tO5raSw4D5y6EGNJY5H8nwz5T0zq8
	cSN3w1kexfQU5v8sFBxP1m1uZ+Z3pWnyqsCNDd2NSBCHJGQEIcchtxXb37LznYJ/bu27
	BpZe+PUFkOWlDaiuBqc32TKw1IRkwPSk8xMQAEpYEFse3WRgBK5kKjvun+ymy/pNuz8k
	xMlbXagrd/iwEuxSzxafAH000+GyhdxIm/7m6a/JWyssmDmUKRe8u5XcE1pRi20+UCOY
	jmPg==
X-Gm-Message-State: AKaTC005nBL9MYY4CTUmd8EbAFq4H7KJ7ibLS7cxj+rG4DcQCtzthStqk70CT7blBpdisw==
X-Received: by 10.98.155.146 with SMTP id e18mr1935838pfk.45.1479892955163;
	Wed, 23 Nov 2016 01:22:35 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	u23sm51056087pfg.86.2016.11.23.01.22.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Nov 2016 01:22:34 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Nov 2016 01:21:44 -0800
Message-Id: <20161123092209.23699-24-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161123092209.23699-1-raj.khem@gmail.com>
References: <20161123092209.23699-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 24/49] inetutils: Disable rsh, rcp, rlogin on musl
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 23 Nov 2016 09:22:34 -0000

They all need rcmd() API from rpc implementation
and while glibc provides it bundled, musl does not
so we disable these apps

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-connectivity/inetutils/inetutils_1.9.4.bb | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb
index 8db6b74..6d841fa 100644
--- a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb
+++ b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb
@@ -5,6 +5,7 @@ talkd, telnet, telnetd, tftp, tftpd, and uucpd."
 HOMEPAGE = "http://www.gnu.org/software/inetutils"
 SECTION = "net"
 DEPENDS = "ncurses netbase readline"
+
 LICENSE = "GPLv3"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=0c7051aef9219dc7237f206c5c4179a7"
@@ -46,6 +47,8 @@ EXTRA_OECONF = "--with-ncurses-include-dir=${STAGING_INCDIR} \
         --enable-rpath=no \
 "
 
+EXTRA_OECONF_append_libc-musl = " --disable-rsh --disable-rcp --disable-rlogin "
+
 do_configure_prepend () {
     export HELP2MAN='true'
     cp ${STAGING_DATADIR_NATIVE}/gettext/config.rpath ${S}/build-aux/config.rpath
@@ -64,9 +67,15 @@ do_install_append () {
     mv ${D}${libexecdir}/tftpd ${D}${sbindir}/in.tftpd
     mv ${D}${libexecdir}/telnetd ${D}${sbindir}/in.telnetd
     mv ${D}${libexecdir}/rexecd ${D}${sbindir}/in.rexecd
-    mv ${D}${libexecdir}/rlogind ${D}${sbindir}/in.rlogind
-    mv ${D}${libexecdir}/rshd ${D}${sbindir}/in.rshd
-    mv ${D}${libexecdir}/talkd ${D}${sbindir}/in.talkd
+    if [ -e ${D}${libexecdir}/rlogind ]; then
+        mv ${D}${libexecdir}/rlogind ${D}${sbindir}/in.rlogind
+    fi
+    if [ -e ${D}${libexecdir}/rshd ]; then
+        mv ${D}${libexecdir}/rshd ${D}${sbindir}/in.rshd
+    fi
+    if [ -e ${D}${libexecdir}/talkd ]; then
+        mv ${D}${libexecdir}/talkd ${D}${sbindir}/in.talkd
+    fi
     mv ${D}${libexecdir}/uucpd ${D}${sbindir}/in.uucpd
     mv ${D}${libexecdir}/* ${D}${bindir}/
     cp ${WORKDIR}/rexec.xinetd.inetutils  ${D}/${sysconfdir}/xinetd.d/rexec
@@ -76,7 +85,9 @@ do_install_append () {
     cp ${WORKDIR}/tftpd.xinetd.inetutils  ${D}/${sysconfdir}/xinetd.d/tftpd
 
     sed -e 's,@SBINDIR@,${sbindir},g' -i ${D}/${sysconfdir}/xinetd.d/*
-
+    if [ -e ${D}${libdir}/charset.alias ]; then
+        rm -rf ${D}${libdir}/charset.alias
+    fi
     rm -rf ${D}${libexecdir}/
     # remove usr/lib if empty
     rmdir ${D}${libdir} || true
-- 
2.10.2


