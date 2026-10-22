Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18801.1792660637074199550
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Oct 2026 02:17:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=s9VlQF35;
 spf=pass (domain: konsulko.com, ip: 209.85.221.48, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48e1d0e5dafso480193f8f.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Oct 2026 02:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792660635; x=1793265435; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=q3BKueZL3wbB3EBxj7hq2IEZDqy2t2KQ52eH0JoVY6Y=;
        b=s9VlQF35FJ+9ewpHZYZTgvWNLLbOYO2CWoYj9zNxlKueOo6kDJf4Xw9Hi0mUSdpgX9
         ryUgoWvRhLz0/ybe4yluuFeYhMSGWqBc4YCn8vAUHGYWGYnXIT4MpATMSzd6azLBkMku
         2FIDCCWL/JHa+TSVUrCu/H/Sq7+SP9wiz++70=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792660635; x=1793265435;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q3BKueZL3wbB3EBxj7hq2IEZDqy2t2KQ52eH0JoVY6Y=;
        b=oxpJ1JnesQWTSNRPS3jMytrxRX1eal8WIF6e5UdGR6rK19EiSfj7FxO3we0moJvtQB
         IPxHZJ/t97OFt93exUtPiQC0kLRrpm2I8HmoguLZ7A/o1Qdc2aBjqoBJ27Vga8ii/cGF
         stRZdV8VFpUr3hjrx49UX33AiKrEv89Dx1o+PvIJAlomhq9RGydUMHT5RgcUjr9c77iZ
         D/n3QsNn00DEIznbWlauG3ZiMWx8orlMBpYoLmKDDcD/atgOTiqENwEo0D+vfv0RbZK1
         2PIHWzFlesMTbLWuJXPZYoD0LxcI9TfWviOBoOkd37e/N4MGAA/3Q7MioNBkDrvZjunx
         kejA==
X-Gm-Message-State: AFq9FYKULiKt3+dttKkaOBXXjsVhNCe/EwGJRtv3ySjXOtEPuby0VR0P
	F+wmv56wTUJdhv3yX6NKFqK4KupUx9ft5oZh+FYPw0xWh2WoPujr3ii2IdUhzSD9XXqeKB1TfE5
	RgS1q
X-Gm-Gg: AYBFou0zk4BeX//YjMaH7/xvomukzZ7ahU9LMP+kokh4A1gRKzjBzvFVRRkX6wbypAE
	5KBKZVAe5RAa74vRIlYVzwXj38q/lVmE90KJ4WXhwVXXV+sdL0DnEtRsYpi1rfbTaSqGOMf5z5+
	jgAt6WdHl6+WFgk9BEZakB8hNvTQoi6bUqgGIJu/oy+CEiD0hPcEqpHRPbXh/ZyJkQ3FvGd4Ji3
	5gplZu3zPfyyWCNVmQvzbYQwUdWGg/AuoIr7M2wRapgCxMUdCFgMfLjy4TgzMh+ekklSUg/sER8
	OvwN+//T8R0qzY9op5kUBarCxw+7RuAQXoXeHchOVMTF3xwaWyl3580h20ApfltD/z6c9u27OGp
	737R0AUBnXhb1Ru9AqyeF/iSk0h1hX27J17jwMspIkfZ6gMrm2/Py13XANWEhBXkv9MZ3GuGYTt
	QgIg7Tu48gVaKLvbkBpwLTjAsIaSHq3VEs1oN4OjSL73eBSuhzJ6hFJ5lSlcmV7xhaPLmyyiLiM
	dqAxsvrL1TilDMX35tHkz7OjjWbnvjKSdJIPBZ1Dm8SWSfLiZM9e/fcIgSba+s+Exx93ZG+AtBQ
	HNhd3Fa+vKGVQRkbtQ2vwwnXclrYQ1JLYYd5SheDW25HVhiqJWCNRJqiEXRHysYIZlEYLEXwuUA
	dkl/I
X-Received: by 2002:a05:600c:c08d:b0:4a1:d49e:9ce with SMTP id 5b1f17b1804b1-4a204ac82b1mr33359715e9.2.1792660634872;
        Thu, 22 Oct 2026 02:17:14 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e254eeef6sm11255726f8f.8.2026.10.22.02.17.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:17:12 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/2] python3-fonttools: Add recipe
Date: Thu, 22 Oct 2026 12:17:06 +0300
Message-ID: <20261022091708.3453622-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 22 Oct 2026 09:17:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131309
Content-Type: text/plain; charset="utf-8"

Add a recipe for fonttools which provides tools to manipulate font
files. Release 4.67.0 brings:

- [varLib] Support decreasing design-space axis mappings, via a new
  keyword-only allow_decreasing argument to models.normalizeValue.
- [designspaceLib] Allow partial DesignSpace v5 axis subsets:
  omitted range attributes on an <axis-subset> are taken from the
  parent axis, as the spec says.
- [designspaceLib] Fix DesignSpaceDocument.normalize() for mapped
  axes: axis bounds and rule conditions are now normalized from
  their original values.
- [designspaceLib] splitInterpolable and splitVariableFonts now
  warn when a source or instance is dropped because it lies outside
  the document's own axes, instead of silently discarding it.
- [varLib.instancer] Add support for instancing variable COLRv1
  fonts.
- [varLib.instancer] Apply VVAR vertical-origin deltas to VORG, and
  use OpenType rounding for instanced advances and vertical
  origins.
- [varLib.instancer] Keep a universal FeatureVariations record when
  pinning removes its last condition but other axes remain.
- [varLib.instancer] Preserve ppem Device corrections in GDEF,
  BASE, GPOS and JSTF instead of asserting on them.
- [varLib.instancer] Allow requesting an axis's original range on
  VARC fonts.
- [varLib.instancer, subset] Fold, remove or remap MATH
  VariationIndex devices when instancing, subsetting the GDEF store
  or optimizing it.
- [varLib] Raise ValueError: Missing required table fvar from
  varLib.mutator and the instancer CLI on a static font, instead of
  a bare KeyError.
- [featureVars] When adding rvrn, also shift lookup indices inside
  existing FeatureVariations. Handle null ConditionSet and
  FeatureTableSubstitution offsets when building, subsetting and
  instancing. Keep FeatureTableSubstitution records sorted after
  merging new ones into an existing record.
- [ttLib] Fix FeatureParams (size, ssXX, cvXX) in FeatureVariations
  alternate feature tables, which failed to compile and round-trip.
- [ttLib] Fully decode lazily loaded ligatures, SinglePos and
  PairPos arrays during recursive decompilation, so reorderGlyphs()
  on a lazy font no longer corrupts or asserts on them.
- [VARC] Update the variation-store binary format to follow
  harfbuzz/boring-expansion-spec#175:
  SparseVarRegionList.RegionCount is uint32, sparse axes use
  Offset32 and MultiVarData items are stored in an INDEX. VARC
  fonts built with earlier fontTools versions must be rebuilt.
- [VARC] Several fixes: derive component conditions from
  conditionIndex, set the implicit scaleY when importing XML,
  report the font's current coordinates for components that reset
  unspecified axes, and keep inherited coordinates when drawing
  CFF2 VARC components.
- [varLib] buildMultiVarData accepts flattened per-region vector
  tuples.
- [otConverters] Bounds-check CFF2 INDEX count and offSize on read,
  raising TTLibError instead of allocating huge lazy lists.
- [ttLib] Handle empty packed deltas when OPTIMIZE_FONT_SPEED is
  set.
- [scaleUpem] Scale per-glyph VORG origins; fix VARC scaling for
  static fonts and condition variations; don't mutate the shared
  default CFF FontMatrix.
- [cmap] Fix format 2 compilation when all codes are single-byte or
  all single-byte codes map to .notdef. Formats 2 and 4 now reject
  glyph IDs above 65535 instead of wrapping them. Split format 14
  default UVS ranges longer than 256 codepoints. Empty format 12
  and 13 subtables round-trip.
- [glyf] Use unsigned instruction lengths, so programs of
  32768-65535 bytes compile and decompile correctly. Keep
  instructions in zero-contour glyphs.
- [pens] Fix cubic off-curve detection in TTGlyphPointPen across
  contour starts. Glyph.drawPoints() now raises NotImplementedError
  for an all-off-curve cubic contour, which the point pen protocol
  cannot express. RoundingPen passes the all-off-curve None
  sentinel through.
- [CFF2] Preserve operands when a blend has zero regions.
- [cffLib] Read CFF font names as Latin-1, matching how they are
  written. Deleting a CFF dict attribute now actually removes it.
- [CFF2ToCFF] Fix conversion of fonts with local subroutines. A
  CFF2 table with a single FontDict is now converted to a
  name-keyed CFF font that keeps its glyph names.
- [subset] Handle a null GDEF variation store.
- [merge] Support merging fonts that both have a MATH table.
- [feaLib] Reject the same mark class used twice in one anchor
  list. Don't crash on value records whose devices are all NULL.
  Pad a short OS/2 Vendor with spaces.
- [feaLib] Raise FeatureLibError with a location, instead of a bare
  Python error, for: a BASE script list without a matching tag
  list, a UnicodeRange bit outside 0-127, a name string that cannot
  be decoded, a STAT axis location with no or too many values, and
  a non-ASCII OS/2 Vendor.
- [name] Fix the BCP 47 tags of some Mac and Windows language IDs,
  e.g. es was mapped to Mac Estonian. getDebugName prefers the
  Windows English name over the Mac one.
- [post] Don't crash on a format 2.0 table with numGlyphs set to 0.
- [VDMX] Recompute numRecs and numRatios when compiling.
- [Silf] Fix compiling a Silf table that was decompiled from
  binary.
- [woff2] Preserve minorVersion when copying flavor data.
- [ttGlyphSet] Compute glyph width lazily for glyf variable fonts
  without HVAR, so .width is correct before drawing.
- [varLib.interpolatable] Respect designspace source layers; fix
  --json output with SciPy.
- [misc.psLib] Fix tokenizing of escaped parentheses in PostScript
  strings.
- [svgLib] Raise ValueError instead of IndexError on a truncated
  path command.
- [misc.transform] Preserve the direction of the remaining axis
  when decomposing a transform whose first column is zero.
- [misc.textTools] Tag.__ne__ returns NotImplemented for
  unsupported types.
- [misc.dictTools] hashdict rejects in-place union (|=).
- [misc.xmlReader] Close owned input streams when parsing fails.
- [misc.filesystem] WriteZipFS.close() can be called more than
  once.
- [EBDT] Keep EBDT/CBDT glyph metrics after probing a missing
  attribute.

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-fonttools_4.67.0.bb                | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-fonttools_4.67.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-fonttools_4.67.0.bb b/meta-python/recipes-devtools/python/python3-fonttools_4.67.0.bb
new file mode 100644
index 0000000000..f786a2d1e5
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-fonttools_4.67.0.bb
@@ -0,0 +1,11 @@
+SUMMARY = "Tools to manipulate font files"
+DESCRIPTION = "A library to manipulate font files from Python."
+HOMEPAGE = "http://github.com/fonttools/fonttools"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=211c9e4671bde3881351f22a2901f692"
+
+SRC_URI[sha256sum] = "3cb57e6600ca77c0b1729cf8adc23bc0652633a37f18cfa934d9c7bc3de25519"
+
+inherit pypi setuptools3
+
+RDEPENDS:${PN} += "python3-core"
-- 
2.47.3

