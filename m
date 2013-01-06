Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TrmXD-00036K-15
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Jan 2013 10:28:58 +0100
Received: by mail-pb0-f47.google.com with SMTP id un1so9963203pbc.20
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Jan 2013 01:13:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=1I3jCSdj6Zrz3C7qHIDNIXqmE/F+ln7DyU/LlVDn3Uo=;
	b=tMf1aAAsyD0+vqQWQY3Jv0ZkQoVYFfhfj/zOaxYuZWux+nIrltrRH8m761TPGjeHy0
	Rs9tfc4Tl8Anx5bizAXv4cA/Zv+c96hcr1bJeDlSz8tfdsIWrSUW/JsmXA9x+abZznLc
	rkrZHJlWegG39CJmM90He3K3dCDQU7cNa4PWEntbMkIMeZExU4va/5IhjpG+Bpp8Cu/6
	bXbfS6PBYtDf0rnnw5sj0DpKQJKzrYtb7gmxSDQ/Hz6VhiPDyQKYD5w9689nHlRgrWKd
	AUROaPl8je3T0VWSUmxrgj2c/YqfTCB7w7nispEHGE/XV0aKRl9llnfKK7I79MJ6AsIv
	B3+A==
X-Received: by 10.69.0.8 with SMTP id au8mr178258526pbd.58.1357463622742;
	Sun, 06 Jan 2013 01:13:42 -0800 (PST)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id qw8sm5137145pbc.39.2013.01.06.01.13.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 06 Jan 2013 01:13:42 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  6 Jan 2013 01:12:32 -0800
Message-Id: <1357463568-26241-9-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1357463568-26241-1-git-send-email-raj.khem@gmail.com>
References: <1357463568-26241-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-oe][PATCH V2 09/25] atftp: Upgrade to latest from git
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
X-List-Received-Date: Sun, 06 Jan 2013 09:29:04 -0000

Add patches to let atftp serve huge ramdisks >500M in size

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../atftp/{atftp_0.7.bb => atftp_git.bb}           |   18 +--
 ...tpd-0.7_circumvent_tftp_size_restrictions.patch |  158 ++++++++++++++++++++
 .../atftpd-0.7_unprotected_assignments_crash.patch |  145 ++++++++++++++++++
 3 files changed, 311 insertions(+), 10 deletions(-)
 rename meta-oe/recipes-extended/atftp/{atftp_0.7.bb => atftp_git.bb} (59%)
 create mode 100644 meta-oe/recipes-extended/atftp/files/atftpd-0.7_circumvent_tftp_size_restrictions.patch
 create mode 100644 meta-oe/recipes-extended/atftp/files/atftpd-0.7_unprotected_assignments_crash.patch

diff --git a/meta-oe/recipes-extended/atftp/atftp_0.7.bb b/meta-oe/recipes-extended/atftp/atftp_git.bb
similarity index 59%
rename from meta-oe/recipes-extended/atftp/atftp_0.7.bb
rename to meta-oe/recipes-extended/atftp/atftp_git.bb
index ff1e11d..774dd68 100644
--- a/meta-oe/recipes-extended/atftp/atftp_0.7.bb
+++ b/meta-oe/recipes-extended/atftp/atftp_git.bb
@@ -3,13 +3,16 @@ SECTION = "network"
 HOMEPAGE = "http://packages.debian.org/atftp"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=94d55d512a9ba36caa9b7df079bae19f"
-PR = "r4"
+PV = "0.7.1+git${SRCPV}"
 
-SRC_URI = "${DEBIAN_MIRROR}/main/a/atftp/atftp_${PV}.dfsg.orig.tar.gz;name=archive \
-           ${DEBIAN_MIRROR}/main/a/atftp/atftp_${PV}.dfsg-11.diff.gz;name=patch \
-           file://atftpd.init"
+SRCREV = "be3291a18c069ae23a124ffdc56d64a5ff0bbec7"
 
-S = "${WORKDIR}/atftp-${PV}.dfsg"
+SRC_URI = "git://atftp.git.sourceforge.net/gitroot/atftp/atftp;protocol=git \
+           file://atftpd-0.7_circumvent_tftp_size_restrictions.patch \
+           file://atftpd-0.7_unprotected_assignments_crash.patch \
+           file://atftpd.init \
+          "
+S = "${WORKDIR}/git"
 
 inherit autotools update-rc.d useradd
 
@@ -35,8 +38,3 @@ PACKAGES =+ "atftpd"
 FILES_${PN} = "${bindir}/*"
 
 FILES_${PN}d = "${sbindir}/* ${sysconfdir}/init.d/* /srv/tftp"
-
-SRC_URI[archive.md5sum] = "aa269044a6f992eca78fee2f6119643c"
-SRC_URI[archive.sha256sum] = "18815f5b67290fac087c6b9da28dfa5e0feb722096f5c5de52e59b46026da559"
-SRC_URI[patch.md5sum] = "1636f199bf32c754a7bf34a5c647d138"
-SRC_URI[patch.sha256sum] = "0df33f6c09c2b2de58a84d7bb757844fc9538cd4d6c8d9c463da5270ebc2e41d"
diff --git a/meta-oe/recipes-extended/atftp/files/atftpd-0.7_circumvent_tftp_size_restrictions.patch b/meta-oe/recipes-extended/atftp/files/atftpd-0.7_circumvent_tftp_size_restrictions.patch
new file mode 100644
index 0000000..9aeb351
--- /dev/null
+++ b/meta-oe/recipes-extended/atftp/files/atftpd-0.7_circumvent_tftp_size_restrictions.patch
@@ -0,0 +1,158 @@
+Fate #303031: Circumvent TFTP size restrictions in atftpd
+The size of a single image file that can be transferred with TFTP is limited to
+2^(2*8) *BLOCKSIZE (as per RFC 1350 there are only two bytes for the block
+counter). This is problematic for one of our customers who needs to transfer
+100+ MB Windows images using a TFTP client (NT bootloader) which has a
+hardwared BLOCKSIZE setting of 1432).
+
+block rollover
+http://www.compuphase.com/tftp.htm
+
+Index: git/tftp_def.h
+===================================================================
+--- git.orig/tftp_def.h	2012-11-19 16:28:50.221027144 -0800
++++ git/tftp_def.h	2012-11-20 17:40:54.391206979 -0800
+@@ -32,6 +32,7 @@
+ #define TIMEOUT       5         /* Client timeout */
+ #define S_TIMEOUT     5         /* Server timout. */
+ #define NB_OF_RETRY   5
++#define MAXBLOCKS   1000000      /* maximum number of blocks in a download */
+ 
+ /* definition to use tftp_options structure */
+ #define OPT_FILENAME  0
+Index: git/tftp_file.c
+===================================================================
+--- git.orig/tftp_file.c	2012-11-19 16:28:50.221027144 -0800
++++ git/tftp_file.c	2012-11-19 16:28:51.201027167 -0800
+@@ -622,8 +622,8 @@
+      int state = S_SEND_REQ;    /* current state in the state machine */
+      int timeout_state = state; /* what state should we go on when timeout */
+      int result;
+-     int block_number = 0;
+-     int last_block = -1;
++     long block_number = 0;
++     long last_block = -1;
+      int data_size;             /* size of data received */
+      int sockfd = data->sockfd; /* just to simplify calls */
+      struct sockaddr_storage sa; /* a copy of data.sa_peer */
+@@ -637,8 +637,8 @@
+      int convert = 0;           /* if true, do netascii convertion */
+      char string[MAXLEN];
+ 
+-     int prev_block_number = 0; /* needed to support netascii convertion */
+-     int prev_file_pos = 0;
++     long prev_block_number = 0; /* needed to support netascii convertion */
++     long prev_file_pos = 0;
+      int temp = 0;
+ 
+      data->file_size = 0;
+@@ -745,7 +745,7 @@
+                               data_size, data->data_buffer);
+                data->file_size += data_size;
+                if (data->trace)
+-                    fprintf(stderr, "sent DATA <block: %d, size: %d>\n",
++                    fprintf(stderr, "sent DATA <block: %ld, size: %d>\n",
+                             block_number + 1, data_size - 4);
+                state = S_WAIT_PACKET;
+                break;
+@@ -785,7 +785,7 @@
+                     }
+                     block_number = ntohs(tftphdr->th_block);
+                     if (data->trace)
+-                         fprintf(stderr, "received ACK <block: %d>\n",
++                         fprintf(stderr, "received ACK <block: %ld>\n",
+                                  block_number);
+                     if ((last_block != -1) && (block_number > last_block))
+                     {
+Index: git/tftp_io.c
+===================================================================
+--- git.orig/tftp_io.c	2012-11-19 16:28:50.221027144 -0800
++++ git/tftp_io.c	2012-11-19 16:28:51.201027167 -0800
+@@ -350,8 +350,8 @@
+ /*
+  * Read from file and do netascii conversion if needed
+  */
+-int tftp_file_read(FILE *fp, char *data_buffer, int data_buffer_size, int block_number,
+-                   int convert, int *prev_block_number, int *prev_file_pos, int *temp)
++int tftp_file_read(FILE *fp, char *data_buffer, int data_buffer_size, long block_number,
++                   int convert, long *prev_block_number, long *prev_file_pos, int *temp)
+ {
+      int i;
+      int c;
+Index: git/tftp_io.h
+===================================================================
+--- git.orig/tftp_io.h	2012-11-19 16:28:50.221027144 -0800
++++ git/tftp_io.h	2012-11-19 16:28:51.201027167 -0800
+@@ -52,8 +52,8 @@
+ int tftp_get_packet(int sock1, int sock2, int *sock, struct sockaddr_storage *sa,
+                     struct sockaddr_storage *from, struct sockaddr_storage *to,
+                     int timeout, int *size, char *data);
+-int tftp_file_read(FILE *fp, char *buffer, int buffer_size, int block_number, int convert,
+-                   int *prev_block_number, int *prev_file_pos, int *temp);
++int tftp_file_read(FILE *fp, char *buffer, int buffer_size, long block_number, int convert,
++                   long *prev_block_number, long *prev_file_pos, int *temp);
+ int tftp_file_write(FILE *fp, char *data_buffer, int data_buffer_size, int block_number,
+                     int data_size, int convert, int *prev_block_number, int *temp);
+ #endif
+Index: git/tftpd_file.c
+===================================================================
+--- git.orig/tftpd_file.c	2012-11-19 16:28:50.225027144 -0800
++++ git/tftpd_file.c	2012-11-19 16:28:51.201027167 -0800
+@@ -407,8 +407,9 @@
+      int state = S_BEGIN;
+      int timeout_state = state;
+      int result;
+-     int block_number = 0;
+-     int last_block = -1;
++     long block_number = 0;
++     long last_block = -1;
++     int block_loops = 0;
+      int data_size;
+      struct sockaddr_storage *sa = &data->client_info->client;
+      struct sockaddr_storage from;
+@@ -431,8 +432,8 @@
+      struct client_info *client_old = NULL;
+      struct tftp_opt options[OPT_NUMBER];
+ 
+-     int prev_block_number = 0; /* needed to support netascii convertion */
+-     int prev_file_pos = 0;
++     long prev_block_number = 0; /* needed to support netascii convertion */
++     long prev_file_pos = 0;
+      int temp = 0;
+ 
+      /* look for mode option */
+@@ -565,11 +566,12 @@
+           logger(LOG_INFO, "blksize option -> %d", result);
+      }
+ 
+-     /* Verify that the file can be sent in 2^16 block of BLKSIZE octets */
+-     if ((file_stat.st_size / (data->data_buffer_size - 4)) > 65535)
++     /* Verify that the file can be sent in MAXBLOCKS blocks of BLKSIZE octets */
++     if ((file_stat.st_size / (data->data_buffer_size - 4)) > MAXBLOCKS)
+      {
+           tftp_send_error(sockfd, sa, EUNDEF, data->data_buffer, data->data_buffer_size);
+-          logger(LOG_NOTICE, "Requested file to big, increase BLKSIZE");
++          logger(LOG_NOTICE, "Requested file too big, increase BLKSIZE");
++          logger(LOG_NOTICE, "Only %d blocks of %d bytes can be served.", MAXBLOCKS, data->data_buffer_size);
+           if (data->trace)
+                logger(LOG_DEBUG, "sent ERROR <code: %d, msg: %s>", EUNDEF,
+                       tftp_errmsg[EUNDEF]);
+@@ -880,10 +882,15 @@
+                     }
+                     /* The ACK is from the current client */
+                     number_of_timeout = 0;
+-                    block_number = ntohs(tftphdr->th_block);
++                    block_number = (block_loops * 65536) + ntohs(tftphdr->th_block);
+                     if (data->trace)
+-                         logger(LOG_DEBUG, "received ACK <block: %d>",
+-                                block_number);
++                    {
++                         logger(LOG_DEBUG, "received ACK <block: %d>", block_number);
++                    }
++                    if (ntohs(tftphdr->th_block) == 65535)
++                    {
++                         block_loops++;
++                    };
+                     if ((last_block != -1) && (block_number > last_block))
+                     {
+                          state = S_END;
diff --git a/meta-oe/recipes-extended/atftp/files/atftpd-0.7_unprotected_assignments_crash.patch b/meta-oe/recipes-extended/atftp/files/atftpd-0.7_unprotected_assignments_crash.patch
new file mode 100644
index 0000000..6faf5f9
--- /dev/null
+++ b/meta-oe/recipes-extended/atftp/files/atftpd-0.7_unprotected_assignments_crash.patch
@@ -0,0 +1,145 @@
+Index: git/tftpd_list.c
+===================================================================
+--- git.orig/tftpd_list.c	2012-10-24 21:48:47.000000000 -0700
++++ git/tftpd_list.c	2012-10-24 21:52:04.266205076 -0700
+@@ -49,11 +49,11 @@
+  */
+ int tftpd_list_add(struct thread_data *new)
+ {
+-     struct thread_data *current = thread_data;
++     struct thread_data *current;
+      int ret;
+ 
+      pthread_mutex_lock(&thread_list_mutex);
+-
++     current = thread_data;
+      number_of_thread++;
+      
+      ret = number_of_thread;
+@@ -81,11 +81,13 @@
+  */
+ int tftpd_list_remove(struct thread_data *old)
+ {
+-     struct thread_data *current = thread_data;
++     struct thread_data *current;
+      int ret;
+ 
+      pthread_mutex_lock(&thread_list_mutex);
+ 
++     current = thread_data;
++
+      number_of_thread--;
+      ret = number_of_thread;
+     
+@@ -137,23 +139,26 @@
+                                              struct thread_data *data,
+                                              struct client_info *client)
+ {
+-     struct thread_data *current = thread_data; /* head of the list */
+-     struct tftp_opt *tftp_options = data->tftp_options;
++     struct thread_data *current; /* head of the list */
++     struct tftp_opt *tftp_options;
+      struct client_info *tmp;
+      char options[MAXLEN];
+      char string[MAXLEN];
+      char *index;
+      int len;
+ 
++     /* lock the whole list before walking it */
++     pthread_mutex_lock(&thread_list_mutex);
++
+      *thread = NULL;
+ 
++     current = thread_data;
++     tftp_options = data->tftp_options;
++
+      opt_request_to_string(tftp_options, options, MAXLEN);
+      index = strstr(options, "multicast");
+      len = (int)index - (int)options;
+ 
+-     /* lock the whole list before walking it */
+-     pthread_mutex_lock(&thread_list_mutex);
+-
+      while (current)
+      {
+           if (current != data)
+@@ -214,9 +219,10 @@
+ void tftpd_clientlist_remove(struct thread_data *thread,
+                              struct client_info *client)
+ {
+-     struct client_info *tmp = thread->client_info;
++     struct client_info *tmp;
+ 
+      pthread_mutex_lock(&thread->client_mutex);
++     tmp = thread->client_info;
+      while ((tmp->next != client) && (tmp->next != NULL))
+           tmp = tmp->next;
+      if (tmp->next == NULL)
+@@ -231,9 +237,11 @@
+ void tftpd_clientlist_free(struct thread_data *thread)
+ {
+      struct client_info *tmp;
+-     struct client_info *head = thread->client_info;
++     struct client_info *head;
+ 
+      pthread_mutex_lock(&thread->client_mutex);
++     head = thread->client_info;
++
+      while (head)
+      {
+           tmp = head;
+@@ -250,9 +258,10 @@
+                           struct client_info *client,
+                           struct sockaddr_storage *sock)
+ {
+-     struct client_info *head = thread->client_info;
++     struct client_info *head;
+ 
+      pthread_mutex_lock(&thread->client_mutex);
++     head = thread->client_info;
+ 
+      if (client)
+      {
+@@ -334,10 +343,10 @@
+ 
+ void tftpd_list_kill_threads(void)
+ {
+-     struct thread_data *current = thread_data; /* head of list */
++     struct thread_data *current; /* head of list */
+ 
+      pthread_mutex_lock(&thread_list_mutex);
+-
++     current = thread_data;
+ 
+      while (current != NULL)
+      {
+Index: git/tftpd_mcast.c
+===================================================================
+--- git.orig/tftpd_mcast.c	2012-10-24 21:48:47.000000000 -0700
++++ git/tftpd_mcast.c	2012-10-24 21:49:11.570201582 -0700
+@@ -51,9 +51,11 @@
+  */
+ int tftpd_mcast_get_tid(char **addr, short *port)
+ {
+-     struct tid *current = tid_list;
++     struct tid *current;
+ 
+      pthread_mutex_lock(&mcast_tid_list);
++     current = tid_list;
++
+      /* walk the list for a free tid */
+      while (current != NULL)
+      {
+@@ -74,9 +76,11 @@
+ 
+ int tftpd_mcast_free_tid(char *addr, short port)
+ {
+-     struct tid *current = tid_list;
++     struct tid *current;
+ 
+      pthread_mutex_lock(&mcast_tid_list);
++     current = tid_list;
++
+      while (current != NULL)
+      {
+ 	  if ((current->used == 1) && (current->port == port) &&
-- 
1.7.9.5



