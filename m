Received: from [72.14.220.157] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1J70HH-0000uJ-F2
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 Dec 2007 04:16:23 +0100
Received: by fg-out-1718.google.com with SMTP id 22so896887fge.20
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Dec 2007 19:10:50 -0800 (PST)
Received: by 10.86.58.3 with SMTP id g3mr5117977fga.1.1198552249925;
	Mon, 24 Dec 2007 19:10:49 -0800 (PST)
Received: from ?192.168.20.166? ( [194.79.8.34])
	by mx.google.com with ESMTPS id d13sm7028061fka.16.2007.12.24.19.10.47
	(version=SSLv3 cipher=OTHER); Mon, 24 Dec 2007 19:10:48 -0800 (PST)
Date: Tue, 25 Dec 2007 05:13:08 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) Professional
X-Priority: 3 (Normal)
Message-ID: <8555945.20071225051308@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Cc: Michael 'Mickey' Lauer <mickey@vanille-media.de>
Subject: [RFC] Elaborate runtime machine identification in OE
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
X-List-Received-Date: Tue, 25 Dec 2007 03:16:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello openembedded-devel,

  Merry Christmas to everyone, and a good cleanup for holiday. ;-)

  Some time ago, Michael Lauer added /etc/init.d/functions
(initscripts package), which is IMHO a great step for OE - without
having and reusing common functionality in init/service scripts, we
won't overcome the current situation of initscripts, which are more
a random collection than a well-fitting and flexible facility.

  /etc/init.d/functions in particular contains a function to detect
hardware model (i.e. machine) on which execution takes place. It's
still used only by one other script/package in OE - gsm, but I'd like
to extend its coverage, starting with psplash (to tackle at #3471).
There're few issues with it, which would be nice to fix before going
for general migration.

1. The function is called "cpuinfo_id" which doesn't correspond to
what it really does. "machine_id" should be pretty clear and
unambiguous. (A func to return CPU id worth adding too, there's use
for it (e.g., irdautils uses that)).

2. We already had issues where what kernel had and what was written in
script differed in case. Worth just settling on using one case,
apparently lower. (This idea is from psplash init.)

3. It's worth having machine ids as proper identifiers, for example,
to avoid unnecessary quoting, and for them to be usable as filenames
directly (without excessive quoting, again). Using filenames to handle
machine-specific features might come pretty handy - instead of long
case statements, we would have just check for a filename, with
fallback to default if needed. This doesn't have to be universal, but
some cases just call for this, for example per-machine xmodmap
configuration. Of course, in most cases there even won't be separate
per-machine files, just symlinks to few common cases! (Btw, does mtn
allows to store symlinks in repo?)

Here's how changes would look like:

============================================================
--- packages/initscripts/initscripts-1.0/functions      cdb873e9c652d090c2e40fa96d5fd2db86db5413
+++ packages/initscripts/initscripts-1.0/functions      b93cf58a6991d27bc069277c77cad150e8dc7dbe
@@ -1,11 +1,11 @@
 # -*-Shell-script-*-
 #
 # functions     This file contains functions to be used by most or all
 #               shell scripts in the /etc/init.d directory.
 #
 
-cpuinfo_id() {         # return the Hardware module ID
-    awk 'BEGIN { FS=": " } /Hardware/ { print $2 } ' </proc/cpuinfo
+machine_id() {         # return the machine ID
+    awk 'BEGIN { FS=": " } /Hardware/ { gsub(" ", "_", $2); print tolower($2) } ' </proc/cpuinfo
 }
 
 killproc() {           # kill the named process(es)
============================================================
--- packages/gsm/files/default  fff8f5a5e6aa3b4c82a98e13da7f097b7ee15b91
+++ packages/gsm/files/default  2c9ff75946e58892430cb9cee5cb6e6a16739d7c
@@ -1,31 +1,31 @@
 # gsmd This shell script configures for the gsmd init script.
 
 . /etc/init.d/functions
 
-case `cpuinfo_id` in
-       "GTA01"|"GTA02")
+case `machine_id` in
+       "gta01"|"gta02")
                GSMD_OPTS="-s 115200 -F"
                GSM_POW="/sys/bus/platform/devices/gta01-pm-gsm.0/power_on"
                GSM_RES="/sys/bus/platform/devices/gta01-pm-gsm.0/reset"
                GSM_DEV="/dev/ttySAC0"
                ;;
-       "HTC Apache"|"HTC Blueangel"|"HTC Universal")
+       "htc_apache"|"htc_blueangel"|"htc_universal")
                GSMD_OPTS="-s 115200 -F"
                GSM_DEV="/dev/ttyS0"
                ;;
-       "HTC Himalaya")
+       "htc_himalaya")
                GSMD_OPTS="-s 115200 -F"
                GSM_DEV="/dev/ttyS2"
                ;;
-       "HTC Magician")
+       "htc_magician")
                GSMD_OPTS="-s 115200 -F"
                GSM_DEV="/dev/ttyS1"
                ;;
-       "Palm Treo 650")
+       "palm_treo_650")
                GSMD_OPTS="-s 460800 -F -w 1"
                GSM_DEV="/dev/ttyS0"
                ;;
-        "Motorola Ezx Platform")
+        "motorola_ezx_platform")
                 GSMD_OPTS="-s 115200 -F -v ti"
                 GSM_DEV="/dev/mux0"
                 ;;



-- 
Best regards,
 Paul                          mailto:pmiscml@gmail.com



