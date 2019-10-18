Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
	[209.85.210.174])
	by mail.openembedded.org (Postfix) with ESMTP id 6CB807F696
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Oct 2019 18:38:15 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id h195so4394958pfe.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Oct 2019 11:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=jTAe75iOsiQ/q81AldTJDsa1gn78yvADLW4EVlKQdvk=;
	b=dN1Sxl55yg2FBpl80fHGvaiROKVIRyvouydEAXiq7M7mce7qzd9LGqODUCbkslqlSv
	/yPq4knbGoQFcHDwp2S3E/ImaqxtXQxrVmjXyKUmfC3uEpZmcMjYkm/JJgiIXTzVCLSF
	+dYMpk3WZOBSkNkBHtp0Crh6tw8QgjtJIfTyUQcandIOUGuJAMWCdqEk+c83zK12zjne
	4QBvmxzQgnXS9jKupQda6MYB3yug+lg2ivPzIXyNYJC5tsUlI+7BElXTHHP7cezxN6dL
	QvcG4KmVrAHJosFXIOH8OvGuLKcP/B9I2fwQ9Po4d5uttLtNwv3yh1dDABTvE0ADhDY5
	Ujxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=jTAe75iOsiQ/q81AldTJDsa1gn78yvADLW4EVlKQdvk=;
	b=A4pcKvhhYbaxNd8gxdl4Bo1FwyI02ENbbA0/bTXqsfyvBIk0Laglak+qsIG6uH/MEV
	7nOm7+ygAdZrZaBW3iI1apRElE60DuCWLAYhpHWcsuz6cZhRqVYMefJTf6IIBXHRRD3D
	S7VVKao+WT8ldkmNVfABATpGJfJb4RY2rhoiZc2ttRBfXw2U9BieEPupoRpw4vBDHxWG
	wrQ7F0pwP805DRIfSao5CGt7Ny9D0xXa/luqrthUY4r9W2ow1nqBxpUN6ITSkFJV6WOR
	rG9UzZLWRWFHLjdLR9Du/LUTlowrmTu30JQ5rmY1Wj+UWIPZxFKzokAfQOG6YVAgfH41
	5anQ==
X-Gm-Message-State: APjAAAUj89c78YZPEA+qB7AgENgAsgkDO6p/Ta3kLf5JAmZagykYwSJA
	fPcOwQ+UxLNeQvjY0a2kiEwHPLAU
X-Google-Smtp-Source: APXvYqyA9weJ0NcY5CR5JHWX1qDMR/rLFlh0HTPThOnjf5/F9r4ZUa8qkSmhm+n28QBZmeOZta7Z1Q==
X-Received: by 2002:aa7:8a97:: with SMTP id a23mr8320349pfc.76.1571423896290; 
	Fri, 18 Oct 2019 11:38:16 -0700 (PDT)
Received: from pahoa2.kama-aina.net (c-67-181-203-136.hsd1.ca.comcast.net.
	[67.181.203.136]) by smtp.gmail.com with ESMTPSA id
	i22sm6895813pgg.20.2019.10.18.11.38.15
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 18 Oct 2019 11:38:15 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Oct 2019 11:38:13 -0700
Message-Id: <20191018183813.8781-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][master][zeus][PATCH] renderdoc: package need opengl
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
X-List-Received-Date: Fri, 18 Oct 2019 18:38:15 -0000

ERROR: Nothing PROVIDES 'virtual/libgl'

found via yocto-check-layer

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-graphics/renderdoc/renderdoc_1.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/renderdoc/renderdoc_1.4.bb b/meta-oe/recipes-graphics/renderdoc/renderdoc_1.4.bb
index c7e872409f..684a204ead 100644
--- a/meta-oe/recipes-graphics/renderdoc/renderdoc_1.4.bb
+++ b/meta-oe/recipes-graphics/renderdoc/renderdoc_1.4.bb
@@ -16,7 +16,7 @@ RDEPENDS_${PN} = "libxcb xcb-util-keysyms"
 
 inherit cmake python3native distro_features_check
 
-REQUIRED_DISTRO_FEATURES = "x11"
+REQUIRED_DISTRO_FEATURES = "x11 opengl"
 
 python __anonymous () {
     # only works on glibc systems
-- 
2.17.1


