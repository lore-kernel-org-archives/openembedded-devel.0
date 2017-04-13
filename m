Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id CE32B77E3E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Apr 2017 15:08:23 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id o126so11302001pfb.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Apr 2017 08:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=vXYhiP3XVOJbOpXCDjSoj7cLPzoG7XEhWFWYkQL3HDo=;
	b=HzvRxV8EvwhwDgjFcbvxd1u6jpDaqiGcZ/Pzf6T21EICk/ZwHYE1KwLulAR+aqwRx4
	O7gIcayQ3dFs02I2pEgYcX1z6G8uXRCCPo0hjJjdxxz0yROJQWulFkRtAxkZegJCnQ9O
	XpMddkIlTVJorMMmaRcDYGKPA4g3AWUu8ZhprMnY+tkc51gvfBqH1AO5dPT6b/MrRg3V
	UYREuubsAXGUa6JSXG9KE6U0r3IK4AQw3MwGGrtbBDuU5Zdiu0blhiE29kBhvkNvOxJX
	RBfco615R4rlx29xunhtYDQU0etB/bdK3ZTzIILhBw061H2riWwc5KL+9t5taJgTv3TK
	cLtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=vXYhiP3XVOJbOpXCDjSoj7cLPzoG7XEhWFWYkQL3HDo=;
	b=L4VDIqbpdnTXhqv7Lp40J112tDaO+FvuKl+JOKciAVyLwdzfxNQbp7k3yIu0Jd1wLZ
	3Rq99Ei3N7ua4JqjmZYcGP0b8Ab5SwJFjoB2fVFuyx0nOfBoHHG2pemkiCTh1KX59ptC
	iN0WKn6HLqVZRlmRJYEdk1FhCzYSPQZ8iNEznRcc84Ot1+RgEMN3bZSg9cUIYnLkkx0z
	e6UqFC0iOu/SquCCaDA7DGZ4+1HBtK7gzEpMFdK2IUasN2JWy0iTWPZz8I8KeqaM4p9y
	AjRLsXHHFg7VGUgIxRpvvA4gHseN4arRBRTvujoon3SCDLGgScWU2UGS34ZFV5guOL7V
	D+2A==
X-Gm-Message-State: AN3rC/7e9Rtpq2ZztiF8nw6AC/3iY/BI6gxcLj8Ni24qZjKX2NP1n0ee
	fgzyNCqfvwvP7PIa
X-Received: by 10.99.209.85 with SMTP id c21mr3972539pgj.147.1492096104871;
	Thu, 13 Apr 2017 08:08:24 -0700 (PDT)
Received: from akuster-ThinkPad-X240.hsd1.ca.comcast.net
	([2601:202:4001:9ea0:e3df:bf0a:9f90:498e])
	by smtp.gmail.com with ESMTPSA id
	n65sm43226056pga.8.2017.04.13.08.08.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 13 Apr 2017 08:08:23 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-devel@lists.openembedded.org
Date: Thu, 13 Apr 2017 08:08:22 -0700
Message-Id: <1492096102-2654-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-networking][PATCH] wireshark: update to 2.2.6
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Apr 2017 15:08:24 -0000

From: Armin Kuster <akuster@mvista.com>

The following vulnerabilities have been fixed:
* [1]wnpa-sec-2017-12
  IMAP dissector crash ([2]Bug 13466) [3]CVE-2017-7703
* [4]wnpa-sec-2017-13
  WBMXL dissector infinite loop ([5]Bug 13477) [6]CVE-2017-7702
* [7]wnpa-sec-2017-14
  NetScaler file parser infinite loop ([8]Bug 13478) [9]CVE-2017-7700
* [10]wnpa-sec-2017-15
  RPCoRDMA dissector infinite loop ([11]Bug 13558) [12]CVE-2017-7705
* [13]wnpa-sec-2017-16
  BGP dissector infinite loop ([14]Bug 13557) [15]CVE-2017-7701
* [16]wnpa-sec-2017-17
  DOF dissector infinite loop ([17]Bug 13453) [18]CVE-2017-7704
* [19]wnpa-sec-2017-18
  PacketBB dissector crash ([20]Bug 13559)
* [21]wnpa-sec-2017-19
  SLSK dissector long loop ([22]Bug 13576)
* [23]wnpa-sec-2017-20
  SIGCOMP dissector infinite loop ([24]Bug 13578)
* [25]wnpa-sec-2017-21
  WSP dissector infinite loop ([26]Bug 13581)

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../wireshark/{wireshark_2.2.5.bb => wireshark_2.2.6.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_2.2.5.bb => wireshark_2.2.6.bb} (95%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_2.2.5.bb b/meta-networking/recipes-support/wireshark/wireshark_2.2.6.bb
similarity index 95%
rename from meta-networking/recipes-support/wireshark/wireshark_2.2.5.bb
rename to meta-networking/recipes-support/wireshark/wireshark_2.2.6.bb
index 03ae3b9..a0b6b8f 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_2.2.5.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_2.2.6.bb
@@ -10,8 +10,8 @@ SRC_URI = "https://2.na.dl.wireshark.org/src/all-versions/${BP}.tar.bz2"
 
 PE = "1"
 
-SRC_URI[md5sum] = "749e7ca7606ae7df5c1ca8c62f93ff31"
-SRC_URI[sha256sum] = "75dd88d3d6336559e5b0b72077d8a772a988197d571f00029986225fef609ac8"
+SRC_URI[md5sum] = "2cd9a35c2df8c32668c1776784f074df"
+SRC_URI[sha256sum] = "f627d51eda85f5ae5f5c8c9fc1f6539ffc2a270dd7500dc7f67490a8534ca849"
 
 inherit autotools pkgconfig perlnative
 
-- 
2.7.4


