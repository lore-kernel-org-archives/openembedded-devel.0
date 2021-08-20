Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.4])
 by mx.groups.io with SMTP id smtpd.web09.80769.1629439895397916854
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Aug 2021 23:11:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=DmtSBK+q;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.4, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1629439891; i=@fujitsu.com;
	bh=XoDd5FMMmxbt8lQpOTp8y/vQL1ndF1m+liHoXvH3+2s=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=DmtSBK+q9ydFBrAe8Fli0ya+0+duC6tlSWIvtDRm8XJoAQ7GBDUoGkWNDB93QuLGV
	 etyXI8irLHFh8+2Rz6BCG6FW7Spl/fd3W4ob8EehTIpaLe+3RTCmzRaGggqmXM4cjg
	 yVSv4pPDc9gI6NBOorvp7xPxIsZef3UriVYwdGCO7WB+P0a5I7rx/n9AsVpwjxQVRf
	 jac10/Y+e21uapDOhZ1Au6V2uvJALF8McHWn9VCtRt/xTcooCllJagEd1aCMkpA/QA
	 SQQlN/Euy1wlsCYiwcgwGWvKCl2o6cB0Y2gzUr6ceTK2J4VNDTf1EdX7xlzlsmudSF
	 OPUAvmdfyKHGw==
Received: from [100.113.0.182] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-central-1.aws.symcld.net id 25/FA-31171-2974F116; Fri, 20 Aug 2021 06:11:30 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBIsWRWlGSWpSXmKPExsViZ8MxVXeSu3y
  iwb9fghYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bvz3YFJzgqLl6aytbA+IK9i5GLQ0hgNpPE
  6nf/oZwTjBITFp5l7GLk5GATUJOYfusGK4gtIqAvsXT2HmYQm1lAReLF7x52EFtYwF9i6ulHY
  PUsAqoSb7u3gNm8Ak4SW5oWgPVKCChITHn4nhkiLihxcuYTFog5EhIHX7xghqhRlJh9uZkFwq
  6QmDWrjWkCI+8sJC2zkLQsYGRaxWiZVJSZnlGSm5iZo2toYKBraGisa6hrZGyml1ilm6iXWqq
  bnJpXUpQIlNVLLC/WK67MTc5J0ctLLdnECAywlELGNzsYv77+oHeIUZKDSUmUV9VMPlGILyk/
  pTIjsTgjvqg0J7X4EKMMB4eSBG+UK1BOsCg1PbUiLTMHGOwwaQkOHiUR3mJnoDRvcUFibnFmO
  kTqFKOilDhvpxtQQgAkkVGaB9cGi7BLjLJSwryMDAwMQjwFqUW5mSWo8q8YxTkYlYR514JM4c
  nMK4Gb/gpoMRPQYiFVWZDFJYkIKakGJsbSdfk3Ts81PulRF/Zg3QWXC6K7r2se3laZ8jompDV
  GKGPe8etpdw9cuMa44tIPIe6ygi/h3x/4dE/mvplq6DmX+dVx4bs9MvUxf5vjZoX8vbO84sP1
  a6t+ldfOnM37J2jZNgfLOmaVG0WmvY76+vx7a77sT0rs2Lc996n+vELRXR8Wx9/s+r/3jWHL+
  1/P3zpPjbg4R0e/hP+IvEuLoN6GpM77a2xX20/vfyrT8WF+mWa/xz22p99/H974sWqPIP/Blb
  urvmft35Hk/zm3p9ls4vsS01fpuZ8PNOo/Np4+J/3fjQfO/vrsk9/nB3feXR/3So3r6cy9q6U
  exy90z+kPYtTUmpQTtMljaln+PnElluKMREMt5qLiRAD33L6EKwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-23.tower-228.messagelabs.com!1629439889!55122!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9468 invoked from network); 20 Aug 2021 06:11:30 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-23.tower-228.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 20 Aug 2021 06:11:30 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 17K6BTkg013214
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 20 Aug 2021 07:11:29 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Fri, 20 Aug 2021 07:11:27 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] ctags: upgrade 5.9.20210801.0 -> 5.9.20210815.0
Date: Fri, 20 Aug 2021 14:11:09 +0800
Message-ID: <1629439871-46349-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

SQL: fix a typo in the code deciding a promise area

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_5.9.20210801.0.bb => ctags_5.9.20210815.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_5.9.20210801.0.bb => ctags_5.9.20210815.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_5.9.20210801.0.bb b/meta-oe/recipes-devtools/ctags/ctags_5.9.20210815.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_5.9.20210801.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_5.9.20210815.0.bb
index b6fdad27cb..1d8a7ecf6f 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_5.9.20210801.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_5.9.20210815.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "6544786c167ed3149d56e1ffe740c70513762197"
+SRCREV = "24f852441bb12e2cfe4f6066bf85827b934e1469"
 SRC_URI = "git://github.com/universal-ctags/ctags"
 
 S = "${WORKDIR}/git"
-- 
2.25.1

