Return-Path: <twoerner@gmail.com>
Received: from mail-it0-f68.google.com (mail-it0-f68.google.com
	[209.85.214.68])
	by mail.openembedded.org (Postfix) with ESMTP id 416007608F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 May 2018 15:21:14 +0000 (UTC)
Received: by mail-it0-f68.google.com with SMTP id y189-v6so2460354itb.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 May 2018 08:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=HqYz5+Abj3V41lLUJjiTtcTcqkNRe/j4PLnDj5tvVcQ=;
	b=jrxlwJycDRCab9JSkB6p43ydKpOzitlk8nvY0Mchq2AsWqbHX2Fhn5JJdf3rUA0U8O
	vlzIcZk4Ot1lpYFJnZEgYjH3oYLRz4hDLXtl1boAUXthS3szammRwI7qiDjsW2Rx/j4b
	vUovH/1aAoa28s+5P0jzOMFyQBrg0l55c189sV37IjNJ5fk9EQNgVH3wJRWbXcUxJ9QB
	Ekq90gBX1nOkbL5yDQ5+FHUGsL8k5byI4pQ9W2jlW78jHFEW/m2jYJri7mBVR6z7kgpr
	0ssILes8jSVQK1MksGIO4q+0Z7U9jj21nMZ0wSI1iK30t/2koWkofiNgA5lZJwp7552d
	btIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=HqYz5+Abj3V41lLUJjiTtcTcqkNRe/j4PLnDj5tvVcQ=;
	b=kkTwEw0EYFZJ3lzaUBdE/6sFvob6KLAAIX3rHBbhbXCnHdJORiQjPFWjH8+UE/x5fz
	YKYhogt3pG+NoY1OjWrPlw7IISPJB/zjGEq8wnGZqV435EntsoOI7Oo10G0m0+9GgrYE
	1uKObOHtKVTBjgxD+Pbov2Q+I0Aczo0q2tepIaOZaSLKQJoMDooKswQQNBoR6v0ovqMe
	/PmhX/XwtSJAPQ0WLZnTL6HtttGqH+gsyXSdIh/8x5CLeGTY7ybFN7k0j501TFlU3MAz
	VKx9XR/JHfjkfdB3ydKj9lLK/Bkx3wmI8xJiBwKd3JtzPnDFNKtkYltX4NaJ0awMfvA+
	7a4w==
X-Gm-Message-State: ALKqPwerMNsaEMAMAnO8ytyC8UJW9OC9uZtpomuQ2/+t47Uvv4jtt1VQ
	hJP6CVpifg5keNlehQ19EC+d9Ov8
X-Google-Smtp-Source: AB8JxZqvCjbeIPfsj4dTT3ccZO1AUVa8v8keE14qnCMNEwng+72PaEYmyao6SyTTNYjSUX7ZNbzRZA==
X-Received: by 2002:a24:7:: with SMTP id 7-v6mr3544129ita.20.1526052075472;
	Fri, 11 May 2018 08:21:15 -0700 (PDT)
Received: from linux-uys3.suse ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id
	y204-v6sm1625101ioy.88.2018.05.11.08.21.13
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 11 May 2018 08:21:14 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 11 May 2018 11:21:08 -0400
Message-Id: <20180511152109.28074-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.17.0.rc2.3.gc2a499e6c
Subject: [meta-oe][PATCH 1/2] libuv: switch away from github archive
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
X-List-Received-Date: Fri, 11 May 2018 15:21:15 -0000

Since we know that github archives which are automatically generated have a
tendency to change their checksums[1], switch to using a git clone.

[1] http://lists.openembedded.org/pipermail/openembedded-devel/2017-September/114916.html

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta-oe/recipes-connectivity/libuv/libuv_1.11.0.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-connectivity/libuv/libuv_1.11.0.bb b/meta-oe/recipes-connectivity/libuv/libuv_1.11.0.bb
index 0a5846bb8b..ca4685ab3e 100644
--- a/meta-oe/recipes-connectivity/libuv/libuv_1.11.0.bb
+++ b/meta-oe/recipes-connectivity/libuv/libuv_1.11.0.bb
@@ -4,10 +4,10 @@ BUGTRACKER = "https://github.com/libuv/libuv/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bb5ea0d651f4c3519327171906045775"
 
-SRC_URI = "https://github.com/libuv/${BPN}/archive/v${PV}.tar.gz;downloadfilename=${BP}.tar.gz"
-
-SRC_URI[md5sum] = "15550a9f5f45f7f32ae2d9bb0a21a2a7"
-SRC_URI[sha256sum] = "6ec7eec6ecc24b1a8ffedebedb2fe9313fffb5410de89aaf784dd01080411c7a"
+S = "${WORKDIR}/git"
+SRCREV = "7452ef4e06a4f99ee26b694c65476401534f2725"
+BRANCH = "v1.x"
+SRC_URI = "git://github.com/libuv/libuv.git;protocol=https;branch=${BRANCH};"
 
 inherit autotools
 
-- 
2.17.0.rc2.3.gc2a499e6c


