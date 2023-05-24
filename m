Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4943C77B7C
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 07:53:23 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.3582.1684914794867149602
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 May 2023 00:53:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=LB3HGhyr;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-510d9218506so1566982a12.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 May 2023 00:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684914793; x=1687506793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3haMN8ZMWi1cyZqBiqT7E6razY8r5avz9cmUHpzFGD0=;
        b=LB3HGhyrLI/GpurMSH2i/0Tk7ikWGyhI2i636lFU9NK0dP6F0gq4k5kc8Y+NVIjxcY
         gjdHqmR1nzJ44KZ1fK6pekg4c4AdY4xxpLcxW3El7qNkVYTjyyrLOhJcEQn+NHwRATx5
         Y54cBXlrbiAtRA2tiWthkN0WgTYd+H8jo4UFa+JZXdsfC1LYB5zXmWl4NzTcn5Z9f6vm
         GrRUDhnlk1stxrKHo11YR8OxBici2PZWCk7an9HNVsPQEWEm+BnvBQ+i9JO+he8n55mZ
         Y/7XGFdZzRs7lArG3VKZJJwOzF9xw9CeRxfnGCDpG55NDqcaYcPC6uUtffbaA16rldDP
         EX8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684914793; x=1687506793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3haMN8ZMWi1cyZqBiqT7E6razY8r5avz9cmUHpzFGD0=;
        b=SYC+qbLfPO+HkRESys4Zwz/lMvyZ5lNraRoVqIQ6iBeiVCUjK7l+tkUImNiy4Yam4G
         yjlRd4lzG8c34Drx3e551PJOt7AXdE4f983dGFSpj5SRo26wiAeL0GEmVN3Vkv7odFtw
         ZRrBo++D7b/ziHtFtMHUqW8oZxHBG2U4n+4dR/DFiMuz0h/5pQeJsXACdBdKZ4LcXLLk
         jN2aNixgQLDrM4MCNlQOfsf7+97gEy6F4kPmAwI2kenUACy+omJhJH6FMAGC2ldddCGw
         hGxiyMbHsOUE4gLQ9O8TOHltWrbjuceM1ch7U49gVg4VkFLRyfYTeyHK7T80artUpzAn
         2oZQ==
X-Gm-Message-State: AC+VfDy0K1gz55FJSKKYsh+FYSC9Y0wZYP/W384CEDMgzzHQbFhKYfDW
	hykRuABtWp+OHocdbIrWOpQcbPrl9A8=
X-Google-Smtp-Source: ACHHUZ6TO9uu4VAsI87YngyuMgP+6rBU6foA+xxFQWTjlHtkyAqgRWBHxJyhg9a6Y62Dwp5CS6/1qw==
X-Received: by 2002:a05:6402:1252:b0:50d:89d5:bf95 with SMTP id l18-20020a056402125200b0050d89d5bf95mr1316268edw.20.1684914793138;
        Wed, 24 May 2023 00:53:13 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id e20-20020aa7d7d4000000b00501d73cfc86sm4782547eds.9.2023.05.24.00.53.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 00:53:12 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 17/20] beep: remove unused linux-input.patch
Date: Wed, 24 May 2023 09:52:50 +0200
Message-Id: <20230524075253.1033593-17-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230524075253.1033593-1-Martin.Jansa@gmail.com>
References: <20230524075253.1033593-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 May 2023 07:53:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102771

* it was removed from SRC_URI in:
  https://git.openembedded.org/meta-openembedded/commit/?id=19c244dd39b9896eed9d7d8a2a033e60839cff86

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../beep/files/linux-input.patch              | 155 ------------------
 1 file changed, 155 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/beep/files/linux-input.patch

diff --git a/meta-oe/recipes-extended/beep/files/linux-input.patch b/meta-oe/recipes-extended/beep/files/linux-input.patch
deleted file mode 100644
index 1b38ba72a3..0000000000
--- a/meta-oe/recipes-extended/beep/files/linux-input.patch
+++ /dev/null
@@ -1,155 +0,0 @@
-# the diff between Alessandro Zummo's copy of beep.c and the original
-# one...
-
---- beep-1.2.2/beep.c.orig	2006-01-29 12:13:36.994560551 -0800
-+++ beep-1.2.2/beep.c	2006-01-29 12:35:02.950558713 -0800
-@@ -26,6 +26,7 @@
- #include <sys/ioctl.h>
- #include <sys/types.h>
- #include <linux/kd.h>
-+#include <linux/input.h>
- 
- /* I don't know where this number comes from, I admit that freely.  A 
-    wonderful human named Raine M. Ekman used it in a program that played
-@@ -86,18 +87,28 @@ typedef struct beep_parms_t {
-   struct beep_parms_t *next;  /* in case -n/--new is used. */
- } beep_parms_t;
- 
-+enum { BEEP_TYPE_CONSOLE, BEEP_TYPE_EVDEV };
-+
- /* Momma taught me never to use globals, but we need something the signal 
-    handlers can get at.*/
- int console_fd = -1;
-+int console_type = BEEP_TYPE_CONSOLE;
-+char *console_device = NULL;
-+
-+void do_beep(int freq);
- 
- /* If we get interrupted, it would be nice to not leave the speaker beeping in
-    perpetuity. */
- void handle_signal(int signum) {
-+  
-+  if(console_device)
-+    free(console_device);
-+    
-   switch(signum) {
-   case SIGINT:
-     if(console_fd >= 0) {
-       /* Kill the sound, quit gracefully */
--      ioctl(console_fd, KIOCSOUND, 0);
-+      do_beep(0);
-       close(console_fd);
-       exit(signum);
-     } else {
-@@ -110,7 +121,7 @@ void handle_signal(int signum) {
- /* print usage and exit */
- void usage_bail(const char *executable_name) {
-   printf("Usage:\n%s [-f freq] [-l length] [-r reps] [-d delay] "
--	 "[-D delay] [-s] [-c]\n",
-+	 "[-D delay] [-s] [-c] [-e device]\n",
- 	 executable_name);
-   printf("%s [Options...] [-n] [--new] [Options...] ... \n", executable_name);
-   printf("%s [-h] [--help]\n", executable_name);
-@@ -141,11 +152,12 @@ void usage_bail(const char *executable_n
- void parse_command_line(int argc, char **argv, beep_parms_t *result) {
-   int c;
- 
--  struct option opt_list[4] = {{"help", 0, NULL, 'h'},
-+  struct option opt_list[] = {{"help", 0, NULL, 'h'},
- 			       {"version", 0, NULL, 'V'},
- 			       {"new", 0, NULL, 'n'},
-+			       {"device", 1, NULL, 'e'},
- 			       {0,0,0,0}};
--  while((c = getopt_long(argc, argv, "f:l:r:d:D:schvVn", opt_list, NULL))
-+  while((c = getopt_long(argc, argv, "f:l:r:d:D:schvVne:", opt_list, NULL))
- 	!= EOF) {
-     int argval = -1;    /* handle parsed numbers for various arguments */
-     float argfreq = -1; 
-@@ -207,6 +219,9 @@ void parse_command_line(int argc, char *
-       result->next->next       = NULL;
-       result = result->next; /* yes, I meant to do that. */
-       break;
-+    case 'e' : /* also --device */
-+      console_device = strdup(optarg);
-+      break;
-     case 'h' : /* notice that this is also --help */
-     default :
-       usage_bail(argv[0]);
-@@ -214,26 +229,61 @@ void parse_command_line(int argc, char *
-   }
- }  
- 
-+void do_beep(int freq)
-+{
-+  if (console_type == BEEP_TYPE_CONSOLE)
-+  {
-+    if(ioctl(console_fd, KIOCSOUND, freq != 0
-+      ? (int)(CLOCK_TICK_RATE/freq)
-+      : freq) < 0) {
-+      printf("\a");  /* Output the only beep we can, in an effort to fall back on usefulness */
-+      perror("ioctl");
-+    }
-+  }
-+  else
-+  {
-+     /* BEEP_TYPE_EVDEV */
-+     struct input_event e;
-+ 
-+     e.type = EV_SND;
-+     e.code = SND_TONE;
-+     e.value = freq;
-+  
-+     write(console_fd, &e, sizeof(struct input_event));
-+  }
-+}
-+
- void play_beep(beep_parms_t parms) {
-   int i; /* loop counter */
- 
-   /* try to snag the console */
--  if((console_fd = open("/dev/console", O_WRONLY)) == -1) {
--    fprintf(stderr, "Could not open /dev/console for writing.\n");
-+
-+  if(console_device)
-+    console_fd = open(console_device, O_WRONLY);
-+  else
-+    if((console_fd = open("/dev/input/event0", O_WRONLY)) == -1)
-+      if((console_fd = open("/dev/tty0", O_WRONLY)) == -1)
-+        console_fd = open("/dev/vc/0", O_WRONLY);
-+      
-+  if(console_fd == -1) {
-+    fprintf(stderr, "Could not open %s for writing\n",
-+      console_device != NULL ? console_device : "/dev/tty0 or /dev/vc/0");
-     printf("\a");  /* Output the only beep we can, in an effort to fall back on usefulness */
-     perror("open");
-     exit(1);
-   }
-   
-+  if (ioctl(console_fd, EVIOCGSND(0)) != -1)
-+    console_type = BEEP_TYPE_EVDEV;
-+  else
-+    console_type = BEEP_TYPE_CONSOLE;
-+  
-   /* Beep */
-   for (i = 0; i < parms.reps; i++) {                    /* start beep */
--    if(ioctl(console_fd, KIOCSOUND, (int)(CLOCK_TICK_RATE/parms.freq)) < 0) {
--      printf("\a");  /* Output the only beep we can, in an effort to fall back on usefulness */
--      perror("ioctl");
--    }
-+    do_beep(parms.freq);
-     /* Look ma, I'm not ansi C compatible! */
-     usleep(1000*parms.length);                          /* wait...    */
--    ioctl(console_fd, KIOCSOUND, 0);                    /* stop beep  */
-+    do_beep(0);
-     if(parms.end_delay || (i+1 < parms.reps))
-        usleep(1000*parms.delay);                        /* wait...    */
-   }                                                     /* repeat.    */
-@@ -295,5 +345,8 @@ int main(int argc, char **argv) {
-     parms = next;
-   }
- 
-+  if(console_device)
-+    free(console_device);
-+    
-   return EXIT_SUCCESS;
- }
-- 
2.40.1


