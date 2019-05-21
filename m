Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id 9D01F7E21F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2019 20:18:50 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id z5so17047914lji.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2019 13:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=zbahFx6n3aGfErSU+6RI+aV52yb2p+8Et1F0tC7uw3I=;
	b=x0aGWzM65edBDquto/vCnG69c1taKmNTVfIDOtlw0BfVpChBwDk9tcrY1SAevYmLMm
	m8y5RicyDD1QgEG92kpIABvw5dTeP3dnKsFfgfOV0kw7JOdoD/LdeE1mGK4aeRHSYugP
	8eP2/+uaPiJKuTOuwSQu74AmqKRhE/nVhgeotb6ROYqOOn8NkAQUgavRJHB1+f2pw0Fp
	PbOTg3BLPd8yLPLXvoEPbMhZoGbA5ZmkiXz+FYYRlzTwv1RpyQftFTQ0seEWBQZyxNph
	A1oF5VoL7QJbC7W62x9WNoeZeqOvASt65q/W3fvCNwh3SDBj30gD3yd46ZUh4aE4QalT
	g8lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=zbahFx6n3aGfErSU+6RI+aV52yb2p+8Et1F0tC7uw3I=;
	b=RfAmT8xTFtkqDIi421HjUZW8bw4XAVXHTTiK6teYCxWOReT/c8/4Sbn7LF9aoepESJ
	mlxrtR3oz5D9oTWBHRo9dTgNkaUWX6w1NQbnVUkgAqLocrUAxqhp809q1T3lU2396a2g
	X+lt+21E/e/QSaYjK/em5RyFobrB1iWf5RSFULdL1npWev5LDYv32QKg5IaXtWmy3Cv6
	kURRlVCxfol6D+hQCJvI3GE44CY5ageM9NA/hEwpg2F6YkvEUCnwV1xI43RWLCGSZeNL
	45ZMz6l8Dt/BbJ0S3R+mQH/xbw0KlhTFQetgZe3FztzH4rgEVXGQiaEtHhlfj+XpDjXE
	eQrQ==
X-Gm-Message-State: APjAAAXHGC+aj0KhPfrQy5Key2LFIwVFDDrBsvzwt8gllin5DKeHqITk
	cYkjxkT3gbUOSYIpeqXIDAra+F8kjEc=
X-Google-Smtp-Source: APXvYqxkVdqpHSFYxx+FlYR2mCv/DwDJ+N2b9SXwEpT3sI2AYEQqEXYIvdJVucuR0w9qn/Ysb9fuBQ==
X-Received: by 2002:a05:651c:1056:: with SMTP id
	x22mr21688614ljm.45.1558469930628; 
	Tue, 21 May 2019 13:18:50 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	w17sm4790751ljj.31.2019.05.21.13.18.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 May 2019 13:18:49 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
X-Google-Original-From: Oleksandr Kravchuk <dev@sashko.rv.ua>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 May 2019 22:09:38 +0200
Message-Id: <20190521200938.1961-1-dev@sashko.rv.ua>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-networking] atftp: update to 0.7.2
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
X-List-Received-Date: Tue, 21 May 2019 20:18:51 -0000

From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>

Removed patches were upstreamed.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../atftp/{atftp_git.bb => atftp_0.7.2.bb}    |   7 +-
 .../atftp-0.7-sorcerers_apprentice.patch      |  94 ----------
 ....7_circumvent_tftp_size_restrictions.patch | 163 ------------------
 ...pd-0.7_unprotected_assignments_crash.patch | 152 ----------------
 4 files changed, 1 insertion(+), 415 deletions(-)
 rename meta-networking/recipes-daemons/atftp/{atftp_git.bb => atftp_0.7.2.bb} (85%)
 delete mode 100644 meta-networking/recipes-daemons/atftp/files/atftp-0.7-sorcerers_apprentice.patch
 delete mode 100644 meta-networking/recipes-daemons/atftp/files/atftpd-0.7_circumvent_tftp_size_restrictions.patch
 delete mode 100644 meta-networking/recipes-daemons/atftp/files/atftpd-0.7_unprotected_assignments_crash.patch

diff --git a/meta-networking/recipes-daemons/atftp/atftp_git.bb b/meta-networking/recipes-daemons/atftp/atftp_0.7.2.bb
similarity index 85%
rename from meta-networking/recipes-daemons/atftp/atftp_git.bb
rename to meta-networking/recipes-daemons/atftp/atftp_0.7.2.bb
index a9949d59a..ff9084dbf 100644
--- a/meta-networking/recipes-daemons/atftp/atftp_git.bb
+++ b/meta-networking/recipes-daemons/atftp/atftp_0.7.2.bb
@@ -3,17 +3,12 @@ SECTION = "net"
 HOMEPAGE = "http://packages.debian.org/atftp"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=94d55d512a9ba36caa9b7df079bae19f"
-PV = "0.7.1+git${SRCPV}"
-PR = "r3"
 
-SRCREV = "be3291a18c069ae23a124ffdc56d64a5ff0bbec7"
+SRCREV = "52b71f0831dcbde508bd3a961d84abb80a62480f"
 
 SRC_URI = "git://git.code.sf.net/p/atftp/code \
-           file://atftpd-0.7_circumvent_tftp_size_restrictions.patch \
-           file://atftpd-0.7_unprotected_assignments_crash.patch \
            file://atftpd.init \
            file://atftpd.service \
-           file://atftp-0.7-sorcerers_apprentice.patch \
 "
 SRC_URI_append_libc-musl = " file://0001-argz.h-fix-musl-compile-add-missing-defines.patch \
                              file://0002-tftp.h-tftpd.h-fix-musl-compile-missing-include.patch \
diff --git a/meta-networking/recipes-daemons/atftp/files/atftp-0.7-sorcerers_apprentice.patch b/meta-networking/recipes-daemons/atftp/files/atftp-0.7-sorcerers_apprentice.patch
deleted file mode 100644
index fc64291cd..000000000
--- a/meta-networking/recipes-daemons/atftp/files/atftp-0.7-sorcerers_apprentice.patch
+++ /dev/null
@@ -1,94 +0,0 @@
-atftp exhibits the well known "Sorcerer's Apprentice Syndrome"(SAS) problem.
-According to RFC 1350, the fix to SAS is quite simple: further copies of the
-acknowledgment for a particular data block would be ignored.
-
-Patch originally from OpenSUSE:
-https://build.opensuse.org/package/view_file?file=atftp-0.7-sorcerers_apprentice.patch&package=atftp.539&project=openSUSE%3A12.1%3AUpdate&rev=84569792975e00573d7df597d2a6e895
-
-Upstream-Status: Pending
-
-Signed-off-by: Roy.Li <rongqing.li@windriver.com>
-Index: atftp-0.7/tftp_file.c
-===================================================================
---- atftp-0.7.orig/tftp_file.c	2011-11-22 15:12:53.792744083 +0100
-+++ atftp-0.7/tftp_file.c	2011-11-22 15:13:51.706421893 +0100
-@@ -605,6 +605,7 @@
-      int timeout_state = state; /* what state should we go on when timeout */
-      int result;
-      long block_number = 0;
-+     long last_requested_block = -1;
-      long last_block = -1;
-      int data_size;             /* size of data received */
-      int sockfd = data->sockfd; /* just to simplify calls */
-@@ -765,6 +766,17 @@
-                          connected = 1;
-                     }
-                     block_number = ntohs(tftphdr->th_block);
-+
-+                    if (last_requested_block >= block_number)
-+                    {
-+                        if (data->trace)
-+                            fprintf(stderr, "received duplicated ACK <block: %ld >= %ld>\n",
-+                                    last_requested_block, block_number);
-+                        break;
-+                    }
-+                    else
-+                        last_requested_block = block_number;
-+
-                     if (data->trace)
-                          fprintf(stderr, "received ACK <block: %ld>\n",
-                                  block_number);
-Index: atftp-0.7/tftpd_file.c
-===================================================================
---- atftp-0.7.orig/tftpd_file.c	2011-11-22 15:12:53.793744112 +0100
-+++ atftp-0.7/tftpd_file.c	2011-11-22 15:15:04.617534260 +0100
-@@ -403,6 +403,7 @@
-      int timeout_state = state;
-      int result;
-      long block_number = 0;
-+     long last_requested_block = -1;
-      long last_block = -1;
-      int block_loops = 0;
-      int data_size;
-@@ -859,6 +860,32 @@
-                     {
-                          logger(LOG_DEBUG, "received ACK <block: %d>", block_number);
-                     }
-+
-+		    /* check whether the block request isn't already fulfilled */
-+
-+                    /* multicast, block numbers could contain gaps */
-+                    if (multicast) {
-+                        if (last_requested_block >= block_number)
-+                        {
-+                            if (data->trace)
-+                                logger(LOG_DEBUG, "received duplicated ACK <block: %d >= %d>", last_requested_block, block_number);
-+                            break;
-+                        }
-+                        else
-+                            last_requested_block = block_number;
-+                    /* unicast, blocks should be requested one after another */
-+		    } else {
-+                        if (last_requested_block + 1 != block_number && last_requested_block != -1)
-+                        {
-+                            if (data->trace)
-+                                logger(LOG_DEBUG, "received out of order ACK <block: %d != %d>", last_requested_block + 1, block_number);
-+                            break;
-+                        }
-+                        else
-+                            last_requested_block = block_number;
-+                    }
-+
-+
-                     if (ntohs(tftphdr->th_block) == 65535)
-                     {
-                          block_loops++;
-@@ -958,6 +985,8 @@
-                          /* nedd to send an oack to that client */
-                          state = S_SEND_OACK;                
-                          fseek(fp, 0, SEEK_SET);
-+			 /* reset the last block received counter */
-+			 last_requested_block = -1;
-                     }
-                     else
-                     {
diff --git a/meta-networking/recipes-daemons/atftp/files/atftpd-0.7_circumvent_tftp_size_restrictions.patch b/meta-networking/recipes-daemons/atftp/files/atftpd-0.7_circumvent_tftp_size_restrictions.patch
deleted file mode 100644
index 280b570b2..000000000
--- a/meta-networking/recipes-daemons/atftp/files/atftpd-0.7_circumvent_tftp_size_restrictions.patch
+++ /dev/null
@@ -1,163 +0,0 @@
-Fate #303031: Circumvent TFTP size restrictions in atftpd
-The size of a single image file that can be transferred with TFTP is limited to
-2^(2*8) *BLOCKSIZE (as per RFC 1350 there are only two bytes for the block
-counter). This is problematic for one of our customers who needs to transfer
-100+ MB Windows images using a TFTP client (NT bootloader) which has a
-hardwared BLOCKSIZE setting of 1432).
-
-block rollover
-http://www.compuphase.com/tftp.htm
-
-Patch originally from OpenSUSE:
-https://build.opensuse.org/package/show?package=atftp&project=openSUSE%3A12.2
-
-Upstream-Status: Pending
-
-Index: git/tftp_def.h
-===================================================================
---- git.orig/tftp_def.h	2012-11-19 16:28:50.221027144 -0800
-+++ git/tftp_def.h	2012-11-20 17:40:54.391206979 -0800
-@@ -32,6 +32,7 @@
- #define TIMEOUT       5         /* Client timeout */
- #define S_TIMEOUT     5         /* Server timout. */
- #define NB_OF_RETRY   5
-+#define MAXBLOCKS   1000000      /* maximum number of blocks in a download */
- 
- /* definition to use tftp_options structure */
- #define OPT_FILENAME  0
-Index: git/tftp_file.c
-===================================================================
---- git.orig/tftp_file.c	2012-11-19 16:28:50.221027144 -0800
-+++ git/tftp_file.c	2012-11-19 16:28:51.201027167 -0800
-@@ -622,8 +622,8 @@
-      int state = S_SEND_REQ;    /* current state in the state machine */
-      int timeout_state = state; /* what state should we go on when timeout */
-      int result;
--     int block_number = 0;
--     int last_block = -1;
-+     long block_number = 0;
-+     long last_block = -1;
-      int data_size;             /* size of data received */
-      int sockfd = data->sockfd; /* just to simplify calls */
-      struct sockaddr_storage sa; /* a copy of data.sa_peer */
-@@ -637,8 +637,8 @@
-      int convert = 0;           /* if true, do netascii convertion */
-      char string[MAXLEN];
- 
--     int prev_block_number = 0; /* needed to support netascii convertion */
--     int prev_file_pos = 0;
-+     long prev_block_number = 0; /* needed to support netascii convertion */
-+     long prev_file_pos = 0;
-      int temp = 0;
- 
-      data->file_size = 0;
-@@ -745,7 +745,7 @@
-                               data_size, data->data_buffer);
-                data->file_size += data_size;
-                if (data->trace)
--                    fprintf(stderr, "sent DATA <block: %d, size: %d>\n",
-+                    fprintf(stderr, "sent DATA <block: %ld, size: %d>\n",
-                             block_number + 1, data_size - 4);
-                state = S_WAIT_PACKET;
-                break;
-@@ -785,7 +785,7 @@
-                     }
-                     block_number = ntohs(tftphdr->th_block);
-                     if (data->trace)
--                         fprintf(stderr, "received ACK <block: %d>\n",
-+                         fprintf(stderr, "received ACK <block: %ld>\n",
-                                  block_number);
-                     if ((last_block != -1) && (block_number > last_block))
-                     {
-Index: git/tftp_io.c
-===================================================================
---- git.orig/tftp_io.c	2012-11-19 16:28:50.221027144 -0800
-+++ git/tftp_io.c	2012-11-19 16:28:51.201027167 -0800
-@@ -350,8 +350,8 @@
- /*
-  * Read from file and do netascii conversion if needed
-  */
--int tftp_file_read(FILE *fp, char *data_buffer, int data_buffer_size, int block_number,
--                   int convert, int *prev_block_number, int *prev_file_pos, int *temp)
-+int tftp_file_read(FILE *fp, char *data_buffer, int data_buffer_size, long block_number,
-+                   int convert, long *prev_block_number, long *prev_file_pos, int *temp)
- {
-      int i;
-      int c;
-Index: git/tftp_io.h
-===================================================================
---- git.orig/tftp_io.h	2012-11-19 16:28:50.221027144 -0800
-+++ git/tftp_io.h	2012-11-19 16:28:51.201027167 -0800
-@@ -52,8 +52,8 @@
- int tftp_get_packet(int sock1, int sock2, int *sock, struct sockaddr_storage *sa,
-                     struct sockaddr_storage *from, struct sockaddr_storage *to,
-                     int timeout, int *size, char *data);
--int tftp_file_read(FILE *fp, char *buffer, int buffer_size, int block_number, int convert,
--                   int *prev_block_number, int *prev_file_pos, int *temp);
-+int tftp_file_read(FILE *fp, char *buffer, int buffer_size, long block_number, int convert,
-+                   long *prev_block_number, long *prev_file_pos, int *temp);
- int tftp_file_write(FILE *fp, char *data_buffer, int data_buffer_size, int block_number,
-                     int data_size, int convert, int *prev_block_number, int *temp);
- #endif
-Index: git/tftpd_file.c
-===================================================================
---- git.orig/tftpd_file.c	2012-11-19 16:28:50.225027144 -0800
-+++ git/tftpd_file.c	2012-11-19 16:28:51.201027167 -0800
-@@ -407,8 +407,9 @@
-      int state = S_BEGIN;
-      int timeout_state = state;
-      int result;
--     int block_number = 0;
--     int last_block = -1;
-+     long block_number = 0;
-+     long last_block = -1;
-+     int block_loops = 0;
-      int data_size;
-      struct sockaddr_storage *sa = &data->client_info->client;
-      struct sockaddr_storage from;
-@@ -431,8 +432,8 @@
-      struct client_info *client_old = NULL;
-      struct tftp_opt options[OPT_NUMBER];
- 
--     int prev_block_number = 0; /* needed to support netascii convertion */
--     int prev_file_pos = 0;
-+     long prev_block_number = 0; /* needed to support netascii convertion */
-+     long prev_file_pos = 0;
-      int temp = 0;
- 
-      /* look for mode option */
-@@ -565,11 +566,12 @@
-           logger(LOG_INFO, "blksize option -> %d", result);
-      }
- 
--     /* Verify that the file can be sent in 2^16 block of BLKSIZE octets */
--     if ((file_stat.st_size / (data->data_buffer_size - 4)) > 65535)
-+     /* Verify that the file can be sent in MAXBLOCKS blocks of BLKSIZE octets */
-+     if ((file_stat.st_size / (data->data_buffer_size - 4)) > MAXBLOCKS)
-      {
-           tftp_send_error(sockfd, sa, EUNDEF, data->data_buffer, data->data_buffer_size);
--          logger(LOG_NOTICE, "Requested file to big, increase BLKSIZE");
-+          logger(LOG_NOTICE, "Requested file too big, increase BLKSIZE");
-+          logger(LOG_NOTICE, "Only %d blocks of %d bytes can be served.", MAXBLOCKS, data->data_buffer_size);
-           if (data->trace)
-                logger(LOG_DEBUG, "sent ERROR <code: %d, msg: %s>", EUNDEF,
-                       tftp_errmsg[EUNDEF]);
-@@ -880,10 +882,15 @@
-                     }
-                     /* The ACK is from the current client */
-                     number_of_timeout = 0;
--                    block_number = ntohs(tftphdr->th_block);
-+                    block_number = (block_loops * 65536) + ntohs(tftphdr->th_block);
-                     if (data->trace)
--                         logger(LOG_DEBUG, "received ACK <block: %d>",
--                                block_number);
-+                    {
-+                         logger(LOG_DEBUG, "received ACK <block: %d>", block_number);
-+                    }
-+                    if (ntohs(tftphdr->th_block) == 65535)
-+                    {
-+                         block_loops++;
-+                    };
-                     if ((last_block != -1) && (block_number > last_block))
-                     {
-                          state = S_END;
diff --git a/meta-networking/recipes-daemons/atftp/files/atftpd-0.7_unprotected_assignments_crash.patch b/meta-networking/recipes-daemons/atftp/files/atftpd-0.7_unprotected_assignments_crash.patch
deleted file mode 100644
index 28fba6cf5..000000000
--- a/meta-networking/recipes-daemons/atftp/files/atftpd-0.7_unprotected_assignments_crash.patch
+++ /dev/null
@@ -1,152 +0,0 @@
-Avoid assigning thread data outside of mutex lock
-
-Patch originally from OpenSUSE:
-https://build.opensuse.org/package/show?package=atftp&project=openSUSE%3A12.2
-
-Upstream-Status: Pending
-
-Index: git/tftpd_list.c
-===================================================================
---- git.orig/tftpd_list.c	2012-10-24 21:48:47.000000000 -0700
-+++ git/tftpd_list.c	2012-10-24 21:52:04.266205076 -0700
-@@ -49,11 +49,11 @@
-  */
- int tftpd_list_add(struct thread_data *new)
- {
--     struct thread_data *current = thread_data;
-+     struct thread_data *current;
-      int ret;
- 
-      pthread_mutex_lock(&thread_list_mutex);
--
-+     current = thread_data;
-      number_of_thread++;
-      
-      ret = number_of_thread;
-@@ -81,11 +81,13 @@
-  */
- int tftpd_list_remove(struct thread_data *old)
- {
--     struct thread_data *current = thread_data;
-+     struct thread_data *current;
-      int ret;
- 
-      pthread_mutex_lock(&thread_list_mutex);
- 
-+     current = thread_data;
-+
-      number_of_thread--;
-      ret = number_of_thread;
-     
-@@ -137,23 +139,26 @@
-                                              struct thread_data *data,
-                                              struct client_info *client)
- {
--     struct thread_data *current = thread_data; /* head of the list */
--     struct tftp_opt *tftp_options = data->tftp_options;
-+     struct thread_data *current; /* head of the list */
-+     struct tftp_opt *tftp_options;
-      struct client_info *tmp;
-      char options[MAXLEN];
-      char string[MAXLEN];
-      char *index;
-      int len;
- 
-+     /* lock the whole list before walking it */
-+     pthread_mutex_lock(&thread_list_mutex);
-+
-      *thread = NULL;
- 
-+     current = thread_data;
-+     tftp_options = data->tftp_options;
-+
-      opt_request_to_string(tftp_options, options, MAXLEN);
-      index = strstr(options, "multicast");
-      len = (int)index - (int)options;
- 
--     /* lock the whole list before walking it */
--     pthread_mutex_lock(&thread_list_mutex);
--
-      while (current)
-      {
-           if (current != data)
-@@ -214,9 +219,10 @@
- void tftpd_clientlist_remove(struct thread_data *thread,
-                              struct client_info *client)
- {
--     struct client_info *tmp = thread->client_info;
-+     struct client_info *tmp;
- 
-      pthread_mutex_lock(&thread->client_mutex);
-+     tmp = thread->client_info;
-      while ((tmp->next != client) && (tmp->next != NULL))
-           tmp = tmp->next;
-      if (tmp->next == NULL)
-@@ -231,9 +237,11 @@
- void tftpd_clientlist_free(struct thread_data *thread)
- {
-      struct client_info *tmp;
--     struct client_info *head = thread->client_info;
-+     struct client_info *head;
- 
-      pthread_mutex_lock(&thread->client_mutex);
-+     head = thread->client_info;
-+
-      while (head)
-      {
-           tmp = head;
-@@ -250,9 +258,10 @@
-                           struct client_info *client,
-                           struct sockaddr_storage *sock)
- {
--     struct client_info *head = thread->client_info;
-+     struct client_info *head;
- 
-      pthread_mutex_lock(&thread->client_mutex);
-+     head = thread->client_info;
- 
-      if (client)
-      {
-@@ -334,10 +343,10 @@
- 
- void tftpd_list_kill_threads(void)
- {
--     struct thread_data *current = thread_data; /* head of list */
-+     struct thread_data *current; /* head of list */
- 
-      pthread_mutex_lock(&thread_list_mutex);
--
-+     current = thread_data;
- 
-      while (current != NULL)
-      {
-Index: git/tftpd_mcast.c
-===================================================================
---- git.orig/tftpd_mcast.c	2012-10-24 21:48:47.000000000 -0700
-+++ git/tftpd_mcast.c	2012-10-24 21:49:11.570201582 -0700
-@@ -51,9 +51,11 @@
-  */
- int tftpd_mcast_get_tid(char **addr, short *port)
- {
--     struct tid *current = tid_list;
-+     struct tid *current;
- 
-      pthread_mutex_lock(&mcast_tid_list);
-+     current = tid_list;
-+
-      /* walk the list for a free tid */
-      while (current != NULL)
-      {
-@@ -74,9 +76,11 @@
- 
- int tftpd_mcast_free_tid(char *addr, short port)
- {
--     struct tid *current = tid_list;
-+     struct tid *current;
- 
-      pthread_mutex_lock(&mcast_tid_list);
-+     current = tid_list;
-+
-      while (current != NULL)
-      {
- 	  if ((current->used == 1) && (current->port == port) &&
-- 
2.17.1


