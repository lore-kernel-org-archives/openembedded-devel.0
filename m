Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RlHMn-0007dH-S4
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Jan 2012 10:54:41 +0100
Received: by mail-ee0-f47.google.com with SMTP id d17so496708eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Jan 2012 01:47:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=slG0mR/yPd11Nkq5RZg2uK9EpXh97enT7Kz/kGvLC8Q=;
	b=V/yxLWP91TqNhQyD82q3wdSz33vEz3kauYrjJaicFOgL2ugFk0PecEr9I3YJ2i0MEd
	VqFAVRuUZrgIiQtYUmJ5dCVSI33isGhjwTxlcl4ZwCmqcJr9lkfpAt2Sn2Koym228idH
	dlJYwz0CMdR4Y0Q94T9v7UbfUc/AaNdpxLhow=
Received: by 10.14.99.132 with SMTP id x4mr1099318eef.74.1326361633308;
	Thu, 12 Jan 2012 01:47:13 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id t1sm17460836eeb.3.2012.01.12.01.47.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 12 Jan 2012 01:47:12 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Jan 2012 10:46:20 +0100
Message-Id: <3b111fefe106d93a1a199e63dc9056985fb9886d.1326361490.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.3
In-Reply-To: <0796505f34620059cfed707c33f08b68f346937f.1326361490.git.Martin.Jansa@gmail.com>
References: <0796505f34620059cfed707c33f08b68f346937f.1326361490.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1326361490.git.Martin.Jansa@gmail.com>
References: <cover.1326361490.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 6/7] ca-certificates: upgrade to 20111211, old version not available anymore
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Jan 2012 09:54:41 -0000

From: Norman Schleicher <NormanSchleicher@gmx.de>

Signed-off-by: Norman Schleicher <NormanSchleicher@gmx.de>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...tes_20111025.bb => ca-certificates_20111211.bb} |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/ca-certificates/{ca-certificates_20111025.bb => ca-certificates_20111211.bb} (89%)

diff --git a/meta-oe/recipes-support/ca-certificates/ca-certificates_20111025.bb b/meta-oe/recipes-support/ca-certificates/ca-certificates_20111211.bb
similarity index 89%
rename from meta-oe/recipes-support/ca-certificates/ca-certificates_20111025.bb
rename to meta-oe/recipes-support/ca-certificates/ca-certificates_20111211.bb
index 10848b4..b79f5b1 100644
--- a/meta-oe/recipes-support/ca-certificates/ca-certificates_20111025.bb
+++ b/meta-oe/recipes-support/ca-certificates/ca-certificates_20111211.bb
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://debian/copyright;md5=6275b491c91b57d92ebe11205ebf4dfe
 SRC_URI = "${DEBIAN_MIRROR}/main/c/ca-certificates/ca-certificates_${PV}.tar.gz \
            file://remove-c-rehash.patch"
 
-SRC_URI[md5sum] = "dfd593c9f89e64351aae78b9be588696"
-SRC_URI[sha256sum] = "318bbf0f7c0a32adc10105f843148fd0e9e3b013de75645c02ea858652240924"
+SRC_URI[md5sum] = "f99a90a91b23338b4df765c0d18eba73"
+SRC_URI[sha256sum] = "6f0633136d17ffef3ed0adfb171a00136a320f0fd79c9c75733ac02662a754a7"
 
 inherit autotools allarch
 
-- 
1.7.8.3



