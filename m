Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7557.1792575016602015629
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 02:30:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=p3zToJ64;
 spf=pass (domain: gmail.com, ip: 74.125.82.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so998480eec.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 02:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792575016; x=1793179816; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9CQHONmROj+IM63pShrvW5zYBC5B8M0VXXys8Zn76wY=;
        b=p3zToJ64KTtxIGxSnC7txzba0C+rQYwGwPz4QXtgPDAR+LnbUc54NYdI7DPyckPJ9L
         Jra0JpMISyNL6zAy6tB4ZnpKwBTH1n9xeF2eycsX+jRj0Dfn0P4R8roCdNxmmzTmZLk1
         Y6jTqaA3zCknf5jFcT3Zn8YxKwlCCtFi2gMQxjbg4E5RdH7GwwEmxBJV+hx1AqJkrug8
         Svbb84wdtJ7G12dL8SbT+9d/UMHssYfmnp4tBXOWTr9lEM6WZ2TmMNCnlLvjZEaSJo1s
         zpHDSubra2Vz1VRiiSYlVcrTyrLQBDIzpEKgBzoNqs/yaMEPCV5BCYb3vG5ZeoEIBfoH
         PD0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792575016; x=1793179816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9CQHONmROj+IM63pShrvW5zYBC5B8M0VXXys8Zn76wY=;
        b=KWnDeRdjptXTrLwmIFYwX4pXCmE9vddrWEixJNx66JbhSioDKrdd45L2ktrec/7Yp/
         LzF2gxS6kUKZIXnOjbiP/hJTX7pQAsCglQHhVkW0wSzKCujmooLp3C5jvq7KMgMzxyZm
         q1SWrictCZeTDFDMVIX6vjWyyyjhjscnHV1Z0zvVD3haONXIq1fSx1UzvVcogavlIpO2
         yKLJIby7g55xV82acifdD13L0VW1kdi0W6r9d4hJpPY3Vxg4RDfYnBcafde9CKJCO7BS
         IZw9o4Ue2EzOCzoVaSvbiCbsOqCpX+2IFDSu5Z5fTzMO/Cetlxm9kYIL7KMQGKI2mNqA
         Omlg==
X-Gm-Message-State: AFq9FYK/V9eJYuQUNNqyPYXfO/+Pp6NCq6TF4G1gi916PzkMV5INf1t9
	MPU7FriPoiU6eF5CVgdEnaCEfIVXPQimhIp6wSKHYee29v9+PFcyRAeHxT+5gA==
X-Gm-Gg: AYBFou2y5sN8xRXEkEViiJWEdmZSQPBrXjpCl0jrGeCxsO0FBix87UpvHuCClSNLufr
	OiMZp2EIkO/8yG7xBcTgKNHyomfiwUne42WN9UfsRN3tuyx+tz1V8pTK5bTOP2dMuKom6DXIa1y
	tNub9koaPXevBvYc6ESl2Vp1XY5T977oRPHRDknStywRDtETqNzE/AZp9upW1ODdCsSAu6miUC8
	B1Lh3FyRo6GIjdEIUlHOVzOSCcjP7UC54ZM253DfVrQhWK3ZPoAoUOHMAndg3cmmVAmLNoHRZrs
	wx+7rqp0dtNqxUMZmUWXHkN+Ouzfvf0O4YO1H3nVhadcsPflPoVTZUR7v8Dt1ESnhzu3S0Ao0Ii
	4yK3Lg/R/IG0gLIInujvUx2ZF4fPXvXDDjnD2fW99WSrOAd6NwS6JdoyEIbplerDifsnXSA+FMw
	XuqcN/+GDdrbX0qGgICgLMCGI43OtdRpSULKLuhkVVhlu5j4IN497gk1aaP4qrStJsocyPyJN16
	8JW6lqJ15Wui8L8x2IQTMIsgY7RcV2mC1IQj4KcwKJJsrV7iCnk31weSEpXeOKFVZSYtqr7dOz5
	KaErw1YGUbLYYo7pAI2Pn9n4hyiOuM8=
X-Received: by 2002:a05:701b:4586:10b0:14f:b5ac:ace4 with SMTP id a92af1059eb24-190a756b94emr1878274c88.44.1792575015777;
        Wed, 21 Oct 2026 02:30:15 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19035c0c9a6sm4716458c88.3.2026.10.21.02.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:30:15 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][blacksail][PATCH 31/44] pjproject: patch CVE-2026-77396
Date: Wed, 21 Oct 2026 22:28:44 +1300
Message-ID: <20261021092857.3585453-31-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021092857.3585453-1-ankur.tyagi85@gmail.com>
References: <20261021092857.3585453-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 09:30:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131218
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-77396

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../pjproject/pjproject/CVE-2026-77396.patch  | 74 +++++++++++++++++++
 .../pjproject/pjproject_2.17.bb               |  1 +
 2 files changed, 75 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-77396.patch

diff --git a/meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-77396.patch b/meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-77396.patch
new file mode 100644
index 0000000000..a02268bf11
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-77396.patch
@@ -0,0 +1,74 @@
+From a927a964d462e9966864b7b2c432942b61038d6b Mon Sep 17 00:00:00 2001
+From: Nanang Izzuddin <nanang@teluu.com>
+Date: Mon, 13 Jul 2026 09:27:02 +0700
+Subject: [PATCH] Merge commit from fork
+
+The AVI player used a chunk length taken from the input file as the
+number of bytes to read into the video frame buffer, whose capacity is
+derived from the (also file-supplied) declared dimensions, without
+reconciling the two. A crafted file could therefore cause a write past
+the end of the buffer. The only guard was an assertion, which is a
+no-op in release builds.
+
+Clamp the read to the frame buffer capacity, skip any remaining chunk
+bytes so the file position stays aligned, and remove the reliance on
+the assertion for validating a file-supplied length.
+
+Ref: GHSA-6p2p-5wf8-h5hr
+(cherry picked from commit 7ecc6584969a923c4190b6912afbf5952b5a4b9f)
+
+CVE: CVE-2026-77396
+Upstream-Status: Backport [https://github.com/pjsip/pjproject/commit/7ecc6584969a923c4190b6912afbf5952b5a4b9f]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ pjmedia/src/pjmedia/avi_player.c | 34 +++++++++++++++++++++++++++++---
+ 1 file changed, 31 insertions(+), 3 deletions(-)
+
+diff --git a/pjmedia/src/pjmedia/avi_player.c b/pjmedia/src/pjmedia/avi_player.c
+index dc87b8a41..8b4b94d16 100644
+--- a/pjmedia/src/pjmedia/avi_player.c
++++ b/pjmedia/src/pjmedia/avi_player.c
+@@ -1199,12 +1199,40 @@ static pj_status_t avi_get_frame(pjmedia_port *this_port,
+                 goto on_error2;
+             fport->size_left -= size_to_read;
+         } else {
+-            pj_assert(frame->size >= ch.len);
+-            status = file_read3(fport->fd, frame->buf, ch.len,
++            pj_uint32_t read_len = ch.len;
++
++            /* Clamp the read to the frame buffer capacity. A crafted
++             * file may declare a chunk larger than the buffer, whose
++             * size is derived from the (also file-supplied) video
++             * dimensions; never write past frame->buf (frame->size
++             * bytes). Do not rely on pj_assert() here, as it is a no-op
++             * in release builds.
++             */
++            if (read_len > frame->size) {
++                PJ_LOG(3, (THIS_FILE,
++                           "AVI video chunk (%u) exceeds frame buffer "
++                           "(%u), truncating",
++                           (unsigned)ch.len, (unsigned)frame->size));
++                read_len = (pj_uint32_t)frame->size;
++            }
++
++            status = file_read3(fport->fd, frame->buf, read_len,
+                                 0, &size_read);
+             if (status != PJ_SUCCESS)
+                 goto on_error2;
+-            frame->size = ch.len;
++
++            /* Skip any remaining chunk bytes that did not fit, so the
++             * file position stays aligned to the next chunk.
++             */
++            if (ch.len > read_len) {
++                status = pj_file_setpos(fport->fd,
++                                        (pj_off_t)ch.len - read_len,
++                                        PJ_SEEK_CUR);
++                if (status != PJ_SUCCESS)
++                    goto on_error2;
++            }
++
++            frame->size = read_len;
+             fport->size_left = 0;
+         }
+ 
diff --git a/meta-multimedia/recipes-multimedia/pjproject/pjproject_2.17.bb b/meta-multimedia/recipes-multimedia/pjproject/pjproject_2.17.bb
index 9d1e6af253..89763b3011 100644
--- a/meta-multimedia/recipes-multimedia/pjproject/pjproject_2.17.bb
+++ b/meta-multimedia/recipes-multimedia/pjproject/pjproject_2.17.bb
@@ -21,6 +21,7 @@ SRC_URI = "git://github.com/pjsip/pjproject.git;protocol=https;branch=master;tag
            file://CVE-2026-57164.patch \
            file://CVE-2026-57165.patch \
            file://CVE-2026-57166.patch \
+           file://CVE-2026-77396.patch \
            "
 SRCREV = "5a457451fa2712ba18e12b01738e8ff3af2b26fd"
 
