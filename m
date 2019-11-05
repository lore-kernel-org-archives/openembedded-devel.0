Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id 784387F79D
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Nov 2019 23:19:01 +0000 (UTC)
Received: from paloverde.toradex.int (unknown [31.10.206.124])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id B0A895C2B12;
	Wed,  6 Nov 2019 00:19:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1572995941;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:content-type:content-transfer-encoding:
	in-reply-to:references; bh=3i+szPRFve8+K8C5iCwRzjx0tmta4EhBXMHTSSzdEig=;
	b=x1NbT+IW4g5egvN1nskOJSEglP9yExcW6VQXoLPCz8klbimFNszv0WrXKvzsFjzVz3Yv9z
	1WLGmmVU6i5SOGQpZ/oCYP3RnDBNTFSZTTdtgTLXOyjCsxjj4JItODgDkjB8eO/NJSFNh6
	eWEgKvNmEbALnaqwrTrBmq22fqdyufM=
From: Stefan Agner <stefan@agner.ch>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Nov 2019 23:18:55 +0000
Message-Id: <20191105231855.28022-1-stefan@agner.ch>
X-Mailer: git-send-email 2.17.1
Cc: Stefan Agner <stefan.agner@toradex.com>
Subject: [meta-oe][PATCH] zstd: Upgrade 1.4.3 -> 1.4.4
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
X-List-Received-Date: Tue, 05 Nov 2019 23:19:01 -0000

From: Stefan Agner <stefan.agner@toradex.com>

Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
---
 meta-oe/recipes-extended/zstd/{zstd_1.4.3.bb => zstd_1.4.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/zstd/{zstd_1.4.3.bb => zstd_1.4.4.bb} (95%)

diff --git a/meta-oe/recipes-extended/zstd/zstd_1.4.3.bb b/meta-oe/recipes-extended/zstd/zstd_1.4.4.bb
similarity index 95%
rename from meta-oe/recipes-extended/zstd/zstd_1.4.3.bb
rename to meta-oe/recipes-extended/zstd/zstd_1.4.4.bb
index e97b4efb2..eb201f413 100644
--- a/meta-oe/recipes-extended/zstd/zstd_1.4.3.bb
+++ b/meta-oe/recipes-extended/zstd/zstd_1.4.4.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c7f0b161edbe52f5f345a3d1311d0b32 \
 
 SRC_URI = "git://github.com/facebook/zstd.git;nobranch=1"
 
-SRCREV = "a3d655d2255481333e09ecca9855f1b37f757c52"
+SRCREV = "10f0e6993f9d2f682da6d04aa2385b7d53cbb4ee"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.17.1


