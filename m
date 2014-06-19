Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f46.google.com (mail-wg0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id DED3F6FD64
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 10:00:06 +0000 (UTC)
Received: by mail-wg0-f46.google.com with SMTP id y10so2054856wgg.29
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 03:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=esIUrgXAJsSazmpYRpqJSZLAebfdQRwRs/FR0GYNu/M=;
	b=R+QWtpUns9u95FNltHaorO+uVm+DsYjcLT5IW5MVa/saVtBY45GpbF/zUEAi29hVWd
	IN/5tuPyY2iHWvtlvo929FUhxeQAZR8VwF64eiD8hKioydldYCaMoYyNNHrDvpH3kV0f
	b1UoxI0EyW2dtXTeR3moLjuCHkjlKSE1auXkuwVCuUcxJdGLGUPhh6zv26B0VmspI3xn
	GIJjOrYUgZDYYfu72xFO1pqlwsbRldav0q/ZfB8i7Uy8EskFJxBvDSjx6WQsbV/IU3jj
	5sE1G3nLG8/Bda7tU/tMJxgwd4aYK8sk3W86qpYDQFwXP4ostHfD71Lz4Zv7/yr+sAcX
	oXjA==
X-Received: by 10.194.240.34 with SMTP id vx2mr2194434wjc.128.1403172007058;
	Thu, 19 Jun 2014 03:00:07 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	u10sm10073952wix.11.2014.06.19.03.00.06 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 Jun 2014 03:00:06 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Jun 2014 11:59:39 +0200
Message-Id: <1403171993-26208-11-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <1403171993-26208-1-git-send-email-Martin.Jansa@gmail.com>
References: <1403171993-26208-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][WIP][PATCH 11/25] sylpheed: Blacklist because of broken with B!=S
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
X-List-Received-Date: Thu, 19 Jun 2014 10:00:09 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-sato/claws-mail/sylpheed_2.7.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-sato/claws-mail/sylpheed_2.7.1.bb b/meta-oe/recipes-sato/claws-mail/sylpheed_2.7.1.bb
index a878220..a793fde 100644
--- a/meta-oe/recipes-sato/claws-mail/sylpheed_2.7.1.bb
+++ b/meta-oe/recipes-sato/claws-mail/sylpheed_2.7.1.bb
@@ -7,6 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4325afd396febcb659c36b49533135d4 \
 
 PR = "r2"
 
+PNBLACKLIST[sylpheed] = "BROKEN: Doesn't work with B!=S"
+
 SRC_URI = "http://sylpheed.sraoss.jp/sylpheed/v2.7/sylpheed-${PV}.tar.bz2 \
     file://glib-2.32.patch \
 "
-- 
2.0.0


