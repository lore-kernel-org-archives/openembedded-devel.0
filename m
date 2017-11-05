Return-Path: <pbarker@toganlabs.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 1709778377
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  5 Nov 2017 22:08:22 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id k61so1086825wrc.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 05 Nov 2017 14:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=toganlabs-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=2ngFYw4AzLKupn1msNIe4J68y8pZXxJkxjlZaoX/EqA=;
	b=ulM8P/GJQBHWPgUNMYlGUdgqPSvdE+Bmfpnk3AjJ6sAXn+oQoCUBUoZyNGfwEmvGPZ
	dV+DIgNdNkRuGNQTJ38Ittjwyil7yX4wxCmtaYATgCVKqafQkXOLWk6K6lVcKTgIkjNz
	m0UHqW0UxviKK6MShdVTtm9k2rc1M/nYTlEWeIdL9j6RhJH3El2h24gj8U0D80HZlhEG
	MszmDJPVqzmRSCvkQqFxAAygNkvsYtD7IJ9tZRfaBuLqdTC1Qct45R/wi6O6Vi1WfFSa
	fnKAoiwogMeZK9TqCjtMDERL3XuYzglc2F+rL8hmbsGIlIFvWjtjSXi+4rJ/1jL1G5t/
	6zgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=2ngFYw4AzLKupn1msNIe4J68y8pZXxJkxjlZaoX/EqA=;
	b=N420uDPYrfJFoU5LKoszL/ulANQGrCZf1innHFN4GjAXWWb3Ac9SkgZJp5WUBm+t19
	pz6nVXZZTZGMBQtXc+O0gAErzRDfxA/YP0hjC/wVQpjis4twT0yrDpTRpxkDfxLqbqd5
	lES240LJD9tK/1Qj9q6tNjXsxmRuwQULYHgrYCFCGdh60k4Oqs+QOPr1QBqFuktjHLTS
	Aty+/TaadWh+v0N6ZpnLcimvZc9dhYgriwczk3e8xEkt3TNXEmDbwiR1EAHWjUDfsuGp
	DdI6w5L6YaVFLWdx51GINFVRIohS6PItqM8XCZe35S76a4JOYfW3u5cb1OhiVJBmupnU
	DV2g==
X-Gm-Message-State: AMCzsaXVUjFQzlPQtOmE0E6c5oKTiU9e3l4zcQ9/r5gv8SWeME43pXMc
	kPHfE3d41SS4A86TSpYCuc+QrJXY
X-Google-Smtp-Source: ABhQp+RRM0HWnGhYii0aE2FnC+e+JSlooLrySZfiC/XqyL1qmnYcAMxwwWmem8z7fjJj7mvKSX5uuw==
X-Received: by 10.223.133.214 with SMTP id 22mr10793652wru.23.1509919703150;
	Sun, 05 Nov 2017 14:08:23 -0800 (PST)
Received: from build1.toganlabs.com (build1.toganlabs.com. [88.99.240.167])
	by smtp.gmail.com with ESMTPSA id
	q124sm13845688wmg.18.2017.11.05.14.08.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 05 Nov 2017 14:08:22 -0800 (PST)
From: Paul Barker <pbarker@toganlabs.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  5 Nov 2017 22:07:29 +0000
Message-Id: <1509919652-31388-6-git-send-email-pbarker@toganlabs.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1509919652-31388-1-git-send-email-pbarker@toganlabs.com>
References: <1509919652-31388-1-git-send-email-pbarker@toganlabs.com>
Subject: [meta-oe][PATCH 5/8] ddrescue: Update to v1.22
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
X-List-Received-Date: Sun, 05 Nov 2017 22:08:22 -0000

Signed-off-by: Paul Barker <pbarker@toganlabs.com>
---
 .../recipes-extended/ddrescue/{ddrescue_1.19.bb => ddrescue_1.22.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/ddrescue/{ddrescue_1.19.bb => ddrescue_1.22.bb} (90%)

diff --git a/meta-oe/recipes-extended/ddrescue/ddrescue_1.19.bb b/meta-oe/recipes-extended/ddrescue/ddrescue_1.22.bb
similarity index 90%
rename from meta-oe/recipes-extended/ddrescue/ddrescue_1.19.bb
rename to meta-oe/recipes-extended/ddrescue/ddrescue_1.22.bb
index 27e00a5..2df7db9 100644
--- a/meta-oe/recipes-extended/ddrescue/ddrescue_1.19.bb
+++ b/meta-oe/recipes-extended/ddrescue/ddrescue_1.22.bb
@@ -10,8 +10,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=76d6e300ffd8fb9d18bd9b136a9bba13 \
                     file://main_common.cc;beginline=5;endline=16;md5=3ec288b2676528cd2b069364e313016f"
 
 SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.lz"
-SRC_URI[md5sum] = "ed6b5b82d74cbd925db2b829350e74b1"
-SRC_URI[sha256sum] = "ed8d0c9d9aac80a9110e9cb0d0a91a7390d3bf9f816b67a62ca4eb140f4747b8"
+SRC_URI[md5sum] = "49c845ed89d25b534842e40366154cb4"
+SRC_URI[sha256sum] = "09857b2e8074813ac19da5d262890f722e5f7900e521a4c60354cef95eea10a7"
 
 # This isn't already added by base.bbclass
 do_unpack[depends] += "lzip-native:do_populate_sysroot"
-- 
2.7.4


