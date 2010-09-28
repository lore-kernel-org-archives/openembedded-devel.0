Received: from mailout-de.gmx.net ([213.165.64.23] helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <Alexander.Stohr@gmx.de>) id 1P0eMb-0007GF-EA
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Sep 2010 19:53:15 +0200
Received: (qmail 17525 invoked by uid 0); 28 Sep 2010 17:45:41 -0000
Received: from 193.8.40.126 by www158.gmx.net with HTTP;
	Tue, 28 Sep 2010 19:45:40 +0200 (CEST)
Date: Tue, 28 Sep 2010 19:45:41 +0200
From: "Alexander Stohr" <Alexander.Stohr@gmx.de>
Message-ID: <20100928174541.200740@gmx.net>
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Authenticated: #15156664
X-Flags: 0001
X-Mailer: WWW-Mail 6100 (Global Message Exchange)
X-Priority: 3
X-Provags-ID: V01U2FsdGVkX18LHdY1c58LUa8xDl5dFZk3NU9bnpKsJIeKCuH0hs
	q0JF/9Y3DJRg0+Gg4b3Kwgzd/Bwcz9Bb612Q== 
X-GMX-UID: qlzLfycAeWUkUsojjm9nVrMjL0tsZo2R
X-FuHaFi: 0.76000000000000001
X-SA-Exim-Connect-IP: 213.165.64.23
X-SA-Exim-Mail-From: Alexander.Stohr@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: automake-patches@gnu.org
Subject: [patch] cross keyword for automake warnings
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
X-List-Received-Date: Tue, 28 Sep 2010 17:53:15 -0000
X-Groupsio-MsgNum: 24115
Content-Type: multipart/mixed; boundary="========GMX2007412856959413696"

--========GMX2007412856959413696
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

each of the following two patches adds the "cross" keyword to the command line option --warnings of the automake utility.

that feature is merely a dummy right now as it's not yet used by the tool.
it improves consistency for the commandline parameters of the tools from that sector.
it further helps the oe build to not fail when e.g. a tool from the
autoconf collection blindly tries to pass along "--warnings=cross" to automake.

consider this as a systematic change that paves the way for more whilst reducing need for complexity (like filtering that) in the callers area.

two versions are appended.
i only ran the one for 1.10.x on my build testbed.

regards, Alex.
-- 
GRATIS: Spider-Man 1-3 sowie 300 weitere Videos!
Jetzt freischalten! http://portal.gmx.net/de/go/maxdome

--========GMX2007412856959413696
Content-Type: text/x-patch;
 charset="iso-8859-15";
 name="automake-1.10.2.cross-warnings-001.patch"
Content-Transfer-Encoding: 8bit
Content-Disposition: attachment;
 filename="automake-1.10.2.cross-warnings-001.patch"

diff -usbr automake-1.10.2.orig/aclocal.in automake-1.10.2/aclocal.in
--- automake-1.10.2.orig/aclocal.in	2008-11-23 09:28:59.000000000 +0100
+++ automake-1.10.2/aclocal.in	2010-09-28 18:55:24.000000000 +0200
@@ -887,6 +887,7 @@
   -W, --warnings=CATEGORY   report the warnings falling in CATEGORY
 
 Warning categories include:
+  `cross'         cross compilation issues
   `syntax'        dubious syntactic constructs (default)
   `unsupported'   unknown macros (default)
   `all'           all the warnings (default)
diff -usbr automake-1.10.2.orig/lib/Automake/ChannelDefs.pm automake-1.10.2/lib/Automake/ChannelDefs.pm
--- automake-1.10.2.orig/lib/Automake/ChannelDefs.pm	2008-11-23 09:28:59.000000000 +0100
+++ automake-1.10.2/lib/Automake/ChannelDefs.pm	2010-09-28 18:57:37.000000000 +0200
@@ -90,6 +90,10 @@
 
 Internal errors.  Use C<&prog_error> to send messages over this channel.
 
+=item C<cross>
+
+cross compilation issues
+
 =item C<gnu>
 
 Warnings related to GNU Coding Standards.
@@ -142,6 +146,7 @@
 	     "####################\n"),
   footer => "\nPlease contact <bug-automake\@gnu.org>.";
 
+register_channel 'cross', type => 'warning';
 register_channel 'gnu', type => 'warning';
 register_channel 'obsolete', type => 'warning', silent => 1;
 register_channel 'override', type => 'warning', silent => 1;
@@ -165,6 +170,7 @@
 sub usage ()
 {
   print "Warning categories include:
+  `cross'         cross compilation issues
   `gnu'           GNU coding standards (default in gnu and gnits modes)
   `obsolete'      obsolete features or constructions
   `override'      user redefinitions of Automake rules or variables

--========GMX2007412856959413696
Content-Type: text/x-patch;
 charset="iso-8859-15";
 name="automake-1.11.1.cross-warnings-001.patch"
Content-Transfer-Encoding: 8bit
Content-Disposition: attachment;
 filename="automake-1.11.1.cross-warnings-001.patch"

diff -usbr automake-1.11.1.orig/aclocal.in automake-1.11.1/aclocal.in
--- automake-1.11.1.orig/aclocal.in	2009-12-08 19:02:32.000000000 +0100
+++ automake-1.11.1/aclocal.in	2010-09-28 18:42:26.000000000 +0200
@@ -890,6 +890,7 @@
   -W, --warnings=CATEGORY   report the warnings falling in CATEGORY
 
 Warning categories include:
+  `cross'         cross compilation issues
   `syntax'        dubious syntactic constructs (default)
   `unsupported'   unknown macros (default)
   `all'           all the warnings (default)
diff -usbr automake-1.11.1.orig/doc/aclocal-1.11.1 automake-1.11.1/doc/aclocal-1.11.1
--- automake-1.11.1.orig/doc/aclocal-1.11.1	2009-12-08 19:15:56.000000000 +0100
+++ automake-1.11.1/doc/aclocal-1.11.1	2010-09-28 18:42:59.000000000 +0200
@@ -47,6 +47,9 @@
 report the warnings falling in CATEGORY
 .SS "Warning categories include:"
 .TP
+`cross'
+cross compilation issues
+.TP
 `syntax'
 dubious syntactic constructs (default)
 .TP
diff -usbr automake-1.11.1.orig/lib/Automake/ChannelDefs.pm automake-1.11.1/lib/Automake/ChannelDefs.pm
--- automake-1.11.1.orig/lib/Automake/ChannelDefs.pm	2009-12-08 19:06:45.000000000 +0100
+++ automake-1.11.1/lib/Automake/ChannelDefs.pm	2010-09-28 18:46:22.000000000 +0200
@@ -150,6 +150,7 @@
   footer => "\nPlease contact <bug-automake\@gnu.org>.",
   uniq_part => UP_NONE, ordered => 0;
 
+register_channel 'cross', type => 'warning';
 register_channel 'gnu', type => 'warning';
 register_channel 'obsolete', type => 'warning', silent => 1;
 register_channel 'override', type => 'warning', silent => 1;
@@ -175,6 +176,7 @@
 sub usage ()
 {
   print "Warning categories include:
+  `cross'         cross compilation issues
   `gnu'           GNU coding standards (default in gnu and gnits modes)
   `obsolete'      obsolete features or constructions
   `override'      user redefinitions of Automake rules or variables
@@ -262,7 +264,11 @@
       $has_no = 1;
     }
 
-  if ($cat eq 'all')
+  if ($cat eq 'cross')
+    {
+      setup_channel_type 'warning', silent => $has_no;
+    }
+  elsif ($cat eq 'all')
     {
       setup_channel_type 'warning', silent => $has_no;
     }

--========GMX2007412856959413696--
