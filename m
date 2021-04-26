Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.5])
 by mx.groups.io with SMTP id smtpd.web08.4134.1619425319634229339
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Apr 2021 01:22:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=RVGtyCMM;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.5, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1619425318; i=@fujitsu.com;
	bh=evdUUttL/CIGd96ug5TsqfhT9utvPspcw5UKk4YHQJk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=RVGtyCMMqQ5KaCk28XVoU89mAFWS2guSHcXe1MxNrWVj5Ia9hSe5TgfGs/+0aV9pr
	 r+fV/t9sop7Qm7frREJqh0rrrLYGug3TF9jy7KUKGaNnZbGzCJ3b12VOu56n/Y/b9y
	 SOYSQ+whlFp4GBmXyWQtSN3jIvELNPUWTmGSkUESnUJAt4+fU4DGiP8Yt3dn0Y/eON
	 5sKjIp/3H2TGGMJfRme0xTTZDpUslpfgaGwqg1/3rvYIxFeQRX0KhXy6++BPHJdJeO
	 lxbX7DtXTH9k8W7//xrfA2wI+A79X8uCi8INqJuWCpwQVf1OuBEHn7NdZ2PFsHXq/6
	 6W7Cs3s4iSgNg==
Received: from [100.112.193.211] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-a.eu-west-1.aws.symcld.net id 19/03-01834-62876806; Mon, 26 Apr 2021 08:21:58 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeJIrShJLcpLzFFi42Kxs+EI1VWtaEs
  w+P3dyOLi4aXMDowe5zauYAxgjGLNzEvKr0hgzfjQvI2l4ApnxbbnzYwNjHc4uhi5OIQEZjNJ
  fNv0ignC2c0o8e/XWZYuRk4ONgFdiXOP17KD2CIC+hJLZ+9hBrGFBdwl5k/bxwZiswioSrxcc
  wAszivgIdGw4ymYLSGgIDHl4XuouKDEyZlPwGYyC0hIHHzxAijOAVSjKDF7ujxEeaXE9mlnGS
  cw8sxC0jELSccCRqZVjBZJRZnpGSW5iZk5uoYGBrqGhka6hpZAbGKil1ilm6iXWqpbnlpcomu
  ol1herFdcmZuck6KXl1qyiREYRikFBybsYNz/+oPeIUZJDiYlUV6h7LYEIb6k/JTKjMTijPii
  0pzU4kOMMhwcShK87uVAOcGi1PTUirTMHGBIw6QlOHiURHi1i4DSvMUFibnFmekQqVOMilLiv
  CkgfQIgiYzSPLg2WBxdYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTMmw4yhSczrwRu+iugxU
  xAi/nqWkEWlyQipKQamFKkFJrUb0lIXl35hvMD02XDB4pzC59VVvvqCzUK7H63eU/vWm/bd3O
  d7wjt6E98c3fGZYlrr5/7/8lgd3y8ba7Pv0lmzCXRPk+ncmwXCjO5cS6Bf/Fy1raooEXHDs3a
  vXFtTf/rldUONXontus+EHy2UPL6fOGMBfz3E4Me+Wtuqutj63rg6bret8N8J2/7867TrnevL
  FMyOdjyJTf3Eo9P2qEEocjVjgK2YtHXbQ+vtd3xLWnXdcvd980Ftm7as5P11bETft8qlAT74+
  0OqyfVqp2S7z3cpLdgh8ryeRI8B5bruPgIdkiYrU8JuLK5/7fMo583M9wS952RWFThGJ449/q
  DfH52/WafLz/dLZVYijMSDbWYi4oTAaRDdQweAwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-15.tower-271.messagelabs.com!1619425317!2191997!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19676 invoked from network); 26 Apr 2021 08:21:57 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-15.tower-271.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 26 Apr 2021 08:21:57 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 13Q8Lv5a029004
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Mon, 26 Apr 2021 09:21:57 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 26 Apr 2021 09:21:56 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-webserver] [PATCH] hiawatha: upgrade 10.11 -> 10.12
Date: Mon, 26 Apr 2021 16:21:40 +0800
Message-ID: <1619425300-76577-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../hiawatha/{hiawatha_10.11.bb => hiawatha_10.12.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-webserver/recipes-httpd/hiawatha/{hiawatha_10.11.bb => hiawatha_10.12.bb} (94%)

diff --git a/meta-webserver/recipes-httpd/hiawatha/hiawatha_10.11.bb b/meta-webserver/recipes-httpd/hiawatha/hiawatha_10.12.bb
similarity index 94%
rename from meta-webserver/recipes-httpd/hiawatha/hiawatha_10.11.bb
rename to meta-webserver/recipes-httpd/hiawatha/hiawatha_10.12.bb
index 89910841f6..9729fd4a80 100644
--- a/meta-webserver/recipes-httpd/hiawatha/hiawatha_10.11.bb
+++ b/meta-webserver/recipes-httpd/hiawatha/hiawatha_10.12.bb
@@ -10,8 +10,8 @@ SRC_URI = "http://hiawatha-webserver.org/files/${BP}.tar.gz \
            file://hiawatha-init \
            file://hiawatha.service "
 
-SRC_URI[md5sum] = "6dcec72e94facbdc69b103006fa5819f"
-SRC_URI[sha256sum] = "79d85d165d68dd7043bbd337f5bc7dd10d8632d68ba61d0e557f84bd687c9727"
+SRC_URI[md5sum] = "d9e282be06ed456207726b7ac0df9d48"
+SRC_URI[sha256sum] = "61bf41146c51244769984135529fcffd0f6cb92be18dc12d460effc42f19f50d"
 
 INITSCRIPT_NAME = "hiawatha"
 INITSCRIPT_PARAMS = "defaults 70"
-- 
2.25.1

