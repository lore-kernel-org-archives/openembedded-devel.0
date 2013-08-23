Return-Path: <lpapp@archlinux.us>
Received: from mail-we0-f181.google.com (mail-we0-f181.google.com
	[74.125.82.181])
	by mail.openembedded.org (Postfix) with ESMTP id 6EFD16B5C3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Aug 2013 09:16:00 +0000 (UTC)
Received: by mail-we0-f181.google.com with SMTP id q57so292031wes.26
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Aug 2013 02:16:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=iR91qmQT+0uB00Ki2zMqc7H4HMPgUoAGahnyTk6KZLA=;
	b=GMLEhUlxrV2Yz4TY9/big3BiZZSURtLqNTVdEYlO3kr2GtQsHRsDnLvcivqrubK+Cq
	77mEptzp/0O1chCgMygxkgMyksQ7UxluseRFPXNJP8zHizWVW0MlCXh2YBXbUKQU5g0q
	CqGsMu8zAGv4PKJr1txi3++75c3ekllCfOUW+XGKkhtnmN5A/j82vZKeVEXpOyafSAIL
	5bpWDGwGuSJB3NqVeHKU33pgoT3eMYzeLfe1HhNbFEm/VaOE2zdjs9wveCsBcKrZ9s7M
	FEw7hWQLLo5S+VHc/V+lRIlhihsMKe3eLZDudWInGI+Ed/xWaE4hC19XCpN11Hyzu/VV
	zpjw==
X-Gm-Message-State: ALoCoQmDd+v6J5YnkqzjCY37wCuN8D6Ste5qSx2K6lGeGJGe4RMdH5Ye6P2GJ8EoUqV/8Z1qM7wR
X-Received: by 10.194.205.164 with SMTP id lh4mr639089wjc.46.1377249360481;
	Fri, 23 Aug 2013 02:16:00 -0700 (PDT)
Received: from archlinux.us (cpc11-cmbg15-2-0-cust30.5-4.cable.virginmedia.com.
	[86.30.245.31])
	by mx.google.com with ESMTPSA id fv10sm110387wic.0.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 23 Aug 2013 02:15:59 -0700 (PDT)
Sender: Laszlo Papp <lpapp@archlinux.us>
Received: by archlinux.us (sSMTP sendmail emulation);
	Fri, 23 Aug 2013 10:16:08 +0100
From: Laszlo Papp <lpapp@kde.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 23 Aug 2013 10:16:05 +0100
Message-Id: <1377249365-3707-1-git-send-email-lpapp@kde.org>
X-Mailer: git-send-email 1.8.3.4
Subject: [meta-qt5][PATCH] QtSerialPort: Add 5.1.0 version
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
X-List-Received-Date: Fri, 23 Aug 2013 09:16:01 -0000

Signed-off-by: Laszlo Papp <lpapp@kde.org>
---
 recipes-qt/qt5/qtserialport.inc      |  3 +++
 recipes-qt/qt5/qtserialport_5.1.0.bb | 10 ++++++++++
 2 files changed, 13 insertions(+)
 create mode 100644 recipes-qt/qt5/qtserialport.inc
 create mode 100644 recipes-qt/qt5/qtserialport_5.1.0.bb

diff --git a/recipes-qt/qt5/qtserialport.inc b/recipes-qt/qt5/qtserialport.inc
new file mode 100644
index 0000000..bbb05a6
--- /dev/null
+++ b/recipes-qt/qt5/qtserialport.inc
@@ -0,0 +1,3 @@
+require qt5.inc
+
+DEPENDS += "qtbase"
diff --git a/recipes-qt/qt5/qtserialport_5.1.0.bb b/recipes-qt/qt5/qtserialport_5.1.0.bb
new file mode 100644
index 0000000..11b5346
--- /dev/null
+++ b/recipes-qt/qt5/qtserialport_5.1.0.bb
@@ -0,0 +1,10 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4fbd65380cdd255951079008b364516c \
+                    file://LICENSE.FDL;md5=3801d7932fdc07fd9efe89f9854a6caa \
+                    file://LGPL_EXCEPTION.txt;md5=eb6c371255e1262c55ae9b652a90b528\
+"
+
+SRC_URI[md5sum] = "1f70621ae40cbda948106b070c6c37d2"
+SRC_URI[sha256sum] = "0f36803c480b2b7111b343e9dd871ffab1b4fd53147bd564125ef2994b09cfb9"
-- 
1.8.3.4


