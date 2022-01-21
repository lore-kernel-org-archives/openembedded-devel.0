Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D034C433EF
	for <webhook@archiver.kernel.org>; Fri, 21 Jan 2022 13:05:46 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web09.11464.1642770344452064449
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Jan 2022 05:05:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=mDfgIXfd;
 spf=permerror,
 err=parse error for token &{10 18 spf.securedserverspace.com}: parse error
 for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded
 (domain: konsulko.com, ip: 79.124.30.14, mailfrom: leon.anavi@konsulko.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=anavi.org;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=WoO5x2LYKuid2fm2EpMjtCOnSzxfjtEN4GNMECM6FM0=; b=mDfgIXfdhAAPYp6/ZSNhJJMHH6
	RdpOVr4KEmlLPPfpz8DsifwPjXM2l77lydatesomKIkMdLDCCbO/9L7QV2HOu+RTZAT/R4Y0od41X
	6l0hxhHqG1euENyTqVYflBZqNwwj4WO0H89km5WQSiZeriCyyF9NFzrnamgvkqaEzyPBZFvaPx2qf
	RoYufgw0JPQJ/P6fRDGwMWihxf88wdpgb0TYtxE3gDsKiY+dG2iaKD0prbHlOMmglRrJuX6C7GIiT
	OmpeBhNLzSo00X/wBmUivk9uuzlfxwTLSaL13TPHr17D8ubf2InPWSCFHie+nqnZgl4D1Qgthyoyq
	YWh9NngA==;
Received: from lan.nucleusys.com ([92.247.61.126]:50940 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1nAtbt-0003GN-3k; Fri, 21 Jan 2022 15:05:43 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-pillow: Upgrade 8.3.2 -> 9.0.0
Date: Fri, 21 Jan 2022 15:05:29 +0200
Message-Id: <20220121130533.3973579-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OutGoing-Spam-Status: No, score=-0.5
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.superhosting.bg
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.superhosting.bg: authenticated_id:
 leon@anavi.org
X-Authenticated-Sender: voyager.superhosting.bg: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Jan 2022 13:05:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94966

Upgrade to release 9.0.0:

- Restrict builtins for ImageMath.eval()
- Ensure JpegImagePlugin stops at the end of a truncated file
- Fixed ImagePath.Path array handling
- Remove consecutive duplicate tiles that only differ by their
  offset
- Removed redundant part of condition
- Explicitly enable strip chopping for large uncompressed TIFFs
- Use the Windows method to get TCL functions on Cygwin
- Changed error type to allow for incremental WebP parsing
- Improved I;16 operations on big endian
- Ensure that BMP pixel data offset does not ignore palette
- Limit quantized palette to number of colors
- Use latin1 encoding to decode bytes
- Fixed palette index for zeroed color in FASTOCTREE quantize
- When saving RGBA to GIF, make use of first transparent palette
  entry
- Pass SAMPLEFORMAT to libtiff
- Added rounding when converting P and PA
- Improved putdata() documentation and data handling
- Exclude carriage return in PDF regex to help prevent ReDoS
- Image.NONE is only used for resampling and dithers
- Fixed freeing pointer in ImageDraw.Outline.transform
- Add Tidelift alignment action and badge
- Replaced further direct invocations of setup.py
- Added ImageShow support for xdg-open
- Switched from deprecated "setup.py install" to "pip install ."
- Support 16-bit grayscale ImageQt conversion
- Fixed raising OSError in _safe_read when size is greater than
  SAFEBLOCK
- Convert subsequent GIF frames to RGB or RGBA
- WebP: Fix memory leak during decoding on failure
- Do not prematurely return in ImageFile when saving to stdout
- Added support for top right and bottom right TGA orientations
- Corrected ICNS file length in header
- Block tile TIFF tags when saving
- Added line width argument to ImageDraw polygon
- Do not redeclare class each time when converting to NumPy
- Only prevent repeated polygon pixels when drawing with
  transparency
- Fix pushes_fd method signature
- Add support for pickling TrueType fonts
- Only prefer command line tools SDK on macOS over default
  MacOSX SDK
- Fix compilation on 64-bit Termux
- Replace 'setup.py sdist' with '-m build --sdist'
- Use declarative package configuration
- Use title for display in ImageShow
- Fix for PyQt6
- Rename master to main

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pillow_8.3.2.bb => python3-pillow_9.0.0.bb}    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pillow_8.3.2.bb => python3-pillow_9.0.0.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-pillow_8.3.2.bb b/meta-python/recipes-devtools/python/python3-pillow_9.0.0.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-pillow_8.3.2.bb
rename to meta-python/recipes-devtools/python/python3-pillow_9.0.0.bb
index bc6c801c3..de3c92c3d 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_8.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_9.0.0.bb
@@ -3,13 +3,13 @@ Clark and Contributors. PIL is the Python Imaging Library by Fredrik Lundh and \
 Contributors."
 HOMEPAGE = "https://pillow.readthedocs.io"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=0337b116233da4616ae9fdb130bf6f1a"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=ad081a0aede51e89f8da13333a8fb849"
 
-SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=8.3.x;protocol=https \
+SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=9.0.x;protocol=https \
            file://0001-support-cross-compiling.patch \
            file://0001-explicitly-set-compile-options.patch \
 "
-SRCREV ?= "8013f130a5077b238a4346b73e149432b180a8ea"
+SRCREV ?= "82541b6dec8452cb612067fcebba1c5a1a2bfdc8"
 
 inherit setuptools3
 
-- 
2.30.2


