Received: from mail3.bemta25.messagelabs.com (mail3.bemta25.messagelabs.com [195.245.230.85])
 by mx.groups.io with SMTP id smtpd.web10.8659.1623130591135399061
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Jun 2021 22:36:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=vXDns1Df;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.85, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1623130589; i=@fujitsu.com;
	bh=ck69RE21NSfvaPKLejqVRgxJpWG2GL8mEMghCgqapjE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=vXDns1DfwG0gkZjpUxbwa13Af3VBEjX2jGL45mYykDK5g/Q6fT+J0Q87BdILkT+QQ
	 0zwGZWCHGdshGFr10yKlO115DqHcWLDw2r0hBpUIPKnpkoKNoV3DgwFtZbPKBzSMdu
	 TFZHMykAcyzyR+oICcA/35rR0sYguoW3Rc8rTh/uMtFXzbVeLilySdIuzE6zrp+e+L
	 5eIh1M3AeJTgAUlvTJi5K6OTfuFcSq2CymRTBrEKft0M8IrPdH/l5JTCFuU2PtNMYm
	 Pm8iYVS0PLAxTIuCsl1mcqF04YbPltgjyuzQ1mLcV5QqPkW0OWR1zKhSnfZ31QejC8
	 U1f0Z0G2QE9EQ==
Received: from [100.112.199.57] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-b.eu-west-1.aws.symcld.net id 79/F9-64908-CD10FB06; Tue, 08 Jun 2021 05:36:28 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphkeJIrShJLcpLzFFi42Kxs+EI0b3DuD/
  BYME2NYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWP24odsBQ84Kq7t2s/cwNjE0cXIxSEkMItJ
  ov3aYnYI5zijxKoX5xi7GDk52AR0JDpedLOA2CIC+hJLZ+9hBrGFBVwkVkxYxQZiswioSPzY8
  x+snlfAXeJS81SwegkBBYkpD98zQ8QFJU7OfAIWZxaQkDj44gUzRI2ixPadZ6DqKyRmzNjGNo
  GRZxaSlllIWhYwMq1itEgqykzPKMlNzMzRNTQw0DU0NNI1tLTQNTI01Uus0k3SSy3VLU8tLtE
  11EssL9YrrsxNzknRy0st2cQIDKSUgmPXdzBeff1B7xCjJAeTkijv6ox9CUJ8SfkplRmJxRnx
  RaU5qcWHGGU4OJQkeG8w7E8QEixKTU+tSMvMAQY1TFqCg0dJhNcRJM1bXJCYW5yZDpE6xagoJ
  c6bApIQAElklObBtcEi6RKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYd4f/4Eu48nMK4Gb/g
  poMRPIYuN9IItLEhFSUg1Mlw7qy+Vu8m04Jy2t+vL+qvMtz+pkSmrn2zatzxaxibN/v8KpvTN
  Pb6tdTc/Rj8618f0y32/dbHLxU3/+ifvxs6kyf76whC193e0bvd/T+LLsCRdFj6v7nY84bX7a
  7ltoLWj19b4ou7+JyOZOCZGaXYlyzl8eHEhZk994+6DujJPHKhVaLXOPzvPnsvtyXHGb+ofyr
  s5gZwmTictCY3fvftvBuCrxRKmEiZtGi9/HXPbE/1fmSS+SD/C58jzm3sXiEzOEz7K6NPy2j7
  Z16+g1XP1806K3KRcPTljGu4PHdM5rOeenZ+NydNzZ1pV8WO+5fbesQIr0g6dWm5dcTVw0Xf6
  mx/ugUpaJk3YmXvVUYinOSDTUYi4qTgQA58FsTB8DAAA=
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-8.tower-285.messagelabs.com!1623130588!117892!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29196 invoked from network); 8 Jun 2021 05:36:28 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-8.tower-285.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 Jun 2021 05:36:28 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1585aLFG001200
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Tue, 8 Jun 2021 06:36:28 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Tue, 8 Jun 2021 06:36:20 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-idna: upgrade 3.1 -> 3.2
Date: Tue, 8 Jun 2021 13:36:11 +0800
Message-ID: <1623130571-40693-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../python/{python3-idna_3.1.bb => python3-idna_3.2.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-idna_3.1.bb => python3-idna_3.2.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-idna_3.1.bb b/meta-python/recipes-devtools/python/python3-idna_3.2.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-idna_3.1.bb
rename to meta-python/recipes-devtools/python/python3-idna_3.2.bb
index fbdbab6dfb..4ca7f625a8 100644
--- a/meta-python/recipes-devtools/python/python3-idna_3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-idna_3.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/kjd/idna"
 LICENSE = "BSD-3-Clause & Python-2.0 & Unicode"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=239668a7c6066d9e0c5382e9c8c6c0e1"
 
-SRC_URI[sha256sum] = "c5b02147e01ea9920e6b0a3f1f7bb833612d507592c837a6c49552768f4054e1"
+SRC_URI[sha256sum] = "467fbad99067910785144ce333826c71fb0e63a425657295239737f7ecd125f3"
 
 inherit pypi setuptools3
 
-- 
2.25.1

