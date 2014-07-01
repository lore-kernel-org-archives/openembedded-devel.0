Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f43.google.com (mail-wg0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 794766AC66
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Jul 2014 16:04:44 +0000 (UTC)
Received: by mail-wg0-f43.google.com with SMTP id k14so1011722wgh.26
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Jul 2014 09:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=6IxTuaYTWiV69cdnTIGfXPrYyICa/krORv0aPsVh5/s=;
	b=wTRkmoYwltt6MMdy/EsscfjSLNnlBlv9K1/jf9vWzcQPRuD1cA72A76/P/EJCGv8LK
	XemY86gHlTJep6kWzkJ5PU/rozuFPOSrAsnvOYvGblFrBeOMt14r3P94KkEtM7rn3Tqi
	i4ALGfmvLDRQHEvgVa/Vzq9+i1Acs35iNwHZiGMp95nqNZIz3G9qLefHPCS1u+uQrpPP
	IVl4j5zTY42+lgZYz4br6lpIjmqosp686yid0Yl/48EpMp5epoOMK874/4JQWfGyBbbE
	8P9FhtNALFv7+zk5YnAfvu3VOx5CSmaiKVYtJIv6Qpr7D6/38ZioCnKeYzOTEe2pQ/rK
	Ht/Q==
X-Received: by 10.194.89.168 with SMTP id bp8mr53794423wjb.73.1404230683086;
	Tue, 01 Jul 2014 09:04:43 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	d12sm15444737wjx.0.2014.07.01.09.04.42 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Jul 2014 09:04:42 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Jul 2014 18:04:41 +0200
Message-Id: <1404230681-5064-4-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <1404230681-5064-1-git-send-email-Martin.Jansa@gmail.com>
References: <1404230681-5064-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 4/4] libgc: add PACKAGECONFIG for libatomic-ops
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
X-List-Received-Date: Tue, 01 Jul 2014 16:04:44 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/libgc/libgc_7.2d.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-support/libgc/libgc_7.2d.bb b/meta-oe/recipes-support/libgc/libgc_7.2d.bb
index b472a5d..66e6b92 100644
--- a/meta-oe/recipes-support/libgc/libgc_7.2d.bb
+++ b/meta-oe/recipes-support/libgc/libgc_7.2d.bb
@@ -16,5 +16,9 @@ S = "${WORKDIR}/gc-7.2"
 
 inherit autotools
 
+# by default use external libatomic-ops
+PACKAGECONFIG ??= "libatomic-ops"
+PACKAGECONFIG[libatomic-ops] = "--with-libatomic-ops=yes,--with-libatomic-ops=no,libatomics-ops"
+
 PACKAGES =+ "${PN}-docs"
 FILES_${PN}-docs = "/usr/share/gc"
-- 
2.0.0


