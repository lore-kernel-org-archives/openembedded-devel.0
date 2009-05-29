Received: from [195.135.220.15] (helo=mx2.suse.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mhrusecky@suse.cz>) id 1MABoO-0007vb-Kq
	for openembedded-devel@lists.openembedded.org;
	Sat, 30 May 2009 01:48:32 +0200
Received: from relay1.suse.de (relay-ext.suse.de [195.135.221.8])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id EE9DD74862
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 May 2009 01:40:04 +0200 (CEST)
Date: Sat, 30 May 2009 01:39:58 +0200
From: Michal Hrusecky <mhrusecky@suse.cz>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090529233958.GA16815@misibook.miska.isageek.net>
MIME-Version: 1.0
X-Operating-System: WindowsKiller Linux
User-Agent: Mutt - the best e-mail client in the world
Subject: [PATCH] zuc: fixed build
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
X-List-Received-Date: Fri, 29 May 2009 23:48:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Corrected include name so it can be found and package can be built again.

Signed-off-by: Michal Hrusecky <Michal@Hrusecky.net>
---
 recipes/zuc/zuc/fixed-include.patch |   11 +++++++++++
 recipes/zuc/zuc_1.1.2ern.bb         |    3 ++-
 2 files changed, 13 insertions(+), 1 deletions(-)
 create mode 100644 recipes/zuc/zuc/fixed-include.patch

diff --git a/recipes/zuc/zuc/fixed-include.patch b/recipes/zuc/zuc/fixed-include.patch
new file mode 100644
index 0000000..8e62a68
--- /dev/null
+++ b/recipes/zuc/zuc/fixed-include.patch
@@ -0,0 +1,11 @@
+--- a/conv_matrix.cpp	2003-01-27 21:18:45.000000000 +0100
++++ b/conv_matrix.cpp	2009-05-30 00:57:23.311764092 +0200
+@@ -27,7 +27,7 @@
+ #include <qmap.h>
+ #include <qcombobox.h>
+ #include <qpopupmenu.h>
+-#include <iostream.h>
++#include <iostream>
+ #include <stdlib.h>
+ 
+ 
diff --git a/recipes/zuc/zuc_1.1.2ern.bb b/recipes/zuc/zuc_1.1.2ern.bb
index 32c8f98..eebab1a 100644
--- a/recipes/zuc/zuc_1.1.2ern.bb
+++ b/recipes/zuc/zuc_1.1.2ern.bb
@@ -8,7 +8,8 @@ APPDESKTOP = "${S}"
 PR = "r3"
 
 SRC_URI = "http://www.linux-solutions.at/projects/zaurus/source/zuc_V${PV}.tar.gz \
-           http://nick.kreucher.net/zuc/zuc_units"
+           http://nick.kreucher.net/zuc/zuc_units \
+           file://fixed-include.patch;patch=1"
 S = "${WORKDIR}/zuc_V${PV}"
 
 inherit opie
-- 
1.6.3.1


