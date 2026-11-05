Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6746.1793913785778248883
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Nov 2026 13:23:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=WJ7NmqGx;
 spf=pass (domain: gmail.com, ip: 74.125.82.50, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1a3c08d6928so68655c88.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 13:23:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793913785; x=1794518585; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y7e396wcKFlYT+oE3BH+cK1GTDdLcdT5EgsTKjnPvF0=;
        b=WJ7NmqGxoOhisEGypLz3e8+dwtDuXWUK6S/xGlunAmz62V5g993GjJV9AOC7DrkYhS
         Ol9CkSInJPwaHt4jrurd3BJoWWi7AzTf42VkdluSuGnYJu7ObjE+MdL4MCBdw/HNFf8D
         K4kOms8xOxoftK0uo7j2KshQTe0bG0y4JQD7nXflrgzFcEDWjXLdpPiXvCPBw6vjhORc
         Hmm3o/PdyrlbABNfnExTtc+QJutmStALX0BJxnku3PCrm/A6JP0LPQ3pw8U1jENC3iB7
         6cgB/u00AN+UUh96QSlKroMyd2rrV1QPt9VBFbUveYGWgEFD5P6E2W8Cfka2tJeVI0/K
         0hQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793913785; x=1794518585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y7e396wcKFlYT+oE3BH+cK1GTDdLcdT5EgsTKjnPvF0=;
        b=n1Ym/ARabuNVNNnFvqfgxrcn9C2rZzEmg7NFJGOhJTPvBJ91RqvOkVaSHrYr+k9ZEH
         +6TuwwtVyWMiUYdUyLr4Ba2L6CBKhjsqigQOMp91V43MamfdrlW3m4gkPpQYmwDvRE4d
         9eU6u3q+D0njHdeifvvZENeD4QJaWBTiV8pFR8Wwa0mhjgMf6eBWsNi0XJ4wdvnWLGh7
         QHU/tilDH1A1gr3PDUqukWpjuef3VXfPieUbezFytPOq9KHikj5H825sJxa+rfm5DaMp
         9h0BLkktv1izyUwBBxbideKWqy3OAiawWGn/MMeVEY5Rb/MOZ2beRLnx0KikWcoT+oT5
         SQVw==
X-Gm-Message-State: APuU4Z/hAdQNgnPSwTGp2prAz76wIpvYKYxRda7qFxyVcy0O82bWhekR
	b6WGIL6opuuxOKt+gVtmjgFyn9i1ruZ2/jmSkM+AnzdYiqmVM6SbzMbDdoJRSQ==
X-Gm-Gg: AYBFou2WB2vhjPUggXWRqQCAQvdUreH3wKslm3Cmz5xD0UK4nx+f1Y8k3k0sTeKFhbL
	QNBtbltQ71NP6AujfusKgU69UJvvLOz03jt8NH+78AIXAGvW2bAYt7ecXkBbUbjBRWLV9cr3irz
	vkG4HN0tdpby/P3vPfUbFK7FzHKgCsA+FMV8hHWmqpkAKLFSlRQv3xnFYKgTl+wgaKgziw/WTpr
	I5+7KrJpVYGyeYbz8Y3r5zGOs/fUhe9qHp5H7+8DCZBOP3LO1xIESJYGLqcO9uhZoV2K8CAbUdu
	1KmYiqrukUYeoDwFQc9sM1aRFfEI/JGgq3banmvrb6FygftS2tRqeT83KIeTqVqSi8bx3Iky5Oh
	cb5edqsoJOwu0YkubBVH3CGG0WoJPbjD2zhFakYU9p0HftR3CBnirxdPSYpOr9cqDaUe1SXthMv
	qfrjuxnNZfs2friNLrbgx/sSl61w44vaAvMIxWvYSYyGy+JbgJ9CfAFdPJzdToEXwcm3FaFrnMP
	xgigmfEoqHdg0Vl4b7QmpFmH540Eu7iNpwNZvEU1rFJzqvStgiDrkbPR+f157B34YC1b81yKdOx
	lbAPaBx9HE0yefTiSGXL076hGUTyGGiHjU5AeL58thHLpYRPaneYlr6CxChOkIIjc4zFNTUECml
	ZdujYAfM=
X-Received: by 2002:a05:7022:4585:b0:154:fa0b:6df1 with SMTP id a92af1059eb24-1b25d392837mr321612c88.37.1793913784995;
        Thu, 05 Nov 2026 13:23:04 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36f71a25da0sm1034059eec.24.2026.11.05.13.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 13:23:04 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 5/14] hdf5: patch CVE-2026-120756
Date: Fri,  6 Nov 2026 10:22:41 +1300
Message-ID: <20261105212250.490188-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105212250.490188-1-ankur.tyagi85@gmail.com>
References: <20261105212250.490188-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 21:23:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131942
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-120756

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../hdf5/files/CVE-2026-120756.patch          | 45 +++++++++++++++++++
 meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb    |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-120756.patch

diff --git a/meta-oe/recipes-support/hdf5/files/CVE-2026-120756.patch b/meta-oe/recipes-support/hdf5/files/CVE-2026-120756.patch
new file mode 100644
index 0000000000..28bd658598
--- /dev/null
+++ b/meta-oe/recipes-support/hdf5/files/CVE-2026-120756.patch
@@ -0,0 +1,45 @@
+From 43855883c1ea10a072b7e7cf2dbc5a29ab411a8f Mon Sep 17 00:00:00 2001
+From: Nayyar <nayyar@bugqore.com>
+Date: Sat, 12 Sep 2026 16:37:49 +0530
+Subject: [PATCH] check object header message size after decoding its header
+ (#6589)
+
+(cherry picked from commit 10f1af5528168c5a71a58eba0b486e0677f3aaa3)
+
+CVE: CVE-2026-120756
+Upstream-Status: Backport [https://github.com/HDFGroup/hdf5/commit/10f1af5528168c5a71a58eba0b486e0677f3aaa3]
+
+Dropped changes to the test and CHANGELOG file.
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/H5Ocache.c | 10 +++++++---
+ 1 file changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/src/H5Ocache.c b/src/H5Ocache.c
+index 8f0928f290e..9dc6a2e21bb 100644
+--- a/src/H5Ocache.c
++++ b/src/H5Ocache.c
+@@ -1270,9 +1270,6 @@ H5O__chunk_deserialize(H5O_t *oh, haddr_t addr, size_t chunk_size, const uint8_t
+         if (mesg_size != H5O_ALIGN_OH(oh, mesg_size))
+             HGOTO_ERROR(H5E_OHDR, H5E_CANTLOAD, FAIL, "message not aligned");
+ 
+-        if (H5_IS_BUFFER_OVERFLOW(chunk_image, mesg_size, p_end))
+-            HGOTO_ERROR(H5E_OHDR, H5E_BADVALUE, FAIL, "message size exceeds buffer end");
+-
+         /* Message flags */
+         if (H5_IS_BUFFER_OVERFLOW(chunk_image, 1, p_end))
+             HGOTO_ERROR(H5E_OHDR, H5E_OVERFLOW, FAIL, "ran off end of input buffer while decoding");
+@@ -1305,6 +1302,13 @@ H5O__chunk_deserialize(H5O_t *oh, haddr_t addr, size_t chunk_size, const uint8_t
+             }
+         }
+ 
++        /* The message body starts after the message header, so its size can
++         * only be checked against the buffer once the whole header has been
++         * decoded
++         */
++        if (H5_IS_BUFFER_OVERFLOW(chunk_image, mesg_size, p_end))
++            HGOTO_ERROR(H5E_OHDR, H5E_BADVALUE, FAIL, "message size exceeds buffer end");
++
+         /* Increment count of null messages */
+         if (H5O_NULL_ID == id)
+             nullcnt++;
diff --git a/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb b/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb
index 758baf6e15..2b89c6925b 100644
--- a/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb
+++ b/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb
@@ -26,6 +26,7 @@ SRC_URI = "https://support.hdfgroup.org/releases/hdf5/v2_0/v2_0_0/downloads/${BP
            file://CVE-2026-19023-CVE-2026-19024.patch \
            file://CVE-2026-120689.patch \
            file://CVE-2026-120754-CVE-2026-120755.patch \
+           file://CVE-2026-120756.patch \
            "
 SRC_URI[sha256sum] = "f4c2edc5668fb846627182708dbe1e16c60c467e63177a75b0b9f12c19d7efed"
 
