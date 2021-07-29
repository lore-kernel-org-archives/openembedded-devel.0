Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.3])
 by mx.groups.io with SMTP id smtpd.web09.6613.1627545272461063290
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Jul 2021 00:54:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=G8G+E6Le;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.3, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1627545270; i=@fujitsu.com;
	bh=ZoY3PPAiQDWh5oaJR8fdkMsgH7uYxIWzxVou20jVQ20=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=G8G+E6LeBkVXHYRBzgtsWT5lTnRSKM/2j6bZVvCqLA1jMk7uiBQmT0SuCYuxK/iF2
	 xybsqrNS+MIuU7G357ZY+bANQESOeS568DmONaN31YlBB+n9y3HaGG7MeYEH2Q4tsx
	 uHwg8Rx7iRmcqzpooLR/cuAvbR4YSWpsaNe4E9F/1cmxLl0RiaEbY0uVNleXpEL//c
	 70ixJI0htE9nOmEyLLdshYSHa6EsSehp8zkUS5xLnX4BVHyfAcBZrzPIbg6aArZBJj
	 F2aIrsLiLNQltMyJMZFHPVrKtBY9sIWUNyPTRLEEIrY59gFFr6AZeyCmPDyW1O8Qyv
	 dqOJvFOVd6eYA==
Received: from [100.113.1.143] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-central-1.aws.symcld.net id C5/47-07651-6BE52016; Thu, 29 Jul 2021 07:54:30 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeJIrShJLcpLzFFi42Kxs+EI1d0Wx5R
  oMO0Ji8XFw0uZHRg9zm1cwRjAGMWamZeUX5HAmvF/jmHBQs6Ko78+MTUwHuboYuTiEBKYzSSx
  6eNaFghnD6PEy6ntbF2MnBxsAroS5x6vZQexRQT0JZbO3sMMYgsLeEm0nnsKFmcRUJXY8fwoK
  4jNK+AhcfXqV7C4hICCxJSH75kh4oISJ2c+YQGxmQUkJA6+eAEU5wCqUZSYPV0eorxC4vXhS8
  wTGHlmIemYhaRjASPTKkbLpKLM9IyS3MTMHF1DAwNdQ0NjXQNdI1MjvcQq3US91FLd5NS8kqJ
  EoKxeYnmxXnFlbnJOil5easkmRmAYpRQy/NnBuPrNB71DjJIcTEqivL/smBKF+JLyUyozEosz
  4otKc1KLDzHKcHAoSfAGxgLlBItS01Mr0jJzgCENk5bg4FES4X0eDZTmLS5IzC3OTIdInWJUl
  BLnfRgDlBAASWSU5sG1weLoEqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVhXi+Q7TyZeSVw01
  8BLWYCWlxbwgiyuCQRISXVwDTx+Ju0tbePndFabH/zuKQT+5dXNxgfdTPJBM+/YFA+VePeyfU
  7d7svSRcTaI0OOG/VY/7zh+kbyY3Ku/YsmclQ/ShpyrZN86L+WoYKdKzLmf9KJmSB7s2L4d/0
  1AXNP0QX6hQcLTE88dj96OurTBzXnC9qq4l375/F3fJqwUO7VZ5foq96PG6XvcMTMOu14Y/UG
  y26MVUdhT/ZVR4kTmCWad34a225ds4knlT907d+pN2/xKksn8oa2n7yVCBb5otVCdyyNtqphm
  p7DgnadfZV3IupUo68ZSu2hWHCZtOak1ZLudf+UuXS/vGWY6XUt6jbR+5FxmquOTYhSOeXGeP
  G3/OP3Jc/cLPGYOvi0o9KLMUZiYZazEXFiQAL0fD3HgMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-8.tower-228.messagelabs.com!1627545269!145981!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10948 invoked from network); 29 Jul 2021 07:54:29 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-8.tower-228.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 29 Jul 2021 07:54:29 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 16T7sTLX024495
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 29 Jul 2021 08:54:29 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 29 Jul 2021 08:54:27 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-perl] [PATCH] libdbd-sqlite-perl: upgrade 1.66 -> 1.68
Date: Thu, 29 Jul 2021 15:54:19 +0800
Message-ID: <1627545259-24441-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../{libdbd-sqlite-perl_1.66.bb => libdbd-sqlite-perl_1.68.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libdb/{libdbd-sqlite-perl_1.66.bb => libdbd-sqlite-perl_1.68.bb} (90%)

diff --git a/meta-perl/recipes-perl/libdb/libdbd-sqlite-perl_1.66.bb b/meta-perl/recipes-perl/libdb/libdbd-sqlite-perl_1.68.bb
similarity index 90%
rename from meta-perl/recipes-perl/libdb/libdbd-sqlite-perl_1.66.bb
rename to meta-perl/recipes-perl/libdb/libdbd-sqlite-perl_1.68.bb
index aef1d348c6..b52a366861 100644
--- a/meta-perl/recipes-perl/libdb/libdbd-sqlite-perl_1.66.bb
+++ b/meta-perl/recipes-perl/libdb/libdbd-sqlite-perl_1.68.bb
@@ -14,8 +14,7 @@ SRC_URI = "${CPAN_MIRROR}/authors/id/I/IS/ISHIGAKI/DBD-SQLite-${PV}.tar.gz \
            file://sqlite-perl-test.pl \
 "
 
-SRC_URI[md5sum] = "38581209de5c981f0e79840c8937fa16"
-SRC_URI[sha256sum] = "89e75dff9f66c273e0e459d51f151f88960eb7d82e2821e6902f18688ba592fe"
+SRC_URI[sha256sum] = "0e84e831a50d547d2e634b66650455f1791f223495c9138db82d42360c691e61"
 
 UPSTREAM_CHECK_REGEX = "DBD\-SQLite\-(?P<pver>(\d+\.\d+))(?!_\d+).tar"
 
-- 
2.25.1

