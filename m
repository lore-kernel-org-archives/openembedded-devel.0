Received: from mail-pz0-f51.google.com ([209.85.210.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T3fsz-0007BR-8N
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Aug 2012 06:16:14 +0200
Received: by dajt11 with SMTP id t11so2243525daj.10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Aug 2012 21:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=vJAskfli1Hy+50PZMqpL47g0pKieNSYKfWMfhG0GNv8=;
	b=VB9B65U5YYX8y+X2+IJvblp7x3RlRD2FdFexlU9NevWxx+RFuHDeDqCQ/O4WFBSsmr
	EpLcyO5b62O8gR/JsYPziOeaPMOGsXJp3gfc8Z0DkclGXOvEi8M43Kf90Pop5VaH+Fck
	4ko6t+qe0oen/IIMUWBHRiAYdupHRAWi3wpc3vrM4xIZIdQWnI1qs1tZB4bLWnI/dB49
	NVD/6X4flzbiugeObwvzWOX+3/E4LNmUSPHQyxXOiBb/o4/vB1PO3Lrj6ygKD03DoZ0f
	tRibQ8cvdcbFim+MUBdp2w1K8J9aMcHIaJ7Vxflk3Hsk9LBX+7sbJfRsYGkWoXny9weW
	SP4A==
Received: by 10.66.76.227 with SMTP id n3mr34616917paw.53.1345521849223;
	Mon, 20 Aug 2012 21:04:09 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id uj3sm526674pbc.39.2012.08.20.21.04.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 20 Aug 2012 21:04:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Aug 2012 21:03:30 -0700
Message-Id: <1345521816-2364-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-java/openjdk-7.0][PATCH 1/7] openjdk-6: Remove
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 21 Aug 2012 04:16:14 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes-core/openjdk/openjdk-6_6b24-1.11.1.bb |    8 --------
 recipes-core/openjdk/openjdk-6_6b24_hg.bb     |   12 ------------
 2 files changed, 20 deletions(-)
 delete mode 100644 recipes-core/openjdk/openjdk-6_6b24-1.11.1.bb
 delete mode 100644 recipes-core/openjdk/openjdk-6_6b24_hg.bb

diff --git a/recipes-core/openjdk/openjdk-6_6b24-1.11.1.bb b/recipes-core/openjdk/openjdk-6_6b24-1.11.1.bb
deleted file mode 100644
index 00027e6..0000000
--- a/recipes-core/openjdk/openjdk-6_6b24-1.11.1.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require openjdk-6-release-6b24.inc
-
-PR = "${INC_PR}.0"
-
-ICEDTEA = "icedtea6-1.11.1"
-
-SRC_URI[iced.md5sum] = "e51d9d2f0328cc5aa7a00943abd96ed6"
-SRC_URI[iced.sha256sum] = "bafb0e21e1edf5ee22871b13dbc0a8a0d3efd894551fb91d5f59783069b6912c"
diff --git a/recipes-core/openjdk/openjdk-6_6b24_hg.bb b/recipes-core/openjdk/openjdk-6_6b24_hg.bb
deleted file mode 100644
index fcc9c05..0000000
--- a/recipes-core/openjdk/openjdk-6_6b24_hg.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require openjdk-6-release-6b24.inc
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
-
-PR = "${INC_PR}.0"
-
-ICEDTEA = "icedtea6"
-
-SRCREV = "54ceda20a02c"
-PV = "6b24-1.11.1+1.11.2-devel+hg${SRCPV}"
-
-ICEDTEA_URI = "hg://icedtea.classpath.org/hg/;module=icedtea6;rev=${SRCREV}"
-- 
1.7.9.5



