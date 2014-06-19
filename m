Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f50.google.com (mail-wg0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id A674A7016D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 10:00:16 +0000 (UTC)
Received: by mail-wg0-f50.google.com with SMTP id x13so2011712wgg.21
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 03:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Umxy2yKqksHoReh1Dekn66XOle7ZjBh+f14GKY7LIFQ=;
	b=o5PXrAQ9g58dofG6pHKuj/ITDUJhecuQGehh2XOW9IlVMqARUXRU63pBdtpTb0crN4
	J68nBkTqMcHCv2O12eKVFraC0e0JZ1OM6yN4FZjZlcQ2c0De97qGE6du8byDRkOsTQnP
	WslDQ4rb0X8iqpzFw7eoLnCDSeyqg5+mBbG3031BMgdlS14QrK1j3M5TtjCfg+uU1cRg
	mPN5F+gUvlIGSqfWZk1AQOPTKVviCA1XUUW+8GZyuW8CG00rl2EmeZq61GqEZJOf/12m
	7gW5J9zCN4CvoIcD0t3QiazKZ1LRbuzOxNpG5MzidIMoGZ3b2lUo8SQtt5CrSLmSagf+
	ymbg==
X-Received: by 10.194.92.244 with SMTP id cp20mr3746348wjb.109.1403172017304; 
	Thu, 19 Jun 2014 03:00:17 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	gi8sm10078768wib.8.2014.06.19.03.00.16 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 Jun 2014 03:00:16 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Jun 2014 11:59:47 +0200
Message-Id: <1403171993-26208-19-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <1403171993-26208-1-git-send-email-Martin.Jansa@gmail.com>
References: <1403171993-26208-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][WIP][PATCH 19/25] mkvtoolnix: Blacklist because of broken with B!=S
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
 meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_5.9.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_5.9.0.bb b/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_5.9.0.bb
index 3b8eb32..7c40bb3 100644
--- a/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_5.9.0.bb
+++ b/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_5.9.0.bb
@@ -4,6 +4,8 @@ HOMEPAGE = "http://www.bunkus.org/videotools/mkvtoolnix/source.html"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
+PNBLACKLIST[mkvtoolnix] = "BROKEN: doesn't build with B!=S (ac/ebml.m4 path without ${S})"
+
 DEPENDS = "curl boost expat zlib libebml libmatroska libogg libvorbis bzip2 lzo file ruby-native"
 
 SRC_URI = "http://www.bunkus.org/videotools/mkvtoolnix/sources/mkvtoolnix-${PV}.tar.bz2"
-- 
2.0.0


