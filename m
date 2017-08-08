Return-Path: <mickey.happygolucky@gmail.com>
Received: from mail-yw0-f196.google.com (mail-yw0-f196.google.com
	[209.85.161.196])
	by mail.openembedded.org (Postfix) with ESMTP id 5CA9E70018
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Aug 2017 00:59:36 +0000 (UTC)
Received: by mail-yw0-f196.google.com with SMTP id u207so1347836ywc.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Aug 2017 17:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Ne9bpT4SzSlIjxOaUOxpzQIHXnvuSYC8RrWlvsJVkq4=;
	b=HvwOadTgWsahZxi4IC+i2z9CkWkTni+HAIhUj9vdvHUlbY9pnTtdIL5/7qV820gjGK
	nIhvqWIGn2bRjW+Q3Gt/c9orm9u7k0uSdR+sREWJoP7XaCRKg7wz8KPZC72bg/M/LuCA
	XayINfBYNM6096/hAbU7LT5irfWOfj2d4CgLmsnHDjOb4zXDqfoZ3ySrVmlfyC3jBcmd
	yJegJnCKns0XYvpJpAPHHwEHvcoNwMn4leMzBF9lI8ED5SD4pJIYEOTirRJap0FtlND/
	heUDPp8RGh3AI++0g+h4zrUso5xY48+wqjA+/VYCnEv22tA+Y/ckoN4LLGLadwPxrGdg
	5XSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Ne9bpT4SzSlIjxOaUOxpzQIHXnvuSYC8RrWlvsJVkq4=;
	b=fRW3x7OmZIC5eMBpBmDEUD43Y3Fb2R6HQcJFYdyc+B6y8APvfUdoWEwvQlw15YEZTP
	/UkB25uR4nOIaxAsj85/IA7DSqwrpEqoKQENGZOTUhgv4BAeUCe8YrhOoVVh1LTiTJ/m
	Qlr7bZurQuyko02p9EkeQZ5TlYSwAKWpRE6lwUy4ckzLCw5ilZmFqVooRL7/80EsA7hh
	SvKVYl5Pf6KYT4S5sGBLZ1UumPxaVFVospkRC5RSQTCgvvXAH0XJAHJs62aO5xZ1Diam
	yFd/mnSR2VzucpFaTeppSh/ARdnydIlTvF+dOdC8gfUZEFNR1NeJTzFIIWE9gt7YX/Zj
	5teg==
X-Gm-Message-State: AHYfb5i8NEtcuQeT2/QQ3VHrAz/lRTTO/cwxg+6ymme1WUUjYxkNNpXT
	3HBt9N+L2Z9J3snQzSo=
X-Received: by 10.84.217.144 with SMTP id p16mr2726651pli.276.1502153978012;
	Mon, 07 Aug 2017 17:59:38 -0700 (PDT)
Received: from localhost.localdomain
	([2400:2411:21c1:9d00:b8cb:4f3b:9c01:c505])
	by smtp.gmail.com with ESMTPSA id x25sm89484pfk.80.2017.08.07.17.59.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 07 Aug 2017 17:59:37 -0700 (PDT)
From: Yusuke Mitsuki <mickey.happygolucky@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Aug 2017 09:59:13 +0900
Message-Id: <1502153954-2796-6-git-send-email-mickey.happygolucky@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1502153954-2796-1-git-send-email-mickey.happygolucky@gmail.com>
References: <1502153954-2796-1-git-send-email-mickey.happygolucky@gmail.com>
Subject: [PATCH 5/6] uim: Fixed pkg_postinst_*/pkg_prerm_* for uim-anthy and uim-skk.
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
X-List-Received-Date: Tue, 08 Aug 2017 00:59:37 -0000

pkg_postinst*/pkg_prerm_* functions are not worked correctly.
Because uim-module-manager executes on the host machine.
It needs executed via qemu.

Signed-off-by: Yusuke Mitsuki <mickey.happygolucky@gmail.com>
---
 meta-oe/recipes-support/uim/uim_1.8.6.bb | 33 +++++++++++++++++---------------
 1 file changed, 18 insertions(+), 15 deletions(-)

diff --git a/meta-oe/recipes-support/uim/uim_1.8.6.bb b/meta-oe/recipes-support/uim/uim_1.8.6.bb
index e6bacce..3d6425c 100644
--- a/meta-oe/recipes-support/uim/uim_1.8.6.bb
+++ b/meta-oe/recipes-support/uim/uim_1.8.6.bb
@@ -21,7 +21,7 @@ RDEPENDS_uim-anthy = "takao-fonts anthy libanthy0 glibc-utils glibc-gconv-euc-jp
 
 LEAD_SONAME = "libuim.so.1"
 
-inherit autotools pkgconfig gettext
+inherit autotools pkgconfig gettext qemu
 
 EXTRA_OECONF += "--disable-emacs \
     --without-scim \
@@ -103,21 +103,20 @@ FILES_uim-skk = "${libdir}/uim/plugin/libuim-skk.* \
     ${datadir}/uim/skk*.scm \
 "
 
+PACKAGE_WRITE_DEPS += "qemu-native"
 pkg_postinst_uim-anthy() {
-    if [ -f /usr/bin/uim-module-manager ]; then
-        /usr/bin/uim-module-manager --register anthy --path /etc/uim
-    fi
-}
-
-pkg_postrm_uim-anthy() {
-    if [ -f /usr/bin/uim-module-manager ]; then
-        /usr/bin/uim-module-manager --path /etc/uim --unregister anthy
+    if test -n "$D"; then
+        ${@qemu_run_binary(d, '$D', '${bindir}/uim-module-manager')} --register anthy --path $D${datadir}/uim
+    else
+		uim-module-manager --register anthy --path ${datadir}/uim
     fi
 }
 
 pkg_prerm_uim-anthy() {
-    if [ -f /usr/bin/uim-module-manager ]; then
-        /usr/bin/uim-module-manager --register anthy --path /etc/uim
+    if test -n "$D"; then
+        ${@qemu_run_binary(d, '$D', '${bindir}/uim-module-manager')} --path $D${datadir}/uim --unregister anthy
+    else
+		uim-module-manager --path ${datadir}/uim --unregister anthy
     fi
 }
 
@@ -126,14 +125,18 @@ pkg_postinst_uim-gtk2.0() {
 }
 
 pkg_postinst_uim-skk() {
-    if [ -f /usr/bin/uim-module-manager ]; then
-        /usr/bin/uim-module-manager --register skk --path /etc/uim
+    if test -n "$D"; then
+        ${@qemu_run_binary(d, '$D', '${bindir}/uim-module-manager')} --register skk --path $D${datadir}/uim
+    else
+		uim-module-manager --register skk --path ${datadir}/uim
     fi
 }
 
 pkg_postrm_uim-skk() {
-    if [ -f /usr/bin/uim-module-manager ]; then
-        /usr/bin/uim-module-manager --path /etc/uim --unregister skk
+    if test -n "$D"; then
+        ${@qemu_run_binary(d, '$D', '${bindir}/uim-module-manager')} --path $D${datadir}/uim --unregister skk
+    else
+		uim-module-manager --path ${datadir}/uim --unregister skk
     fi
 }
 
-- 
2.7.4


