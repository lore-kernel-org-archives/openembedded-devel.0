Return-Path: <ranjitsinhrathod1991@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DA2AC433EF
	for <webhook@archiver.kernel.org>; Fri, 29 Apr 2022 09:03:56 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web08.7812.1651223032941723013
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Apr 2022 02:03:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=enBSnADR;
 spf=pass (domain: gmail.com, ip: 209.85.210.172,
 mailfrom: ranjitsinhrathod1991@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id y14so6398605pfe.10
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Apr 2022 02:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=7VlJ6iMEXb7nzbZIjQk6pi1KYbt7ozRCs/BFjaq9CCo=;
        b=enBSnADRg/r8rOTEIG9pEKeOb0DMwINQz/4gzQUs08U+aL7yxU6CGHNB8WFVUu9JG1
         eSxpsDEB+OYb6/0RIn42CMwLu5AVMHufmWJxa0N4edoD7ogj28IIPcG/8VPzL/7MOYLU
         CtkwDacXaXOiXt1qiHTOxdbJAdmhi2BJ8rXApElztc5XvYSZ/riSDMaUuoPOQoNM06bF
         V55tfmgKm3+1Y/jbZwZkPNYAou3CoeYKvESRjO4NOFL5kxPUjW9z/5akP0RKdrbKEnVX
         GlulufzC3J7hEi+pya4KvKNtVh/YdS6esKBIEnd0thTcpg/JBC1x1O/DrOyKzKPLVOKa
         bPJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=7VlJ6iMEXb7nzbZIjQk6pi1KYbt7ozRCs/BFjaq9CCo=;
        b=xWbpwKe50UZVMRFIJInMFDNpqnqZzySLQHfA2SqTI2fLeP2lN7upnNkme6SMxKr7ii
         9CFk7N2bgkZlx9zFlqCHln7WQ1wAPahY8ly2amWq8w+qVZrk6VcOI73U/Dpo78we0U87
         YBLWi1tf4rYWevFF8sGAdpz0LTisp5YXqdjX+vmsn5zPN5aEsn85icRw69Y7opK6cgNS
         TyYv3jY3Vs/s0tL1cQmjHbKBbFYrAodVJ7nlFyOPBhYoD60NyZh5leHTdHeA3NRJCnSm
         GqbTI1bF0Wlmx1tpFQJurLl9a+0bR+CGWPSINytW56c8jj/QL3d7YNAgFriN2ZyrcYJ8
         uKAA==
X-Gm-Message-State: AOAM531v03BnefQjsztNcFA2444z3+ExEX9+Dijie3e/6ZFY5HGPViKP
	bHp/38QTGkKKMgeXq7nH2isSTb/+yjI=
X-Google-Smtp-Source: 
 ABdhPJwI1WPNURGxgkR0UIuRdVXBYToCBQ1P+/GCXu6ifqbT5D+t4OsnZ3rx4mioWNzRuIFuaDwIKA==
X-Received: by 2002:a65:48c6:0:b0:398:b858:e332 with SMTP id
 o6-20020a6548c6000000b00398b858e332mr31107711pgs.291.1651223031621;
        Fri, 29 Apr 2022 02:03:51 -0700 (PDT)
Received: from localhost.localdomain ([150.129.206.198])
        by smtp.gmail.com with ESMTPSA id
 k1-20020a63ff01000000b003c14af505f5sm5102312pgi.13.2022.04.29.02.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 02:03:50 -0700 (PDT)
From: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: akuster808@gmail.com,
	Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Subject: [meta-networking][dunfell][PATCH] atftp: Add fix for CVE-2021-41054
 and CVE-2021-46671
Date: Fri, 29 Apr 2022 14:33:21 +0530
Message-Id: <20220429090321.1466-1-ranjitsinhrathod1991@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Apr 2022 09:03:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96855

From: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>

Add patches to fix CVE-2021-41054 and CVE-2021-46671 issues
Link: https://nvd.nist.gov/vuln/detail/CVE-2021-41054
Link: https://nvd.nist.gov/vuln/detail/CVE-2021-46671

Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Signed-off-by: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
---
 .../0001-fix-buffer-overflow-in-atftpd.patch  | 111 ++++++++++++++++++
 ...r-fix-for-the-read-past-end-of-array.patch |  48 ++++++++
 .../recipes-daemons/atftp/atftp_0.7.2.bb      |   2 +
 3 files changed, 161 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/atftp/atftp/0001-fix-buffer-overflow-in-atftpd.patch
 create mode 100644 meta-networking/recipes-daemons/atftp/atftp/0001-options.c-Proper-fix-for-the-read-past-end-of-array.patch

diff --git a/meta-networking/recipes-daemons/atftp/atftp/0001-fix-buffer-overflow-in-atftpd.patch b/meta-networking/recipes-daemons/atftp/atftp/0001-fix-buffer-overflow-in-atftpd.patch
new file mode 100644
index 0000000000..88794aa7ab
--- /dev/null
+++ b/meta-networking/recipes-daemons/atftp/atftp/0001-fix-buffer-overflow-in-atftpd.patch
@@ -0,0 +1,111 @@
+From d255bf90834fb45be52decf9bc0b4fb46c90f205 Mon Sep 17 00:00:00 2001
+From: Martin Dummer <md11@users.sourceforge.net>
+Date: Sun, 12 Sep 2021 22:52:26 +0200
+Subject: [PATCH] fix buffer overflow in atftpd
+
+Andreas B. Mundt <andi@debian.org> reports:
+
+I've found a problem in atftpd that might be relevant for security.
+The daemon can be crashed by any client sending a crafted combination
+of TFTP options to the server.  As TFTP is usually only used in the LAN,
+it's probably not too dramatic.
+
+Observations and how to reproduce the issue
+===========================================
+
+Install bullseye packages and prepare tftp-root:
+  sudo apt install atftp atftpd
+  mkdir tmp
+  touch tmp/file.txt
+
+Run server:
+  /usr/sbin/atftpd --user=$(id -un) --group=$(id -gn) --daemon --no-fork --trace \
+                    --logfile=/dev/stdout --verbose=7 --port 2000 tmp
+
+Fetch file from client:
+  /usr/bin/atftp -g --trace --option "blksize 8" \
+                  --remote-file file.txt -l /dev/null 127.0.0.1 2000
+
+Crash server by adding another option to the tiny blksize:
+   /usr/bin/atftp -g --trace --option "blksize 8" --option "timeout 3" \
+                   --remote-file file.txt -l /dev/null 127.0.0.1 2000
+
+Analysis
+========
+
+The reason for the crash is a buffer overflow.  The size of the buffer keeping the data
+to be sent with every segment is calculated by adding 4 bytes to the blksize (for opcode
+and block number).  However, the same buffer is used for the OACK, which for a blksize=8
+overflows as soon as another option is set.
+
+Signed-off-by: Martin Dummer <md11@users.sourceforge.net>
+
+CVE: CVE-2021-41054
+Upstream-Status: Backport [https://github.com/madmartin/atftp/commit/d255bf90834fb45be52decf9bc0b4fb46c90f205.patch]
+Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
+
+---
+ tftpd_file.c | 34 ++++++++++++++++++++++++++++++----
+ 1 file changed, 30 insertions(+), 4 deletions(-)
+
+diff --git a/tftpd_file.c b/tftpd_file.c
+index ff40e8d..37a0906 100644
+--- a/tftpd_file.c
++++ b/tftpd_file.c
+@@ -168,11 +168,24 @@ int tftpd_receive_file(struct thread_data *data)
+           logger(LOG_DEBUG, "timeout option -> %d", timeout);
+      }
+ 
+-     /* blksize options */
++     /*
++      *  blksize option, must be the last option evaluated,
++      *  because data->data_buffer_size may be modified here,
++      *  and may be smaller than the buffer containing options
++      */
+      if ((result = opt_get_blksize(data->tftp_options)) > -1)
+      {
+-          if ((result < 8) || (result > 65464))
++          /*
++           *  If we receive more options, we have to make sure our buffer for
++           *  the OACK is not too small.  Use the string representation of
++           *  the options here for simplicity, which puts us on the save side.
++           *  FIXME: Use independent buffers for OACK and data.
++           */
++          opt_options_to_string(data->tftp_options, string, MAXLEN);
++          if ((result < strlen(string)-2) || (result > 65464))
+           {
++               logger(LOG_NOTICE, "options <%s> require roughly a blksize of %d for the OACK.",
++                      string, strlen(string)-2);
+                tftp_send_error(sockfd, sa, EOPTNEG, data->data_buffer, data->data_buffer_size);
+                if (data->trace)
+                     logger(LOG_DEBUG, "sent ERROR <code: %d, msg: %s>", EOPTNEG,
+@@ -531,11 +544,24 @@ int tftpd_send_file(struct thread_data *data)
+           logger(LOG_INFO, "timeout option -> %d", timeout);
+      }
+ 
+-     /* blksize options */
++     /*
++      *  blksize option, must be the last option evaluated,
++      *  because data->data_buffer_size may be modified here,
++      *  and may be smaller than the buffer containing options
++      */
+      if ((result = opt_get_blksize(data->tftp_options)) > -1)
+      {
+-          if ((result < 8) || (result > 65464))
++          /*
++           *  If we receive more options, we have to make sure our buffer for
++           *  the OACK is not too small.  Use the string representation of
++           *  the options here for simplicity, which puts us on the save side.
++           *  FIXME: Use independent buffers for OACK and data.
++           */
++          opt_options_to_string(data->tftp_options, string, MAXLEN);
++          if ((result < strlen(string)-2) || (result > 65464))
+           {
++               logger(LOG_NOTICE, "options <%s> require roughly a blksize of %d for the OACK.",
++                      string, strlen(string)-2);
+                tftp_send_error(sockfd, sa, EOPTNEG, data->data_buffer, data->data_buffer_size);
+                if (data->trace)
+                     logger(LOG_DEBUG, "sent ERROR <code: %d, msg: %s>", EOPTNEG,
+-- 
+2.17.1
+
diff --git a/meta-networking/recipes-daemons/atftp/atftp/0001-options.c-Proper-fix-for-the-read-past-end-of-array.patch b/meta-networking/recipes-daemons/atftp/atftp/0001-options.c-Proper-fix-for-the-read-past-end-of-array.patch
new file mode 100644
index 0000000000..310728aaca
--- /dev/null
+++ b/meta-networking/recipes-daemons/atftp/atftp/0001-options.c-Proper-fix-for-the-read-past-end-of-array.patch
@@ -0,0 +1,48 @@
+From 9cf799c40738722001552618518279e9f0ef62e5 Mon Sep 17 00:00:00 2001
+From: Simon Rettberg <simon.rettberg@rz.uni-freiburg.de>
+Date: Wed, 10 Jan 2018 17:01:20 +0100
+Subject: [PATCH] options.c: Proper fix for the read-past-end-of-array
+
+This properly fixes what commit:b3e36dd tried to do.
+
+CVE: CVE-2021-46671
+Upstream-Status: Backport [https://github.com/madmartin/atftp/commit/9cf799c40738722001552618518279e9f0ef62e5.patch]
+Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
+
+---
+ options.c | 12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+
+diff --git a/options.c b/options.c
+index ee419c6..c716994 100644
+--- a/options.c
++++ b/options.c
+@@ -43,6 +43,12 @@ int opt_parse_request(char *data, int data_size, struct tftp_opt *options)
+      struct tftphdr *tftp_data = (struct tftphdr *)data;
+      size_t size = data_size - sizeof(tftp_data->th_opcode);
+ 
++     /* sanity check - requests always end in a null byte,
++      * check to prevent argz_next from reading past the end of
++      * data, as it doesn't do bounds checks */
++     if (data_size == 0 || data[data_size-1] != '\0')
++          return ERR;
++
+      /* read filename */
+      entry = argz_next(tftp_data->th_stuff, size, entry);
+      if (!entry)
+@@ -79,6 +85,12 @@ int opt_parse_options(char *data, int data_size, struct tftp_opt *options)
+      struct tftphdr *tftp_data = (struct tftphdr *)data;
+      size_t size = data_size - sizeof(tftp_data->th_opcode);
+ 
++     /* sanity check - options always end in a null byte,
++      * check to prevent argz_next from reading past the end of
++      * data, as it doesn't do bounds checks */
++     if (data_size == 0 || data[data_size-1] != '\0')
++          return ERR;
++
+      while ((entry = argz_next(tftp_data->th_stuff, size, entry)))
+      {
+           tmp = entry;
+-- 
+2.17.1
+
diff --git a/meta-networking/recipes-daemons/atftp/atftp_0.7.2.bb b/meta-networking/recipes-daemons/atftp/atftp_0.7.2.bb
index ddddb1b07a..32b776e578 100644
--- a/meta-networking/recipes-daemons/atftp/atftp_0.7.2.bb
+++ b/meta-networking/recipes-daemons/atftp/atftp_0.7.2.bb
@@ -9,6 +9,8 @@ SRCREV = "52b71f0831dcbde508bd3a961d84abb80a62480f"
 SRC_URI = "git://git.code.sf.net/p/atftp/code;branch=master \
            file://atftpd.init \
            file://atftpd.service \
+           file://0001-options.c-Proper-fix-for-the-read-past-end-of-array.patch \
+           file://0001-fix-buffer-overflow-in-atftpd.patch \
 "
 SRC_URI_append_libc-musl = " file://0001-argz.h-fix-musl-compile-add-missing-defines.patch \
                              file://0002-tftp.h-tftpd.h-fix-musl-compile-missing-include.patch \
-- 
2.17.1


