Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web12.19462.1630917948515063295
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Sep 2021 01:45:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ICIleM78;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1630917946; i=@fujitsu.com;
	bh=VuxBWzQ/0jLnCDv4OZSHRL6utLupNTYaQWSWAIlLIeo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=ICIleM78dcgzGv6pWDO6OTiPcjSqFnKmrgjKtlhEsSSpzr26ElmkOHtZjkjKLqVKA
	 MdSWYXg63s0xeR35FWjrY5AFnaLl6f5EDJKFNyclCpuMzmg6hvcxS2lnlYPKsdsdWr
	 iAoXousIJF/UtobQqQIqxSy31+joLMl4poDH0DcvddOQ8d96NFSthcgPoriBb+QD+h
	 h7ZKMFaeaqWYNOI70+FrLQ09Qn+Yq6iickSw64QtRWx+MgDtcxx/uTCE0U1glZ4KZd
	 Foe6YqjleOdsXK9jWC3zbd7QHu+87cb0W0vf5p8lt8KrREjuheMR+1xx65aRy8mh85
	 pyVwaJL/9lP6g==
Received: from [100.113.3.182] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-central-1.aws.symcld.net id 8F/6D-23460-A35D5316; Mon, 06 Sep 2021 08:45:46 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprLIsWRWlGSWpSXmKPExsViZ8MRqmt11TT
  R4OJdVYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNaN1yWT2gm8cFWdXt7M0MK7m6GLk4hASmMUk
  sf3yTmYIZzejxKflr9i7GDk52AR0Jc49XgtmiwjoSyydvYcZxBYW8JFY2jWHDcRmEVCR+HD6J
  xOIzSvgIbHt5C2wuISAgsSUh++ZIeKCEidnPmEBsZkFJCQOvngBFOcAqlGUmD1dHqK8QuL14U
  vMExh5ZiHpmIWkYwEj0ypGi6SizPSMktzEzBxdQwMDXUNDY10jXVNDvcQq3US91FLd5NS8kqJ
  EoKReYnmxXnFlbnJOil5easkmRmAYpRQyGe9gvPb6g94hRkkOJiVR3mcHTROF+JLyUyozEosz
  4otKc1KLDzHKcHAoSfBevASUEyxKTU+tSMvMAYY0TFqCg0dJhDf2MlCat7ggMbc4Mx0idYrRm
  OPy9XmLmDlOrlqyiFmIJS8/L1VKnPcwSKkASGlGaR7cIFisXWKUlRLmZWRgYBDiKUgtys0sQZ
  V/xSjOwagkzPsfZApPZl4J3L5XQKcwAZ3S9tAE5JSSRISUVANTheOxjufuvbqyj+3C9me6Gzz
  Jz/+y8N6hXr22qTkX3vjozas9GLf8Xqemv5bgdRXve2mHprX47ZmwtVHr4MxmDZs/MxTUln43
  r6hmman/edW2IIutyZ+vHLuwt14p1Prcmbo79R+WX/5fzHn61f6okwqnd0lXpfK7yETePqdt4
  +d/JzNns8TbxPP2hTv/fKlh2dhj9/i9i27v685al23tG147rTi2O33lkc3iWZdTp62/oK6Yqj
  xdJbF5n58Vp0hKx2PfYM5TBkxbWCTO83/uufvBbuMHlsuv72ZNl5FpuHLjuK3D07cf/574FZK
  5cXnGVBnXQwu54me88ivf2vG93O+M5okViokyBqwrZ7DoK7EUZyQaajEXFScCAC/mEj8wAwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-4.tower-226.messagelabs.com!1630917946!234584!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9033 invoked from network); 6 Sep 2021 08:45:46 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-4.tower-226.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 6 Sep 2021 08:45:46 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1868jksp023911
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Mon, 6 Sep 2021 09:45:46 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Mon, 6 Sep 2021 09:45:44 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] xf86-video-nouveau: upgrade 1.0.16 -> 1.0.17
Date: Sun, 5 Sep 2021 13:56:13 +0800
Message-ID: <1630821373-49004-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...86-video-nouveau_1.0.16.bb => xf86-video-nouveau_1.0.17.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/xorg-driver/{xf86-video-nouveau_1.0.16.bb => xf86-video-nouveau_1.0.17.bb} (77%)

diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-nouveau_1.0.16.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-video-nouveau_1.0.17.bb
similarity index 77%
rename from meta-oe/recipes-graphics/xorg-driver/xf86-video-nouveau_1.0.16.bb
rename to meta-oe/recipes-graphics/xorg-driver/xf86-video-nouveau_1.0.17.bb
index fb24c63847..d9d09a242f 100644
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-video-nouveau_1.0.16.bb
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-nouveau_1.0.17.bb
@@ -15,5 +15,4 @@ REQUIRED_DISTRO_FEATURES += "opengl"
 
 COMPATIBLE_HOST = '(i.86|x86_64).*-linux'
 
-SRC_URI[md5sum] = "ecd9be89d853301167e3d564c49f7a8e"
-SRC_URI[sha256sum] = "304060806415579cdb5c1f71f1c54d11cacb431b5552b170decbc883ed43bf06"
+SRC_URI[sha256sum] = "499322e27a55c8183166bf2dd1e47d085eb834143e0d7036baba8427b90c156b"
-- 
2.25.1

