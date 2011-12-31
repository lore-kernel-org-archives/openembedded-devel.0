Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <adrianopallavicino@gmail.com>) id 1RgxTW-0001uy-3l
	for openembedded-devel@lists.openembedded.org;
	Sat, 31 Dec 2011 12:51:46 +0100
Received: by eeit10 with SMTP id t10so9255440eei.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Dec 2011 03:44:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=YNrK8Qqi8+3FdWgJl0thgSVBv/hbXen+5HzGZOTysOY=;
	b=hXRuXF4erIAUbm0AKGqNF54FtWj5sLdXaKif1tPuNw83ih8giyZo8mF6EsuTDUU6Y6
	hETAdvzbztXaOgKsVk+aM1Su0Hzw2dix1tJy7FmFdxUIHYQ1aZxa3Mhs4vULW7DBtj/L
	jnFuErjpnT88wd9cFz1uERSRg9M7P8BKbyiqc=
Received: by 10.14.50.145 with SMTP id z17mr16829728eeb.104.1325331854974;
	Sat, 31 Dec 2011 03:44:14 -0800 (PST)
Received: from localhost.localdomain
	(host39-232-static.225-95-b.business.telecomitalia.it.
	[95.225.232.39])
	by mx.google.com with ESMTPS id a60sm161322773eeb.4.2011.12.31.03.44.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 31 Dec 2011 03:44:14 -0800 (PST)
From: Adriano Pallavicino <adrianopallavicino@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 31 Dec 2011 12:44:00 +0100
Message-Id: <1325331840-23575-1-git-send-email-adriano.pallavicino@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Cc: Adriano Pallavicino <adriano.pallavicino@gmail.com>
Subject: [PATCHv2][2011.03-maintenance] binutils_2.20.1 fixed md5 and sha256 sum
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
X-List-Received-Date: Sat, 31 Dec 2011 11:51:46 -0000

Signed-off-by: Adriano Pallavicino <adriano.pallavicino@gmail.com>

Fixed md5sum and sha256sum
---
 recipes/binutils/binutils_2.20.1.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/binutils/binutils_2.20.1.bb b/recipes/binutils/binutils_2.20.1.bb
index 5154e2d..f40b676 100644
--- a/recipes/binutils/binutils_2.20.1.bb
+++ b/recipes/binutils/binutils_2.20.1.bb
@@ -24,8 +24,8 @@ SRC_URI_append_nios2 =" \
 	file://binutils-nios2.patch \
 	"
 
-SRC_URI[tarball.sha256sum] = "228b84722d87e88e7fdd36869e590e649ab523a0800a7d53df906498afe6f6f8"
-SRC_URI[tarball.md5sum] = "9cdfb9d6ec0578c166d3beae5e15c4e5"
+SRC_URI[tarball.sha256sum] = "71d37c96451333c5c0b84b170169fdcb138bbb27397dc06281905d9717c8ed64"
+SRC_URI[tarball.md5sum] = "2b9dc8f2b7dbd5ec5992c6e29de0b764"
 
 # powerpc patches
 SRC_URI += "\
-- 
1.7.4.1



