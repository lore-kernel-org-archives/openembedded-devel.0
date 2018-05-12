Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 799BB789A4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 May 2018 14:56:51 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id j5-v6so7903988wme.5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 May 2018 07:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=lAtvXsIsdg4RApEwUp/VX9EuNoR1YwDzJXOUWyEb4yQ=;
	b=YXBEKO//DjTvDiM8YYlzHVkxXE/7XInox1+mNVBHvMqK0TwBrNkLviwGvX7+wpexLM
	0Slw0OLrwalys51U0FizN1THKgvM8NNpLYtA9YKjdOzhvxd8IRqkcvsIKO/rjw3IvOmv
	O2ytyT1p0VTFzk2Ubh9rrdpUvZx39zNvnbRdYkduYZHI70Bt8HkFAjrvtuSHVS6P2VGI
	5tFbQcgkE21aQgeumDRZ+zGIivtetiQTfMNSpGdNN87Wh5inmacZHSjo7D3ykQEKhwXg
	Q+0kvRO6VOACeCCE4r5LEIEHlAQGY5DWroAfWcY8yQSpG60bmL1hDUkcYtHLlcCkECOi
	p5/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=lAtvXsIsdg4RApEwUp/VX9EuNoR1YwDzJXOUWyEb4yQ=;
	b=Hy4B7Da1DMTqErxNDLx4W6NoRHiTTkgpKxFxo2gCxV5qFHqLqf8CZrHVQXuaH0Z0Yx
	snimQztlEAKyK/ovdYYZBAsiaLzFQpWWuMrj9ASwtrQro/H9Vq6Hkmjc6QfQjpCScula
	WEsVhk8wwDmosf0bgX7v1ML5WRlqCTH0bI9uBRokHkGbBP0tuTzRv0/dXlj1dEHxxtYH
	LsM761QX94vqRIUkAp2BzgYNoXiEE3B7baLPDV9ZL6Kltj8MiZ8P8CteV2OKiIJTofjf
	D3gpbUHaYzZ70Ul6zlIegOLktcNoZlZaAlVDEC8QmtePbuRANg3VIQS9bXchi70mwyHw
	QMoA==
X-Gm-Message-State: ALKqPwehanxP1nKGo4gV8zU4hjSyaeR+1umxR8UGpxAfH6kJGBkoDL5J
	3evkaV+XIi0rB5hWEC61njZB7w==
X-Google-Smtp-Source: AB8JxZoseVEfNcj2Hrd/FliN277D1YumU1WVoY4Vny+jWIC2/hYkxX3um/xF12VaYsBop6Mm8NcPVQ==
X-Received: by 2002:a1c:d809:: with SMTP id p9-v6mr1506395wmg.6.1526137011711; 
	Sat, 12 May 2018 07:56:51 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	o138-v6sm4035666wmg.10.2018.05.12.07.56.50
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 12 May 2018 07:56:50 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 12 May 2018 14:56:52 +0000
Message-Id: <20180512145652.27265-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.0
Subject: [meta-qt5][PATCH] gstreamer1.0-plugins-{good, bad}: move the qt5 PACKAGECONFIG from bad to good bbappend
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
X-List-Received-Date: Sat, 12 May 2018 14:56:51 -0000

* the plugin was moved in gstreamer 1.14 and now this bbappend was causing:
  http://errors.yoctoproject.org/Errors/Details/178525/
  ERROR: QA Issue: gstreamer1.0-plugins-bad: configure was passed unrecognised options: --disable-qt [unknown-configure-option]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...lugins-bad_%.bbappend => gstreamer1.0-plugins-good_%.bbappend} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_%.bbappend => gstreamer1.0-plugins-good_%.bbappend} (100%)

diff --git a/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_%.bbappend b/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_%.bbappend
similarity index 100%
rename from recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_%.bbappend
rename to recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_%.bbappend
-- 
2.17.0


