Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web08.5625.1625450071829622282
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Jul 2021 18:54:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=AWM4I784;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1625450069; i=@fujitsu.com;
	bh=0bho/UsmvlyvWrDZ/LSc/PAXvXXPoT/FryO2MBXC0mE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=AWM4I784k0QQDIhQ4BApAFbd8FdnNpbx7AmD4YZnTz+tvMqK2czqaczHZqIohgmHB
	 ByFJlQQPqZv8R3kelkifn6sLH5nC1lU/6ODO+P6tppA7PawmB/uMMCIPJiWh2eOtMu
	 yI7JHwsHF0zubx/Il+dA1WhVwOKLz5MKOPt5YqlYIMut/JrI8MGRhcI7gEGfX2qbu5
	 XIrkfqdVGMnqN+OHj39syF1MgdQZCaaJRB+CIC4kknWcyocHSkDw2K5V1K6mLYdj61
	 G6I/KGT7KqGf7NppGFOyLdJb3iwnhOMA6GmvqYvPPrcpT/FbM6tQICgXTIGrQdhBNh
	 /CJz9l5cAJEvQ==
Received: from [100.112.197.63] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-b.eu-west-1.aws.symcld.net id E4/BB-03155-45662E06; Mon, 05 Jul 2021 01:54:28 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphkeJIrShJLcpLzFFi42Kxs+EI1Q1Je5R
  gcOuVjMXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmvH8xmG2gr8cFR8ub2VtYFzK0cXIxSEkMItJ
  ovnlFTYI5zijxMTefUAOJwebgI5Ex4tuFhBbREBfYunsPcwgtrCAh8S/SZ2sIDaLgIrEiU9H2
  EFsXqD4+ylrwWwJAQWJKQ/fM0PEBSVOznwCNodZQELi4IsXzBA1ihLbd55hgbArJGbM2MY2gZ
  FnFpKWWUhaFjAyrWK0SCrKTM8oyU3MzNE1NDDQNTQ00jW0tNA1MjTVS6zSTdJLLdUtTy0u0TX
  USywv1iuuzE3OSdHLSy3ZxAgMpJSCY9d3MF59/UHvEKMkB5OSKO8mzUcJQnxJ+SmVGYnFGfFF
  pTmpxYcYZTg4lCR4q5KBcoJFqempFWmZOcCghklLcPAoifAmxwGleYsLEnOLM9MhUqcYFaXEe
  VlSgRICIImM0jy4NlgkXWKUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzHsXZApPZl4J3PRXQI
  uZgBbfPPcQZHFJIkJKqoEpQVih7sIyuXm/bQrKzwk4cT0LfhOvxvjxmHngjkUP//d7rujeOCn
  Sz8mw4GVstp5E3xq5+Fvu87k059W2Vxj/Kj9kteVn5ZLgK8f/fedwX3nB+v7BpF1htzoXF3aJ
  /I36vunJy6rEutIkgc2P1c5YfiuLnXZf+tbOD7Wvbxccn5u4s4Tj66XbrvsXhMkuZOW9MeF7r
  yVfQkTo4drEI2dcUy4t/nbkuFTHfNc5n3faO9zYGLRA5vFzOT0VIea/b+OmK8ubsDPzTjc/3r
  b/2Mmpi888KWjw/Cp0kl3l2ZrTHElHt8Xv2OG+z3NGZ5eR/OG/M51U4/0Sgx7yWbGe03utrCL
  /pmD154hDKw+enjTFVYmlOCPRUIu5qDgRAHSdACkfAwAA
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-6.tower-291.messagelabs.com!1625450068!195895!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10344 invoked from network); 5 Jul 2021 01:54:28 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-6.tower-291.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 5 Jul 2021 01:54:28 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1651sMGp006560
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Mon, 5 Jul 2021 02:54:28 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Mon, 5 Jul 2021 02:54:21 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-gast: upgrade 0.4.0 -> 0.5.0
Date: Mon, 5 Jul 2021 09:54:14 +0800
Message-ID: <1625450054-114775-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../python/{python3-gast_0.4.0.bb => python3-gast_0.5.0.bb}    | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-gast_0.4.0.bb => python3-gast_0.5.0.bb} (69%)

diff --git a/meta-python/recipes-devtools/python/python3-gast_0.4.0.bb b/meta-python/recipes-devtools/python/python3-gast_0.5.0.bb
similarity index 69%
rename from meta-python/recipes-devtools/python/python3-gast_0.4.0.bb
rename to meta-python/recipes-devtools/python/python3-gast_0.5.0.bb
index 7ef2eb4681..9908950dc1 100644
--- a/meta-python/recipes-devtools/python/python3-gast_0.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-gast_0.5.0.bb
@@ -4,8 +4,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3ad9b6802e713fc5e307e1230f1ea90"
 
-SRC_URI[md5sum] = "d1f258eb70bb916f8fe5535351d5ff05"
-SRC_URI[sha256sum] = "40feb7b8b8434785585ab224d1568b857edb18297e5a3047f1ba012bc83b42c1"
+SRC_URI[sha256sum] = "8109cbe7aa0f7bf7e4348379da05b8137ea1f059f073332c3c1cedd57db8541f"
 
 inherit pypi setuptools3
 
-- 
2.25.1

