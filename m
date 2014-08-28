Return-Path: <ticotimo@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id 32A8870E6E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Aug 2014 05:01:36 +0000 (UTC)
Received: by mail-pa0-f46.google.com with SMTP id eu11so971677pac.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Aug 2014 22:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=9aM0eAdRjHwO/4D+Vvt7F4j2Gszpy3iVfPeE0Gw3FiA=;
	b=qK5D68wTj8G8KZsAUO/Oldo2XEHlnB8T/EMfw/ES2TWVLsCwYf89suyEqYvH+ooM6Y
	XNtoudqAIIIf2YhS2XGsnzzEpviTBO8JauM9NGXWAdNZuEj1gfvBfVN8TIpcYQ/cP7bf
	pSOqw0O58RtiZG+byThbb5NbrC3QdhuR1CyuForlqY7Ai189bJhmCgFYodwEYhDaaK6q
	iIZq6EYeOu41LBlMaVdqkEUOEuEHknLBvlSuzs6iCoej6JGPi5yWJVCs6/PZieb49KgX
	fX9dYD+SD0hN4XEo7VMs+kQ+32NnoZ8graoZctUZqVXCBLZ/3p+KStpKURnGj6iOqnRq
	rBlA==
X-Received: by 10.70.90.237 with SMTP id bz13mr2122607pdb.110.1409202098324;
	Wed, 27 Aug 2014 22:01:38 -0700 (PDT)
Received: from localhost.localdomain (75-128-22-150.dhcp.snlo.ca.charter.com.
	[75.128.22.150])
	by mx.google.com with ESMTPSA id z3sm2133456pbt.84.2014.08.27.22.01.35
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 Aug 2014 22:01:36 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <TicoTimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 27 Aug 2014 22:01:31 -0700
Message-Id: <1409202091-30395-1-git-send-email-TicoTimo@gmail.com>
X-Mailer: git-send-email 1.9.3
Subject: [meta-perl][PATCH] libmodule-pluggable-perl: add 5.1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Aug 2014 05:01:45 -0000

* Module::Pluggable - automatically give your module the ability to have plugins

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 .../libmodule/libmodule-pluggable-perl_5.1.bb      | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libmodule/libmodule-pluggable-perl_5.1.bb

diff --git a/meta-perl/recipes-perl/libmodule/libmodule-pluggable-perl_5.1.bb b/meta-perl/recipes-perl/libmodule/libmodule-pluggable-perl_5.1.bb
new file mode 100644
index 0000000..b916918
--- /dev/null
+++ b/meta-perl/recipes-perl/libmodule/libmodule-pluggable-perl_5.1.bb
@@ -0,0 +1,39 @@
+SUMMARY = "Automatically give your module the ability to have plugins"
+DESCRIPTION = "Provides a simple but, hopefully, extensible way of \
+having 'plugins' for your module. Obviously this isn't going to be the \
+be all and end all of solutions but it works for me.\
+\
+Essentially all it does is export a method into your namespace that \
+looks through a search path for .pm files and turn those into class \
+names.\
+\
+Optionally it instantiates those classes for you."
+SECTION = "libs"
+
+AUTHOR = "Simon Wistow <simon@thegestalt.org>"
+HOMEPAGE = "https://github.com/simonwistow/Module-Pluggable"
+
+LICENSE = "Artistic-1.0 | GPL-1.0+"
+LIC_FILES_CHKSUM = "file://README;beginline=322;endline=325;md5=086450ce010f6fda25db0b38fcc41086"
+
+SRCNAME = "Module-Pluggable"
+SRC_URI = "${CPAN_MIRROR}/authors/id/S/SI/SIMONW/${SRCNAME}-${PV}.tar.gz"
+SRC_URI[md5sum] = "1b71ed7a67ad8c048d1499540bc892ba"
+SRC_URI[sha256sum] = "e2dc354043bb16f1f3df8c4bb26070b26e594819f218cf8b8ac19e79c720916f"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit cpan_build
+
+RDEPENDS_${PN} = " perl-module-base \
+		   perl-module-deprecate \
+                   perl-module-file-basename \
+		   perl-module-file-find \
+                   perl-module-file-spec \
+		   perl-module-file-spec-functions \
+		   perl-module-if \
+                   perl-module-test-more \
+"
+
+BBCLASSEXTEND = "native"
+
-- 
1.9.3


