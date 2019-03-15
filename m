Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by mail.openembedded.org (Postfix) with ESMTP id A0B066C4E6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Mar 2019 17:11:53 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id m13so7426776lfb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Mar 2019 10:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=+HvMTkAHe9CAw+T23rk64MkxCh0rMHBrVu7ZegC1rjQ=;
	b=xt4BcodzO/jBtybc9FtEF/BQL0NRtETwN6kOmFQ6tZD65UU4t+aX0ZW/RbrajcLwDj
	Qcu8k/k3BvoUrE9Gcwav7IwBfrguLv+KCrPnOWVcpjLNIqpKN9fWMSDBS+ZooiO9iRgS
	KcYhsXzVXxVTpUWwDNxlHPDuUfWuxeSAROIuUUM362wIlIraeXa+sfLYB6lknssewHC/
	zf8nJT5ax/V2omzULE2WtGayuP8LXXhBgZG6UqevCQWKk0Jsr6g0G+ouuxfMK4+KiBWX
	2E97yd5y3V9Gw2FZTvfKC3F5CIkg+MhUQyY5rpQ7NKVOa7RwRnMNGVV7lZeUNWNgDD/l
	ytYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=+HvMTkAHe9CAw+T23rk64MkxCh0rMHBrVu7ZegC1rjQ=;
	b=jXxVveaE6s7M1jCW8CqDtCWLHftVXa8fUjvNj5MXEctuwbLW8JLmilwRFmRY+vkz9v
	R/s4j+1RJkE/dNnpLSZSdf+EK3iMgQaYrmzHHES0suMYlCPjwQJmySYwOnhtFx3nS46K
	BEPWE9yquwgZCzuLPo6DJZectNQjhDVP1KdcwpJHU/D4AoMQsRiOFQo/+wglRhTf1UXA
	FVqgXUyYxo9oInJif2B8BlLh9tyZPOVfu31BLLyj4wWFYkzVkLmOC8ocxbkSGnetH6NJ
	Qu6UkynfQbMcih+xuqJ35L21HQZQHpUz+ubVSSZmNe1gq7m92IwPyYByJMAz1f/i/u9v
	uShQ==
X-Gm-Message-State: APjAAAUiHdzPNcWK4hFzUejGWxMjek1ZTn+d5/eJ8R3ZobWluvFXhYNn
	gbbDa8AUkxuWrMfQqT5xRoVePpBD1bU=
X-Google-Smtp-Source: APXvYqxRvnLNg4M1VsmYFKGmG6QlcYQvrfKeFGzXo7BAL+/6M9hC6XsJKHuSeyMRVIqSPBiYwHEVAg==
X-Received: by 2002:a19:c018:: with SMTP id q24mr2757068lff.38.1552669913719; 
	Fri, 15 Mar 2019 10:11:53 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id q2sm525177lfc.76.2019.03.15.10.11.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Mar 2019 10:11:52 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Mar 2019 18:11:44 +0100
Message-Id: <20190315171144.20888-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-networking][PATCH] nghttp2: update to 1.37
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
X-List-Received-Date: Fri, 15 Mar 2019 17:11:54 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../nghttp2/{nghttp2_1.36.0.bb => nghttp2_1.37.0.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/nghttp2/{nghttp2_1.36.0.bb => nghttp2_1.37.0.bb} (72%)

diff --git a/meta-networking/recipes-support/nghttp2/nghttp2_1.36.0.bb b/meta-networking/recipes-support/nghttp2/nghttp2_1.37.0.bb
similarity index 72%
rename from meta-networking/recipes-support/nghttp2/nghttp2_1.36.0.bb
rename to meta-networking/recipes-support/nghttp2/nghttp2_1.37.0.bb
index 920e78280..50196d669 100644
--- a/meta-networking/recipes-support/nghttp2/nghttp2_1.36.0.bb
+++ b/meta-networking/recipes-support/nghttp2/nghttp2_1.37.0.bb
@@ -5,8 +5,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=764abdf30b2eadd37ce47dcbce0ea1ec"
 
 SRC_URI = "https://github.com/nghttp2/nghttp2/releases/download/v${PV}/nghttp2-${PV}.tar.xz"
-SRC_URI[md5sum] = "f2ef3dd1e9fc6dc29fcdd4a465ebc020"
-SRC_URI[sha256sum] = "e9bb86157b88eda5a6844a232e039febbb52c1aa44b640acbbfabe729b8287fc"
+SRC_URI[md5sum] = "dc7536d02aa7d4883c20eaf637747381"
+SRC_URI[sha256sum] = "aa090b164b17f4b91fe32310a1c0edf3e97e02cd9d1524eef42d60dd1e8d47b7"
 
 DEPENDS = "libxml2 openssl zlib jansson cunit c-ares"
 
-- 
2.17.1


