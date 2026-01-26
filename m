Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17A51D13C09
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 13:05:17 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18916.1769432712900379408
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Jan 2026 05:05:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IR5MvARr;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-42fb5810d39so2853993f8f.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 Jan 2026 05:05:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769432711; x=1770037511; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CModWm+42C3+B+CIDkhjxlhR9h4jNubLfrqTRfAG2Mk=;
        b=IR5MvARrNmfWv2AeZyok/pFH1EBT0KXnmtBziLzqoO63DWLGdXGdGa7rdfp+39sCa7
         wKRahlFtenCJVGXbNIneNhrHIRmGkiZv6fm0qlOmFYXTCW/isEzDuJwx2ONAn4noVa5c
         yBQnndOIhFyWK0Me8QekDNBZganqrjojkRxx2eqqTmnbygVd2qPTwPJI7571oPXg6YJH
         H0L0IjX1YKV1iyW075lOwpUEjHUrEFNSHhYqJdvIge4rxv8A3BfO/paOeg/zJmOB4/Br
         lQxmdx1o3arzEJnNS+gbkzIJQg2q+VO4DfACC2LLul3ZfNhhUulKcXhR0NZ6qBYjXIN+
         5b4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769432711; x=1770037511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CModWm+42C3+B+CIDkhjxlhR9h4jNubLfrqTRfAG2Mk=;
        b=Y/EvmgehvRYz8zOJxPkumy09EpaFSTequAifuYBG2d9fYbTmF0C9DXGapOi7U2RWTB
         OcnefkryDdfCAHmvF7PGPNVnnFKNziFF7e4Cx3k5fmNNqE/HTqMZhM9GpexTmqH1HKoc
         3wWid763f3PHZi/3My3IqwCHywT7d8ga6oJc8LSBUVEUG6GyxZIToDmOoM9Kji4+l/I/
         LcEz/idSaIvv4D0Os/fMl1IKfIqQgGY8TKKnRNbMrYY52MEUkaN8xZ1WCRDU7MYhYs9O
         bTWBULFspp7Ojs5C05KBNtG8C27HD75jI/TatzNa9n0G9q0f9EC55wv/d95WW/xlsz56
         bQSQ==
X-Gm-Message-State: AOJu0YzIjKx993ZH9tIkVw0lAt/77phT6jAf6clO74M8iMOf2/x4keSA
	zSWs0E33/mPebvjMXBmB2iZBVs/oUQhpR9kyo2ZMcBw52Zv4AxzL8mLW2L6jLA==
X-Gm-Gg: AZuq6aKMN9RpshLuHlcuOEypaPSaqfCW3YUYWsiKbxRMfEV8lTjw96pl8PbuRN9pbkm
	l/xdz2vwirFI933D6G7Vkw5zK/4I3l4Rp7bxQTPy+eWwFpSGT8+jUPEEBOO8ktbLxOQl3WDPXtE
	igLs4ICWk8unMUTh1oLiNt9H2peB5yc/VEsjv0op+3b2H++YDH1e4lYA3x1jYukYh2z2RNfHsm3
	e9NxYlouFedeUQYcrCnpwWNDIAbCnrKPjNltqKmpgDLnmq+5OO4YYE5NtZ+14AA6KrjQvzYMmfg
	j+2wiaGIOPvH7LmfXrwPTSefMLR5XCAvOT3R7x9MUlqIV3CC657vhwknA2xUuR9U3+zK50p5mAf
	AkyqeWpW/uPCCs5DqhXnp6me0ZWQo2mvzwlqryIlDY/hJ5NADxQP7pUWIlQSqrKmOMtBF8AddYZ
	Tjhty+L/DllIm9x4K4Tx0=
X-Received: by 2002:a05:6000:2483:b0:435:bdc0:48e9 with SMTP id ffacd0b85a97d-435ca1ab666mr6488862f8f.55.1769432711104;
        Mon, 26 Jan 2026 05:05:11 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c24b54sm30897978f8f.15.2026.01.26.05.05.10
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 05:05:10 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][scarthgap][PATCH 05/11] sox: patch CVE-2017-15371
Date: Mon, 26 Jan 2026 14:04:59 +0100
Message-ID: <20260126130506.82699-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260126130506.82699-1-skandigraun@gmail.com>
References: <20260126130506.82699-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Jan 2026 13:05:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123882

Details: https://nvd.nist.gov/vuln/detail/CVE-2017-15371

Pick the patch that was identified by Debian[1] to fix the solution.

[1]: https://security-tracker.debian.org/tracker/CVE-2017-15371

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../sox/sox/CVE-2017-15371.patch              | 40 +++++++++++++++++++
 .../recipes-multimedia/sox/sox_14.4.2.bb      |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/sox/sox/CVE-2017-15371.patch

diff --git a/meta-multimedia/recipes-multimedia/sox/sox/CVE-2017-15371.patch b/meta-multimedia/recipes-multimedia/sox/sox/CVE-2017-15371.patch
new file mode 100644
index 0000000000..f0aa8d39e7
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/sox/sox/CVE-2017-15371.patch
@@ -0,0 +1,40 @@
+From 83bf78913ee813c2c767854eb16acd9e6fb779cb Mon Sep 17 00:00:00 2001
+From: Mans Rullgard <mans@mansr.com>
+Date: Sun, 5 Nov 2017 15:57:48 +0000
+Subject: [PATCH] flac: fix crash on corrupt metadata (CVE-2017-15371)
+
+CVE: CVE-2017-15371
+Upstream-Status: Backport [https://github.com/mansr/sox/commit/818bdd0ccc1e5b6cae742c740c17fd414935cf39]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/flac.c | 8 +++++---
+ 1 file changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/src/flac.c b/src/flac.c
+index 0d7829e..07f45c1 100644
+--- a/src/flac.c
++++ b/src/flac.c
+@@ -119,9 +119,10 @@ static void decoder_metadata_callback(FLAC__StreamDecoder const * const flac, FL
+     p->total_samples = metadata->data.stream_info.total_samples;
+   }
+   else if (metadata->type == FLAC__METADATA_TYPE_VORBIS_COMMENT) {
++    const FLAC__StreamMetadata_VorbisComment *vc = &metadata->data.vorbis_comment;
+     size_t i;
+ 
+-    if (metadata->data.vorbis_comment.num_comments == 0)
++    if (vc->num_comments == 0)
+       return;
+ 
+     if (ft->oob.comments != NULL) {
+@@ -129,8 +130,9 @@ static void decoder_metadata_callback(FLAC__StreamDecoder const * const flac, FL
+       return;
+     }
+ 
+-    for (i = 0; i < metadata->data.vorbis_comment.num_comments; ++i)
+-      sox_append_comment(&ft->oob.comments, (char const *) metadata->data.vorbis_comment.comments[i].entry);
++    for (i = 0; i < vc->num_comments; ++i)
++      if (vc->comments[i].entry)
++        sox_append_comment(&ft->oob.comments, (char const *) vc->comments[i].entry);
+   }
+ }
+ 
diff --git a/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb b/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
index ae5d6d2010..4c5452427e 100644
--- a/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
+++ b/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
@@ -34,6 +34,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/sox/sox-${PV}.tar.gz \
            file://CVE-2017-11358.patch \
            file://CVE-2017-11359.patch \
            file://CVE-2017-15370.patch \
+           file://CVE-2017-15371.patch \
            "
 SRC_URI[md5sum] = "d04fba2d9245e661f245de0577f48a33"
 SRC_URI[sha256sum] = "b45f598643ffbd8e363ff24d61166ccec4836fea6d3888881b8df53e3bb55f6c"

