Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f45.google.com (mail-ee0-f45.google.com [74.125.83.45])
	by mail.openembedded.org (Postfix) with ESMTP id 3167D6E8E2
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Mar 2014 20:24:00 +0000 (UTC)
Received: by mail-ee0-f45.google.com with SMTP id d17so4326264eek.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Mar 2014 12:24:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=yCroSFGp3Rh39l7klYf8fdn2G8hIKUk/dkq4XALxhEY=;
	b=uiSANmwnxvgTpiHvjyDLLsENLcJQYP4Kivmt19bcoOB2v423Vg8raLUlJjlbkJ0Gj/
	Mflko10zqQaxCqLa2cGXJytAMyPytcZmsRxi2plSzZWbwKjJIoHbste6hEqRC+1T7jkR
	GnbZ+aa6fCvx3BaPC2L0lIKKbc1YRJZBrAGEujkb6tP81TyPf+NZHr9IOyG8znDWydXG
	wtOSb6eOXqSh41k/wy/vcTl4Nbdve+/TI6ETtm21Fcfvn66NkQvD3JGtEOO6UcDreDi3
	3C8FDxLcmnQ7MiGT1QOIrlP/Lk+Cs61E8PQ7PgdClROMX1cCpxJKsE6UbwvwBz+cbfoc
	ew4Q==
X-Received: by 10.14.215.133 with SMTP id e5mr5622144eep.103.1393878241029;
	Mon, 03 Mar 2014 12:24:01 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	46sm54075499ees.4.2014.03.03.12.23.59 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 03 Mar 2014 12:24:00 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  3 Mar 2014 21:23:58 +0100
Message-Id: <1393878238-28046-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <1393878238-28046-1-git-send-email-Martin.Jansa@gmail.com>
References: <1393875775-29375-1-git-send-email-Martin.Jansa@gmail.com>
	<1393878238-28046-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-systemd][PATCHv2 2/2] wpa-supplicant: Rename .bbappend to match new version from oe-core
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
X-List-Received-Date: Mon, 03 Mar 2014 20:24:03 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-connectivity/wpa-supplicant/wpa-supplicant_%.bbappend    | 3 +++
 .../recipes-connectivity/wpa-supplicant/wpa-supplicant_2.0.bbappend  | 5 -----
 2 files changed, 3 insertions(+), 5 deletions(-)
 create mode 100644 meta-systemd/oe-core/recipes-connectivity/wpa-supplicant/wpa-supplicant_%.bbappend
 delete mode 100644 meta-systemd/oe-core/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.0.bbappend

diff --git a/meta-systemd/oe-core/recipes-connectivity/wpa-supplicant/wpa-supplicant_%.bbappend b/meta-systemd/oe-core/recipes-connectivity/wpa-supplicant/wpa-supplicant_%.bbappend
new file mode 100644
index 0000000..f006b3f
--- /dev/null
+++ b/meta-systemd/oe-core/recipes-connectivity/wpa-supplicant/wpa-supplicant_%.bbappend
@@ -0,0 +1,3 @@
+RPROVIDES_${PN} += "${PN}-systemd"
+RREPLACES_${PN} += "${PN}-systemd"
+RCONFLICTS_${PN} += "${PN}-systemd"
diff --git a/meta-systemd/oe-core/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.0.bbappend b/meta-systemd/oe-core/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.0.bbappend
deleted file mode 100644
index cffb898..0000000
--- a/meta-systemd/oe-core/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.0.bbappend
+++ /dev/null
@@ -1,5 +0,0 @@
-PRINC := "${@int(PRINC) + 4}"
-
-RPROVIDES_${PN} += "${PN}-systemd"
-RREPLACES_${PN} += "${PN}-systemd"
-RCONFLICTS_${PN} += "${PN}-systemd"
-- 
1.9.0


