Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id E0A9770181
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 10:00:11 +0000 (UTC)
Received: by mail-wi0-f172.google.com with SMTP id hi2so9057067wib.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 03:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=gHjGT+escTLohDPCjb9bw+AdSHgbQWxS7Yc0BU3e4KE=;
	b=GbY2A8+0EnFAa3rVUZ8g4wBBclnDsRmRclCxS/2jgThpkjm7d4O65vyq5udK2oiHca
	Z22zSs86Yb4v4hOTOUK4WzFZNARQkh651Or/Tp2mx+edEVZlNxWnWgGlpAEBFO4igW0Y
	MwpzU8v7f6hpXldXmBTzdr+3vP6yq+OpizEhxockXCfRsjVrLcEXq32CQ/oCoXESJTiD
	hMT8hx2k2LzXOd6ZePiQcWjyC0EraiXYTO38Twy9AqUoJ5j6KItgemZiaj1q/Jo1rjDG
	DkhJay4hQYrAuwoYVtIQ0oZYi+01JupaUqlniPXWF/zMP7gDVm4wXNxMJzfdaFBfF48M
	oEpw==
X-Received: by 10.194.157.195 with SMTP id wo3mr2068705wjb.130.1403172010995; 
	Thu, 19 Jun 2014 03:00:10 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	u10sm10074447wix.11.2014.06.19.03.00.10 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 Jun 2014 03:00:10 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Jun 2014 11:59:42 +0200
Message-Id: <1403171993-26208-14-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <1403171993-26208-1-git-send-email-Martin.Jansa@gmail.com>
References: <1403171993-26208-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][WIP][PATCH 14/25] coriander: Blacklist because libsdl2-config was removed
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
X-List-Received-Date: Thu, 19 Jun 2014 10:00:18 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-multimedia/recipes-multimedia/coriander/coriander_2.0.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/coriander/coriander_2.0.2.bb b/meta-multimedia/recipes-multimedia/coriander/coriander_2.0.2.bb
index 0311551..1c113c2 100755
--- a/meta-multimedia/recipes-multimedia/coriander/coriander_2.0.2.bb
+++ b/meta-multimedia/recipes-multimedia/coriander/coriander_2.0.2.bb
@@ -5,6 +5,8 @@ LICENSE = "GPL-3.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 DEPENDS = "gtk+ libgnomeui libraw1394 libdc1394 libxv tiff"
 
+PNBLACKLIST[coriander] = "BROKEN: fails to use SDL probably because libsdl-config was removed, error: unknown type name 'SDL_Overlay'"
+
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/${PN}/coriander-2/${PV}/${P}.tar.gz \
            file://cross-compile.patch \
           "
-- 
2.0.0


