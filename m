Return-Path: <costamagna.gianfranco@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id B66AF71C86
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 May 2017 12:28:46 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id b84so39343965wmh.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 May 2017 05:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=nbag8eq7427RbOGLF/SctChZ6H0nnjoXPxJcPKLXICQ=;
	b=M43NP5pXbNVSkVMby+hQIAnrqDnJwWzrwmStK/aFFCF/TwbA5JoxwkxyAoLaIdiSRP
	vWILTaICWV5aRdroU5oWu5T6U+btR5nzvIDkSEW9ptBPGD+wIQxTWc6VvlLffjVZSzG+
	TvbI2zCbKeg6N6bF9Mx5a39f8I4ilccl1k/Ni9+JnNwlXH/q7LXgFyHOv0dWkrokR2Fz
	MHrvMrKH7tfHgCjgzhNdiJO4hU/EKBbYOrQD8Z0Hdasa1F/LstrqQJdIPBxhvTIVrGQO
	jG1agEKmwjVAhMUtnlYsg+WVwRpUlrb48nh2mshS3u2YWqMOPjyo4+D3ong/3jEAf95u
	TCVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=nbag8eq7427RbOGLF/SctChZ6H0nnjoXPxJcPKLXICQ=;
	b=iH9SwphrQYMvBGJWWXeI1MVPQUxxMrSbzLUnoVNDtTf+7D5S+vVYgIx00RvZ2/Ci5/
	mUZ+6vaygxO3JiWgBbTtCwkCOT8y3gsQaHzYF6bcGRaWSQYy45l+3rlLHyNcSLRcxcA9
	kmF00f/NHgKzRIhLrFyms6IEQ0MyWxP7V2PJeBdejUAEfzQa/g+x5elmbwrBJkkA7Pgc
	Ls+BQcP49e5JiSY1D8IoRslTd6RJdIq+2jFm2R2GZmglY7Zs1rrkNeck4ityv7EdI8jI
	Fqm8xdnYLogS898mj4BbsvtphiEvU0C1oMwRTDhbRhaIlIWIIq7aQYnuoQdAK6GwYc8O
	xUgw==
X-Gm-Message-State: AODbwcAg9TuC+hAE3ahJMumqTQLk85MEVu7wwa713h75LyDvxDBRBQsl
	VVNOvy1YSSOpInAy38U=
X-Received: by 10.28.147.198 with SMTP id v189mr735134wmd.52.1494505727284;
	Thu, 11 May 2017 05:28:47 -0700 (PDT)
Received: from localhost.localdomain ([151.68.54.167])
	by smtp.gmail.com with ESMTPSA id z14sm6295476wmz.2.2017.05.11.05.28.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 11 May 2017 05:28:46 -0700 (PDT)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 11 May 2017 14:28:40 +0200
Message-Id: <1494505721-28247-1-git-send-email-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.7.4
Cc: Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>
Subject: [meta-oe] [PATCH] libndp: switch to github uri. libndp.org is unstable
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
X-List-Received-Date: Thu, 11 May 2017 12:28:47 -0000

From: Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>

Signed-off-by: Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>
---
 meta-oe/recipes-connectivity/libndp/libndp_1.6.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-connectivity/libndp/libndp_1.6.bb b/meta-oe/recipes-connectivity/libndp/libndp_1.6.bb
index a35dff8..7d53dc6 100644
--- a/meta-oe/recipes-connectivity/libndp/libndp_1.6.bb
+++ b/meta-oe/recipes-connectivity/libndp/libndp_1.6.bb
@@ -3,8 +3,8 @@ SUMMARY = "Library for IPv6 Neighbor Discovery Protocol"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI = "http://libndp.org/files/${BPN}-${PV}.tar.gz"
-SRC_URI[md5sum] = "1e54d26bcb4a4110bc3f90c5dd04f1a7"
-SRC_URI[sha256sum] = "0c7dfa84e013bd5e569ef2c6292a6f72cfaf14f4ff77a77425e52edc33ffac0e"
+SRC_URI = "https://github.com/jpirko/libndp/archive/v${PV}.tar.gz"
+SRC_URI[md5sum] = "de58352aaee0e8edb744f1aef852cdce"
+SRC_URI[sha256sum] = "565d6c4167f83ec697c762ea002f23e8f0b00828d0749b1ce928f068543e5aad"
 
 inherit autotools
-- 
2.7.4


