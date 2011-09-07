Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <errordeveloper@gmail.com>) id 1R1Puj-0000qw-Dm
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Sep 2011 23:44:09 +0200
Received: by wyf19 with SMTP id 19so98139wyf.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Sep 2011 14:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=utVQz/UvGDFd51gP8qBisj4HaSMDB10k4bCP1/qAtXU=;
	b=Oz90qMTAVufxi2tTDbT6p5bH7IiMS+gsexxiJll2na8wInumsM1IyyrTLMmMlc/6+N
	4UrOXBtJm2txwhvV5f2og0vVOpi49Oo3hnTKrGUytlYBuHpvdpyYQqo090mXB+U4tnD1
	PqNNr4jGW1LlBl2iixSe+ZhcnQl2YxkOqfCuQ=
Received: by 10.227.7.7 with SMTP id b7mr6941273wbb.63.1315431541393;
	Wed, 07 Sep 2011 14:39:01 -0700 (PDT)
Received: from localhost.localdomain
	(host86-185-41-205.range86-185.btcentralplus.com [86.185.41.205])
	by mx.google.com with ESMTPS id fa3sm2014223wbb.3.2011.09.07.14.38.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 07 Sep 2011 14:39:00 -0700 (PDT)
From: Ilya Dmitrichenko <errordeveloper@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  7 Sep 2011 23:38:57 +0100
Message-Id: <1315435137-5591-1-git-send-email-errordeveloper@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [PATCH] binutils-2.20.1: fix checksums
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
X-List-Received-Date: Wed, 07 Sep 2011 21:44:09 -0000

Signed-off-by: Ilya Dmitrichenko <errordeveloper@gmail.com>
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
1.7.3.4



