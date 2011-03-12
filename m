Received: from ns.awellconnected.net ([83.167.180.132]
	helo=edison.awellconnected.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lukas@htc-linux.org>) id 1PyOqX-0005hP-3P
	for openembedded-devel@lists.openembedded.org;
	Sat, 12 Mar 2011 14:27:05 +0100
Received: from ip-80-226-0-1.vodafone-net.de ([80.226.0.1] helo=[10.225.81.7])
	by edison.awellconnected.net with esmtp (Exim 4.69)
	(envelope-from <lukas@htc-linux.org>) id 1PyOos-0003Cp-K9
	for openembedded-devel@lists.openembedded.org;
	Sat, 12 Mar 2011 13:25:22 +0000
From: Lukas-David Gorris <lukas@htc-linux.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1299933388.3518.2.camel@computer>
References: <1299933388.3518.2.camel@computer>
Date: Sat, 12 Mar 2011 14:22:42 +0100
Message-ID: <1299936162.3518.7.camel@computer>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - edison.awellconnected.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - htc-linux.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: Re: autoconf213: do_configure fails
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
X-List-Received-Date: Sat, 12 Mar 2011 13:27:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Am Samstag, den 12.03.2011, 13:36 +0100 schrieb Lukas-David Gorris:

> read /home/luke/linux/openembedded/tmp/work/armv7a-oe-linux-gnueabi/autoconf213-2.13-r13.0/autoconf-2.13/Makefile.am: No such file or directory
> 
> 
> The same situation with autoconf213-native:
> "Makefile.am: No such file or directory"

I'm sorry, this topic has only been discussed previously in thread "[oe]
[PATCH] autoconf.inc: check if files exist before using sed on them"

A patch has been supplied by Denis Carikli. Khem advised to do a build
from scratch in order to make sure it doesn't affect other autoconf
recipes.

I am doing such a clean build now (with new tmpdir) and will update
about the results.

Denis' patch:

diff --git a/recipes/autoconf/autoconf.inc
b/recipes/autoconf/autoconf.inc
index 7f22c2b..e0eecd3 100644
--- a/recipes/autoconf/autoconf.inc
+++ b/recipes/autoconf/autoconf.inc
@@ -8,7 +8,7 @@ RDEPENDS_${PN} = "m4 perl gnu-config"
 DEPENDS_virtclass-native = "m4-native gnu-config-native perl-native"
 RDEPENDS_${PN}_virtclass-native = "m4-native gnu-config-native
perl-native"
 
-INC_PR = "r13"
+INC_PR = "r14"
 
 SRC_URI = "${GNU_MIRROR}/autoconf/autoconf-${PV}.tar.bz2;name=autoconf
\
 	   file://program_prefix.patch"
@@ -25,13 +25,19 @@ do_configure_prepend () {
 		export ac_cv_path_M4="${ac_cv_path_M4=${bindir}/m4}"
 		export ac_cv_prog_gnu_m4="${ac_cv_prog_gnu_m4=yes}"
 	fi
-
-	sed -i -e's,^SUBDIRS = .*,SUBDIRS = ${SUBDIRS},' ${S}/Makefile.am
+	if [ -e ${S}/Makefile.am ]
+	then
+		sed -i -e's,^SUBDIRS = .*,SUBDIRS = ${SUBDIRS},' ${S}/Makefile.am
+	fi
 }
 
 do_configure_append() {
 	# replace paths to STAGING_BINDIR_NATIVE/perl with ${bindir}/perl
-	sed -i -e "1s:#!.*:#! /usr/bin/env perl:" ${S}/bin/*.in
+	ls ${S} | grep -q '\.in$'
+	if [ $? -eq 0 ]
+	then
+		sed -i -e "1s:#!.*:#! /usr/bin/env perl:" ${S}/bin/*.in
+	fi
 }
 
 PARALLEL_MAKE = ""
-- 
1.7.0.4



Best,

Lukas



