Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QJ76A-0001ks-I2
	for openembedded-devel@lists.openembedded.org;
	Sun, 08 May 2011 18:44:51 +0200
Received: by yxn22 with SMTP id 22so1744155yxn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 May 2011 09:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=3eFptFpHluJBggg99qIXwfQS9glcqaUXqGqEiyvV3zU=;
	b=jyVZuU3EQ+/4F1TaO5ukeE67hgkWgkAFE0l1pqkm/kjYfxYB7RZMb62XRy+LOPefvd
	efmQySPWJBgTLmKHUdfeCKAhfTcVRhyssAFOOpJfY/o5wchOaIC4Aeilrzum+eLrF/MY
	tRfQLkymC0KPxzWDFEqyWedCF/sHMTI5c2WNw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=mhdPQXsh7qvUXta+v20ayQBMAYIRMuLSzuXXA0hJW7hAETUL3SdefJhRRi0gktGm9A
	9j6yzpoqOPsaxpE1HJmxyLrmbpXTvrCSbn+9cbgNXdy/Eaqr2cDADtaCzJUuAC05smo5
	VGsitRFb8qtUCKP21eN9FZXvdS+zIj+YU3Rpo=
Received: by 10.236.176.230 with SMTP id b66mr5185757yhm.247.1304872926469;
	Sun, 08 May 2011 09:42:06 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id l74sm2245064yhn.96.2011.05.08.09.42.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 08 May 2011 09:42:05 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  8 May 2011 16:41:32 +0000
Message-Id: <1304872895-21596-8-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1304872895-21596-1-git-send-email-otavio@ossystems.com.br>
References: <1304872895-21596-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH v3 08/11] libinih: add git recipe
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
X-List-Received-Date: Sun, 08 May 2011 16:44:51 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-support/inih/libinih_git.bb |   20 ++++++++++++++++++++
 1 files changed, 20 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-support/inih/libinih_git.bb

diff --git a/meta-oe/recipes-support/inih/libinih_git.bb b/meta-oe/recipes-support/inih/libinih_git.bb
new file mode 100644
index 0000000..1dc2059
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
+RDEPENDS_${PN}-dev = ""
-- 
1.7.2.5



