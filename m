Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web11.3520.1620958447461957120
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 May 2021 19:14:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=NTjk2ew6;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1620958445; i=@fujitsu.com;
	bh=VEyExYl8bSCI9LNoDVcNc0BB4SJDuWOv8STXfG16X08=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=NTjk2ew66sOFzDh7eE0FUZzOJRzQIl0SaZf6if9+3hyoDQgSnHF1jrAd8L8Q4NHDE
	 ZPLKjNtgZyTA07iXMPiOOubTK/CpA9iuuL9ZxwMjxrLYR0IUR+TvrgtI6qOyxXZqhl
	 koeu5sRIZLF8FSqOp9edAsJcyC/rpvBsCnXL65EwSYSzA4BaXJTh7+pQnYBFw1V9TG
	 FY2q3VkQESe3Df2JdHKG061dFgrd7Mwm+65jz6Lw/n1Tk36AxgGlC/Xcw+dzwORmtd
	 QCuhEdiB7WpzqLrWqwr5wWl90v1qc8+/qeUcZSAPkDGFd1LUVyfHOl26AB+PLGGseU
	 gCJYwECFzr6yA==
Received: from [100.113.6.49] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-b.eu-central-1.aws.symcld.net id 24/DE-57985-DECDD906; Fri, 14 May 2021 02:14:05 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuplkeJIrShJLcpLzFFi42Kxs+EI1X17Z26
  CQdNzCYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePi0UVsBb+5K270/2BqYOzi7mLk4hASmM0k
  sebDZGYI5zijRFvnZ9YuRk4ONgEdiY4X3SwgtoiAvsTS2XuYQWxhAU+JB0/3gMVZBFQlPnyYy
  gZi8wq4Sdw9e5QJxJYQUJCY8vA9M0RcUOLkzCdg9cwCEhIHX7xghqhRlNi+8wwLhF0hMWPGNr
  YJjDyzkLTMQtKygJFpFaNlUlFmekZJbmJmjq6hgYGuoaGxromuobGBXmKVbpJeaqlucmpeSVE
  iUFYvsbxYr7gyNzknRS8vtWQTIzCUUgpZmnYw/n71Qe8QoyQHk5Io70nP2QlCfEn5KZUZicUZ
  8UWlOanFhxhlODiUJHi/35qbICRYlJqeWpGWmQMMa5i0BAePkgjvH5A0b3FBYm5xZjpE6hSjo
  pQ4r/BtoIQASCKjNA+uDRZLlxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ814FGc+TmVcCN/
  0V0GImoMU3ps8CWVySiJCSamDKVOe0r2WvsM3ynD73balMvczdFUv/XS/8YeD8duljnT/iNix
  3IgOFlvy6eI7PfLbDmf3fylj/nf3z03TblW2T0wUrfgd7zNnMxZ1923A9V0K6+O3MicJW82cF
  RMybP6tjSsGigJWX3vkeOzPn/Ke3HnIs8xIbREN2vVKewaW3kcfFwG+zzASGb/NMkyy/v+jfx
  vZO38X1Md/cdIYv7oLm0y4ZXp6mE/rN/ZYcK5+0NHupwYKI+uK9VWJMW4Q4/qroxWmeNJLtln
  k52SKz0kj88YHCSwo1dxbe91vSVLR6l8W+fktGr7cruJK9nc8KTj/0qSau/a+wUM1zx4D/k2+
  8aa3ukHQ4cnVfV8pO9vVKLMUZiYZazEXFiQC1VzR1IAMAAA==
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-19.tower-245.messagelabs.com!1620958444!195756!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27675 invoked from network); 14 May 2021 02:14:05 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-19.tower-245.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 14 May 2021 02:14:05 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 14E2E476003428
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 14 May 2021 03:14:04 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 14 May 2021 03:14:02 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH] tcpreplay: upgrade 4.3.3 -> 4.3.4
Date: Fri, 14 May 2021 10:13:55 +0800
Message-ID: <1620958435-8027-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

-License-Update: URL changed from HTTP to HTTPS.

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../tcpreplay/{tcpreplay_4.3.3.bb => tcpreplay_4.3.4.bb}    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-support/tcpreplay/{tcpreplay_4.3.3.bb => tcpreplay_4.3.4.bb} (66%)

diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.3.3.bb b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.3.4.bb
similarity index 66%
rename from meta-networking/recipes-support/tcpreplay/tcpreplay_4.3.3.bb
rename to meta-networking/recipes-support/tcpreplay/tcpreplay_4.3.4.bb
index 3346daddb0..eda51bb7f5 100644
--- a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.3.3.bb
+++ b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.3.4.bb
@@ -4,12 +4,12 @@ HOMEPAGE = "http://tcpreplay.synfin.net/"
 SECTION = "net"
 
 LICENSE = "GPLv3"
-LIC_FILES_CHKSUM = "file://docs/LICENSE;md5=890b830b22fd632e9ffd996df20338f8"
+LIC_FILES_CHKSUM = "file://docs/LICENSE;md5=10f0474a2f0e5dccfca20f69d6598ad8"
 
 SRC_URI = "https://github.com/appneta/tcpreplay/releases/download/v${PV}/tcpreplay-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "53b52bf64f0b6b9443428e657b37bc6b"
-SRC_URI[sha256sum] = "ed2402caa9434ff5c74b2e7b31178c73e7c7c5c4ea1e1d0e2e39a7dc46958fde"
+SRC_URI[md5sum] = "305a84d84265705bd28f148698142188"
+SRC_URI[sha256sum] = "ee065310806c22e2fd36f014e1ebb331b98a7ec4db958e91c3d9cbda0640d92c"
 
 UPSTREAM_CHECK_URI = "https://github.com/appneta/tcpreplay/releases"
 
-- 
2.25.1

