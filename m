Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 086D6C433EF
	for <webhook@archiver.kernel.org>; Tue, 21 Dec 2021 03:23:53 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web08.1710.1640057032269401538
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Dec 2021 19:23:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Kf7Sndmh;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1640057030; i=@fujitsu.com;
	bh=MoP2td0h2QXErBm7uJFPZchze88ILT1CpG6d/hcNUMM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Kf7SndmhjfP1Dm0sUw7hhhcNDlH8jNPib94az1E7VQaD3lnLs/5QS5EEg7W3CC5eB
	 hK1IwrXP0iUv/El8etD5PrkIb7Du5gevBxEGHpLskl4DnCElXHwYF2Hkco53Sa362/
	 AFDRniIsKsniLVjLy6BKRtV/19jjWC7T3KcfNh2CwNiSKipjHyjMU2gp3ARtkkdX5X
	 LAn4UVfx0i7Ae8TS8OHjcvFUGFYx5c1RDJx9HgHTJUz32QP97bDtEVQcnQikDXQOIE
	 y54hMPqN3leLp1zAMeDiho9czwXAc5iKsWSaeY1IzfEgNtWwR9pVBpfttk1UyhImKl
	 JqXtWmtz25kTw==
Received: from [100.115.32.74] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-west-2.aws.ess.symcld.net id 0E/A8-09428-5C841C16;
 Tue, 21 Dec 2021 03:23:49 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFIsWRWlGSWpSXmKPExsViZ8MxSfeox8F
  EgwmHZS0uHl7K7MDocW7jCsYAxijWzLyk/IoE1oxZW+6yFVwVqpjYbd/AuEKgi5GLQ0jgCaPE
  uvvTmbsYOYGcC0wSqxbGQyROMkoc2HMLLMEmoC7x+OZrRhBbREBfYunsPWBxZgFVie6La9hBb
  GEBH4k1Zy+wgdgsQPGePZ/B6nkF3CROftwMZksIKEhMefgerJdTwF3i/vu9LBCL3SSmzp/ODl
  EvKHFy5hMWiPkSEgdfvGCG6FWSOLHiIxOEXSHx+vAlqLiaxNVzm5gnMArOQtI+C0n7AkamVYz
  WSUWZ6RkluYmZObqGBga6hoamusaWukaGxnqJVbqJeqmluuWpxSW6RnqJ5cV6qcXFesWVuck5
  KXp5qSWbGIFBnFKsfnUH4+ZVP/UOMUpyMCmJ8u69dSBRiC8pP6UyI7E4I76oNCe1+BCjDAeHk
  gSvHDAuhASLUtNTK9Iyc4ARBZOW4OBREuFVBknzFhck5hZnpkOkTjEqSonzOoMkBEASGaV5cG
  2wKL7EKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZjXF2QKT2ZeCdz0V0CLmYAWK4XvB1lckoi
  QkmpgWvrjeKp8aerrkBmRD9fs49gVw9+713KCxYc/Sx6KWW5Z0qz79HlHCW/KuYOKN57W3v/4
  seCJ+OrfE+eq8m1USW56ZWJz/VNXprcy/7EVrb+nCET+/Cvf5bVK89ub1UuZ4wMEBOK3vE1Qn
  X298bpE0X3XNOfqnCu7yh85G+9+uO+l+W2jp/p+54SZ31571P7/vAPfarU38tJvj/F6rZUxLD
  khIPQ4bdr7KpGfkScuFvb9fCyQ0vrrRbTlgYO79trq72ufW+Jc9kllwsaanm0puXILBd8s+P5
  NIP5e1cnHh9Jv6J+ZduTw9ECVuYzneJjT7uo3lF9LPxmYpJXZ53nvo3rcysuv3qh6RNjuOLuP
  56gSS3FGoqEWc1FxIgDJPnX9XQMAAA==
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-22.tower-565.messagelabs.com!1640057029!44976!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26915 invoked from network); 21 Dec 2021 03:23:49 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-22.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 21 Dec 2021 03:23:49 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 1E2A710034F
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Dec 2021 03:23:49 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 118A110033A
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Dec 2021 03:23:49 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Tue, 21 Dec 2021 03:23:39 +0000
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-grpcio: upgrade 1.41.1 -> 1.43.0
Date: Tue, 21 Dec 2021 11:22:31 +0800
Message-ID: <1640056951-1301-2-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1640056951-1301-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1640056951-1301-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Dec 2021 03:23:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94457

From: Xu Huan <xuhuan.fnst@fujitsu.com>

License-Update:Add BSD-3-Clause License

changlog:
================================================================

Core:
This release contains refinements, improvements, and bug fixes, 
with highlights listed below.
Remove redundant work serializer usage in c-ares windows code. (#28016)
Support RDS updates on the server. (#27851)
Use WorkSerializer in XdsClient to propagate updates in a synchronized
manner. (#27975)
Support Custom Post-handshake Verification in TlsCredentials. (#25631)
Reintroduce the EventEngine default factory. (#27920)
Assert Android API >= v21. (#27943)
Add support for abstract unix domain sockets. (#27906)

Python:
[Aio] Validate the input type for set_trailing_metadata and abort. (#27958)

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../{python3-grpcio_1.41.1.bb => python3-grpcio_1.43.0.bb}  | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio_1.41.1.bb => python3-grpcio_1.43.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.41.1.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.43.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-grpcio_1.41.1.bb
rename to meta-python/recipes-devtools/python/python3-grpcio_1.43.0.bb
index a882f6e031..6d76967bee 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio_1.41.1.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio_1.43.0.bb
@@ -1,8 +1,8 @@
 DESCRIPTION = "Google gRPC"
 HOMEPAGE = "http://www.grpc.io/"
 SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
+LICENSE = "Apache-2.0 & BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=6e4cf218112648d22420a84281b68b88"
 
 DEPENDS += "${PYTHON_PN}-protobuf"
 
@@ -12,7 +12,7 @@ SRC_URI:append:class-target = " file://ppc-boringssl-support.patch \
                                 file://mips_bigendian.patch \
                                 file://0001-absl-always-use-asm-sgidefs.h.patch \
 "
-SRC_URI[sha256sum] = "9b751271b029432a526a4970dc9b70d93eb6f0963b6a841b574f780b72651969"
+SRC_URI[sha256sum] = "735d9a437c262ab039d02defddcb9f8f545d7009ae61c0114e19dda3843febe5"
 
 RDEPENDS:${PN} = "${PYTHON_PN}-protobuf \
                   ${PYTHON_PN}-setuptools \
-- 
2.25.1


