Return-Path: <paul.betafive@gmail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 782B572974
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Dec 2014 22:08:20 +0000 (UTC)
Received: by mail-wi0-f173.google.com with SMTP id r20so6507057wiv.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Dec 2014 14:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=wLaouGWfdtJca1gQNvmnrnGmelRdxO9UUkDi04HfNiI=;
	b=uLZV1HbisR0K9KgReHmDBC+h4x0VbVk4TZdSYlBFNdaXwV3axGhCtAnlQ1EBzXVpst
	VmnQ5VTIzmp3WjPxaP6IHv3ceDxcn7u4APJ1OIY9YFoyeM8tmq0H301tr+BfsuT6dc5E
	hI3lV7x4wxrMl8TlIjvLHnUeOCkO/Ylb5fq0dlbwDMnkDgu3ojNGouQDExe7trkXSfl/
	lluOzIjEx4s/o/xHk5T3kPW894WE+z+5Htpk2kBGwYxDHYrq9cctHf8QA9xD/9FYPjuD
	ojIoK4Z6FerWdxlg9waSFKGnBrO3ERhi1XOel1xoA2rTa4Oo4O/LFdweXPHuktvCTPKN
	bkmA==
X-Received: by 10.194.6.70 with SMTP id y6mr19856942wjy.97.1419199700314;
	Sun, 21 Dec 2014 14:08:20 -0800 (PST)
Received: from nuc.betafive.co.uk
	(cpc19-shep11-2-0-cust55.8-3.cable.virginm.net. [81.111.243.56])
	by mx.google.com with ESMTPSA id j1sm21359157wjw.25.2014.12.21.14.08.19
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 21 Dec 2014 14:08:19 -0800 (PST)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: OE Devel <openembedded-devel@lists.openembedded.org>
Date: Sun, 21 Dec 2014 22:08:09 +0000
Message-Id: <1419199689-27666-1-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 1.9.1
Subject: [meta oe][PATCH] distro-feed-configs: Make list of archs configurable
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
X-List-Received-Date: Sun, 21 Dec 2014 22:08:28 -0000

The list of architectures for which to emit feed configurations is now taken
from the DISTRO_FEED_ARCHS variable. The default value for this variable is the
list of architectures which was previously used. Thus in the default case
nothing is changed, but DISTRO_FEED_ARCHS can now be overridden in local.conf.

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
---
 meta-oe/recipes-core/meta/distro-feed-configs.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/meta/distro-feed-configs.bb b/meta-oe/recipes-core/meta/distro-feed-configs.bb
index dde8656..ea5ca38 100644
--- a/meta-oe/recipes-core/meta/distro-feed-configs.bb
+++ b/meta-oe/recipes-core/meta/distro-feed-configs.bb
@@ -5,10 +5,11 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384
 
 DISTRO_FEED_PREFIX ?= "remote"
 DISTRO_FEED_URI ?= "http://my-distribution.example/remote-feed/"
+DISTRO_FEED_ARCHS ?= "all ${PACKAGE_EXTRA_ARCHS} ${MACHINE_ARCH}"
 
 do_compile() {
     mkdir -p ${S}/${sysconfdir}/opkg
-    for feed in all ${PACKAGE_EXTRA_ARCHS} ${MACHINE_ARCH}; do
+    for feed in ${DISTRO_FEED_ARCHS}; do
         echo "src/gz ${DISTRO_FEED_PREFIX}-${feed} ${DISTRO_FEED_URI}/${feed}" > ${S}/${sysconfdir}/opkg/${feed}-feed.conf
     done
 }
-- 
1.9.1


