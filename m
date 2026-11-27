Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17902.1795793637378200747
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Nov 2026 07:33:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Zlg71Q5p;
 spf=pass (domain: konsulko.com, ip: 209.85.221.54, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4b52fcb410dso3301583f8f.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 07:33:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1795793635; x=1796398435; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f2oWW5AjuTCMKTHm8GEc1KzX/J40JFZTufcrLFRpWx4=;
        b=Zlg71Q5pqvw5qgXqydql3DZpQg/F82XuXMLnqcgDLfJ9KZWO+KJk4zCmvNmwhsFbky
         xyqe2tE+1vIuXVVwsW4GeSFV+dekDfx7B6bES8oDPL03SpBeoHXLIEqQnZYM8auBrwPP
         M01gWfQpcQSGfIDqz4QoQXeXh9dfSPAKFtY2c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795793635; x=1796398435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f2oWW5AjuTCMKTHm8GEc1KzX/J40JFZTufcrLFRpWx4=;
        b=jj7kDbL9RMfzKbnJFWx4sV7FyOsO8UABYCyrKD+Il8IUAc/+kJbr/lqiG+HLddKI2a
         MlQ20cHLB+DGEOZQXAsx8gndilDxqy6EQDLkLGaRVZOSNXtvC6Yl/Jg8ycpWvDAn6cop
         S12CsPw4E50Fcax9pnCf3oQ8e8he8mFmphCb7DCssxM2U8s5FlswG9NZSlRKQP3KSwVP
         L55vCkmrrYbvYT4OhlOGRPQqFS6U64XqhixuOmtTDNbhbi/9OBTMcLfXzDoEm6jsfQ9s
         8WfArZ6MasmBlQKuDaMhn5V+e0IsoxJHU9LQkJttLX3L9xaUEAL08Iw7/99s6yIjCYiB
         9hhA==
X-Gm-Message-State: APuU4Z8SdmTGKmInM6NXoupkusudx5bkWoHuPArMxWNeQsRYLCwZGfAf
	l6OTKGnjjCQblswph0/48lxCY0YtFCUhPfbdsOqeA2a58Kqdhh2kJ74qMqPks6WhvNOH3xK2l8u
	5w2GT
X-Gm-Gg: AZFdTZd8lI5zS8tvByb7wtjXzZ/KqTp7sYGLqKpaMFgRE940OEmn0y+uLAA+pkAetUR
	k63RK4T0Y3Ip84KJta6MG3vyWcjdPBRcj3dQXqGVkz33He+bH0dlzeYd91oiQ8hnc5oAGyhboxZ
	okGRq9tBcMnPNqo859FndOx/vGzKE7AsmB2T0a/Rb+Zo7/Hub54Xo3iswHlqv/EcpcMhBE07sYS
	cVGhfjDQL6Eobv787NfOi6pz6fkHqRFYZEb9Eq08O7s2wwKdSlzvqI3tVIfTRPdQcLkf1jGjNzJ
	GcDJyJnXeZ/sT7+cslGAli7Jr9pGZSU75Dcxr7F0rg/A90qXIszNwlcWCMdWGSCqN1ZlbEmzzVN
	QORHzldHhAd/juBo9MgnUp5hu5/JuSbCgzhdxxvac62b24SmMGv5jnXSdutBbOZ3lROnlmycjUh
	0bNCRvUok9CrRlGdV2S/ZN3WVNE5iIQwxnyNDuZPOWjw8cSnEF0HpzXiFPCeqxoXy6MwcfhrQoM
	rwHizx5TRD2AYT1v7f8ujxzVsnwVxdpkcVOQszocEAXZMvdpDl812BmCm5/4jmO58bh3oEzC1SZ
	K/gDb7ijthTckbU3yZFXaZOxDuVIxkZibjXp9WZJY8WEr7I+zeD9ODzxOrBpSfzJfsFk6ratA1a
	8xseJTNF4FHcJjDDfLZHFnl/y4OqDLuIhjwmxfF982GKaSwztm5oP9A==
X-Received: by 2002:a05:6000:2893:b0:4a9:6c58:1799 with SMTP id ffacd0b85a97d-4aa56c442f6mr56874087f8f.13.1795793635601;
        Fri, 27 Nov 2026 07:33:55 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b3415763f7sm24174207f8f.9.2026.11.27.07.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 07:33:55 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 6/6] python3-svglib: Upgrade 2.4.0 -> 2.5.0
Date: Fri, 27 Nov 2026 17:33:48 +0200
Message-ID: <20261127153348.2880928-6-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127153348.2880928-1-leon.anavi@konsulko.com>
References: <20261127153348.2880928-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 15:34:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133381
Content-Type: text/plain; charset="utf-8"

Upgrade to release 2.5.0:

Security:

- A long transform attribute could make convertTransform() take
  time quadratic in its length: each pair of brackets rebuilt the
  whole string, and the result was checked only afterwards, so 2 MB
  of brackets, which a 3 KB .svgz file holds, kept svg2rlg() busy
  for minutes (CWE-407, GHSA-43qg-v5jj-vw5c). It is read in one
  pass now, with the same result. Thanks to @lanjianchun for the
  report.
- An <image> that refers to a fragment of the document, with
  href="#id", was rendered again without the checks that <use> has
  had since 2.3.1: a cycle, such as an <svg> that contains an
  <image> that refers to it, ended in RecursionError, and a few
  <image> elements that refer to each other, each level to the one
  before it twice, took time that doubled with every level, so that
  2 KB took hours (CWE-400, CWE-674, GHSA-cmj4-5g24-pp37, reported
  again as GHSA-4fr5-v6hm-mwjg). A cycle is now skipped and an
  error is logged, and all <image> targets count against the same
  budgets as <use> (MAX_USE_EXPANSIONS, MAX_USE_CLONED_ELEMENTS).
  An <image> that refers to an element that is not defined yet is
  skipped too, and not an AttributeError. Thanks to @GeniusKangaroo
  and @john-lawniczak for the reports.
- An image embedded as a data:image/png or data:image/jpeg URI was
  opened by Pillow with the decoder chosen from its bytes, not from
  its label, so a PostScript file made it run Ghostscript, where
  that is installed, when the PDF was drawn (CWE-20, CWE-94,
  GHSA-h5r7-mh88-vjm4). Such an image is now decoded as a PNG or a
  JPEG only (DATA_URI_IMAGE_FORMATS), and anything else is refused
  with the UnidentifiedImageError that data that is not an image
  already got. Thanks to @superbot-helper for the report.

Tooling and housekeeping:

- CI runs PyPy 3.11 on Ubuntu 24.04 instead of ubuntu-latest, which
  is Ubuntu 26.04 now: the PyPy wheel of lxml needs libxml2.so.2,
  and 26.04 doesn't have it, so the PyPy job failed at import time.
  The other jobs follow ubuntu-latest.

Fixed:

- A gradient with spreadMethod="reflect" or "repeat" is now
  repeated past its ends, as in browsers; it was painted black
  there. Every other period is back to front for reflect. An
  unknown spreadMethod is pad, and so is a gradient that would need
  more than 200 periods, or more than 10,000 stops in all of them
 .
- The stop-color and stop-opacity of a gradient stop can now be set
  by a CSS rule, such as the classes of the SVG that Illustrator
  exports (.cls-1 { stop-color: #fff }); the stop was black. A
  <style> element now applies to the whole document, including the
  elements before it, as in browsers, and not only to the gradients
  in its <defs>: a shape that comes before a <style> that styles it
  is no longer black.
- stop-color set to currentColor in a gradient stop no longer makes
  svg2rlg() fail with AttributeError; it is the color of the stop,
  as in browsers, or black when none is set.
- hwb() colors of CSS Color 4 are now converted to sRGB, as oklch()
  and oklab() are: they were not read and the shape was not drawn
 .
- stop-color and stop-opacity of a gradient stop can now use var(),
  such as the stop-color="var(--fill-0, #171D25)" that Figma
  writes: the stop was black, and the gradient with it. A var()
  without a value is as if the property was not set.
- A gradient that refers to another one with href now takes the
  geometry, gradientUnits and spreadMethod of that gradient when it
  does not set them itself, as in browsers: it used its own
  defaults (x2="1", pad, objectBoundingBox) and so a gradient set
  on the first one was lost.
- The offset of a gradient stop is now limited to 0 to 1 and to at
  least the offset of the stop before it, as in browsers: a stop
  beyond the ends, such as offset="150%", or before the previous
  one drew a different gradient.
- CSS font-size keywords such as large, x-small, larger and
  smaller, in the font-size attribute, in style attributes and in
  the font shorthand, no longer make svg2rlg() fail with
  ValueError. Absolute keywords use the CSS Fonts values for a 16px
  medium, and larger and smaller scale by 1.2.
- Relative font sizes such as 70%, 2em and larger are now resolved
  against the font size of the parent element, as in CSS, instead
  of the default size, so <tspan font-size="70%"> inside <g
  font-size="20"> gets 14 and not 70 (#327, #538).
- Color keywords and function names are now read regardless of
  case, as in CSS: fill="White", stroke="RED", RGB(255, 0, 0) and
  currentcolor no longer leave the shape without a fill or stroke
 .
- The CSS named colors rebeccapurple and lightgray, which ReportLab
  lacks, are now read, and darkseagreen is #8fbc8f as in CSS, not
  ReportLab's
8fbc8b.:

- The content of a nested <svg> with a viewBox is now drawn at the
  size given by its width and height; it was drawn at 75% of that
  before, because the px-to-pt factor of the drawing was applied a
  second time to the nested viewport.
- A clip-path given in a style attribute or a CSS rule, or as a
  quoted or spaced url() such as url("#clip"), now clips the
  element; only the clip-path="url(#clip)" attribute did before.
  Illustrator's CSS exports and svgo-optimized matplotlib charts
  set it in CSS.
- The hue of hsl() and hsla() may now have a CSS angle unit: deg,
  grad, rad or turn. fill="hsl(120deg, 100%, 50%)" was drawn black
  instead of green.
- A light-dark() color, which draw.io writes in its SVG exports, is
  now read as its first, light color, the one CSS uses when no
  color-scheme is set; the shape lost its fill or stroke before
 .
- var() is now read, in fill, stroke and other values, as Figma and
  VS Code write colors that a theme can change, such as
  fill="var(--fill-0, #171D25)": it is the custom property of the
  element or an ancestor, set in a style attribute or a CSS rule,
  or else its fallback. Such a value was not read and the shape was
  not drawn. A value that needs more than 1000 replacements, or
  becomes longer than 100,000 characters, is invalid, so a small
  SVG cannot make it take exponential time.
- An <image> that references an SVG document now draws it in the
  viewport given by its width and height, with its own
  preserveAspectRatio, as browsers and Inkscape do; the document
  was drawn at its own size, ignoring the size of the <image>
  (#237, #547).
- fill and stroke set to currentColor in another case, such as
  currentcolor, or with !important, now use the color property;
  they were drawn black.
- width="auto" and height="auto" on an <svg>, as Figma writes them,
  for instance in the country flags of the ProtonVPN apps, are now
  read like a missing width and height, also on a root <svg>
  without a viewBox; svg2rlg() failed with ValueError: Can't
  convert 'auto' to length.
- em and ex lengths in the geometry of shapes, such as width="2em"
  or r="1em", and in the width and height of the root <svg>, now
  use the font size of the element, as in CSS; they always used
  16px before.
- oklch() and oklab() colors of CSS Color 4, as in the social
  preview images of react-window, are now converted to sRGB: they
  were not read and the shape was not drawn.
- The x and y of a <use>, and of an <image> that references SVG
  content, are now read as lengths: with a unit, such as x="20px"
  or y="1in", or as a percentage, the content was drawn at the
  origin before.
- A <clipPath> without any shape now clips its elements away, as in
  browsers, instead of leaving them without a clip:
  clip-path="url(#clip)" of an empty <clipPath> drew the whole
  element.
- A gradient with no extent, that is a linear gradient with both
  ends in the same place or a radial gradient with a radius of 0,
  now paints the shape in the color of its last stop, as in
  browsers; it was black or the first color.
- The gradientTransform of a linear or radial gradient is now
  applied, with translate, scale, rotate, skewX, skewY and matrix,
  in the units of the bounding box and in the user space, and it is
  taken from the gradient it refers to by href; it was ignored, so
  a gradient rotated by Figma or Illustrator ran in the wrong
  direction. A radial gradient scaled by it is an ellipse. With
  spreadMethod reflect or repeat, the periods that cover the shape
  are counted in the space of the gradient, and a transform that
  cannot be inverted, such as scale(0), paints nothing, as in
  browsers.
- A percentage in the coordinates or radius of a gradient with
  gradientUnits="userSpaceOnUse", such as x2="50%" or r="25%", is
  now a percentage of the viewport, as in browsers: of the width
  for x1, x2, cx and fx, of the height for y1, y2, cy and fy, and
  of the normalized diagonal for r. It was read as a fraction, so
  x2="50%" was half a user unit long.
- The preserveAspectRatio of a nested <svg> now aligns the viewBox
  to the top for yMin and to the bottom for yMax, as in browsers;
  they were the other way round.
- A radial gradient in the units of the bounding box on a shape
  that is not square is now an ellipse, and a slanted linear one is
  skewed, as in browsers, because the gradient is stretched with
  the bounding box; they were drawn as a circle, and with the lines
  of equal color perpendicular to the axis.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-svglib_2.4.0.bb => python3-svglib_2.5.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-svglib_2.4.0.bb => python3-svglib_2.5.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-svglib_2.4.0.bb b/meta-python/recipes-devtools/python/python3-svglib_2.5.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-svglib_2.4.0.bb
rename to meta-python/recipes-devtools/python/python3-svglib_2.5.0.bb
index 4b77e8d092..b101f23f02 100644
--- a/meta-python/recipes-devtools/python/python3-svglib_2.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-svglib_2.5.0.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b52f2d57d10c4f7ee67a7eb9615d5d24"
 
 CVE_PRODUCT = "svglib"
 
-SRC_URI[sha256sum] = "90f58628ca7e6d48b40f638ad0dab472f2994f823eb33a623c8fa28e434ce574"
+SRC_URI[sha256sum] = "d7c908f6c942ba0b60f494939a80a6f5db35d28f73dffcfbc4ecabc58a2c6394"
 
 inherit pypi python_hatchling
 
-- 
2.47.3

