Received: from [209.253.16.26] (helo=barracuda.pager.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <geoffrey@pager.net>) id 1Jjb9k-0004xC-H0
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Apr 2008 16:20:09 +0200
X-ASG-Debug-ID: 1207750804-278400270000-aWHRdb
X-Barracuda-URL: http://192.168.1.240:8000/cgi-bin/mark.cgi
Received: from [192.168.1.71] (localhost [127.0.0.1])
	by barracuda.pager.net (Spam Firewall) with ESMTP id 5DEB53C979
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Apr 2008 09:20:05 -0500 (CDT)
Received: from [192.168.1.71] ([192.168.1.1]) by barracuda.pager.net with
	ESMTP id OWsAnHq4enQvHKeT for
	<openembedded-devel@lists.openembedded.org>;
	Wed, 09 Apr 2008 09:20:05 -0500 (CDT)
From: Geoffrey Wossum <geoffrey@pager.net>
Organization: Long Range Systems
To: openembedded-devel@lists.openembedded.org
X-ASG-Orig-Subj: avr32-*-gdb requires modifying gdb.inc / gdb-cross.inc
Date: Wed, 9 Apr 2008 09:20:02 -0500
User-Agent: KMail/1.9.7
MIME-Version: 1.0
Message-Id: <200804090920.02871.geoffrey@pager.net>
X-Barracuda-Connect: UNKNOWN[192.168.1.1]
X-Barracuda-Start-Time: 1207750805
X-Barracuda-Virus-Scanned: by Barracuda Spam Firewall at pager.net
Subject: avr32-*-gdb requires modifying gdb.inc / gdb-cross.inc
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
X-List-Received-Date: Wed, 09 Apr 2008 14:20:15 -0000
Content-Disposition: inline
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit

Hi all,

I currently have a BitBake recipe that can build gdb 6.4 for the AVR32, and 
I'm about to make one that can build the gdb 6.7 using Atmel's newly released 
patches for the AVR32.

According to this page, http://avr32linux.org/twiki/bin/view/Main/GDBPatches, 
you must do some extra steps to build gdb if you patch it.  My experience 
with Atmel's gdb 6.4 release was that even though they claim you don't have 
to do these steps if you use the full source tarball, you have to anyway.

This requires modifying gdb.inc / gdb-cross.inc.  I think the modifications 
are safe for all platforms, but I was hoping someone could comment before I 
roll a patchset to submit.  

TIA,
---
Geoffrey


--- packages/gdb/gdb-cross.inc  2008-03-04 14:30:27.000000000 -0600
+++ /home/geoff/lrs/playpaq/org.openembedded.dev/packages/gdb/gdb-cross.inc    
2008-04-09 09:09:50.000000000 -0500
@@ -10,9 +10,38 @@ do_configure () {
 # override this function to avoid the autoconf/automake/aclocal/autoheader
 # calls for now
        (cd ${S} && gnu-configize) || die "failure in running gnu-configize"
+
+
+        # This stuff is required to build Atmel's patched gdb for the AVR32.
+        # See http://avr32linux.org/twiki/bin/view/Main/GDBPatches
+        (cd ${S}/bfd && autoreconf) || die "failure running autoreconf in bfd/"
+        (cd ${S}/opcodes && autoreconf) || die "failure running autoreconf in opcodes/"
+
        oe_runconf
+
+
+        # Also required according to the avr32linux GDBPatches page
+        make configure-bfd || die "Error running configure-bfd"
+        (cd bfd && make headers && cd "$OLDPWD") || \
+                die "error running 'make headers' in bfd"
 }

 do_stage () {
+        # Left to fend for itself, "make install" will fail, saying that
+        # makeinfo is missing.  I don't know if this is because my system
+        # makeinfo isn't available inside the bitbake build, or if this is
+        # due to the texinfo version detection bug that has plagued some
+        # packages (see https://bugzilla.redhat.com/show_bug.cgi?id=345621).
+        # Either way, we want to keep "make install"from wanting to run
+        # makeinfo.  By copying over all the .info files before hand,
+        # the files will exist in the build tree and have shiny new
+        # timestamps, thus preventing "make install" from using makeinfo.
+        cd ${S}
+        for infofile in `find . -name "*.info"`; do
+            cp "$infofile" ${B}/"$infofile"
+        done
+        cd "$OLDPWD"
+
+
        oe_runmake install
 }






