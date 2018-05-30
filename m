Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f173.google.com (mail-wr0-f173.google.com
	[209.85.128.173])
	by mail.openembedded.org (Postfix) with ESMTP id D12A3600EA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 May 2018 11:31:40 +0000 (UTC)
Received: by mail-wr0-f173.google.com with SMTP id 94-v6so29150762wrf.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 May 2018 04:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=d0qQQ9rxmFrcWxtP+v0GzywQj5v6dBUF6NyzxpR6xUY=;
	b=FOps/7YsTiCCWzYZ5YwDUJ31io53D9NB142lVGnoPhJj2xOgbPXhiurjqiR0zZexjp
	9lWikHuVhPaG9A1c5SHsDS3iF3A5xScDUEncAy+S+AUaePmSb11V5oPah40ApW/bKwsG
	RbYegpOMo0/AtH5EqMZOrf9YYUaZs95RFLaRoU3LbIfq2tyQEEW76mFkMkNROD2hs+FX
	QffJR4WkiguzP1KtuYALeA8JrdRd6H6IwtQ+vdQclayJdgRTvpdG7b0CZNmvjNb10xcI
	ZWCiZzS26KOkMj+IvLiWzufEwsIKbkVUm8guHI7+a6xpDLxHgGA4EUDGZ2sfgpCcM+42
	fieg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=d0qQQ9rxmFrcWxtP+v0GzywQj5v6dBUF6NyzxpR6xUY=;
	b=R4RSdGlqo+15SWM9hTLRHLypprk07E+abX1W6+S33m3vebF9fE5mdgTgaJ63JT5X7V
	+QXEz+U6nVqZlVfajofyMXl1JXOcZK+Ox/hWZD6V2UqIJX97T9ukx/mFBzWIma/2TOra
	jH8aJSyV1B9QBuiaqAbnWYNwujNT8kOOmhrImK4295pXQWa2bGZ/0LtWVFBY6HtWRZnP
	Gh9+O9HvHCUfdY5ic9mu3gYeIkEyfCiShLKKMAE9vcOtLOPM6ZIN5VByis1zXp+n7iZZ
	aLpFigDmWrJQKmvoEeC8XozGoIWM7P0HmcF7LydjL2Smw+O95akZhl2FXMdM38YbCTdM
	835w==
X-Gm-Message-State: ALKqPwcBLXuhR7RpJjb2kydJjPRJ5omyHkSOlcsRwV7rDRUP2OY47tfV
	uxCPLY7MibT3j9sorLvFNkAvvQ==
X-Google-Smtp-Source: ADUXVKLb/qYT31CtZHvUm5OSQs7uTT1eaBxWgaHh0Navrev4oZcfjNKNpnRfwLLhKhgnM7+qYNg02Q==
X-Received: by 2002:adf:8143:: with SMTP id
	61-v6mr1733480wrm.192.1527679901216; 
	Wed, 30 May 2018 04:31:41 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	x130-v6sm25377753wme.24.2018.05.30.04.31.39
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 30 May 2018 04:31:40 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 May 2018 11:31:25 +0000
Message-Id: <20180530113126.2954-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.0
Subject: [meta-oe][resend][PATCH 1/2] Revert "libxml++: only include when x11 in DISTRO_FEATURES"
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
X-List-Received-Date: Wed, 30 May 2018 11:31:41 -0000

This reverts commit 44ece3daea4028e72473b6316ba3c7c54d833166.
---
 meta-oe/recipes-core/libxml/libxml++_2.40.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/libxml/libxml++_2.40.1.bb b/meta-oe/recipes-core/libxml/libxml++_2.40.1.bb
index a38315c4d5..c001c184cb 100644
--- a/meta-oe/recipes-core/libxml/libxml++_2.40.1.bb
+++ b/meta-oe/recipes-core/libxml/libxml++_2.40.1.bb
@@ -16,7 +16,7 @@ SRC_URI[sha256sum] = "4ad4abdd3258874f61c2e2a41d08e9930677976d303653cd1670d3e9f3
 
 DEPENDS = "libxml2 glibmm"
 
-inherit distro_features_check autotools pkgconfig ptest
+inherit autotools pkgconfig ptest
 
 do_compile_ptest() {
   oe_runmake -C examples buildtest
-- 
2.17.0


