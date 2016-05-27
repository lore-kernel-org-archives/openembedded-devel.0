Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f68.google.com (mail-pa0-f68.google.com
	[209.85.220.68])
	by mail.openembedded.org (Postfix) with ESMTP id 9203373218
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 May 2016 14:34:32 +0000 (UTC)
Received: by mail-pa0-f68.google.com with SMTP id yl2so12740785pac.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 May 2016 07:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=T4rmAzjncpMYvf3W1QpA2L3SWiLloeds+TO4L+wOemU=;
	b=kIPnMD+t1RkZxQFBsXxciRpp1aRoaGzMf6grPBwJDE/rTs8wTZYe260hABLuQflHNw
	3svT2oWBa18wLObfFzrLshmGXkGCty8dIsqLjsJNxscBZKTHZijhrz7AhwocdAOjbOtH
	C4esL5FnvuA1iZtB6MNjy6cc+0Eg5oFRBBfgizxqW9pWujHzKw2FpFsxsCW/AdiJAEmW
	6sXRCPze9S6t0qg6f9K3FH5uHWT6slRGVq2Pb9J0Iy0bnXeDOB6q+3i8RBk018M4RjpK
	RpRFvNrutslirTUN3ZrLKYphbcTI4t2yHcaDbpA4gfNp5rvUl80OpfWkyT/alQJN2fpN
	omeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=T4rmAzjncpMYvf3W1QpA2L3SWiLloeds+TO4L+wOemU=;
	b=AFxKrlwLC7LBcQQxQp11aKngISL62zfg33CGqTGK9oS49QN1P7MXaHRAr/mWe/bhTk
	GFjlbZ5Zfw3aVd5Wy8zi3ipkr+FOgqms35R+CUq50ILk6UoZG+VUHHR+Fb/Qu3tq8hL6
	wBKUh9NNqHe6s7q9Bb4bCumjmKYgSebzuthhCSGBnbZlZwdnSkNWbZShX6vkxrZeoTAd
	wR9ll8ewgPYdKAUOKEU8+Je/DArQsnMyrDuSArWynYK6KZ3phwPfxFuNGky0N1lNMqsM
	irXCSxehuaqbcKp3SN7xrLb7kNZ/q0oP67daBMNPrbjoCwT+uIgIUTkt/cHQbXk54AXh
	VDUg==
X-Gm-Message-State: ALyK8tKextwGjbPSMKWRNHDvCQdoB10LpnL8+BARcOulMPEBnrv1QDegtbA7EV4Qdjaj0g==
X-Received: by 10.66.88.73 with SMTP id be9mr22901245pab.113.1464359672852;
	Fri, 27 May 2016 07:34:32 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	63sm14302179pff.43.2016.05.27.07.34.31
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 27 May 2016 07:34:31 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 May 2016 07:34:29 -0700
Message-Id: <1464359669-14962-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [meta-multimedia][master][krogoth][PATCH] dvd-apps: Fix several QA WARNINGS
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
X-List-Received-Date: Fri, 27 May 2016 14:34:32 -0000

Example:
WARNING: dvb-apps-1.1.1-r0 do_package_qa: QA Issue: /usr/bin/dvbdate contained in package dvbdate requires libucsi.so, but no providers found in RDEPENDS_dvbdate? [file-rdeps]
WARNING: dvb-apps-1.1.1-r0 do_package_qa: QA Issue: /usr/bin/dvbtraffic contained in package dvbtraffic requires libdvbapi.so, but no providers found in RDEPENDS_dvbtraffic? [file-rdeps]
WARNING: dvb-apps-1.1.1-r0 do_package_qa: QA Issue: /usr/bin/dvbscan contained in package dvb-scan requires libdvbapi.so, but no providers found in RDEPENDS_dvb-scan? [file-rdeps]
WARNING: dvb-apps-1.1.1-r0 do_package_qa: QA Issue: /usr/bin/gotox contained in package dvb-apps requires libdvbapi.so, but no providers found in RDEPENDS_dvb-apps? [file-rdeps]
WARNING: dvb-apps-1.1.1-r0 do_package_qa: QA Issue: /usr/bin/femon contained in package dvb-femon requires libdvbapi.so, but no providers found in RDEPENDS_dvb-femon? [file-rdeps]
WARNING: dvb-apps-1.1.1-r0 do_package_qa: QA Issue: /usr/bin/dvbnet contained in package dvbnet requires libdvbapi.so, but no providers found in RDEPENDS_dvbnet? [file-rdeps]

and
WARNING: dvb-apps-1.1.1-r0 do_package_qa: QA Issue: /usr/bin/dvbscan contained in package dvb-scan requires libdvbcfg.so, but no providers found in RDEPENDS_dvb-scan? [file-rdeps]
WARNING: dvb-apps-1.1.1-r0 do_package_qa: QA Issue: /usr/bin/gotox contained in package dvb-apps requires libdvbapi.so, but no providers found in RDEPENDS_dvb-apps? [file-rdeps]

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-multimedia/recipes-dvb/dvb-apps/dvb-apps_1.1.1.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta-multimedia/recipes-dvb/dvb-apps/dvb-apps_1.1.1.bb b/meta-multimedia/recipes-dvb/dvb-apps/dvb-apps_1.1.1.bb
index 1c0d686..d6465d7 100644
--- a/meta-multimedia/recipes-dvb/dvb-apps/dvb-apps_1.1.1.bb
+++ b/meta-multimedia/recipes-dvb/dvb-apps/dvb-apps_1.1.1.bb
@@ -63,6 +63,9 @@ PACKAGES =+ "dvb-evtest dvb-evtest-dbg \
              dvb-femon dvb-femon-dbg \
              dvb-zap-data"
 
+# Expose the packages from the above spitting
+PACKAGES =+ "libdvbapi libdvbcfg libdvben50221 \
+             libesg libucsi libdvbsec"
 
 FILES_${PN} = "${bindir} ${datadir}/dvb"
 FILES_${PN}-doc = ""
@@ -104,3 +107,10 @@ FILES_dvb-femon = "${bindir}/femon"
 FILES_dvb-femon-dbg = "${bindir}/.debug/femon"
 
 FILES_dvb-zap-data = "${docdir}/dvb-apps/szap"
+
+RDEPENDS_dvbdate =+ "libdvbapi libucsi"
+RDEPENDS_dvbtraffic =+ "libdvbapi"
+RDEPENDS_dvb-scan =+ "libdvbapi libdvbcfg libdvbsec"
+RDEPENDS_dvb-apps =+ "libdvbapi libdvbcfg libdvbsec libdvben50221 libucsi"
+RDEPENDS_dvb-femon =+ "libdvbapi"
+RDEPENDS_dvbnet =+ "libdvbapi"
-- 
2.3.5


