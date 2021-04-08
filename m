Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.5])
 by mx.groups.io with SMTP id smtpd.web10.3996.1617859770615361279
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Apr 2021 22:29:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=I/x8ns9v;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.5, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1617859769; i=@fujitsu.com;
	bh=DS6KTuZJUJofagF/cGe9M88Z9iEVRPq+rt9mK6JjDps=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=I/x8ns9vnbVrqj2C9FjNewAGiDCGypD4mq461p67tv2xFUwNUICCIuJUe59FyNfUb
	 o5TfWmtKJJkrl7UQhL8WX5vDRP25WDcnTY+p5CJto7uFPVpRX68lUBnlSn3x9LkYLC
	 ZCUoUaop8RebV1yowpsKiFDOS0UyeIPlpDerzhMs/AB0IJdb9XTWwBn6ZMQdfkQlEG
	 QWRq/tkbEruJSQ5parE+vlQMunkW+vvssizlXDUXnjcHxEFhBGX2hjXvxSKhoc9BsZ
	 FilXqgVr8RwpLllYM7CAZs3R0TwD2jHNXvF9Aa4AZyjm9GCTOAe7BX3MpcHZ/K636L
	 QcXqDeBPO9Rgg==
Received: from [100.112.192.143] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-a.eu-west-1.aws.symcld.net id 82/1A-01834-8B49E606; Thu, 08 Apr 2021 05:29:28 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeJIrShJLcpLzFFi42Kxs+EI0d0+JS/
  BYGaHrsXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmnH8/g3WguMcFXfWfmBpYPzI3sXIxSEksJVJ
  omnSIVYI5zijxKLemcxdjJwcbAI6Eh0vullAbBEBfYmls/eAxYUFXCROTN3JCmKzCKhInN15H
  6iGg4NXwE3izQJ1kLCEgILElIfvwcp5BQQlTs58AjaGWUBC4uCLF8wQNYoS23eeYYGwqyTOzv
  7CNIGRZxaSlllIWhYwMq1itEgqykzPKMlNzMzRNTQw0DU0NNI1tARiExO9xCrdRL3UUt3y1OI
  SXUO9xPJiveLK3OScFL281JJNjMAwSik4MGEH4/7XH/QOMUpyMCmJ8mZNyksQ4kvKT6nMSCzO
  iC8qzUktPsQow8GhJMF7oQ0oJ1iUmp5akZaZAwxpmLQEB4+SCG8aSCtvcUFibnFmOkTqFKOil
  Dhv6mSghABIIqM0D64NFkeXGGWlhHkZGRgYhHgKUotyM0tQ5V8xinMwKgnzTgYZz5OZVwI3/R
  XQYiagxSUHc0EWlyQipKQamDa1ruw4JfQwP/lm+dKVVy5pc77etc3i0YecpRFpf1qrVr9m+H7
  q2u/2jT6sT1pt+q4vnXf48Bk5P7lDpgLFwce3df7LTXka8GTegldClcKLXwdoeSvbVz5vCfBY
  vDSu5qX6i0mvTQvWpxTPS5qhsXDGpTuyt/YHv/az/VSzjT25d9FfG9tgm4ue5i4qnyZfSH3Rk
  irI3PpYaXFE9H1NF9UTVw49sjOfcipukYiaavcs+71d72/daInqiPn6vOJ1fIzOidVvzp8MDv
  p4luclBzPHQYZdTjfbL66XZpIxvxl2v9xL3JVLTNxfkyEq6aVs/b6GK02GHi+/zJ7+9dVe99D
  /O6tm/GEpPtf0QZm5p1qJpTgj0VCLuag4EQCxKWj4HgMAAA==
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-24.tower-267.messagelabs.com!1617859765!370884!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19099 invoked from network); 8 Apr 2021 05:29:26 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-24.tower-267.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 Apr 2021 05:29:26 -0000
Received: from R01UKEXCASM223.r01.fujitsu.local (ex2k13_223.fs.fujitsu.com [10.182.185.121])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1385TPoU005967
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 8 Apr 2021 06:29:25 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 8 Apr 2021 06:29:24 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] rabbitmq-c: upgrade 0.10.0 -> 0.11.0
Date: Fri, 9 Apr 2021 01:29:18 +0800
Message-ID: <1617902958-5486-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../rabbitmq-c/{rabbitmq-c_0.10.0.bb => rabbitmq-c_0.11.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/rabbitmq-c/{rabbitmq-c_0.10.0.bb => rabbitmq-c_0.11.0.bb} (88%)

diff --git a/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.10.0.bb b/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.11.0.bb
similarity index 88%
rename from meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.10.0.bb
rename to meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.11.0.bb
index 2ef6b187e..0cfd225cf 100644
--- a/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.10.0.bb
+++ b/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.11.0.bb
@@ -4,8 +4,8 @@ LIC_FILES_CHKSUM = "file://LICENSE-MIT;md5=6b7424f9db80cfb11fdd5c980b583f53"
 LICENSE = "MIT"
 
 SRC_URI = "git://github.com/alanxz/rabbitmq-c.git"
-# v0.10.0-master
-SRCREV = "ffe918a5fcef72038a88054dca3c56762b1953d4"
+# v0.11.0-master
+SRCREV = "a64c08c68aff34d49a2ac152f04988cd921084f9"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1

