Return-Path: <mario.goulart@gmail.com>
Received: from mail-qg0-f50.google.com (mail-qg0-f50.google.com
	[209.85.192.50])
	by mail.openembedded.org (Postfix) with ESMTP id 1D5B67391D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Mar 2015 13:23:02 +0000 (UTC)
Received: by qgfa8 with SMTP id a8so13866109qgf.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Mar 2015 06:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:organization;
	bh=BLX4aplbCDTLdN4I8EzXKLR8vbxMspJ90sJvRJLfqBs=;
	b=wnftQQwiHkjI/l5v9x2QG526Inunu9BkBHf6rL6sGg1dIjILyONxAGKPhh9HNzoX2S
	xfTAAf+n0ssZSU6tHyTM8Lv4cqU/Ju9yH6q9l+o/Gjs8YT7VEKhZUr/9WlN3WJtp8/s8
	GCAHh2GgtEII0La0D0VoByddiVrIWIeN+kYguRWYIXPNBptDs3Tj01uBfxHlQdm/A8M7
	+Buksw7hLafYZ1OJmXNlu/yVGgs9+slVDr+v3FMWusYHkaOlBid+uDvT1lNN7OgEA6jz
	UyhlLUi4aMUEKANTvCwCh9sden+uah3XHl3He+m3C5x+FEoYDXwjMSrom2MT/22u5QXD
	IeVQ==
X-Received: by 10.140.239.85 with SMTP id k82mr25795219qhc.22.1427808183628;
	Tue, 31 Mar 2015 06:23:03 -0700 (PDT)
Received: from centrium.lab.ossystems.com.br ([177.100.224.72])
	by mx.google.com with ESMTPSA id q129sm9859631qha.4.2015.03.31.06.23.02
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 31 Mar 2015 06:23:03 -0700 (PDT)
Sender: Mario Domenech Goulart <mario.goulart@gmail.com>
From: Mario Domenech Goulart <mario@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 31 Mar 2015 10:22:34 -0300
Message-Id: <1427808158-16502-1-git-send-email-mario@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
Organization: O.S. Systems Software LTDA.
Cc: Mario Domenech Goulart <mario@ossystems.com.br>
Subject: [meta-java][PATCH 1/5] rxtx: put .jar and .so files into the same package (librxtx-java)
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
X-List-Received-Date: Tue, 31 Mar 2015 13:23:03 -0000

That's how Debian does, supposedly because it does not make sense to
ship .jar and .so files into separate packages.

Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>
---
 recipes-extended/rxtx/rxtx_2.2.0.bb | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/recipes-extended/rxtx/rxtx_2.2.0.bb b/recipes-extended/rxtx/rxtx_2.2.0.bb
index 56c939f..b9b3027 100644
--- a/recipes-extended/rxtx/rxtx_2.2.0.bb
+++ b/recipes-extended/rxtx/rxtx_2.2.0.bb
@@ -26,7 +26,7 @@ SRC_URI[sha256sum] = "3c30373e760f444def3650c76c5a00ae12fb1d860ec008750d084f4880
 
 S = "${WORKDIR}/rxtx-2.2pre2"
 
-INSANE_SKIP_${PN} += "dev-so"
+INSANE_SKIP_${JPN} += "dev-so"
 
 inherit autotools-brokensep java-library
 PACKAGE_ARCH = "${TUNE_PKGARCH}"
@@ -51,5 +51,11 @@ do_install_prepend() {
     install -d ${D}${datadir_java}/ext
 }
 
-FILES_${PN} += "${libdir_jni}"
+PACKAGES_remove = "${PN}"
+
+FILES_${JPN} += "${libdir_jni}"
+RPROVIDES_${JPN} = "${PN}"
+RCONFLICTS_${JPN} = "${PN}"
+RREPLACES_${JPN} = "${PN}"
+
 FILES_${PN}-dbg += "${libdir_jni}/.debug"
-- 
2.1.4


