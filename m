Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7886.1792854832213615516
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 24 Oct 2026 08:13:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=lBjKpqY9;
 spf=pass (domain: konsulko.com, ip: 209.85.128.51, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a214af2076so11067295e9.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 24 Oct 2026 08:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792854830; x=1793459630; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mSJNoNjXajTq3Kul/olGqXxkCeAVD8ZAEwBYhhSxerk=;
        b=lBjKpqY9Jbz5PrEGm+WkYvSG3sqg/F+jDXW7dZ68SffHxrukEteqiM/mCDaN/axN/s
         tWTErMjC3BZw2ijMttmkdFD6LnTJ8tA0+/PUoYpiq3Emy/adwUrpAXGdgQgliDNQxtSB
         nXjA2GB4j9jFyt3jtuVWaIq2otuSd2Dlwu4zs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792854830; x=1793459630;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mSJNoNjXajTq3Kul/olGqXxkCeAVD8ZAEwBYhhSxerk=;
        b=VZaGCAlxSXnaDPjDtUtwxLIltzxFtG6Gd4EAbce7CvjEEpLpHbn+OTgm+u0A1HkKjf
         7MltP2zVO8mT9D4GdLPrdMXRu2UQpVoeEZqzASlEMkvqNN6FZS8UOj/k39vIEqT4Ay9f
         D1YRtATW2K0+ycf3Pr2kUGEYpaW2LCupc5KpW26E7nygPcT03R61BogVGAd71RbmsW58
         itP8akRNFVr2uYF/JIg08ceFTcGkljydrwAzzrFmsw8H1d8YrBsLL4hN+Bbyla6h+0oY
         UIE3DuZ1IY13bvnh7oEcoEDSD7kf6BsGHXaqDjwoUSoVvM/5uZVHyjnTodbCXqkMEqv7
         u6Tg==
X-Gm-Message-State: AFq9FYLKJkakWJM9Cm7FevbC8L5tyFynWurEorIeFTMEEkkIQ5fEE1GF
	SLznOTG09gs+Fq8Je2pY8IdqJetz+ipVa4uIx8+KjFI8DnjElmkmk2+BdipgiNltaV0T0h3tdQN
	KMAjy
X-Gm-Gg: AYBFou0s0GXmR9UqDZQwuPD69mVPZ3ga9BLGMjKQkAGQyKZyQ4Gygsjbx5ehEQW+6fd
	K5FiWOhB0FlzjK+s2Uxna5flWFjmxZ/wZDD72Eii1xvzXSHSOoJaoiIQIDcDKorLN39Ca9Cpwz3
	gguLsKxMhDffUGNqxZqRZNi51VJGoE8HANgNcUWsaEdoUCHPJDAfSfKEwJvo5hbzNweQdfq9dhi
	Fz2R97LkbKO2msbOth7BxHfr2jZxCzDXxtJ6mjtupUuf98WbxcAPAOvs+6UaEvnvMXzQD86j2uD
	uzmk6vWZSzvKnA5wWYKkSldmGQIB7Zn6dlBrInFmUymCIMq5RcFHdoPPLXwQyXWvZH+keLgebt0
	/hZvT7xTiO7Pi3uJgSd2DkgqECUta0Zui1jILXXkTwQzoYC1d8VbIWXfvvkfe0YjUGqYLc05XN3
	wo/Kxdm9JTZI+xtw4FGlYKOrrCuZ2V/scMn64mxMRBGk1F3vdU16LYaRfES/ZlWU2qFwtRdNJ37
	7Qfb6BOmG5lgnWuUB38HpqcW9G33Ngd6cV7M6vJ7vnai8jlMfjwrrS7R4vs7FBhGlpR/t+18kVT
	TKxZJUBg4EDMFGihX3PaQS0QWZSWPMWrsgK/A5KWsaN27ssUa/cjMfi2ljQUMCIyHBmNWGIuAF1
	gahbC
X-Received: by 2002:a05:600c:3b25:b0:4a2:1a:a128 with SMTP id 5b1f17b1804b1-4a35ac9f1ecmr37114465e9.19.1792854829866;
        Sat, 24 Oct 2026 08:13:49 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a55e99fsm60762195e9.4.2026.10.24.08.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 08:13:49 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/2] python3-fonttools: Add recipe
Date: Sat, 24 Oct 2026 18:13:44 +0300
Message-ID: <20261024151345.2917695-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sat, 24 Oct 2026 15:13:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131400
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
 .../python/python3-fonttools_4.67.0.bb              | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-fonttools_4.67.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-fonttools_4.67.0.bb b/meta-python/recipes-devtools/python/python3-fonttools_4.67.0.bb
new file mode 100644
index 0000000000..9ce580e251
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-fonttools_4.67.0.bb
@@ -0,0 +1,13 @@
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
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.47.3

