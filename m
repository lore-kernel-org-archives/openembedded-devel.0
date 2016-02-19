Return-Path: <baptiste.durand@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 38360770AF
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Feb 2016 07:44:33 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id g62so58760656wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Feb 2016 23:44:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=O5Opcs+kIj24W8eXkAquZ2Z4V05kZOWMz1nFOxcuV6g=;
	b=ivGx5C2G1aIeqqgx+y7Se4Bqtb8C7/M6pY3XSV5VqyahbeUfrX00oXQ6yPhVskcKeo
	tH1y3Bmp0axRJ4yK+lrbmObRmgTE/jYEGCq4x2oAGPpFkMaKLYUcFKVmiterN2Bse9YM
	C3nGCOutaTq1vIoui/GzZtXD4E+KKYpr1cRmU/fu+1mIHXoLS6rFiUYshcaidbBbMnDc
	K+E1plXeJoz23vys3XPw6gHifdrg/yXBYQCwJQ623GKNU5S73QMgGn+ykVAE1z+/Ya8F
	JFhrRtu/5QcCkcPxFYZy5eYhuo6tz0HzD3hfC2dkHTRbCojhWuQbRuMIRhDcVDQI+J3P
	rS0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=O5Opcs+kIj24W8eXkAquZ2Z4V05kZOWMz1nFOxcuV6g=;
	b=ODhq/vKVUfLTN+3CjASFH0RJhUMdxhA7LKowiggY3by2dbqTTpfWFiTYT3HL/h+yh4
	+scNa7zRyVUQnwOxZpyAsnrIp5b9A3mLZgsdTg+vgy2fMUFrb0CPOHmJa5e8ja0Th/Tt
	cATTnIwn4zNtPfH8gUWpPqMUuNbRlRQ9fYJ6Dmiz0wyQg5cR+8mPpowgioBwOlL/43+0
	pF2yw7zq41mHAFA/SMTjvV56VA+gnYZmCLDB1VJDkf5guV7Q0E86bcYlitdgve8m9XQ3
	DnBukJ8PWsjZmS+5+R7uGrQaoBkCgPVBJHTiZAHFgFJfjkQpcDm7WRwnXtkFuxzx017s
	rALg==
X-Gm-Message-State: AG10YOSfp2RQNjHQ8QdSQdywiPgnY5Gsy4kcJZdOTTSAy8JhpR8gIOaldnA8MCtfhWGTRA==
X-Received: by 10.194.88.195 with SMTP id bi3mr11321813wjb.34.1455867874008;
	Thu, 18 Feb 2016 23:44:34 -0800 (PST)
Received: from localhost.localdomain (bru35-1-88-174-15-70.fbx.proxad.net.
	[88.174.15.70])
	by smtp.gmail.com with ESMTPSA id w17sm6374766wmw.5.2016.02.18.23.44.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 18 Feb 2016 23:44:33 -0800 (PST)
From: Baptiste DURAND <baptiste.durand@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 19 Feb 2016 08:44:27 +0100
Message-Id: <1455867867-13518-1-git-send-email-baptiste.durand@gmail.com>
X-Mailer: git-send-email 2.5.0
Subject: [meta-oe][PATCH] minidlna: 1.1.4 -> 1.1.5
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
X-List-Received-Date: Fri, 19 Feb 2016 07:44:34 -0000

Upgrade minidlna from 1.1.4 to 1.1.5

Signed-off-by: Baptiste DURAND <baptiste.durand@gmail.com>
---
 meta-oe/recipes-multimedia/minidlna/minidlna_1.1.4.bb | 6 ------
 meta-oe/recipes-multimedia/minidlna/minidlna_1.1.5.bb | 4 ++++
 2 files changed, 4 insertions(+), 6 deletions(-)
 delete mode 100644 meta-oe/recipes-multimedia/minidlna/minidlna_1.1.4.bb
 create mode 100644 meta-oe/recipes-multimedia/minidlna/minidlna_1.1.5.bb

diff --git a/meta-oe/recipes-multimedia/minidlna/minidlna_1.1.4.bb b/meta-oe/recipes-multimedia/minidlna/minidlna_1.1.4.bb
deleted file mode 100644
index 0531e69..0000000
--- a/meta-oe/recipes-multimedia/minidlna/minidlna_1.1.4.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require ${BPN}.inc
-
-SRCREV = "v1_1_4"
-LIC_FILES_CHKSUM = "file://LICENCE.miniupnpd;md5=b0dabf9d8e0f871554e309d62ead8d2b"
-SRC_URI[md5sum] = "d966256baf2f9b068b9de871ab5dade5"
-SRC_URI[sha256sum] = "170560fbe042c2bbcba78c5f15b54f4fac321ff770490b23b55789be463f2851"
diff --git a/meta-oe/recipes-multimedia/minidlna/minidlna_1.1.5.bb b/meta-oe/recipes-multimedia/minidlna/minidlna_1.1.5.bb
new file mode 100644
index 0000000..7c6db62
--- /dev/null
+++ b/meta-oe/recipes-multimedia/minidlna/minidlna_1.1.5.bb
@@ -0,0 +1,4 @@
+require ${BPN}.inc
+
+SRCREV = "v1_1_5"
+LIC_FILES_CHKSUM = "file://LICENCE.miniupnpd;md5=b0dabf9d8e0f871554e309d62ead8d2b"
-- 
2.5.0


