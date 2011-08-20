Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Qudtu-0004dT-4O
	for openembedded-devel@lists.openembedded.org;
	Sat, 20 Aug 2011 07:15:18 +0200
Received: by mail-yi0-f47.google.com with SMTP id 28so2547538yia.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Aug 2011 22:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=oHdiIiCJFcF+2+9eda2UBLJTnAgaUETN5pwmZd5zNS0=;
	b=g+NRgg5GVm9Eqt5/qJUZtOZRFrUONBg4jzwQv0tRiRUo21LLx0nlxRhR7orfgfcIki
	Q5qA9doB1ypZGGOWtSG4eTFDB7dusKMYXICDq7N96PXc0dd0vRTkNJe+G+kIBNpVQBiq
	k7LdibliS2NvVpQ524To6ykVohLKoifrHFe5k=
Received: by 10.150.48.35 with SMTP id v35mr153607ybv.332.1313817038826;
	Fri, 19 Aug 2011 22:10:38 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id k17sm772692yba.29.2011.08.19.22.10.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 19 Aug 2011 22:10:38 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 20 Aug 2011 05:10:21 +0000
Message-Id: <9c43ef837034d22bbfe593a7a8fbd2cfdbc07d51.1313816970.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1313816970.git.otavio@ossystems.com.br>
References: <cover.1313816970.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1313816970.git.otavio@ossystems.com.br>
References: <cover.1313816970.git.otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 3/3] kernel.bbclass: save kernel image name into $kerneldir
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
X-List-Received-Date: Sat, 20 Aug 2011 05:15:18 -0000

Save the kernel image name into sysroot so it can be used during image
build if need. This is used by O.S. Systems products and probably
useful to others.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/classes/kernel.bbclass |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/meta-oe/classes/kernel.bbclass b/meta-oe/classes/kernel.bbclass
index f67503a..f19e744 100644
--- a/meta-oe/classes/kernel.bbclass
+++ b/meta-oe/classes/kernel.bbclass
@@ -134,6 +134,12 @@ kernel_do_install() {
 	echo "${KERNEL_VERSION}" > $kerneldir/kernel-abiversion
 
 	#
+	# Store kernel image name to allow use during image generation
+	#
+
+	echo "${KERNEL_IMAGE_BASE_NAME}" >$kerneldir/kernel-image-name
+
+	#
 	# Copy the entire source tree. In case an external build directory is
 	# used, copy the build directory over first, then copy over the source
 	# dir. This ensures the original Makefiles are used and not the
-- 
1.7.2.5



