Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id 5BE247ED36
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  5 Oct 2019 15:36:07 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id v27so5461289pgk.10
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 05 Oct 2019 08:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ZFicmMvDvkBJ8aPZPzNpusmQ9pZcQpSRg4kVqOAR97g=;
	b=QAS5MFm0DGm74fWNljZCOhGrBvJLpCJqgnJFPpFUjAk1Y7CkIa0+NSCQmLcxQIVlMq
	E1cqbrtW/vF0Z9avS9QF+5W6o1IFM/MR7oWCh3fUckPLzpo5oK/q/VQst0h3qYNCWdJg
	G+H+V37Cfkl1/6WtU6rvm/CprmgEmVoO+zajlL1StIk1oSa1hCXP9zI178tLov3mYzMs
	ePfTbsCYl+M59GhZ5axCSVipK3gHKmL5AxfLU1WgQflMvYBHLk2EfigBeNDMBLKZwMze
	qoq8rxwAdyqMif6b9BjunRmbhijRskaU3cQy0Vl0/JJyOvEPFFdvd0MUKz93r5aUpzKB
	0WgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ZFicmMvDvkBJ8aPZPzNpusmQ9pZcQpSRg4kVqOAR97g=;
	b=Uuy0CT5Xtk0JSZhtz3zCG54seuHzkdmX8VK4WeubxRn8qtihJgHRFkhsaURKMGWJUs
	g5Y0jvn+WLquJ/+0dLQAIrKyF2A2cDpQhHDuKOCQ8OImLrw8wLoj1x+joZKQS5IUg4Xv
	ZgNkg55Nlasi3oFgqg3Tkp+ZcHzC+GZVsoKoj81ECzSzUmDBnVX8AG1w1BS347ZJo50k
	inWwQfkPbCCziyHERTLX0gvTGdC+2yBT6RExHhIeIbbNE9wDlcvs6UkZEZ/GfCSGsfoK
	X/jhqGDSCkbZpGljVBQEtl5vkKoicdS5wWL0lJa7goDuHuVxJAkTE6Wi89uY04eiVHmz
	4Faw==
X-Gm-Message-State: APjAAAUwTS/eIPcDyufyxi0Scdn7a3AWdJ6UY9xfr861wZTypl8DKR5n
	tjXITmnozRsyLQiYr7U2LbU5QN0IHaQ=
X-Google-Smtp-Source: APXvYqzI8N1bKFU9u0+YkY/0CjNN8bs2LFU2wrfOvzKSGqipR2KdcZlMVhoTI8oKqcQGkQ9QFek7/A==
X-Received: by 2002:a62:1d12:: with SMTP id d18mr23659719pfd.53.1570289767080; 
	Sat, 05 Oct 2019 08:36:07 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::7275])
	by smtp.gmail.com with ESMTPSA id
	g24sm10253766pfi.81.2019.10.05.08.36.06
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 05 Oct 2019 08:36:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  5 Oct 2019 08:35:58 -0700
Message-Id: <20191005153558.1332175-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] xorg-fonts-100dpi: Change License Custom -> MIT
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
X-List-Received-Date: Sat, 05 Oct 2019 15:36:07 -0000
Content-Transfer-Encoding: 8bit

This is a meta package which collects a bunch of 100dpi font packages
together which all are also under MIT license, Custom is not a known
type moreover MIT is well suited for this recipe for compatibility

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/xorg-font/xorg-fonts-100dpi.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/xorg-font/xorg-fonts-100dpi.bb b/meta-oe/recipes-graphics/xorg-font/xorg-fonts-100dpi.bb
index 45e3f7b592..ae9704050c 100644
--- a/meta-oe/recipes-graphics/xorg-font/xorg-fonts-100dpi.bb
+++ b/meta-oe/recipes-graphics/xorg-font/xorg-fonts-100dpi.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Xorg 100 DPI font set"
-LICENSE = "Custom"
+LICENSE = "MIT"
 
 inherit packagegroup distro_features_check
 # rdepends on font recipes with this restriction
-- 
2.23.0


