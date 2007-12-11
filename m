Received: from [64.233.182.185] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1J2BYl-0006fz-Oz
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Dec 2007 21:18:31 +0100
Received: by nf-out-0910.google.com with SMTP id h3so1227184nfh
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Dec 2007 12:14:12 -0800 (PST)
Received: by 10.82.148.7 with SMTP id v7mr13232249bud.1197404052311;
	Tue, 11 Dec 2007 12:14:12 -0800 (PST)
Received: from ?192.168.61.156? ( [194.79.8.34])
	by mx.google.com with ESMTPS id d13sm3466829fka.2007.12.11.12.14.11
	(version=SSLv3 cipher=OTHER); Tue, 11 Dec 2007 12:14:11 -0800 (PST)
Date: Tue, 11 Dec 2007 22:17:51 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) Professional
X-Priority: 3 (Normal)
Message-ID: <1993286755.20071211221751@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <E1J22WP-0000Q1-B2@linuxtogo.org>
References: <E1J22WP-0000Q1-B2@linuxtogo.org>
MIME-Version: 1.0
Subject: [oe-commits] org.oe.dev matchbox-keyboard-inputmethod: fix RCONFLICTS to get openmoko-image built
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Dec 2007 20:18:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Well, this fix in turn regressed how other angstrom images are built
by autobuilder. E.g., Angstrom-x11-image-glibc-ipk-2007.9-test-20071211-hx4700.rootfs.tar.gz
contains matchbox-keyboard-inputmethod, whereas before it of course
contained matchbox-keyboard. This is apparently because both are now
built in autobuilder package pool, and ipkg randomly selects one based
on RPROVIDES. Any ideas how to solve this?


This is a forwarded message
From: hrw commit <openembedded-commits@lists.openembedded.org>
To: openembedded-commits@lists.openembedded.org
Date: Tuesday, December 11, 2007, 12:39:29 PM
Subject: [oe-commits] org.oe.dev matchbox-keyboard-inputmethod: fix RCONFLICTS to get openmoko-image built

===8<==============Original message text===============
matchbox-keyboard-inputmethod: fix RCONFLICTS to get openmoko-image built

Author: hrw@openembedded.org
Branch: org.openembedded.dev
Revision: f9729b7895bf54a34c5248b5bc0f5f2be5c19386
ViewMTN: http://monotone.openembedded.org/revision/info/f9729b7895bf54a34c5248b5bc0f5f2be5c19386
Files:
1
packages/matchbox-keyboard/matchbox-keyboard-inputmethod_svn.bb
Diffs:

#
# mt diff -ra42329cb6f62bec43e8b79838373cabe85297648 -rf9729b7895bf54a34c5248b5bc0f5f2be5c19386
#
# 
# 
# patch "packages/matchbox-keyboard/matchbox-keyboard-inputmethod_svn.bb"
#  from [1887d8e703285a0665b7a07c3d4c98e2165f30ee]
#    to [093b78dbcd548a0f00e99d0e61927ec61afc124b]
# 
============================================================
--- packages/matchbox-keyboard/matchbox-keyboard-inputmethod_svn.bb     1887d8e703285a0665b7a07c3d4c98e2165f30ee
+++ packages/matchbox-keyboard/matchbox-keyboard-inputmethod_svn.bb     093b78dbcd548a0f00e99d0e61927ec61afc124b
@@ -1,12 +1,12 @@ DEPENDS = "libfakekey expat libxft gtk+ 
 DESCRIPTION = "Matchbox virtual keyboard for X11"
 LICENSE = "GPL"
 DEPENDS = "libfakekey expat libxft gtk+ matchbox-panel-2"
-RCONFLICTS = matchbox-keyboard
-RPROVIDES_${PN} = matchbox-keyboard
+RCONFLICTS_${PN} = "matchbox-keyboard"
+RPROVIDES_${PN} = "matchbox-keyboard"
 #DEFAULT_PREFERENCE = "-1"
 SECTION = "x11"
 PV = "0.0+svnr${SRCREV}"
-PR = "r7"
+PR = "r8"
 
 SRC_URI = "svn://svn.o-hand.com/repos/matchbox/trunk;module=matchbox-keyboard;proto=http \
        file://smallscreen-fontsize.patch;patch=1 \



_______________________________________________
Openembedded-commits mailing list
Openembedded-commits@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits

===8<===========End of original message text===========



-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



