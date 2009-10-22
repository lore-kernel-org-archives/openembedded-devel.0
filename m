Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael@juice.ott.cti.com>) id 1N1763-00086J-Pw
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Oct 2009 01:29:35 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 6A73C5A5350;
	Thu, 22 Oct 2009 19:28:31 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 16688-06; Thu, 22 Oct 2009 19:28:31 -0400 (EDT)
Received: by smtp.cbnco.com (Postfix, from userid 1003)
	id 4B8375A6EA3; Thu, 22 Oct 2009 19:28:31 -0400 (EDT)
Received: from juice.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTP id 1F6255A342D;
	Thu, 22 Oct 2009 19:28:30 -0400 (EDT)
Received: by juice.ott.cti.com (Postfix, from userid 1000)
	id C9C274DC79C; Thu, 22 Oct 2009 19:28:29 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Oct 2009 19:28:29 -0400
Message-Id: <12562541091460-git-send-email-msmith@cbnco.com>
X-Mailer: git-send-email 1.5.3.1.20.gb860
X-Virus-Scanned: amavisd-new at cbnco.com
X-SA-Exim-Connect-IP: 207.164.182.72
X-SA-Exim-Mail-From: michael@juice.ott.cti.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] cairo 1.8.8: fix libtool name in doltlibtool
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
X-List-Received-Date: Thu, 22 Oct 2009 23:29:39 -0000

In OE libtool is renamed to ${host_alias}-libtool. Change doltlibtool
script accordingly.

Ripped from patch for xserver-xorg 1.6.1
(c10e9906a2ecea7e9c04bf967a8882d6b4cd1077)

Signed-off-by: Michael Smith <msmith@cbnco.com>
---
 recipes/cairo/cairo_1.8.8.bb       |    3 +++
 recipes/cairo/files/dolt-fix.patch |   20 ++++++++++++++++++++
 2 files changed, 23 insertions(+), 0 deletions(-)
 create mode 100644 recipes/cairo/files/dolt-fix.patch

diff --git a/recipes/cairo/cairo_1.8.8.bb b/recipes/cairo/cairo_1.8.8.bb
index b2d8e65..74671fb 100644
--- a/recipes/cairo/cairo_1.8.8.bb
+++ b/recipes/cairo/cairo_1.8.8.bb
@@ -1,6 +1,9 @@
+PR = "r1"
+
 require cairo.inc
 
 SRC_URI = "http://cairographics.org/releases/cairo-${PV}.tar.gz \
+           file://dolt-fix.patch;patch=1 \
           "
 
 
diff --git a/recipes/cairo/files/dolt-fix.patch b/recipes/cairo/files/dolt-fix.patch
new file mode 100644
index 0000000..16aff34
--- /dev/null
+++ b/recipes/cairo/files/dolt-fix.patch
@@ -0,0 +1,20 @@
+--- cairo-1.8.8/build/aclocal.dolt.m4.orig	2008-12-12 07:48:04.000000000 -0500
++++ cairo-1.8.8/build/aclocal.dolt.m4	2009-10-22 14:36:17.000000000 -0400
+@@ -147,7 +147,7 @@
+     cat <<__DOLTLIBTOOL__EOF__ > doltlibtool
+ #!$DOLT_BASH
+ __DOLTLIBTOOL__EOF__
+-    cat <<'__DOLTLIBTOOL__EOF__' >>doltlibtool
++    cat <<'__DOLTLIBTOOL__EOF__' | sed -e "s/@host_alias@/$host_alias/g" >>doltlibtool
+ top_builddir_slash="${0%%doltlibtool}"
+ : ${top_builddir_slash:=./}
+ args=()
+@@ -163,7 +163,7 @@
+ if $modeok && $tagok ; then
+     . ${top_builddir_slash}doltcompile "${args@<:@@@:>@}"
+ else
+-    exec ${top_builddir_slash}libtool "$[]@"
++    exec ${top_builddir_slash}@host_alias@-libtool "$[]@"
+ fi
+ __DOLTLIBTOOL__EOF__
+ 
-- 
1.5.3.1.20.gb860



