Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 1010E771D9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Dec 2016 02:09:48 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id y68so1872140pfb.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Dec 2016 18:09:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=30fFVrbFH/8Z6T69FzueT08wbxhaSXX4d2OrEDP5EMg=;
	b=SDznWlGN8EXo9nErwlwLAHkUlKaPMUab44cKoW5uu6JrBHf4G3Nru2kRUfZEfa3zLu
	ygEWFs0CTJibXt+dZFhwZ5fi/vuI4m6PKKyfiLkh9eXEei2J9zhPwkD1ypjKsDgPonVg
	uARdy2s34Io8MF9vn2HIIUkjnBjM/+Qqb4unN7JWznnLc4IONYmcL+PRi0n2XxKl5j50
	2U36uoW4Yzd6skPyJsHgoILYwhksiCR7XV3eseax8vhwVS1/xL+QF2UaA11+yZ4b5Ymj
	nfbs3E0/8Wug8nQQTgJQcnO6syXWYc7ulK7rrHPg3Fr7+9TczbKTgRheyZkf+akCXQIZ
	k6sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=30fFVrbFH/8Z6T69FzueT08wbxhaSXX4d2OrEDP5EMg=;
	b=lLTBj1NaiJw0XWztGRbBzAbCZPk4c4OgRDHwydq10ggzIXPIhJxfhqHoN0CQO9HGG+
	kx5BhXvmPo7qgJEV/dMMiKJh5L8kDVfSFXxxjqI2R84JsSX5mM6chgKg0IS4benFe4wH
	PqjhpV44Rpjb9ldbPy8AVETP+hlYdr5HJqu225ylgD3G+O6CVFSU8UxUJ3gx9q2FXicC
	lAfYw33kdzwjvux8JY1R6sO1IotcDillJZQsJsoPFiGWlTMjQZ3N7wC09gt9RMknIJHb
	Xb+m4c4caPsauQVMcu8Ihy1rFZ70WSLC9XDBSEPdMxwi0f53NGpduYVwIjNWPlwagbdv
	UjxA==
X-Gm-Message-State: AKaTC03nMBIO4bnLS6/+C3d9wHSC4L9kw6xbdniHW6xivxauJ2cshRUO8eIOvoaQbVMQlw==
X-Received: by 10.99.5.21 with SMTP id 21mr190069193pgf.32.1481767789544;
	Wed, 14 Dec 2016 18:09:49 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	c142sm90098329pfb.23.2016.12.14.18.09.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 14 Dec 2016 18:09:49 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 14 Dec 2016 18:09:35 -0800
Message-Id: <20161215020940.10105-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
Subject: [meta-networking][PATCH 1/6] inetutils: Disable rsh, rcp, rlogin on musl
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
X-List-Received-Date: Thu, 15 Dec 2016 02:09:49 -0000

They all need rcmd() API from rpc implementation
and while glibc provides it bundled, musl does not
so we disable these apps

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-connectivity/inetutils/inetutils_1.9.4.bb | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb
index a35e0b4..a8c4025 100644
--- a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb
+++ b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb
@@ -5,6 +5,7 @@ talkd, telnet, telnetd, tftp, tftpd, and uucpd."
 HOMEPAGE = "http://www.gnu.org/software/inetutils"
 SECTION = "net"
 DEPENDS = "ncurses netbase readline"
+
 LICENSE = "GPLv3"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=0c7051aef9219dc7237f206c5c4179a7"
@@ -48,6 +49,8 @@ EXTRA_OECONF = "--with-ncurses-include-dir=${STAGING_INCDIR} \
         --enable-rpath=no \
 "
 
+EXTRA_OECONF_append_libc-musl = " --disable-rsh --disable-rcp --disable-rlogin "
+
 do_configure_prepend () {
     export HELP2MAN='true'
     cp ${STAGING_DATADIR_NATIVE}/gettext/config.rpath ${S}/build-aux/config.rpath
@@ -66,9 +69,15 @@ do_install_append () {
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
@@ -78,7 +87,9 @@ do_install_append () {
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


