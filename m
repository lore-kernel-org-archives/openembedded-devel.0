Return-Path: <straka.derek@gmail.com>
Received: from mail-yw0-f194.google.com (mail-yw0-f194.google.com
	[209.85.161.194])
	by mail.openembedded.org (Postfix) with ESMTP id C2D2360767
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 May 2016 01:34:55 +0000 (UTC)
Received: by mail-yw0-f194.google.com with SMTP id v81so10419224ywa.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 May 2016 18:34:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Te+GRCufNmIX7feCd3HgWnR0wYyYwaUxO6lfzgrjWLc=;
	b=GVNzqaSw2OSPt1Ao2oHc9kLA3oUnzvl46+upND3vr16nSLkkLSG5/gHR911Ygut3Wq
	bpPzMMesXVsm1vyrgitSOTrGNZ+2gKaoyOQc7tEumW4gy8F+w8fs1ZiPxeAKqpOZ77n2
	m+QQfmCfsG49QNXhpcGOt/pf6VHJBcl+SpCBSexPYq4NuoSrlLEBcTJHKDN3TWpRGYaN
	4WrNsk9EYJLYY+9zQn3RseusxH1k/8AJE4LxVkujvlH3iYU9rsqwYtlsfGmvjslU/nOY
	wtwM2CLPT76nnb6TgfQaTMKW5rO4rZZQELPT+byBkcUgeiFI1svppasM3CMZ6alzxnG1
	2+tg==
X-Gm-Message-State: AOPr4FVhJLuQno5bhazWpoVNQE0/+W0PV0mCTnaVqArNGTo3pw32fxd8nr+lFgQOM99CUw==
X-Received: by 10.129.110.138 with SMTP id j132mr6727044ywc.138.1462412096269; 
	Wed, 04 May 2016 18:34:56 -0700 (PDT)
Received: from lnx-dereks-laptop.hil-hsvuvhx.atl.wayport.net
	(ip-64-134-180-59.public.wayport.net. [64.134.180.59])
	by smtp.gmail.com with ESMTPSA id
	y83sm4091529ywc.37.2016.05.04.18.34.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 04 May 2016 18:34:55 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 May 2016 21:34:20 -0400
Message-Id: <1462412060-20750-2-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1462412060-20750-1-git-send-email-derek@asterius.io>
References: <1462412060-20750-1-git-send-email-derek@asterius.io>
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-oe][PATCHv2 2/2] leptonica: add PACAKGECONFIG for openjpeg
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
X-List-Received-Date: Thu, 05 May 2016 01:34:55 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-oe/recipes-graphics/leptonica/leptonica_1.73.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-graphics/leptonica/leptonica_1.73.bb b/meta-oe/recipes-graphics/leptonica/leptonica_1.73.bb
index 57bc5dd..0aebe89 100644
--- a/meta-oe/recipes-graphics/leptonica/leptonica_1.73.bb
+++ b/meta-oe/recipes-graphics/leptonica/leptonica_1.73.bb
@@ -11,4 +11,7 @@ EXTRA_OECONF += " \
     --without-libwebp \
 "
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[openjpeg] = "--with-libopenjpeg,--without-libopenjpeg,openjpeg"
+
 inherit autotools pkgconfig
-- 
1.9.1


