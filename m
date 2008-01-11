Received: from [72.14.220.156] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1JDIMa-0003Sx-KP
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Jan 2008 12:47:52 +0100
Received: by fg-out-1718.google.com with SMTP id 22so970302fge.20
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Jan 2008 03:47:41 -0800 (PST)
Received: by 10.86.61.13 with SMTP id j13mr2887973fga.48.1200052061395;
	Fri, 11 Jan 2008 03:47:41 -0800 (PST)
Received: from paul.bn.lan ( [194.79.8.34])
	by mx.google.com with ESMTPS id y18sm4311921fkd.17.2008.01.11.03.47.38
	(version=SSLv3 cipher=OTHER); Fri, 11 Jan 2008 03:47:39 -0800 (PST)
Date: Fri, 11 Jan 2008 13:53:28 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) Professional
X-Priority: 3 (Normal)
Message-ID: <183939929.20080111135328@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <E1JD6S8-0007NF-85@linuxtogo.org>
References: <E1JD6S8-0007NF-85@linuxtogo.org>
MIME-Version: 1.0
Cc: Rolf Leggewie <no2spam@nospam.arcornews.de>
Subject: [oe-commits] org.oe.dev ttf.inc: fix SECTION.
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
X-List-Received-Date: Fri, 11 Jan 2008 11:47:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello,

      SECTION changes affect package metadata, so per well-known rule
of thumb they require PR bump. I'd also like to propose to treat
SECTION changes as *important*, so that therule was applied as strict as
makes sense. That's because having correct (and up to date) SECTION
directly affects users' ability to find needed packages (for example,
via feed browser, http://www.angstrom-distribution.org/repo/ ), and
thus influences user experience.

       It would be also nice if such changes were RFCed for Angstrom
stable branch.



This is a forwarded message
From: Laibsch commit <openembedded-commits@lists.openembedded.org>
To: openembedded-commits@lists.openembedded.org
Date: Friday, January 11, 2008, 1:04:48 AM
Subject: [oe-commits] org.oe.dev ttf.inc: fix SECTION.

===8<==============Original message text===============
ttf.inc: fix SECTION.  
ttf fonts are GUI-agnostic and can be used in opie as well, for example.

Author: Laibsch@openembedded.org
Branch: org.openembedded.dev
Revision: 7d3f0e94200c81b204fe6149624facda55d0d578
ViewMTN: http://monotone.openembedded.org/revision/info/7d3f0e94200c81b204fe6149624facda55d0d578
Files:
1
packages/ttf-fonts/ttf.inc
Diffs:

#
# mt diff -rff8974f3ec2465115ae8239ba79efa663add59b0 -r7d3f0e94200c81b204fe6149624facda55d0d578
#
# 
# 
# patch "packages/ttf-fonts/ttf.inc"
#  from [fb8c05c470eee88f979bd7425e143a351654635a]
#    to [2a846550f80db27429faf862405989761d2e4243]
# 
============================================================
--- packages/ttf-fonts/ttf.inc  fb8c05c470eee88f979bd7425e143a351654635a
+++ packages/ttf-fonts/ttf.inc  2a846550f80db27429faf862405989761d2e4243
@@ -1,4 +1,4 @@
-SECTION = "x11/fonts"
+SECTION = "fonts"
 PRIORITY = "optional"
 PACKAGE_ARCH = "all"
 #DEPENDS = "fontconfig opie-ttf-support"



_______________________________________________
Openembedded-commits mailing list
Openembedded-commits@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits

===8<===========End of original message text===========



-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



