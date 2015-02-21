Return-Path: <sven.ebenfeld@gmail.com>
Received: from mail-we0-f171.google.com (mail-we0-f171.google.com
	[74.125.82.171])
	by mail.openembedded.org (Postfix) with ESMTP id ADFB771637
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Feb 2015 09:52:49 +0000 (UTC)
Received: by wevk48 with SMTP id k48so9676304wev.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Feb 2015 01:52:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Km/Nw9MxOE1V/yPxQCC9t36BP5fDLvVv+CDp335pY64=;
	b=PQquqlK/qlzs64wCudkIQ2PFjsBokfiwHtldiF4wneWjJhcMIE1+mh5Jbju1LaX8PN
	WkuMD2aVcCmcki1I3j1EoC0P8lGfeGbMFFlXaoz+A8q9OxFvd4XHGZm9CLg4iWqvqrmT
	vL9xrcYtudDleGq3qYkDH3uLrNvxLLVywjpqUtWTAmDIEFPGYcD2Z2axeSDxTs91hLGv
	c3iBFIDR6vxlqDfpqmCiR9uN5DqgPOUV44H2bgapOMl6MVRrhw1IF5j/9g0nSByZ6elS
	dfNo/QRuxzhhITBehkkPiEq+HqvJdn/UZMisq5RmELscEfXJ3i5yGRg2UkQ//IHj+xyo
	lS8Q==
X-Received: by 10.194.178.161 with SMTP id cz1mr3463373wjc.102.1424512370256; 
	Sat, 21 Feb 2015 01:52:50 -0800 (PST)
Received: from localhost.localdomain (ip-84-119-96-251.unity-media.net.
	[84.119.96.251])
	by mx.google.com with ESMTPSA id dm6sm6232120wib.22.2015.02.21.01.52.48
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 21 Feb 2015 01:52:49 -0800 (PST)
From: Sven Ebenfeld <sven.ebenfeld@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 21 Feb 2015 10:52:09 +0100
Message-Id: <1424512336-47007-2-git-send-email-sven.ebenfeld@gmail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1424512336-47007-1-git-send-email-sven.ebenfeld@gmail.com>
References: <1424512336-47007-1-git-send-email-sven.ebenfeld@gmail.com>
Subject: [meta-oe][PATCH 1/7] lightmediascanner: Fix SRC_URI
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
X-List-Received-Date: Sat, 21 Feb 2015 09:52:51 -0000

Signed-off-by: Sven Ebenfeld <sven.ebenfeld@gmail.com>
---
 .../lightmediascanner/lightmediascanner_0.4.4.bb                  | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-efl/recipes-multimedia/lightmediascanner/lightmediascanner_0.4.4.bb b/meta-efl/recipes-multimedia/lightmediascanner/lightmediascanner_0.4.4.bb
index a50563a..4ed3664 100644
--- a/meta-efl/recipes-multimedia/lightmediascanner/lightmediascanner_0.4.4.bb
+++ b/meta-efl/recipes-multimedia/lightmediascanner/lightmediascanner_0.4.4.bb
@@ -8,12 +8,12 @@ DEPENDS = "sqlite3 flac virtual/libiconv"
 
 PR = "r2"
 
-SRC_URI = "http://git.profusion.mobi/cgit.cgi/lightmediascanner.git/snapshot/release_${PV}.tar.bz2 \
+SRC_URI = "https://github.com/profusion/lightmediascanner/archive/release_${PV}.tar.gz \
 "
-SRC_URI[md5sum] = "f423376a70f8f321af69b12563b176fe"
-SRC_URI[sha256sum] = "302a7f6cc355467cd20332f4e02c8b87ba6c0c7a6818a6a987e007aace19b41e"
+SRC_URI[md5sum] = "0c758d40eb70288a2c714dfb44c35171"
+SRC_URI[sha256sum] = "1bbc28fbe5efbc24aa4eac9e43bbb178a1669de1418afee47b0c6898aff53433"
 
-S = "${WORKDIR}/release_${PV}"
+S = "${WORKDIR}/lightmediascanner-release_${PV}"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[ogg] = "--enable-ogg,--disable-ogg,libvorbis"
-- 
1.9.3


