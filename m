Return-Path: <iwamatsu@nigauri.org>
Received: from mail-pd0-f169.google.com (mail-pd0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id 31EC372381
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Dec 2014 01:19:41 +0000 (UTC)
Received: by mail-pd0-f169.google.com with SMTP id z10so4129032pdj.14
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 07 Dec 2014 17:19:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=8jIM8bJa5OBUxGq2qjbBrWKU2xoUedhdr9D8nqhwZOc=;
	b=PYe4Uc/OcsSzWvhYBMzDmoI1AcEm90r6I24dYQEsJ/dyLtuzz0Z2fhgurYIbeQ17y4
	gPiXKt3NEb+cE1TnjqFHG06o8VcHkr5JkTmmch9dXuRTX3VtpNB4iCtJHigqDLMH/3hB
	i01TlJPUqzNclaLXgjqkOOgYBM48387+NnoVfCAJy+D+sY5Pr3babPvRaqQzD1x8aCh6
	qXZ5XUIHqH6mWJ/cP4jwaDVEdiV5U/evjqHAgyk+gCeATrIIr/3LrtFVHm3W8DBNS8Ma
	pOYTZZEETLwgRUxfCxHm5sYndH5aSrjZLQ1wYfZzW57vYwUhsP7U4zTTLqpKpCisW6jl
	AqGA==
X-Gm-Message-State: ALoCoQlfd0KxKpgDDz0R7a1Oa4+bEuSyi1wwE3AT9iAIhbEW+L7GVQ1t4ww2sDR5HjaZSXBGO+AH
X-Received: by 10.68.203.226 with SMTP id kt2mr55042277pbc.141.1418001582404; 
	Sun, 07 Dec 2014 17:19:42 -0800 (PST)
Received: from xps-iwamatsu.renesas.com (49.14.32.202.bf.2iij.net.
	[202.32.14.49]) by mx.google.com with ESMTPSA id
	i11sm34630954pbq.23.2014.12.07.17.19.39 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 07 Dec 2014 17:19:40 -0800 (PST)
Sender: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
From: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.yj@renesas.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  8 Dec 2014 10:19:09 +0900
Message-Id: <1418001549-7216-2-git-send-email-nobuhiro.iwamatsu.yj@renesas.com>
X-Mailer: git-send-email 2.1.3
In-Reply-To: <1418001549-7216-1-git-send-email-nobuhiro.iwamatsu.yj@renesas.com>
References: <1418001549-7216-1-git-send-email-nobuhiro.iwamatsu.yj@renesas.com>
Subject: [meta-oe][PATCH 2/2] media-ctl: Remove recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 08 Dec 2014 01:19:42 -0000

media-ctl was merged into v4l-utils.

Signed-off-by: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.yj@renesas.com>
---
 .../recipes-multimedia/v4l2apps/media-ctl_git.bb   |   21 --------------------
 1 file changed, 21 deletions(-)
 delete mode 100644 meta-oe/recipes-multimedia/v4l2apps/media-ctl_git.bb

diff --git a/meta-oe/recipes-multimedia/v4l2apps/media-ctl_git.bb b/meta-oe/recipes-multimedia/v4l2apps/media-ctl_git.bb
deleted file mode 100644
index 86e5364..0000000
--- a/meta-oe/recipes-multimedia/v4l2apps/media-ctl_git.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-SUMMARY = "Media controller control application"
-LICENSE = "LGPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=d749e86a105281d7a44c2328acebc4b0"
-
-DEPENDS = "linux-libc-headers"
-
-SRC_URI = "git://git.ideasonboard.org/media-ctl.git"
-SRCREV = "a6ec4a37028952ffd6e62eb52648cf66248eb519"
-
-PV = "0.0.1"
-PR = "r4"
-S = "${WORKDIR}/git"
-
-inherit autotools pkgconfig
-
-EXTRA_OECONF = "--with-kernel-headers=${STAGING_EXECPREFIXDIR}"
-
-PACKAGES =+ "libmediactl libv4l2subdev"
-FILES_libmediactl = "${libdir}/libmediactl${SOLIBS}"
-FILES_libv4l2subdev = "${libdir}/libv4l2subdev${SOLIBS}"
-
-- 
1.7.9.5


