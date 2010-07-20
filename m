Received: from mail.gmx.net ([213.165.64.20])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <afenkart@gmx.ch>) id 1ObAwd-0005kf-7Y
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Jul 2010 13:25:08 +0200
Received: (qmail invoked by alias); 20 Jul 2010 11:24:57 -0000
Received: from 83-64-248-68.inzersdorf.xdsl-line.inode.at (EHLO localhost)
	[83.64.248.68]
	by mail.gmx.net (mp033) with SMTP; 20 Jul 2010 13:24:57 +0200
X-Authenticated: #20192376
X-Provags-ID: V01U2FsdGVkX1+abcpdvJeaUd06TVuq2ZZQuL2ZRYiIfE7u0vm4wo
	GdGiLVeGj0IJ/c
Date: Tue, 20 Jul 2010 13:26:07 +0200
From: Andreas Fenkart <andreas.fenkart@streamunlimited.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100720112607.GA9142@biggy>
MIME-Version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Y-GMX-Trusted: 0
X-SA-Exim-Connect-IP: 213.165.64.20
X-SA-Exim-Mail-From: afenkart@gmx.ch
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: trini@embeddedalley.com
Subject: [PATCH 0/1] gcc-cross-sdk: fix C++ headers include, bump PR.
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
X-List-Received-Date: Tue, 20 Jul 2010 11:25:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi

The location of C++ headers has changed in gcc-cross-sdk_4.3.x
and above. See error message during packaging step:

NOTE: the following files were installed but not shipped in any package:
NOTE: /opt/angstrom/arm/arm-angstrom-linux-uclibcgnueabi/include/c++/4.3.2/ios
NOTE: /opt/angstrom/arm/arm-angstrom-linux-uclibcgnueabi/include/c++/4.3.2/map
NOTE: /opt/angstrom/arm/arm-angstrom-linux-uclibcgnueabi/include/c++/4.3.2/new
...


NOTE: the following files were installed but not shipped in any package:
NOTE:   /opt/angstrom/arm/include/c++/4.1.1/debug/deque
NOTE:   /opt/angstrom/arm/include/c++/4.1.1/debug/map.h
NOTE:   /opt/angstrom/arm/include/c++/4.1.1/debug/safe_base.h
NOTE:   /opt/angstrom/arm/include/c++/4.1.1/debug/set.h

This latter error occurs after removing the includedir directive:

--- a/recipes/gcc/gcc-package-sdk.inc
+++ b/recipes/gcc/gcc-package-sdk.inc
@@ -17,10 +17,8 @@ FILES_${PN} = "\
     ${gcclibdir}/${TARGET_SYS}/${BINV}/specs \
     ${gcclibdir}/${TARGET_SYS}/${BINV}/lib* \
     ${gcclibdir}/${TARGET_SYS}/${BINV}/include* \
-    ${includedir}/c++/${BINV} \
     ${prefix}/${TARGET_SYS}/bin/* \
     ${prefix}/${TARGET_SYS}/lib/* \


My includedir definition:
export includedir="/opt/angstrom/arm/include"

This seems related to patch:
gcc-cross-sdk: Fix relocation of the toolchain and bump PR.
sha1: f8bf7421bfe8eb86a3f17f269db4fb3667260c38

The patch places C++ headers directly into /include, no longer
/usr/include. So I adjusted the gcc-package-sdk.inc. I also
removed the now unecessary relocation step from
meta-toolchain.bb.

--- a/recipes/gcc/gcc-package-sdk.inc
+++ b/recipes/gcc/gcc-package-sdk.inc
@@ -17,10 +17,8 @@ FILES_${PN} = "\
     ${prefix}/${TARGET_SYS}/bin/* \
     ${prefix}/${TARGET_SYS}/lib/* \
-    ${prefix}/${TARGET_SYS}/usr/include/* \
+    ${prefix}/${TARGET_SYS}/include/* \
     "

Tested on ARM:
gcc-cross-sdk_4.1.1 -- ok
gcc-cross-sdk_4.2.4 -- ok
gcc-cross-sdk_4.3.1 -- needs, patch
gcc-cross-sdk_4.3.2 -- needs, patch
gcc-cross-sdk_4.3.3 -- needs, patch
gcc-cross-sdk_4.4.2 -- needs, patch

/Andreas


