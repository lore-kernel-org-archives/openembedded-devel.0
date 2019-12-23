Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
	[209.85.210.181])
	by mail.openembedded.org (Postfix) with ESMTP id AFD017F2A2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Dec 2019 18:34:45 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id x184so9576641pfb.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Dec 2019 10:34:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=VsTWID8K4jORoH+btAKKoCniBKmjkR0o3RJNAlpFGIs=;
	b=tPA7q4iUyV64URs9SlM14V/MhtADNEoVjnbxDE/qh2UvJtl1lvHNi7QvJijsxXu1b3
	WYQl1efw4S/fqPWBY/sGS8aYN5h/+88evHCxbaZxQkYYxDs2wlOniOB/0upHFBjUXvcc
	NMnHPgswpUjya/C6zEQki2Bj/+3q8022PSRr64bLkI6IVfL8bYhQnL3hriER60NE7a+e
	oF9caKrzeaF8S2Lm+0UUBcvBAAw9k4zhPZ6WN57l/HPU8a9cAElCsQXIiAwlILhzXEsx
	PkkzBSDQGTMt6HWeQ7+b6yOSgsRVsFL4IAQNTpNCFvdSWz7plxZrqKvyP/bww+aQi/q8
	jWmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=VsTWID8K4jORoH+btAKKoCniBKmjkR0o3RJNAlpFGIs=;
	b=ffM1Fb/un3ZtnaYBC+Ky5gFZgxwaisaZlKcgpriIztPGquCI9ouS5QYSFUOyCl4D3q
	Sc6yztboaVtqdLxuhr+87mThJr6geEYIWMboD9xBwLBQgsiuAAKi+JiygNTf04Oh6SuT
	vvZoJA47Kcz+IUIw1FfmSBX+/5BVGkKgnZMJ0RgUauL3zm3y+iq5EUtRdtgq54Di+jd/
	3M8uAFWYE4dTD5sof4+OvbsXP6Ft6TRQ0sHYwHyEzU3m0SpYbQGbop15+niyCgCCMjJU
	Pp4hh6XBGCMVziquTLklCpwKL1L8EgQgHpL5RlZ3nQF5TCfk17lLOjoSFIwgIyu65wb3
	yBoQ==
X-Gm-Message-State: APjAAAXc16A1k98/TN6w0D7CB0PI9b+EVgrS2tGmKk31M5OdWwI0lMIy
	558W5GrD60+Q9CVTL4SCbCYpEwx37tI=
X-Google-Smtp-Source: APXvYqxB2Cx87MAkv/rikaBLQQc2LlI9C6avr1JJFLM5mJXkWPdknb9ja7GYmF366BCfbQM1JCm7nA==
X-Received: by 2002:aa7:9510:: with SMTP id b16mr33360869pfp.65.1577126086393; 
	Mon, 23 Dec 2019 10:34:46 -0800 (PST)
Received: from localhost.localdomain (c-67-181-203-136.hsd1.ca.comcast.net.
	[67.181.203.136]) by smtp.gmail.com with ESMTPSA id
	r1sm22970782pgp.15.2019.12.23.10.34.45
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 23 Dec 2019 10:34:45 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 23 Dec 2019 18:34:42 +0000
Message-Id: <20191223183444.420-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH 1/3] glfw: missing feature check.
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
X-List-Received-Date: Mon, 23 Dec 2019 18:34:45 -0000

glfw depends on libglu which wont build if "opengl" is not
in DISTRO_FEATURES

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-core/glfw/glfw_3.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/glfw/glfw_3.3.bb b/meta-oe/recipes-core/glfw/glfw_3.3.bb
index da2bae37a5..0ceeba1f19 100644
--- a/meta-oe/recipes-core/glfw/glfw_3.3.bb
+++ b/meta-oe/recipes-core/glfw/glfw_3.3.bb
@@ -17,6 +17,6 @@ SRCREV = "d25248343e248337284dfbe5ecd1eddbd37ae66d"
 EXTRA_OECMAKE += "-DBUILD_SHARED_LIBS=ON"
 
 DEPENDS = "libpng libglu zlib libxrandr libxinerama libxi libxcursor"
-REQUIRED_DISTRO_FEATURES = "x11"
+REQUIRED_DISTRO_FEATURES = "x11 opengl"
 
 COMPATIBLE_HOST_libc-musl = "null"
-- 
2.17.1


