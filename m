Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
	[209.85.216.42])
	by mail.openembedded.org (Postfix) with ESMTP id D4BA77FC08
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jan 2020 00:35:33 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id r67so5906116pjb.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Jan 2020 16:35:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=xhKLzzdB9Lpv6zJAqOWUxRaRr3SlC/s+ZlXSS773h24=;
	b=WVHeZQIiBWMwGeaAWgEbC5oa/LoQq+bP+BurhTGfL6OBthd//6yxTLU9CaDfwz7G+k
	Z4KpibMVZ+H/6Lqgkbrneg/vGE5zHH6LUZh14bcF1ry0JTytfiOLCcxwiXYMxu5yYl6n
	RVz1pwwBrU1htIw0DZHJUsq+1J+DLaGlB9mySUzpMvLO078NgcOx5p+a0EaGI+sLsWet
	GiDMjSlc8V/2pVitAPUizaE3QIfvJO5v4AgjPrmMU1ovsYEzOIrgG2baHpltvWtUmNaR
	rByLlHpIZ2bg42exRU89MYBQL90V5KxIJ1YUrLSwS3uj6U1N+mNBf2tqbkkhzTIsFN8Z
	ZgeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=xhKLzzdB9Lpv6zJAqOWUxRaRr3SlC/s+ZlXSS773h24=;
	b=rAb99Y59oXopOnzCD5srwQd93dRW2eqjdLMFEybNZJeLCNWfzoN1ddMypjZBeVGoEO
	6V0MFbryHksjNvoSPw9p1iRa00hMDLV4j2GR2tLvVS42FpVteJB7L8/5J1FHueRFT29r
	Y76wEmBJY1RLj0YSOi5pdLS6ATUeMe33Esswsj9Y2d9fwfGJLuYJUeQM5RZJzPDUM5jv
	g8yMEGk7x7PTfe1UXsB111paFmKwF3ak6Br/HcntiBpIUROmLQpqw06Ie5g6CiGhFBYx
	GGcjC+sdkNfRtD+3XrfOo8jtCGFNRcqvFfbG8TQxmFdBui8vnAHPSUcJ6mjKvIRNDIQG
	O91g==
X-Gm-Message-State: APjAAAUteWbzB1M/LGqB07h7aiQxRsGzat/zXlyItHcVyCJqyyGNhZDH
	b+UcCr+8UBK4rZi0nms/ZFIGbSYjx68=
X-Google-Smtp-Source: APXvYqyVGpxyuqS3VkH1VIDXLJfmvv34kh21XIp13I7zUnCY/+3A7iMgRVKA7xKZIoIuq30uwSfvrg==
X-Received: by 2002:a17:90b:3004:: with SMTP id
	hg4mr20667918pjb.52.1579480534492; 
	Sun, 19 Jan 2020 16:35:34 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::cab1])
	by smtp.gmail.com with ESMTPSA id
	z11sm37881115pfk.96.2020.01.19.16.35.33
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 19 Jan 2020 16:35:34 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 19 Jan 2020 16:35:27 -0800
Message-Id: <20200120003527.1518697-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200120003527.1518697-1-raj.khem@gmail.com>
References: <20200120003527.1518697-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 5/5] cherokee: Use python3 native during build
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
X-List-Received-Date: Mon, 20 Jan 2020 00:35:34 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-webserver/recipes-httpd/cherokee/cherokee_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-httpd/cherokee/cherokee_git.bb b/meta-webserver/recipes-httpd/cherokee/cherokee_git.bb
index 490fc53f9e..d16e04e6b1 100644
--- a/meta-webserver/recipes-httpd/cherokee/cherokee_git.bb
+++ b/meta-webserver/recipes-httpd/cherokee/cherokee_git.bb
@@ -20,7 +20,7 @@ SRC_URI = "git://github.com/cherokee/webserver \
 
 S = "${WORKDIR}/git"
 
-inherit autotools-brokensep pkgconfig binconfig update-rc.d systemd pythonnative
+inherit autotools-brokensep pkgconfig binconfig update-rc.d systemd python3native
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
 PACKAGECONFIG[ffmpeg] = "--with-ffmpeg,--without-ffmpeg,libav"
-- 
2.25.0


