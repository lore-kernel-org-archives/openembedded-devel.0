Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.67])
 by mx.groups.io with SMTP id smtpd.web12.2616.1623982164470120765
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Jun 2021 19:09:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=nrdWxI7z;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.67, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1623982162; i=@fujitsu.com;
	bh=xRB7WOvN2oXQ4ywwnsR1x048QtdBAO4IMTSzXZhteCk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=nrdWxI7zctevg06AQqSHqrP9bqut6dh1YsH3EV4+z54FByVquYOJ+tnfTOmPdolU2
	 it9dZsuUoDxk4paPJQBLcRQ9Tz/tsUcW4KGYeQtKFsqfgRDjixo8gKTtBE2G8VS5Nz
	 FQc8qvGXVV6mMtKWSfP7DcRDuI3dV+HJL/GC/QpA1tdNQArsDedODO7K+dTCG9g8SW
	 WCMe0SkMM3MsO/Ba0aQCVbb4AvRBHdDoBWREGaCTkkkuXt7VLRgQgXH1yk/mx9NpS2
	 qefruf1CeyAzdnKsUXnro7eHdUO66ZflQlPUSOFDzBh9OX18f4ANeB9A+cwgnO7EhQ
	 6ox7tH1mNjlcA==
Received: from [100.112.198.210] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-b.eu-west-1.aws.symcld.net id 38/8D-28814-2500CC06; Fri, 18 Jun 2021 02:09:22 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupkkeJIrShJLcpLzFFi42Kxs+EI0Q1kOJN
  g0PrMxOLi4aXMDowe5zauYAxgjGLNzEvKr0hgzVg9u6LgFkfFwk8mDYxtHF2MXBxCArOZJA5s
  bmKDcE4wSvy/2s/cxcjJwSagI9HxopsFxBYR0JdYOnsPWFxYwENi/vT/bCA2i4CqxN01Nxm7G
  Dk4eAXcJCb0CoGEJQQUJKY8fA9WzisgKHFy5hOwMcwCEhIHX7xghqhRlNi+8wwLhF0hMWPGNr
  YJjDyzkLTMQtKygJFpFaNFUlFmekZJbmJmjq6hgYGuoaGRrqGlua6hsbleYpVukl5qqW55anG
  JrqFeYnmxXnFlbnJOil5easkmRmAIpRQc7dzB+OvVB71DjJIcTEqivFYvTycI8SXlp1RmJBZn
  xBeV5qQWH2KU4eBQkuD99A8oJ1iUmp5akZaZAwxnmLQEB4+SCC/TX6A0b3FBYm5xZjpE6hSjo
  pQ4b9t/oIQASCKjNA+uDRZDlxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ80qATOHJzCuBm/
  4KaDET0OI2oVMgi0sSEVJSDUwXuoKr70tEtItz/0hrz36ww3XOFMun5yv3C1i8juHJtn62Z98
  bNj291mPOWRwhjJ5bP//nXGl8UWBDUiOrc4/is/fPDO7ENH30C+KT2m3cq+vI0y5pONvggd+1
  sFPzWBsSPoo67V3946eBm9Ert8UrD2ZelGx16bJsntfj+X6NisN++aUz2Xd8lJ3OcLGBUc34z
  Fk7T8mvJi5tbv7ihXdyzsfYTdrbd1ck9mq5oVOeRKP28gViWz1u50sqLtnzSUR1M3+Iar2H4c
  0KQ8f5hSblqudcV93YcuDf302G3/pPXt2xJ4Xh2jp79oD7Ll1HAmwmNC3lWumXsPLg8qNK5x9
  8OXe2e1lzMKc8A9v9/0osxRmJhlrMRcWJAOW3XnAcAwAA
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-11.tower-291.messagelabs.com!1623982161!70244!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8156 invoked from network); 18 Jun 2021 02:09:21 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-11.tower-291.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 18 Jun 2021 02:09:21 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 15I29Gdh002959
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 18 Jun 2021 03:09:21 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Fri, 18 Jun 2021 03:09:14 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-filesystems] [PATCH] fuse3: upgrade 3.10.3 -> 3.10.4
Date: Fri, 18 Jun 2021 22:09:05 +0800
Message-ID: <1624025345-6965-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../recipes-support/fuse/{fuse3_3.10.3.bb => fuse3_3.10.4.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-filesystems/recipes-support/fuse/{fuse3_3.10.3.bb => fuse3_3.10.4.bb} (95%)

diff --git a/meta-filesystems/recipes-support/fuse/fuse3_3.10.3.bb b/meta-filesystems/recipes-support/fuse/fuse3_3.10.4.bb
similarity index 95%
rename from meta-filesystems/recipes-support/fuse/fuse3_3.10.3.bb
rename to meta-filesystems/recipes-support/fuse/fuse3_3.10.4.bb
index 72d0cd3e49..32dab3e35d 100644
--- a/meta-filesystems/recipes-support/fuse/fuse3_3.10.3.bb
+++ b/meta-filesystems/recipes-support/fuse/fuse3_3.10.4.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://GPL2.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 SRC_URI = "https://github.com/libfuse/libfuse/releases/download/fuse-${PV}/fuse-${PV}.tar.xz \
 "
-SRC_URI[sha256sum] = "eb8373f208b05a39702f9f437f6e49caf4b1ace26a9acb68110b49912078560f"
+SRC_URI[sha256sum] = "9365b74fd8471caecdb3cc5adf25a821f70a931317ee9103d15bd39089e3590d"
 
 S = "${WORKDIR}/fuse-${PV}"
 
-- 
2.25.1

