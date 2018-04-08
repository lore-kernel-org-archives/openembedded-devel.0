Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6293C745AB
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Apr 2018 06:59:18 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id bj1-v6so3199407plb.8
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Apr 2018 23:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=hkn5uoORbPewvZ1gyu5YzewnVqsuc/YhrPyCAJF8aY4=;
	b=DOnFBxMhPCfJNj3Y1skb0LfjBdBadH//0CKd3n5uSrUXop5tyhEyP2ezrMxhruPpx/
	0amPwBw0NooMxsFf6OCH+ochF0mVdqgzH8ee5DnyCYMPTmLi7vWp0hj1wdpv4O9yDZG1
	pLFo1GnvBoK92kcPALbLEAu2Oii6pJf824oYYLzs5hf1B4tbJ1Cw7nB3A6qd7yYCszYt
	LNvNXRLzhjzjZ17RPowRTydX1sbEy+RTBj569qp+NSrSvT3zdYnewegisRrY5AVq636u
	DsDfDL5ow73bgQV6ALuhSlBn6dIkizto/tM0KfXh/29WzThqUnFiZ6llSNEE3V54rzVp
	MyKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=hkn5uoORbPewvZ1gyu5YzewnVqsuc/YhrPyCAJF8aY4=;
	b=d4lA3seO3Qi/7/2IUCTUBHjm0scIa1l3tKl4SGvhM9+C1+sV82lYEdi1KA1X4LSw85
	9HEaw0n/x3/QYSaAyQEIzmdHMNKfFZx10DkWTMt0fwQTww+mysfeKAnou4q0DBbZgR9G
	9RyNz+Eq67tFjUYWiM+1Tv+3GFmkBlEGVnYM+kY7xeGseTUqGIA96S7mpvH1gGxEM9Wm
	KzzcvgfbYWMcCvSzFkTUZ2rlhwAR6jTNQbcexzwmtLqcwtrVj+amY+hvmU5j6S2N2qU2
	b/9xeg71myKI5T9bIUpNiwsOOcsjc23ok/J3wELnQ7kcDegNbunqOEDiyNbMnf4yWnZY
	oI+A==
X-Gm-Message-State: ALQs6tAu3rj213GfUA/XQALlkXq6Wn+zw0IHLAyPWuSypaGsGmGAlAJm
	AtfADAGztGP5KzhuLXgMceTv4Q==
X-Google-Smtp-Source: AIpwx486ZYesSMV9kbNwW0eJDnZ8PYoDvpJQLqPEgdSR6OBgqHMORlqdPD0ipcXRp3sYM/Dfn+MgWQ==
X-Received: by 2002:a17:902:5a4:: with SMTP id
	f33-v6mr20808258plf.278.1523170758908; 
	Sat, 07 Apr 2018 23:59:18 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:932:e5ef:c5a4:fdbd])
	by smtp.gmail.com with ESMTPSA id
	c186sm20506137pfb.40.2018.04.07.23.59.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 07 Apr 2018 23:59:18 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Sat,  7 Apr 2018 23:58:39 -0700
Message-Id: <1523170729-26321-27-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1523170729-26321-1-git-send-email-akuster808@gmail.com>
References: <1523170729-26321-1-git-send-email-akuster808@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 27/37] hddtemp: refresh patches
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 08 Apr 2018 06:59:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

WARNING: hddtemp-0.3-beta15-r1 do_patch:
Some of the context lines in patches were ignored. This can lead to incorrectly applied patches.
The context lines in the patches can be updated with devtool:

    devtool modify <recipe>
    devtool finish --force-patch-refresh <recipe> <layer_path>

Then the updated patches and the source tree (in devtool's workspace)
should be reviewed to make sure the patches apply in the correct place
and don't introduce duplicate lines (which can, and does happen
when some of the context is ignored). Further information:
http://lists.openembedded.org/pipermail/openembedded-core/2018-March/148675.html
https://bugzilla.yoctoproject.org/show_bug.cgi?id=10450
Details:
Applying patch hddtemp_0.3-beta15-52.diff
patching file doc/hddtemp.8
patching file po/fr.po
patching file po/ru.po
patching file po/sv.po
patching file po/pt.po
patching file po/de.po
patching file po/LINGUAS
patching file po/hddtemp.pot
patching file src/sata.c
patching file src/satacmds.c
patching file src/backtrace.c
patching file src/daemon.c
patching file src/hddtemp.c
Hunk #5 succeeded at 268 with fuzz 2 (offset 4 lines).
Hunk #6 succeeded at 283 (offset 4 lines).
Hunk #7 succeeded at 295 (offset 4 lines).
Hunk #8 succeeded at 372 (offset 4 lines).
Hunk #9 succeeded at 409 (offset 4 lines).
Hunk #10 succeeded at 483 (offset 4 lines).
Hunk #11 succeeded at 496 (offset 4 lines).
Hunk #12 succeeded at 510 (offset 4 lines).
Hunk #13 succeeded at 532 (offset 4 lines).
patching file src/ata.c
patching file src/hddtemp.h
patching file src/scsicmds.c

Now at patch hddtemp_0.3-beta15-52.diff

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../hddtemp-0.3-beta15-autodetect-717479.patch     |  20 ++-
 .../hddtemp/hddtemp/hddtemp_0.3-beta15-52.diff     | 182 ++++++++++++---------
 2 files changed, 118 insertions(+), 84 deletions(-)

diff --git a/meta-oe/recipes-support/hddtemp/hddtemp/hddtemp-0.3-beta15-autodetect-717479.patch b/meta-oe/recipes-support/hddtemp/hddtemp/hddtemp-0.3-beta15-autodetect-717479.patch
index 19f8380..1ec6a61 100644
--- a/meta-oe/recipes-support/hddtemp/hddtemp/hddtemp-0.3-beta15-autodetect-717479.patch
+++ b/meta-oe/recipes-support/hddtemp/hddtemp/hddtemp-0.3-beta15-autodetect-717479.patch
@@ -3,9 +3,10 @@ Auto-detect disks if none specified
 Refer to:
 https://bugzilla.redhat.com/show_bug.cgi?id=717479
 
-diff -up hddtemp-0.3-beta15/doc/hddtemp.8~ hddtemp-0.3-beta15/doc/hddtemp.8
---- hddtemp-0.3-beta15/doc/hddtemp.8~	2011-08-18 00:36:05.689001470 +0300
-+++ hddtemp-0.3-beta15/doc/hddtemp.8	2011-08-18 00:44:46.753006253 +0300
+Index: hddtemp-0.3-beta15/doc/hddtemp.8
+===================================================================
+--- hddtemp-0.3-beta15.orig/doc/hddtemp.8
++++ hddtemp-0.3-beta15/doc/hddtemp.8
 @@ -19,7 +19,7 @@
  hddtemp \- Utility to monitor hard drive temperature
  .SH SYNOPSIS
@@ -25,9 +26,10 @@ diff -up hddtemp-0.3-beta15/doc/hddtemp.8~ hddtemp-0.3-beta15/doc/hddtemp.8
  
  
  .SH "OPTIONS"
-diff -up hddtemp-0.3-beta15/src/hddtemp.c~ hddtemp-0.3-beta15/src/hddtemp.c
---- hddtemp-0.3-beta15/src/hddtemp.c~	2011-08-18 00:36:05.638996861 +0300
-+++ hddtemp-0.3-beta15/src/hddtemp.c	2011-08-18 00:35:55.485060798 +0300
+Index: hddtemp-0.3-beta15/src/hddtemp.c
+===================================================================
+--- hddtemp-0.3-beta15.orig/src/hddtemp.c
++++ hddtemp-0.3-beta15/src/hddtemp.c
 @@ -54,6 +54,7 @@
  #include <linux/hdreg.h>
  #include <ctype.h>
@@ -44,7 +46,7 @@ diff -up hddtemp-0.3-beta15/src/hddtemp.c~ hddtemp-0.3-beta15/src/hddtemp.c
  
    backtrace_sigsegv();
    backtrace_sigill();
-@@ -419,11 +421,6 @@ int main(int argc, char* argv[]) {
+@@ -423,11 +425,6 @@ int main(int argc, char* argv[]) {
       exit(0);
    }
    
@@ -56,7 +58,7 @@ diff -up hddtemp-0.3-beta15/src/hddtemp.c~ hddtemp-0.3-beta15/src/hddtemp.c
    if(debug) {
      /*    argc = optind + 1;*/
      quiet = 1;
-@@ -434,6 +431,23 @@ int main(int argc, char* argv[]) {
+@@ -438,6 +435,23 @@ int main(int argc, char* argv[]) {
      exit(1);
    }
  
@@ -80,7 +82,7 @@ diff -up hddtemp-0.3-beta15/src/hddtemp.c~ hddtemp-0.3-beta15/src/hddtemp.c
    init_bus_types();
  
    /* collect disks informations */
-@@ -527,6 +541,7 @@ int main(int argc, char* argv[]) {
+@@ -531,6 +545,7 @@ int main(int argc, char* argv[]) {
    else {
      do_direct_mode(ldisks);
    }
diff --git a/meta-oe/recipes-support/hddtemp/hddtemp/hddtemp_0.3-beta15-52.diff b/meta-oe/recipes-support/hddtemp/hddtemp/hddtemp_0.3-beta15-52.diff
index f61c164..057b1fd 100644
--- a/meta-oe/recipes-support/hddtemp/hddtemp/hddtemp_0.3-beta15-52.diff
+++ b/meta-oe/recipes-support/hddtemp/hddtemp/hddtemp_0.3-beta15-52.diff
@@ -8,9 +8,11 @@ Filtered with:
 
 Upstream-Status: unmaintained
 
+Index: hddtemp-0.3-beta15/doc/hddtemp.8
+===================================================================
 --- hddtemp-0.3-beta15.orig/doc/hddtemp.8
 +++ hddtemp-0.3-beta15/doc/hddtemp.8
-@@ -58,6 +58,10 @@
+@@ -58,6 +58,10 @@ Execute hddtemp in TCP/IP daemon mode (p
  .B \-f, \-\-file=\fIfile\fI
  Specify the database file to use.
  .TP
@@ -21,7 +23,7 @@ Upstream-Status: unmaintained
  .B \-l, \-\-listen=\fIaddr\fR
  Listen on a specific address.  \fIaddr\fR is a string containing a
  host name or a numeric host address string.  The numeric host address
-@@ -80,6 +84,9 @@
+@@ -80,6 +84,9 @@ seconds.
  .B \-q, \-\-quiet
  Don't check if the drive is supported.
  .TP
@@ -31,7 +33,7 @@ Upstream-Status: unmaintained
  .B \-v, \-\-version
  Display hddtemp version number.
  .TP
-@@ -96,7 +103,7 @@
+@@ -96,7 +103,7 @@ Listen on IPv6 sockets only.
  .SH "DRIVE DATABASE"
  If you know your drive has a temperature sensor but it is being
  reported unsupported, tell me which model and which manufacturer it
@@ -40,7 +42,7 @@ Upstream-Status: unmaintained
  line of hddtemp.db is either a comment, a blank line or a line
  containing:
  .TP
-@@ -112,7 +119,7 @@
+@@ -112,7 +119,7 @@ set of drives from its model name or fro
  Feedback is welcome (see the REPORT section below).
  
  .SH "TCP/IP DAEMON MODE"
@@ -49,7 +51,7 @@ Upstream-Status: unmaintained
  .PP
  # hddtemp SATA:/dev/sda PATA:/dev/hda
  .PP
-@@ -120,7 +127,7 @@
+@@ -120,7 +127,7 @@ To test
  .B hddtemp
  in daemon mode, start it like this:
  .PP
@@ -58,7 +60,7 @@ Upstream-Status: unmaintained
  .PP
  .PP
  and use
-@@ -165,8 +172,8 @@
+@@ -165,8 +172,8 @@ and 12 are often reported to match a tem
  investigation they do not.  But fields 194 (which is the standard
  field for temperature) and 231 are good candidates.
  .PP
@@ -69,13 +71,15 @@ Upstream-Status: unmaintained
  yourself.
  
  .SH "BUGS"
-@@ -183,5 +190,5 @@
+@@ -183,5 +190,5 @@ supported on i386 architectures only.
  .PP
  Emmanuel Varagnat (hddtemp@guzu.net).
  .PP
 -This manual page was originaly written by Aurelien Jarno <aurel32@debian.org>,
 +This manual page was originally written by Aurelien Jarno <aurel32@debian.org>,
  for the Debian GNU/Linux system (but may be used by others).
+Index: hddtemp-0.3-beta15/po/fr.po
+===================================================================
 --- hddtemp-0.3-beta15.orig/po/fr.po
 +++ hddtemp-0.3-beta15/po/fr.po
 @@ -7,9 +7,9 @@
@@ -91,7 +95,7 @@ Upstream-Status: unmaintained
  "Last-Translator: Aurelien Jarno <aurelien@aurel32.net>\n"
  "Language-Team: FRANCAIS <fr@li.org>\n"
  "MIME-Version: 1.0\n"
-@@ -17,23 +17,7 @@
+@@ -17,23 +17,7 @@ msgstr ""
  "Content-Transfer-Encoding: 8bit\n"
  "X-Generator: KBabel 1.0.1\n"
  
@@ -116,7 +120,7 @@ Upstream-Status: unmaintained
  #, c-format
  msgid ""
  "\n"
-@@ -46,7 +30,7 @@
+@@ -46,7 +30,7 @@ msgstr ""
  "ModËle: %s\n"
  "\n"
  
@@ -125,7 +129,7 @@ Upstream-Status: unmaintained
  #, c-format
  msgid ""
  "WARNING: Drive %s doesn't seem to have a temperature sensor.\n"
-@@ -60,75 +44,60 @@
+@@ -60,75 +44,60 @@ msgstr ""
  "net).\n"
  "ATTENTION : Voir les options --help, --debug et --drivebase.\n"
  
@@ -216,7 +220,7 @@ Upstream-Status: unmaintained
  "  -b   --drivebase   :  display database file content that allow hddtemp to\n"
  "                        recognize supported drives.\n"
  "  -D   --debug       :  display various S.M.A.R.T. fields and their values.\n"
-@@ -138,6 +107,7 @@
+@@ -138,6 +107,7 @@ msgid ""
  "  -d   --daemon      :  run hddtemp in TCP/IP daemon mode (port %d by "
  "default.)\n"
  "  -f   --file=FILE   :  specify database file to use.\n"
@@ -224,7 +228,7 @@ Upstream-Status: unmaintained
  "  -l   --listen=addr :  listen on a specific interface (in TCP/IP daemon "
  "mode).\n"
  "  -n   --numeric     :  print only the temperature.\n"
-@@ -145,6 +115,8 @@
+@@ -145,6 +115,8 @@ msgid ""
  "  -s   --separator=C :  separator to use between fields (in TCP/IP daemon "
  "mode).\n"
  "  -S   --syslog=s    :  log temperature to syslog every s seconds.\n"
@@ -233,7 +237,7 @@ Upstream-Status: unmaintained
  "  -q   --quiet       :  do not check if the drive is supported.\n"
  "  -v   --version     :  display hddtemp version number.\n"
  "  -w   --wake-up     :  wake-up the drive if need.\n"
-@@ -153,11 +125,14 @@
+@@ -153,11 +125,14 @@ msgid ""
  "\n"
  "Report bugs or new drives to <hddtemp@guzu.net>.\n"
  msgstr ""
@@ -249,7 +253,7 @@ Upstream-Status: unmaintained
  "  -b   --drivebase   :  affiche le contenu du fichier de base de donnÈe "
  "qui \n"
  "                        permet ‡ hddtemp de reconnaÓtre les lecteurs "
-@@ -172,6 +147,7 @@
+@@ -172,6 +147,7 @@ msgstr ""
  "dÈfaut).\n"
  "  -f   --file=FILE   :  specifie le fichier ‡ utiliser comme base de "
  "donnÈes.\n"
@@ -257,7 +261,7 @@ Upstream-Status: unmaintained
  "  -l   --listen=addr :  Ècoute sur une interface spÈcifique (en mode dÈmon "
  "TCP/IP).\n"
  "  -n   --numeric     :  affiche seulement la tempÈrature.\n"
-@@ -180,6 +156,8 @@
+@@ -180,6 +156,8 @@ msgstr ""
  "dÈmon TCP/IP).\n"
  "  -S   --syslog=s    :  enregistre la tempÈrature dans syslog tous les s "
  "secondes.\n"
@@ -266,7 +270,7 @@ Upstream-Status: unmaintained
  "  -q   --quiet       :  ne vÈrifie pas si le lecteur est supportÈ.\n"
  "  -v   --version     :  affiche la version de hddtemp.\n"
  "  -w   --wake-up     :  rÈveiller le lecteur si nÈcessaire.\n"
-@@ -188,62 +166,95 @@
+@@ -188,62 +166,95 @@ msgstr ""
  "\n"
  "Report bugs or new drives to <hddtemp@guzu.net>.\n"
  
@@ -377,6 +381,8 @@ Upstream-Status: unmaintained
 +
 +#~ msgid "field(%d)\t = %d\n"
 +#~ msgstr "champ(%d)\t = %d\n"
+Index: hddtemp-0.3-beta15/po/ru.po
+===================================================================
 --- hddtemp-0.3-beta15.orig/po/ru.po
 +++ hddtemp-0.3-beta15/po/ru.po
 @@ -6,8 +6,8 @@
@@ -390,7 +396,7 @@ Upstream-Status: unmaintained
  "PO-Revision-Date: 2003-03-08 16:42+0300\n"
  "Last-Translator: Michael Shigorin <mike@altlinux.ru>\n"
  "Language-Team: Russian <ru@li.org>\n"
-@@ -15,23 +15,7 @@
+@@ -15,23 +15,7 @@ msgstr ""
  "Content-Type: text/plain; charset=koi8-r\n"
  "Content-Transfer-Encoding: 8bit\n"
  
@@ -415,7 +421,7 @@ Upstream-Status: unmaintained
  #, c-format
  msgid ""
  "\n"
-@@ -40,7 +24,7 @@
+@@ -40,7 +24,7 @@ msgid ""
  "\n"
  msgstr ""
  
@@ -424,7 +430,7 @@ Upstream-Status: unmaintained
  #, c-format
  msgid ""
  "WARNING: Drive %s doesn't seem to have a temperature sensor.\n"
-@@ -53,72 +37,59 @@
+@@ -53,72 +37,59 @@ msgstr ""
  "˜ÓÈÌ·ÓÈÂ: Â”Ã… ◊Ÿ ‘œﬁŒœ ⁄Œ¡≈‘≈, ﬁ‘œ ƒ¡‘ﬁ…À ≈”‘ÿ, Œ¡–…€…‘≈ hddtemp@guzu.net\n"
  "˜ÓÈÌ·ÓÈÂ: (”Õ. œ–√…… --help, --debug … --drivebase).\n"
  
@@ -512,7 +518,7 @@ Upstream-Status: unmaintained
  "  -b   --drivebase   :  display database file content that allow hddtemp to\n"
  "                        recognize supported drives.\n"
  "  -D   --debug       :  display various S.M.A.R.T. fields and their values.\n"
-@@ -128,6 +99,7 @@
+@@ -128,6 +99,7 @@ msgid ""
  "  -d   --daemon      :  run hddtemp in TCP/IP daemon mode (port %d by "
  "default.)\n"
  "  -f   --file=FILE   :  specify database file to use.\n"
@@ -520,7 +526,7 @@ Upstream-Status: unmaintained
  "  -l   --listen=addr :  listen on a specific interface (in TCP/IP daemon "
  "mode).\n"
  "  -n   --numeric     :  print only the temperature.\n"
-@@ -135,6 +107,8 @@
+@@ -135,6 +107,8 @@ msgid ""
  "  -s   --separator=C :  separator to use between fields (in TCP/IP daemon "
  "mode).\n"
  "  -S   --syslog=s    :  log temperature to syslog every s seconds.\n"
@@ -529,7 +535,7 @@ Upstream-Status: unmaintained
  "  -q   --quiet       :  do not check if the drive is supported.\n"
  "  -v   --version     :  display hddtemp version number.\n"
  "  -w   --wake-up     :  wake-up the drive if need.\n"
-@@ -168,59 +142,90 @@
+@@ -168,59 +142,90 @@ msgstr ""
  "\n"
  "Ûœœ¬›≈Œ…— œ¬ œ€…¬À¡» … ƒ¡ŒŒŸ≈ ƒÃ— ƒ…”Àœ◊ œ‘–“¡◊Ã— ‘≈ Œ¡ <hddtemp@guzu.net>.\n"
  
@@ -636,6 +642,8 @@ Upstream-Status: unmaintained
 +
 +#~ msgid "field(%d)\t = %d\n"
 +#~ msgstr "–œÃ≈(%d)\t = %d\n"
+Index: hddtemp-0.3-beta15/po/sv.po
+===================================================================
 --- hddtemp-0.3-beta15.orig/po/sv.po
 +++ hddtemp-0.3-beta15/po/sv.po
 @@ -6,8 +6,8 @@
@@ -649,7 +657,7 @@ Upstream-Status: unmaintained
  "PO-Revision-Date: 2005-11-02 19:03+0100\n"
  "Last-Translator: Daniel Nylander <po@danielnylander.se>\n"
  "Language-Team: Swedish <sv@li.org>\n"
-@@ -17,23 +17,7 @@
+@@ -17,23 +17,7 @@ msgstr ""
  "X-Poedit-Language: swe\n"
  "X-Poedit-Country: swe\n"
  
@@ -674,7 +682,7 @@ Upstream-Status: unmaintained
  #, c-format
  msgid ""
  "\n"
-@@ -46,7 +30,7 @@
+@@ -46,7 +30,7 @@ msgstr ""
  "Modell: %s\n"
  "\n"
  
@@ -683,7 +691,7 @@ Upstream-Status: unmaintained
  #, c-format
  msgid ""
  "WARNING: Drive %s doesn't seem to have a temperature sensor.\n"
-@@ -60,76 +44,63 @@
+@@ -60,76 +44,63 @@ msgstr ""
  "net).\n"
  "VARNING: Se --help, --debug och --drivebase flaggorna.\n"
  
@@ -777,7 +785,7 @@ Upstream-Status: unmaintained
  "  -b   --drivebase   :  display database file content that allow hddtemp to\n"
  "                        recognize supported drives.\n"
  "  -D   --debug       :  display various S.M.A.R.T. fields and their values.\n"
-@@ -139,6 +110,7 @@
+@@ -139,6 +110,7 @@ msgid ""
  "  -d   --daemon      :  run hddtemp in TCP/IP daemon mode (port %d by "
  "default.)\n"
  "  -f   --file=FILE   :  specify database file to use.\n"
@@ -785,7 +793,7 @@ Upstream-Status: unmaintained
  "  -l   --listen=addr :  listen on a specific interface (in TCP/IP daemon "
  "mode).\n"
  "  -n   --numeric     :  print only the temperature.\n"
-@@ -146,6 +118,8 @@
+@@ -146,6 +118,8 @@ msgid ""
  "  -s   --separator=C :  separator to use between fields (in TCP/IP daemon "
  "mode).\n"
  "  -S   --syslog=s    :  log temperature to syslog every s seconds.\n"
@@ -794,7 +802,7 @@ Upstream-Status: unmaintained
  "  -q   --quiet       :  do not check if the drive is supported.\n"
  "  -v   --version     :  display hddtemp version number.\n"
  "  -w   --wake-up     :  wake-up the drive if need.\n"
-@@ -184,61 +158,91 @@
+@@ -184,61 +158,91 @@ msgstr ""
  "\n"
  "Rapportera buggar eller nya hÂrddiskar till <hddtemp@guzu.net>.\n"
  
@@ -901,9 +909,11 @@ Upstream-Status: unmaintained
 +
 +#~ msgid "field(%d)\t = %d\n"
 +#~ msgstr "f‰lt(%d)\t = %d\n"
+Index: hddtemp-0.3-beta15/po/pt.po
+===================================================================
 --- hddtemp-0.3-beta15.orig/po/pt.po
 +++ hddtemp-0.3-beta15/po/pt.po
-@@ -7,7 +7,7 @@
+@@ -7,7 +7,7 @@ msgid ""
  msgstr ""
  "Project-Id-Version: hddtemp 0.3-beta14\n"
  "Report-Msgid-Bugs-To: \n"
@@ -912,7 +922,7 @@ Upstream-Status: unmaintained
  "PO-Revision-Date: 2006-03-29 23:22+0000\n"
  "Last-Translator: Miguel Figueiredo <elmig@debianp.org>\n"
  "Language-Team: Portuguese <traduz@debianpt.org>\n"
-@@ -15,23 +15,7 @@
+@@ -15,23 +15,7 @@ msgstr ""
  "Content-Type: text/plain; charset=UTF-8\n"
  "Content-Transfer-Encoding: 8bit\n"
  
@@ -937,7 +947,7 @@ Upstream-Status: unmaintained
  #, c-format
  msgid ""
  "\n"
-@@ -44,7 +28,7 @@
+@@ -44,7 +28,7 @@ msgstr ""
  "Modelo: %s\n"
  "\n"
  
@@ -946,7 +956,7 @@ Upstream-Status: unmaintained
  #, c-format
  msgid ""
  "WARNING: Drive %s doesn't seem to have a temperature sensor.\n"
-@@ -54,79 +38,68 @@
+@@ -54,79 +38,68 @@ msgid ""
  msgstr ""
  "AVISO: O disco %s n√£o parece ter um sensor de temperatura.\n"
  "AVISO: Isto n√£o significa que n√£o tem nenhum.\n"
@@ -1047,7 +1057,7 @@ Upstream-Status: unmaintained
  "  -b   --drivebase   :  display database file content that allow hddtemp to\n"
  "                        recognize supported drives.\n"
  "  -D   --debug       :  display various S.M.A.R.T. fields and their values.\n"
-@@ -136,6 +109,7 @@
+@@ -136,6 +109,7 @@ msgid ""
  "  -d   --daemon      :  run hddtemp in TCP/IP daemon mode (port %d by "
  "default.)\n"
  "  -f   --file=FILE   :  specify database file to use.\n"
@@ -1055,7 +1065,7 @@ Upstream-Status: unmaintained
  "  -l   --listen=addr :  listen on a specific interface (in TCP/IP daemon "
  "mode).\n"
  "  -n   --numeric     :  print only the temperature.\n"
-@@ -143,6 +117,8 @@
+@@ -143,6 +117,8 @@ msgid ""
  "  -s   --separator=C :  separator to use between fields (in TCP/IP daemon "
  "mode).\n"
  "  -S   --syslog=s    :  log temperature to syslog every s seconds.\n"
@@ -1064,7 +1074,7 @@ Upstream-Status: unmaintained
  "  -q   --quiet       :  do not check if the drive is supported.\n"
  "  -v   --version     :  display hddtemp version number.\n"
  "  -w   --wake-up     :  wake-up the drive if need.\n"
-@@ -156,19 +132,23 @@
+@@ -156,19 +132,23 @@ msgstr ""
  "   hddtemp mostra a temperatura dos discos indicados no argumento.\n"
  "   Os discos t√™m de suportar S.M.A.R.T.\n"
  "\n"
@@ -1096,7 +1106,7 @@ Upstream-Status: unmaintained
  "  -q   --quiet       :  n√£o verificar se o disco √© suportado.\n"
  "  -v   --version     :  mostrar o n√∫mero da vers√£o do hddtemp.\n"
  "  -w   --wake-up     :  acordar o disco se necess√°rio.\n"
-@@ -177,58 +157,93 @@
+@@ -177,58 +157,93 @@ msgstr ""
  "\n"
  "Relatar bugs ou novos discos para <hddtemp@guzu.net>.\n"
  
@@ -1208,7 +1218,9 @@ Upstream-Status: unmaintained
 +
 +#~ msgid "field(%d)\t = %d\n"
 +#~ msgstr "campo(%d)\t = %d\n"
---- hddtemp-0.3-beta15.orig/po/de.po
+Index: hddtemp-0.3-beta15/po/de.po
+===================================================================
+--- /dev/null
 +++ hddtemp-0.3-beta15/po/de.po
 @@ -0,0 +1,250 @@
 +# German translation of hddtemp.
@@ -1461,12 +1473,16 @@ Upstream-Status: unmaintained
 +#, c-format
 +msgid "log sense failed : %s"
 +msgstr "Protokoll-Erkennung fehlgeschlagen : %s"
+Index: hddtemp-0.3-beta15/po/LINGUAS
+===================================================================
 --- hddtemp-0.3-beta15.orig/po/LINGUAS
 +++ hddtemp-0.3-beta15/po/LINGUAS
 @@ -1,2 +1,2 @@
  # Set of available languages.
 -fr pt ru sv 
 +de fr pt ru sv 
+Index: hddtemp-0.3-beta15/po/hddtemp.pot
+===================================================================
 --- hddtemp-0.3-beta15.orig/po/hddtemp.pot
 +++ hddtemp-0.3-beta15/po/hddtemp.pot
 @@ -1,35 +1,22 @@
@@ -1513,7 +1529,7 @@ Upstream-Status: unmaintained
  #, c-format
  msgid ""
  "\n"
-@@ -38,7 +25,7 @@
+@@ -38,7 +25,7 @@ msgid ""
  "\n"
  msgstr ""
  
@@ -1522,7 +1538,7 @@ Upstream-Status: unmaintained
  #, c-format
  msgid ""
  "WARNING: Drive %s doesn't seem to have a temperature sensor.\n"
-@@ -47,67 +34,59 @@
+@@ -47,67 +34,59 @@ msgid ""
  "WARNING: See --help, --debug and --drivebase options.\n"
  msgstr ""
  
@@ -1604,7 +1620,7 @@ Upstream-Status: unmaintained
  "  -b   --drivebase   :  display database file content that allow hddtemp to\n"
  "                        recognize supported drives.\n"
  "  -D   --debug       :  display various S.M.A.R.T. fields and their values.\n"
-@@ -117,6 +96,7 @@
+@@ -117,6 +96,7 @@ msgid ""
  "  -d   --daemon      :  run hddtemp in TCP/IP daemon mode (port %d by "
  "default.)\n"
  "  -f   --file=FILE   :  specify database file to use.\n"
@@ -1612,7 +1628,7 @@ Upstream-Status: unmaintained
  "  -l   --listen=addr :  listen on a specific interface (in TCP/IP daemon "
  "mode).\n"
  "  -n   --numeric     :  print only the temperature.\n"
-@@ -124,6 +104,8 @@
+@@ -124,6 +104,8 @@ msgid ""
  "  -s   --separator=C :  separator to use between fields (in TCP/IP daemon "
  "mode).\n"
  "  -S   --syslog=s    :  log temperature to syslog every s seconds.\n"
@@ -1621,7 +1637,7 @@ Upstream-Status: unmaintained
  "  -q   --quiet       :  do not check if the drive is supported.\n"
  "  -v   --version     :  display hddtemp version number.\n"
  "  -w   --wake-up     :  wake-up the drive if need.\n"
-@@ -133,58 +115,69 @@
+@@ -133,58 +115,69 @@ msgid ""
  "Report bugs or new drives to <hddtemp@guzu.net>.\n"
  msgstr ""
  
@@ -1705,9 +1721,11 @@ Upstream-Status: unmaintained
  #, c-format
  msgid "log sense failed : %s"
  msgstr ""
+Index: hddtemp-0.3-beta15/src/sata.c
+===================================================================
 --- hddtemp-0.3-beta15.orig/src/sata.c
 +++ hddtemp-0.3-beta15/src/sata.c
-@@ -118,11 +118,22 @@
+@@ -118,11 +118,22 @@ static enum e_gettemp sata_get_temperatu
    int              i;
    u16 *            p;
  
@@ -1731,7 +1749,7 @@ Upstream-Status: unmaintained
    
    /* get SMART values */
    if(sata_enable_smart(dsk->fd) != 0) {
-@@ -154,24 +165,15 @@
+@@ -154,24 +165,15 @@ static enum e_gettemp sata_get_temperatu
    }
  
    /* temperature */
@@ -1759,6 +1777,8 @@ Upstream-Status: unmaintained
  
    /* never reached */
  }
+Index: hddtemp-0.3-beta15/src/satacmds.c
+===================================================================
 --- hddtemp-0.3-beta15.orig/src/satacmds.c
 +++ hddtemp-0.3-beta15/src/satacmds.c
 @@ -39,7 +39,7 @@
@@ -1770,7 +1790,7 @@ Upstream-Status: unmaintained
  
  // Application specific includes
  #include "satacmds.h"
-@@ -80,8 +80,8 @@
+@@ -80,8 +80,8 @@ int sata_pass_thru(int device, unsigned
  
    ret = scsi_SG_IO(device, cdb, sizeof(cdb), buffer, cmd[3] * 512, sense, sizeof(sense), dxfer_direction);
   
@@ -1781,7 +1801,7 @@ Upstream-Status: unmaintained
      return 1;		  
    else 
      return ret;
-@@ -95,10 +95,10 @@
+@@ -95,10 +95,10 @@ void sata_fixstring(unsigned char *s, in
    p = s;
    end = &s[bytecount & ~1]; /* bytecount must be even */
  
@@ -1794,6 +1814,8 @@ Upstream-Status: unmaintained
    }
  
    /* strip leading blanks */
+Index: hddtemp-0.3-beta15/src/backtrace.c
+===================================================================
 --- hddtemp-0.3-beta15.orig/src/backtrace.c
 +++ hddtemp-0.3-beta15/src/backtrace.c
 @@ -16,9 +16,10 @@
@@ -1822,7 +1844,7 @@ Upstream-Status: unmaintained
  
  #define MAX_BTSIZE 64
  
-@@ -42,7 +47,6 @@
+@@ -42,7 +47,6 @@ void backtrace_handler(int n, siginfo_t
    static char **messages = NULL;
    static size_t btsize = 0;
    static size_t i;
@@ -1830,7 +1852,7 @@ Upstream-Status: unmaintained
    static char *strerr = "???";
    static FILE *fstrm;
  
-@@ -61,10 +65,10 @@
+@@ -61,10 +65,10 @@ void backtrace_handler(int n, siginfo_t
        SIC_CASE(SEGV_MAPERR);
        SIC_CASE(SEGV_ACCERR);
      }
@@ -1843,7 +1865,7 @@ Upstream-Status: unmaintained
      break;
    case SIGILL:
      switch(ist->si_code) {
-@@ -77,10 +81,10 @@
+@@ -77,10 +81,10 @@ void backtrace_handler(int n, siginfo_t
        SIC_CASE(ILL_COPROC);
        SIC_CASE(ILL_BADSTK);
      }
@@ -1856,7 +1878,7 @@ Upstream-Status: unmaintained
      break;
    case SIGBUS:
      switch(ist->si_code) {
-@@ -88,10 +92,10 @@
+@@ -88,10 +92,10 @@ void backtrace_handler(int n, siginfo_t
        SIC_CASE(BUS_ADRERR);
        SIC_CASE(BUS_OBJERR);
      }
@@ -1869,7 +1891,7 @@ Upstream-Status: unmaintained
      break;
    }
    fflush(fstrm);
-@@ -101,7 +105,7 @@
+@@ -101,7 +105,7 @@ void backtrace_handler(int n, siginfo_t
    /*
      old_eip = *(unsigned int*)((void*)&n-4);
      old_ebp = *(unsigned int*)((void*)&n-8);
@@ -1878,7 +1900,7 @@ Upstream-Status: unmaintained
      *(unsigned int*)((void*)&n-8) = puc->uc_mcontext.gregs[REG_EBP];    
      
      btsize = backtrace(btinfo, MAX_BTSIZE);
-@@ -111,14 +115,14 @@
+@@ -111,14 +115,14 @@ void backtrace_handler(int n, siginfo_t
    */
    
    btsize = backtrace(btinfo, MAX_BTSIZE);
@@ -1895,9 +1917,11 @@ Upstream-Status: unmaintained
    fflush(fstrm);
    fclose(fstrm);
  
+Index: hddtemp-0.3-beta15/src/daemon.c
+===================================================================
 --- hddtemp-0.3-beta15.orig/src/daemon.c
 +++ hddtemp-0.3-beta15/src/daemon.c
-@@ -163,19 +163,16 @@
+@@ -163,19 +163,16 @@ void daemon_send_msg(struct disk *ldisks
  
      switch(dsk->ret) {
      case GETTEMP_NOT_APPLICABLE:
@@ -1922,7 +1946,7 @@ Upstream-Status: unmaintained
        break;
      case GETTEMP_KNOWN:
        n = snprintf(msg, sizeof(msg), "%s%c%s%c%d%c%c",
-@@ -185,26 +182,23 @@
+@@ -185,26 +182,23 @@ void daemon_send_msg(struct disk *ldisks
                     get_unit(dsk));
        break;
      case GETTEMP_NOSENSOR:
@@ -1955,7 +1979,7 @@ Upstream-Status: unmaintained
        break;
      }
      write(cfd,&separator, 1);
-@@ -222,14 +216,11 @@
+@@ -222,14 +216,11 @@ void daemon_syslog(struct disk *ldisks)
    for(dsk = ldisks; dsk; dsk = dsk->next) {
      switch(dsk->ret) {
      case GETTEMP_KNOWN:
@@ -1972,7 +1996,7 @@ Upstream-Status: unmaintained
        break;
      case GETTEMP_DRIVE_SLEEP:
        syslog(LOG_WARNING, _("%s: %s: drive is sleeping"), 
-@@ -270,28 +261,30 @@
+@@ -270,28 +261,30 @@ void do_daemon_mode(struct disk *ldisks)
    fd_set             deffds;
    time_t             next_time;
  
@@ -2025,9 +2049,11 @@ Upstream-Status: unmaintained
    }
    chdir("/");
    umask(0);
+Index: hddtemp-0.3-beta15/src/hddtemp.c
+===================================================================
 --- hddtemp-0.3-beta15.orig/src/hddtemp.c
 +++ hddtemp-0.3-beta15/src/hddtemp.c
-@@ -75,7 +75,7 @@
+@@ -75,7 +75,7 @@ char *             listen_addr;
  char               separator = SEPARATOR;
  
  struct bustype *   bus[BUS_TYPE_MAX];
@@ -2036,7 +2062,7 @@ Upstream-Status: unmaintained
  
  static enum { DEFAULT, CELSIUS, FAHRENHEIT } unit;
  
-@@ -194,23 +194,7 @@
+@@ -194,23 +194,7 @@ static void display_temperature(struct d
      if (numeric && quiet)
        printf("0\n");      
      else
@@ -2061,7 +2087,7 @@ Upstream-Status: unmaintained
  
      break;
    case GETTEMP_KNOWN:
-@@ -232,14 +216,14 @@
+@@ -232,14 +216,14 @@ static void display_temperature(struct d
      if (numeric && quiet)
        printf("0\n");      
      else
@@ -2078,7 +2104,7 @@ Upstream-Status: unmaintained
        
      break;
    default:
-@@ -268,8 +252,9 @@
+@@ -268,8 +252,9 @@ void do_direct_mode(struct disk *ldisks)
  
  int main(int argc, char* argv[]) {
    int           i, c, lindex = 0, db_loaded = 0;
@@ -2089,16 +2115,16 @@ Upstream-Status: unmaintained
  
    backtrace_sigsegv();
    backtrace_sigill();
-@@ -279,7 +264,7 @@
-   bindtextdomain (PACKAGE, LOCALEDIR);
+@@ -283,7 +268,7 @@ int main(int argc, char* argv[]) {
    textdomain (PACKAGE);
+ #endif
    
 -  show_db = debug = numeric = quiet = wakeup = af_hint = syslog_interval = 0;
 +  show_db = debug = numeric = quiet = wakeup = af_hint = syslog_interval = foreground = 0;
    unit = DEFAULT;
    portnum = PORT_NUMBER;
    listen_addr = NULL;
-@@ -294,6 +279,7 @@
+@@ -298,6 +283,7 @@ int main(int argc, char* argv[]) {
        {"drivebase",  0, NULL, 'b'},
        {"debug",      0, NULL, 'D'},
        {"file",       1, NULL, 'f'},
@@ -2106,7 +2132,7 @@ Upstream-Status: unmaintained
        {"listen",     1, NULL, 'l'},
        {"version",    0, NULL, 'v'},
        {"port",       1, NULL, 'p'},
-@@ -305,7 +291,7 @@
+@@ -309,7 +295,7 @@ int main(int argc, char* argv[]) {
        {0, 0, 0, 0}
      };
   
@@ -2115,7 +2141,7 @@ Upstream-Status: unmaintained
      if (c == -1)
        break;
      
-@@ -382,12 +368,13 @@
+@@ -386,12 +372,13 @@ int main(int argc, char* argv[]) {
  		 "                        (done for every drive supplied).\n"
  		 "  -d   --daemon      :  run hddtemp in TCP/IP daemon mode (port %d by default.)\n"
  		 "  -f   --file=FILE   :  specify database file to use.\n"
@@ -2130,7 +2156,7 @@ Upstream-Status: unmaintained
  		 "  -q   --quiet       :  do not check if the drive is supported.\n"
  		 "  -v   --version     :  display hddtemp version number.\n"
  		 "  -w   --wake-up     :  wake-up the drive if need.\n"
-@@ -418,6 +405,9 @@
+@@ -422,6 +409,9 @@ int main(int argc, char* argv[]) {
  	  }
          }
  	break;
@@ -2140,7 +2166,7 @@ Upstream-Status: unmaintained
        default:
  	exit(1);
        }
-@@ -489,6 +479,7 @@
+@@ -493,6 +483,7 @@ int main(int argc, char* argv[]) {
      if( (dsk->fd = open(dsk->drive, O_RDONLY | O_NONBLOCK)) < 0) {
        snprintf(dsk->errormsg, MAX_ERRORMSG_SIZE, "open: %s\n", strerror(errno));
        dsk->type = ERROR;
@@ -2148,7 +2174,7 @@ Upstream-Status: unmaintained
        continue;
      }
  
-@@ -501,6 +492,7 @@
+@@ -505,6 +496,7 @@ int main(int argc, char* argv[]) {
  
        ldisks = dsk->next;
        free(dsk);
@@ -2156,7 +2182,7 @@ Upstream-Status: unmaintained
        continue;
      }
  
-@@ -514,11 +506,17 @@
+@@ -518,11 +510,17 @@ int main(int argc, char* argv[]) {
  	db_loaded = 1;
        }      
  
@@ -2177,16 +2203,18 @@ Upstream-Status: unmaintained
      }
    }
  
-@@ -530,5 +528,5 @@
+@@ -534,5 +532,5 @@ int main(int argc, char* argv[]) {
      do_direct_mode(ldisks);
    }
  
 -  return 0;
 +  return ret;
  }
+Index: hddtemp-0.3-beta15/src/ata.c
+===================================================================
 --- hddtemp-0.3-beta15.orig/src/ata.c
 +++ hddtemp-0.3-beta15/src/ata.c
-@@ -75,7 +75,7 @@
+@@ -75,7 +75,7 @@ static enum e_gettemp ata_get_temperatur
    int              i;
    u16 *            p;
  
@@ -2195,7 +2223,7 @@ Upstream-Status: unmaintained
      close(dsk->fd);
      dsk->fd = -1;
      return GETTEMP_NOSENSOR;
-@@ -140,24 +140,15 @@
+@@ -140,24 +140,15 @@ static enum e_gettemp ata_get_temperatur
    */
  
    /* temperature */
@@ -2224,9 +2252,11 @@ Upstream-Status: unmaintained
  
    /* never reached */
  }
+Index: hddtemp-0.3-beta15/src/hddtemp.h
+===================================================================
 --- hddtemp-0.3-beta15.orig/src/hddtemp.h
 +++ hddtemp-0.3-beta15/src/hddtemp.h
-@@ -39,8 +39,6 @@
+@@ -39,8 +39,6 @@ enum e_gettemp {
    GETTEMP_ERROR,            /* Error */
    GETTEMP_NOT_APPLICABLE,   /* */
    GETTEMP_UNKNOWN,          /* Drive is not in database */
@@ -2235,7 +2265,7 @@ Upstream-Status: unmaintained
    GETTEMP_KNOWN,            /* Drive appear in database */
    GETTEMP_NOSENSOR,         /* Drive appear in database but is known to have no sensor */
    GETTEMP_DRIVE_SLEEP       /* Drive is sleeping */
-@@ -78,7 +76,7 @@
+@@ -78,7 +76,7 @@ struct bustype {
  
  extern struct bustype *   bus[BUS_TYPE_MAX];
  extern char               errormsg[MAX_ERRORMSG_SIZE];
@@ -2244,9 +2274,11 @@ Upstream-Status: unmaintained
  extern char               separator;
  extern long               portnum, syslog_interval;
  extern char *             listen_addr;
+Index: hddtemp-0.3-beta15/src/scsicmds.c
+===================================================================
 --- hddtemp-0.3-beta15.orig/src/scsicmds.c
 +++ hddtemp-0.3-beta15/src/scsicmds.c
-@@ -147,6 +147,7 @@
+@@ -147,6 +147,7 @@ int scsi_inquiry(int device, unsigned ch
      return 1;
    else {
      scsi_fixstring(buffer + 8, 24);
-- 
2.7.4


