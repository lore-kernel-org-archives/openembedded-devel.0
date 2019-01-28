Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id 6CA0E7C47D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Jan 2019 11:50:21 +0000 (UTC)
Received: from linuxdev2.toradex.int (unknown [46.140.72.82])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 90C445C0231;
	Mon, 28 Jan 2019 12:50:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1548676221;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:content-type:content-transfer-encoding:
	in-reply-to:references; bh=YaevcPR4yKTq2wIn4oE1xlQ2w1QMlLSLKVKIVf9UdBI=;
	b=Pn/PRsKVHH+HGPoZng9VLeB1p2Fs0VyoM01dWFhW6iV4Od/iY8V4pL/sR6+aU39qkmrp/P
	i9poGfSiQiyFLKTBBNreMrLmDriaIYABe4kBHNUnvlc28UGerPOpNjbd+P5UNLILJ8M6Yh
	qSf/We2G5ALf1JX2QkZL9HexMZsyAig=
From: Stefan Agner <stefan@agner.ch>
To: raj.khem@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Mon, 28 Jan 2019 12:50:17 +0100
Message-Id: <20190128115018.8210-1-stefan@agner.ch>
X-Mailer: git-send-email 2.13.6
Cc: Stefan Agner <stefan.agner@toradex.com>
Subject: [PATCH 1/2] ell: update to 0.17
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
X-List-Received-Date: Mon, 28 Jan 2019 11:50:21 -0000

From: Stefan Agner <stefan.agner@toradex.com>

Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
---
 meta-oe/recipes-core/ell/{ell_0.15.bb => ell_0.17.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-core/ell/{ell_0.15.bb => ell_0.17.bb} (88%)

diff --git a/meta-oe/recipes-core/ell/ell_0.15.bb b/meta-oe/recipes-core/ell/ell_0.17.bb
similarity index 88%
rename from meta-oe/recipes-core/ell/ell_0.15.bb
rename to meta-oe/recipes-core/ell/ell_0.17.bb
index 5dbad50f3..27f11cfbe 100644
--- a/meta-oe/recipes-core/ell/ell_0.15.bb
+++ b/meta-oe/recipes-core/ell/ell_0.17.bb
@@ -7,7 +7,7 @@ SECTION = "libs"
 inherit autotools pkgconfig
 
 S = "${WORKDIR}/git"
-SRCREV = "ea0f5f42e3af3fad2b60ee87719cdd227fd89ab0"
+SRCREV = "ebc021cee3b2d20ca2af5e3ed02495da616b2fd3"
 SRC_URI = "git://git.kernel.org/pub/scm/libs/ell/ell.git"
 
 do_configure_prepend () {
-- 
2.13.6


