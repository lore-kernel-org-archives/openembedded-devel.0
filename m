Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id 0E7B87D076
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Jun 2019 17:57:41 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id p10so3428298pgn.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Jun 2019 10:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=fX4ahYGM9L/5d0fPLnfBYd77o+2hZkj2scB8Z6NnPHA=;
	b=NZdtN31hfi9mcsIVX7u/JsB+rElNSoNIZznEj7tWGjI9p0OfiNsPjhTkNsSyrbwGzk
	5Ii0+xp/0LGgT0J+S2AWYP9E96IBWK7oX3ZbNmXak42PWZBf0gXwAgXvDRyOdgLsOT43
	NOqCjHARJtLKNDFKVsG7Wvv4jj1M5bH8raJZWyUbmZTZNHEWm6gXJoNrrspto5x/F+qw
	R+bep34fthMM5P8SSqkOtKSLUSZs76f6TJ1MQx3FIHkWjXMG1HUsnmQrGhkH2d2zz9L3
	QAEOf+CDiLWin0xpT8kdQIOd++ITCkgu7kEC0xADCRW4ckcD/6HNyUzi5n/27L2JAKJ8
	8zxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=fX4ahYGM9L/5d0fPLnfBYd77o+2hZkj2scB8Z6NnPHA=;
	b=e1+s67X7HzgnkSvASXKi4TN3jruW999O6m+OlNtQ6UQoOVBNYLiz4lippfwTkG6kL7
	4o0urd6rVhXTYr81B9te7oj/fvlw+4pB70f/UbIaqJdkODNyG+lEjC9CTXS4rYbFOxO4
	ZOfOux58BPBFa4WbOPImQMj4rFWOrmKrQTJGJEAHvD/ILBZkrgEUMxBGRilbaKfPUFCR
	e82bbYhKm4lEOvAXAs14vstHig4RiolYVB1hlrSM8OENS+FmEV8RR5hulOnVuFNccQim
	FVpwO0s+8zOC+yUtL9+2Rbu8wxE1MGT27PgQj4bEZwI50C2G8gMqSnm6oAoRn95K5lSb
	waIQ==
X-Gm-Message-State: APjAAAXihzFed1E94a75IF7XtQq7c/4cToLvfv+LMNvtKR3Y+7A8eEBY
	dZ/obDQuPRSpOyRDuhJCnCz8wu+9
X-Google-Smtp-Source: APXvYqyTUSX1FruaCgFp79AjPFXEnky29tA0WFmbp3kXCc1C8MAjwphVhBs9N3QlrvTnR/M5ygDe4A==
X-Received: by 2002:a65:6383:: with SMTP id h3mr11443873pgv.452.1560621463018; 
	Sat, 15 Jun 2019 10:57:43 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:5942:80bf:dc9c:15ab])
	by smtp.gmail.com with ESMTPSA id
	f14sm8561221pfn.53.2019.06.15.10.57.42
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 15 Jun 2019 10:57:42 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 15 Jun 2019 10:57:16 -0700
Message-Id: <465a9b349cc3f1a68e23e5e522a3e6798c651b9e.1560620937.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1560620937.git.akuster808@gmail.com>
References: <cover.1560620937.git.akuster808@gmail.com>
Subject: [Warror][ 12/23] wireguard: Upgrade 20190123 -> 20190406
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
X-List-Received-Date: Sat, 15 Jun 2019 17:57:42 -0000

From: Scott Ellis <scottellis.developer@gmail.com>

Fixes issues with kernels 5.1 and greater.

Backport from master fc1b5310b28f70900a8a432048e08ee06ae309d7

Signed-off-by: Scott Ellis <scott@jumpnowtek.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...eguard-module_0.0.20190123.bb => wireguard-module_0.0.20190406.bb} | 0
 ...ireguard-tools_0.0.20190123.bb => wireguard-tools_0.0.20190406.bb} | 0
 meta-networking/recipes-kernel/wireguard/wireguard.inc                | 4 ++--
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-kernel/wireguard/{wireguard-module_0.0.20190123.bb => wireguard-module_0.0.20190406.bb} (100%)
 rename meta-networking/recipes-kernel/wireguard/{wireguard-tools_0.0.20190123.bb => wireguard-tools_0.0.20190406.bb} (100%)

diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20190123.bb b/meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20190406.bb
similarity index 100%
rename from meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20190123.bb
rename to meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20190406.bb
diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20190123.bb b/meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20190406.bb
similarity index 100%
rename from meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20190123.bb
rename to meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20190406.bb
diff --git a/meta-networking/recipes-kernel/wireguard/wireguard.inc b/meta-networking/recipes-kernel/wireguard/wireguard.inc
index 8314e79..5cf745e 100644
--- a/meta-networking/recipes-kernel/wireguard/wireguard.inc
+++ b/meta-networking/recipes-kernel/wireguard/wireguard.inc
@@ -11,7 +11,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://../COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "https://git.zx2c4.com/WireGuard/snapshot/WireGuard-${PV}.tar.xz"
-SRC_URI[md5sum] = "8a0a232f65d5d86dd408efd9ac30bcf9"
-SRC_URI[sha256sum] = "edd13c7631af169e3838621b1a1bff3ef73cf7bc778eec2bd55f7c1089ffdf9b"
+SRC_URI[md5sum] = "c11254fe48695e61c145a7e82756ecba"
+SRC_URI[sha256sum] = "2f06f3adf70b95e74a7736a22dcf6e9ef623b311a15b7d55b5474e57c3d0415b"
 
 S = "${WORKDIR}/WireGuard-${PV}/src/"
-- 
2.7.4


