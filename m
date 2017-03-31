Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id AD83A77E33
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 16:42:54 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id 81so18578887pgh.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 09:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=86htP00kFgRVmQqbmUg4XzItS4ShuB4XTSlWBCw0IYg=;
	b=oS/tC8NMlMLTu++jJ4+tHIrFPf3mUuEPAlge0qNghSpmHX5H22ocnOceA+PS4vcjvJ
	ZWDbidWEugFm5Zx5VEng722EJ2Y14HyuLqUUCuvJRgfHBGkVxzQiLc70rIsYMAIsSP9M
	s+RfCBDfCdCvPAY4qB/H+VRSiVN1RIzvlnmjQRFsK9FeapX3jIkVIxqMHK1LksS1HjRe
	hqvKKBopaH7x/xzAW0/9BI0CaIGaG60XFZb3B2KIAEVSsOqaICUWvs9ZphhWqPFCXo07
	k6DnbTiwPtdp5hq8MypLtJa73EskBF+6nCQ4wG9eY6Cq19p67w2yz0e4VG9ITdLIYRlu
	9JgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=86htP00kFgRVmQqbmUg4XzItS4ShuB4XTSlWBCw0IYg=;
	b=D87DBOsE6sy3kpBO8WT9rOTsU6L7SzGN1S/+2MCskDWgBWqLnd89LbqfW0N022tirU
	MytVL4yuszS/psFgcXEn9TU88Ofx8tcEG8ePIIz7Jxq7pzj0BmcXSefJQbhJh4a2zmb3
	j7Aa6P59INB17kgsCwgDqZrVg/k8U+Q6V/oGxmnGJOR8HQWr4lYijQT5Q1LgDIW5MUor
	CO5xzDGvG4lnW9E/lUp5YgO62EDqPAFgOMeGZmUbfx8+DMDjiWpNXbRgMZxdnb7hpXNO
	lc8JwZs7q0qgOwgY8DarY91Pz+nvDPnwdubTFDhT1pVLep/T4bDWJIh/2IXGjt5EmHsq
	8Duw==
X-Gm-Message-State: AFeK/H1KCDKvNy2NiY60R783DpC72BQpt0xONn+yOdXGNHYN+0rw14GpOB8lrkBLsqxksQ==
X-Received: by 10.99.137.66 with SMTP id v63mr4168863pgd.183.1490978575427;
	Fri, 31 Mar 2017 09:42:55 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	a5sm11569706pfh.124.2017.03.31.09.42.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Mar 2017 09:42:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 31 Mar 2017 09:42:05 -0700
Message-Id: <20170331164247.5052-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.1
Subject: [meta-oe][PATCH 01/43] gpm: Update to use git src uri
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
X-List-Received-Date: Fri, 31 Mar 2017 16:42:55 -0000

Additional patches are upstream to fix build with gcc6 and clang
Add systemd unit file

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../gpm/gpm-1.99.7/eglibc-2.17.patch               |  12 -
 .../gpm/gpm-1.99.7/remove_nested_functions.patch   | 326 ---------------------
 meta-oe/recipes-support/gpm/gpm/gpm.service.in     |   9 +
 .../recipes-support/gpm/{gpm-1.99.7 => gpm}/init   |   0
 .../gpm/{gpm-1.99.7 => gpm}/no-docs.patch          |   2 +-
 .../gpm/{gpm-1.99.7 => gpm}/processcreds.patch     |   0
 meta-oe/recipes-support/gpm/gpm_1.99.7.bb          |  53 ----
 meta-oe/recipes-support/gpm/gpm_git.bb             |  44 +++
 8 files changed, 54 insertions(+), 392 deletions(-)
 delete mode 100644 meta-oe/recipes-support/gpm/gpm-1.99.7/eglibc-2.17.patch
 delete mode 100644 meta-oe/recipes-support/gpm/gpm-1.99.7/remove_nested_functions.patch
 create mode 100644 meta-oe/recipes-support/gpm/gpm/gpm.service.in
 rename meta-oe/recipes-support/gpm/{gpm-1.99.7 => gpm}/init (100%)
 rename meta-oe/recipes-support/gpm/{gpm-1.99.7 => gpm}/no-docs.patch (93%)
 rename meta-oe/recipes-support/gpm/{gpm-1.99.7 => gpm}/processcreds.patch (100%)
 delete mode 100644 meta-oe/recipes-support/gpm/gpm_1.99.7.bb
 create mode 100644 meta-oe/recipes-support/gpm/gpm_git.bb

diff --git a/meta-oe/recipes-support/gpm/gpm-1.99.7/eglibc-2.17.patch b/meta-oe/recipes-support/gpm/gpm-1.99.7/eglibc-2.17.patch
deleted file mode 100644
index e43bdcb22..000000000
--- a/meta-oe/recipes-support/gpm/gpm-1.99.7/eglibc-2.17.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-Upstream-Status: pending
-
---- gpm-1.99.7.orig/src/daemon/open_console.c	2008-07-24 12:33:05.000000000 +0200
-+++ gpm-1.99.7/src/daemon/open_console.c	2013-01-10 12:39:47.975461947 +0100
-@@ -23,6 +23,7 @@
- #include <fcntl.h>              /* open and co.  */
- #include <sys/stat.h>           /* stat() */
- #include <sys/ioctl.h>          /* ioctl() */
-+#include <sys/types.h>          /* major() */
- 
- /* Linux specific (to be outsourced in gpm2 */
- #include <linux/serial.h>       /* for serial console check */
diff --git a/meta-oe/recipes-support/gpm/gpm-1.99.7/remove_nested_functions.patch b/meta-oe/recipes-support/gpm/gpm-1.99.7/remove_nested_functions.patch
deleted file mode 100644
index d2d6cb8a8..000000000
--- a/meta-oe/recipes-support/gpm/gpm-1.99.7/remove_nested_functions.patch
+++ /dev/null
@@ -1,326 +0,0 @@
-Remove nested functions, they are not available in all compilers
-e.g. clang will not support them.
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Index: gpm-1.99.7/src/drivers/summa/i.c
-===================================================================
---- gpm-1.99.7.orig/src/drivers/summa/i.c
-+++ gpm-1.99.7/src/drivers/summa/i.c
-@@ -36,6 +36,28 @@ extern int summamaxy;
- 
- extern signed char summaid;
- 
-+static void resetsumma(int fd)
-+{
-+   write(fd, 0, 1);          /* Reset */
-+   usleep(400000);           /* wait */
-+}
-+
-+static int waitsumma(int fd)
-+{
-+   struct timeval timeout;
-+
-+   fd_set readfds;
-+
-+   int err;
-+
-+   FD_ZERO(&readfds);
-+   FD_SET(fd, &readfds);
-+   timeout.tv_sec = 0;
-+   timeout.tv_usec = 200000;
-+   err = select(FD_SETSIZE, &readfds, NULL, NULL, &timeout);
-+   return (err);
-+}
-+
- Gpm_Type *I_summa(int fd, unsigned short flags, struct Gpm_Type *type, int argc,
-                   char **argv)
- {
-@@ -43,24 +65,6 @@ Gpm_Type *I_summa(int fd, unsigned short
-    flags = argc = 0;            /* FIXME: 1.99.13 */
-    argv = NULL;
- 
--   void resetsumma() {
--      write(fd, 0, 1);          /* Reset */
--      usleep(400000);           /* wait */
--   }
--   int waitsumma() {
--      struct timeval timeout;
--
--      fd_set readfds;
--
--      int err;
--
--      FD_ZERO(&readfds);
--      FD_SET(fd, &readfds);
--      timeout.tv_sec = 0;
--      timeout.tv_usec = 200000;
--      err = select(FD_SETSIZE, &readfds, NULL, NULL, &timeout);
--      return (err);
--   }
-    int err;
- 
-    char buffer[255];
-@@ -91,7 +95,7 @@ Gpm_Type *I_summa(int fd, unsigned short
-     */
-    setspeed(fd, 1200, 9600, 1,
-             B9600 | CS8 | CREAD | CLOCAL | HUPCL | PARENB | PARODD);
--   resetsumma();
-+   resetsumma(fd);
- 
-    write(fd, SS_PROMPT_MODE, strlen(SS_PROMPT_MODE));
- 
-@@ -103,7 +107,7 @@ Gpm_Type *I_summa(int fd, unsigned short
-        * read the Summa Firm-ID 
-        */
-       write(fd, SS_FIRMID, strlen(SS_FIRMID));
--      err = waitsumma();
-+      err = waitsumma(fd);
-       if(!((err == -1) || (!err))) {
-          summaid = 10;          /* Original Summagraphics */
-          read(fd, buffer, 255); /* Read Firm-ID */
-@@ -111,14 +115,14 @@ Gpm_Type *I_summa(int fd, unsigned short
-    }
- 
-    if(summaid < 0) {            /* Genius-test */
--      resetsumma();
-+      resetsumma(fd);
-       write(fd, GEN_MMSERIES, 1);
-       write(fd, &GEN_MODELL, 1);        /* Read modell */
--      err = waitsumma();
-+      err = waitsumma(fd);
-       if(!((err == -1) || (!err))) {    /* read Genius-ID */
--         err = waitsumma();
-+         err = waitsumma(fd);
-          if(!((err == -1) || (!err))) {
--            err = waitsumma();
-+            err = waitsumma(fd);
-             if(!((err == -1) || (!err))) {
-                read(fd, &config, 1);
-                summaid = (config[0] & 224) >> 5;        /* genius tablet-id
-@@ -135,14 +139,14 @@ Gpm_Type *I_summa(int fd, unsigned short
-     * unknown tablet ?
-     */
-    if((summaid < 0) || (summaid == 11)) {
--      resetsumma();
-+      resetsumma(fd);
-       write(fd, SS_BINARY_FMT SS_PROMPT_MODE, 3);
-    }
- 
-    /*
-     * read tablet size 
-     */
--   err = waitsumma();
-+   err = waitsumma(fd);
-    if(!((err == -1) || (!err)))
-       read(fd, buffer, sizeof(buffer));
-    write(fd, SS_READCONFIG, 1);
-Index: gpm-1.99.7/src/drivers/wacom/i.c
-===================================================================
---- gpm-1.99.7.orig/src/drivers/wacom/i.c
-+++ gpm-1.99.7/src/drivers/wacom/i.c
-@@ -30,10 +30,6 @@
- #include "message.h"            /* gpm_report */
- #include "wacom.h"              /* wacom */
- 
--Gpm_Type *I_wacom(int fd, unsigned short flags, struct Gpm_Type *type, int argc,
--                  char **argv)
--{
--
- /* wacom graphire tablet */
- #define UD_RESETBAUD     "\r$"  /* reset baud rate to default (wacom V) */
-    /*
-@@ -45,83 +41,91 @@ Gpm_Type *I_wacom(int fd, unsigned short
- #define UD_COORD         "~C\r" /* Request max coordinates */
- #define UD_STOP          "\nSP\r"       /* stop sending coordinates */
- 
--   flags = 0;                   /* FIXME: 1.99.13 */
- 
--   void reset_wacom() {
--      /*
--       * Init Wacom communication; this is modified from xf86Wacom.so module 
--       */
--      /*
--       * Set speed to 19200 
--       */
--      setspeed(fd, 1200, 19200, 0, B19200 | CS8 | CREAD | CLOCAL | HUPCL);
--      /*
--       * Send Reset Baudrate Command 
--       */
--      write(fd, UD_RESETBAUD, strlen(UD_RESETBAUD));
--      usleep(250000);
--      /*
--       * Send Reset Command 
--       */
--      write(fd, UD_RESET, strlen(UD_RESET));
--      usleep(75000);
--      /*
--       * Set speed to 9600bps 
--       */
--      setspeed(fd, 1200, 9600, 0, B9600 | CS8 | CREAD | CLOCAL | HUPCL);
--      /*
--       * Send Reset Command 
--       */
--      write(fd, UD_RESET, strlen(UD_RESET));
--      usleep(250000);
--      write(fd, UD_STOP, strlen(UD_STOP));
--      usleep(100000);
--   }
-+static void reset_wacom(int fd)
-+{
-+   /*
-+    * Init Wacom communication; this is modified from xf86Wacom.so module 
-+    */
-+   /*
-+    * Set speed to 19200 
-+    */
-+   setspeed(fd, 1200, 19200, 0, B19200 | CS8 | CREAD | CLOCAL | HUPCL);
-+   /*
-+    * Send Reset Baudrate Command 
-+    */
-+   write(fd, UD_RESETBAUD, strlen(UD_RESETBAUD));
-+   usleep(250000);
-+   /*
-+    * Send Reset Command 
-+    */
-+   write(fd, UD_RESET, strlen(UD_RESET));
-+   usleep(75000);
-+   /*
-+    * Set speed to 9600bps 
-+    */
-+   setspeed(fd, 1200, 9600, 0, B9600 | CS8 | CREAD | CLOCAL | HUPCL);
-+   /*
-+    * Send Reset Command 
-+    */
-+   write(fd, UD_RESET, strlen(UD_RESET));
-+   usleep(250000);
-+   write(fd, UD_STOP, strlen(UD_STOP));
-+   usleep(100000);
-+}
- 
--   int wait_wacom() {
--      /*
--       *  Wait up to 200 ms for Data from Tablet.
--       *  Do not read that data.
--       *  Give back 0 on timeout condition, -1 on error and 1 for DataPresent
--       */
--      struct timeval timeout;
--
--      fd_set readfds;
--
--      int err;
--
--      FD_ZERO(&readfds);
--      FD_SET(fd, &readfds);
--      timeout.tv_sec = 0;
--      timeout.tv_usec = 200000;
--      err = select(FD_SETSIZE, &readfds, NULL, NULL, &timeout);
--      return ((err > 0) ? 1 : err);
--   }
-+static int wait_wacom(int fd)
-+{
-+   /*
-+    *  Wait up to 200 ms for Data from Tablet.
-+    *  Do not read that data.
-+    *  Give back 0 on timeout condition, -1 on error and 1 for DataPresent
-+    */
-+   struct timeval timeout;
- 
--   char buffer[50], *p;
-+   fd_set readfds;
- 
--   int RequestData(char *cmd) {
--      int err;
-+   int err;
- 
--      /*
--       * Send cmd if not null, and get back answer from tablet.
--       * Get Data to buffer until full or timeout.
--       * Give back 0 for timeout and !0 for buffer full
--       */
--      if(cmd)
--         write(fd, cmd, strlen(cmd));
--      memset(buffer, 0, sizeof(buffer));
--      p = buffer;
--      err = wait_wacom();
--      while(err != -1 && err && (p - buffer) < (int) (sizeof(buffer) - 1)) {
--         p += read(fd, p, (sizeof(buffer) - 1) - (p - buffer));
--         err = wait_wacom();
--      }
--      /*
--       * return 1 for buffer full 
--       */
--      return ((strlen(buffer) >= (sizeof(buffer) - 1)) ? !0 : 0);
-+   FD_ZERO(&readfds);
-+   FD_SET(fd, &readfds);
-+   timeout.tv_sec = 0;
-+   timeout.tv_usec = 200000;
-+   err = select(FD_SETSIZE, &readfds, NULL, NULL, &timeout);
-+   return ((err > 0) ? 1 : err);
-+}
-+
-+static int RequestData(int fd, char *cmd, char *buffer)
-+{
-+   int err;
-+   char *p;
-+   /*
-+    * Send cmd if not null, and get back answer from tablet.
-+    * Get Data to buffer until full or timeout.
-+    * Give back 0 for timeout and !0 for buffer full
-+    */
-+   if(cmd)
-+      write(fd, cmd, strlen(cmd));
-+   memset(buffer, 0, sizeof(buffer));
-+   p = buffer;
-+   err = wait_wacom(fd);
-+   while(err != -1 && err && (p - buffer) < (int) (sizeof(buffer) - 1)) {
-+      p += read(fd, p, (sizeof(buffer) - 1) - (p - buffer));
-+      err = wait_wacom(fd);
-    }
-+   /*
-+    * return 1 for buffer full 
-+    */
-+   return ((strlen(buffer) >= (sizeof(buffer) - 1)) ? !0 : 0);
-+}
-+
-+Gpm_Type *I_wacom(int fd, unsigned short flags, struct Gpm_Type *type, int argc,
-+                  char **argv)
-+{
-+
-+   flags = 0;                   /* FIXME: 1.99.13 */
-+
-+   char buffer[50];
- 
-    /*
-     * We do both modes, relative and absolute, with the same function.
-@@ -143,17 +147,17 @@ Gpm_Type *I_wacom(int fd, unsigned short
-    };
-    parse_argv(optioninfo, argc, argv);
-    type->absolute = WacomAbsoluteWanted;
--   reset_wacom();
-+   reset_wacom(fd);
- 
-    /*
-     * "Flush" input queque 
-     */
--   while(RequestData(NULL)) ;
-+   while(RequestData(fd, NULL, buffer)) ;
- 
-    /*
-     * read WACOM-ID 
-     */
--   RequestData(UD_FIRMID);
-+   RequestData(fd, UD_FIRMID, buffer);
- 
-    /*
-     * Search for matching modell 
-@@ -180,7 +184,7 @@ Gpm_Type *I_wacom(int fd, unsigned short
-     * read Wacom max size 
-     */
-    if(WacomModell != (-1) && (!wcmodell[WacomModell].maxX)) {
--      RequestData(UD_COORD);
-+      RequestData(fd, UD_COORD, buffer);
-       sscanf(buffer + 2, "%d,%d", &wmaxx, &wmaxy);
-       wmaxx = (wmaxx - wcmodell[WacomModell].border);
-       wmaxy = (wmaxy - wcmodell[WacomModell].border);
diff --git a/meta-oe/recipes-support/gpm/gpm/gpm.service.in b/meta-oe/recipes-support/gpm/gpm/gpm.service.in
new file mode 100644
index 000000000..ee6c040fa
--- /dev/null
+++ b/meta-oe/recipes-support/gpm/gpm/gpm.service.in
@@ -0,0 +1,9 @@
+[Unit]
+Description=Virtual console mouse server
+
+[Service]
+Type=forking
+ExecStart=@bindir@/gpm -m /dev/input/mice -t imps2
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-oe/recipes-support/gpm/gpm-1.99.7/init b/meta-oe/recipes-support/gpm/gpm/init
similarity index 100%
rename from meta-oe/recipes-support/gpm/gpm-1.99.7/init
rename to meta-oe/recipes-support/gpm/gpm/init
diff --git a/meta-oe/recipes-support/gpm/gpm-1.99.7/no-docs.patch b/meta-oe/recipes-support/gpm/gpm/no-docs.patch
similarity index 93%
rename from meta-oe/recipes-support/gpm/gpm-1.99.7/no-docs.patch
rename to meta-oe/recipes-support/gpm/gpm/no-docs.patch
index f10217a94..3faef84ee 100644
--- a/meta-oe/recipes-support/gpm/gpm-1.99.7/no-docs.patch
+++ b/meta-oe/recipes-support/gpm/gpm/no-docs.patch
@@ -11,7 +11,7 @@ Index: gpm-1.99.7/Makefile.in
  # user-overridable flags, but it's also all the implicit rule looks at.
  # missing ?
  
--SUBDIRS = src doc contrib gpm2
+-SUBDIRS = src doc contrib
 +SUBDIRS = src
  
  
diff --git a/meta-oe/recipes-support/gpm/gpm-1.99.7/processcreds.patch b/meta-oe/recipes-support/gpm/gpm/processcreds.patch
similarity index 100%
rename from meta-oe/recipes-support/gpm/gpm-1.99.7/processcreds.patch
rename to meta-oe/recipes-support/gpm/gpm/processcreds.patch
diff --git a/meta-oe/recipes-support/gpm/gpm_1.99.7.bb b/meta-oe/recipes-support/gpm/gpm_1.99.7.bb
deleted file mode 100644
index bbb8c28ac..000000000
--- a/meta-oe/recipes-support/gpm/gpm_1.99.7.bb
+++ /dev/null
@@ -1,53 +0,0 @@
-DESCRIPTION = "GPM (General Purpose Mouse) is a mouse server \
-for the console and xterm, with sample clients included \
-(emacs, etc)."
-SECTION = "console/utils"
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://gpm2/core/main.c;endline=19;md5=66d3c205c4e7ee5704b2ee351dfed72f"
-
-PR = "r2"
-
-DEPENDS = "ncurses"
-
-SRC_URI = "ftp://arcana.linux.it/pub/gpm/gpm-${PV}.tar.bz2 \
-           file://no-docs.patch \
-           file://processcreds.patch \
-           file://eglibc-2.17.patch \
-           file://remove_nested_functions.patch \
-           file://init"
-
-inherit autotools-brokensep update-rc.d
-
-INITSCRIPT_NAME = "gpm"
-INITSCRIPT_PARAMS = "defaults"
-
-#export LIBS = "-lm"
-
-# all fields are /* FIXME: gpm 1.99.13 */
-# gpm-1.99.7/src/lib/libhigh.c:171:43: error: parameter 'clientdata' set but not used [-Werror=unused-but-set-parameter]
-# gpm-1.99.7/src/lib/report-lib.c:28:21: error: parameter 'line' set but not used [-Werror=unused-but-set-parameter]
-# gpm-1.99.7/src/lib/report-lib.c:28:33: error: parameter 'file' set but not used [-Werror=unused-but-set-parameter]
-# gpm-1.99.7/src/drivers/empty/i.c:26:23: error: parameter 'fd' set but not used [-Werror=unused-but-set-parameter]
-# gpm-1.99.7/src/drivers/empty/i.c:26:42: error: parameter 'flags' set but not used [-Werror=unused-but-set-parameter]
-# gpm-1.99.7/src/drivers/etouch/i.c:34:43: error: parameter 'flags' set but not used [-Werror=unused-but-set-parameter]
-# gpm-1.99.7/src/drivers/msc/r.c:32:12: error: variable 'dy' set but not used [-Werror=unused-but-set-variable]
-# gpm-1.99.7/src/drivers/msc/r.c:32:8: error: variable 'dx' set but not used [-Werror=unused-but-set-variable]
-# cc1: all warnings being treated as errors
-CFLAGS += "-Wno-extra -Wno-error=unused-but-set-parameter -Wno-error=unused-but-set-variable"
-
-# twiddler is WIP in 1.99.7 and probably not worth fixing (a lot of changes in gpm-2-dev after 1.99.7
-# gpm-1.99.7/src/drivers/twid/twiddler.c:503:14: error: cast to pointer from integer of different size [-Werror=int-to-pointer-cast]
-# /gpm-1.99.7/src/mice.c:221:5: error: (near initialization for 'mice[32].init') [-Werror]
-CFLAGS += "-Wno-error=int-to-pointer-cast -Wno-error"
-
-do_install () {
-    oe_runmake 'DESTDIR=${D}' install
-    install -m 0644 src/headers/gpm.h ${D}${includedir}
-    install -d ${D}/${sysconfdir}/init.d
-    install -m 0755 ${WORKDIR}/init ${D}/${sysconfdir}/init.d/gpm
-    cd ${D}${libdir} && ln -sf libgpm.so.1.19.0 libgpm.so.1
-}
-SRC_URI[md5sum] = "9fdddf5f53cb11d40bb2bb671d3ac544"
-SRC_URI[sha256sum] = "6071378b24494e36ca3ef6377606e7e565040413c86704753a162d2180af32ee"
-
-FILES_${PN} += "${datadir}/emacs"
diff --git a/meta-oe/recipes-support/gpm/gpm_git.bb b/meta-oe/recipes-support/gpm/gpm_git.bb
new file mode 100644
index 000000000..4c0e9434d
--- /dev/null
+++ b/meta-oe/recipes-support/gpm/gpm_git.bb
@@ -0,0 +1,44 @@
+DESCRIPTION = "GPM (General Purpose Mouse) is a mouse server \
+for the console and xterm, with sample clients included \
+(emacs, etc)."
+SECTION = "console/utils"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=18810669f13b87348459e611d31ab760"
+
+PV = "1.99.7+git${SRCREV}"
+PR = "r2"
+SRCREV = "1fd19417b8a4dd9945347e98dfa97e4cfd798d77"
+
+DEPENDS = "ncurses"
+
+SRC_URI = "git://github.com/telmich/gpm;protocol=git \
+           file://no-docs.patch \
+           file://processcreds.patch \
+           file://gpm.service.in \
+           file://init"
+
+S = "${WORKDIR}/git"
+
+inherit autotools-brokensep update-rc.d systemd
+
+INITSCRIPT_NAME = "gpm"
+INITSCRIPT_PARAMS = "defaults"
+
+do_configure_prepend() {
+    (cd ${S};./autogen.sh;cd -)
+}
+
+do_install_append () {
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+        install -d ${D}${systemd_system_unitdir}
+        sed 's:@bindir@:${bindir}:' < ${WORKDIR}/gpm.service.in >${D}${systemd_system_unitdir}/gpm.service
+    fi
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
+        install -D -m 0755 ${WORKDIR}/init ${D}/${sysconfdir}/init.d/gpm
+    fi
+    install -D -m 0644 ${S}/src/headers/gpm.h ${D}${includedir}/gpm.h
+}
+
+SYSTEMD_SERVICE_${PN} = "gpm.service"
+
+FILES_${PN} += "${datadir}/emacs"
-- 
2.12.1


