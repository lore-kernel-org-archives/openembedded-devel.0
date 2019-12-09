Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
	[209.85.128.45])
	by mail.openembedded.org (Postfix) with ESMTP id 172CA7E6EF
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Dec 2019 00:39:16 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id p17so13008807wma.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Dec 2019 16:39:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=Gfa2rxgKlKvYMpAahWKRe2oX5dqrBn+SRbs81Eawe9c=;
	b=GepQKz9eAR8AR4+Lr+9EAlgweBpnEKOrZUc/nDVA0dDew8MHVdUr/1m/QYpv24r1ZI
	4s1SBfXm+fmglUZN5VrekvQJonnXT4cqgzQJwY/KjSc2bc+Ly7y6sqiNCuvsw7kW+z2c
	R3JWz5Ea0HWRqRfjQ3qLXAFSxLlmtBEDtJwcKuW3+uVr7VhPagwRdt9DIOwEHqtG2awn
	FZ9NglGgiCsIw7S4E8cmrLyDAuQMO2IYalNdGWQfZ5Nu5waee6Yx0NtH2nFki7LNW+LV
	AFCYL2x3AWmvY3nnsJQKyO45Hu2mRp09LlRrwoWQdYIxeNbqgaxJyMfvKsqK1swlK4Tu
	GvtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Gfa2rxgKlKvYMpAahWKRe2oX5dqrBn+SRbs81Eawe9c=;
	b=m1gk71JgPjn0N3ArZYMpZ3wzy9kOiekS78b+Ii5coKP1akgUvQVUHu1MuDkEOMO/H6
	3wUtNO2B1lYnqJNtP+OevCgBpGR+ZuqcqETgirt4oJK7x2YQkzOq1YLIM0TWwgn519Lz
	Il0RoSecRZplzAsNeBPZX/ggbI5FQdtu9em4iiv0GaSFuhaCUl6gKXWY2v0LIkkMmPmu
	xRt5+jer4PH5UyTypl7I2iisul0Lc47GTTp3em7f9EVNFXLLyvcAlm5BKxbzwSxTYRwM
	7vlXzwVi6swNEFMf9qTxPM6MS+4BlmwVuRk1Rtk71GjIyF60t9Fx/M5epO3jxRu0EmXU
	1Y3w==
X-Gm-Message-State: APjAAAXNImhDnXhdCXovprttNJEGgh1acY0NmagbxXAb4dmuFIsiwj8S
	l3CweYMGsua7FrkrHyBCrLyOE/BL
X-Google-Smtp-Source: APXvYqwPugZl/toWZlRXtesIte32LLtwo4MunToOlf0LG/IgPm2DbHbQgjFhM4dV4wtEcYHHYeR5BA==
X-Received: by 2002:a1c:4454:: with SMTP id r81mr21907286wma.143.1575851956738;
	Sun, 08 Dec 2019 16:39:16 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0A9021072C1E15EE839E10.dip0.t-ipconnect.de.
	[2003:f0:7f0a:9021:72c:1e15:ee83:9e10])
	by smtp.gmail.com with ESMTPSA id
	n30sm11403575wmd.3.2019.12.08.16.39.15
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 08 Dec 2019 16:39:16 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Dec 2019 01:38:35 +0100
Message-Id: <20191209003840.3383-25-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191209003840.3383-1-schnitzeltony@gmail.com>
References: <20191209003840.3383-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 24/29] projucer: add x11 to required distro features
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
X-List-Received-Date: Mon, 09 Dec 2019 00:39:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It depends on many X11-libs

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-multimedia/recipes-multimedia/juce/projucer.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/juce/projucer.inc b/meta-multimedia/recipes-multimedia/juce/projucer.inc
index 60bd0e24b..fc8baa45b 100644
--- a/meta-multimedia/recipes-multimedia/juce/projucer.inc
+++ b/meta-multimedia/recipes-multimedia/juce/projucer.inc
@@ -6,7 +6,9 @@ HOMEPAGE = "http://juce.com/"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=a20f91622a47d4e4af9340d5d3f1a2d8"
 
-inherit pkgconfig
+inherit pkgconfig features_check
+
+REQUIRED_DISTRO_FEATURES = "x11"
 
 DEPENDS = "libx11 libxext libxinerama libxrandr libxcursor freetype alsa-lib curl bzip2 libpng harfbuzz glib-2.0 libpcre"
 DEPENDS_append_libc-musl = " libexecinfo"
-- 
2.21.0


