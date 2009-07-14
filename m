Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael@sles10-64.ott.cti.com>) id 1MQYQ0-0001zW-VR
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Jul 2009 05:11:01 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id F079334C8F1;
	Mon, 13 Jul 2009 22:57:45 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 14127-09; Mon, 13 Jul 2009 22:57:45 -0400 (EDT)
Received: by smtp.cbnco.com (Postfix, from userid 1003)
	id C63C934F64E; Mon, 13 Jul 2009 22:57:45 -0400 (EDT)
X-Spam-Score: 
X-Spam-Checker-Version: SpamAssassin 3.1.8 (2007-02-13) on sid.cbnco.com
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=7.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.1.8
Received: from sles10-64.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTP id 8FB8B32575A;
	Mon, 13 Jul 2009 22:57:42 -0400 (EDT)
Received: by sles10-64.ott.cti.com (Postfix, from userid 1000)
	id 78E7FA44337; Mon, 13 Jul 2009 22:57:42 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Jul 2009 22:57:38 -0400
Message-Id: <1247540261-4537-1-git-send-email-msmith@cbnco.com>
X-Mailer: git-send-email 1.6.3
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: [PATCH 1/4] xserver-xorg 1.6.1: fix dolt script to handle ${host_alias}
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
X-List-Received-Date: Tue, 14 Jul 2009 03:11:01 -0000

Signed-off-by: Michael Smith <msmith@cbnco.com>
---

This is a resend from yesterday (just because without it, one of
the following patches won't apply cleanly due to PR change).


 .../xserver-xorg-1.6.1/dolt-host-alias.patch       |   28 ++++++++++++++++++++
 recipes/xorg-xserver/xserver-xorg_1.6.1.bb         |    7 +++-
 2 files changed, 33 insertions(+), 2 deletions(-)
 create mode 100644 recipes/xorg-xserver/xserver-xorg-1.6.1/dolt-host-alias.patch

diff --git a/recipes/xorg-xserver/xserver-xorg-1.6.1/dolt-host-alias.patch b/recipes/xorg-xserver/xserver-xorg-1.6.1/dolt-host-alias.patch
new file mode 100644
index 0000000..ca2ca07
--- /dev/null
+++ b/recipes/xorg-xserver/xserver-xorg-1.6.1/dolt-host-alias.patch
@@ -0,0 +1,28 @@
+upstream: http://lists.freedesktop.org/archives/xorg/2009-May/045835.html
+
+From: Mario Domenech Goulart <mario at ossystems.com.br>
+
+Generates the libtool file prefixed by ${host_alias} when it is set.
+This is required in cross compiling environments (such as OpenEmbedded).
+
+--- xorg-server-1.6.1/acinclude.m4.orig	2009-04-14 13:14:56.000000000 -0400
++++ xorg-server-1.6.1/acinclude.m4	2009-07-12 17:25:23.000000000 -0400
+@@ -163,10 +163,16 @@
+ if $modeok && $tagok ; then
+     . ${top_builddir_slash}doltcompile "${args@<:@@@:>@}"
+ else
+-    exec ${top_builddir_slash}libtool "$[]@"
+-fi
+ __DOLTLIBTOOL__EOF__
+ 
++maybe_hyphen=
++if ! test x$host_alias = x; then
++    maybe_hyphen="-"
++fi
++
++echo '    exec ${top_builddir_slash}'${host_alias}${maybe_hyphen}'libtool "$[]@"' >>doltlibtool
++echo 'fi' >>doltlibtool
++
+ dnl Done writing out doltlibtool; substitute it for libtool.
+     chmod +x doltlibtool
+     LIBTOOL='$(top_builddir)/doltlibtool'
diff --git a/recipes/xorg-xserver/xserver-xorg_1.6.1.bb b/recipes/xorg-xserver/xserver-xorg_1.6.1.bb
index a177b19..f2902cf 100644
--- a/recipes/xorg-xserver/xserver-xorg_1.6.1.bb
+++ b/recipes/xorg-xserver/xserver-xorg_1.6.1.bb
@@ -4,9 +4,12 @@ DESCRIPTION = "the X.Org X server"
 DEPENDS += "pixman libpciaccess openssl xineramaproto libxinerama"
 RDEPENDS += "hal"
 PE = "2"
-PR = "r1"
+PR = "r2"
 
-SRC_URI += "file://sysroot_fix.patch;patch=1"
+SRC_URI += " \
+	file://sysroot_fix.patch;patch=1 \
+	file://dolt-host-alias.patch;patch=1 \
+"
 
 MESA_VER = "7.2"
 
-- 
1.6.3



