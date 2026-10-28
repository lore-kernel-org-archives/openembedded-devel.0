Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36061.1793161518887064034
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 21:25:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=oz4p034i;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3a4b3ac8fb7so341121a91.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 21:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793161518; x=1793766318; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9CQHONmROj+IM63pShrvW5zYBC5B8M0VXXys8Zn76wY=;
        b=oz4p034i12Io5jjp/4KcfK1RHQWO1l1f7yIkwxgSepF3FdVcvjpi2VI8BPsdPN5RKx
         ZDceSskvA7v/QquHSd+FZ1LlMtcSu6CapXa3qkvF2WIm7mxjWgtVS3FFrViJkj9RbuqM
         OP6T2ItZtz2bL+AkaDMSMu1uCKXqA02DFLwSIcyk9Gh179AFTR4pOxFHtC6t7lEAVnNc
         qRFyU3+iyD81UMu15bJ4kFzPgnze2CDrzsvnm1sm8J6wvUo9q2ThZFOPcGg/BuwL+r7I
         g9Ttxc9sXjuQMBfetmPRgW0jots+px+NGlQ3JTZsFhnBIwCW6nitPJoUXCX0GRVlG9V5
         11Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793161518; x=1793766318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9CQHONmROj+IM63pShrvW5zYBC5B8M0VXXys8Zn76wY=;
        b=HbL2MzsnpsXfN0tUi3rjpvgngVYbDu4wLe+CJcgaNuYTLDyM7m1OcBlQeinZLVKhWr
         oS4E8DHA3FenVgWxM5QFbbyO/atj2rpvWUwO738/+tJiZXtz/FWhwrxWoT+JHjNcJ37x
         sHr2hCPUhyf+uKITRVtspPn8kDy7V7314gwo242/SsytbwnP+n0pjlBUoQkiaFORefbK
         9ibEa8bnEWDsICdITGCqKStMkeKBZgPdDAnK8DJMsqP9bawNDNnoz9IW7uvL2KBjFXOT
         uMohLeXjjM7LpxKysN+f4PUrrwuTKnHnyGCyPbW3xatJAkCZeLjgB1EuuOsGUPc+jTu3
         YvUg==
X-Gm-Message-State: AFq9FYLP1ctM5UYCmBguSpxjyA4ZX3SbS53Owz62SyHP3dKoHJ4TxAoA
	cpBbhOkedPofjfnqLICqGnwe9lOToQj+N53XHxlhMU/6Nww7MWSo1NqjWDTKKg==
X-Gm-Gg: AYBFou0rSfw1pNK9AAZdonYGbIKijBrIQsbRZLk4CfhPUBgNMsm5uztYAX+znHHf19Z
	ozH7fylKepUvu9dQUoTIOWapCFJdihaumq5zhit3og+z6hPar6Zu3F9gmHiIDL64yhJHZipvwwU
	S4TgeTIVDA6OgRuhDD5UzXvviCRSfSZStDOMJUV5vRHq+yTwRzjkGN6C1wONlMTAXyzV3xlpbXQ
	5Y6YGcWfnaxchzTdi5MlKjJsVp3zjFa5AANvNks8yhU4hFxOrBvmgorZyuBJMROmkHf2oyQoEG+
	5T74fJPdjZclFd/RWHulioBAZfz+89E5iAuOGIH0aTCdR8vqjlG6wcwr/GFSWG8Qw+ec/T1LIGx
	RQtphn9GuB2TZ93a8D7EHsYoWvx8JPM4CFoHtTobHpN1K9mZpUVyYRi0QQIo/kvf1fvS3lcIZ6D
	scLeLQ0ryPIDTCQRlKD3eo3e/auxea6w2u2XH1yb8vf7mFTvEd/DOJFyVRINVMqt+zk1uBObq+M
	YEdzSgmC1ZVrVPgg8+7wa8Hkf2XqwiGZS+A0yjByj/f4n/x7c6NDoaBqHXqX3uMbrK3Ry1AhC2g
	QtT1gfgRESILiUiOFZ+4IM0fZgkqe+qfxsUOE2MLO5XSoCUu1oiNwUFvfWc//g==
X-Received: by 2002:a17:90b:586c:b0:3a8:de1:db07 with SMTP id 98e67ed59e1d1-3ae57e2c9e5mr909414a91.5.1793161518184;
        Tue, 27 Oct 2026 21:25:18 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a48c2d3sm1010794a91.5.2026.10.27.21.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 21:25:17 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [blacksail][PATCH 31/60] pjproject: patch CVE-2026-77396
Date: Wed, 28 Oct 2026 17:23:29 +1300
Message-ID: <eaf5f50981bb1ef097bdc945b98f007111e63c4f.1793161233.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1793161233.git.ankur.tyagi85@gmail.com>
References: <cover.1793161233.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 28 Oct 2026 04:25:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131583
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
 
