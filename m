Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id 84A5560CFC
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jun 2014 14:30:42 +0000 (UTC)
Received: by mail-wi0-f171.google.com with SMTP id n15so8071736wiw.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jun 2014 07:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=310IdzHqbDKOiRe/fsCBf4yWso6c9q9abaV4AJhOwaM=;
	b=tUwFKffpzJD3JEyB+9gXs7FDjcfZ9+SiCYr0px9vc4xou3oKWuqYywmbRlbXh0ZUFq
	0BRd57o6Iv3TCnywk8UdCRTw3NjZyG8fBE0OpLCcO1bmAXKDpdVal1szp+MaLT5zEvxP
	3+UsChh/M0Fh+DU5Xl7EIiz737Dw+zU2ZKboQ8/n2pW1E8ijvcN8+EDGF36PbzaIcZJ4
	xAqIsAXHHDg/7308RD+VqMxqifYgpm26GYV88PtpMBs5rPLnRVX07rezNd5y4a8CwJIh
	C2X1TmPEkoThrHYyWwotP09cDGFrtmqp53QjRL4Ux9PnP5b8rWcxQ2N4sFUVEgo1GWP/
	ledw==
X-Received: by 10.180.103.228 with SMTP id fz4mr41880454wib.4.1403706638461;
	Wed, 25 Jun 2014 07:30:38 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	r9sm54340452wia.17.2014.06.25.07.30.37 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 25 Jun 2014 07:30:37 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 25 Jun 2014 16:30:35 +0200
Message-Id: <1403706635-12134-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
Subject: [meta-browser][PATCHv2] firefox-{l10n, addon}: Drop runtime dependency on TUNE_PKGARCH firefox and keep allarch
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
X-List-Received-Date: Wed, 25 Jun 2014 14:30:46 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-mozilla/firefox-addon/firefox-addon.inc | 3 ++-
 recipes-mozilla/firefox-l10n/firefox-l10n.inc   | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/recipes-mozilla/firefox-addon/firefox-addon.inc b/recipes-mozilla/firefox-addon/firefox-addon.inc
index 93a89b4..45f079e 100644
--- a/recipes-mozilla/firefox-addon/firefox-addon.inc
+++ b/recipes-mozilla/firefox-addon/firefox-addon.inc
@@ -2,7 +2,8 @@
 # Released under the MIT license (see packages/COPYING)
 
 DEPENDS = "mozilla-devscripts-native"
-RDEPENDS_${PN} = "firefox"
+# drop to keep allarch
+# RDEPENDS_${PN} = "firefox"
 
 LICENSE = "MPLv1 | GPLv2+ | LGPLv2.1+"
 
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n.inc b/recipes-mozilla/firefox-l10n/firefox-l10n.inc
index e071905..7b252a2 100644
--- a/recipes-mozilla/firefox-l10n/firefox-l10n.inc
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n.inc
@@ -2,7 +2,8 @@
 # Released under the MIT license (see packages/COPYING)
 
 DEPENDS = "mozilla-devscripts-native"
-RDEPENDS_${PN} = "firefox"
+# drop to keep allarch
+# RDEPENDS_${PN} = "firefox"
 
 LICENSE = "MPLv1 | GPLv2+ | LGPLv2.1+"
 
-- 
2.0.0


