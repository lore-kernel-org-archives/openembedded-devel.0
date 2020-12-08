Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web10.13657.1607452102356629783
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Dec 2020 10:28:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=g9PP7zMa;
 spf=pass (domain: ossystems.com.br, ip: 209.85.160.178, mailfrom: fabio.berton@ossystems.com.br)
Received: by mail-qt1-f178.google.com with SMTP id c14so3017565qtn.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Dec 2020 10:28:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version:organization
         :content-transfer-encoding;
        bh=P5cTrlO7HtJj0Mt8uAgh4o5dLBQF5fqo7kQXlQcEyqE=;
        b=g9PP7zMa0Dls6eaNdne2ppdVfiwPOtzb1mTRgZvLytkXhZEAIpDnovFY2OSyIvG32U
         dE2zkLrQq3rtjYLvB36JtYijHrZ0Q0u3m/gG3MR0HFGZ+JZ8Tt6sEei8Pu9kgodiq6ae
         iTl30EV6xglazGSVEqSwgkMZz6deQagKtX5NzROY8TLceCjsZoM+gJWUShmMbM6gttm1
         n9umvIdnruf2xlH6zTf2cw3YawugM2MgNVAz4xujtPIXQ4VwKfYXCXV9iGKdXZvcYMzJ
         +0vO+3VyNnh0yq0onTXNL6ihE29Qw5Qjo8XbTM6xHCOjEBwmj7ZGNj6fQrxJ7kYVinZz
         H1TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :organization:content-transfer-encoding;
        bh=P5cTrlO7HtJj0Mt8uAgh4o5dLBQF5fqo7kQXlQcEyqE=;
        b=NGCr2XLRi4lHDzbR+rwMCNkLwbBuzTfvo2r6KmfPSwrPmb+3s5S+R9VgSL29nTQW6x
         Q9QLA3YVTPwGhjAOG7nqW8gS9qz/o1WByAE3RteR0aVphiFRKbUlbBuSi0LvGrqUz5t7
         bP6o2XN8b5HIq6JZZv06SQaOzVldazUO447ABnQDWc5humlGgIGorLtndd1AMmmFU6mg
         KKIJRfhr5nh9h/NB72IjIGN+8HGS98KzzH79IhvD+tlN8yngcehiaIFy0h5GBC690PvY
         K9LgH9XKO8Cby0n30Sty8QIrJAgdNkoGih3VVeimcqRW8Uh1fcJbmsG+WCZpB+6PRhVR
         clyg==
X-Gm-Message-State: AOAM531rxO+DXMJZE46d92sYL2JZfim/zSxpglw/gExr7v30lzfxWlEN
	AyKQtydNuXuPaCxCwZAN1/iqAT1Lskc9dg==
X-Google-Smtp-Source: ABdhPJxrT+IHaf3X8X//DofCTOILu8XBX7wXJIvtG2q0vQW/wJLQ/HDQhTkovPVvxhOVRZiZb+CWWw==
X-Received: by 2002:ac8:5c47:: with SMTP id j7mr30838764qtj.160.1607452100807;
        Tue, 08 Dec 2020 10:28:20 -0800 (PST)
Return-Path: <fabio.berton@ossystems.com.br>
Received: from pikachu.lab.ossystems (200-180-244-15.user3p.brasiltelecom.net.br. [200.180.244.15])
        by smtp.gmail.com with ESMTPSA id d11sm15271702qta.64.2020.12.08.10.28.19
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Dec 2020 10:28:20 -0800 (PST)
From: "Fabio Berton" <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] beep: Add recipe for version 1.2.2
Date: Tue,  8 Dec 2020 15:28:16 -0300
Message-Id: <20201208182816.3652210-1-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Content-Transfer-Encoding: 8bit

Based on this recipe:
https://github.com/kraj/meta-slugos/blob/master/recipes-slugos/beep/beep_1.2.2.bb

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 meta-oe/recipes-extended/beep/beep_1.2.2.bb   |  25 +++
 .../beep/files/linux-input.patch              | 155 ++++++++++++++++++
 2 files changed, 180 insertions(+)
 create mode 100644 meta-oe/recipes-extended/beep/beep_1.2.2.bb
 create mode 100644 meta-oe/recipes-extended/beep/files/linux-input.patch

diff --git a/meta-oe/recipes-extended/beep/beep_1.2.2.bb b/meta-oe/recipes-extended/beep/beep_1.2.2.bb
new file mode 100644
index 000000000..cafc86964
--- /dev/null
+++ b/meta-oe/recipes-extended/beep/beep_1.2.2.bb
@@ -0,0 +1,25 @@
+DESCRIPTION = "beep is a command line tool for linux that beeps the PC speaker"
+LICENSE = "GPL-2.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
+
+SRC_URI = "\
+    http://johnath.com/beep/beep-${PV}.tar.gz \
+    file://linux-input.patch \
+"
+
+SRC_URI[sha256sum] = "5c0445dac43950b7c7c3f235c6fb21f620ab3fd2f3aafaf09896e5730fcf49a1"
+
+S = "${WORKDIR}/${BPN}-${PV}"
+
+EXTRA_OEMAKE += 'CC="${CC}"'
+EXTRA_OEMAKE += 'FLAGS="${CFLAGS} ${LDFLAGS}"'
+
+do_configure[noexec] = "1"
+
+do_compile() {
+   oe_runmake
+}
+
+do_install() {
+	install -Dm 0755 ${B}/${PN} ${D}${bindir}/${PN}
+}
diff --git a/meta-oe/recipes-extended/beep/files/linux-input.patch b/meta-oe/recipes-extended/beep/files/linux-input.patch
new file mode 100644
index 000000000..1b38ba72a
--- /dev/null
+++ b/meta-oe/recipes-extended/beep/files/linux-input.patch
@@ -0,0 +1,155 @@
+# the diff between Alessandro Zummo's copy of beep.c and the original
+# one...
+
+--- beep-1.2.2/beep.c.orig	2006-01-29 12:13:36.994560551 -0800
++++ beep-1.2.2/beep.c	2006-01-29 12:35:02.950558713 -0800
+@@ -26,6 +26,7 @@
+ #include <sys/ioctl.h>
+ #include <sys/types.h>
+ #include <linux/kd.h>
++#include <linux/input.h>
+ 
+ /* I don't know where this number comes from, I admit that freely.  A 
+    wonderful human named Raine M. Ekman used it in a program that played
+@@ -86,18 +87,28 @@ typedef struct beep_parms_t {
+   struct beep_parms_t *next;  /* in case -n/--new is used. */
+ } beep_parms_t;
+ 
++enum { BEEP_TYPE_CONSOLE, BEEP_TYPE_EVDEV };
++
+ /* Momma taught me never to use globals, but we need something the signal 
+    handlers can get at.*/
+ int console_fd = -1;
++int console_type = BEEP_TYPE_CONSOLE;
++char *console_device = NULL;
++
++void do_beep(int freq);
+ 
+ /* If we get interrupted, it would be nice to not leave the speaker beeping in
+    perpetuity. */
+ void handle_signal(int signum) {
++  
++  if(console_device)
++    free(console_device);
++    
+   switch(signum) {
+   case SIGINT:
+     if(console_fd >= 0) {
+       /* Kill the sound, quit gracefully */
+-      ioctl(console_fd, KIOCSOUND, 0);
++      do_beep(0);
+       close(console_fd);
+       exit(signum);
+     } else {
+@@ -110,7 +121,7 @@ void handle_signal(int signum) {
+ /* print usage and exit */
+ void usage_bail(const char *executable_name) {
+   printf("Usage:\n%s [-f freq] [-l length] [-r reps] [-d delay] "
+-	 "[-D delay] [-s] [-c]\n",
++	 "[-D delay] [-s] [-c] [-e device]\n",
+ 	 executable_name);
+   printf("%s [Options...] [-n] [--new] [Options...] ... \n", executable_name);
+   printf("%s [-h] [--help]\n", executable_name);
+@@ -141,11 +152,12 @@ void usage_bail(const char *executable_n
+ void parse_command_line(int argc, char **argv, beep_parms_t *result) {
+   int c;
+ 
+-  struct option opt_list[4] = {{"help", 0, NULL, 'h'},
++  struct option opt_list[] = {{"help", 0, NULL, 'h'},
+ 			       {"version", 0, NULL, 'V'},
+ 			       {"new", 0, NULL, 'n'},
++			       {"device", 1, NULL, 'e'},
+ 			       {0,0,0,0}};
+-  while((c = getopt_long(argc, argv, "f:l:r:d:D:schvVn", opt_list, NULL))
++  while((c = getopt_long(argc, argv, "f:l:r:d:D:schvVne:", opt_list, NULL))
+ 	!= EOF) {
+     int argval = -1;    /* handle parsed numbers for various arguments */
+     float argfreq = -1; 
+@@ -207,6 +219,9 @@ void parse_command_line(int argc, char *
+       result->next->next       = NULL;
+       result = result->next; /* yes, I meant to do that. */
+       break;
++    case 'e' : /* also --device */
++      console_device = strdup(optarg);
++      break;
+     case 'h' : /* notice that this is also --help */
+     default :
+       usage_bail(argv[0]);
+@@ -214,26 +229,61 @@ void parse_command_line(int argc, char *
+   }
+ }  
+ 
++void do_beep(int freq)
++{
++  if (console_type == BEEP_TYPE_CONSOLE)
++  {
++    if(ioctl(console_fd, KIOCSOUND, freq != 0
++      ? (int)(CLOCK_TICK_RATE/freq)
++      : freq) < 0) {
++      printf("\a");  /* Output the only beep we can, in an effort to fall back on usefulness */
++      perror("ioctl");
++    }
++  }
++  else
++  {
++     /* BEEP_TYPE_EVDEV */
++     struct input_event e;
++ 
++     e.type = EV_SND;
++     e.code = SND_TONE;
++     e.value = freq;
++  
++     write(console_fd, &e, sizeof(struct input_event));
++  }
++}
++
+ void play_beep(beep_parms_t parms) {
+   int i; /* loop counter */
+ 
+   /* try to snag the console */
+-  if((console_fd = open("/dev/console", O_WRONLY)) == -1) {
+-    fprintf(stderr, "Could not open /dev/console for writing.\n");
++
++  if(console_device)
++    console_fd = open(console_device, O_WRONLY);
++  else
++    if((console_fd = open("/dev/input/event0", O_WRONLY)) == -1)
++      if((console_fd = open("/dev/tty0", O_WRONLY)) == -1)
++        console_fd = open("/dev/vc/0", O_WRONLY);
++      
++  if(console_fd == -1) {
++    fprintf(stderr, "Could not open %s for writing\n",
++      console_device != NULL ? console_device : "/dev/tty0 or /dev/vc/0");
+     printf("\a");  /* Output the only beep we can, in an effort to fall back on usefulness */
+     perror("open");
+     exit(1);
+   }
+   
++  if (ioctl(console_fd, EVIOCGSND(0)) != -1)
++    console_type = BEEP_TYPE_EVDEV;
++  else
++    console_type = BEEP_TYPE_CONSOLE;
++  
+   /* Beep */
+   for (i = 0; i < parms.reps; i++) {                    /* start beep */
+-    if(ioctl(console_fd, KIOCSOUND, (int)(CLOCK_TICK_RATE/parms.freq)) < 0) {
+-      printf("\a");  /* Output the only beep we can, in an effort to fall back on usefulness */
+-      perror("ioctl");
+-    }
++    do_beep(parms.freq);
+     /* Look ma, I'm not ansi C compatible! */
+     usleep(1000*parms.length);                          /* wait...    */
+-    ioctl(console_fd, KIOCSOUND, 0);                    /* stop beep  */
++    do_beep(0);
+     if(parms.end_delay || (i+1 < parms.reps))
+        usleep(1000*parms.delay);                        /* wait...    */
+   }                                                     /* repeat.    */
+@@ -295,5 +345,8 @@ int main(int argc, char **argv) {
+     parms = next;
+   }
+ 
++  if(console_device)
++    free(console_device);
++    
+   return EXIT_SUCCESS;
+ }
-- 
2.29.2

