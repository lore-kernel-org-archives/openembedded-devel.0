Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id 3FA4478A47
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Mar 2018 04:03:44 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id c11-v6so640696plo.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Mar 2018 20:03:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=TMV4onUI4y4GDNtaHMAqTCYStX3cZcMQ0SfPcz6NMf8=;
	b=s+Ur4T+rK+ZljCfNZY6mJBomf1oVntMUrSNTnrS1e11fwzo6D+QklE+c32GMHED+JG
	rhLjzwT1PZw0qTCKO+IN3H7pg59fFgt6CSVFWZVoSkI4r7oUjnENLozCtIVxDJKLT+of
	Kof4JaaLgqPFZmtoILnKIDrvz0yrLFfshSLoBf3wTJVUfPUR3I3yFBPfUSZ3xmLAx83l
	0BfUQn1rFKlFAYHtab0X6c3Bbp2wXqYWtXRIIoEeKuLWy0rsc9DUB9DImM+PP3ABJ+jm
	Y/T4EUpXZDU5OqTzzYDLvRColjHpOxD8PDUoF29TmEciSnYSBzojX68xvnNJ5bnKiLOn
	yrcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=TMV4onUI4y4GDNtaHMAqTCYStX3cZcMQ0SfPcz6NMf8=;
	b=gvJtSvWZtkXRIgc/i2K0OMUHNzEyEpWAkYmY4uk5OcCFiFlzpwBSfRntuL3FvSondl
	9zC8Kf+migK+Kf7WE6+JRBhwlRChXBtlhqy9swz0Nd2LNDLukutYTcNAV055c14tOddz
	iKZWSJMDuEIIWYeFHhAjopm6RfoJy6RQonzQkzqWhBuDj/WGBq3nmq5O7+t61nrdzkKP
	bvfGezTdNCexSsu5Z/ecSrIPsHsmUJ7mSCIMOHm33TVsva8dXJVel44CTs4Domxo/R1V
	+tQgM4w8vgwDjkpx9bwj09AyIggxgoK/ZQaJcBjGgJtjprK3xvzU1wCcxZrM3JO8GQX+
	3+nw==
X-Gm-Message-State: APf1xPDgZDoS/CGoMlc6nZTbn80srYtOVVKHmfNrcFlc9cHbUMfllmkJ
	aBs5VU2ZGtE86ZtTq95E5/U=
X-Google-Smtp-Source: AG47ELuMrI8reZMeF0taarA408IZbie/XhyBkqDasV0nnOC7cmTdCAlC/rWUzPVZgAZ0M7ga8L9Uaw==
X-Received: by 2002:a17:902:6116:: with SMTP id
	t22-v6mr18927501plj.307.1520395425705; 
	Tue, 06 Mar 2018 20:03:45 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:6d76:b853:98d2:431c])
	by smtp.gmail.com with ESMTPSA id
	14sm30677152pga.53.2018.03.06.20.03.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 06 Mar 2018 20:03:45 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Tue,  6 Mar 2018 20:03:20 -0800
Message-Id: <1520395408-19266-17-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1520395408-19266-1-git-send-email-akuster808@gmail.com>
References: <1520395408-19266-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 17/25] gegl: only include when x11 in DISTRO_FEATURES
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
X-List-Received-Date: Wed, 07 Mar 2018 04:03:44 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-graphics/gegl/gegl_0.3.18.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/gegl/gegl_0.3.18.bb b/meta-oe/recipes-graphics/gegl/gegl_0.3.18.bb
index 6cc20f5..0053c0c 100644
--- a/meta-oe/recipes-graphics/gegl/gegl_0.3.18.bb
+++ b/meta-oe/recipes-graphics/gegl/gegl_0.3.18.bb
@@ -5,7 +5,9 @@ DEPENDS = "babl librsvg glib-2.0 gtk+ pango cairo expat zlib libpng jpeg virtual
 
 EXTRA_OECONF = "--disable-docs"
 
-inherit gnomebase vala gobject-introspection
+inherit distro_features_check gnomebase vala gobject-introspection
+
+REQUIRED_DISTRO_FEATURES = "x11"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[jasper] = "--with-jasper,--without-jasper,jasper"
-- 
2.7.4


