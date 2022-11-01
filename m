Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D212FA3741
	for <webhook@archiver.kernel.org>; Tue,  1 Nov 2022 02:11:47 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web08.1704.1667268699283811375
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Oct 2022 19:11:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=CpPeWVwt;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1667268697; i=@fujitsu.com;
	bh=v9juQHj6Cc6wXWgKPL+B7MUZjuqkB66fVZe1+W2Yv/8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=CpPeWVwtVoR9pANB5mB7NYT2sf680YjHB17U7UARIlaVrcGfW/0UwtwypNNMP4DAB
	 OhVWQodl/S8Klmb1u8odRwhbFsTSvsc4DnDU7AhLnHB91mtK6+OFkIjPmiys+vUxXK
	 6HtQt10E73z6KGwpFzF/w1/KEd+4H5BH50Asasql7AkyKs/QsCpRda0FvhI8DqYLwc
	 fZP9jL2rNjwJcofide5cxwmP8ZPg11NUkqqfoivniMQvHUXtDsHtfmAgH2O17mne8P
	 /JiFEYSd3cojLQmWIBB+KlFa4lkdVUaR5am2u7izGnbOBuNvXuUKRI+hvOrMy3MltL
	 a/yEOgK5NVQnw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8ORqBvRkJB
  ssGe5pcXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmvFlnVbBSp6KrVN7WRoY/3J1MXJxCAk8YZS4
  ffEzK4RznUniwOMVTBDObkaJU5uOs3cxcnKwCUhJ3Lj/nw3EFhHQl1g6ew8ziM0soCLx4ncPW
  I2wgI/ExNVLWUBsFqB4w84prCA2r4CTRM/DzWA1EgIKElMevmeGiAtKnJz5hAVijoTEwRcvmC
  FqFCVmX25mgbArJGbNamOCsNUkrp7bxDyBkX8WkvZZSNoXMDKtYjQrTi0qSy3SNbTQSyrKTM8
  oyU3MzNFLrNJN1Est1S1PLS7RNdRLLC/WSy0u1iuuzE3OSdHLSy3ZxAgMxpRilgc7GHcs+6N3
  iFGSg0lJlPe/REKyEF9SfkplRmJxRnxRaU5q8SFGGQ4OJQnen3VAOcGi1PTUirTMHGBkwKQlO
  HiURHh/VQOleYsLEnOLM9MhUqcYLTmmzv63n5ljOZic+bXtALMQS15+XqqUOO+CeqAGAZCGjN
  I8uHGw6L3EKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZh3DshVPJl5JXBbXwEdxAR0EFt7HMh
  BJYkIKakGpirG8IitvFMcVqp/2V/jKPa8+9vHIJ2Fu57PPnXzjbXUxrA8d+MFzNfWPH37Vld2
  cvZiIcfPEkytRmYHo13YJ6nGylbWLfL70pRrfP/QHQNn1o2vN/kZ3tPgnf3OWHnfzFpV84mL9
  OM/W/+5ldL48nWvlolz1aFZ/fv3cc3tET94svmdw/XmK3L8l5dfXnlovukPD7/Da07w7/9bpT
  P/W2JTieKus1XRCkxPfJicl/6IvNvd+uxluP/1uztzPP/Na2M6Iq4ww2BCzq3USx/vipVM4Xo
  v1Wi0Yv/RtlCxB//FDuVUXxMtvL/7gaHaHNnjO5/f/zjJlXMif3mYoPwrm1afSH+5BzOcbsdy
  nSvZ9kGJpTgj0VCLuag4EQCJur87WQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-591.messagelabs.com!1667268696!874350!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8846 invoked from network); 1 Nov 2022 02:11:36 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-9.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 1 Nov 2022 02:11:36 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 8E3A7100191
	for <openembedded-devel@lists.openembedded.org>; Tue,  1 Nov 2022 02:11:36 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 824F210018D
	for <openembedded-devel@lists.openembedded.org>; Tue,  1 Nov 2022 02:11:36 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 1 Nov 2022 02:11:34 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-websockets: upgrade 10.3 -> 10.4
Date: Tue, 1 Nov 2022 10:11:23 +0800
Message-ID: <1667268684-10065-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Nov 2022 02:11:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99392

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
New features
------------
    Validated compatibility with Python 3.11.

    Added the latency property to protocols.

    Changed ping to return the latency of the connection.

    Supported overriding or removing the User-Agent header in clients and the Server header in servers.

    Added deployment guides for more Platform as a Service providers.

Improvements
-------------
    Improved FAQ.


Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-websockets_10.3.bb => python3-websockets_10.4.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-websockets_10.3.bb => python3-websockets_10.4.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-websockets_10.3.bb b/meta-python/recipes-devtools/python/python3-websockets_10.4.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-websockets_10.3.bb
rename to meta-python/recipes-devtools/python/python3-websockets_10.4.bb
index 64b96d3ed7..fac4d7a424 100644
--- a/meta-python/recipes-devtools/python/python3-websockets_10.3.bb
+++ b/meta-python/recipes-devtools/python/python3-websockets_10.4.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=78c2cc91e172ca96d6f8e4a76c739ec6"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "fc06cc8073c8e87072138ba1e431300e2d408f054b27047d047b549455066ff4"
+SRC_URI[sha256sum] = "eef610b23933c54d5d921c92578ae5f89813438fded840c2e9809d378dc765d3"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.25.1


