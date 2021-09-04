Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.5])
 by mx.groups.io with SMTP id smtpd.web12.17069.1630894364824697062
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Sep 2021 19:12:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=YaKOm1OT;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.5, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1630894362; i=@fujitsu.com;
	bh=khPd7z4NEbUztCiY8fEzRnDKtFbyTQr4ijf2QkcWlNA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=YaKOm1OT1M681R1pC9+22fKj+CSfLG5quYxXUvDYrdWWxkURtPYNTkoQ0z8k00SqM
	 n4+/g9CSkBRZtrBf/IieDIqBYWlhBzk/SoO5Hkj/O4P4iCFRnEGQNx0VzGgL68aauN
	 1z3+QYFrgXUGfFCbVk78RbIcwbAvYR4t/gJozYh73ogedQJUXUT1FqXry60xDL7+St
	 C4I0+S+G/zC5l39yu+COJag/Hzfx6jN2N8E4EhLPb67HsVLosOiIF+lwdKuScVI0U8
	 vc1wUv+JLpPkkk/qNJ/a9xWqUSE9YsCfT2VIGavLl/xVVJYwp25wSsHdKMxIAqCvZA
	 o+kUkfc+Pk6Ww==
Received: from [100.113.3.182] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-a.eu-central-1.aws.symcld.net id 65/EB-29877-A1975316; Mon, 06 Sep 2021 02:12:42 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrIIsWRWlGSWpSXmKPExsViZ8MRoitVaZp
  ocHAxm8XFw0uZHRg9zm1cwRjAGMWamZeUX5HAmvFy1RP2gu+cFR9ermJpYHzJ0cXIxSEkMItJ
  4u+/j6wQzm5GiW89q5i6GDk52AR0Jc49XssOYosI6Essnb2HGcQWFrCXWNO6FayGRUBF4tLeV
  rAaXgEPift/OlhAbAkBBYkpD98zQ8QFJU7OfAIWZxaQkDj44gVQnAOoRlFi9nR5iPIKideHLz
  FPYOSZhaRjFpKOBYxMqxgtkooy0zNKchMzc3QNDQx0DQ2NdY10TQ31Eqt0E/VSS3WTU/NKihK
  BknqJ5cV6xZW5yTkpenmpJZsYgWGUUshkvIPx2usPeocYJTmYlER5NexME4X4kvJTKjMSizPi
  i0pzUosPMcpwcChJ8B4oB8oJFqWmp1akZeYAQxomLcHBoyTCe6UMKM1bXJCYW5yZDpE6xRjO8
  WbtkkXMHG/BZNu9u0CyHUzOXHBwNTPHLDB5v/0QkHwAIoVY8vLzUqXEeV+BbBMAGZdRmge3DB
  azlxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ84aBTOHJzCuBu+kV0LlMQOe2PTQBObckESE
  l1cBkvDVx09Tay9O1NAweZ3x98Veem3/RuVTd7UFbtztmvf1m8ue7zM/Lz16oc5wu/HbJpmla
  5abaeWUH51i+i2/9uGtKiUjIdYf7m9ak9Xuc3mXDsNFDspJhmgqXp+3qUMVJotOirDK3zs0w5
  7t4fuEqvptfrpUU1ruHeOm9Lpq2WWXK8623PmW/6DV9MaHnrrn4kl//zFI2Lyu2iHd6VKVRo/
  Y9V+/vSndRH4l7kh+M/F6b6Dysm5KUyKr0ne1UYZpivET4KaeTSZn9HlvLb6kfyfSXa5+30kU
  w4sDmigRTLmWzb+cLBS+KhLe4LxbSdXave/qOr7Xl//eckv1sKv5SwhXzJ+XU8Cpmixc88VJi
  Kc5INNRiLipOBADtshfLVAMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-4.tower-228.messagelabs.com!1630894361!338412!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17844 invoked from network); 6 Sep 2021 02:12:42 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-4.tower-228.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 6 Sep 2021 02:12:42 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1862CccC009114
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Mon, 6 Sep 2021 03:12:41 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Mon, 6 Sep 2021 03:12:37 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] uhubctl: upgrade 2.3.0 -> 2.4.0
Date: Sun, 5 Sep 2021 07:23:07 +0800
Message-ID: <1630797787-44260-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Support for toggle action (turn power on or off opposite to current power state) b99a080.
More sane error reporting when we enumerate devices which lack permissions 9b5efa0.
Allow pkg-config override to make some build systems (e.g. chromium OS) happier 92736a8.
Even more supported devices.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../uhubctl/{uhubctl_2.3.0.bb => uhubctl_2.4.0.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/uhubctl/{uhubctl_2.3.0.bb => uhubctl_2.4.0.bb} (92%)

diff --git a/meta-oe/recipes-support/uhubctl/uhubctl_2.3.0.bb b/meta-oe/recipes-support/uhubctl/uhubctl_2.4.0.bb
similarity index 92%
rename from meta-oe/recipes-support/uhubctl/uhubctl_2.3.0.bb
rename to meta-oe/recipes-support/uhubctl/uhubctl_2.4.0.bb
index 9926ad4f05..44aeaed099 100644
--- a/meta-oe/recipes-support/uhubctl/uhubctl_2.3.0.bb
+++ b/meta-oe/recipes-support/uhubctl/uhubctl_2.4.0.bb
@@ -6,7 +6,7 @@ DEPENDS = "libusb1"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRCREV = "1b52efddbd68b4395df3ac9cd10eeb984af22439"
+SRCREV = "014b55ac5d1d7fb46a8f1eefe9fc3b87ea65a75f"
 SRC_URI = "git://github.com/mvp/${BPN}"
 S = "${WORKDIR}/git"
 
-- 
2.25.1

