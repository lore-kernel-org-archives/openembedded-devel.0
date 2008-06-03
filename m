Received: from [209.253.16.26] (helo=barracuda.pager.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <geoffrey@pager.net>) id 1K3foq-0007b1-5j
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Jun 2008 01:21:33 +0200
X-ASG-Debug-ID: 1212535024-75b4000e0000-aWHRdb
X-Barracuda-URL: http://192.168.1.240:8000/cgi-bin/mark.cgi
Received: from [192.168.1.71] (localhost [127.0.0.1])
	by barracuda.pager.net (Spam Firewall) with ESMTP id 94FD5C24E2
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Jun 2008 18:17:04 -0500 (CDT)
Received: from [192.168.1.71] (LRS-CiscoRouter [192.168.1.1]) by
	barracuda.pager.net with ESMTP id czyMlFNrc16JcM1G for
	<openembedded-devel@lists.openembedded.org>;
	Tue, 03 Jun 2008 18:17:04 -0500 (CDT)
From: Geoffrey Wossum <geoffrey@pager.net>
Organization: Long Range Systems
To: openembedded-devel@lists.openembedded.org
X-ASG-Orig-Subj: autoconf and --program-prefix insanity
Date: Tue, 3 Jun 2008 18:17:41 -0500
User-Agent: KMail/1.9.9
MIME-Version: 1.0
Message-Id: <200806031817.42038.geoffrey@pager.net>
X-Barracuda-Connect: LRS-CiscoRouter[192.168.1.1]
X-Barracuda-Start-Time: 1212535024
X-Barracuda-Virus-Scanned: by Barracuda Spam Firewall at pager.net
Subject: autoconf and --program-prefix insanity
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Tue, 03 Jun 2008 23:21:35 -0000
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi all,

I thought I'd drag ya'll into my current autoconf hell, and hopefully someone 
would know where the exit is located.

The packages/binutils/binutils-avr32.inc got changed so that instead of 
explicitly invoking autoconf-2.13 (which comes from outside OE) in the 
top-level binutils directory, it just invokes autoconf.  This will use OE's 
autoconf, which happens to be autoconf 2.61.  Makes good sense.

So somewhere between autoconf 2.13 and 2.61, the handling of 
the "--program-prefix" and how it interacts with cross compilation changed.  
I've personally almost never used "--program-prefix", just specifying cross 
compilation seems to always set the prefix correctly.  However, 
binutils-cross.inc explicitly specifies "--program-prefix" when configuring 
binutils, in addition to specifying cross compilation.  

This worked fine when the configure script was built by autoconf 2.13.  But 
when configure is built by autoconf 2.61, I get binaries named 
avr32-angstrom-linux-uclibc-avr32-angstrom-linux-uclibc-ar and similar, which 
obviously won't work when you need to use them.  Modifying binutils-cross.inc 
to not put "--program-prefix" in EXTRA_OECONF fixes the issue.

So, is there really a need to specify "--program-prefix"?  Will this break 
when configure is built by an older autoconf?  I don't think it would, but I 
really can't guess why "--program-prefix" was specified.

---
Geoffrey

#
# old_revision [0b3a1625ab319665b65cdff67a448a4657c6a3b1]
#
# patch "packages/binutils/binutils-cross.inc"
#  from [06c8460191f6e42d0bb389ff55a7ed29314fa2a6]
#    to [602bfb4f4c4561234706c9de42730c6b3825d724]
#
============================================================
--- packages/binutils/binutils-cross.inc        
06c8460191f6e42d0bb389ff55a7ed29314fa2a6
+++ packages/binutils/binutils-cross.inc        
602bfb4f4c4561234706c9de42730c6b3825d724
@@ -1,10 +1,9 @@ EXTRA_OECONF = "--with-sysroot=${STAGING
 SECTION = "devel"
 inherit cross
 DEPENDS += "flex-native bison-native"
 PROVIDES = "virtual/${TARGET_PREFIX}binutils"
 PACKAGES = ""
 EXTRA_OECONF = "--with-sysroot=${STAGING_DIR_TARGET} \
-               --program-prefix=${TARGET_PREFIX} \
                --enable-install-libbfd \
                 --disable-werror"



