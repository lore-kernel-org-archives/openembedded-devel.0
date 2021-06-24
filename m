Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web08.1527.1624500078471840703
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Jun 2021 19:01:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=yREGrCYx;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1624500075; i=@fujitsu.com;
	bh=N7OgQKvs4/VpkbZKhEkHMVt2BpeNI5olbvXiHo+wckY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=yREGrCYxB3JIQJvhN/Che3uizy6BkPNYuq/Ytj1zzH/3j5si1f/HPV/q8xvD7UFlp
	 2akOlsbdIjW6UFVfyH5aRM2n9JwRZIhkxwmX63ZsxFu60504qH1Hwk9Tns14cyDH2C
	 0q/POkX3PeVapfy/bDJnBtbzNEIND8hBL1N98Ab/ey/yLi/yWizM+6aTh/68SV+lFj
	 KmqYfM6Rv+cdjzUc3JsIDQ0qS48lFvhahyhsAVr8HmS4vnHSXTPVVDtY9t1TDjAAOl
	 QfQRDk7lWkQjS4072vg2rdWnw+dWeBPQ2Ju85NoLZvQezLckm3NwXlVl7J2FR8qBgT
	 ipfqXmLpDO/yg==
Received: from [100.113.7.10] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-b.eu-central-1.aws.symcld.net id 68/24-33341-B67E3D06; Thu, 24 Jun 2021 02:01:15 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeJIrShJLcpLzFFi42Kxs+GYopv9/HK
  CwfJeUYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePq0rusBes4KxZf/cnawHiBo4uRi0NIYDaT
  xPTtF5khnD2MEk8OvmPqYuTkYBPQlTj3eC07iC0ioC+xdPYeZhBbWMBR4v6Zw2A2i4CqxO6Zk
  1m6GDk4eAU8JNb31oOEJQQUJKY8fA9WwisgKHFy5hMWEJtZQELi4IsXzCDlEgKKErOny0OUV0
  jMmLGNbQIjzywkHbOQdCxgZFrFaJlUlJmeUZKbmJmja2hgoGtoaKxrrmtkbKiXWKWbpJdaqpu
  cmldSlAiU1UssL9YrrsxNzknRy0st2cQIDKOUQvbnOxhXvfmgd4hRkoNJSZS3tP1yghBfUn5K
  ZUZicUZ8UWlOavEhRhkODiUJXolnQDnBotT01Iq0zBxgSMOkJTh4lER4LZ8ApXmLCxJzizPTI
  VKnGBWlxHkfPwVKCIAkMkrz4NpgcXSJUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjBvG8gUns
  y8Erjpr4AWMwEtVvh9EWRxSSJCSqqBKfjH+jMrdz5lFH7b07R2U+fd8M7yCoN/D4+yzOWL4/l
  wwNTxTE6cqk5TT+THc+vvST/mf32BaXdYYK9qp+3Be459K4I/37A4rfakNdKCf98T5cdrVtvX
  XdxcHDilOrDMaYtWomFPsjKrY1mTosjEtNOHzxloqHArTQ6ab21XbH/0QaPX3KbdMfkTpYwn7
  TyxeMZ1zdOvzyl8Yn3gaLP2yCf+1VteXVhTpXLJ/Z7T/bBUzemf+0TEpq/fWuzIJ3RaJEjm1w
  +5BaKN/wwX8FjLSZ3bc6GKvb5Stpph1tdD9T+Tpkf8/Cq/0VP311cj/p8b7nRf9XgpW7H9nOK
  JowncCVYMOya4pbqF6H1znlJfpcRSnJFoqMVcVJwIAEs04V8eAwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-19.tower-238.messagelabs.com!1624500074!52630!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14865 invoked from network); 24 Jun 2021 02:01:15 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-19.tower-238.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Jun 2021 02:01:15 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 15O21EHJ006373
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Jun 2021 03:01:14 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 24 Jun 2021 03:01:13 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] libconfig: upgrade 1.7.2 -> 1.7.3
Date: Thu, 24 Jun 2021 10:01:06 +0800
Message-ID: <1624500066-82530-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../libconfig/{libconfig_1.7.2.bb => libconfig_1.7.3.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/libconfig/{libconfig_1.7.2.bb => libconfig_1.7.3.bb} (82%)

diff --git a/meta-oe/recipes-extended/libconfig/libconfig_1.7.2.bb b/meta-oe/recipes-extended/libconfig/libconfig_1.7.3.bb
similarity index 82%
rename from meta-oe/recipes-extended/libconfig/libconfig_1.7.2.bb
rename to meta-oe/recipes-extended/libconfig/libconfig_1.7.3.bb
index a4a2581458..3d87e44817 100644
--- a/meta-oe/recipes-extended/libconfig/libconfig_1.7.2.bb
+++ b/meta-oe/recipes-extended/libconfig/libconfig_1.7.3.bb
@@ -14,8 +14,8 @@ UPSTREAM_CHECK_REGEX = "Version (?P<pver>\d+(\.\d+)+)"
 
 inherit autotools-brokensep pkgconfig
 
-SRC_URI[md5sum] = "6bd98ee3a6e6b9126c82c916d7a9e690"
-SRC_URI[sha256sum] = "7c3c7a9c73ff3302084386e96f903eb62ce06953bb1666235fac74363a16fad9"
+SRC_URI[md5sum] = "15ec701205f91f21b1187f8b61e0d64f"
+SRC_URI[sha256sum] = "545166d6cac037744381d1e9cc5a5405094e7bfad16a411699bcff40bbb31ee7"
 
 PACKAGE_BEFORE_PN = "${PN}++"
 FILES_${PN}++ = "${libdir}/${BPN}++*${SOLIBS}"
-- 
2.25.1

