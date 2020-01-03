Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
	[209.85.216.42])
	by mail.openembedded.org (Postfix) with ESMTP id 864197F965
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Jan 2020 02:49:34 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id a6so4036275pjh.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Jan 2020 18:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=TJNPTFmvqzVAiO/gX54KshSm6OQOKVWqaZvz4lAtfUE=;
	b=FMyRV8IiZz3rDX53spOax/xxNDfit4Fz7chTpvlaOK/A5oxgIyP6AO/l1Ockiq7H+c
	g9mlEEeqSBJf1zpzKooF1xmghJp8uRIricEoE+T74e3X65Q/oSPbcbgLkOLReHDifeig
	IinMPgddUsdyRjb/D/LUQ6tCSD+1w7BEuBK8Ct2uVm0GpzhSgBtXRPEu8l+smrPnCYww
	i37b6ZtOGLDvM2aUMsKK7SxN6UJmabuqAQ1Pqzt/TnLkX9VS9KqYNEH6kpjtKshkgYCK
	EjNDxCkctk9dzl3tun+WgkBZnEIRIY+/wK7/mid/bDwvZi/GcbbeIDU2P/i6Lt3s5SVY
	Pnjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=TJNPTFmvqzVAiO/gX54KshSm6OQOKVWqaZvz4lAtfUE=;
	b=g2BxyMWaFP7yOeWvx8PHJrRZZWa3VH0NTAP9p2xB9CA1vkJRFVdcfNNP8puURlbIUI
	Z3M0DTt07JYeS788ua49KAmySth3KIaOoeJLI9v7q96sWi3MOvDcraOShh2lMVsanh4s
	oqRHQM1FV5DQnU3uhUjyCJRMS/+F2MtwEUaVuLAPtQ6B5ay7zH1eZsTWRB9LIbJRW2Ww
	ThwrsiqDJE4hi2BNp543OkijQHwgUnoCVFYrMbtu4FaQ33sjq98wkeXYMdYPabe/mg7d
	yUr3r70Ypyjj7RXmilq6cfoauFx6fgbWdDiXYHLTqDZtuTqRisB5/7XCe06UNjURkM9b
	BtUg==
X-Gm-Message-State: APjAAAVVyAs1+SYARZaC7oiS0r5ITFVeZ1WmPqAwD7eZQYY9yV9CRY25
	UztvnabtEzg6KAQDA36Hfuh5XFJrrXQ=
X-Google-Smtp-Source: APXvYqwu+k75BIZHsTZwSdd7/M0JvxPTJxFjwXMlKY6m5J+hwOHaiTXr82LFLEJ90JHoukuKf+Tkaw==
X-Received: by 2002:a17:902:b68c:: with SMTP id
	c12mr54973931pls.160.1578019775482; 
	Thu, 02 Jan 2020 18:49:35 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:555:ddff:6770:148b])
	by smtp.gmail.com with ESMTPSA id
	p5sm61306640pga.69.2020.01.02.18.49.34
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 02 Jan 2020 18:49:35 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 Jan 2020 18:49:01 -0800
Message-Id: <9050733437c07fb447c61136f30a66ccce5848e4.1578019547.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578019547.git.akuster808@gmail.com>
References: <cover.1578019547.git.akuster808@gmail.com>
Subject: [zeus 04/17] xfce-dusk-gtk3: correct invalid SRC_URI
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
X-List-Received-Date: Fri, 03 Jan 2020 02:49:34 -0000

From: Changqing Li <changqing.li@windriver.com>

original SRC_URI is invalid now, and current upstream address
is such a long address(see below), and this package has not been
updated since 2011, so use http://sources.openembedded.org/.

https://dllb2.pling.com/api/files/download/id/1460766718/s/938c137c59bf7f1a6a6cc100c940feafd6904dc6478d5f96d09f3a631f9708e559055433db9e97654b196881fecbae445f094347befba0a5e477e961a73a7434/t/1576230019/c/a3f98e1fd43cfd072d46d7bedf6646191f5a020476297e0da678723a0078b9b8d284736bb34c4e876389b4e518777dc6a23c8666bb6bd42ceb1b893c9c264cce/lt/download/141404-xfce_dusk_gtk3-1_3.tar.gz

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Acked-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit f5ec79e25957a9231ba52fd09825ab8da68dc5e7)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-xfce/recipes-art/xfce-dusk-gtk3/xfce-dusk-gtk3_1.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-art/xfce-dusk-gtk3/xfce-dusk-gtk3_1.3.bb b/meta-xfce/recipes-art/xfce-dusk-gtk3/xfce-dusk-gtk3_1.3.bb
index b05c7485295..89dab4923f4 100644
--- a/meta-xfce/recipes-art/xfce-dusk-gtk3/xfce-dusk-gtk3_1.3.bb
+++ b/meta-xfce/recipes-art/xfce-dusk-gtk3/xfce-dusk-gtk3_1.3.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8f0e2cd40e05189ec81232da84bd6e1a"
 
 inherit allarch
 
-SRC_URI = "http://xfce-look.org/CONTENT/content-files/141404-xfce_dusk_gtk3-1_3.tar.gz;subdir=${BPN}-${PV}"
+SRC_URI = "http://sources.openembedded.org/141404-xfce_dusk_gtk3-1_3.tar.gz;subdir=${BPN}-${PV}"
 SRC_URI[md5sum] = "b3ad37ad8173b14ec090e60a80e65d8f"
 SRC_URI[sha256sum] = "bfa8a88607d1a1da5bd0b9e4e075767c54400a3c5a0fae88b619ed71532f30b4"
 
-- 
2.17.1


