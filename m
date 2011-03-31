Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q5Dyt-0006xx-Dx
	for openembedded-devel@lists.openembedded.org;
	Thu, 31 Mar 2011 11:15:56 +0200
Received: by bwz5 with SMTP id 5so1664438bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Mar 2011 02:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=LIIJu77ebni0CTjYKu8rBFNhnXNYTb0fOnM5mElF7Wo=;
	b=pwOczSakcJj/hY8DrQniDFtZVrQ9Ud8jUK4mmpPXMOU+bBZ2fEPHXtspB42rt5SSHm
	wtNkNdOO8kBfOPQl30HcN+odPKiyvMnO3ZB6xByOMDYbZxDjha5NT1nDhlEdXoA9laNO
	2ytqkx2pAmq5JeXsuz94dWr5bxfupE2LexSOw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=ZYYqJi2xSZjhaIiUSEwTshjr9mTpfL0u+9vtFi5BwZKcbdEqvJG9a/ldnX35LhoTTg
	RpdcsjbV4AFnVxOkQVeMU6XrRIdgOCHnvrI/KH+40vwRw4AAoxw5a/gzwSyI68naYThT
	zuS89QcMXVuxYwj1PIqNtFUFBQEF9DphWMTz4=
Received: by 10.204.127.68 with SMTP id f4mr2153941bks.42.1301562831664;
	Thu, 31 Mar 2011 02:13:51 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id l1sm588842bkl.13.2011.03.31.02.13.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 Mar 2011 02:13:51 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 31 Mar 2011 11:13:49 +0200
Message-Id: <62c38635dfccecaaf1b4e09b408f50470d0a4e6d.1301562689.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1301562689.git.Martin.Jansa@gmail.com>
References: <cover.1301562689.git.Martin.Jansa@gmail.com>
Subject: [PATCH 1/2] python-cython: import from meta-shr
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
X-List-Received-Date: Thu, 31 Mar 2011 09:15:56 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-devtools/python/python-cython_0.13.bb  |   19 +++++++++++++++++++
 1 files changed, 19 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/python/python-cython_0.13.bb

diff --git a/meta-oe/recipes-devtools/python/python-cython_0.13.bb b/meta-oe/recipes-devtools/python/python-cython_0.13.bb
new file mode 100644
index 0000000..f705756
--- /dev/null
+++ b/meta-oe/recipes-devtools/python/python-cython_0.13.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "Cython is a language specially designed for writing Python extension modules. \
+It's designed to bridge the gap between the nice, high-level, easy-to-use world of Python \
+and the messy, low-level world of C."
+SECTION = "devel/python"
+PRIORITY = "optional"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e23fadd6ceef8c618fc1c65191d846fa"
+SRCNAME = "Cython"
+BBCLASSEXTEND = "native"
+NATIVE_INSTALL_WORKS = "1"
+DEPENDS = "python"
+
+SRC_URI = "http://www.cython.org/release/${SRCNAME}-${PV}.tar.gz"
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+SRC_URI[md5sum] = "ed2ec5e0df60a6b8e500bedf93bb1feb"
+SRC_URI[sha256sum] = "a30d5e26c82ec65d65703c7cf312161a21b30339addc1a42d3b2965dea254ca6"
+
+inherit distutils
-- 
1.7.4.1



