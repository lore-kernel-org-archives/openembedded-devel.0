Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TQaKo-0000Ic-DX
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Oct 2012 10:59:40 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 23 Oct 2012 01:46:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,634,1344236400"; d="scan'208";a="237119648"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.83])
	by fmsmga001.fm.intel.com with ESMTP; 23 Oct 2012 01:46:08 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 23 Oct 2012 09:46:01 +0100
Message-Id: <1350981961-5198-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [meta-oe][PATCH v2] hddtemp: add from OE-Classic and update
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
X-List-Received-Date: Tue, 23 Oct 2012 08:59:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

hddtemp is unmaintained upstream so we have to do a bit of patching. All
patches sourced from Debian/Fedora, except hddtemp-no-nls-support.patch
which came from OE-Classic.

Other improvements:
* Add initscript from Debian
* Make LICENSE more accurate
* Add LIC_FILES_CHKSUM
* inherit gettext to avoid error during configure

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../hddtemp-0.3-beta15-autodetect-717479.patch     |   90 +
 .../recipes-support/hddtemp/files/hddtemp-db.patch |  133 ++
 .../hddtemp/files/hddtemp-no-nls-support.patch     |   66 +
 meta-oe/recipes-support/hddtemp/files/hddtemp.db   |  523 +++++
 .../hddtemp/files/hddtemp_0.3-beta15-52.diff       | 2256 ++++++++++++++++++++
 meta-oe/recipes-support/hddtemp/files/init         |  100 +
 .../recipes-support/hddtemp/hddtemp_0.3-beta15.bb  |   31 +
 7 files changed, 3199 insertions(+)
 create mode 100644 meta-oe/recipes-support/hddtemp/files/hddtemp-0.3-beta15-autodetect-717479.patch
 create mode 100644 meta-oe/recipes-support/hddtemp/files/hddtemp-db.patch
 create mode 100644 meta-oe/recipes-support/hddtemp/files/hddtemp-no-nls-support.patch
 create mode 100644 meta-oe/recipes-support/hddtemp/files/hddtemp.db
 create mode 100644 meta-oe/recipes-support/hddtemp/files/hddtemp_0.3-beta15-52.diff
 create mode 100644 meta-oe/recipes-support/hddtemp/files/init
 create mode 100644 meta-oe/recipes-support/hddtemp/hddtemp_0.3-beta15.bb

diff --git a/meta-oe/recipes-support/hddtemp/files/hddtemp-0.3-beta15-autodetect-717479.patch b/meta-oe/recipes-support/hddtemp/files/hddtemp-0.3-beta15-autodetect-717479.patch
new file mode 100644
index 0000000..19f8380
--- /dev/null
+++ b/meta-oe/recipes-support/hddtemp/files/hddtemp-0.3-beta15-autodetect-717479.patch
@@ -0,0 +1,90 @@
+Auto-detect disks if none specified
+
+Refer to:
+https://bugzilla.redhat.com/show_bug.cgi?id=717479
+
+diff -up hddtemp-0.3-beta15/doc/hddtemp.8~ hddtemp-0.3-beta15/doc/hddtemp.8
+--- hddtemp-0.3-beta15/doc/hddtemp.8~	2011-08-18 00:36:05.689001470 +0300
++++ hddtemp-0.3-beta15/doc/hddtemp.8	2011-08-18 00:44:46.753006253 +0300
+@@ -19,7 +19,7 @@
+ hddtemp \- Utility to monitor hard drive temperature
+ .SH SYNOPSIS
+ .B hddtemp
+-.RI [ options ] " [type:]disk" ...
++.RI [ options ] " [[type:]disk]" ...
+ .SH "DESCRIPTION"
+ .PP
+ .B hddtemp 
+@@ -35,7 +35,8 @@ You can specify one or more device drive
+ with a
+ .B type
+ like PATA, SATA or SCSI to force hddtemp too use one of these type
+-(because detection can fail).
++(because detection can fail). If no paths are specified, autodetection of
++installed drives is attempted.
+ 
+ 
+ .SH "OPTIONS"
+diff -up hddtemp-0.3-beta15/src/hddtemp.c~ hddtemp-0.3-beta15/src/hddtemp.c
+--- hddtemp-0.3-beta15/src/hddtemp.c~	2011-08-18 00:36:05.638996861 +0300
++++ hddtemp-0.3-beta15/src/hddtemp.c	2011-08-18 00:35:55.485060798 +0300
+@@ -54,6 +54,7 @@
+ #include <linux/hdreg.h>
+ #include <ctype.h>
+ #include <assert.h>
++#include <glob.h>
+ 
+ // Application specific includes
+ #include "ata.h"
+@@ -255,6 +256,7 @@ int main(int argc, char* argv[]) {
+   int 		ret = 0;
+   int           show_db;
+   struct        disk * ldisks;
++  glob_t        diskglob;
+ 
+   backtrace_sigsegv();
+   backtrace_sigill();
+@@ -419,11 +421,6 @@ int main(int argc, char* argv[]) {
+      exit(0);
+   }
+   
+-  if(argc - optind <= 0) {
+-    fprintf(stderr, _("Too few arguments: you must specify one drive, at least.\n"));
+-    exit(1);
+-  }
+-
+   if(debug) {
+     /*    argc = optind + 1;*/
+     quiet = 1;
+@@ -434,6 +431,23 @@ int main(int argc, char* argv[]) {
+     exit(1);
+   }
+ 
++  memset(&diskglob, 0, sizeof(glob_t));
++  if(argc - optind <= 0) {
++    if(glob("/dev/[hs]d[a-z]", 0, NULL, &diskglob) == 0) {
++      argc = diskglob.gl_pathc;
++      argv = diskglob.gl_pathv;
++      optind = 0;
++    } else {
++      argc = 0;
++    }
++  }
++
++  if(argc - optind <= 0) {
++    globfree(&diskglob);
++    fprintf(stderr, _("Too few arguments: you must specify one drive, at least.\n"));
++    exit(1);
++  }
++
+   init_bus_types();
+ 
+   /* collect disks informations */
+@@ -527,6 +541,7 @@ int main(int argc, char* argv[]) {
+   else {
+     do_direct_mode(ldisks);
+   }
++  globfree(&diskglob);
+ 
+   return ret;
+ }
diff --git a/meta-oe/recipes-support/hddtemp/files/hddtemp-db.patch b/meta-oe/recipes-support/hddtemp/files/hddtemp-db.patch
new file mode 100644
index 0000000..a71a9dd
--- /dev/null
+++ b/meta-oe/recipes-support/hddtemp/files/hddtemp-db.patch
@@ -0,0 +1,133 @@
+hddtemp database update
+
+Patch from Fedora 18 SRPM.
+
+--- ../hddtemp.db~	2007-09-14 21:11:37.000000000 +0300
++++ ../hddtemp.db	2008-02-09 22:10:31.000000000 +0200
+@@ -80,6 +80,8 @@
+ 
+ "FUJITSU MHV2100AH"		194  C	"FUJITSU MHV2100AH" 
+ "FUJITSU MHV2100AT"		194  C	"FUJITSU MHV2100AT" 
++"FUJITSU MHV2100BH"		194  C  "FUJITSU MHV2100BH" 
++"FUJITSU MHV2060AH"		194  C  "FUJITSU MHV2060AH"
+ "FUJITSU MHV2080[AB]H"		194  C	"FUJITSU MHV2080AH"
+ 
+ "FUJITSU MPF3204AH"		194  C	"Fujitsu MPF3204AH"
+@@ -325,11 +327,14 @@
+ "ST3120026A"				194  C	"Seagate Barracuda V ST3120026A"
+ "ST3160021A"				194  C	"Seagate Barracuda 7200.7 - ST3160021A"
+ "ST3160023(A|AS)"			194  C	"Seagate Barracuda V ST3160023A and AS (160Gb, ATA100 or Serial ATA)"
++"ST316081[12](A|AS)"			194  C  "Seagate Barracuda 7200.9 160GB" 
+ "ST3160827AS"				194  C	"Seagate Barracuda 7200.7 160GB (Serial ATA)" 
+ "ST3200021A"				194  C	"Seagate Barracuda 7200.7 Plus 200GB"
+ "ST3200822(A|AS)"			194  C	"Seagate Barracuda 7200.7 Plus 200GB (PATA or SATA)"
+-"ST3200826A"				194  C	"Seagate Barracuda 7200.8 200Gb"
++"ST3200826A"				194  C	"Seagate Barracuda 7200.8 200GB"
+ "ST3250623A"				194  C	"Seagate Barracuda 7200.16 250GB"
++"ST3250624AS"				194  C  "Seagate Barracuda 7200.9 250GB SATA"
++"ST3250624NS"				194  C  "Seagate NL35 SATA (RAID-Edition) 7200 250GB"
+ "ST3250823A"				194  C	"Seagate Barracuda 7200.8 250GB"
+ "ST3250823A"				194  C	"Seagate Barracuda 7200.7 Plus 250GB"
+ "ST3250823NS"				194  C	"Seagate NL35 SATA (RAID-Edition) 7200 250GB"
+@@ -338,9 +343,7 @@
+ "ST3400633(A|AS)"                       194  C  "Seagate Barracuda 7200.7 400 GB"
+ "ST3500630NS"				194  C  "Seagate"
+ "ST3400632NS"				194  C	"Seagate"
+-"ST3320620AS"                           194  C  "Seagate Barracuda 7200.7 320 GB"
+-"ST3500630AS"                           194  C  "Seagate Barracuda 7200.7 500 GB"
+-"ST3802110A"				194  C	"Seagate Barracuda 7200.9 80 GB"
++"ST380[28]110(A|AS)"				194  C	"Seagate Barracuda 7200.9 80 GB"
+ "ST910021A"				194  C	"Seagate Momentus 7200.1 100GB" 
+ "ST910082[35]A"				194  C	"Seagate Momentus 5400.2 100GB"
+ "ST9120821A"				194  C	"Seagate Momentus 5400.2 120GB"
+@@ -351,12 +354,14 @@
+ "ST960822A"				194  C	"Seagate Momentus 5400.2 60GB"
+ "ST96812AS"				194  C	"Seagate Momentus 5400.2 60GB SATA"
+ "ST9808211A"				194  C	"Seagate Momentus 5400.2 80GB"
++"ST98823AS"				194  C  "Seagate Momentus 5400.2 80GB SATA"
+ 
+ ########################################
+ ############# TOSHIBA Laptops
+ ########################################
+ "MK4313MAT"				220  C	"Toshiba MK4313MAT"
+ "TOSHIBA MK1032GAX"			194  C	"Toshiba MK1032GAX"
++"TOSHIBA MK1032GSX"			194  C  "Toshiba MK1032GSX"
+ "TOSHIBA MK1517GAP"			0    C	"Toshiba MK1517GAP"
+ "TOSHIBA MK2018GAS"			226  F	"Toshiba MK2018GAS"
+ "TOSHIBA MK2023GAS"			194  C	"Toshiba MK2023GAS"
+@@ -377,6 +382,7 @@
+ "TOSHIBA MK6026GAX"			194  C	"Toshiba MK6026GAX" 
+ "TOSHIBA MK8025GAS"			194  C	"Toshiba MK8025GAS"
+ "TOSHIBA MK8026GAX"			194  C	"Toshiba MK8026GAX" 
++"TOSHIBA MK8032GSX"			194  C  "Toshiba MK8032GSX" 
+ 
+ "MK4025GAS"				194  C	"Toshiba MK4025GAS"
+ 
+@@ -397,7 +403,7 @@
+ "WDC WD300BB-00CAA0"						  0 C "Western Digital WD300BB"
+ "WDC WD360GD-00FNA0"						194 C "Western Digital SATA Raptor 36.7GB"
+ "WDC WD400BB-00CAA0"						  0 C "Western Digital 400BB-00CAA0"
+-"WDC WD400BB-00J[KH]A0"						194 C "Western Digital Caviar WD400BB"
++"WDC WD400BB-00[DJ][KH]A0"					194 C "Western Digital Caviar WD400BB"
+ "WDC WD400BB-23JHC0"						194 C "Western Digital 23JHC0"
+ #"WDC WD400BB-00GFA0"						  0 C ""
+ "WDC WD400BB-55HEA0"						194 C "Western Digital Caviar WD400BB"
+@@ -416,7 +422,7 @@
+ "WDC WD600VE-75HDT0"						194 C "Western Digital 600VE-75HDT0"
+ "WDC WD600VE-00HDT0"						194 C "Western Digital 600VE-00HDT0"
+ "WDC WD740GD-00FL21.0"						194 C "Western Digital SATA Raptor"
+-"WDC WD740GD-([05]0FL[AC]0|75FLA1)"				194 C "Western Digital SATA Raptor 74GB 8MB"
++"WDC WD740GD-([05]0FL[AC][01]|75FLA1)"				194 C "Western Digital SATA Raptor 74GB 8MB"
+ "WDC WD800BB-00CAA1"						  0 C "Western Digital WD800BB-00CAA1"
+ "WDC WD800BB-(00|22)DKA0"					194 C "Western Digital WD800BB 80 Go"
+ "WDC WD800BB-32CCB0"						194 C "Western Digital 800BB-32CCB0"
+@@ -428,14 +434,13 @@
+ "WDC WD800JB-00CRA1"						  0 C "Western Digital Caviar WD800JB"
+ "WDC WD800JB-00(ET|FM|FS)A0"					194 C "Western Digital Caviar 80GB Special Edition 8MB"
+ "WDC WD800JB-00JJ[AC]0"						194 C "Western Digital WD800JB"
+-"WDC WD800JD-(00|55)(HK|JR)A0"					194 C "Western Digital SATA 80GB, 8MB Cache"
+-"WDC WD800JD-00(HK|JN)A0"					194 C "Western Digital SATA 80GB, 8MB Cache"
++"WDC WD800JD-(00|55|75)(HK|JR|JN)[AC]0"				194 C "Western Digital SATA 80GB, 8MB Cache"
+ "WDC WD800LB-(00|55)DNA0"					194 C "Western Digital Caviar WD800LB 80 Go ATA-100"
+ "WDC WD800VE-07HDT0"						194 C "Western Digital 800VE-07HDT0"
+ "WDC WD1200BB-00(FTA|GUA)0"					194 C "Western Digital Caviar EIDE 2MB Cache"
+-"WDC WD1200JB-00(EV|FU|GV)A0"					194 C "Western Digital Caviar 120GB Special Edition 8MB" 
++"WDC WD1200JB-00(EV|FU|GV|RE)A0"				194 C "Western Digital Caviar 120GB Special Edition 8MB" 
+ "WDC WD1200JB-22GVA0"						194 C "Western Digital Caviar 120GB"
+-"WDC WD1200JD-00(GBB|HBC)0"					194 C "Western Digital WD1200JD"
++"WDC WD1200JD-00(FYB|GBB|HBC)0"					194 C "Western Digital WD1200JD"
+ "WDC WD1200LB-55EDA0"						194 C "Western Digital WD1220LB"
+ "WDC WD1200SB-01KB[AC]0"					194 C "Western Digital Caviar RE (Raid Edition) 120 GB"
+ "WDC WD1600BB-00DWA0"						194 C "Western Digital Caviar WD1600BB"
+@@ -443,10 +448,11 @@
+ "WDC WD2000BB-00FTA0"						194 C "Western Digital WD2000BB"
+ "WDC WD2000JB-(00EV|32EV|34EV|00FU|00GV|55GV|98GV|00KF)A0"	194 C "Western Digital Caviar 200GB Special Edition 8MB"
+ "WDC WD2000JB-00GVC0"						194 C "Western Digital WD2000JB"
++"WDC WD2000JD-00FYB0"						194 C "Western Digital WD2000JD"
+ "WDC WD2000JS-00MHB1"						194 C "Western Digital SATA 200GB"
+ "WDC WD2500JB-(00RE|00EV|00FU|32FU|00GV|55GV)A0"		194 C "Western Digital Caviar 250GB Special Edition 8MB"
+ "WDC WD2500JB-00GVC0"						194 C "Western Digital 250GB"
+-"WDC WD2500JD-(00G|32H)BB0"					194 C "Western Digital SATA Caviar 250GB Special Edition 8MB"
++"WDC WD2500JD-(00G|32H|75H)BB0"					194 C "Western Digital SATA Caviar 250GB Special Edition 8MB"
+ "WDC WD2500JD-40HBC0"						194 C "Western Digital WD2500JD-40HBC0" 
+ "WDC WD2500PB-98FBA0"						194 C "Western Digital Caviar 250GB Special Edition 8MB"
+ "WDC WD2500PD-00FZB1"						194 C "Western Digital WD2500PD-00FZB1" 
+@@ -510,7 +516,7 @@
+ "Maxtor 7(L|V)300(F|R|S)0"		194 C "Maxtor MaXLine III 300GB 7200rpm"
+ "MAXTOR STM3320620AS"			194 C ""
+ 
+-"WDC WD1500ADFD-00NLR1"                                         194 C "Western Digital Raptor 150GB"
++"WDC WD1500ADFD-00NLR[01]"                                         194 C "Western Digital Raptor 150GB"
+ "WDC WD1600JS-00NCB1"						194 C "Western Digital Caviar 1600JS 160GB Sata"
+ "WDC WD1600SD-01KCC0"						194 C "Western Digital Caviar RE Serial ATA series"
+ "WDC WD2500JD-57HBC0"                                           194 C "Western Digital Caviar SE (Serial ATA) 250 GB"
+@@ -518,6 +524,8 @@
+ "WDC WD2500JS-41MVB1"						194 C "Western Digital SATAII Caviar 250GB Special Edition 8MB"
+ "WDC WD2500JD-00HBB0"						194 C   "Western Digital SATA 250GB" 
+ "WDC WD2500KS-00MJB0"						194 C "Western Digital SATA-II Caviar 250GB Special Edition 16MB"
++"WDC WD2500YD-01NVB1"						194 C "Western Digital Caviar RE 250GB 16MB"
+ "WDC WD3000JS-00PDB0"						194 C "Western Digital WD3000JS"
+-"WDC WD3200KS-00PFB0"						194 C	""
++"WDC WD3200KS-00PFB0"						194 C "Western Digital Caviar 320GB 16MB"
+ "WDC WD3200JD-22KLB0"                                           194 C "Western Digital Caviar SE 320GB 8MB" 
++"WDC WD3200SD-01KNB0"						194 C "Western Digital Caviar RE 320GB SATA 8MB"
diff --git a/meta-oe/recipes-support/hddtemp/files/hddtemp-no-nls-support.patch b/meta-oe/recipes-support/hddtemp/files/hddtemp-no-nls-support.patch
new file mode 100644
index 0000000..8f6b9c3
--- /dev/null
+++ b/meta-oe/recipes-support/hddtemp/files/hddtemp-no-nls-support.patch
@@ -0,0 +1,66 @@
+diff -ru hddtemp-0.3-beta15.orig/configure.in hddtemp-0.3-beta15/configure.in
+--- hddtemp-0.3-beta15.orig/configure.in	2005-10-17 20:14:19.000000000 +0100
++++ hddtemp-0.3-beta15/configure.in	2008-06-27 00:00:46.000000000 +0100
+@@ -17,6 +17,7 @@
+ # append the host alias to the tools for cross compiling
+ AC_HEADER_STDC
+ AC_CHECK_HEADERS(fcntl.h)
++AC_CHECK_HEADERS(iconv.h)
+ AC_CHECK_HEADERS(netinet/in.h)
+ AC_CHECK_TYPE(in_addr_t, ,[AC_DEFINE_UNQUOTED([in_addr_t], [uint32_t], [Define to 'uint32_t' if <netinet/in.h> does not define.])], [#include <netinet/in.h>])
+ 
+@@ -29,6 +30,8 @@
+ AM_GNU_GETTEXT
+ #AM_GNU_GETTEXT([external])
+ 
++AC_CHECK_FUNCS([bindtextdomain textdomain iconv])
++
+ dnl reasonable guesses for where stuff is installed
+ dnl if we don't do that now, the config.h will use ${prefix}
+ dnl for DEFAULT_DATABASE_PATH.
+diff -ru hddtemp-0.3-beta15.orig/src/hddtemp.c hddtemp-0.3-beta15/src/hddtemp.c
+--- hddtemp-0.3-beta15.orig/src/hddtemp.c	2006-04-19 03:37:35.000000000 +0100
++++ hddtemp-0.3-beta15/src/hddtemp.c	2008-06-26 23:59:40.000000000 +0100
+@@ -276,8 +276,12 @@
+   backtrace_sigbus();
+ 
+   setlocale (LC_ALL, "");
++#ifdef HAVE_BINDTEXTDOMAIN
+   bindtextdomain (PACKAGE, LOCALEDIR);
++#endif
++#ifdef HAVE_TEXTDOMAIN
+   textdomain (PACKAGE);
++#endif
+   
+   show_db = debug = numeric = quiet = wakeup = af_hint = syslog_interval = 0;
+   unit = DEFAULT;
+diff -ru hddtemp-0.3-beta15.orig/src/utf8.c hddtemp-0.3-beta15/src/utf8.c
+--- hddtemp-0.3-beta15.orig/src/utf8.c	2006-04-19 03:37:02.000000000 +0100
++++ hddtemp-0.3-beta15/src/utf8.c	2008-06-27 00:02:15.000000000 +0100
+@@ -23,7 +23,9 @@
+ 
+ // Standard includes
+ #include <stdlib.h>
++#ifdef HAVE_ICONV_H
+ #include <iconv.h>
++#endif
+ #include <langinfo.h>
+ #include <locale.h>
+ #include <string.h>
+@@ -34,6 +36,7 @@
+ 
+ static char *iconv_from_utf8_to_locale(const char *string, const char* fallback_string)
+ {
++#ifdef HAVE_ICONV
+   const size_t buffer_inc = 80;	// Increment buffer size in 80 bytes step
+   const char *charset;
+   iconv_t cd;
+@@ -93,6 +96,8 @@
+   if (dest_buffer != NULL)
+     free(dest_buffer);  		// free buffer
+   free(src_buffer);			// free string
++#endif
++
+   return strdup(fallback_string); 	// and return fallback string
+ }
+ 
diff --git a/meta-oe/recipes-support/hddtemp/files/hddtemp.db b/meta-oe/recipes-support/hddtemp/files/hddtemp.db
new file mode 100644
index 0000000..4a061cf
--- /dev/null
+++ b/meta-oe/recipes-support/hddtemp/files/hddtemp.db
@@ -0,0 +1,523 @@
+#
+# Insert a regular expression for support of the model or the serie of your hard drive.
+# If you don't know what to put in the second field, put the number
+# that appears most often for your brand :o)
+# A value of zero meens that we know that the drive doesn't have
+# a temperature sensor (you can set the unit to C or F).
+#
+############################################################################
+# The following list was found at (http://www.almico.com/forumharddisks.php)
+# If your drive is in the list send me a mail.
+#
+# Manufacturer	 Model	 Size	Notes
+# FUJITSU FUJITSU MPF3102AH 10.0GB
+# FUJITSU FUJITSU MPG3204AH E 20.0GB
+# FUJITSU FUJITSU MPG3307AT 30.0GB
+# FUJITSU FUJITSU MPG3409AH 40.0GB
+# FUJITSU FUJITSU MPG3409AH EF 40.0GB
+# HITACHI HITACHI_DK23CA-10 9.8GB
+# HITACHI HITACHI_DK23CA-15 14.7GB
+# SAMSUNG SAMSUNG SV3012H 29.4GB
+# SEAGATE ST310210A 10.0GB
+# SEAGATE ST310211A 9.8GB
+# SEAGATE ST310215A 10.0GB
+# SEAGATE ST315320A 14.9GB
+# SEAGATE ST320410A 19.6GB
+# SEAGATE ST320413A 19.6GB
+# SEAGATE ST320420A 19.9GB
+# SEAGATE ST330610A 29.3GB
+# SEAGATE ST330620A 29.3GB
+# SEAGATE ST330621A 29.3GB
+# SEAGATE ST330630A 29.9GB
+# SEAGATE ST340016A 39.1GB
+# SEAGATE ST340810ACE 39.1GB
+# SEAGATE ST380020ACE 78.2GB
+# WESTERN DIGITAL WDC AC210200D 10.0GB
+# WESTERN DIGITAL WDC AC29100D 8.9GB
+# WESTERN DIGITAL WDC AC420400D 19.9GB
+# WESTERN DIGITAL WDC WD102AA 10.0GB
+#
+#################################################
+
+########################################
+############# ExcelStor drives
+########################################
+# "ExcelStor Technology CT215"	  ??? ? "ExcelStor CT215"
+"ExcelStor Technology J3.0" 194 C "ExcelStor Technology 3xy (xy GB)"
+"ExcelStor Technology J6.0" 194 C "ExcelStor Technology 6xy (xy GB)"
+"ExcelStor Technology J680" 194 C "ExcelStor Technology J680 (80 GB)"
+"ExcelStor Technology J860" 194 C "ExcelStor Technology J860 (60 GB)"
+"ExcelStor Technology J880" 194 C "ExcelStor Technology J880 (80 GB)"
+
+
+
+########################################
+############# Fujitsu drives
+########################################
+"FUJITSU MHM2100AT"		0    C	"Fujitsu MHM2100AT"
+
+"FUJITSU MHN2150AT"		194  C	"Fujitsu MHN2150AT"
+"FUJITSU MHN2200AT"		194  C	"Fujitsu MHN2200AT"
+"FUJITSU MHN2300AT"		194  C	"Fujitsu MHN2300AT"
+
+"FUJITSU MHR2020AT"		194  C	"Fujitsu MHR2020AT"
+"FUJITSU MHR2030AT"		194  C	"Fujitsu MHR2030AT"
+
+"FUJITSU MHS2030AT"		194  C	"Fujitsu MHS2030AT"
+"FUJITSU MHS2040AT"		194  C	"Fujitsu MHS2040AT"
+"FUJITSU MHS2060AT"		194  C	"Fujitsu MHS2060AT (Apple PowerBook G4)"
+
+"FUJITSU MHT2030AC"		194  C	"Fujitsu Mobile 30GB, 2MB, 4200RPM (automotive)"
+
+"FUJITSU MHT2030AT"		194  C	"Fujitsu MHT2030AT"
+"FUJITSU MHT2040AH"		194  C	"Fujitsu MHT2040AH"
+"FUJITSU MHT2040AT"		194  C	"Fujitsu MHT2040AT"
+"FUJITSU MHT2060AH"		194  C	"Fujitsu MHT2060AH"
+"FUJITSU MHT2060AT"		194  C	"Fujitsu MHT2060AT"
+"FUJITSU MHT2080AH"		194  C	"Fujitsu MHT2080AH"
+
+"FUJITSU MHU2100AT"		194  C	"Fujitsu MHU2100AT 100GB, 8MB (4200RPM)"
+
+"FUJITSU MHV2100AH"		194  C	"FUJITSU MHV2100AH" 
+"FUJITSU MHV2100AT"		194  C	"FUJITSU MHV2100AT" 
+"FUJITSU MHV2080[AB]H"		194  C	"FUJITSU MHV2080AH"
+
+"FUJITSU MPF3204AH"		194  C	"Fujitsu MPF3204AH"
+
+"FUJITSU MPG3204AT.*"		194  C	"Fujitsu MPG3204AT"
+"FUJITSU MPG3307AT"		194  C	"Fujitsu MPG3307AT"
+"FUJITSU MPG3409AT.*"		194  C	"Fujitsu MPG3409AT E"
+"FUJITSU MPG3409AH.*"		194  C	"Fujitsu MPG3409AH E"
+"FUJITSU MPG3204AH"		194  C	"Fujitsu MPG3204AH"
+"FUJITSU MPG3102AT E"		194  C	"FUJITSU MPG3102AT E"
+
+
+
+########################################
+############# Hitachi drives
+########################################
+"HITACHI_DK13FA-40B"			194  C	"Hitachi DK13FA-40B"
+"HITACHI_DK228A-65"			0    C	"Hitachi DK228A-65"
+"HITACHI_DK23CA-(15|20|30|30B|75)"	194  C	"Hitachi DK23CA series"
+"HITACHI_DK23DA-[234]0"			194  C	"Hitachi DK23DA series"
+"HITACHI_DK23EA-[2346]0"		194  C	"Hitachi DK23EA series"
+"HITACHI_DK23EB-40"			194  C	"Hitachi DK23EB series"
+"HITACHI_DK23FA-[468]0"			194  C	"Hitachi DK23FA series"
+"HITACHI_DK23FB-[46]0"			194  C	"Hitachi DK23FB series"
+
+"HDS722516VLAT[28]0"		194  C	"Hitachi Deskstar 7K250 160GB 2/8MB cache"
+"HDS722525VLAT80"		194  C	"Hitachi Deskstar 7K250 200/250GB, 7200RPM, 8MB, Parallel-ATA"
+"HDS722512VLAT80"		194  C	"Hitachi Deskstar 7K250 80GB"
+"HDS722540VLAT20"		194  C	"Hitachi Deskstar 7K250, 40GB, 7200RPM, 2MB cache"
+"HDS722580VLAT20"		194  C	"Deskstar 7K250 60GB"
+"HDS724040KLSA80"		194  C	"Hitachi Deskstar 7K250 400GB, 7200RPM, 8MB, Serial-ATA"
+"HDS728080PLAT20"		194  C	"Hitachi Deskstar 7K80 80GB"
+
+"HDS722525VLSA80"		194  C	"Hitachi Deskstar 7K250 250GB, 7200RPM, 8MB, SATA"
+"HDS722516VLSA80"               194  C  "Hitachi Deskstar 7K250 160GB 8Mo cache SATA"
+"HDS722580VLSA80"		194  C	"Hitachi Deskstar 7K250 80GB SATA"
+"HDS728040PLAT20"		194  C	"Hitachi Deskstar 7K80 40GB"
+
+"HDS724040KLAT80"               194  C  "Hitachi Deskstar 7K400  400GB 8Mo cache PATA"
+
+"HDT7225(16|25)DLAT80"		194  C	"Hitachi Deskstar T7K250 series, 7200RPM, 8MB, PATA"
+"HDT722516DLA380 V43O"		194  C	"Hitachi T7K250 SATA"
+"HDT722525DLA380"               194  C  "Hitachi Deskstar T7K250 250GB 8Mo cache SATAII"
+"HDT725050VLA360"               194  C  "Hitachi Deskstar T7K500 500GB, 7200RPM, 16MB, SATA II"
+
+"HTE721010G9AT00"		194  C	"Hitachi Travelstar 100GB (7200RPM)"
+"HTE726060M9AT00"		194  C	"Hitachi Travelstar 60GB (7200RPM)"
+"HTS424030M9AT00"		194  C	"Hitachi Travelstar 30GB (4200RPM)"
+"HTS424040M9AT00"		194  C	"Hitachi Travelstar 4K40 40GB 2MB cache (4200RPM)"
+"HTS541010G9SA00"		194  C  "Hitachi Travelstar 100GB SATA"
+"HTS541040G9AT00"		194  C	"Hitachi Travelstar 40GB (5400RPM)"
+"HTS541080G9AT00"		194  C	"Hitachi Travelstar 80GB (5400RPM)"
+"HTS548020M9AT00"		194  C	"Hitachi Travelstar 20GB (5400RPM)"
+"HTS548030M9AT00"		194  C	"Hitachi Travelstar 30GB (5400RPM)"
+"HTS548040M9AT00"		194  C	"Hitachi Travelstar 40GB (5400RPM)"
+"HTS548060M9AT00"		194  C	"Hitachi Travelstar 60GB (5400RPM)"
+"HTS548080M9AT00"		194  C	"Hitachi Travelstar 80GB (5400RPM)"
+"HTS721080G9AT00"		194  C	"Hitachi Travelstar 7K100 80GB (7200RPM)"
+"HTS726060M9AT00"		194  C	"Hitachi Travelstar 60GB"
+
+
+########################################
+############# IBM drives
+########################################
+
+# DJSA serie is using F0h command to report temperature and also have
+# SMART capabilties but it was reported not to work.
+# "DJSA-2(30|32|10|20|05)"	0    C	"IBM Travelstar 20GN, 32GH, 30GT series"
+
+"IBM-DARA-212000"		0    C	"IBM Travelstar 12GN"
+"IBM-DTTA-35*"			0    C	"IBM Deskstar 16GP serie"
+
+# according to specifications they do not seems to have sensor
+# but I prefer waiting for a report
+#"IBM-DTTA-37*"			0    C	"IBM Deskstar 14GXP serie"
+
+"IBM-DJNA-35.*"			231  C	"IBM Deskstar 25 GP serie"
+"IBM-DJNA-37.*"			231  C	"IBM Deskstar 22 GXP serie"
+"IBM-DHEA-(34330|36480)"	0    C	"IBM Deskstar 5 serie"
+"IBM-DHEA-(34331|36481|38451)"	0    C	"IBM Deskstar 8 serie"
+"IBM-DPTA-37.*"			231  C	"IBM Deskstar 34GXP serie"
+"IBM-DPTA-35.*"			231  C	"IBM Deskstar 37GP serie"
+"IBM-DTLA-30[57]0[123467][05]"	194  C	"IBM Deskstar 40GV & 75GXP series"
+"IC25N0[1234]0ATCS04-0"		194  C	"IBM Travelstar 40GN serie"
+"IC25N0[24]0ATC[SX]05-0"	194  C	"IBM Travelstar 40GNX serie"
+"IC25N0(10|15|20|30)ATDA04-0"	194  C	"IBM Travelstar 30GN serie"
+"IC25N0[23468]0ATMR04*"		194  C	"Hitachi Travelstar 80GN"
+"IC25T048ATDA05-0"		194  C	"IBM Travelstar 48GH serie"
+"IC25T060ATC[SX]05-0"		194  C	"IBM Travelstar 60GH serie"
+"IC35L0[12346]0AVER07"		194  C	"IBM Deskstar 60GXP serie"
+"IC35L[01][02468]0AVV[AN]07*"	194  C	"IBM Deskstar 120GXP serie"  
+"IC35L[01][23689]0AVV207*"	194  C	"IBM Deskstar 180GXP serie"
+
+########################################
+############# Maxtor drives
+########################################
+#"Maxtor 2B0[012][04568]H1"				???  C	"Maxtor Fireball 541DX"
+"Maxtor 2F0[234]0[LJ]0"					194  C	"Maxtor Fireball 3" 
+# which one must I trust ?
+#"Maxtor 4D040H2"					9    C	"Maxtor DiamondMax D540X-4D"
+#"Maxtor 4D040H2"					0    C	"Maxtor 4D040H2"
+#"Maxtor 4D080H4"					12   C	"Maxtor DiamondMax D540X-4D"
+#"Maxtor 4D060H3"					12   C	"Maxtor DiamondMax D540X-4D"
+#"Maxtor 4D080H4"					9    C	"Maxtor DiamondMax D540X-4D"
+"MAXTOR 4K0[468]0H[234]"				194  C	"Maxtor DiamondMax D540X serie"
+"MAXTOR 4K020H1"					194  C	"Maxtor 4K020H1"
+"Maxtor 4A300J0"                                        194  C  "Maxtor MaxLine II 300GB 5400RPM"
+"Maxtor 4[RA](25|16|12|08|06)0[LJ]0"			194  C	"Maxtor DiamondMax 16"
+"Maxtor 5(1024|1369|2049|2732|3073|4098)U(2|3|4|6|8)"	0    C	"Maxtor DiamondMax Plus 40"
+"Maxtor 5A250J0"					194  C	"Maxtor MaXline II 250GB 5400RPM"
+"Maxtor 5A300J0"					194  C	"Maxtor 5A300J0"
+"Maxtor 5T0[24]0H[24]"					0    C	"Maxtor DiamondMax Plus 60"
+"Maxtor 6E0[234]0L0"					194  C	"Maxtor DiamondMax Plus 8"
+"MAXTOR 6L0[2468]0[LJ][1234]"				194  C	"Maxtor DiamondMax Plus D740X family"
+"Maxtor 6V320F0"					194  C  "Maxtor Diamond Max 10 SATA II 320 GB"
+"Maxtor 6Y(06|08|12|16|20|25)0[LPM]0"			194  C	"Maxtor DiamondMax Plus 9" 
+"Maxtor 7L300[RS]0"					194  C  "Maxtor 7L300R0 MaxLine+III 300GB 7200rpm"
+"Maxtor 7Y250[PM]0"					194  C	"Maxtor MaXLine Plus II 250GB 7200RPM"
+"Maxtor 94098U8"					11   C	"Maxtor DiamondMax 40 94098U8"
+
+#"Maxtor 6(B|L)(08|12|16|20|25|30)0[RSPM]0"		194  C	"Maxtor DiamondMax Plus 10"
+"Maxtor 6B080M0"					194  C  "Maxtor DiamondMax 10 80GB 8MB SATA"
+"Maxtor 6B120M0"					194  C  "Maxtor DiamondMax 10 120GB 8MB SATA"
+"Maxtor 6B160M0"					194  C  "Maxtor DiamondMax 10 160GB 8MB SATA"
+"Maxtor 6B160P0"					194  C  "Maxtor DiamondMax 10 160GB 8MB ATA/133"
+"Maxtor 6B200M0"					194  C  "Maxtor DiamondMax 10 200GB 8MB SATA"
+"Maxtor 6B200P0"					194  C  "Maxtor DiamondMax 10 200GB 8MB ATA/133"
+"Maxtor 6B250R0"					194  C  "Maxtor DiamondMax 10 250GB 16MB ATA/133"
+"Maxtor 6B250S0"					194  C  "Maxtor DiamondMax 10 250GB 16MB SATA"
+"Maxtor 6B300R0"					194  C  "Maxtor DiamondMax 10 300GB 16MB ATA/133"
+"Maxtor 6B300S0"					194  C  "Maxtor DiamondMax 10 300GB 16MB SATA"
+"Maxtor 6L080L0"					194  C  "Maxtor DiamondMax 10 80GB 2MB ATA/133 RoHS"
+"Maxtor 6L080M0"					194  C  "Maxtor DiamondMax 10 80GB 8MB SATA RoHS"
+"Maxtor 6L080P0"					194  C  "Maxtor DiamondMax 10 80GB 8MB ATA/133 RoHS"
+"Maxtor 6L120M0"					194  C  "Maxtor DiamondMax 10 120GB 8MB SATA RoHS"
+"Maxtor 6L120P0"					194  C  "Maxtor DiamondMax 10 120GB 8MB ATA/133 RoHS"
+"Maxtor 6L160M0"					194  C  "Maxtor DiamondMax 10 160GB 8MB SATA RoHS"
+"Maxtor 6L160P0"					194  C  "Maxtor DiamondMax 10 160GB 8MB ATA/133 RoHS"
+"Maxtor 6L200M0"					194  C  "Maxtor DiamondMax 10 200GB 8MB SATA RoHS"
+"Maxtor 6L200P0"					194  C  "Maxtor DiamondMax 10 200GB 8MB ATA/133 RoHS"
+"Maxtor 6L250R0"					194  C  "Maxtor DiamondMax 10 250GB 16MB ATA/133 RoHS"
+"Maxtor 6L250S0"					194  C  "Maxtor DiamondMax 10 250GB 16MB SATA RoHS"
+"Maxtor 6L300R0"					194  C  "Maxtor DiamondMax 10 300GB 16MB ATA/133 RoHS"
+"Maxtor 6L300S0"					194  C  "Maxtor DiamondMax 10 300GB 16MB SATA RoHS"
+"Maxtor 6V080E0"					194  C  "Maxtor DiamondMax 10 80GB 8MB SATAII RoHS"
+"Maxtor 6V160E0"					194  C  "Maxtor DiamondMax 10 160GB 8MB SATAII RoHS"
+"Maxtor 6V200E0"					194  C  "Maxtor DiamondMax 10 200GB 8MB SATAII RoHS"
+"Maxtor 6V250F0"					194  C  "Maxtor DiamondMax 10 250GB 16MB SATAII RoHS"
+"Maxtor 6V300F0"					194  C  "Maxtor DiamondMax 10 300GB 16MB SATAII RoHS"
+
+
+
+########################################
+############# Quantum drives
+########################################
+"QUANTUM FIREBALLP AS40.0"		0  C  "Quantum Fireball AS40"
+"QUANTUM FIREBALL CX10.2A"		0  C  "Quantum Fireball CX10.2A"
+#"QUANTUM FIREBALLlct10 20"		4  C  "Quantum Fireball CT10 20GB"
+# I suspect the QUANTUM FIREBALL_TM2110A to have a sensor in field 9...
+# "QUANTUM FIREBALL_TM2110A"		9  C  "Quantum Fireball TM2110A"
+
+
+
+########################################
+############# Samsung drives
+########################################
+# somenone reported a problem with the SP8004H which reports a temperature
+# 10∞C below the ambient temperature
+"SAMSUNG HA(200|250)JC"					194  C	"Samsung SpinPoint V120CE series"
+"SAMSUNG HD160JJ"                                       194  C  "Samsung 160GB, 7200RPM, 8MB cache, SATA" 
+"SAMSUNG HD160JJ/P"					194  C	"Samsung SpinPoint P80 SD 160GB (7200RPM, 8MB cache)"
+"SAMSUNG HD[30|32|40][01]L[DJ]"                         194  C  "Samsung SpinPoint T133 series (300-400MB)"
+"SAMSUNG HD250KD"                                       194  C  "Samsung SpinPoint T133 series (250 MB PATA)"
+"SAMSUNG HD321KJ"					194  C  "Samsung Spinpoint T166 (7200RPM, 16MB cache) - SATA"
+"SAMSUNG HD501LJ"					194  C  "Samsung HD501LJ"
+"SAMSUNG MP0(302|402|603|804)H"				194  C	"Samsung SpinPoint M40 2.5inch"
+"SAMSUNG SW0434A"					0    C	"Samsung SW0434A"
+"SAMSUNG SP(2001|4002|6003|8004|40A2)H"			194  C	"Samsung SpinPoint P40 serie"
+"SAMSUNG SP(0612|0802|1203|1604|0812|1213|1614)N"	194  C	"Samsung SpinPoint P80 serie"
+"SAMSUNG SP(0612|0802|1203|1604|0812|1213|1614)C"	194  C	"Samsung SpinPoint P80 series - SATA"
+"SAMSUNG SP0411N"					194  C	"Samsung SpinPoint PL40 serie"
+"SAMSUNG SP0822N"					194  C	"Samsung SP0822N"
+"SAMSUNG SP(0812|1213|1614)C"				194  C	"Samsung Spinpoint 160G SATA"
+"SAMSUNG SP2[05]14N"					194  C	"Samsung SpinPoint P120 series (7200RPM, 8MB cache)"
+"SAMSUNG SP2[05]04C"					194  C	"Samsung SpinPoint P120 series - SATA"
+"SAMSUNG SV0432A"					0    C	"Samsung SV0432A"
+"SAMSUNG SV3002H"					0    C	"Samsung SpinPoint V30 serie"
+"SAMSUNG SV(2001|4002|4012|6003|8004)H"			194  C	"Samsung SpinPoint V40 serie"
+#"SAMSUNG SV(0221|0602|0813|1204)H"			9    C	"Samsung SpinPoint V60 serie"
+#"SAMSUNG SV1204H"					194  C	"Samsung 120G"
+"SAMSUNG SV(0401|0802|1203|1604)N"			194  C	"Samsung SpinPoint V80 serie"
+"SAMSUNG SV4012H"					194  C	"Samsung 40GB, 5400RPM, 2MB cache"
+
+########################################
+############# Seagate drives
+########################################
+"Seagate Technology 1275MB - ST31276A"	0    C	"Seagate ST31276A"
+"ST3412A"				0    C	"Seagate ST3412A"
+"ST38641A"				0    C	"Seagate ST38641A"
+"ST310014A"				194  C	"Seagate ST310014A"
+"ST310210A"				0    C	"Seagate ST310210A"
+"ST310211A"				194  C	"Seagate ST310211A"
+"ST310220A"				0    C	"Seagate ST310220A"
+# SEAGATE ST313021A 13.0GB
+"ST313021A"				0    C	"Seagate U8 ST313021A"
+"ST310240A"				0    C	"Seagate Medalist 10240 Ultra ATA-3"
+"ST315320A"				194  C	"Seagate ST315320A"
+"ST320423A"				0    C	"Seagate U10 20423, Ultra ATA/66"
+"ST320011A"				194  C	"Seagate ST320011A"
+"ST320014A"				194  C	"Seagate ST320014A (5400 rpm, 20Gb)"
+"ST320410A"				194  C	"Seagate ST320410A"
+"ST320413A"				194  C	"Seagate ST320413A"
+"ST320414A"				194  C	"Seagate ST320414A"
+"ST320420A"				194  C	"Seagate Barracuda II ST320420A"
+"ST330013A"				194  C	"Seagate ST330013A Barracuda ATA V 30GB, 7200 rpm"
+"ST330620A"				194  C	"Seagate ST330620A"
+"ST330621A"				194  C	"Seagate ST330621A"
+"ST330630A"				194  C	"Seagate Barracuda ST330630A"
+"ST340014A"				194  C	"Seagate Barracuda 7200.7 40Gb"
+"ST340015A"				194  C	"Seagate Barracuda 5400.1 40GB" 
+"ST340016A"				194  C	"Seagate ST340016A"
+"ST340810A"				194  C	"Seagate U Series 40810 (40Gb, Ultra ATA/100, 5400 rpm)"
+"ST340823A"				194  C	"Seagate U Series 5 40823"
+"ST340824A"				194  C	"Seagate Barracuda III"
+"ST360015A"				194  C	"Seagate Barracuda V ST360015A"
+"ST360020A"				194  C	"Seagate U Series 60020"
+"ST360021A"				194  C	"Seagate Barracuda IV ST360021A"
+"ST380011A"				194  C	"Seagate Barracuda 7200.7 80GB"
+"ST380012A"				194  C	"Seagate ST380012A 80GB"
+"ST380013A"				194  C	"Seagate Barracuda 7200.7 80GB" 
+"ST380013AS"				194  C	"Seagate Barracuda 7200.7 80GB (Serial ATA)"
+"ST380020A"				194  C	"Seagate U Series 80020 (80Gb, Ultra ATA/100, 5400 rpm)"
+"ST380021A"				194  C	"Seagate Barracuda IV ST380021A"
+"ST380022A"				194  C	"Seagate Barracuda U7 80022, Ultra ATA/100"
+"ST380023A"				194  C	"Seagate Barracuda V ST380023A"
+"ST380817AS"				194  C	"Seagate Barracuda 7200.7 80GB - SATA"
+"ST39111A"				194  C	"Seagate ST39111A (from Sun Ultra)"
+"ST3120020A"				194  C	"Seagate ST3120020A"
+"ST3120022A"				194  C	"Seagate Baraccuda 7200.7 120GB"
+"ST3120023A"				194  C	"Seagate Barracuda V ST3120023A"
+"ST3120024A"				194  C	"Seagate Barracuda V ST3120024A"
+"ST3120025ACE"				194  C	"Seagate Barracuda V ST3120025ACE"
+"ST3120026A"				194  C	"Seagate Barracuda V ST3120026A"
+"ST3160021A"				194  C	"Seagate Barracuda 7200.7 - ST3160021A"
+"ST3160023(A|AS)"			194  C	"Seagate Barracuda V ST3160023A and AS (160Gb, ATA100 or Serial ATA)"
+"ST3160827AS"				194  C	"Seagate Barracuda 7200.7 160GB (Serial ATA)" 
+"ST3200021A"				194  C	"Seagate Barracuda 7200.7 Plus 200GB"
+"ST3200822(A|AS)"			194  C	"Seagate Barracuda 7200.7 Plus 200GB (PATA or SATA)"
+"ST3200826A"				194  C	"Seagate Barracuda 7200.8 200Gb"
+"ST3250623A"				194  C	"Seagate Barracuda 7200.16 250GB"
+"ST3250823A"				194  C	"Seagate Barracuda 7200.8 250GB"
+"ST3250823A"				194  C	"Seagate Barracuda 7200.7 Plus 250GB"
+"ST3250823NS"				194  C	"Seagate NL35 SATA (RAID-Edition) 7200 250GB"
+"ST3300831A"				194  C	"Seagate 300GB ST3300831A"
+"ST3400832A"				194  C	"Seagate Barracuda 7200.8 Plus 400GB"
+"ST3400633(A|AS)"                       194  C  "Seagate Barracuda 7200.7 400 GB"
+"ST3500630NS"				194  C  "Seagate"
+"ST3400632NS"				194  C	"Seagate"
+"ST3320620AS"                           194  C  "Seagate Barracuda 7200.7 320 GB"
+"ST3500630AS"                           194  C  "Seagate Barracuda 7200.7 500 GB"
+"ST3802110A"				194  C	"Seagate Barracuda 7200.9 80 GB"
+"ST910021A"				194  C	"Seagate Momentus 7200.1 100GB" 
+"ST910082[35]A"				194  C	"Seagate Momentus 5400.2 100GB"
+"ST9120821A"				194  C	"Seagate Momentus 5400.2 120GB"
+"ST94019A"				194  C	"Seagate ST94019A"
+"ST94813A"				194  C	"Seagate Momentus 5400.2 40GB"
+"ST94[08]11A"				194  C	"Seagate ST94011A"
+"ST960821A"				194  C	"Seagate ST960821A"
+"ST960822A"				194  C	"Seagate Momentus 5400.2 60GB"
+"ST96812AS"				194  C	"Seagate Momentus 5400.2 60GB SATA"
+"ST9808211A"				194  C	"Seagate Momentus 5400.2 80GB"
+
+########################################
+############# TOSHIBA Laptops
+########################################
+"MK4313MAT"				220  C	"Toshiba MK4313MAT"
+"TOSHIBA MK1032GAX"			194  C	"Toshiba MK1032GAX"
+"TOSHIBA MK1517GAP"			0    C	"Toshiba MK1517GAP"
+"TOSHIBA MK2018GAS"			226  F	"Toshiba MK2018GAS"
+"TOSHIBA MK2023GAS"			194  C	"Toshiba MK2023GAS"
+
+"TOSHIBA MK3017GAP"			0    C	"Toshiba MK3017GAP"
+"TOSHIBA MK3021GAS"			194  C	"Toshiba MK3021GAS"
+"TOSHIBA MK3025GAS"			194  C	"Toshiba MK3025GAS" 
+
+#"TOSHIBA MK4019GAX"			222  C	"Toshiba MK4019GAX"
+"TOSHIBA MK4021GAS"			194  C	"Toshiba MK4021GAS"
+"TOSHIBA MK4025GAS"			194  C	"Toshiba MK4025GAS 40 Go"
+"TOSHIBA MK4026GAS"			194  C	"Toshiba MK4026GAS 40 Go"
+"TOSHIBA MK4032GAX"			194  C	"Toshiba MK4032GAX" 
+
+"TOSHIBA MK6021GAS"			194  C	"Toshiba MK6021GAS"
+"TOSHIBA MK6022GAX"			194  C	"Toshiba MK6022GAX"
+"TOSHIBA MK6025GAS"			194  C	"Toshiba MK6025GAS"
+"TOSHIBA MK6026GAX"			194  C	"Toshiba MK6026GAX" 
+"TOSHIBA MK8025GAS"			194  C	"Toshiba MK8025GAS"
+"TOSHIBA MK8026GAX"			194  C	"Toshiba MK8026GAX" 
+
+"MK4025GAS"				194  C	"Toshiba MK4025GAS"
+
+
+########################################
+############# Western Digital drives
+########################################
+# WDC AC310100B and WDC AC2850F are reported not working
+# no more informations were given
+"WDC AC22000L"							  0 C "Western Digital Caviar AC22000"
+"WDC AC420400D"							231 C "Western Digital Caviar AC420400D"
+"WDC AC418000D"							231 C "Western Digital AC418000D"
+"WDC WD135BA"							231 C "Western Digital WD135BA"
+
+"WDC WD100EB-00BHF0"						  0 C "Western Digital 100EB-00BHF0"
+"WDC WD200BB-00AUA1"						  0 C "Western Digital Caviar WD200BB"
+#"WDC WD200BB-60DGA0"						  0 C "Western Digital Caviar WD200BB"
+"WDC WD300BB-00CAA0"						  0 C "Western Digital WD300BB"
+"WDC WD360GD-00FNA0"						194 C "Western Digital SATA Raptor 36.7GB"
+"WDC WD400BB-00CAA0"						  0 C "Western Digital 400BB-00CAA0"
+"WDC WD400BB-00J[KH]A0"						194 C "Western Digital Caviar WD400BB"
+"WDC WD400BB-23JHC0"						194 C "Western Digital 23JHC0"
+#"WDC WD400BB-00GFA0"						  0 C ""
+"WDC WD400BB-55HEA0"						194 C "Western Digital Caviar WD400BB"
+"WDC WD400BB-(18CA|00DE)A0"					  0 C "Western Digital Caviar WD400BB"
+"WDC WD400BB-75FJA1"						194 C "Western Digital Caviar WD400BB"
+"WDC WD400EB-00CPF0"						  0 C "Western Digital 400EB-00CPF0"
+"WDC WD400JB-00(JJ|FM|FS)A0"					194 C "Western Digital Caviar 40GB Special Edition 8MB"
+"WDC WD400JB-00ETA0"						194 C "Western Digital 400JB-00ETA0"
+"WDC WD400JB-00JJC0"						194 C "Western Digital 400JB-00JJC0 40GB"
+"WDC WD400LB-00DNA0"						194 C "Western Digital 400LB-00DNA0"
+"WDC WD400UE-22HCT0"						194 C "Western Digital 40GB Notebook HDD"
+"WDC WD400VE-75HDT1"						194 C "Western Digital Scorpio 40GB"
+"WDC WD600BB-32BSA0"						  0 C "Western Digital 600BB-32BSA0"
+"WDC WD600JB-00ETA0"						194 C "Western Digital 600JB-00ETA0"
+"WDC WD600LB-00DNA0"						194 C "Western Digital 60GB"
+"WDC WD600VE-75HDT0"						194 C "Western Digital 600VE-75HDT0"
+"WDC WD600VE-00HDT0"						194 C "Western Digital 600VE-00HDT0"
+"WDC WD740GD-00FL21.0"						194 C "Western Digital SATA Raptor"
+"WDC WD740GD-([05]0FL[AC]0|75FLA1)"				194 C "Western Digital SATA Raptor 74GB 8MB"
+"WDC WD800BB-00CAA1"						  0 C "Western Digital WD800BB-00CAA1"
+"WDC WD800BB-(00|22)DKA0"					194 C "Western Digital WD800BB 80 Go"
+"WDC WD800BB-32CCB0"						194 C "Western Digital 800BB-32CCB0"
+"WDC WD800BB-55HEA0"						194 C "Western Digital 800BB-55HEA0"
+"WDC WD800BB-00JHA0"						194 C "Western Digital 800BB-00JHA0" 
+"WDC WD800BB-00JKA0"						194 C "Western Digital 800BB-00JKA0" 
+"WDC WD800BB-55JKA0"						194 C "Western Digital 800BB-55JKA0" 
+"WDC WD800BB-75FRA0"						194 C "Western Digital Caviar WD800BB"				
+"WDC WD800JB-00CRA1"						  0 C "Western Digital Caviar WD800JB"
+"WDC WD800JB-00(ET|FM|FS)A0"					194 C "Western Digital Caviar 80GB Special Edition 8MB"
+"WDC WD800JB-00JJ[AC]0"						194 C "Western Digital WD800JB"
+"WDC WD800JD-(00|55)(HK|JR)A0"					194 C "Western Digital SATA 80GB, 8MB Cache"
+"WDC WD800JD-00(HK|JN)A0"					194 C "Western Digital SATA 80GB, 8MB Cache"
+"WDC WD800LB-(00|55)DNA0"					194 C "Western Digital Caviar WD800LB 80 Go ATA-100"
+"WDC WD800VE-07HDT0"						194 C "Western Digital 800VE-07HDT0"
+"WDC WD1200BB-00(FTA|GUA)0"					194 C "Western Digital Caviar EIDE 2MB Cache"
+"WDC WD1200JB-00(EV|FU|GV)A0"					194 C "Western Digital Caviar 120GB Special Edition 8MB" 
+"WDC WD1200JB-22GVA0"						194 C "Western Digital Caviar 120GB"
+"WDC WD1200JD-00(GBB|HBC)0"					194 C "Western Digital WD1200JD"
+"WDC WD1200LB-55EDA0"						194 C "Western Digital WD1220LB"
+"WDC WD1200SB-01KB[AC]0"					194 C "Western Digital Caviar RE (Raid Edition) 120 GB"
+"WDC WD1600BB-00DWA0"						194 C "Western Digital Caviar WD1600BB"
+"WDC WD1600JB-(00EV|00FU|00GV|22GV|75GV)A0"			194 C "Western Digital Caviar 160GB Special Edition 8MB"
+"WDC WD2000BB-00FTA0"						194 C "Western Digital WD2000BB"
+"WDC WD2000JB-(00EV|32EV|34EV|00FU|00GV|55GV|98GV|00KF)A0"	194 C "Western Digital Caviar 200GB Special Edition 8MB"
+"WDC WD2000JB-00GVC0"						194 C "Western Digital WD2000JB"
+"WDC WD2000JS-00MHB1"						194 C "Western Digital SATA 200GB"
+"WDC WD2500JB-(00RE|00EV|00FU|32FU|00GV|55GV)A0"		194 C "Western Digital Caviar 250GB Special Edition 8MB"
+"WDC WD2500JB-00GVC0"						194 C "Western Digital 250GB"
+"WDC WD2500JD-(00G|32H)BB0"					194 C "Western Digital SATA Caviar 250GB Special Edition 8MB"
+"WDC WD2500JD-40HBC0"						194 C "Western Digital WD2500JD-40HBC0" 
+"WDC WD2500PB-98FBA0"						194 C "Western Digital Caviar 250GB Special Edition 8MB"
+"WDC WD2500PD-00FZB1"						194 C "Western Digital WD2500PD-00FZB1" 
+"WDC WD2500SD-01KCB0"						194 C "Western Digital Caviar RE 250GB 8MB"
+"WDC WD3000JB-00KFA0"						194 C "Western Digital WD3000JB"
+"WDC WD3200JB-00KFA0"						194 C "Western Digital Caviar 320GB 8MB"
+"WDC WD4000KD-00NAB0"						194 C "Western Digital Caviar SE16 400GB 16MB"
+"WDC WD4000YR-01PLB0"						194 C "Western Digital Caviar RE2 400GB 16MB"
+"WD4000YS-01MPB0"						194  C  "Western Digital RE2 7200 SATA II 400 GB"
+
+# not sure for next
+# "WDC WD1200JB-00CRA1"		9   C "Western Digital 1200JB-00CRA1"
+# "WDC WD273BA"			9   C "Western Digital WD273BA"
+
+
+
+
+########################################################################################################################
+########################################################################################################################
+########################################################################################################################
+########################################################################################################################
+########################################################################################################################
+########################################################################################################################
+########################################################################################################################
+########################################################################################################################
+########################################################################################################################
+########################################################################################################################
+########################################################################################################################
+########################################################################################################################
+########################################################################################################################
+########################################################################################################################
+
+"ST3750640AS"                           194    C  "Seagate Barracuda 7200.10 SATA 750GB"
+"ST3750840AS"                           194    C  "Seagate Barracuda 7200.10 SATA 750GB"
+"ST3500630AS"                           194    C  "Seagate Barracuda 7200.10 SATA 500GB"
+"ST3500830AS"                           194    C  "Seagate Barracuda 7200.10 SATA 500GB"
+"ST3400620AS"                           194    C  "Seagate Barracuda 7200.10 SATA 400GB"
+"ST3400620A"                            194    C  "Seagate Barracuda 7200.10 400GB"
+"ST3400820AS"                           194    C  "Seagate Barracuda 7200.10 SATA 400GB"
+"ST3320620AS"                           194    C  "Seagate Barracuda 7200.10 SATA 320GB"
+"ST3320820AS"                           194    C  "Seagate Barracuda 7200.10 SATA 320GB"
+"ST3300620AS"                           194    C  "Seagate Barracuda 7200.10 SATA 300GB"
+"ST3300820AS"                           194    C  "Seagate Barracuda 7200.10 SATA 300GB"
+"ST3250620AS"                           194    C  "Seagate Barracuda 7200.10 SATA 250GB"
+"ST3250820AS"                           194    C  "Seagate Barracuda 7200.10 SATA 250GB"
+"ST3250410AS"                           194    C  "Seagate Barracuda 7200.10 SATA 250GB"
+"ST3250310AS"                           194    C  "Seagate Barracuda 7200.10 SATA 250GB"
+"ST3200820AS"                           194    C  "Seagate Barracuda 7200.10 SATA 200GB"
+"ST3160815AS"                           194    C  "Seagate Barracuda 7200.10 SATA 160GB"
+"ST3160215AS"                           194    C  "Seagate Barracuda 7200.10 SATA 160GB"
+"ST3120815AS"                           194    C  "Seagate Barracuda 7200.10 SATA 120GB"
+"ST3120215AS"                           194    C  "Seagate Barracuda 7200.10 SATA 120GB"
+"ST380815AS"                            194    C  "Seagate Barracuda 7200.10 SATA 80GB"
+"ST380215AS"                            194    C  "Seagate Barracuda 7200.10 SATA 80GB"
+"ST340815AS"                            194    C  "Seagate Barracuda 7200.10 SATA 40GB"
+"ST340215AS"                            194    C  "Seagate Barracuda 7200.10 SATA 40GB"
+"ST3300622AS"				194  C  "Seagate Barracuda 7200.9 SATA2.5 300GB"
+"ST3300831A"				194  C	"Seagate Barracuda 7200.8 PATA 300GB"
+
+"Maxtor 7(L|V)250(F|R|S)0"		194 C "Maxtor MaXLine III 250GB 7200rpm"
+"Maxtor 7(L|V)300(F|R|S)0"		194 C "Maxtor MaXLine III 300GB 7200rpm"
+"MAXTOR STM3320620AS"			194 C ""
+
+"WDC WD1500ADFD-00NLR1"                                         194 C "Western Digital Raptor 150GB"
+"WDC WD1600JS-00NCB1"						194 C "Western Digital Caviar 1600JS 160GB Sata"
+"WDC WD1600SD-01KCC0"						194 C "Western Digital Caviar RE Serial ATA series"
+"WDC WD2500JD-57HBC0"                                           194 C "Western Digital Caviar SE (Serial ATA) 250 GB"
+"WDC WD2500JS"							194 C "Western Digital WD2500JS"
+"WDC WD2500JS-41MVB1"						194 C "Western Digital SATAII Caviar 250GB Special Edition 8MB"
+"WDC WD2500JD-00HBB0"						194 C   "Western Digital SATA 250GB" 
+"WDC WD2500KS-00MJB0"						194 C "Western Digital SATA-II Caviar 250GB Special Edition 16MB"
+"WDC WD3000JS-00PDB0"						194 C "Western Digital WD3000JS"
+"WDC WD3200KS-00PFB0"						194 C	""
+"WDC WD3200JD-22KLB0"                                           194 C "Western Digital Caviar SE 320GB 8MB" 
diff --git a/meta-oe/recipes-support/hddtemp/files/hddtemp_0.3-beta15-52.diff b/meta-oe/recipes-support/hddtemp/files/hddtemp_0.3-beta15-52.diff
new file mode 100644
index 0000000..f61c164
--- /dev/null
+++ b/meta-oe/recipes-support/hddtemp/files/hddtemp_0.3-beta15-52.diff
@@ -0,0 +1,2256 @@
+Megapatch from debian
+
+Original URL: http://ftp.debian.org/debian/pool/main/h/hddtemp/hddtemp_0.3-beta15-52.diff.gz
+
+Filtered with:
+  filterdiff -p1 -x README -x 'debian/*'
+
+
+Upstream-Status: unmaintained
+
+--- hddtemp-0.3-beta15.orig/doc/hddtemp.8
++++ hddtemp-0.3-beta15/doc/hddtemp.8
+@@ -58,6 +58,10 @@
+ .B \-f, \-\-file=\fIfile\fI
+ Specify the database file to use.
+ .TP
++.B \-F, \-\-foreground
++Don't fork into the background even in daemon mode.  This is useful
++when running under a process supervisor.
++.TP
+ .B \-l, \-\-listen=\fIaddr\fR
+ Listen on a specific address.  \fIaddr\fR is a string containing a
+ host name or a numeric host address string.  The numeric host address
+@@ -80,6 +84,9 @@
+ .B \-q, \-\-quiet
+ Don't check if the drive is supported.
+ .TP
++.B \-u, \-\-unit=\fIC|F\fR
++Force output temperature either in Celsius or Fahrenheit.
++.TP
+ .B \-v, \-\-version
+ Display hddtemp version number.
+ .TP
+@@ -96,7 +103,7 @@
+ .SH "DRIVE DATABASE"
+ If you know your drive has a temperature sensor but it is being
+ reported unsupported, tell me which model and which manufacturer it
+-is, and/or just add a new entry in /usr/share/misc/hddtemp.db.  Each
++is, and/or just add a new entry in /etc/hddtemp.db.  Each
+ line of hddtemp.db is either a comment, a blank line or a line
+ containing:
+ .TP
+@@ -112,7 +119,7 @@
+ Feedback is welcome (see the REPORT section below).
+ 
+ .SH "TCP/IP DAEMON MODE"
+-Exemple of type forcing:
++Example of type forcing:
+ .PP
+ # hddtemp SATA:/dev/sda PATA:/dev/hda
+ .PP
+@@ -120,7 +127,7 @@
+ .B hddtemp
+ in daemon mode, start it like this:
+ .PP
+-# hddtemp -d /dev/hd[abcd]
++# hddtemp \-d /dev/hd[abcd]
+ .PP
+ .PP
+ and use
+@@ -165,8 +172,8 @@
+ investigation they do not.  But fields 194 (which is the standard
+ field for temperature) and 231 are good candidates.
+ .PP
+-Then, you can send me a report with outputs from `hddtemp --debug ...',
+-`smartctl' or `hdparm -i ...', and/or add an entry in hddtemp.db
++Then, you can send me a report with outputs from `hddtemp \-\-debug ...',
++`smartctl' or `hdparm \-i ...', and/or add an entry in hddtemp.db
+ yourself.
+ 
+ .SH "BUGS"
+@@ -183,5 +190,5 @@
+ .PP
+ Emmanuel Varagnat (hddtemp@guzu.net).
+ .PP
+-This manual page was originaly written by Aurelien Jarno <aurel32@debian.org>,
++This manual page was originally written by Aurelien Jarno <aurel32@debian.org>,
+ for the Debian GNU/Linux system (but may be used by others).
+--- hddtemp-0.3-beta15.orig/po/fr.po
++++ hddtemp-0.3-beta15/po/fr.po
+@@ -7,9 +7,9 @@
+ msgid ""
+ msgstr ""
+ "Project-Id-Version: fr\n"
+-"Report-Msgid-Bugs-To: hddtemp@guzu.net\n"
+-"POT-Creation-Date: 2005-02-25 22:43+0100\n"
+-"PO-Revision-Date: 2003-06-03 00:58GMT+1\n"
++"Report-Msgid-Bugs-To: \n"
++"POT-Creation-Date: 2006-06-29 16:24+0200\n"
++"PO-Revision-Date: 2011-08-30 16:38+0200\n"
+ "Last-Translator: Aurelien Jarno <aurelien@aurel32.net>\n"
+ "Language-Team: FRANCAIS <fr@li.org>\n"
+ "MIME-Version: 1.0\n"
+@@ -17,23 +17,7 @@
+ "Content-Transfer-Encoding: 8bit\n"
+ "X-Generator: KBabel 1.0.1\n"
+ 
+-#: src/hddtemp.c:112
+-#, c-format
+-msgid ""
+-"\n"
+-"Regexp%s| Value | Description\n"
+-"------%s---------------------\n"
+-msgstr ""
+-"\n"
+-"Regexp%s| Valeur | Description\n"
+-"------%s----------------------\n"
+-
+-#: src/hddtemp.c:118
+-#, c-format
+-msgid "%s%s| %5d | %s\n"
+-msgstr "%s%s|  %5d | %s\n"
+-
+-#: src/hddtemp.c:161
++#: src/hddtemp.c:156
+ #, c-format
+ msgid ""
+ "\n"
+@@ -46,7 +30,7 @@
+ "ModËle: %s\n"
+ "\n"
+ 
+-#: src/hddtemp.c:188
++#: src/hddtemp.c:189
+ #, c-format
+ msgid ""
+ "WARNING: Drive %s doesn't seem to have a temperature sensor.\n"
+@@ -60,75 +44,60 @@
+ "net).\n"
+ "ATTENTION : Voir les options --help, --debug et --drivebase.\n"
+ 
+-#: src/hddtemp.c:192
++#: src/hddtemp.c:197
+ #, c-format
+ msgid "%s: %s:  no sensor\n"
+ msgstr "%s: %s :  pas de capteur\n"
+ 
+-#: src/hddtemp.c:197
+-#, c-format
+-msgid ""
+-"WARNING: Drive %s doesn't appear in the database of supported drives\n"
+-"WARNING: But using a common value, it reports something.\n"
+-"WARNING: Note that the temperature shown could be wrong.\n"
+-"WARNING: See --help, --debug and --drivebase options.\n"
+-"WARNING: And don't forget you can add your drive to hddtemp.db\n"
+-msgstr ""
+-"ATTENTION : Le lecteur %s n'apparait pas dans la base de donnÈes des "
+-"lecteurs supportÈs\n"
+-"ATTENTION : Mais en utilisant une valeur courante, il renvoie quelque "
+-"chose.\n"
+-"ATTENTION : Notez que la tempÈrature renvoyÈe peut Ítre erronÈe.\n"
+-"ATTENTION : Voir les options --help, --debug et --drivebase.\n"
+-"ATTENTION : Et n'oubliez pas d'ajouter votre lecteur au fichier hddtemp.db\n"
+-
+-#: src/hddtemp.c:202
++#: src/hddtemp.c:211
+ #, c-format
+ msgid "%s: %s:  %d%sC or %sF\n"
+ msgstr "%s: %s :  %d%sC ou %sF\n"
+ 
+-#: src/hddtemp.c:214
++#: src/hddtemp.c:235
+ #, c-format
+ msgid "%s: %s: drive is sleeping\n"
+ msgstr "%s: %s : le lecteur est en veille\n"
+ 
+-#: src/hddtemp.c:217
++#: src/hddtemp.c:242
+ #, c-format
+-msgid "%s: %s:  known drive, but it doesn't have a temperature sensor.\n"
++msgid "%s: %s:  drive supported, but it doesn't have a temperature sensor.\n"
+ msgstr ""
+ "%s: %s:  lecteur connu, mais il ne possËde pas de capteur de tempÈrature.\n"
+ 
+-#: src/hddtemp.c:220
++#: src/hddtemp.c:246
+ #, c-format
+ msgid "ERROR: %s: %s: unknown returned status\n"
+ msgstr "ERREUR : %s : %s : status inconnu\n"
+ 
+-#: src/hddtemp.c:235
++#: src/hddtemp.c:261
+ #, c-format
+ msgid ""
+ "\n"
+ "If one of the field value seems to match the temperature, be sure to read\n"
+-"the hddtemp man page before sending me a report (section REPORT). Thanks.\n"
++"the hddtemp man page before sending a report (section REPORT). Thanks.\n"
+ msgstr ""
+ 
+-#: src/hddtemp.c:308
++#: src/hddtemp.c:338
+ #, c-format
+ msgid "ERROR: invalid separator.\n"
+ msgstr "ERREUR : sÈparateur invalide.\n"
+ 
+-#: src/hddtemp.c:319
++#: src/hddtemp.c:349
+ #, c-format
+ msgid "ERROR: invalid port number.\n"
+ msgstr "ERREUR : numÈro de port invalide.\n"
+ 
+-#: src/hddtemp.c:329
+-#, fuzzy, c-format
++#: src/hddtemp.c:371
++#, c-format
+ msgid ""
+-" Usage: hddtemp [OPTIONS] DISK1 [DISK2]...\n"
++" Usage: hddtemp [OPTIONS] [TYPE:]DISK1 [[TYPE:]DISK2]...\n"
+ "\n"
+ "   hddtemp displays the temperature of drives supplied in argument.\n"
+ "   Drives must support S.M.A.R.T.\n"
+ "\n"
++"  TYPE could be SATA, PATA or SCSI. If omitted hddtemp will try to guess.\n"
++"\n"
+ "  -b   --drivebase   :  display database file content that allow hddtemp to\n"
+ "                        recognize supported drives.\n"
+ "  -D   --debug       :  display various S.M.A.R.T. fields and their values.\n"
+@@ -138,6 +107,7 @@
+ "  -d   --daemon      :  run hddtemp in TCP/IP daemon mode (port %d by "
+ "default.)\n"
+ "  -f   --file=FILE   :  specify database file to use.\n"
++"  -F   --foreground  :  don't daemonize, stay in foreground.\n"
+ "  -l   --listen=addr :  listen on a specific interface (in TCP/IP daemon "
+ "mode).\n"
+ "  -n   --numeric     :  print only the temperature.\n"
+@@ -145,6 +115,8 @@
+ "  -s   --separator=C :  separator to use between fields (in TCP/IP daemon "
+ "mode).\n"
+ "  -S   --syslog=s    :  log temperature to syslog every s seconds.\n"
++"  -u   --unit=[C|F]  :  force output temperature either in Celsius or "
++"Fahrenheit.\n"
+ "  -q   --quiet       :  do not check if the drive is supported.\n"
+ "  -v   --version     :  display hddtemp version number.\n"
+ "  -w   --wake-up     :  wake-up the drive if need.\n"
+@@ -153,11 +125,14 @@
+ "\n"
+ "Report bugs or new drives to <hddtemp@guzu.net>.\n"
+ msgstr ""
+-" Utilisation: hddtemp [OPTIONS] DISQUE1 [DISQUE2]...\n"
++" Utilisation: hddtemp [OPTIONS] [TYPE:]DISQUE1 [[TYPE:]DISQUE2]...\n"
+ "\n"
+ "   hddtemp affiche la tempÈrature des lecteurs passÈs en argument.\n"
+ "   Les lecteurs doivent avoir le support S.M.A.R.T.\n"
+ "\n"
++"  TYPE peut Ítre SATA, PATA ou SCSI. Si le type est omis, hddtemp essaiera\n"
++"  de le deviner.\n"
++"\n"
+ "  -b   --drivebase   :  affiche le contenu du fichier de base de donnÈe "
+ "qui \n"
+ "                        permet ‡ hddtemp de reconnaÓtre les lecteurs "
+@@ -172,6 +147,7 @@
+ "dÈfaut).\n"
+ "  -f   --file=FILE   :  specifie le fichier ‡ utiliser comme base de "
+ "donnÈes.\n"
++"  -F   --foreground  :  ne pas dÈmoniser, rester au premier plan.\n"
+ "  -l   --listen=addr :  Ècoute sur une interface spÈcifique (en mode dÈmon "
+ "TCP/IP).\n"
+ "  -n   --numeric     :  affiche seulement la tempÈrature.\n"
+@@ -180,6 +156,8 @@
+ "dÈmon TCP/IP).\n"
+ "  -S   --syslog=s    :  enregistre la tempÈrature dans syslog tous les s "
+ "secondes.\n"
++"  -u   --unit=[C|F]  :  affiche la tempÈrature en degrÈs Celsius ou "
++"Fahrenheit.\n"
+ "  -q   --quiet       :  ne vÈrifie pas si le lecteur est supportÈ.\n"
+ "  -v   --version     :  affiche la version de hddtemp.\n"
+ "  -w   --wake-up     :  rÈveiller le lecteur si nÈcessaire.\n"
+@@ -188,62 +166,95 @@
+ "\n"
+ "Report bugs or new drives to <hddtemp@guzu.net>.\n"
+ 
+-#: src/hddtemp.c:522
++#: src/hddtemp.c:402
+ #, c-format
+ msgid "hddtemp version %s\n"
+ msgstr "hddtemp version %s\n"
+ 
+-#: src/hddtemp.c:547
++#: src/hddtemp.c:418
+ #, c-format
+ msgid "ERROR: invalid interval.\n"
+ msgstr "ERREUR : intervalle invalide.\n"
+ 
+-#: src/hddtemp.c:547
++#: src/hddtemp.c:438
++#, c-format
+ msgid "Too few arguments: you must specify one drive, at least.\n"
+ msgstr "Trop peu d'arguments : vous devez spÈcifier au moins un lecteur.\n"
+ 
+-#: src/hddtemp.c:557
++#: src/hddtemp.c:448
++#, c-format
+ msgid "ERROR: can't use --debug and --daemon or --syslog options together.\n"
+ msgstr ""
+ "ERREUR: impossible d'utiliser les options --debug et --daemon ou --syslog en "
+ "mÍme temps.\n"
+ 
+-#: src/hddtemp.c:583
++#: src/hddtemp.c:505
+ #, c-format
+ msgid "ERROR: %s: can't determine bus type (or this bus type is unknown)\n"
+ msgstr ""
+ "ERREUR: %s: impossible de dÈterminer le type de bus (ou ce type de bus est "
+ "inconnu)\n"
+ 
+-#: src/ata.c:66 src/scsi.c:68
++#: src/ata.c:66 src/scsi.c:64
+ msgid "unknown"
+ msgstr "inconnu"
+ 
+-#: src/ata.c:98
++#: src/ata.c:85 src/ata.c:104 src/scsi.c:91
+ #, c-format
+-msgid "field(%d)\t = %d\n"
+-msgstr "champ(%d)\t = %d\n"
+-
+-#: src/ata.c:167
+ msgid "S.M.A.R.T. not available"
+ msgstr "S.M.A.R.T. non disponible"
+ 
+-#: src/db.c:180
++#: src/db.c:115
++#, c-format
++msgid ""
++"\n"
++"Regexp%s| Value | Description\n"
++"------%s---------------------\n"
++msgstr ""
++"\n"
++"Regexp%s| Valeur | Description\n"
++"------%s----------------------\n"
++
++#: src/db.c:121
++#, c-format
++msgid "%s%s| %5d | %s\n"
++msgstr "%s%s|  %5d | %s\n"
++
++#: src/db.c:236
+ #, c-format
+ msgid "hddtemp: can't open %1$s: %2$s\n"
+ msgstr "hddtemp: ne peut ouvrir %1$s: %2$s\n"
+ 
+-#: src/db.c:194
++#: src/db.c:250
+ #, c-format
+ msgid "ERROR: syntax error at line %1$d in %2$s\n"
+ msgstr "ERREUR: erreur de syntaxe ‡ la ligne %1$d: %2$s\n"
+ 
+-#: src/db.c:201
++#: src/db.c:257
+ #, c-format
+ msgid "  ERROR: line exceed %1$d characters in %2$s.\n"
+ msgstr "  ERREUR: ligne exÈcdant %1$d caractËres dans %2$s.\n"
+ 
+-#: src/scsi.c:112 src/scsi.c:130
++#: src/scsi.c:111 src/scsi.c:129
+ #, c-format
+ msgid "log sense failed : %s"
+ msgstr "echec de 'log sense' : %s "
++
++#~ msgid ""
++#~ "WARNING: Drive %s doesn't appear in the database of supported drives\n"
++#~ "WARNING: But using a common value, it reports something.\n"
++#~ "WARNING: Note that the temperature shown could be wrong.\n"
++#~ "WARNING: See --help, --debug and --drivebase options.\n"
++#~ "WARNING: And don't forget you can add your drive to hddtemp.db\n"
++#~ msgstr ""
++#~ "ATTENTION : Le lecteur %s n'apparait pas dans la base de donnÈes des "
++#~ "lecteurs supportÈs\n"
++#~ "ATTENTION : Mais en utilisant une valeur courante, il renvoie quelque "
++#~ "chose.\n"
++#~ "ATTENTION : Notez que la tempÈrature renvoyÈe peut Ítre erronÈe.\n"
++#~ "ATTENTION : Voir les options --help, --debug et --drivebase.\n"
++#~ "ATTENTION : Et n'oubliez pas d'ajouter votre lecteur au fichier hddtemp."
++#~ "db\n"
++
++#~ msgid "field(%d)\t = %d\n"
++#~ msgstr "champ(%d)\t = %d\n"
+--- hddtemp-0.3-beta15.orig/po/ru.po
++++ hddtemp-0.3-beta15/po/ru.po
+@@ -6,8 +6,8 @@
+ msgid ""
+ msgstr ""
+ "Project-Id-Version: hddtemp 0.3-beta3\n"
+-"Report-Msgid-Bugs-To: hddtemp@guzu.net\n"
+-"POT-Creation-Date: 2005-02-25 22:43+0100\n"
++"Report-Msgid-Bugs-To: \n"
++"POT-Creation-Date: 2006-06-29 16:24+0200\n"
+ "PO-Revision-Date: 2003-03-08 16:42+0300\n"
+ "Last-Translator: Michael Shigorin <mike@altlinux.ru>\n"
+ "Language-Team: Russian <ru@li.org>\n"
+@@ -15,23 +15,7 @@
+ "Content-Type: text/plain; charset=koi8-r\n"
+ "Content-Transfer-Encoding: 8bit\n"
+ 
+-#: src/hddtemp.c:112
+-#, c-format
+-msgid ""
+-"\n"
+-"Regexp%s| Value | Description\n"
+-"------%s---------------------\n"
+-msgstr ""
+-"\n"
+-"Ú≈«‹À”%s| ˙Œ¡ﬁ. | Ô–…”¡Œ…≈   \n"
+-"------%s---------------------\n"
+-
+-#: src/hddtemp.c:118
+-#, c-format
+-msgid "%s%s| %5d | %s\n"
+-msgstr ""
+-
+-#: src/hddtemp.c:161
++#: src/hddtemp.c:156
+ #, c-format
+ msgid ""
+ "\n"
+@@ -40,7 +24,7 @@
+ "\n"
+ msgstr ""
+ 
+-#: src/hddtemp.c:188
++#: src/hddtemp.c:189
+ #, c-format
+ msgid ""
+ "WARNING: Drive %s doesn't seem to have a temperature sensor.\n"
+@@ -53,72 +37,59 @@
+ "˜ÓÈÌ·ÓÈÂ: Â”Ã… ◊Ÿ ‘œﬁŒœ ⁄Œ¡≈‘≈, ﬁ‘œ ƒ¡‘ﬁ…À ≈”‘ÿ, Œ¡–…€…‘≈ hddtemp@guzu.net\n"
+ "˜ÓÈÌ·ÓÈÂ: (”Õ. œ–√…… --help, --debug … --drivebase).\n"
+ 
+-#: src/hddtemp.c:192
++#: src/hddtemp.c:197
+ #, c-format
+ msgid "%s: %s:  no sensor\n"
+ msgstr "%s: %s:  Œ≈‘ ƒ¡‘ﬁ…À¡\n"
+ 
+-#: src/hddtemp.c:197
+-#, c-format
+-msgid ""
+-"WARNING: Drive %s doesn't appear in the database of supported drives\n"
+-"WARNING: But using a common value, it reports something.\n"
+-"WARNING: Note that the temperature shown could be wrong.\n"
+-"WARNING: See --help, --debug and --drivebase options.\n"
+-"WARNING: And don't forget you can add your drive to hddtemp.db\n"
+-msgstr ""
+-"˜ÓÈÌ·ÓÈÂ: ‰…”À %s Œ≈ ◊ÀÃ¿ﬁ≈Œ ◊ ¬¡⁄’ ƒ¡ŒŒŸ» –œƒƒ≈“÷…◊¡≈ÕŸ» –“…◊œƒœ◊.\n"
+-"˜ÓÈÌ·ÓÈÂ: Óœ ” …”–œÃÿ⁄œ◊¡Œ…≈Õ “¡”–“œ”‘“¡Œ≈ŒŒŸ» –¡“¡Õ≈‘“œ◊ œŒ ﬁ‘œ-‘œ ◊Ÿƒ¡≈‘.\n"
+-"˜ÓÈÌ·ÓÈÂ: ˙¡Õ≈‘ÿ‘≈, ﬁ‘œ –œÀ¡⁄¡ŒŒ¡— ‘≈Õ–≈“¡‘’“¡ Õœ÷≈‘ ‘¡Àœ◊œ  Œ≈ —◊Ã—‘ÿ”—.\n"
+-"˜ÓÈÌ·ÓÈÂ: ÛÕ. œ–√…… --help, --debug … --drivebase.\n"
+-"˜ÓÈÌ·ÓÈÂ: È Œ≈ ⁄¡¬’ƒÿ‘≈, ﬁ‘œ Õœ÷Œœ ƒœ¬¡◊…‘ÿ –“…◊œƒ ◊ hddtemp.db\n"
+-
+-#: src/hddtemp.c:202
++#: src/hddtemp.c:211
+ #, c-format
+ msgid "%s: %s:  %d%sC or %sF\n"
+ msgstr "%s: %s:  %d%sC …Ã… %sF\n"
+ 
+-#: src/hddtemp.c:214
++#: src/hddtemp.c:235
+ #, c-format
+ msgid "%s: %s: drive is sleeping\n"
+ msgstr "%s: %s:  Œ≈‘ ƒ¡‘ﬁ…À¡\n"
+ 
+-#: src/hddtemp.c:217
+-#, c-format
+-msgid "%s: %s:  known drive, but it doesn't have a temperature sensor.\n"
++#: src/hddtemp.c:242
++#, fuzzy, c-format
++msgid "%s: %s:  drive supported, but it doesn't have a temperature sensor.\n"
+ msgstr "%s: %s:  …⁄◊≈”‘ŒŸ  ƒ…”À, Œ≈ ”œƒ≈“÷¡›…  ƒ¡‘ﬁ…À¡ ‘≈Õ–≈“¡‘’“Ÿ.\n"
+ 
+-#: src/hddtemp.c:220
++#: src/hddtemp.c:246
+ #, c-format
+ msgid "ERROR: %s: %s: unknown returned status\n"
+ msgstr "Ô˚È‚Î·: %s: %s: Œ≈…⁄◊≈”‘ŒŸ  ”‘¡‘’” ◊œ⁄◊“¡‘¡\n"
+ 
+-#: src/hddtemp.c:235
++#: src/hddtemp.c:261
+ #, c-format
+ msgid ""
+ "\n"
+ "If one of the field value seems to match the temperature, be sure to read\n"
+-"the hddtemp man page before sending me a report (section REPORT). Thanks.\n"
++"the hddtemp man page before sending a report (section REPORT). Thanks.\n"
+ msgstr ""
+ 
+-#: src/hddtemp.c:308
++#: src/hddtemp.c:338
+ #, c-format
+ msgid "ERROR: invalid separator.\n"
+ msgstr "Ô˚È‚Î·: Œ≈◊≈“ŒŸ  “¡⁄ƒ≈Ã…‘≈Ãÿ.\n"
+ 
+-#: src/hddtemp.c:319
++#: src/hddtemp.c:349
+ #, c-format
+ msgid "ERROR: invalid port number.\n"
+ msgstr "Ô˝È‚Î·: Œ≈◊≈“ŒŸ  ŒœÕ≈“ –œ“‘¡.\n"
+ 
+-#: src/hddtemp.c:329
++#: src/hddtemp.c:371
+ #, fuzzy, c-format
+ msgid ""
+-" Usage: hddtemp [OPTIONS] DISK1 [DISK2]...\n"
++" Usage: hddtemp [OPTIONS] [TYPE:]DISK1 [[TYPE:]DISK2]...\n"
+ "\n"
+ "   hddtemp displays the temperature of drives supplied in argument.\n"
+ "   Drives must support S.M.A.R.T.\n"
+ "\n"
++"  TYPE could be SATA, PATA or SCSI. If omitted hddtemp will try to guess.\n"
++"\n"
+ "  -b   --drivebase   :  display database file content that allow hddtemp to\n"
+ "                        recognize supported drives.\n"
+ "  -D   --debug       :  display various S.M.A.R.T. fields and their values.\n"
+@@ -128,6 +99,7 @@
+ "  -d   --daemon      :  run hddtemp in TCP/IP daemon mode (port %d by "
+ "default.)\n"
+ "  -f   --file=FILE   :  specify database file to use.\n"
++"  -F   --foreground  :  don't daemonize, stay in foreground.\n"
+ "  -l   --listen=addr :  listen on a specific interface (in TCP/IP daemon "
+ "mode).\n"
+ "  -n   --numeric     :  print only the temperature.\n"
+@@ -135,6 +107,8 @@
+ "  -s   --separator=C :  separator to use between fields (in TCP/IP daemon "
+ "mode).\n"
+ "  -S   --syslog=s    :  log temperature to syslog every s seconds.\n"
++"  -u   --unit=[C|F]  :  force output temperature either in Celsius or "
++"Fahrenheit.\n"
+ "  -q   --quiet       :  do not check if the drive is supported.\n"
+ "  -v   --version     :  display hddtemp version number.\n"
+ "  -w   --wake-up     :  wake-up the drive if need.\n"
+@@ -168,59 +142,90 @@
+ "\n"
+ "Ûœœ¬›≈Œ…— œ¬ œ€…¬À¡» … ƒ¡ŒŒŸ≈ ƒÃ— ƒ…”Àœ◊ œ‘–“¡◊Ã— ‘≈ Œ¡ <hddtemp@guzu.net>.\n"
+ 
+-#: src/hddtemp.c:522
++#: src/hddtemp.c:402
+ #, c-format
+ msgid "hddtemp version %s\n"
+ msgstr "˜≈“”…— hddtemp: %s\n"
+ 
+-#: src/hddtemp.c:547
++#: src/hddtemp.c:418
+ #, fuzzy, c-format
+ msgid "ERROR: invalid interval.\n"
+ msgstr "Ô˚È‚Î·: Œ≈◊≈“ŒŸ  “¡⁄ƒ≈Ã…‘≈Ãÿ.\n"
+ 
+-#: src/hddtemp.c:547
++#: src/hddtemp.c:438
++#, c-format
+ msgid "Too few arguments: you must specify one drive, at least.\n"
+ msgstr ""
+ 
+-#: src/hddtemp.c:557
+-#, fuzzy
++#: src/hddtemp.c:448
++#, fuzzy, c-format
+ msgid "ERROR: can't use --debug and --daemon or --syslog options together.\n"
+ msgstr "Ô˚È‚Î·: œƒŒœ◊“≈Õ≈ŒŒœ≈ …”–œÃÿ⁄œ◊¡Œ…≈ --debug … --daemon Œ≈ƒœ–’”‘…Õœ.\n"
+ 
+-#: src/hddtemp.c:583
++#: src/hddtemp.c:505
+ #, c-format
+ msgid "ERROR: %s: can't determine bus type (or this bus type is unknown)\n"
+ msgstr "Ô˚È‚Î·: %s: Œ≈◊œ⁄Õœ÷Œœ œ–“≈ƒ≈Ã…‘ÿ ‘…– €…ŒŸ\n"
+ 
+-#: src/ata.c:66 src/scsi.c:68
++#: src/ata.c:66 src/scsi.c:64
+ msgid "unknown"
+ msgstr "Œ≈…⁄◊."
+ 
+-#: src/ata.c:98
++#: src/ata.c:85 src/ata.c:104 src/scsi.c:91
+ #, c-format
+-msgid "field(%d)\t = %d\n"
+-msgstr "–œÃ≈(%d)\t = %d\n"
+-
+-#: src/ata.c:167
+ msgid "S.M.A.R.T. not available"
+ msgstr "S.M.A.R.T. Œ≈ƒœ”‘’–≈Œ"
+ 
+-#: src/db.c:180
++#: src/db.c:115
++#, c-format
++msgid ""
++"\n"
++"Regexp%s| Value | Description\n"
++"------%s---------------------\n"
++msgstr ""
++"\n"
++"Ú≈«‹À”%s| ˙Œ¡ﬁ. | Ô–…”¡Œ…≈   \n"
++"------%s---------------------\n"
++
++#: src/db.c:121
++#, c-format
++msgid "%s%s| %5d | %s\n"
++msgstr ""
++
++#: src/db.c:236
+ #, c-format
+ msgid "hddtemp: can't open %1$s: %2$s\n"
+ msgstr "hddtemp: Œ≈ Õœ«’ œ‘À“Ÿ‘ÿ %1$s: %2$s\n"
+ 
+-#: src/db.c:194
++#: src/db.c:250
+ #, c-format
+ msgid "ERROR: syntax error at line %1$d in %2$s\n"
+ msgstr "Û…Œ‘¡À”…ﬁ≈”À¡— Ô˚È‚Î· ◊ ”‘“œÀ≈ %1$d ∆¡ Ã¡ %2$s\n"
+ 
+-#: src/db.c:201
++#: src/db.c:257
+ #, c-format
+ msgid "  ERROR: line exceed %1$d characters in %2$s.\n"
+ msgstr "Ô˚È‚Î·: ”‘“œÀ¡ ƒÃ…ŒŒ≈≈ %1$d ”…Õ◊œÃœ◊ ◊ %2$s.\n"
+ 
+-#: src/scsi.c:112 src/scsi.c:130
++#: src/scsi.c:111 src/scsi.c:129
+ #, c-format
+ msgid "log sense failed : %s"
+ msgstr ""
++
++#~ msgid ""
++#~ "WARNING: Drive %s doesn't appear in the database of supported drives\n"
++#~ "WARNING: But using a common value, it reports something.\n"
++#~ "WARNING: Note that the temperature shown could be wrong.\n"
++#~ "WARNING: See --help, --debug and --drivebase options.\n"
++#~ "WARNING: And don't forget you can add your drive to hddtemp.db\n"
++#~ msgstr ""
++#~ "˜ÓÈÌ·ÓÈÂ: ‰…”À %s Œ≈ ◊ÀÃ¿ﬁ≈Œ ◊ ¬¡⁄’ ƒ¡ŒŒŸ» –œƒƒ≈“÷…◊¡≈ÕŸ» –“…◊œƒœ◊.\n"
++#~ "˜ÓÈÌ·ÓÈÂ: Óœ ” …”–œÃÿ⁄œ◊¡Œ…≈Õ “¡”–“œ”‘“¡Œ≈ŒŒŸ» –¡“¡Õ≈‘“œ◊ œŒ ﬁ‘œ-‘œ "
++#~ "◊Ÿƒ¡≈‘.\n"
++#~ "˜ÓÈÌ·ÓÈÂ: ˙¡Õ≈‘ÿ‘≈, ﬁ‘œ –œÀ¡⁄¡ŒŒ¡— ‘≈Õ–≈“¡‘’“¡ Õœ÷≈‘ ‘¡Àœ◊œ  Œ≈ "
++#~ "—◊Ã—‘ÿ”—.\n"
++#~ "˜ÓÈÌ·ÓÈÂ: ÛÕ. œ–√…… --help, --debug … --drivebase.\n"
++#~ "˜ÓÈÌ·ÓÈÂ: È Œ≈ ⁄¡¬’ƒÿ‘≈, ﬁ‘œ Õœ÷Œœ ƒœ¬¡◊…‘ÿ –“…◊œƒ ◊ hddtemp.db\n"
++
++#~ msgid "field(%d)\t = %d\n"
++#~ msgstr "–œÃ≈(%d)\t = %d\n"
+--- hddtemp-0.3-beta15.orig/po/sv.po
++++ hddtemp-0.3-beta15/po/sv.po
+@@ -6,8 +6,8 @@
+ msgid ""
+ msgstr ""
+ "Project-Id-Version: hddtemp 0.3-beta14-4\n"
+-"Report-Msgid-Bugs-To: hddtemp@guzu.net\n"
+-"POT-Creation-Date: 2005-02-25 22:43+0100\n"
++"Report-Msgid-Bugs-To: \n"
++"POT-Creation-Date: 2006-06-29 16:24+0200\n"
+ "PO-Revision-Date: 2005-11-02 19:03+0100\n"
+ "Last-Translator: Daniel Nylander <po@danielnylander.se>\n"
+ "Language-Team: Swedish <sv@li.org>\n"
+@@ -17,23 +17,7 @@
+ "X-Poedit-Language: swe\n"
+ "X-Poedit-Country: swe\n"
+ 
+-#: src/hddtemp.c:112
+-#, c-format
+-msgid ""
+-"\n"
+-"Regexp%s| Value | Description\n"
+-"------%s---------------------\n"
+-msgstr ""
+-"\n"
+-"Regexp%s| V‰rde | Beskrivning\n"
+-"------%s---------------------\n"
+-
+-#: src/hddtemp.c:118
+-#, c-format
+-msgid "%s%s| %5d | %s\n"
+-msgstr "%s%s| %5d | %s\n"
+-
+-#: src/hddtemp.c:161
++#: src/hddtemp.c:156
+ #, c-format
+ msgid ""
+ "\n"
+@@ -46,7 +30,7 @@
+ "Modell: %s\n"
+ "\n"
+ 
+-#: src/hddtemp.c:188
++#: src/hddtemp.c:189
+ #, c-format
+ msgid ""
+ "WARNING: Drive %s doesn't seem to have a temperature sensor.\n"
+@@ -60,76 +44,63 @@
+ "net).\n"
+ "VARNING: Se --help, --debug och --drivebase flaggorna.\n"
+ 
+-#: src/hddtemp.c:192
++#: src/hddtemp.c:197
+ #, c-format
+ msgid "%s: %s:  no sensor\n"
+ msgstr "%s: %s:  ingen sensor\n"
+ 
+-#: src/hddtemp.c:197
+-#, c-format
+-msgid ""
+-"WARNING: Drive %s doesn't appear in the database of supported drives\n"
+-"WARNING: But using a common value, it reports something.\n"
+-"WARNING: Note that the temperature shown could be wrong.\n"
+-"WARNING: See --help, --debug and --drivebase options.\n"
+-"WARNING: And don't forget you can add your drive to hddtemp.db\n"
+-msgstr ""
+-"VARNING: Disken %s verkar inte finnas i databasen ˆver diskar som stˆds\n"
+-"VARNING: Men anv‰nder man ett vanligt v‰rde rapporterar den nÂgot.\n"
+-"VARNING: Notera att temperaturen som visas kan vara felaktig.\n"
+-"VARNING: Se --help, --debug och --drivebase flaggorna.\n"
+-"VARNING: Och glˆm inte att du kan l‰gga till din disk till hddtemp.db\n"
+-
+-#: src/hddtemp.c:202
++#: src/hddtemp.c:211
+ #, c-format
+ msgid "%s: %s:  %d%sC or %sF\n"
+ msgstr "%s: %s:  %d%sC eller %sF\n"
+ 
+-#: src/hddtemp.c:214
++#: src/hddtemp.c:235
+ #, c-format
+ msgid "%s: %s: drive is sleeping\n"
+ msgstr "%s: %s: disken sover\n"
+ 
+-#: src/hddtemp.c:217
+-#, c-format
+-msgid "%s: %s:  known drive, but it doesn't have a temperature sensor.\n"
++#: src/hddtemp.c:242
++#, fuzzy, c-format
++msgid "%s: %s:  drive supported, but it doesn't have a temperature sensor.\n"
+ msgstr "%s: %s:  k‰nd disk men den har ingen temperatursensor.\n"
+ 
+-#: src/hddtemp.c:220
++#: src/hddtemp.c:246
+ #, c-format
+ msgid "ERROR: %s: %s: unknown returned status\n"
+ msgstr "FEL: %s: %s: ok‰nd returnerad status\n"
+ 
+-#: src/hddtemp.c:235
+-#, c-format
++#: src/hddtemp.c:261
++#, fuzzy, c-format
+ msgid ""
+ "\n"
+ "If one of the field value seems to match the temperature, be sure to read\n"
+-"the hddtemp man page before sending me a report (section REPORT). Thanks.\n"
++"the hddtemp man page before sending a report (section REPORT). Thanks.\n"
+ msgstr ""
+ "\n"
+ "Om ett av f‰ltv‰rdena verkar matcha temperaturen, var s‰ker pÂ att du\n"
+ "l‰st manualsidan fˆr hddtemp fˆre du skickar en rapport till mig (sektionen\n"
+ "REPORT). Tack.\n"
+ 
+-#: src/hddtemp.c:308
++#: src/hddtemp.c:338
+ #, c-format
+ msgid "ERROR: invalid separator.\n"
+ msgstr "FEL: ogiltig separator.\n"
+ 
+-#: src/hddtemp.c:319
++#: src/hddtemp.c:349
+ #, c-format
+ msgid "ERROR: invalid port number.\n"
+ msgstr "FEL: ogiltigt portnummer.\n"
+ 
+-#: src/hddtemp.c:329
+-#, c-format
++#: src/hddtemp.c:371
++#, fuzzy, c-format
+ msgid ""
+-" Usage: hddtemp [OPTIONS] DISK1 [DISK2]...\n"
++" Usage: hddtemp [OPTIONS] [TYPE:]DISK1 [[TYPE:]DISK2]...\n"
+ "\n"
+ "   hddtemp displays the temperature of drives supplied in argument.\n"
+ "   Drives must support S.M.A.R.T.\n"
+ "\n"
++"  TYPE could be SATA, PATA or SCSI. If omitted hddtemp will try to guess.\n"
++"\n"
+ "  -b   --drivebase   :  display database file content that allow hddtemp to\n"
+ "                        recognize supported drives.\n"
+ "  -D   --debug       :  display various S.M.A.R.T. fields and their values.\n"
+@@ -139,6 +110,7 @@
+ "  -d   --daemon      :  run hddtemp in TCP/IP daemon mode (port %d by "
+ "default.)\n"
+ "  -f   --file=FILE   :  specify database file to use.\n"
++"  -F   --foreground  :  don't daemonize, stay in foreground.\n"
+ "  -l   --listen=addr :  listen on a specific interface (in TCP/IP daemon "
+ "mode).\n"
+ "  -n   --numeric     :  print only the temperature.\n"
+@@ -146,6 +118,8 @@
+ "  -s   --separator=C :  separator to use between fields (in TCP/IP daemon "
+ "mode).\n"
+ "  -S   --syslog=s    :  log temperature to syslog every s seconds.\n"
++"  -u   --unit=[C|F]  :  force output temperature either in Celsius or "
++"Fahrenheit.\n"
+ "  -q   --quiet       :  do not check if the drive is supported.\n"
+ "  -v   --version     :  display hddtemp version number.\n"
+ "  -w   --wake-up     :  wake-up the drive if need.\n"
+@@ -184,61 +158,91 @@
+ "\n"
+ "Rapportera buggar eller nya hÂrddiskar till <hddtemp@guzu.net>.\n"
+ 
+-#: src/hddtemp.c:522
++#: src/hddtemp.c:402
+ #, c-format
+ msgid "hddtemp version %s\n"
+ msgstr "hddtemp version %s\n"
+ 
+-#: src/hddtemp.c:547
++#: src/hddtemp.c:418
+ #, c-format
+ msgid "ERROR: invalid interval.\n"
+ msgstr "FEL: ogiltigt intervall.\n"
+ 
+-#: src/hddtemp.c:547
++#: src/hddtemp.c:438
++#, c-format
+ msgid "Too few arguments: you must specify one drive, at least.\n"
+ msgstr "Fˆr fÂ argument: du mÂste specificera Âtminstone en disk.\n"
+ 
+-#: src/hddtemp.c:557
++#: src/hddtemp.c:448
++#, c-format
+ msgid "ERROR: can't use --debug and --daemon or --syslog options together.\n"
+ msgstr ""
+ "FEL: kan inte anv‰nda --debug och --daemon eller --syslog flaggorna "
+ "tillsammans.\n"
+ 
+-#: src/hddtemp.c:583
++#: src/hddtemp.c:505
+ #, c-format
+ msgid "ERROR: %s: can't determine bus type (or this bus type is unknown)\n"
+ msgstr ""
+ "FEL: %s: kan inte fastst‰lla busstyp (eller sÂ ‰r denna busstyp ok‰nd)\n"
+ 
+-#: src/ata.c:66 src/scsi.c:68
++#: src/ata.c:66 src/scsi.c:64
+ msgid "unknown"
+ msgstr "ok‰nd"
+ 
+-#: src/ata.c:98
++#: src/ata.c:85 src/ata.c:104 src/scsi.c:91
+ #, c-format
+-msgid "field(%d)\t = %d\n"
+-msgstr "f‰lt(%d)\t = %d\n"
+-
+-#: src/ata.c:167
+ msgid "S.M.A.R.T. not available"
+ msgstr "S.M.A.R.T. ‰r inte tillg‰nglig"
+ 
+-#: src/db.c:180
++#: src/db.c:115
++#, c-format
++msgid ""
++"\n"
++"Regexp%s| Value | Description\n"
++"------%s---------------------\n"
++msgstr ""
++"\n"
++"Regexp%s| V‰rde | Beskrivning\n"
++"------%s---------------------\n"
++
++#: src/db.c:121
++#, c-format
++msgid "%s%s| %5d | %s\n"
++msgstr "%s%s| %5d | %s\n"
++
++#: src/db.c:236
+ #, c-format
+ msgid "hddtemp: can't open %1$s: %2$s\n"
+ msgstr "hddtemp: kan inte ˆppna %1$s: %2$s\n"
+ 
+-#: src/db.c:194
++#: src/db.c:250
+ #, c-format
+ msgid "ERROR: syntax error at line %1$d in %2$s\n"
+ msgstr "FEL: syntaxfel pÂ rad %1$d i %2$s\n"
+ 
+-#: src/db.c:201
++#: src/db.c:257
+ #, c-format
+ msgid "  ERROR: line exceed %1$d characters in %2$s.\n"
+ msgstr " FEL: raden ˆverstiger %1$d tecken i %2$s.\n"
+ 
+-#: src/scsi.c:112 src/scsi.c:130
++#: src/scsi.c:111 src/scsi.c:129
+ #, c-format
+ msgid "log sense failed : %s"
+ msgstr "igenk‰nning av logg misslyckades : %s"
++
++#~ msgid ""
++#~ "WARNING: Drive %s doesn't appear in the database of supported drives\n"
++#~ "WARNING: But using a common value, it reports something.\n"
++#~ "WARNING: Note that the temperature shown could be wrong.\n"
++#~ "WARNING: See --help, --debug and --drivebase options.\n"
++#~ "WARNING: And don't forget you can add your drive to hddtemp.db\n"
++#~ msgstr ""
++#~ "VARNING: Disken %s verkar inte finnas i databasen ˆver diskar som stˆds\n"
++#~ "VARNING: Men anv‰nder man ett vanligt v‰rde rapporterar den nÂgot.\n"
++#~ "VARNING: Notera att temperaturen som visas kan vara felaktig.\n"
++#~ "VARNING: Se --help, --debug och --drivebase flaggorna.\n"
++#~ "VARNING: Och glˆm inte att du kan l‰gga till din disk till hddtemp.db\n"
++
++#~ msgid "field(%d)\t = %d\n"
++#~ msgstr "f‰lt(%d)\t = %d\n"
+--- hddtemp-0.3-beta15.orig/po/pt.po
++++ hddtemp-0.3-beta15/po/pt.po
+@@ -7,7 +7,7 @@
+ msgstr ""
+ "Project-Id-Version: hddtemp 0.3-beta14\n"
+ "Report-Msgid-Bugs-To: \n"
+-"POT-Creation-Date: 2005-02-25 22:43+0100\n"
++"POT-Creation-Date: 2006-06-29 16:24+0200\n"
+ "PO-Revision-Date: 2006-03-29 23:22+0000\n"
+ "Last-Translator: Miguel Figueiredo <elmig@debianp.org>\n"
+ "Language-Team: Portuguese <traduz@debianpt.org>\n"
+@@ -15,23 +15,7 @@
+ "Content-Type: text/plain; charset=UTF-8\n"
+ "Content-Transfer-Encoding: 8bit\n"
+ 
+-#: src/hddtemp.c:112
+-#, c-format
+-msgid ""
+-"\n"
+-"Regexp%s| Value | Description\n"
+-"------%s---------------------\n"
+-msgstr ""
+-"\n"
+-"Regexp%s| Valor | Descri√ß√£o\n"
+-"------%s-------------------\n"
+-
+-#: src/hddtemp.c:118
+-#, c-format
+-msgid "%s%s| %5d | %s\n"
+-msgstr "%s%s| %5d | %s\n"
+-
+-#: src/hddtemp.c:161
++#: src/hddtemp.c:156
+ #, c-format
+ msgid ""
+ "\n"
+@@ -44,7 +28,7 @@
+ "Modelo: %s\n"
+ "\n"
+ 
+-#: src/hddtemp.c:188
++#: src/hddtemp.c:189
+ #, c-format
+ msgid ""
+ "WARNING: Drive %s doesn't seem to have a temperature sensor.\n"
+@@ -54,79 +38,68 @@
+ msgstr ""
+ "AVISO: O disco %s n√£o parece ter um sensor de temperatura.\n"
+ "AVISO: Isto n√£o significa que n√£o tem nenhum.\n"
+-"AVISO: Se tem a certeza que tem um, por favor contacte-me (hddtemp@guzu.net).\n"
++"AVISO: Se tem a certeza que tem um, por favor contacte-me (hddtemp@guzu."
++"net).\n"
+ "AVISO: Veja as op√ß√µes --help, --debug e --drivebase.\n"
+ 
+-#: src/hddtemp.c:192
++#: src/hddtemp.c:197
+ #, c-format
+ msgid "%s: %s:  no sensor\n"
+ msgstr "%s: %s: sem sensor\n"
+ 
+-#: src/hddtemp.c:197
+-#, c-format
+-msgid ""
+-"WARNING: Drive %s doesn't appear in the database of supported drives\n"
+-"WARNING: But using a common value, it reports something.\n"
+-"WARNING: Note that the temperature shown could be wrong.\n"
+-"WARNING: See --help, --debug and --drivebase options.\n"
+-"WARNING: And don't forget you can add your drive to hddtemp.db\n"
+-msgstr ""
+-"AVISO: O disco %s n√£o parece estar na base de dados de discos suportados\n"
+-"AVISO: Mas ao utilizar um valor usual, relata alguma coisa.\n"
+-"AVISO: Note que a temperatura mostrada pode estar errada.\n"
+-"AVISO: Veja as op√ß√µes --help, --debug e --frivebase.\n"
+-"AVISO: E n√£o se esque√ßa de adicionar o seu disco a hddtemp.db\n"
+-
+-#: src/hddtemp.c:202
++#: src/hddtemp.c:211
+ #, c-format
+ msgid "%s: %s:  %d%sC or %sF\n"
+ msgstr "%s: %s: %d%sC ou %sF\n"
+ 
+-#: src/hddtemp.c:214
++#: src/hddtemp.c:235
+ #, c-format
+ msgid "%s: %s: drive is sleeping\n"
+ msgstr "%s: %s: o disco est√° adormecido\n"
+ 
+-#: src/hddtemp.c:217
+-#, c-format
+-msgid "%s: %s:  known drive, but it doesn't have a temperature sensor.\n"
++#: src/hddtemp.c:242
++#, fuzzy, c-format
++msgid "%s: %s:  drive supported, but it doesn't have a temperature sensor.\n"
+ msgstr "%s: %s: disco conhecido, mas n√£o tem um sensor de temperatura.\n"
+ 
+-#: src/hddtemp.c:220
++#: src/hddtemp.c:246
+ #, c-format
+ msgid "ERROR: %s: %s: unknown returned status\n"
+ msgstr "ERRO: %s: %s: estado devolvido desconhecido\n"
+ 
+-#: src/hddtemp.c:235
+-#, c-format
++#: src/hddtemp.c:261
++#, fuzzy, c-format
+ msgid ""
+ "\n"
+ "If one of the field value seems to match the temperature, be sure to read\n"
+-"the hddtemp man page before sending me a report (section REPORT). Thanks.\n"
++"the hddtemp man page before sending a report (section REPORT). Thanks.\n"
+ msgstr ""
+ "\n"
+-"Se um dos campos de valores parecer coincidir com a temperatura, assegure-se\n"
++"Se um dos campos de valores parecer coincidir com a temperatura, assegure-"
++"se\n"
+ "que l√™ a p√°gina do manual hddtemp antes de me enviar um relat√≥rio (sec√ß√£o\n"
+ "REPORT). Obrigado.\n"
+ 
+-#: src/hddtemp.c:308
++#: src/hddtemp.c:338
+ #, c-format
+ msgid "ERROR: invalid separator.\n"
+ msgstr "ERRO: separador inv√°lido.\n"
+ 
+-#: src/hddtemp.c:319
++#: src/hddtemp.c:349
+ #, c-format
+ msgid "ERROR: invalid port number.\n"
+ msgstr "ERRO: n√∫mero de port inv√°lido\n"
+ 
+-#: src/hddtemp.c:329
+-#, c-format
++#: src/hddtemp.c:371
++#, fuzzy, c-format
+ msgid ""
+-" Usage: hddtemp [OPTIONS] DISK1 [DISK2]...\n"
++" Usage: hddtemp [OPTIONS] [TYPE:]DISK1 [[TYPE:]DISK2]...\n"
+ "\n"
+ "   hddtemp displays the temperature of drives supplied in argument.\n"
+ "   Drives must support S.M.A.R.T.\n"
+ "\n"
++"  TYPE could be SATA, PATA or SCSI. If omitted hddtemp will try to guess.\n"
++"\n"
+ "  -b   --drivebase   :  display database file content that allow hddtemp to\n"
+ "                        recognize supported drives.\n"
+ "  -D   --debug       :  display various S.M.A.R.T. fields and their values.\n"
+@@ -136,6 +109,7 @@
+ "  -d   --daemon      :  run hddtemp in TCP/IP daemon mode (port %d by "
+ "default.)\n"
+ "  -f   --file=FILE   :  specify database file to use.\n"
++"  -F   --foreground  :  don't daemonize, stay in foreground.\n"
+ "  -l   --listen=addr :  listen on a specific interface (in TCP/IP daemon "
+ "mode).\n"
+ "  -n   --numeric     :  print only the temperature.\n"
+@@ -143,6 +117,8 @@
+ "  -s   --separator=C :  separator to use between fields (in TCP/IP daemon "
+ "mode).\n"
+ "  -S   --syslog=s    :  log temperature to syslog every s seconds.\n"
++"  -u   --unit=[C|F]  :  force output temperature either in Celsius or "
++"Fahrenheit.\n"
+ "  -q   --quiet       :  do not check if the drive is supported.\n"
+ "  -v   --version     :  display hddtemp version number.\n"
+ "  -w   --wake-up     :  wake-up the drive if need.\n"
+@@ -156,19 +132,23 @@
+ "   hddtemp mostra a temperatura dos discos indicados no argumento.\n"
+ "   Os discos t√™m de suportar S.M.A.R.T.\n"
+ "\n"
+-"  -b	 --drivebase   :  mostrar o conte√∫do do ficheiro de base de dados que\n"
++"  -b\t --drivebase   :  mostrar o conte√∫do do ficheiro de base de dados que\n"
+ "                        permite ao hddtemp reconhecer os discos suportados.\n"
+-"  -D	 --debug       :  mostrar v√°rios campos S.M.A.R.T. e os seus valores.\n"
+-"                        √ötil para encontrar um valor que pare√ßa coincidir com "
+-"                        a temperatura e/ou para me enviar um relat√≥rio.\n"
++"  -D\t --debug       :  mostrar v√°rios campos S.M.A.R.T. e os seus valores.\n"
++"                        √ötil para encontrar um valor que pare√ßa coincidir "
++"com                         a temperatura e/ou para me enviar um relat√≥rio.\n"
+ "                        (feito para cada disco indicado).\n"
+-"  -d   --daemon      :  correr o hddtemp no modo daemon TCP/IP\n (porto %d por omiss√£o.)\n"
++"  -d   --daemon      :  correr o hddtemp no modo daemon TCP/IP\n"
++" (porto %d por omiss√£o.)\n"
+ "  -f   --file=FILE   :  especificar o ficheiro de base de dados a utilizar.\n"
+-"  -l   --listen=addr :  escutar um interface espec√≠fico (no modo daemon TCP/IP).\n"
++"  -l   --listen=addr :  escutar um interface espec√≠fico (no modo daemon TCP/"
++"IP).\n"
+ "  -n   --numeric     :  escrever apenas a temperatura.\n"
+ "  -p   --port=#      :  port para escutar (no modo daemon TCP/IP).\n"
+-"  -s   --separator=C :  separador a utilizar entre campos (no modo daemon TCP/IP).\n"
+-"  -S   --syslog=s    :  registar a temperatura para o syslog a cada s segundos.\n"
++"  -s   --separator=C :  separador a utilizar entre campos (no modo daemon "
++"TCP/IP).\n"
++"  -S   --syslog=s    :  registar a temperatura para o syslog a cada s "
++"segundos.\n"
+ "  -q   --quiet       :  n√£o verificar se o disco √© suportado.\n"
+ "  -v   --version     :  mostrar o n√∫mero da vers√£o do hddtemp.\n"
+ "  -w   --wake-up     :  acordar o disco se necess√°rio.\n"
+@@ -177,58 +157,93 @@
+ "\n"
+ "Relatar bugs ou novos discos para <hddtemp@guzu.net>.\n"
+ 
+-#: src/hddtemp.c:522
++#: src/hddtemp.c:402
+ #, c-format
+ msgid "hddtemp version %s\n"
+ msgstr "hddtemp vers√£o %s\n"
+ 
+-#: src/hddtemp.c:547
++#: src/hddtemp.c:418
+ #, c-format
+ msgid "ERROR: invalid interval.\n"
+ msgstr "ERRO: intervalo inv√°lido.\n"
+ 
+-#: src/hddtemp.c:547
++#: src/hddtemp.c:438
++#, c-format
+ msgid "Too few arguments: you must specify one drive, at least.\n"
+-msgstr "N√∫mero de argumentos insuficiente: tem de especificar pelo menos um disco.\n"
++msgstr ""
++"N√∫mero de argumentos insuficiente: tem de especificar pelo menos um disco.\n"
+ 
+-#: src/hddtemp.c:557
++#: src/hddtemp.c:448
++#, c-format
+ msgid "ERROR: can't use --debug and --daemon or --syslog options together.\n"
+-msgstr "ERRO: n√£o pode utilizar em conjunto as op√ß√µes --debug e --daemon ou --syslog.\n"
++msgstr ""
++"ERRO: n√£o pode utilizar em conjunto as op√ß√µes --debug e --daemon ou --"
++"syslog.\n"
+ 
+-#: src/hddtemp.c:583
++#: src/hddtemp.c:505
+ #, c-format
+ msgid "ERROR: %s: can't determine bus type (or this bus type is unknown)\n"
+-msgstr "ERRO: %s: n√£o √© poss√≠vel determinar o tipo do bus (ou este tipo de bus √© desconhecido)\n"
++msgstr ""
++"ERRO: %s: n√£o √© poss√≠vel determinar o tipo do bus (ou este tipo de bus √© "
++"desconhecido)\n"
+ 
+-#: src/ata.c:66 src/scsi.c:68
++#: src/ata.c:66 src/scsi.c:64
+ msgid "unknown"
+ msgstr "desconhecido"
+ 
+-#: src/ata.c:98
++#: src/ata.c:85 src/ata.c:104 src/scsi.c:91
+ #, c-format
+-msgid "field(%d)\t = %d\n"
+-msgstr "campo(%d)\t = %d\n"
+-
+-#: src/ata.c:167
+ msgid "S.M.A.R.T. not available"
+ msgstr "S.M.A.R.T. n√£o est√° dispon√≠vel"
+ 
+-#: src/db.c:180
++#: src/db.c:115
++#, c-format
++msgid ""
++"\n"
++"Regexp%s| Value | Description\n"
++"------%s---------------------\n"
++msgstr ""
++"\n"
++"Regexp%s| Valor | Descri√ß√£o\n"
++"------%s-------------------\n"
++
++#: src/db.c:121
++#, c-format
++msgid "%s%s| %5d | %s\n"
++msgstr "%s%s| %5d | %s\n"
++
++#: src/db.c:236
+ #, c-format
+ msgid "hddtemp: can't open %1$s: %2$s\n"
+ msgstr "hddtemp: n√£o pode abrir %1$s: %2$s\n"
+ 
+-#: src/db.c:194
++#: src/db.c:250
+ #, c-format
+ msgid "ERROR: syntax error at line %1$d in %2$s\n"
+ msgstr "ERRO: erro de sintaxe na linha %1$d em %2$s\n"
+ 
+-#: src/db.c:201
++#: src/db.c:257
+ #, c-format
+ msgid "  ERROR: line exceed %1$d characters in %2$s.\n"
+ msgstr "  ERRO: a linha execedeu %1$d caracteres em %2$s.\n"
+ 
+-#: src/scsi.c:112 src/scsi.c:130
++#: src/scsi.c:111 src/scsi.c:129
+ #, c-format
+ msgid "log sense failed : %s"
+ msgstr "detec√ß√£o de log falhou: %s"
++
++#~ msgid ""
++#~ "WARNING: Drive %s doesn't appear in the database of supported drives\n"
++#~ "WARNING: But using a common value, it reports something.\n"
++#~ "WARNING: Note that the temperature shown could be wrong.\n"
++#~ "WARNING: See --help, --debug and --drivebase options.\n"
++#~ "WARNING: And don't forget you can add your drive to hddtemp.db\n"
++#~ msgstr ""
++#~ "AVISO: O disco %s n√£o parece estar na base de dados de discos suportados\n"
++#~ "AVISO: Mas ao utilizar um valor usual, relata alguma coisa.\n"
++#~ "AVISO: Note que a temperatura mostrada pode estar errada.\n"
++#~ "AVISO: Veja as op√ß√µes --help, --debug e --frivebase.\n"
++#~ "AVISO: E n√£o se esque√ßa de adicionar o seu disco a hddtemp.db\n"
++
++#~ msgid "field(%d)\t = %d\n"
++#~ msgstr "campo(%d)\t = %d\n"
+--- hddtemp-0.3-beta15.orig/po/de.po
++++ hddtemp-0.3-beta15/po/de.po
+@@ -0,0 +1,250 @@
++# German translation of hddtemp.
++# Copyright (C) 2008 Free Software Foundation, Inc.
++# This file is distributed under the same license as the hddtemp package.
++# Vinzenz Vietzke <vinz@v1nz.org>, 2008.
++# ,
++#
++#
++msgid ""
++msgstr ""
++"Project-Id-Version: hddtemp 0.3-beta15-44\n"
++"Report-Msgid-Bugs-To: hddtemp@packages.debian.org\n"
++"POT-Creation-Date: 2006-06-29 16:24+0200\n"
++"PO-Revision-Date: 2011-08-30 16:40+0200\n"
++"Last-Translator: Vinzenz Vietzke <vinz@v1nz.org>\n"
++"Language-Team: <debian-l10n-german@lists.debian.org>\n"
++"MIME-Version: 1.0\n"
++"Content-Type: text/plain; charset=UTF-8\n"
++"Content-Transfer-Encoding: 8bit"
++
++#: src/hddtemp.c:156
++#, c-format
++msgid ""
++"\n"
++"================= hddtemp %s ==================\n"
++"Model: %s\n"
++"\n"
++msgstr ""
++"\n"
++"================= hddtemp %s ==================\n"
++"Modell: %s\n"
++"\n"
++
++#: src/hddtemp.c:189
++#, c-format
++msgid ""
++"WARNING: Drive %s doesn't seem to have a temperature sensor.\n"
++"WARNING: This doesn't mean it hasn't got one.\n"
++"WARNING: If you are sure it has one, please contact me (hddtemp@guzu."
++"net).\n"
++"WARNING: See --help, --debug and --drivebase options.\n"
++msgstr ""
++"WARNUNG: Laufwerk %s scheint keinen Temperatur-Sensor zu haben.\n"
++"WARNUNG: Das bedeutet nicht, dass es keinen besitzt.\n"
++"WARNUNG: Falls Sie sicher sind, dass es einen besitzt, kontaktieren Sie "
++"mich bitte (hddtemp@guzu.net).\n"
++"WARNUNG: Siehe Optionen --help, --debug und --drivebase.\n"
++
++#: src/hddtemp.c:197
++#, c-format
++msgid "%s: %s:  no sensor\n"
++msgstr "%s: %s: kein Sensor\n"
++
++#: src/hddtemp.c:211
++#, c-format
++msgid "%s: %s:  %d%sC or %sF\n"
++msgstr "%s: %s:  %d%s¬∞C oder %s¬∞F\n"
++
++#: src/hddtemp.c:235
++#, c-format
++msgid "%s: %s: drive is sleeping\n"
++msgstr "%s: %s: Laufwerk schl√§ft\n"
++
++#: src/hddtemp.c:242
++#, c-format
++msgid "%s: %s:  drive supported, but it doesn't have a temperature sensor.\n"
++msgstr ""
++"%s: %s:  Laufwerk unterst√ºtzt, aber es hat keinen Temperatur-Sensor.\n"
++
++#: src/hddtemp.c:246
++#, c-format
++msgid "ERROR: %s: %s: unknown returned status\n"
++msgstr "FEHLER: %s: %s: zur√ºckgegebener Status unbekannt\n"
++
++#: src/hddtemp.c:261
++#, c-format
++msgid ""
++"\n"
++"If one of the field value seems to match the temperature, be sure to read\n"
++"the hddtemp man page before sending a report (section REPORT). Thanks.\n"
++msgstr ""
++"\n"
++"Falls einer der Feldwerte der Temperatur zu entsprechen scheint, stellen "
++"Sie\n"
++"sicher, die hddtemp-Handbuchseite gelesen zu haben, bevor Sie einen "
++"Bericht\n"
++"senden (Abschnitt BERICHT). Danke.\n"
++
++#: src/hddtemp.c:338
++#, c-format
++msgid "ERROR: invalid separator.\n"
++msgstr "FEHLER: ung√ºltiges Trennzeichen.\n"
++
++#: src/hddtemp.c:349
++#, c-format
++msgid "ERROR: invalid port number.\n"
++msgstr "FEHLER: ung√ºltige Portnummer.\n"
++
++#: src/hddtemp.c:371
++#, c-format
++msgid ""
++" Usage: hddtemp [OPTIONS] [TYPE:]DISK1 [[TYPE:]DISK2]...\n"
++"\n"
++"   hddtemp displays the temperature of drives supplied in argument.\n"
++"   Drives must support S.M.A.R.T.\n"
++"\n"
++"  TYPE could be SATA, PATA or SCSI. If omitted hddtemp will try to guess.\n"
++"\n"
++"  -b   --drivebase   :  display database file content that allow hddtemp "
++"to\n"
++"                        recognize supported drives.\n"
++"  -D   --debug       :  display various S.M.A.R.T. fields and their "
++"values.\n"
++"                        Useful to find a value that seems to match the\n"
++"                        temperature and/or to send me a report.\n"
++"                        (done for every drive supplied).\n"
++"  -d   --daemon      :  run hddtemp in TCP/IP daemon mode (port %d by "
++"default.)\n"
++"  -f   --file=FILE   :  specify database file to use.\n"
++"  -F   --foreground  :  don't daemonize, stay in foreground.\n"
++"  -l   --listen=addr :  listen on a specific interface (in TCP/IP daemon "
++"mode).\n"
++"  -n   --numeric     :  print only the temperature.\n"
++"  -p   --port=#      :  port to listen to (in TCP/IP daemon mode).\n"
++"  -s   --separator=C :  separator to use between fields (in TCP/IP daemon "
++"mode).\n"
++"  -S   --syslog=s    :  log temperature to syslog every s seconds.\n"
++"  -u   --unit=[C|F]  :  force output temperature either in Celsius or "
++"Fahrenheit.\n"
++"  -q   --quiet       :  do not check if the drive is supported.\n"
++"  -v   --version     :  display hddtemp version number.\n"
++"  -w   --wake-up     :  wake-up the drive if need.\n"
++"  -4                 :  listen on IPv4 sockets only.\n"
++"  -6                 :  listen on IPv6 sockets only.\n"
++"\n"
++"Report bugs or new drives to <hddtemp@guzu.net>.\n"
++msgstr ""
++" Verwendung: hddtemp [OPTIONEN] [TYP:]LAUFWERK1 [[TYP:]LAUFWERK2]...\n"
++"\n"
++"  hddtemp zeigt die Temperatur der via Argument angegeben Laufwerke.\n"
++"  Laufwerke m√ºssen S.M.A.R.T. unterst√ºtzen.\n"
++"\n"
++"  TYP kann SATA, PATA oder SCSI sein. Falls ausgelassen, wird hddtemp \n"
++"  versuchen, diesen zu erraten.\n"
++"\n"
++"  -b   --drivebase   :  Datenbank-Datei-Inhalt anzeigen, der hddtemp "
++"erlaubt\n"
++"                        unterst√ºtzte Laufwerke zu erkennen.\n"
++"  -D   --debug       :  verschiedene S.M.A.R.T.-Felder und deren Werte "
++"anzeigen.\n"
++"                       N√ºtzlich, um Werte zu finden, die der Temperatur "
++"entsprechen\n"
++"                       und/oder um mir einen Bericht zu senden.\n"
++"                       (bereits erledigt f√ºr jedes bereitgestellte "
++"Laufwerk).\n"
++"  -d   --daemon      :  hddtemp im TCP/IP-Daemon-Modus ausf√ºhren "
++"(Standardm√§√üig Port %d)\n"
++"  -f   --file=DATEI  :  zu verwendende Datenbank-Datei festlegen.\n"
++"  -F   --foreground  :  nicht daemonisieren, im Vordergrund bleiben.\n"
++"  -l   --listen=addr :  auf einer bestimmten Schnittstelle auf Anfragen "
++"warten (im TCP/IP-Daemon-Modus).\n"
++"  -n   --numeric     :  nur die Temperatur ausgeben.\n"
++"  -p   --port=#      :  Port, auf dem auf Anfragen gewartet werden soll "
++"(im TCP/IP-Daemon-Modus).\n"
++"  -s   --separator=C :  Trennzeichen zur Verwendung zwischen Feldern (im "
++"TCP/IP-Daemon-Modus).\n"
++"  -S   --syslog=s    :  Temperatur alle s Sekunden in das syslog "
++"eintragen.\n"
++"  -u   --unit=[C|F]  :  Ausgabe der Temperatur entweder in Celsius oder "
++"Fahrenheit erzwingen.\n"
++"  -q   --quiet       :  nicht pr√ºfen, ob das Laufwerk unterst√ºtzt wird.\n"
++"  -v   --version     :  Versionsnummer von hddtemp anzeigen.\n"
++"  -w   --wake-up     :  Laufwerk bei Bedarf aufwecken.\n"
++"  -4                 :  nur auf IPv4-Sockets auf Anfragen warten.\n"
++"  -6                 :  nur auf IPv6-Sockets auf Anfragen warten.\n"
++"\n"
++"Fehler oder neue Laufwerke an <hddtemp@guzu.net> melden.\n"
++
++#: src/hddtemp.c:402
++#, c-format
++msgid "hddtemp version %s\n"
++msgstr "hddtemp Version %s\n"
++
++#: src/hddtemp.c:418
++#, c-format
++msgid "ERROR: invalid interval.\n"
++msgstr "FEHLER: ung√ºltiges Intervall.\n"
++
++#: src/hddtemp.c:438
++#, c-format
++msgid "Too few arguments: you must specify one drive, at least.\n"
++msgstr "Zu wenige Argumente: Sie m√ºssen mindestens ein Laufwerk angeben.\n"
++
++#: src/hddtemp.c:448
++#, c-format
++msgid "ERROR: can't use --debug and --daemon or --syslog options together.\n"
++msgstr ""
++"FEHLER: kann Optionen --debug und --daemon oder --syslog nicht zusammen "
++"verwenden.\n"
++
++#: src/hddtemp.c:505
++#, c-format
++msgid "ERROR: %s: can't determine bus type (or this bus type is unknown)\n"
++msgstr ""
++"FEHLER: %s: kann Bus-Typ nicht ermitteln (oder dieser Bus-Typ ist "
++"unbekannt)\n"
++
++#: src/ata.c:66 src/scsi.c:64
++msgid "unknown"
++msgstr "unbekannt"
++
++#: src/ata.c:85 src/ata.c:104 src/scsi.c:91
++#, c-format
++msgid "S.M.A.R.T. not available"
++msgstr "S.M.A.R.T. nicht verf√ºgbar"
++
++#: src/db.c:115
++#, c-format
++msgid ""
++"\n"
++"Regexp%s| Value | Description\n"
++"------%s---------------------\n"
++msgstr ""
++"\n"
++"Regexp%s| Wert | Beschreibung\n"
++"------%s---------------------\n"
++
++#: src/db.c:121
++#, c-format
++msgid "%s%s| %5d | %s\n"
++msgstr "%s%s| %5d | %s\n"
++
++#: src/db.c:236
++#, c-format
++msgid "hddtemp: can't open %1$s: %2$s\n"
++msgstr "hddtemp: kann %1$s nicht √∂ffnen: %2$s\n"
++
++#: src/db.c:250
++#, c-format
++msgid "ERROR: syntax error at line %1$d in %2$s\n"
++msgstr "FEHLER: Syntaxfehler in Zeile %1$d in %2$s\n"
++
++#: src/db.c:257
++#, c-format
++msgid "  ERROR: line exceed %1$d characters in %2$s.\n"
++msgstr "  FEHLER: Zeile √ºberschreitet %1$d Zeichen in %2$s.\n"
++
++#: src/scsi.c:111 src/scsi.c:129
++#, c-format
++msgid "log sense failed : %s"
++msgstr "Protokoll-Erkennung fehlgeschlagen : %s"
+--- hddtemp-0.3-beta15.orig/po/LINGUAS
++++ hddtemp-0.3-beta15/po/LINGUAS
+@@ -1,2 +1,2 @@
+ # Set of available languages.
+-fr pt ru sv 
++de fr pt ru sv 
+--- hddtemp-0.3-beta15.orig/po/hddtemp.pot
++++ hddtemp-0.3-beta15/po/hddtemp.pot
+@@ -1,35 +1,22 @@
+-
+-# Copyright (C) 2006 Free Software Foundation, Inc.
+-# This file is distributed under the same license as the 'hddtemp' package.
+-# Emmanuel VARAGNAT <hddtemp@guzu.net>, 2006.
++# SOME DESCRIPTIVE TITLE.
++# Copyright (C) YEAR Free Software Foundation, Inc.
++# This file is distributed under the same license as the PACKAGE package.
++# FIRST AUTHOR <EMAIL@ADDRESS>, YEAR.
+ #
+ #, fuzzy
+ msgid ""
+ msgstr ""
+ "Project-Id-Version: PACKAGE VERSION\n"
+-"Report-Msgid-Bugs-To: hddtemp@guzu.net\n"
+-"POT-Creation-Date: 2005-02-25 22:43+0100\n"
++"Report-Msgid-Bugs-To: \n"
++"POT-Creation-Date: 2006-06-29 16:24+0200\n"
+ "PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE\n"
+-"Last-Translator: Emmanuel Varagnat <hddtemp@guzu.net>\n"
++"Last-Translator: FULL NAME <EMAIL@ADDRESS>\n"
+ "Language-Team: LANGUAGE <LL@li.org>\n"
+ "MIME-Version: 1.0\n"
+ "Content-Type: text/plain; charset=CHARSET\n"
+ "Content-Transfer-Encoding: 8bit\n"
+ 
+-#: src/hddtemp.c:112
+-#, c-format
+-msgid ""
+-"\n"
+-"Regexp%s| Value | Description\n"
+-"------%s---------------------\n"
+-msgstr ""
+-
+-#: src/hddtemp.c:118
+-#, c-format
+-msgid "%s%s| %5d | %s\n"
+-msgstr ""
+-
+-#: src/hddtemp.c:161
++#: src/hddtemp.c:156
+ #, c-format
+ msgid ""
+ "\n"
+@@ -38,7 +25,7 @@
+ "\n"
+ msgstr ""
+ 
+-#: src/hddtemp.c:188
++#: src/hddtemp.c:189
+ #, c-format
+ msgid ""
+ "WARNING: Drive %s doesn't seem to have a temperature sensor.\n"
+@@ -47,67 +34,59 @@
+ "WARNING: See --help, --debug and --drivebase options.\n"
+ msgstr ""
+ 
+-#: src/hddtemp.c:192
+-#, c-format
+-msgid "%s: %s:  no sensor\n"
+-msgstr ""
+-
+ #: src/hddtemp.c:197
+ #, c-format
+-msgid ""
+-"WARNING: Drive %s doesn't appear in the database of supported drives\n"
+-"WARNING: But using a common value, it reports something.\n"
+-"WARNING: Note that the temperature shown could be wrong.\n"
+-"WARNING: See --help, --debug and --drivebase options.\n"
+-"WARNING: And don't forget you can add your drive to hddtemp.db\n"
++msgid "%s: %s:  no sensor\n"
+ msgstr ""
+ 
+-#: src/hddtemp.c:202
++#: src/hddtemp.c:211
+ #, c-format
+ msgid "%s: %s:  %d%sC or %sF\n"
+ msgstr ""
+ 
+-#: src/hddtemp.c:214
++#: src/hddtemp.c:235
+ #, c-format
+ msgid "%s: %s: drive is sleeping\n"
+ msgstr ""
+ 
+-#: src/hddtemp.c:217
++#: src/hddtemp.c:242
+ #, c-format
+-msgid "%s: %s:  known drive, but it doesn't have a temperature sensor.\n"
++msgid "%s: %s:  drive supported, but it doesn't have a temperature sensor.\n"
+ msgstr ""
+ 
+-#: src/hddtemp.c:220
++#: src/hddtemp.c:246
+ #, c-format
+ msgid "ERROR: %s: %s: unknown returned status\n"
+ msgstr ""
+ 
+-#: src/hddtemp.c:235
++#: src/hddtemp.c:261
+ #, c-format
+ msgid ""
+ "\n"
+ "If one of the field value seems to match the temperature, be sure to read\n"
+-"the hddtemp man page before sending me a report (section REPORT). Thanks.\n"
++"the hddtemp man page before sending a report (section REPORT). Thanks.\n"
+ msgstr ""
+ 
+-#: src/hddtemp.c:308
++#: src/hddtemp.c:338
+ #, c-format
+ msgid "ERROR: invalid separator.\n"
+ msgstr ""
+ 
+-#: src/hddtemp.c:319
++#: src/hddtemp.c:349
+ #, c-format
+ msgid "ERROR: invalid port number.\n"
+ msgstr ""
+ 
+-#: src/hddtemp.c:329
++#: src/hddtemp.c:371
+ #, c-format
+ msgid ""
+-" Usage: hddtemp [OPTIONS] DISK1 [DISK2]...\n"
++" Usage: hddtemp [OPTIONS] [TYPE:]DISK1 [[TYPE:]DISK2]...\n"
+ "\n"
+ "   hddtemp displays the temperature of drives supplied in argument.\n"
+ "   Drives must support S.M.A.R.T.\n"
+ "\n"
++"  TYPE could be SATA, PATA or SCSI. If omitted hddtemp will try to guess.\n"
++"\n"
+ "  -b   --drivebase   :  display database file content that allow hddtemp to\n"
+ "                        recognize supported drives.\n"
+ "  -D   --debug       :  display various S.M.A.R.T. fields and their values.\n"
+@@ -117,6 +96,7 @@
+ "  -d   --daemon      :  run hddtemp in TCP/IP daemon mode (port %d by "
+ "default.)\n"
+ "  -f   --file=FILE   :  specify database file to use.\n"
++"  -F   --foreground  :  don't daemonize, stay in foreground.\n"
+ "  -l   --listen=addr :  listen on a specific interface (in TCP/IP daemon "
+ "mode).\n"
+ "  -n   --numeric     :  print only the temperature.\n"
+@@ -124,6 +104,8 @@
+ "  -s   --separator=C :  separator to use between fields (in TCP/IP daemon "
+ "mode).\n"
+ "  -S   --syslog=s    :  log temperature to syslog every s seconds.\n"
++"  -u   --unit=[C|F]  :  force output temperature either in Celsius or "
++"Fahrenheit.\n"
+ "  -q   --quiet       :  do not check if the drive is supported.\n"
+ "  -v   --version     :  display hddtemp version number.\n"
+ "  -w   --wake-up     :  wake-up the drive if need.\n"
+@@ -133,58 +115,69 @@
+ "Report bugs or new drives to <hddtemp@guzu.net>.\n"
+ msgstr ""
+ 
+-#: src/hddtemp.c:522
++#: src/hddtemp.c:402
+ #, c-format
+ msgid "hddtemp version %s\n"
+ msgstr ""
+ 
+-#: src/hddtemp.c:547
++#: src/hddtemp.c:418
+ #, c-format
+ msgid "ERROR: invalid interval.\n"
+ msgstr ""
+ 
+-#: src/hddtemp.c:547
++#: src/hddtemp.c:438
++#, c-format
+ msgid "Too few arguments: you must specify one drive, at least.\n"
+ msgstr ""
+ 
+-#: src/hddtemp.c:557
++#: src/hddtemp.c:448
++#, c-format
+ msgid "ERROR: can't use --debug and --daemon or --syslog options together.\n"
+ msgstr ""
+ 
+-#: src/hddtemp.c:583
++#: src/hddtemp.c:505
+ #, c-format
+ msgid "ERROR: %s: can't determine bus type (or this bus type is unknown)\n"
+ msgstr ""
+ 
+-#: src/ata.c:66 src/scsi.c:68
++#: src/ata.c:66 src/scsi.c:64
+ msgid "unknown"
+ msgstr ""
+ 
+-#: src/ata.c:98
++#: src/ata.c:85 src/ata.c:104 src/scsi.c:91
+ #, c-format
+-msgid "field(%d)\t = %d\n"
++msgid "S.M.A.R.T. not available"
+ msgstr ""
+ 
+-#: src/ata.c:167
+-msgid "S.M.A.R.T. not available"
++#: src/db.c:115
++#, c-format
++msgid ""
++"\n"
++"Regexp%s| Value | Description\n"
++"------%s---------------------\n"
++msgstr ""
++
++#: src/db.c:121
++#, c-format
++msgid "%s%s| %5d | %s\n"
+ msgstr ""
+ 
+-#: src/db.c:180
++#: src/db.c:236
+ #, c-format
+ msgid "hddtemp: can't open %1$s: %2$s\n"
+ msgstr ""
+ 
+-#: src/db.c:194
++#: src/db.c:250
+ #, c-format
+ msgid "ERROR: syntax error at line %1$d in %2$s\n"
+ msgstr ""
+ 
+-#: src/db.c:201
++#: src/db.c:257
+ #, c-format
+ msgid "  ERROR: line exceed %1$d characters in %2$s.\n"
+ msgstr ""
+ 
+-#: src/scsi.c:112 src/scsi.c:130
++#: src/scsi.c:111 src/scsi.c:129
+ #, c-format
+ msgid "log sense failed : %s"
+ msgstr ""
+--- hddtemp-0.3-beta15.orig/src/sata.c
++++ hddtemp-0.3-beta15/src/sata.c
+@@ -118,11 +118,22 @@
+   int              i;
+   u16 *            p;
+ 
+-  if(dsk->db_entry && dsk->db_entry->attribute_id == 0) {
++  if(dsk->db_entry->attribute_id == 0) {
+     close(dsk->fd);
+     dsk->fd = -1;
+     return GETTEMP_NOSENSOR;
+   }
++
++  switch(ata_get_powermode(dsk->fd)) {
++  case PWM_STANDBY:
++  case PWM_SLEEPING:
++    if (!wakeup)
++      return GETTEMP_DRIVE_SLEEP;
++  case PWM_UNKNOWN:
++  case PWM_ACTIVE: /* active or idle */
++  default:
++    break;
++  }
+   
+   /* get SMART values */
+   if(sata_enable_smart(dsk->fd) != 0) {
+@@ -154,24 +165,15 @@
+   }
+ 
+   /* temperature */
+-  if(dsk->db_entry && dsk->db_entry->attribute_id > 0)
+-    field = sata_search_temperature(values, dsk->db_entry->attribute_id);
+-  else
+-    field = sata_search_temperature(values, DEFAULT_ATTRIBUTE_ID);
++  field = sata_search_temperature(values, dsk->db_entry->attribute_id);
+ 
+   if(field)
+     dsk->value = *(field+3);
+ 
+   if(dsk->db_entry && dsk->value != -1)
+     return GETTEMP_KNOWN;
+-  else {
+-    if(dsk->value != -1) {
+-      return GETTEMP_GUESS;
+-    }
+-    else {
+-      return GETTEMP_UNKNOWN;
+-    }
+-  }
++  else
++    return GETTEMP_UNKNOWN;
+ 
+   /* never reached */
+ }
+--- hddtemp-0.3-beta15.orig/src/satacmds.c
++++ hddtemp-0.3-beta15/src/satacmds.c
+@@ -39,7 +39,7 @@
+ #include <sys/ioctl.h>
+ #include <scsi/sg.h>
+ #include <linux/hdreg.h>
+-#include <netinet/in.h>
++#include <byteswap.h>
+ 
+ // Application specific includes
+ #include "satacmds.h"
+@@ -80,8 +80,8 @@
+ 
+   ret = scsi_SG_IO(device, cdb, sizeof(cdb), buffer, cmd[3] * 512, sense, sizeof(sense), dxfer_direction);
+  
+-  /* Verify SATA magics */
+-  if (sense[0] != 0x72 || sense[7] != 0x0e || sense[9] != 0x0e || sense[10] != 0x00)
++  /* Verify SATA magic */
++  if (sense[0] != 0x72)
+     return 1;		  
+   else 
+     return ret;
+@@ -95,10 +95,10 @@
+   p = s;
+   end = &s[bytecount & ~1]; /* bytecount must be even */
+ 
+-  /* convert from big-endian to host byte order */
++  /* convert from big-endian to string order */
+   for (p = end ; p != s;) {
+     unsigned short *pp = (unsigned short *) (p -= 2);
+-    *pp = ntohs(*pp);
++    *pp = bswap_16(*pp);
+   }
+ 
+   /* strip leading blanks */
+--- hddtemp-0.3-beta15.orig/src/backtrace.c
++++ hddtemp-0.3-beta15/src/backtrace.c
+@@ -16,9 +16,10 @@
+  * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
+  */
+ 
++#define _GNU_SOURCE
+ #include <features.h>
+ 
+-#if defined(__i386__) && defined(__GLIBC__)
++#if (defined(__i386__) || defined(__x86_64__)) && defined(__GLIBC__)
+ 
+ #include <execinfo.h>
+ 
+@@ -31,8 +32,12 @@
+ #include <bits/sigcontext.h>
+ #include <sys/param.h>
+ 
+-#define __USE_GNU
+ #include <ucontext.h>
++#if defined(__i386__)
++#  define REG_IP REG_EIP
++#elif defined(__x86_64__)
++#  define REG_IP REG_RIP
++#endif
+ 
+ #define MAX_BTSIZE 64
+ 
+@@ -42,7 +47,6 @@
+   static char **messages = NULL;
+   static size_t btsize = 0;
+   static size_t i;
+-  static unsigned int old_eip, old_ebp;
+   static char *strerr = "???";
+   static FILE *fstrm;
+ 
+@@ -61,10 +65,10 @@
+       SIC_CASE(SEGV_MAPERR);
+       SIC_CASE(SEGV_ACCERR);
+     }
+-    fprintf(fstrm, "=== SEGFAULT (%s) : invalid access to %p, in 0x%08x\n",
++    fprintf(fstrm, "=== SEGFAULT (%s) : invalid access to %p, in %p\n",
+ 	    strerr,
+ 	    ist->si_addr,
+-	    puc->uc_mcontext.gregs[REG_EIP]);
++	    (void*)puc->uc_mcontext.gregs[REG_IP]);
+     break;
+   case SIGILL:
+     switch(ist->si_code) {
+@@ -77,10 +81,10 @@
+       SIC_CASE(ILL_COPROC);
+       SIC_CASE(ILL_BADSTK);
+     }
+-    fprintf(fstrm, "=== ILLEGAL INSTR (%s) : invalid access to %p, in 0x%08x\n",
++    fprintf(fstrm, "=== ILLEGAL INSTR (%s) : invalid access to %p, in %p\n",
+ 	    strerr,
+ 	    ist->si_addr,
+-	    puc->uc_mcontext.gregs[REG_EIP]);
++	    (void*)puc->uc_mcontext.gregs[REG_IP]);
+     break;
+   case SIGBUS:
+     switch(ist->si_code) {
+@@ -88,10 +92,10 @@
+       SIC_CASE(BUS_ADRERR);
+       SIC_CASE(BUS_OBJERR);
+     }
+-    fprintf(fstrm, "=== BUS ERROR (%p) : invalid access to %p, in 0x%08x\n",
++    fprintf(fstrm, "=== BUS ERROR (%p) : invalid access to %p, in %p\n",
+ 	    strerr,
+ 	    ist->si_addr,
+-	    puc->uc_mcontext.gregs[REG_EIP]);
++	    (void*)puc->uc_mcontext.gregs[REG_IP]);
+     break;
+   }
+   fflush(fstrm);
+@@ -101,7 +105,7 @@
+   /*
+     old_eip = *(unsigned int*)((void*)&n-4);
+     old_ebp = *(unsigned int*)((void*)&n-8);
+-    *(unsigned int*)((void*)&n-4) = puc->uc_mcontext.gregs[REG_EIP];
++    *(unsigned int*)((void*)&n-4) = puc->uc_mcontext.gregs[REG_IP];
+     *(unsigned int*)((void*)&n-8) = puc->uc_mcontext.gregs[REG_EBP];    
+     
+     btsize = backtrace(btinfo, MAX_BTSIZE);
+@@ -111,14 +115,14 @@
+   */
+   
+   btsize = backtrace(btinfo, MAX_BTSIZE);
+-  btinfo[1] = (void*) puc->uc_mcontext.gregs[REG_EIP];
++  btinfo[1] = (void*) puc->uc_mcontext.gregs[REG_IP];
+ 
+   messages = backtrace_symbols(btinfo, btsize);
+ 
+   for(i = 1;
+       i < btsize;
+       i++)
+-    fprintf(fstrm, "[%d] #%d: %s\n", getpid(), i, messages[i]);
++    fprintf(fstrm, "[%d] #%zu: %s\n", getpid(), i, messages[i]);
+   fflush(fstrm);
+   fclose(fstrm);
+ 
+--- hddtemp-0.3-beta15.orig/src/daemon.c
++++ hddtemp-0.3-beta15/src/daemon.c
+@@ -163,19 +163,16 @@
+ 
+     switch(dsk->ret) {
+     case GETTEMP_NOT_APPLICABLE:
+-      n = snprintf(msg, sizeof(msg), "%s%c%s%c%s%c%c",
++      n = snprintf(msg, sizeof(msg), "%s%c%s%cNA%c*",
+                    dsk->drive, separator,
+                    dsk->model, separator,
+-                   "NA",       separator,
+-                   '*');
++                   separator);
+       break;
+-    case GETTEMP_GUESS:
+     case GETTEMP_UNKNOWN:
+-      n = snprintf(msg, sizeof(msg), "%s%c%s%c%s%c%c",
++      n = snprintf(msg, sizeof(msg), "%s%c%s%cUNK%c*",
+                    dsk->drive, separator,
+-                   dsk->model, separator,
+-                   "UNK",     separator,
+-                   '*');
++                   dsk->model, separator, 
++		   separator);
+       break;
+     case GETTEMP_KNOWN:
+       n = snprintf(msg, sizeof(msg), "%s%c%s%c%d%c%c",
+@@ -185,26 +182,23 @@
+                    get_unit(dsk));
+       break;
+     case GETTEMP_NOSENSOR:
+-      n = snprintf(msg, sizeof(msg), "%s%c%s%c%s%c%c",
++      n = snprintf(msg, sizeof(msg), "%s%c%s%cNOS%c*",
+                    dsk->drive, separator,
+                    dsk->model, separator,
+-                   "NOS",      separator,
+-                   '*');
++                   separator);
+       break;
+     case GETTEMP_DRIVE_SLEEP:
+-      n = snprintf(msg, sizeof(msg), "%s%c%s%c%s%c%c",
++      n = snprintf(msg, sizeof(msg), "%s%c%s%cSLP%c*",
+                    dsk->drive, separator,
+                    dsk->model, separator,
+-                   "SLP",      separator,
+-                   '*');
++                   separator);
+       break;
+     case GETTEMP_ERROR:
+     default:
+-      n = snprintf(msg, sizeof(msg), "%s%c%s%c%s%c%c",
++      n = snprintf(msg, sizeof(msg), "%s%c%s%cERR%c*",
+                    dsk->drive,                        separator,
+                    (dsk->model) ? dsk->model : "???", separator,
+-                   "ERR",                             separator,
+-                   '*');
++                   separator);
+       break;
+     }
+     write(cfd,&separator, 1);
+@@ -222,14 +216,11 @@
+   for(dsk = ldisks; dsk; dsk = dsk->next) {
+     switch(dsk->ret) {
+     case GETTEMP_KNOWN:
+-    case GETTEMP_GUESS:
+-      value_to_unit(dsk);
+-
+       syslog(LOG_INFO, "%s: %s: %d %c", 
+              dsk->drive,
+ 	     dsk->model,
+-	     dsk->value,
+-	     dsk->db_entry->unit);
++	     value_to_unit(dsk),
++	     get_unit(dsk));
+       break;
+     case GETTEMP_DRIVE_SLEEP:
+       syslog(LOG_WARNING, _("%s: %s: drive is sleeping"), 
+@@ -270,28 +261,30 @@
+   fd_set             deffds;
+   time_t             next_time;
+ 
+-  switch(fork()) {
+-  case -1:
+-    perror("fork");
+-    exit(2);
+-    break;
+-  case 0:
+-    break;
+-  default:
+-    exit(0);
+-  }
+-  
+-  setsid();
+-  
+-  switch(fork()) {
+-  case -1:
+-    perror("fork");
+-    exit(2);
+-    break;
+-  case 0:
+-    break;
+-  default:
+-    exit(0);
++if (!foreground) {
++    switch(fork()) {
++    case -1:
++      perror("fork");
++      exit(2);
++      break;
++    case 0:
++      break;
++    default:
++      exit(0);
++    }
++
++    setsid();
++
++    switch(fork()) {
++    case -1:
++      perror("fork");
++      exit(2);
++      break;
++    case 0:
++      break;
++    default:
++      exit(0);
++    }
+   }
+   chdir("/");
+   umask(0);
+--- hddtemp-0.3-beta15.orig/src/hddtemp.c
++++ hddtemp-0.3-beta15/src/hddtemp.c
+@@ -75,7 +75,7 @@
+ char               separator = SEPARATOR;
+ 
+ struct bustype *   bus[BUS_TYPE_MAX];
+-int                tcp_daemon, debug, quiet, numeric, wakeup, af_hint;
++int                tcp_daemon, debug, quiet, numeric, wakeup, foreground, af_hint;
+ 
+ static enum { DEFAULT, CELSIUS, FAHRENHEIT } unit;
+ 
+@@ -194,23 +194,7 @@
+     if (numeric && quiet)
+       printf("0\n");      
+     else
+-      printf(_("%s: %s:  no sensor\n"), dsk->drive, dsk->model);
+-
+-    break;
+-  case GETTEMP_GUESS:
+-
+-    if(!quiet)
+-      fprintf(stderr,
+-	      _("WARNING: Drive %s doesn't appear in the database of supported drives\n"
+-		"WARNING: But using a common value, it reports something.\n"
+-		"WARNING: Note that the temperature shown could be wrong.\n"
+-		"WARNING: See --help, --debug and --drivebase options.\n"
+-		"WARNING: And don't forget you can add your drive to hddtemp.db\n"), dsk->drive);
+-
+-    if (! numeric)
+-      printf(_("%s: %s:  %d%sC or %sF\n"), dsk->drive, dsk->model, dsk->value, degree, degree);
+-    else
+-      printf("%d\n", value_to_unit(dsk));
++      fprintf(stderr, _("%s: %s:  no sensor\n"), dsk->drive, dsk->model);
+ 
+     break;
+   case GETTEMP_KNOWN:
+@@ -232,14 +216,14 @@
+     if (numeric && quiet)
+       printf("0\n");      
+     else
+-      printf(_("%s: %s: drive is sleeping\n"), dsk->drive, dsk->model);
++      fprintf(stderr, _("%s: %s: drive is sleeping\n"), dsk->drive, dsk->model);
+ 
+     break;
+   case GETTEMP_NOSENSOR:
+     if (numeric && quiet)
+       printf("0\n");      
+     else
+-      printf(_("%s: %s:  drive supported, but it doesn't have a temperature sensor.\n"), dsk->drive, dsk->model);
++      fprintf(stderr, _("%s: %s:  drive supported, but it doesn't have a temperature sensor.\n"), dsk->drive, dsk->model);
+       
+     break;
+   default:
+@@ -268,8 +252,9 @@
+ 
+ int main(int argc, char* argv[]) {
+   int           i, c, lindex = 0, db_loaded = 0;
++  int 		ret = 0;
+   int           show_db;
+-  struct disk * ldisks;
++  struct        disk * ldisks;
+ 
+   backtrace_sigsegv();
+   backtrace_sigill();
+@@ -279,7 +264,7 @@
+   bindtextdomain (PACKAGE, LOCALEDIR);
+   textdomain (PACKAGE);
+   
+-  show_db = debug = numeric = quiet = wakeup = af_hint = syslog_interval = 0;
++  show_db = debug = numeric = quiet = wakeup = af_hint = syslog_interval = foreground = 0;
+   unit = DEFAULT;
+   portnum = PORT_NUMBER;
+   listen_addr = NULL;
+@@ -294,6 +279,7 @@
+       {"drivebase",  0, NULL, 'b'},
+       {"debug",      0, NULL, 'D'},
+       {"file",       1, NULL, 'f'},
++      {"foreground", 0, NULL, 'F'},
+       {"listen",     1, NULL, 'l'},
+       {"version",    0, NULL, 'v'},
+       {"port",       1, NULL, 'p'},
+@@ -305,7 +291,7 @@
+       {0, 0, 0, 0}
+     };
+  
+-    c = getopt_long (argc, argv, "bDdf:l:hp:qs:u:vnw46S:", long_options, &lindex);
++    c = getopt_long (argc, argv, "bDdf:l:hp:qs:u:vnw46FS:", long_options, &lindex);
+     if (c == -1)
+       break;
+     
+@@ -382,12 +368,13 @@
+ 		 "                        (done for every drive supplied).\n"
+ 		 "  -d   --daemon      :  run hddtemp in TCP/IP daemon mode (port %d by default.)\n"
+ 		 "  -f   --file=FILE   :  specify database file to use.\n"
++		 "  -F   --foreground  :  don't daemonize, stay in foreground.\n"
+ 		 "  -l   --listen=addr :  listen on a specific interface (in TCP/IP daemon mode).\n"
+                  "  -n   --numeric     :  print only the temperature.\n"
+ 		 "  -p   --port=#      :  port to listen to (in TCP/IP daemon mode).\n"
+ 		 "  -s   --separator=C :  separator to use between fields (in TCP/IP daemon mode).\n"
+ 		 "  -S   --syslog=s    :  log temperature to syslog every s seconds.\n"
+-                 "  -u   --unit=[C|F]  :  force output temperature either in Celius or Fahrenheit.\n"
++                 "  -u   --unit=[C|F]  :  force output temperature either in Celsius or Fahrenheit.\n"
+ 		 "  -q   --quiet       :  do not check if the drive is supported.\n"
+ 		 "  -v   --version     :  display hddtemp version number.\n"
+ 		 "  -w   --wake-up     :  wake-up the drive if need.\n"
+@@ -418,6 +405,9 @@
+ 	  }
+         }
+ 	break;
++      case 'F':
++        foreground = 1;
++	break;
+       default:
+ 	exit(1);
+       }
+@@ -489,6 +479,7 @@
+     if( (dsk->fd = open(dsk->drive, O_RDONLY | O_NONBLOCK)) < 0) {
+       snprintf(dsk->errormsg, MAX_ERRORMSG_SIZE, "open: %s\n", strerror(errno));
+       dsk->type = ERROR;
++      ret = 1;
+       continue;
+     }
+ 
+@@ -501,6 +492,7 @@
+ 
+       ldisks = dsk->next;
+       free(dsk);
++      ret = 1;
+       continue;
+     }
+ 
+@@ -514,11 +506,17 @@
+ 	db_loaded = 1;
+       }      
+ 
++      dsk->db_entry = (struct harddrive_entry *)malloc(sizeof(struct harddrive_entry));
+       dbe = is_a_supported_drive(dsk->model);
+-      if(dbe) {
+-	dsk->db_entry = (struct harddrive_entry *)malloc(sizeof(struct harddrive_entry));
++      if(dbe)
+ 	memcpy(dsk->db_entry, dbe, sizeof(struct harddrive_entry));
+-      }	
++      else {
++        dsk->db_entry->regexp       = "";
++        dsk->db_entry->description  = "";
++        dsk->db_entry->attribute_id = DEFAULT_ATTRIBUTE_ID;
++        dsk->db_entry->unit         = 'C';
++        dsk->db_entry->next         = NULL;
++      }
+     }
+   }
+ 
+@@ -530,5 +528,5 @@
+     do_direct_mode(ldisks);
+   }
+ 
+-  return 0;
++  return ret;
+ }
+--- hddtemp-0.3-beta15.orig/src/ata.c
++++ hddtemp-0.3-beta15/src/ata.c
+@@ -75,7 +75,7 @@
+   int              i;
+   u16 *            p;
+ 
+-  if(dsk->db_entry && dsk->db_entry->attribute_id == 0) {
++  if(dsk->db_entry->attribute_id == 0) {
+     close(dsk->fd);
+     dsk->fd = -1;
+     return GETTEMP_NOSENSOR;
+@@ -140,24 +140,15 @@
+   */
+ 
+   /* temperature */
+-  if(dsk->db_entry && dsk->db_entry->attribute_id > 0)
+-    field = ata_search_temperature(values, dsk->db_entry->attribute_id);
+-  else
+-    field = ata_search_temperature(values, DEFAULT_ATTRIBUTE_ID);
++  field = ata_search_temperature(values, dsk->db_entry->attribute_id);
+ 
+   if(field)
+     dsk->value = *(field+3);
+ 
+-  if(dsk->db_entry && dsk->value != -1)
++  if(dsk->value != -1)
+     return GETTEMP_KNOWN;
+-  else {
+-    if(dsk->value != -1) {
+-      return GETTEMP_GUESS;
+-    }
+-    else {
+-      return GETTEMP_UNKNOWN;
+-    }
+-  }
++  else
++    return GETTEMP_UNKNOWN;
+ 
+   /* never reached */
+ }
+--- hddtemp-0.3-beta15.orig/src/hddtemp.h
++++ hddtemp-0.3-beta15/src/hddtemp.h
+@@ -39,8 +39,6 @@
+   GETTEMP_ERROR,            /* Error */
+   GETTEMP_NOT_APPLICABLE,   /* */
+   GETTEMP_UNKNOWN,          /* Drive is not in database */
+-  GETTEMP_GUESS,            /* Not in database, but something was guessed, user must
+-			       check that the temperature returned is correct */
+   GETTEMP_KNOWN,            /* Drive appear in database */
+   GETTEMP_NOSENSOR,         /* Drive appear in database but is known to have no sensor */
+   GETTEMP_DRIVE_SLEEP       /* Drive is sleeping */
+@@ -78,7 +76,7 @@
+ 
+ extern struct bustype *   bus[BUS_TYPE_MAX];
+ extern char               errormsg[MAX_ERRORMSG_SIZE];
+-extern int                tcp_daemon, debug, quiet, wakeup, af_hint;
++extern int                tcp_daemon, debug, quiet, wakeup, af_hint, foreground;
+ extern char               separator;
+ extern long               portnum, syslog_interval;
+ extern char *             listen_addr;
+--- hddtemp-0.3-beta15.orig/src/scsicmds.c
++++ hddtemp-0.3-beta15/src/scsicmds.c
+@@ -147,6 +147,7 @@
+     return 1;
+   else {
+     scsi_fixstring(buffer + 8, 24);
++    buffer[32] = 0;
+     return 0;
+   }
+ }
diff --git a/meta-oe/recipes-support/hddtemp/files/init b/meta-oe/recipes-support/hddtemp/files/init
new file mode 100644
index 0000000..0df8f67
--- /dev/null
+++ b/meta-oe/recipes-support/hddtemp/files/init
@@ -0,0 +1,100 @@
+#!/bin/sh
+#
+# skeleton        example file to build /etc/init.d/ scripts.
+#                This file should be used to construct scripts for /etc/init.d.
+#
+#                Written by Miquel van Smoorenburg <miquels@cistron.nl>.
+#                Modified for Debian GNU/Linux
+#                by Ian Murdock <imurdock@gnu.ai.mit.edu>.
+#
+# Version:        @(#)skeleton  1.8  03-Mar-1998  miquels@cistron.nl
+#
+
+### BEGIN INIT INFO
+# Provides:          hddtemp
+# Required-Start:    $remote_fs $syslog $network
+# Required-Stop:     $remote_fs $syslog $network
+# Default-Start:     2 3 4 5
+# Default-Stop:      0 1 6
+# Short-Description: disk temperature monitoring daemon
+# Description:       hddtemp is a disk temperature monitoring daemon
+### END INIT INFO
+
+PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
+NAME=hddtemp
+DAEMON=/usr/sbin/$NAME
+DESC="disk temperature monitoring daemon"
+
+DISKS="/dev/hd[a-z] /dev/hd[a-z][a-z]"
+DISKS="$DISKS /dev/sd[a-z] /dev/sd[a-z][a-z]"
+DISKS="$DISKS /dev/sr[a-z] /dev/sr[a-z][a-z]"
+INTERFACE="0.0.0.0"
+PORT="7634"
+SEPARATOR="|"
+RUN_SYSLOG="0"
+
+# Reads config file (will override defaults above)
+[ -r /etc/default/hddtemp ] && . /etc/default/hddtemp
+
+if [ -n "$RUN_SYSLOG" ] && [ "$RUN_SYSLOG" != "0" ] ; then
+  SYSLOG_ARG="-S $RUN_SYSLOG"
+fi
+
+if [ "$RUN_DAEMON" = "true" ] || [ "$RUN_DAEMON" = "yes" ] ; then
+  DAEMON_ARG="-d -l $INTERFACE -p $PORT -s $SEPARATOR"
+fi
+
+[ -x "$DAEMON" ] || exit 0
+
+. /lib/lsb/init-functions
+
+case "$1" in
+  start)
+    # master switch
+    if [ -n "$DAEMON_ARG" ] || [ -n "$SYSLOG_ARG" ] ; then
+      log_daemon_msg "Starting $DESC" "$NAME:"
+      CDROMS_LIST=$(sed -ne 's/^drive name:\t\+\(.*\)$/ \/dev\/\1/p' /proc/sys/dev/cdrom/info 2>/dev/null) || :
+      CDROMS_LIST="$CDROMS_LIST $(grep -sl '^ide-scsi ' /proc/ide/hd*/driver | awk -F / '{ print "/dev/"$4 }')"
+      for disk in $DISKS ; do
+        echo $CDROMS_LIST | grep -wq $disk && continue
+        echo $DISKS_NOPROBE | grep -wq $disk && continue
+        if $DAEMON -wn $OPTIONS $disk 2>/dev/null | grep -q '^[0-9]\+$' ; then
+          DISKS_LIST="$DISKS_LIST $disk";
+        fi
+      done
+      if [ -n "$DISKS_LIST" ] || [ -n "$DISKS_NOPROBE" ] ; then
+        start-stop-daemon --start --quiet --exec $DAEMON -- $DAEMON_ARG $SYSLOG_ARG $OPTIONS $DISKS_NOPROBE $DISKS_LIST
+        ret=$?
+        log_progress_msg "$DISKS_NOPROBE$DISKS_LIST"
+        log_end_msg $ret
+      else
+        log_progress_msg "no disks with monitoring capability were found."
+        log_end_msg 0
+      fi
+    fi
+    ;;
+  stop)
+    # master switch
+    if [ "$RUN_DAEMON" = "true" ] || [ "$RUN_DAEMON" = "yes" ] || [ "$RUN_SYSLOG" != "0" ] ; then
+      log_daemon_msg "Stopping $DESC" "$NAME"
+      start-stop-daemon --stop --oknodo --exec $DAEMON --retry 30
+      log_end_msg $?
+    fi
+    ;;
+  force-reload|reload)
+    exit 3
+    ;;
+  restart)
+    $0 stop && $0 start
+    ;;
+  status)
+    status_of_proc $DAEMON $NAME
+    exit $?
+    ;;
+  *)
+    echo "Usage: /etc/init.d/$NAME {start|stop|restart|status}" >&2
+    exit 1
+    ;;
+esac
+
+exit 0
diff --git a/meta-oe/recipes-support/hddtemp/hddtemp_0.3-beta15.bb b/meta-oe/recipes-support/hddtemp/hddtemp_0.3-beta15.bb
new file mode 100644
index 0000000..a0bc4e6
--- /dev/null
+++ b/meta-oe/recipes-support/hddtemp/hddtemp_0.3-beta15.bb
@@ -0,0 +1,31 @@
+SUMMARY = "Hard disk temperature monitor daemon"
+SECTION = "console/network"
+LICENSE = "GPLv2+"
+
+SRC_URI = "http://download.savannah.nongnu.org/releases/hddtemp/hddtemp-0.3-beta15.tar.bz2 \
+           file://hddtemp-no-nls-support.patch \
+           file://hddtemp_0.3-beta15-52.diff \
+           file://hddtemp-0.3-beta15-autodetect-717479.patch \
+           file://hddtemp-db.patch;striplevel=0 \
+           file://hddtemp.db \
+           file://init \
+           "
+
+SRC_URI[md5sum] = "8b829339e1ae9df701684ec239021bb8"
+SRC_URI[sha256sum] = "618541584054093d53be8a2d9e81c97174f30f00af91cb8700a97e442d79ef5b"
+
+LIC_FILES_CHKSUM = "file://GPL-2;md5=eb723b61539feef013de476e68b5c50a"
+
+inherit autotools gettext update-rc.d
+
+FILES_${PN} += "/usr/share/misc/hddtemp.db"
+
+do_install_append() {
+	install -d ${D}/usr/share/misc/
+	install -m 0644 ${WORKDIR}/hddtemp.db ${D}/usr/share/misc/hddtemp.db
+	install -d ${D}${sysconfdir}/init.d
+	install -m 0644 ${WORKDIR}/init ${D}${sysconfdir}/init.d/hddtemp
+}
+
+INITSCRIPT_NAME = "hddtemp"
+INITSCRIPT_PARAMS = "start 99 2 3 4 5 . stop 20 0 1 6 ."
-- 
1.7.9.5



