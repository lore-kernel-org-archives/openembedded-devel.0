Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id 50D137F26D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Aug 2019 05:13:47 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id 4so1951382pld.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2019 22:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=0J4s1v+gYozIuRJJ9km7WiMBCr4OZBh/FpO3K+j/HsA=;
	b=H3pjowt2b3coKNJhUg6bEZTC/OW7Ht7cH3RHTQd/MHEWCmVSO+FZGHQNL5MqU7iQ2M
	My36aX/G8KjqavN0YXWrU1Me20ziz41Q/Lo4lg79SBc4r6UwSHlwX6uzgjOhFqmlpJZy
	a0Q104QEK5ibIaAS722HNblN1LqbWqPrTpwQq/I5gHGFMRRBHcEYFFjcq+cjFUM6fSb5
	sTu/DXy6LyxlEptAT0kpbKY57+jBz0lqktrzJ5lViZWgnrPhdUlwEFF1TOqgCpICGeK8
	FhaBEms36Zb4duMoFh7pM+cCS5x2d+rAsIg4GZVL8gZa2YHT6VrNq/2XwQIpXqVbNA63
	L7dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=0J4s1v+gYozIuRJJ9km7WiMBCr4OZBh/FpO3K+j/HsA=;
	b=EoJnlT30mOEmPsCxIK3tu7Hbrvc5bDrTytHMjuUwpSiLAHLbDiADnI8FNm1amzHkBm
	xg2VGd1+x6gf71a9tmVuWoTdnNVOL6/Nl1X2q9Y2oT/SAw2TrTLVVKT84oN3/gzDNiy4
	WfZyn0Jub4BdoaoKKrZaoJEf3a1tqQDgSpmEKBB23rOX4usTuR7bHceegw08OMkKbvbU
	0NRMROdyBnzdhKLJWKAikW/ou/wQMs3BcvC5FsGyUVSJyAAtxFwFABf5i0n4kP41KhX7
	qBL90UTS8WK/V8Z68GSWLKZUcORx/gkyFDCl30c+aGhID4Vjoy5l7CqWZrtE7mdGJeCK
	B1sg==
X-Gm-Message-State: APjAAAV6GOddZvF4CU1hclatfdeQdxBgs3BfYCAu18vywEv4mrMKr9FE
	KdUEuRzl65lYzt9hbMUii7L/CLXiHd0=
X-Google-Smtp-Source: APXvYqwlQhCJGfTwn7vvcYQvsjB9DdiNh46C627wyA6b31cJKXIR2K244JxxI9OcbhXVFs1iyLzptA==
X-Received: by 2002:a17:902:ab96:: with SMTP id
	f22mr7717860plr.147.1565932427809; 
	Thu, 15 Aug 2019 22:13:47 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	d18sm3536746pgi.40.2019.08.15.22.13.47
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 15 Aug 2019 22:13:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Aug 2019 22:13:38 -0700
Message-Id: <20190816051338.33239-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] libopus: Limit forcing ARM mode ISA to v5 only
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
X-List-Received-Date: Fri, 16 Aug 2019 05:13:47 -0000
Content-Transfer-Encoding: 8bit

This lets newer armv7+ still use thumb2 ISA

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-multimedia/libopus/libopus_1.1.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-multimedia/libopus/libopus_1.1.3.bb b/meta-oe/recipes-multimedia/libopus/libopus_1.1.3.bb
index fb9bdc70fa..1512a1d7d1 100644
--- a/meta-oe/recipes-multimedia/libopus/libopus_1.1.3.bb
+++ b/meta-oe/recipes-multimedia/libopus/libopus_1.1.3.bb
@@ -50,6 +50,6 @@ python () {
 #| {standard input}:761: Error: selected processor does not support Thumb mode `smull fp,r2,r3,r9'
 #| {standard input}:773: Error: selected processor does not support Thumb mode `smull fp,r3,r5,r8'
 #| make[2]: *** [celt/celt.lo] Error 1
-ARM_INSTRUCTION_SET = "arm"
+ARM_INSTRUCTION_SET_armv5 = "arm"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.22.1


