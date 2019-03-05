Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 98D967C5CC
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Mar 2019 04:59:16 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id i19so4730053pfd.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Mar 2019 20:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=WGbEF9k1R4PQrjEjx/KBAp9feCEX1igQql2FDi0DAVc=;
	b=gukcQlORZ8kYwwrUNvFkfj/2GH5XQPjJfKzHtyMnheNadi7PqPoTGcXmKkhuqOIh+P
	dyoohI/O0TTcFTcvZtDabLNq1p6tS2l2l6gUlPuaYGleKh7GPzRYL6P08UVnS/M+2fGm
	IM5QKzk8nubtrWhYCAT8WQ5f2yGMh09qJEvdwO4gPy0Vp1wjivBXyPzBuGCM4NqBf90o
	o/IY3yz68Rjk3xyEqQvhCFrhZWtuOhJTJ9iwBR1tDVfJ446820bWgebsWxI8faLFRQN8
	KIqeukubjzfjcnFmsfU56bg6foBHlD+L0v6rFBfUC54BjOaG5zU1eLV/KMvKrMYdYdEj
	vA+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=WGbEF9k1R4PQrjEjx/KBAp9feCEX1igQql2FDi0DAVc=;
	b=VH0abATi2zI/y5XI4u52MAxnnHUOz4bUE+dipqkWOKw/2hB6V8l7UU1Vtu16DA6guU
	PdYx4eVmB6N1/upzg0spgtBygt64EF7WyimoT3xSKvrALCMBbYc/8pLvWzVpXfQZf5g1
	LAo8kNOzUFp6EUNKI+VGQSEFM8xO2Gpal+5FeTffkZQdV1gE9Zo7WkAI9RSsz5Y0wZOc
	AxXPimfXhV6qXioOqGicDLZCs6a+q445g8w5EqUHLwnoy28oob8CzUhDSkfZOZGP22EM
	dGrJWRbSFT4WBrqc0ktyQZlg+/vD1i1NLN/SEkA2ypN/jUCgX+0qErW2XwSXR6AcpK+y
	BFuQ==
X-Gm-Message-State: APjAAAWMPv0XACs0ss6CTTnFEQ9F4rKwrnCJeo/mzuUHA7HbX8jLsovZ
	vNsLbM2SD/3ymqEx91ZenNHk6EnY
X-Google-Smtp-Source: APXvYqyu+gRKRFCGVez9qdo+rGR9pFlWkhWw8MWaYxGiquEdbXoEhSZDt/S5WcEVXunARySPojAjZw==
X-Received: by 2002:a17:902:784c:: with SMTP id
	e12mr24038298pln.117.1551761957264; 
	Mon, 04 Mar 2019 20:59:17 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::caa9])
	by smtp.gmail.com with ESMTPSA id
	e9sm16750269pfh.42.2019.03.04.20.59.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Mar 2019 20:59:16 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  4 Mar 2019 20:59:06 -0800
Message-Id: <20190305045907.40923-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Cc: Ivan Maidanski <ivmai@mail.ru>
Subject: [meta-oe][PATCH] bdwgc: upgrade 7.6.10 -> 7.6.12
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
X-List-Received-Date: Tue, 05 Mar 2019 04:59:16 -0000
Content-Transfer-Encoding: 8bit

From: Ivan Maidanski <ivmai@mail.ru>

Highlights of this upgrade:
* Fix 'unexpected mark stack overflow' abort
* Fix executable memory allocation

See the following for detailed changes:
* https://github.com/ivmai/bdwgc/releases/tag/v7.6.12

Signed-off-by: Ivan Maidanski <ivmai@mail.ru>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-support/bdwgc/{bdwgc_7.6.10.bb => bdwgc_7.6.12.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/bdwgc/{bdwgc_7.6.10.bb => bdwgc_7.6.12.bb} (96%)

diff --git a/meta-oe/recipes-support/bdwgc/bdwgc_7.6.10.bb b/meta-oe/recipes-support/bdwgc/bdwgc_7.6.12.bb
similarity index 96%
rename from meta-oe/recipes-support/bdwgc/bdwgc_7.6.10.bb
rename to meta-oe/recipes-support/bdwgc/bdwgc_7.6.12.bb
index fdf3d6c16d..b1c1099bb8 100644
--- a/meta-oe/recipes-support/bdwgc/bdwgc_7.6.10.bb
+++ b/meta-oe/recipes-support/bdwgc/bdwgc_7.6.12.bb
@@ -21,7 +21,7 @@ SECTION = "devel"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://README.QUICK;md5=728501f233050290314d33fb07d883eb"
 
-SRCREV = "cef9cbed83f2b5101d4e65ca0f158600d26cbd34"
+SRCREV = "a46546f40d18e60c31077c2e7c8bb4e44bf1bef1"
 SRC_URI = "git://github.com/ivmai/bdwgc.git;branch=release-7_6 \
           "
 
-- 
2.21.0


