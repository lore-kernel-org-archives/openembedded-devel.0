Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web08.34694.1629171303313869941
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Aug 2021 20:35:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=PBnGLjV3;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: leimaohui@fujitsu.com)
Return-Path: <leimaohui@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1629171301; i=@fujitsu.com;
	bh=u0Rwk1P9/BqHisTKExctDx7ENtx5AKNsplXXUn6qzEw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=PBnGLjV33KnnIXiZC7hP9BeVZscN/eQ7pFWtyeI1dJ5AJYxJlHy3T8uhj6D5PWVR4
	 bLlnxGw3zxYXbfa8Fnp/AgiR8sWwcWCzvvzPnaUos/yCbbgbXMkRYRTk2cW4zyu90S
	 6xgKOxWZtOaodGLXogGoanM43xh15f7BML0JBo+n7tuAsOwZST2mayHT1zJIw8vheb
	 c+ptoUxA4uQ1V0gwm50rlOEKDzUTcEDGvR2n1zX8/CaUy4yR/et7iUqXoUyNyfzYsr
	 Jy4gcfR8jtDmRAWrB/SlBb2KkWZQiQiSLaCCpgNNstxZo8Vbz0Ry1N64fi0k1GZhEb
	 OIqLok8EpkXZw==
Received: from [100.113.0.182] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-central-1.aws.symcld.net id 82/2C-21493-56E2B116; Tue, 17 Aug 2021 03:35:01 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprJIsWRWlGSWpSXmKPExsViZ8MxRTdFTzr
  R4ONJDYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNaPl4h3Wgo0cFY+6J7E2MB5i72Lk4hASmM0k
  8W3eUiYIZy+jxPZ/O4AcTg42AQ2J3VMvM4PYIgL6Ektn7wGzmQXUJI6+/AlmCwu4SPya+JwFx
  GYRUJV4eLeJEcTmFXCVuPf5F1hcQkBBYsrD98wQcUGJkzOfsEDMkZA4+OIFM0SNksTbS3sYIe
  wKiVmz2pgmMPLOQtIyC0nLAkamVYyWSUWZ6RkluYmZObqGBga6hobGuoa6RkZmeolVuol6qaW
  6yal5JUWJQFm9xPJiveLK3OScFL281JJNjMAQSylkfLSD8fTrD3qHGCU5mJREeW+dkkoU4kvK
  T6nMSCzOiC8qzUktPsQow8GhJMG76ixQTrAoNT21Ii0zBxjuMGkJDh4lEd7XutKJQrzFBYm5x
  ZnpEKlTjIpS4rzLVgD1CYAkMkrz4NpgMXaJUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjBvhQ
  bQeJ7MvBK46a+AFjMBLfYxkARZXJKIkJJqYEplTuIKClje9XxtjnjmB0vJ9TUnGWccubSzkOP
  bzdZNp53yzvS8uRZ9dsZt0dLYumZvgzsh36oeXdcRrvT6ZLB1ln/nw4aTP0PuvOgwfrY+mvmt
  m9yPjM9/QiTYk3riZTPTdH8nHOeQKPWX8uYXrzZ/ZFogJHXG4ttCVUnByyvyPJiaVpgGGpx6z
  OzXYKFX+ECi7sO8u9cnTp9Vqv7tntznhHuCuZduOL+QuPboHMOONyfS9jr+vdOns+j139vKIs
  0HcxcVl3wKm/phcZPigRtft9bo/kh4fHyfJa/y24jJSrOLokP+uCc51yZqcE02jNkRLOC3wET
  j8cmpjC0rZrIu3WWfd1BT8851rRuvIpRYijMSDbWYi4oTAfQQYzAsAwAA
X-Env-Sender: leimaohui@fujitsu.com
X-Msg-Ref: server-17.tower-228.messagelabs.com!1629171300!225103!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24701 invoked from network); 17 Aug 2021 03:35:00 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-17.tower-228.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Aug 2021 03:35:00 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 17H3Yq9V032268
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Aug 2021 04:35:00 +0100
Received: from localhost.localdomain (10.167.225.227) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Tue, 17 Aug 2021 04:34:51 +0100
From: "leimaohui" <leimaohui@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Lei Maohui <leimaohui@fujitsu.com>
Subject: [oe] [meta-oe][PATCH] uim: Dleted takao fonts from DEPENDS.
Date: Tue, 17 Aug 2021 20:34:45 +0800
Message-ID: <1629203685-75382-1-git-send-email-leimaohui@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.227]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

It is odd that specify fonts in uim DEPENDS.

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
---
 meta-oe/recipes-support/uim/uim_1.8.8.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/uim/uim_1.8.8.bb b/meta-oe/recipes-support/uim/uim_1.8.8.bb
index 862250240..18b455ce2 100644
--- a/meta-oe/recipes-support/uim/uim_1.8.8.bb
+++ b/meta-oe/recipes-support/uim/uim_1.8.8.bb
@@ -17,10 +17,10 @@ SRC_URI[sha256sum] = "34599bbcc4e5ab87832370763e38be5100984a64237555e9234a1ea225
 UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
 
 DEPENDS = "anthy fontconfig libxft libxt glib-2.0 ncurses intltool libedit"
-DEPENDS:append:class-target = " intltool-native gtk+ gtk+3 uim-native takao-fonts"
+DEPENDS:append:class-target = " intltool-native gtk+ gtk+3 uim-native"
 
 RDEPENDS:uim = "libuim0 libedit"
-RDEPENDS:uim-anthy = "takao-fonts anthy libanthy0"
+RDEPENDS:uim-anthy = "anthy libanthy0"
 RDEPENDS:uim-anthy:append:libc-glibc = " glibc-utils glibc-gconv-euc-jp"
 
 LEAD_SONAME = "libuim.so.1"
-- 
2.25.1

