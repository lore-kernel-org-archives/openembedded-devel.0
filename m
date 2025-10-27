Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06969CCF9EA
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 11:06:54 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.29063.1761563206413373839
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Oct 2025 04:06:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=BQSHYn/1;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2395d885ba=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59R4ZNwX1337097
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Oct 2025 11:06:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=ovfVv3LrkxV68I20b+gz
	/IDRoD3rfBT4Qlc9OdMoOAc=; b=BQSHYn/1+PqGFJi+9WOiSydZEtLDhuWwLqDV
	F+mYYLT3HJm/2BHE1A7F0oVxkNswykaAM4m4pg2jwLV9pKC1iPLE0f36++IaCrww
	IJAxDZL/glADb00+KElHeG5w7FD5cinSLynrjLSwudwCNzM37t/6hzo1H2O7VWj+
	J7OF71lPbCIXx+ijplucpoMfh3fTzOv0+zCBGvFS5OwkM/ZkxjKIImMKYjTZSnyZ
	D2PVQsokn4jDnXBf5WmEsNAPnl2LE1HQ4WpUTU/UXLvNnPIPo8kL0c9VT1E0D+hf
	WHZ2TGvwtEQVv7BbZV92kFuJN36JMPG/MUlgJjfO30qxX8qPjA==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a0nh5sp6n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Oct 2025 11:06:45 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 27 Oct 2025 04:06:44 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 27 Oct 2025 04:06:43 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-multimedia][walnascar][PATCH] libcamera: fix compile failure on 32 bit target
Date: Mon, 27 Oct 2025 19:06:42 +0800
Message-ID: <20251027110642.910242-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 9zz8DX5S8OT-_qw7oLu-LMvi8moDK3u5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDEwMyBTYWx0ZWRfX4yDMi6U4VxE9
 7RHzFR3EEnLI3Sc0DOOn6rDomSwc9iJNg0rxh6CzBjs4TuFXaKVcTMPodw3qhsj5E/e0qpz4ak5
 zH1OOKWidx+PLAcZ0nIvJGT7IosJkgFcmGJCAvdguucdFcaaFwgyS3j9HrA0Irxp8FSzWeNO5Lz
 svgCiyNV2Zo7TETECR0XbR8uVLrRB5b/DMIn5+gdfaKkqqJ0SQ7JT9qFmgN5qmf5Gi8H5JMsNJQ
 rGTf5lP2SF6jEVFEz7hA2x67CKUzE/aoJu51FnGBvmkTQncPu/ddkLbRrsIeBoW5ymwAaL5fVEn
 M19VIOLo60ypv7fFzsNjQNCjL3t7+KCrsgYL0OLx4hYCV56czrVwv09lb841FiEf74p+RWvkTxJ
 nvk5da9uxJA1VtfpVV7paBI4PxuP/g==
X-Authority-Analysis: v=2.4 cv=FOoWBuos c=1 sm=1 tr=0 ts=68ff5245 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=P1BnusSwAAAA:8 a=8AirrxEcAAAA:8 a=YAyIRdgMAAAA:8 a=LHgGSfUrKozl1ci7ptwA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=D0XLA9XvdZm18NrgonBM:22 a=ST-jHhOKWsTCqRlWije3:22
 a=o1rO4XtwZBNj6n05oSJ_:22
X-Proofpoint-ORIG-GUID: 9zz8DX5S8OT-_qw7oLu-LMvi8moDK3u5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_05,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 clxscore=1015 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510270103
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Oct 2025 11:06:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121034

When debug build is enabled, build failed on 32 bit target,
such as qemux86
$ echo 'MACHINE = "qemux86"' >> conf/local.conf
$ echo 'DEBUG_BUILD = "1"  >> conf/local.conf
$ bitbake libcamera
...
|../git/src/libcamera/pipeline/simple/simple.cpp:1564:9: error:
'media' may be used uninitialized [-Werror=maybe-uninitialized]
| 1564 |         if (!media)
|      |         ^~
|../git/src/libcamera/pipeline/simple/simple.cpp:1553:22: note:
'media' was declared here
| 1553 |         MediaDevice *media;
...

Backport a patch from upstream to fix the issue

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...Fix-matching-with-empty-media-graphs.patch | 132 ++++++++++++++++++
 .../libcamera/libcamera_0.4.0.bb              |   1 +
 2 files changed, 133 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-pipeline-simple-Fix-matching-with-empty-media-graphs.patch

diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-pipeline-simple-Fix-matching-with-empty-media-graphs.patch b/meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-pipeline-simple-Fix-matching-with-empty-media-graphs.patch
new file mode 100644
index 0000000000..88efb7a0b9
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-pipeline-simple-Fix-matching-with-empty-media-graphs.patch
@@ -0,0 +1,132 @@
+From b8eda39c94315ffc99af67c4133292fa5e19931b Mon Sep 17 00:00:00 2001
+From: Paul Elder <paul.elder@ideasonboard.com>
+Date: Tue, 13 May 2025 15:37:51 +0200
+Subject: [PATCH] pipeline: simple: Fix matching with empty media graphs
+
+The match() function currently reports that it is not possible to create
+any cameras if it encounters an empty media graph.
+
+Fix this by looping over all media graphs and only returning false when
+all of them fail to create a camera.
+
+It is worth noting that an issue does exist when on a partial match that
+ends in an invalid match, any media devices that were acquired will stay
+acquired. This is not a new issue though, as any acquired media devices
+in general are not released until pipeline handler deconstruction. This
+requires a rework of how we do matching and pipeline handler
+construction, so it is captured in a comment.
+
+In the meantime, this fix fixes a problem without increasing the net
+number of problems.
+
+Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
+Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
+Tested-by: Hui Fang <hui.fang@nxp.com>
+Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
+
+Upstream-Status: Backport [https://github.com/libcamera-org/libcamera/commit/6928522db6fab5a1cb9f05ce1ba8868a38de7781]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ src/libcamera/pipeline/simple/simple.cpp | 62 +++++++++++++++++-------
+ 1 file changed, 45 insertions(+), 17 deletions(-)
+
+diff --git a/src/libcamera/pipeline/simple/simple.cpp b/src/libcamera/pipeline/simple/simple.cpp
+index 8ac24e6e..35011bb0 100644
+--- a/src/libcamera/pipeline/simple/simple.cpp
++++ b/src/libcamera/pipeline/simple/simple.cpp
+@@ -373,6 +373,9 @@ private:
+ 		return static_cast<SimpleCameraData *>(camera->_d());
+ 	}
+ 
++	bool matchDevice(MediaDevice *media, const SimplePipelineInfo &info,
++			 DeviceEnumerator *enumerator);
++
+ 	std::vector<MediaEntity *> locateSensors(MediaDevice *media);
+ 	static int resetRoutingTable(V4L2Subdevice *subdev);
+ 
+@@ -1546,25 +1549,13 @@ int SimplePipelineHandler::resetRoutingTable(V4L2Subdevice *subdev)
+ 	return 0;
+ }
+ 
+-bool SimplePipelineHandler::match(DeviceEnumerator *enumerator)
++bool SimplePipelineHandler::matchDevice(MediaDevice *media,
++					const SimplePipelineInfo &info,
++					DeviceEnumerator *enumerator)
+ {
+-	const SimplePipelineInfo *info = nullptr;
+ 	unsigned int numStreams = 1;
+-	MediaDevice *media;
+ 
+-	for (const SimplePipelineInfo &inf : supportedDevices) {
+-		DeviceMatch dm(inf.driver);
+-		media = acquireMediaDevice(enumerator, dm);
+-		if (media) {
+-			info = &inf;
+-			break;
+-		}
+-	}
+-
+-	if (!media)
+-		return false;
+-
+-	for (const auto &[name, streams] : info->converters) {
++	for (const auto &[name, streams] : info.converters) {
+ 		DeviceMatch converterMatch(name);
+ 		converter_ = acquireMediaDevice(enumerator, converterMatch);
+ 		if (converter_) {
+@@ -1573,7 +1564,7 @@ bool SimplePipelineHandler::match(DeviceEnumerator *enumerator)
+ 		}
+ 	}
+ 
+-	swIspEnabled_ = info->swIspEnabled;
++	swIspEnabled_ = info.swIspEnabled;
+ 
+ 	/* Locate the sensors. */
+ 	std::vector<MediaEntity *> sensors = locateSensors(media);
+@@ -1692,6 +1683,43 @@ bool SimplePipelineHandler::match(DeviceEnumerator *enumerator)
+ 	return registered;
+ }
+ 
++bool SimplePipelineHandler::match(DeviceEnumerator *enumerator)
++{
++	MediaDevice *media;
++
++	for (const SimplePipelineInfo &inf : supportedDevices) {
++		DeviceMatch dm(inf.driver);
++		while ((media = acquireMediaDevice(enumerator, dm))) {
++			/*
++			 * If match succeeds, return true to let match() be
++			 * called again on a new instance of the pipeline
++			 * handler. Otherwise keep looping until we do
++			 * successfully match one (or run out).
++			 */
++			if (matchDevice(media, inf, enumerator)) {
++				LOG(SimplePipeline, Debug)
++					<< "Matched on device: "
++					<< media->deviceNode();
++				return true;
++			}
++
++			/*
++			 * \todo We need to clear the list of media devices
++			 * that we've already acquired in the event that we
++			 * fail to create a camera. This requires a rework of
++			 * DeviceEnumerator, or even how we create pipelines
++			 * handlers. This is because at the moment acquired
++			 * media devices are only released on pipeline handler
++			 * deconstruction, and if we release them any earlier
++			 * then DeviceEnumerator::search() will keep returning
++			 * the same media devices.
++			 */
++		}
++	}
++
++	return false;
++}
++
+ V4L2VideoDevice *SimplePipelineHandler::video(const MediaEntity *entity)
+ {
+ 	auto iter = entities_.find(entity);
+-- 
+2.49.0
+
diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.4.0.bb b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.4.0.bb
index 3d43b4f1da..9275bfa22a 100644
--- a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.4.0.bb
+++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.4.0.bb
@@ -12,6 +12,7 @@ SRC_URI = " \
         git://git.libcamera.org/libcamera/libcamera.git;protocol=https;branch=master \
         file://0001-media_device-Add-bool-return-type-to-unlock.patch \
         file://0002-libcamera-Add-missing-stdint.h-include-to-dma_buf_al.patch \
+        file://0001-pipeline-simple-Fix-matching-with-empty-media-graphs.patch \
 "
 
 SRCREV = "35ed4b91291d9f3d08e4b51acfb51163e65df8f8"
-- 
2.34.1


