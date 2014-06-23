Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f178.google.com (mail-we0-f178.google.com
	[74.125.82.178])
	by mail.openembedded.org (Postfix) with ESMTP id 02D4260030
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jun 2014 14:04:05 +0000 (UTC)
Received: by mail-we0-f178.google.com with SMTP id x48so7181801wes.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jun 2014 07:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=/8HveYseXtlUwfMq/tnDYgItvrGVOguqFMqDJEaYupA=;
	b=RbTt+BBQQo8RG/x56PX4Q+Q9/eiLjII9zP9xqhcW7KiNbcuzVPt5/otQ022J2JdVbQ
	MmTXMcfOFYCr5HPk6aoXtjrJr6T/hqE3JR1TtM4WiaPONsUl4bRTFnwKoBkBV8EGQSjM
	KXShQc4FdK55usy4ypEaQKYAaArjf+WZYiT8GW3VNvxoQOybtLjrGJW4blPXHRiJBU2u
	OJ08ZWkr5jaY2ZWaJzvgqv6tof+eIlb3D+3h8I6FGOeSpu+ve3TRDu+fwZ6biAyImxB5
	CEwtquH9T616hRkUwu+dRsSyHoZCBWPdSQF690YkfxVT+ynvYYzjnhcbBETnRW2Z2ZWn
	/LIA==
X-Received: by 10.180.13.139 with SMTP id h11mr26226391wic.34.1403532242355;
	Mon, 23 Jun 2014 07:04:02 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ch5sm27644718wjb.18.2014.06.23.07.04.01 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 23 Jun 2014 07:04:01 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 23 Jun 2014 16:03:58 +0200
Message-Id: <1403532238-6766-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
Subject: [meta-oe][PATCH] claws-mail: Fix build with B!=S
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
X-List-Received-Date: Mon, 23 Jun 2014 14:04:09 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/imlib2_git.bb              | 3 +++
 meta-oe/recipes-sato/claws-mail/claws-mail_3.9.0.bb | 4 ++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-efl/recipes-efl/efl/imlib2_git.bb b/meta-efl/recipes-efl/efl/imlib2_git.bb
index dc91763..8c6ac66 100644
--- a/meta-efl/recipes-efl/efl/imlib2_git.bb
+++ b/meta-efl/recipes-efl/efl/imlib2_git.bb
@@ -11,6 +11,9 @@ inherit efl binconfig
 SRC_URI = "git://git.enlightenment.org/legacy/${BPN}.git"
 S = "${WORKDIR}/git"
 
+# autotools-brokensep
+B = "${S}"
+
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[gif] = "--with-gif,--without-gif,giflib"
 PACKAGECONFIG[tiff] = "--with-tiff,--without-tiff,tiff"
diff --git a/meta-oe/recipes-sato/claws-mail/claws-mail_3.9.0.bb b/meta-oe/recipes-sato/claws-mail/claws-mail_3.9.0.bb
index 831a140..7072046 100644
--- a/meta-oe/recipes-sato/claws-mail/claws-mail_3.9.0.bb
+++ b/meta-oe/recipes-sato/claws-mail/claws-mail_3.9.0.bb
@@ -14,7 +14,7 @@ SRC_URI[archive.md5sum] = "4c5ac7b21f0ed17d0f6404124c2229a4"
 SRC_URI[archive.sha256sum] = "ed70975a5056b3ffc4fe6e977f0d9606febc1499763c090241b029a73ff24e65"
 
 do_configure_append() {
-    cd po ; for PO in *.po ; do MO=`echo $PO | sed s/\\.po//`.gmo ; if ! test -f $MO ; then msgfmt $PO -o $MO ; fi ; done
+    cd ${S}/po ; for PO in *.po ; do MO=`echo $PO | sed s/\\.po//`.gmo ; if ! test -f $MO ; then msgfmt $PO -o $MO ; fi ; done; cd ${B}
 }
 
 PACKAGECONFIG ??= "startup-notification dbus"
@@ -52,7 +52,7 @@ do_install_prepend() {
 do_install_append() {
     rm -r ${D}${datadir}/icons
     install -d ${D}${datadir}/pixmaps
-    install -m 0644 claws-mail.png ${D}${datadir}/pixmaps/
+    install -m 0644 ${S}/claws-mail.png ${D}${datadir}/pixmaps/
     sed -i 's/Icon=[^.]*$/&.png/' ${D}${datadir}/applications/claws-mail.desktop
 }
 
-- 
2.0.0


