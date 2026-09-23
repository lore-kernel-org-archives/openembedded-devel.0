Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68C73C98304
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 14:31:50 +0000 (UTC)
Received: from mail-wr2-f43.google.com (mail-wr2-f43.google.com [74.125.225.107])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8466.1790173901538921625
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2026 07:31:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Adr5hGuG;
 spf=pass (domain: konsulko.com, ip: 74.125.225.107, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr2-f43.google.com with SMTP id ffacd0b85a97d-482f62ccdb1so429814f8f.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 07:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1790173900; x=1790778700; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HlrB/8m6AVIHgx6yXGKB3klKOyZ5HWvv1ZiJSDmH9og=;
        b=Adr5hGuGsjVrtTJAg0MTbdmsxk9vA43NZ6/33fX5XdR0kPlH16QYIPk91h+gaMKgaq
         feCKnyqHzvIAqm8IVJjzn7ZEt27opfGMf2X6M7DV8I8e8Z4c/YtWDytLwpSJbdqjA04H
         iPu5iyyzL00LTEx0dHf+4WgpCK6ddK7pB2IEI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790173900; x=1790778700;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HlrB/8m6AVIHgx6yXGKB3klKOyZ5HWvv1ZiJSDmH9og=;
        b=TTptAuBfziUx+BKNVY30nQ1UEtbp/+1mUiyvaUHe1KQjIlykqMledqDDBy/ROCiiEi
         qVsR0oB1lMQ1P+gXkcAsiy5GQd0x3ToyxLTUCzCqYSpsshZdZIs6n5dFNGi//X0eEDx6
         hClkxdvTSsPDP2n02C5RItWxukpMDLEIBULp+lDGMwi4muhRJSJ8PEAR68aavTFqR7hI
         3u4ANNKQz14YtElERkWU+IL/Ci3XRktHeDInx+cnpXddOJHX9eQn7bTnaRK9zZlxS6+n
         LnqgUmmkpTPy+YQsdorRxac5tAWwRCtuKbyp8+pbvkx8xBkq9XdGJjpZb+F8i1bwSxRa
         BNKA==
X-Gm-Message-State: AFuF++n35CVWEUOnDkhcnuvXR16IHCqLEBj9NtnaFnlevu+9B9bnkdgH
	mlAhVpo17PagAIDv9x4kQHp0EF7uHpzgiM5WBh635JEdBeViyjuvZlBoW3Q4YgAQFVx7p60pPQd
	4mHpb
X-Gm-Gg: AYBFou0X3tvtsZotw89uVYv1QeOJiG7J3wjXH1b699AkMr5c+DFvKzwv4v9Pq6fwamh
	OEpgi1CoN8xwmez49ijWYKJA3jXGnaZlyEwydv1B0SYQiDamjAhNKpPnuKCWOb9KE5OrFBFNn1U
	xhqVSOSRh4XwAMXWRYPZQfMUB3SPl8VlCwDrIRk3YeBwipR//Z+7ewuKBx5jp6h13QY9T2n5GtP
	ezbebbOZa9TvfcWpiupN/+kPMpX+t8sqTussxII22wOB4ucxmV6c2I1zrddsdiI9NYR08vLAjAK
	b5zJRusdTZxUmw94rjgfbKgdzSkWcGHR2D94ZNLfAvcoKBTkTi4yhE8YgcKT8e6WM5YKmn192KU
	M+MMhhbWsnhyyTj1/b8lJcvYu1Qkf5CR3i0fAuFxKV03HVtKT8WrgwYa/tFzc79P4zSRgUnDMYT
	ulEjjMgwkfn9mhpm60K+lUHmWXte1LCVXCExpic0mElRVGxeug1pJJnjLwHmIwCwhCuvDQmJIhg
	BmXvj8cKEyiZ4YdndbsbK4hqOL3bqH/48SSre42/StwdN3A+7Rka3hNFU8ApWTw+VOo+PuJwAFk
	A95duMp4t8HqRfw27Jl9Ots=
X-Received: by 2002:a05:6000:26c6:b0:488:5fa9:34aa with SMTP id ffacd0b85a97d-4886718e867mr5054392f8f.20.1790173899641;
        Wed, 23 Sep 2026 07:31:39 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-488684864c8sm7381248f8f.13.2026.09.23.07.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 07:31:39 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-multimedia][PATCH] libheif: Upgrade 1.23.2 -> 1.23.5
Date: Wed, 23 Sep 2026 17:31:35 +0300
Message-ID: <20260923143135.3362743-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 14:31:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130239

Upgrade to release 1.23.5 with the following security issues:

- CVE-2026-XXXXX (GHSA-v8qw-hwjv-44hw) Memory exhaustion through a
  mismatch between the container and the bitstream image size. A
  crafted image can declare a small size in its ispe property while
  the bitstream declares a much larger coded frame. The
  container-level checks used the ispe size, so the oversized
  bitstream reached the decoder, which allocated a frame buffer for
  the in-band size before libheif rejected the mismatch. The
  advisory demonstrated this for AV1 with the libaom backend (a
  351-byte AVIF declaring 64x64 but coding up to 27648x27648,
  allocating hundreds of MB to more than 10 GB), but the same class
  affects every codec whose real frame size lives in the bitstream.
  The coded size is now checked against max_image_size_pixels in
  the codec-independent decode path, before any bytes reach a
  decoder plugin: all AV1 sequence headers, all HEVC/AVC/VVC SPS
  NAL units (including those carried in the item data, not only the
  ones in the configuration record), the JPEG SOF marker and the
  JPEG 2000 SIZ reference grid are scanned for the largest coded
  size. (high)
- CVE-2026-XXXXX (GHSA-qwpf-5wf7-r996) Heap use-after-free and
  double free when encoding an image that carries a TAI timestamp,
  including transcoding a file with an itai property.
  ImageDescription shallow-copied its raw heif_tai_timestamp_packet
  pointer, and a temporary in ImageItem::encode_to_bitstream_and_boxes()
  freed the packet while the item and the source image still held
  it. The timestamp is now stored by value. (medium)
- CVE-2026-XXXXX (GHSA-9c75-9g8r-4728) Memory amplification through
  a JPEG 2000 pclr box declaring zero palette columns. The
  entry-count bound was skipped for zero columns, so an 11-byte box
  allocated 65,535 empty palette entries, and nested j2kH containers
  could repeat this within the child and nesting limits: a 3 KB file
  reached about 330 MB RSS, none of it charged to max_total_memory.
  Zero columns are rejected (ISO/IEC 15444-1 requires 1 to 255),
  the byte bound is unconditional, and the palette storage is
  charged to the memory limits. (medium)
- CVE-2026-XXXXX (GHSA-r7gr-2xm2-23wf) Heap out-of-bounds read in
  alpha compositing for uncompressed (unci) images whose colour
  planes have different bit depths. Op_flatten_alpha_plane read
  every plane through the sample type of the first colour plane, so
  an 8-bit blue plane next to 16-bit red and green planes was read
  with a halved stride past its end, and the bytes ended up in the
  composited output. ColorState now tracks one bit depth per plane,
  and the operator declines mixed sample widths at planning time.
  (medium)
- CVE-2026-XXXXX (GHSA-q492-cfcm-895h) The OpenJPEG decoder
  plugin's pre-decode size check bounded the JPEG 2000 window span
  (x1-x0)*(y1-y0) but not the absolute reference-grid coordinates,
  so a codestream with a 17-pixel window on a grid near the 32-bit
  boundary reached opj_decode(). Against OpenJPEG 2.3.1 this
  produced a heap-buffer-overflow write inside OpenJPEG (the class
  of CVE-2020-6851); OpenJPEG 2.5.4 rejects the input. The
  reference-grid area is now bounded as well. (low)
- (GHSA-qfj5-c4pq-q998) Heap out-of-bounds read in the uncompressed
  encoder when an application attached a separate alpha plane to an
  image with an interleaved chroma format. The interleaved encoders
  took their component list from the chroma format (three entries)
  but decided whether to write alpha from the presence of an alpha
  plane, and indexed the list at [3]. heif_image_add_plane() now
  rejects a separate alpha plane on interleaved images, and the
  encoders derive both decisions from the chroma format. Only
  reachable through the public API; decoding never produces such an
  image. (low)
- (GHSA-7pwf-qh74-p35w) The caller's heif_security_limits were not
  applied when parsing a mini box (the MIAF minimized image format)
  or the av1C/hvcC blob embedded in it; the built-in defaults were
  used instead. An application that tightened the limits got no
  enforcement of its max_memory_block_size or max_total_memory on
  such files. The allocations are bounded by the bytes present in
  the box, so this could not amplify memory use. (low)

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../libheif/{libheif_1.23.2.bb => libheif_1.23.5.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/libheif/{libheif_1.23.2.bb => libheif_1.23.5.bb} (96%)

diff --git a/meta-multimedia/recipes-multimedia/libheif/libheif_1.23.2.bb b/meta-multimedia/recipes-multimedia/libheif/libheif_1.23.5.bb
similarity index 96%
rename from meta-multimedia/recipes-multimedia/libheif/libheif_1.23.2.bb
rename to meta-multimedia/recipes-multimedia/libheif/libheif_1.23.5.bb
index 05d1b8f63a..49802780c3 100644
--- a/meta-multimedia/recipes-multimedia/libheif/libheif_1.23.2.bb
+++ b/meta-multimedia/recipes-multimedia/libheif/libheif_1.23.5.bb
@@ -8,7 +8,7 @@ COMPATIBLE_MACHINE:powerpc64le = "null"
 
 SRC_URI = "git://github.com/strukturag/libheif.git;protocol=https;branch=master;tag=v${PV}"
 
-SRCREV = "ac1cb05c39008f01525c991ff8b88f84ddf70fd2"
+SRCREV = "413e2a87e6a70b3eccc3a3adc5801179dd2d9e00"
 
 inherit cmake pkgconfig
 
-- 
2.47.3


