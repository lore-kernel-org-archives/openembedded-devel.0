Return-Path: <pjtexier@koncepto.io>
Received: from koncepto.io (koncepto.io [195.154.119.111])
	by mail.openembedded.org (Postfix) with ESMTP id B9BB17F7D7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Dec 2019 19:07:40 +0000 (UTC)
Received: from menoah.home (lfbn-bor-1-974-38.w90-120.abo.wanadoo.fr
	[90.120.168.38]) by koncepto.io (Postfix) with ESMTPSA id EFB336004D;
	Mon, 30 Dec 2019 20:07:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1577732861;
	bh=gCCxZIoa1eDHgIoiCHAj2gq0Qo2V+0kDIOyLmpBVy28=;
	h=From:To:Cc:Subject:Date:From;
	b=rH3vbaATKoVzx4btfuwARZiHQYa3H9UCW0WIVkeo/4YCSTjGFaxxZ8UOTRiKdhW3Y
	gqBWq8QCUwU0QcGZJl04qudB4cuucfQGSG6DGdY2pI5DfT6xr5l2s4d24Or7EpR9I9
	IrbvYsUk5jciz3x+1zwkuNqW0AbJKMHYDJ1GKnEhxVbAbX/IS2NnKTZ3Iwn9tXIH3u
	zWzB4zLfIxyQ6JvfsQdLnCuCtcATd1Z0JcXEOQ4T2EC2HMCKuh3irp9n+FqBgl85mY
	0coVnWZEH51pMnSZ4Ji2go2R/DHedug+9gzb0T0D5Jo7AfgotpxjDpuAoZq6ippUM7
	E6igptCxIlcaQ==
From: Pierre-Jean Texier <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 Dec 2019 20:07:38 +0100
Message-Id: <1577732858-27584-1-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH] stunnel: bump to version 5.56
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
X-List-Received-Date: Mon, 30 Dec 2019 19:07:41 -0000

Release notes of the bugfix release:
 - https://www.stunnel.org/NEWS.html

Also:
 - rename COPYING to COPYING.md

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 .../recipes-support/stunnel/{stunnel_5.55.bb => stunnel_5.56.bb}    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-support/stunnel/{stunnel_5.55.bb => stunnel_5.56.bb} (86%)

diff --git a/meta-networking/recipes-support/stunnel/stunnel_5.55.bb b/meta-networking/recipes-support/stunnel/stunnel_5.56.bb
similarity index 86%
rename from meta-networking/recipes-support/stunnel/stunnel_5.55.bb
rename to meta-networking/recipes-support/stunnel/stunnel_5.56.bb
index df455db..3411e5d 100644
--- a/meta-networking/recipes-support/stunnel/stunnel_5.55.bb
+++ b/meta-networking/recipes-support/stunnel/stunnel_5.56.bb
@@ -6,7 +6,7 @@ SECTION = "net"
 # a combined work based on stunnel. Thus, the terms and conditions of the GNU
 # General Public License cover the whole combination.
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=c7acb24399f540ea323acb0366aecdbe"
+LIC_FILES_CHKSUM = "file://COPYING.md;md5=d6d635d290ba1705821254a0278f1ef7"
 
 DEPENDS = "autoconf-archive libnsl2 openssl"
 
@@ -14,8 +14,8 @@ SRC_URI = "ftp://ftp.stunnel.org/stunnel/archive/5.x/${BP}.tar.gz \
            file://fix-openssl-no-des.patch \
 "
 
-SRC_URI[md5sum] = "7b41592034ede114e8c4e058fc8c238b"
-SRC_URI[sha256sum] = "90de69f41c58342549e74c82503555a6426961b29af3ed92f878192727074c62"
+SRC_URI[md5sum] = "01b0ca9e071f582ff803a85d5ed72166"
+SRC_URI[sha256sum] = "7384bfb356b9a89ddfee70b5ca494d187605bb516b4fff597e167f97e2236b22"
 
 inherit autotools
 
-- 
2.7.4


