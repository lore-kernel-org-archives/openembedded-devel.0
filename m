Received: from mail3.bemta25.messagelabs.com (mail3.bemta25.messagelabs.com [195.245.230.85])
 by mx.groups.io with SMTP id smtpd.web09.2596.1621474896956456639
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 May 2021 18:41:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=YXMbTLAE;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.85, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1621474893; i=@fujitsu.com;
	bh=OKAzrSUcTzJDCZ4qc0cLUzJpuytzihB5azdnN5CEjww=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=YXMbTLAE40ia7gtYOrQxvgvEw1xRQnmkOs4D8y11sNcClRsRHH1/EgidZUkRs7Zz3
	 S9rWqh7I8IpcECduVTAvXr+RIYiGedkWVoJR7faFRalL2/sUbC4xukvpFhYjFsM+u4
	 FdnGen2+a+ffwirfQQ0NeF3LLcHxsfPyH/hMeqNgbSsYGJYX5YqFgnEd+62PN9Gf1b
	 pKlnIXKeTjlhhtdSFoLohOWGQrbGEdPe8urJ+R6R3oJUX+QWlQgqBb1ZPkThEaC7SZ
	 ZmZbg66Ls7nfKW/oFNiCnWDI0nkPBB/HuTkNEtTKP9JY1qPpc+Yc3BQmrDOsKCvRyr
	 +JYGUYUr1TfWA==
Received: from [100.112.199.57] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-b.eu-west-1.aws.symcld.net id DC/D2-64908-D4EB5A06; Thu, 20 May 2021 01:41:33 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrJIsWRWlGSWpSXmKPExsViZ8MxRdd339I
  Eg2fzmCwuHl7K7MDocW7jCsYAxijWzLyk/IoE1oyHZz6yFfxhr5j7sYmtgXE1excjF4eQwGwm
  iV+/DzFCOHsYJRZsP8faxcjJwSagK3Hu8Vp2EFtEQF9i6ew9zCC2sICzxI6ZO1hAbBYBVYmtz
  yYwgti8Ap4Sfx+3gMUlBBQkpjx8zwwRF5Q4OfMJWJxZQELi4IsXQHEOoBpFidnT5SHKKyRmzN
  jGNoGRZxaSjllIOhYwMq1itEgqykzPKMlNzMzRNTQw0DU0NNI1tLTQNTI01Uus0k3SSy3VLU8
  tLtE11EssL9YrrsxNzknRy0st2cQIDKOUgmPXdzBeff1B7xCjJAeTkiiv2f1FCUJ8SfkplRmJ
  xRnxRaU5qcWHGGU4OJQkeNX2Lk0QEixKTU+tSMvMAYY0TFqCg0dJhPf/NqA0b3FBYm5xZjpE6
  hSjPcebtUsWMXO03bsLJGcuOLiameN++6HVzEIsefl5qVLivMUgUwVA2jJK8+CGwmLwEqOslD
  AvIwMDgxBPQWpRbmYJqvwrRnEORiVh3rV7gKbwZOaVwO1+BXQWE8hZjYtAzipJREhJNTCVKuQ
  aBmuoiyfbddlpMnGnGMjv+jwhd66L5MGGybMfRsqzvtZ7bR4iH7lDROxSXM+/5ddYL3Md3vE4
  1+vHwyCea5ouX2rFj4kmtHi92i8T+Yd90+o1/1z+6LxJOyiycJ16WNe/9fvzpx9ayFDg82Kj8
  fbX4j1KX2/Jm86ec1rp06x7zuoZzvt2rC1QFBf+Iru4n3NLO9OkdWU+MZ/DLl7UfRMiI1zRIW
  U3o7ic1/PxzMjnn/ySlxU2rf5ka/9lTmDqLcV7E6rLV+l4hDdrHOiqSGLawmh/wNFO5rzS/26
  Zy9Zda559e7C3ZcIH/9frTKK36v2tnWVb3GkW8pZZs59xhmU/59JV1UbVB14f0lViKc5INNRi
  LipOBABoqdlxPAMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-22.tower-285.messagelabs.com!1621474892!180051!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26984 invoked from network); 20 May 2021 01:41:33 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-22.tower-285.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 20 May 2021 01:41:33 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 14K1fWOA007902
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 20 May 2021 02:41:32 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 20 May 2021 02:41:31 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] libtinyxml2: upgrade 8.0.0 -> 8.1.0
Date: Thu, 20 May 2021 09:41:27 +0800
Message-ID: <1621474887-127830-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../libtinyxml2/{libtinyxml2_8.0.0.bb => libtinyxml2_8.1.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libtinyxml2/{libtinyxml2_8.0.0.bb => libtinyxml2_8.1.0.bb} (88%)

diff --git a/meta-oe/recipes-support/libtinyxml2/libtinyxml2_8.0.0.bb b/meta-oe/recipes-support/libtinyxml2/libtinyxml2_8.1.0.bb
similarity index 88%
rename from meta-oe/recipes-support/libtinyxml2/libtinyxml2_8.0.0.bb
rename to meta-oe/recipes-support/libtinyxml2/libtinyxml2_8.1.0.bb
index a2491cf9e6..fea5aeff17 100644
--- a/meta-oe/recipes-support/libtinyxml2/libtinyxml2_8.0.0.bb
+++ b/meta-oe/recipes-support/libtinyxml2/libtinyxml2_8.1.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=135624eef03e1f1101b9ba9ac9b5fffd"
 
 SRC_URI = "git://github.com/leethomason/tinyxml2.git"
 
-SRCREV = "bf15233ad88390461f6ab0dbcf046cce643c5fcb"
+SRCREV = "3291390336141573e51dfa991b4179c8bcd8f306"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1

