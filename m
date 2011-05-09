Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QJW0B-0002rv-Q7
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 May 2011 21:20:20 +0200
Received: by mail-gy0-f175.google.com with SMTP id 1so2074894gyf.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 May 2011 12:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=1QXkVzN0UiKItVVSitlBCA881Nz/uV3TL8CRmadID3M=;
	b=E8PCHUQva3kn3LR19RV0vUB3Q4QRLJoVtoCTfqlyTq6pBEP3llI+s8y/tN0mnlEIpm
	hjS1cYd6lfPqFxiKx2+JdWF4AtzhVUUqzbSPHWW9U0mto/cXrS1kf3YfRX4atdQkzL6R
	cUQEPVd+4EngwiapB++qlc4wR+2s1dYmHNDqU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=YriImWFbNs7WLUhCCq8W6e/G6O+FQMwtC94XUz0XmT9tDKwgfuBwHAC3UjIlHgMstA
	gWiaJDqKUMN8aK3RnLckv3dlurqcs12rewCDCl+dPr3gGB9+JaFP8GouEmaH34Jy5dVC
	jWpSc2px/PUVrcV4V9XUrNuUH/+tG4fSBk47s=
Received: by 10.150.55.5 with SMTP id d5mr5736887yba.216.1304968655278;
	Mon, 09 May 2011 12:17:35 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id c3sm1123219ybn.24.2011.05.09.12.17.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 09 May 2011 12:17:33 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 May 2011 19:16:53 +0000
Message-Id: <1304968617-4949-8-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1304968617-4949-1-git-send-email-otavio@ossystems.com.br>
References: <1304968617-4949-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH v4 08/12] libinih: add git recipe
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
X-List-Received-Date: Mon, 09 May 2011 19:20:20 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-support/inih/libinih_git.bb |   20 ++++++++++++++++++++
 1 files changed, 20 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-support/inih/libinih_git.bb

diff --git a/meta-oe/recipes-support/inih/libinih_git.bb b/meta-oe/recipes-support/inih/libinih_git.bb
new file mode 100644
index 0000000..4807bc7
--- /dev/null
+++ b/meta-oe/recipes-support/inih/libinih_git.bb
@@ -0,0 +1,20 @@
+DESCRIPTION = "C and C++ INI Library"
+HOMEPAGE = "http://code.google.com/p/inih/"
+PRIORITY = "optional"
+PV = "0.0+gitr${SRCPV}"
+PKGV = "${GITPKGVTAG}"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=dae28cbf28207425e0d0b3eb835f4bde"
+
+PR = "r0"
+
+# The github repository provides a cmake and pkg-config integration
+SRCREV = "715cb4dc3d56714d7d53dcd94ae4b41c950119a7"
+SRC_URI = "git://github.com/OSSystems/inih.git;protocol=git"
+
+S = "${WORKDIR}/git"
+
+inherit gitpkgv cmake
+
+# We don't have libinih since we only have static libraries
+ALLOW_EMPTY_${PN} = "1"
-- 
1.7.2.5



