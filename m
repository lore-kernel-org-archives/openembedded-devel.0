Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 9FEF67C119
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Jan 2019 21:32:43 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id c123so8576678pfb.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Jan 2019 13:32:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=E5knSliweMOeInF3E8RBsYd8lfTdmhW7idnTcJSMNzY=;
	b=ga/1YcxJiwKrnws7mJydHDDaWuObg0ocnsPeuaHntadW9oM0bwsnu/yy3Ume7G8+T/
	6ozfc9fGTwd4R0y5nWfAi81Ax7M8hjevys2kScKKoDjzjiGPpYDKIILlk3FnBmDt9fnG
	X+p8zFmxW+i1xm4l6pA/6S7Ddhg1Fzmd2/ufHFc096be3PVpvk6lXvuq42kzprBWHqU1
	D4rgBEXj+lyLuD8ONFwGiHLzmOK8njI8M1590Yf1QOeoIq5lvPo+ntdX7+3Cof4hZDdP
	RhYF+ZOib4rhUu/xLIncdxwsEOmmupUNuFYsRA1Bec8Eq9x1Vqx3J2jK+ChvWVPjQd5D
	DJ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=E5knSliweMOeInF3E8RBsYd8lfTdmhW7idnTcJSMNzY=;
	b=oQaAXGeNRL8kBNAHVp/ewfOt+2L68/DkNZyzouad/NWeLfFor7trlMdymDonBSYCGy
	6TfLFExrI7E+JjSADbXKBDbvPPAOA7ncXF3Y5acMusyf+pdA+KUUXHA0KCrUO6uQ3Lcb
	dfOHK6/MF+5487JolN1eNoPvUJzxZ1uFe941QA7SrVrPjCVHYNJbbxeF/zMCGfz6Gnw6
	TIixKUecQzQY2TLDCxui6OCvp6O/8FiCiJtKbrB8K4H2AtaSdpckQR9S8Uae2OSc8dvB
	b2pCCVMa/ATvTl00vdYRIqcRzUv4h56piwmIXWFy1cBFIOTNGVKrICNY2XetIyqM+J4g
	b9qQ==
X-Gm-Message-State: AJcUukcycnffuBaG3+qT7JfqFeoYtMo1uzbKDWd9ZwItwZqtom2q2YSS
	1lrsrJhQQ7TE7tiWBcM7/7s=
X-Google-Smtp-Source: ALg8bN6B9UNCHY7iqvp2dQOd+nDinEeTmHdkJgfBsHPXKdXtkjSh0eEKqTWGwb3zYg5no1CGamJmwA==
X-Received: by 2002:a63:170c:: with SMTP id x12mr17537319pgl.364.1547328764822;
	Sat, 12 Jan 2019 13:32:44 -0800 (PST)
Received: from pahoa2.kama-aina.net (c-67-181-203-136.hsd1.ca.comcast.net.
	[67.181.203.136]) by smtp.gmail.com with ESMTPSA id
	n22sm168086179pfh.166.2019.01.12.13.32.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 12 Jan 2019 13:32:44 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Sat, 12 Jan 2019 13:32:43 -0800
Message-Id: <20190112213243.2564-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [v2][PATCH] wireshark: update to 2.6.6
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
X-List-Received-Date: Sat, 12 Jan 2019 21:32:43 -0000

includes:

wnpa-sec-2019-01 The 6LoWPAN dissector could crash. Bug 15217. CVE-2019-5716.
wnpa-sec-2019-02 The P_MUL dissector could crash. Bug 15337. CVE-2019-5717.
wnpa-sec-2019-03 The RTSE dissector and other dissectors could crash. Bug 15373. CVE-2019-5718.
wnpa-sec-2019-04 The ISAKMP dissector could crash. Bug 15374. CVE-2019-5719.

For more info see: https://www.wireshark.org/docs/relnotes/wireshark-2.6.6.html

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../wireshark/{wireshark_2.6.5.bb => wireshark_2.6.6.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_2.6.5.bb => wireshark_2.6.6.bb} (96%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_2.6.5.bb b/meta-networking/recipes-support/wireshark/wireshark_2.6.6.bb
similarity index 96%
rename from meta-networking/recipes-support/wireshark/wireshark_2.6.5.bb
rename to meta-networking/recipes-support/wireshark/wireshark_2.6.6.bb
index b3e0dd4d08..4699f67982 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_2.6.5.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_2.6.6.bb
@@ -14,8 +14,8 @@ SRC_URI = "https://1.as.dl.wireshark.org/src/all-versions/${BP}.tar.xz \
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
 
-SRC_URI[md5sum] = "e25257d5969705f2a18cae627ed42d80"
-SRC_URI[sha256sum] = "93155b798544b2f07693920f4ac1b531c952965ee4eb1d98419961240177438a"
+SRC_URI[md5sum] = "b30ba5b9b48ed2ff91c0ce357d33b46b"
+SRC_URI[sha256sum] = "487933ea075bdbb25d8df06017d9c4f49fc20eb7f6ec80af086718ed5550e863"
 
 PE = "1"
 
-- 
2.17.1


