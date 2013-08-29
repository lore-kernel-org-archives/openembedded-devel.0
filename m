Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f182.google.com (mail-ea0-f182.google.com
	[209.85.215.182])
	by mail.openembedded.org (Postfix) with ESMTP id 373B76BE44
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 15:51:57 +0000 (UTC)
Received: by mail-ea0-f182.google.com with SMTP id o10so346785eaj.27
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 08:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=eGubt18oONTq2CGK6zUsJl4LP1O7Smkn6RoKYhTg0l8=;
	b=z/siFC2XsSJ+n3vhzf2X+p6Id4a4KrAfnL13saQw9VPO3LiXwLZ3JR7aAd0NPcUQwp
	sXvnOQAAH5vPRtgMzVsWp7wFPdPqGOb5KHVx9+fLWcWBuPCFc66uPeFF5XFG/lrERouA
	q0H5O578YSfEh+vKmgrkISUSHSeUhIBNg/bbIbz+7ulbam3eChYLyRrpEu8K8btyKxO8
	ZZeCHs5RCDBSpglmubuUB6UR35uGKHzrn9uuZX8C7kfKygK9jBOpFmJhp1bSagO8NFLP
	PhGubWHTpaYXIRcajmOFqS67tmFT0kaQut+0g5r6/svEGTx+qa8NOFED/iTuv/awyidn
	AyCA==
X-Received: by 10.15.75.73 with SMTP id k49mr5305901eey.36.1377791517665;
	Thu, 29 Aug 2013 08:51:57 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	a6sm47163102eei.10.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 08:51:57 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Aug 2013 17:51:44 +0200
Message-Id: <e92b7e2841ecd45de71847dd1b299afa45a1008f.1377791378.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
Subject: [WIP][PATCH 51/66] lightmediascanner: Add PACKAGECONFIG for ogg
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
X-List-Received-Date: Thu, 29 Aug 2013 15:51:57 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-multimedia/lightmediascanner/lightmediascanner_0.4.4.bb    | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-efl/recipes-multimedia/lightmediascanner/lightmediascanner_0.4.4.bb b/meta-efl/recipes-multimedia/lightmediascanner/lightmediascanner_0.4.4.bb
index a3ff5d2..f17a443 100644
--- a/meta-efl/recipes-multimedia/lightmediascanner/lightmediascanner_0.4.4.bb
+++ b/meta-efl/recipes-multimedia/lightmediascanner/lightmediascanner_0.4.4.bb
@@ -15,6 +15,9 @@ SRC_URI[sha256sum] = "302a7f6cc355467cd20332f4e02c8b87ba6c0c7a6818a6a987e007aace
 
 S = "${WORKDIR}/release_${PV}"
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[ogg] = "--enable-ogg,--disable-ogg,libvorbis"
+
 inherit autotools pkgconfig
 
 do_install_append() {
-- 
1.8.3.2


