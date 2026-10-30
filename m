Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8905.1793358201970143322
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Oct 2026 04:03:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=aR71f8qL;
 spf=pass (domain: konsulko.com, ip: 209.85.221.42, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48c4649b35bso531704f8f.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 30 Oct 2026 04:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793358200; x=1793963000; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G8BGd7Cq41ggiSflrCEHEUvYjuuaJEU+Z7rjwX8C9NU=;
        b=aR71f8qLSkdbUVkusBjE+e+XNZugmZvTm7tVL82Kel+n0kfU2oI1lJN5VTM1Czdxgy
         aLxtWVypr5bbcKLsZegWq38bE93VaWHlwPCfUbMdyES56IVeJeBy8HC4tHJAf9KtNWYR
         yFBX4nm+u6TB0CcB4Dy7GCxyXlKIYA0R9vuNA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793358200; x=1793963000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G8BGd7Cq41ggiSflrCEHEUvYjuuaJEU+Z7rjwX8C9NU=;
        b=tC0hB4zC6Grn1ApbHGBAQrxMsTH4qPVJEDF14ONBZqmMno4jwZg3JXaCpbhUVPc7Nt
         xlTJad+bdkWmH/eAe+vB4d7FO9SLno+OIM/w0MBsZ44OnHGvvTYFVLAuE3lxk4y9e/+k
         FbJSYG47dxG0RR/9hp7EASK7c3AjctgCPZpzbIQB4whgeELvpmRgvJd0xV8xRkljB2ac
         BA4+ebGx6VBKc8OH6WVTCnDrwOgPxBiI1nGa0E6rTWlvVL5wXL0kin1NoWWjkbNJEXaB
         aUglIrREDGk2Z+u5p9FGo9878UFfvd4EggiALmKsAs4u4iVBexglz1QY72ilTK9LFFHM
         LwtA==
X-Gm-Message-State: AFq9FYJPlYv/jBKmMhABWoZz3hgkUvQrMae+y3rnuDgYey8dun1Ua7Wh
	rsli80IgG76aaJinICuLRO7zkB6J5GovTWWXmx9r5eU2afOBke12k2Y/h7KhigFqXMk8yC15E8n
	6rBEx
X-Gm-Gg: AYBFou3pKH4MBzxI1z3m1/0iC40mnH5a+R2xQmNN//5KoTOUhnWgdyQmj3+mXWsCj3z
	onpzSeS5xyFP73xU0JVeoKSbcWF1vh0ZtvJRJ1pKM3YeH1CL5e0qaU4EBqweGUXEFB71kqmrumC
	MSkbA/7bhcvzEzIYNmpdZpiM+Y6nRBlmrOzx0fVV6gUMmvkQHTjajfcRysvryDKv5PAsVgeXCF1
	eYK6kkDbMkdP62omLyQ6skb0DyQ0xzXA2yc4luTs90YA3W4XMZ8GUF/JtmRNFS+uBJIsZOJOP8m
	XUTshIZDV7kgULPtE2gNqRcGWNauKthRwcStco8Q0gQFZlHl7xbtd2+hOgSUScDEpDGgFSDEpCE
	Jtay87XjA83bHplX9JpUW9AApSFGhuSJkyYpVwtXJsJ8Ovx8SpW8OZi7eAUhffvGipttdG/KWGP
	hFNpzTUwCHUaYk+09bpcxngqGuoRXW1bdjyh3bsWGyu3EU3YhDCmfIVATv2aBY0Eicl/m+7p2Pp
	+HWTaVfj5gqsXOYo4WGfOLE+E5jz3mNoctkjLdnYYwhQfrecWQAP6ZpIPlFbHV38P35kHKbGxea
	MVOSNDbyZNqAoHm/1aUIhQwk/qMAgzjaAAPaTO5MQJ5k6nkUbZLMMJh+WtSBDnzK1ZRsehVJuIO
	gYY+kx2rs9cPxc8qYDuSfgEnDrQ0EMUl8ZTf8MNPrMPb2dNZYAxpFM35B4fnTo1Vq79+CIPOsHD
	c=
X-Received: by 2002:a5d:64c9:0:b0:48e:4e00:b737 with SMTP id ffacd0b85a97d-48e6e515ff2mr4604345f8f.54.1793358200081;
        Fri, 30 Oct 2026 04:03:20 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78a4csm2642151f8f.23.2026.10.30.04.03.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 04:03:19 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 06/25] python3-fonttools: Upgrade 4.67.0 -> 4.68.0
Date: Fri, 30 Oct 2026 13:02:50 +0200
Message-ID: <20261030110309.1124614-6-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261030110309.1124614-1-leon.anavi@konsulko.com>
References: <20261030110309.1124614-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 30 Oct 2026 11:03:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131688
Content-Type: text/plain; charset="utf-8"

Upgrade to release 4.68.0:

- [feaLib] Escape " and \ when writing names back out with asFea()
  in FeatureNameStatement, STATNameStatement and
  CVParametersNameStatement.
- [scaleUpem] Also scale the MATH lengths that are not
  MathValueRecords (DelimitedSubFormulaMinHeight,
  DisplayOperatorMinHeight, MinConnectorOverlap, etc.).
- [cffLib] Inherit the initial CFF2 vsindex from the Private DICT
  when decompiling, specializing and instancing charstrings, and
  fix programToCommands miscounting operands when several blend
  operators precede the first stem or moveto.
- [instancer] Round CFF2 outlines and stem hints on absolute
  positions rather than per relative operand, and keep CFF2 Private
  DICT blend values at full precision until they are written back.
- [cffLib] Preserve CFF2 Private DICT arrays that use more than one
  blend group.
- [feaLib] Raise FeatureLibError instead of looping forever on an
  unclosed OS/2, BASE or STAT table block.
- [designspaceLib] When a variable font overrides some
  public.fontInfo keys, merge them with the root-level font info
  instead of replacing it.
- [instancer] Raise an error for FeatureVariations conditions of a
  format other than the supported axis-range one, instead of
  silently dropping them.
- [filesystem] Don't overwrite an unrelated sibling .zip when
  writing a .ufoz or other non-.zip archive.
- [glyf] Fix exponential running time on composite glyphs that
  reuse the same component at several nesting levels;
  getCoordinates now raises TTLibError past 65535 composite points.
- [ttLib] Add support for the beyond-64k tables of the final ISO
  Open Font Format 5th edition: uppercase companion tables (GLYF,
  GVAR, HMTX, GSUB/GPOS extended layout, FeatureVariations 1.1, TTC
  1.1/2.1, DMAP), a ttLib.beyond64k module and CLI, and support in
  FontBuilder, merge, subset, instancer, qu2cu, removeOverlaps and
  scaleUpem.
- [VARC] Keep addVarComponent() locations sparse, passing
  RESET_UNSPECIFIED_AXES via a new keyword-only
  resetUnspecifiedAxes pen argument.
- [woff] Require brotli >= 1.2.1 and brotlicffi >= 1.2.1.0, which
  fix GHSA-9v8h-qqgm-4m35.
- Build Windows ARM64 wheels.
- [instancer] Fix AttributeError: ElidedFallbackNameID when
  updating font names of a font with a version 1.0 STAT table; fall
  back to the subfamily name.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-fonttools_4.67.0.bb => python3-fonttools_4.68.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-fonttools_4.67.0.bb => python3-fonttools_4.68.0.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-fonttools_4.67.0.bb b/meta-python/recipes-devtools/python/python3-fonttools_4.68.0.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-fonttools_4.67.0.bb
rename to meta-python/recipes-devtools/python/python3-fonttools_4.68.0.bb
index 9ce580e251..f7175993de 100644
--- a/meta-python/recipes-devtools/python/python3-fonttools_4.67.0.bb
+++ b/meta-python/recipes-devtools/python/python3-fonttools_4.68.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://github.com/fonttools/fonttools"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=211c9e4671bde3881351f22a2901f692"
 
-SRC_URI[sha256sum] = "3cb57e6600ca77c0b1729cf8adc23bc0652633a37f18cfa934d9c7bc3de25519"
+SRC_URI[sha256sum] = "73294e233070f71e2b3653b6bd8564af676d57f26d075761fb06d1ab2e4a7a5d"
 
 inherit pypi setuptools3
 
-- 
2.47.3

