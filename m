Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A0FCCED255
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 09:28:29 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8625.1763458099288306634
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Nov 2025 01:28:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=mJbd4LNX;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3417ae58e6=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI6A2ee1543533
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 09:28:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=tWRGh3jSF6s4K5KbpWxoXgYT0xhwPucKMibuDc74zxw=; b=mJbd4LNX+w4o
	a7EkbWttXCT8tC2YOIj/3JCttcqOk021tlH9NIK+sH6El1+r+eZPjFPgXfJRoN6f
	S7OxF3b022hN5cKFh0lNC4gOfgtop7yW9MVa1n03R8h5n7U04U5b+L0dfv0Nnvyl
	JXdsUHSxKBR/e3b269ECAY5DefemPlT5MiDr0PLGDKr3smy3A/ZclCEGhOT//L0P
	o4WOG7+rvjUWfcAvL5K6KQTrzs1PitHEmvb2HZUkFbg+ryHAHDEHqKDOXZ9FRe78
	Zc3Dd3d+sR8ejMvgXmKSsctN2J3CMuEpLVVgdv0WT1c5JWTVZPFpgTpoVMwZnXdy
	0NaODrqTtw==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aeeqwk9pv-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 09:28:18 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Tue, 18 Nov 2025 01:28:17 -0800
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Tue, 18 Nov 2025 01:28:17 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-filesystems][PATCH 2/2] xfsprogs: support reproducible builds
Date: Tue, 18 Nov 2025 17:28:15 +0800
Message-ID: <20251118092815.1068882-2-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251118092815.1068882-1-hongxu.jia@windriver.com>
References: <20251118092815.1068882-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA3NCBTYWx0ZWRfX3cqVemvFd8Qx
 hUT2OuGe6lPh8HouHYyHHfgNKhS6F3z9H9pNFYtEQkWy0H33mtGAfnxJr0aJQhP1HObu6MHChHN
 IlReHDRPT5Uj7e7W8ohfjisWvfky/BO4lwVdEuNuS3UOxXFxJ+7GvO7K2EKrwS+ABfJMbzadCif
 7HvZ0q2DUPgItXbq48AslFPoZLzCkqAf8rxInDdteeihAKDyjynbOQE/uN6t1dg2cysYvJi3Nu6
 mjltAOTcreeD3aRCv3bl+dVCqiWrP/rNknxb7teHz/oUliNWjjAsLI0gIR81qei9sOqwQwNU6/X
 d5i3yoow+WExESHQPlM8l7R7fT5yyDUknrArIccZ2/gtUX4J9lUgZNFIpwzWqEfXFjRArBiXM+H
 CyBCPHOvoIXC5TJiyr4rDTc3U8SXqA==
X-Proofpoint-GUID: 6wS505dR2JKluYtW7hIGiomH2TzPitiX
X-Authority-Analysis: v=2.4 cv=OuxCCi/t c=1 sm=1 tr=0 ts=691c3c32 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=t7CeM3EgAAAA:8
 a=nPxhRX6_BImEySsYWHIA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 6wS505dR2JKluYtW7hIGiomH2TzPitiX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511180074
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 09:28:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121841

When compressing docs, do not save the original file name and
timestamp by default (gzip -n). Make archives be reproducible
at each build

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-filesystems/conf/layer.conf              |  1 -
 ...-doc-man-support-reproducible-builds.patch | 54 +++++++++++++++++++
 .../recipes-utils/xfsprogs/xfsprogs_6.6.0.bb  |  1 +
 3 files changed, 55 insertions(+), 1 deletion(-)
 create mode 100644 meta-filesystems/recipes-utils/xfsprogs/files/0001-doc-man-support-reproducible-builds.patch

diff --git a/meta-filesystems/conf/layer.conf b/meta-filesystems/conf/layer.conf
index 4d147b7139..f3525365e7 100644
--- a/meta-filesystems/conf/layer.conf
+++ b/meta-filesystems/conf/layer.conf
@@ -25,5 +25,4 @@ BBFILES_DYNAMIC += " \
 # Please keep this list sorted
 OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES += " \
     e2tools-ptest \
-    xfsprogs-doc \
 "
diff --git a/meta-filesystems/recipes-utils/xfsprogs/files/0001-doc-man-support-reproducible-builds.patch b/meta-filesystems/recipes-utils/xfsprogs/files/0001-doc-man-support-reproducible-builds.patch
new file mode 100644
index 0000000000..182d45e4e2
--- /dev/null
+++ b/meta-filesystems/recipes-utils/xfsprogs/files/0001-doc-man-support-reproducible-builds.patch
@@ -0,0 +1,54 @@
+From c98d9022377e88f8cc2d557a4ffd321e6f2dd320 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@eng.windriver.com>
+Date: Tue, 18 Nov 2025 01:04:27 -0800
+Subject: [PATCH] doc/man: support reproducible builds
+
+When compressing, do not save the original file name and
+timestamp by default (gzip -n). Make archives be reproducible
+at each build
+
+Upstream-Status: Submitted [linux-xfs@vger.kernel.org]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@eng.windriver.com>
+---
+ doc/Makefile        | 2 +-
+ include/buildmacros | 4 ++--
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/doc/Makefile b/doc/Makefile
+index 83dfa38b..17b63c85 100644
+--- a/doc/Makefile
++++ b/doc/Makefile
+@@ -14,7 +14,7 @@ include $(BUILDRULES)
+ 
+ CHANGES.gz:
+ 	@echo "    [ZIP]    $@"
+-	$(Q)$(ZIP) --best -c < CHANGES > $@
++	$(Q)$(ZIP) -n --best -c < CHANGES > $@
+ 
+ install: default
+ 	$(INSTALL) -m 755 -d $(PKG_DOC_DIR)
+diff --git a/include/buildmacros b/include/buildmacros
+index 9183e5bc..6ba0d515 100644
+--- a/include/buildmacros
++++ b/include/buildmacros
+@@ -105,7 +105,7 @@ INSTALL_MAN = \
+ 			t=$(MAN_DEST)/$$m.$(MAN_SECTION); \
+ 			if $$first; then \
+ 				if $(HAVE_ZIPPED_MANPAGES); then \
+-					$(ZIP) -9 -c $$d > $$d.gz; _sfx=.gz; \
++					$(ZIP) -n -9 -c $$d > $$d.gz; _sfx=.gz; \
+ 				fi; \
+ 				u=$$m.$(MAN_SECTION)$$_sfx; \
+ 				echo $(INSTALL) -m 644 $${d}$$_sfx $${t}$$_sfx;\
+@@ -132,6 +132,6 @@ endif
+ MAN_MAKERULE = \
+ 	@for f in *.[12345678] ""; do \
+ 		if test ! -z "$$f"; then \
+-			$(ZIP) --best -c < $$f > $$f.gz; \
++			$(ZIP) -n --best -c < $$f > $$f.gz; \
+ 		fi; \
+ 	done
+-- 
+2.49.0
+
diff --git a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_6.6.0.bb b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_6.6.0.bb
index 907b875718..80bce6f939 100644
--- a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_6.6.0.bb
+++ b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_6.6.0.bb
@@ -12,6 +12,7 @@ SRC_URI = "https://www.kernel.org/pub/linux/utils/fs/xfs/xfsprogs/${BP}.tar.xz \
            file://0001-support-usrmerge.patch \
            file://0004-configure-Use-AC_SYS_LARGERFILE-autoconf-macro.patch \
            file://0005-Replace-off64_t-stat64-with-off_t-stat.patch \
+           file://0001-doc-man-support-reproducible-builds.patch \
            "
 SRC_URI[sha256sum] = "50ca2f4676df8fab4cb4c3ef3dd512d5551e6844d40a65a31d5b8e03593d22df"
 inherit autotools-brokensep pkgconfig
-- 
2.34.1


