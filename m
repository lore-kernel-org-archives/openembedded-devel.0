Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.116])
 by mx.groups.io with SMTP id smtpd.web10.1244.1622078810147934607
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 May 2021 18:26:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=q/OpUfLy;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.116, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1622078808; i=@fujitsu.com;
	bh=dHMUKwbq1eClwrT7QuNL/of0glJdaW24rB6UfJ+hCbA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=q/OpUfLyk0LmAteRX7sgtSROUcKnkNT/g8hCjKHmE8K/TObV6sQtrRC6hxERG8F1b
	 H1zZlZeawxAYy1W9iwRsfWcfbGW8pDuX3hefThYRFN40is5waM/h+xgICRNGY1c4zx
	 eGXlZvOtLf8W6bbg7XGuPI46e9SOFvfVaTui3kSOKD/1CunKrAXZrPH1BNFXwm/+cH
	 AKQOX9zdwuB8Kl+79FiXJAFK0BAXo1kzXl7vPLp6zPj4w7teFYdl5XF0S3b3YKUvnn
	 O/eRcDA1sRvlpwL2A15cOC1XmYyI/BdbILPQoqaJmkKxlk29/thonCzt1FhdArW/Fg
	 7gFQpipxlUPwg==
Received: from [100.113.5.216] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-b.eu-central-1.aws.symcld.net id 46/4B-14259-755FEA06; Thu, 27 May 2021 01:26:47 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupikeJIrShJLcpLzFFi42Kxs+GYohv+dV2
  CwYzpYhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8ajV02sBWu4Ko7fP8DYwNjH2cXIxSEkMJtJ
  4vnPTyxdjJxAzh5GiSUfxEBsNgFdiXOP17KD2CIC+hJLZ+9hBrGFBewk+p9tArNZBFQl3u54C
  mRzcPAKeEqc2iMDEpYQUJCY8vA9WAmvgKDEyZlPwMYzC0hIHHzxAqxcQkBRYvZ0eYjyCokZM7
  axTWDkmYWkYxaSjgWMTKsYLZOKMtMzSnITM3N0DQ0MdA0NjXVNdY1MDPUSq3ST9FJLdZNT80q
  KEoGyeonlxXrFlbnJOSl6eaklmxiBQZRSyPpxB+Oh1x/0DjFKcjApifJeO7EuQYgvKT+lMiOx
  OCO+qDQntfgQowwHh5IE78cvQDnBotT01Iq0zBxgQMOkJTh4lER4G18DpXmLCxJzizPTIVKnG
  BWlxHmzQPoEQBIZpXlwbbAousQoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmHcHyBSezLwSuO
  mvgBYzAS0WSgRbXJKIkJJqYLLh/LzKWnn37g/X0x8sPCkQbJPMUJLudCnUTFzc8e9TQ6VF/On
  WNa9EY9ofadRMi0gVbmD6UShqmr0ng/uF0PNNuybaz+Cvk2MQ3at056rBCV6lxw9qrK9WzXA8
  uLusIaTyXDPr4y8MPB4xS2ftDvp7hZftl9c514o59RI/bW6w6ao+usj2aVZxg/FK4/vbjlp1L
  pB+1fbiNecXFuZ1j7Wa4hxfcuo2mjLYixWv6s12c4r+P/1x7NlS+czdHw1PGj8qu2Dd2KLNOM
  n2vLFKWMva1+HKbh+NrOSW3xL9ukT79VoPK35BwQ+XX8zIZZAWOxRuOXl6t9hmk6T4R2ln1fR
  uTSkvy7r4Ttfq7t18JZbijERDLeai4kQAoWxB2R0DAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-14.tower-238.messagelabs.com!1622078806!53901!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8021 invoked from network); 27 May 2021 01:26:47 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-14.tower-238.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 27 May 2021 01:26:47 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 14R1QkVd006627
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 27 May 2021 02:26:46 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 27 May 2021 02:26:45 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] gensio: upgrade 2.2.5 -> 2.2.6
Date: Thu, 27 May 2021 09:26:35 +0800
Message-ID: <1622078795-116508-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Because v2.2.6 commit can't be found on any branch, download it through tar package.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../gensio/{gensio_2.2.5.bb => gensio_2.2.6.bb}             | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-connectivity/gensio/{gensio_2.2.5.bb => gensio_2.2.6.bb} (80%)

diff --git a/meta-oe/recipes-connectivity/gensio/gensio_2.2.5.bb b/meta-oe/recipes-connectivity/gensio/gensio_2.2.6.bb
similarity index 80%
rename from meta-oe/recipes-connectivity/gensio/gensio_2.2.5.bb
rename to meta-oe/recipes-connectivity/gensio/gensio_2.2.6.bb
index 271a668751..368861060d 100644
--- a/meta-oe/recipes-connectivity/gensio/gensio_2.2.5.bb
+++ b/meta-oe/recipes-connectivity/gensio/gensio_2.2.6.bb
@@ -5,11 +5,9 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=a0fd36908af843bcee10cb6dfc47fa67 \
                     file://COPYING;md5=bae3019b4c6dc4138c217864bd04331f \
                     "
 
-SRCREV = "ed307629e067a9ef55d79beec9c9f67b86efbaaf"
+SRC_URI = "https://github.com/cminyard/gensio/archive/refs/tags/v${PV}.tar.gz"
 
-SRC_URI = "git://github.com/cminyard/gensio;protocol=https;branch=2.2.x"
-
-S = "${WORKDIR}/git"
+SRC_URI[sha256sum] = "9102ca66cd71d24e07b98187dfd0d60059e6e79f1a200f377ec65b478e9e8444"
 
 inherit autotools
 
-- 
2.25.1

