Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19.1794324468145860550
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Nov 2026 07:27:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Sg4iOif+;
 spf=pass (domain: konsulko.com, ip: 209.85.221.46, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48b001cd92bso1102529f8f.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Nov 2026 07:27:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794324466; x=1794929266; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1efKx5V3ueKgpZpDSYDpQk0IkXWRHSR+EeYVEhH3+5Y=;
        b=Sg4iOif+T/eD1bpK4TL7HOfV+QWuP9mCS3dV4PZ0JScOAQ5zDnE0z/AQaL/oOVnMd5
         x7VtkGXJGrwFwVvpISpRGPvIMJXAkQBrk+BzFdqwxf+IwKAD4mDUqcDZmDbcpbsrKu7n
         Kr7WUaxoNVHwPgAD6sg9NBau/VmUetXItTArc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794324466; x=1794929266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1efKx5V3ueKgpZpDSYDpQk0IkXWRHSR+EeYVEhH3+5Y=;
        b=Q7KgCvCZXYMLozWITWfp+Fp6QgVNlrIzVRBsr2v8yyvHLg1aunFK0QYwIYSYrk/cxs
         m7i7VyCj3UizXuQ40L3eWlH7vIuLFJp7ScEkZXsm9Tmk0P4rdqZNsSP5Vfk5+pyBPhqF
         Usk3qBDzFdHbr9lf6kFs8fyDV7SD/vgvaGg5W5GsPoXME4Qby7eG/H0IOI3dW/n7wCIo
         mXD/NNier9j1fIt277CUHY/EcE7Xb6aehOherwNzqMBWWaOh6xyfMIy3Zgsevw54kGVm
         1CjhosEdqwdifkoUPoi0JFQ/w/G2JZeQ2oSGpmNubZC22/S+rcfz6lHjdNjjE1RUBwK7
         YjIA==
X-Gm-Message-State: APuU4Z90TDuzYHTIuaqdK+TqYtIzSKQOTiCFK+vhmLAU+F8ju92LO0Bl
	Er3l3sVstAJBoJPY9MED0N3GjEgWKWbf5x7if5gtp3JN7K/dVV9rrNHwb3Wh3ukCAAb4F+y1sya
	fF2A3
X-Gm-Gg: AYBFou076hhXciMT7rWSXDR+aTF8LGsr1Xox4BBTsKh09WX7mbCD2Fskw4BvBvGjHd2
	3gIUB0RicJrgBMIimftTLzV6TfRfGp/ZfbWFoBWHPE6Zk4ae4Dk3HtglrFCvarA/wKn7dhdfDEO
	9DlQPZgwbc5QV0liNJ4ERhkV+y5SsouIgFxEMdFeA4yikYeRaqrDem8vOKONR5M7vFYFUbQibC7
	vV3JqtaxVnrF03fxQUIDMJKkMjo/V5OKmUXO+FR/wi4Nk8y1vBFOYE0b4Qu1cd7+3gSIWqTsdke
	HxIkcR7fgDZsIZWCgosRujsr49GIpWAivUYaZRNRnP/+lJTkoOi0XkBj43lsULksR65DD5qPVmk
	Z8CAvq9k2gFrDAVwi8EZ70wo1W509wadoGclR6Tv5vFYfigGIPfi0oKGSffx7AlG6fYfIO+XlpA
	Kz++TUCGoa2foG7oXNTqBn6dNNLDAbsiGokXc5YWLRDJ45Zw+hcfjXQn8Ls0JAlgGGo+aE5zrrK
	oZWZW9ntjLo1sksmdThO7AaUIuKx+0CFwigGknbY5VBqW+rzmoejkW2wD430495Z5ATzR64/VyH
	enU4h7cSgaXFF7nh/yiNEhif/66ScmQswoU/o/Yot3aozP7tFx1qv9s8qfEnzegZaLyGm1MVuhC
	cJq79NaGiwInSwmmBsnz0MXCjXyz7RlPjO7e3h1F8iHc5scO63uJ5iQ9od54n
X-Received: by 2002:a5d:59c9:0:b0:493:edc3:6659 with SMTP id ffacd0b85a97d-49830b97a30mr5629961f8f.49.1794324466376;
        Tue, 10 Nov 2026 07:27:46 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a3f4esm6064071f8f.53.2026.11.10.07.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 07:27:45 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 15/19] python3-svglib: Upgrade 2.3.3 -> 2.4.0
Date: Tue, 10 Nov 2026 17:27:25 +0200
Message-ID: <20261110152729.1065911-15-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261110152729.1065911-1-leon.anavi@konsulko.com>
References: <20261110152729.1065911-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 10 Nov 2026 15:27:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132089
Content-Type: text/plain; charset="utf-8"

Upgrade to release 2.4.0:

Added:

- <textPath> is now supported: text follows the <path> named by its
  href or xlink:href, with startOffset (a length or a percentage)
  and text-anchor, and styled <tspan> children. ReportLab can't
  draw text along a path, so each glyph is placed and rotated
  individually, at the point of the path under its midpoint; glyphs
  beyond the end of the path are dropped. Only paths of the same
  document can be followed, and side, method, spacing and per-glyph
  dx/dy/rotate are not supported.
- The plain opacity property is now supported, as a presentation
  attribute, in style attributes and in <style> rules, including
  percentages. Opacity composes down the tree, so a shape at 0.5
  inside a group at 0.5 is drawn at 0.25. It is applied per shape,
  so overlapping shapes inside a translucent group show through
  each other, and images are not affected.
- The CSS font shorthand is now expanded into font-style,
  font-weight, font-size and font-family, in style attributes and
  in <style> rules. Invalid shorthands are ignored.

Removed:

- Dropped support for Python 3.9 (and PyPy 3.9). pip 26.2.2, the
  new minimum safe version, requires Python 3.10 or newer.
  requires-python is now >=3.10, the 3.9 classifier is gone, and CI
  no longer tests 3.9 or PyPy 3.9.

Tooling and housekeeping:

- CI now fails if a locked or installed dependency, or the uv
  binary, is below its minimum safe version
  (scripts/check_min_versions.py).
- CI runs the lowest supported Python, 3.10, next to 3.13, 3.15 and
  PyPy 3.11. Python 3.15 is declared supported (classifier and
  tox).
- make install installs the dev dependency group (it used the dev
  extra, which doesn't exist), make uninstall no longer passes an
  option that uv pip doesn't know, and make test-dist works:
  scripts/test-dist.sh builds the wheel and tests it in a clean
  virtual environment. New: make check-versions.
- tests/test_basic.py is split into modules by topic
  (test_paths.py, test_text.py, test_text_path.py, test_use.py,
  test_gradients.py, ...). The tests that download files carry the
  pytest marker network, so pytest -m "not network" (or make
  test-fast) skips them.
- tests/test_public_api.py records the names, signatures and class
  members of svglib, svglib.svglib, svglib.utils and svglib.fonts
  in tests/public_api.json, so that restructuring the modules can't
  silently change what user code can import.
- The READMEs and notes in demos/ and tests/ are Markdown now, and
  the testing instructions describe the current uv and Makefile
  based workflow.

Fixed:

- A style attribute or <style> rule whose value contains a colon or
  a semicolon, such as cursor: url(http://example.com/c.cur), auto
  or a data URL, no longer makes svg2rlg() fail with ValueError or
  truncates the value. Declarations are now parsed with tinycss2,
  malformed ones are skipped, and !important and comments are no
  longer part of the value.
- baseline-shift on text is now also read from style attributes and
  <style> rules, and a percentage is taken relative to the font
  size instead of being used as a length in user units. A value on
  an enclosing <g> does not affect the text, as the property is not
  inherited.
- stroke-dasharray values that SVG calls invalid (any negative
  length, or a list that sums to zero) no longer produce an invalid
  PDF dash pattern and raise ValueError while rendering; they give
  a solid line. none no longer relies on a swallowed exception, and
  an odd number of values is repeated once to make it even, as the
  specification requires.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-svglib_2.3.3.bb => python3-svglib_2.4.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-svglib_2.3.3.bb => python3-svglib_2.4.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-svglib_2.3.3.bb b/meta-python/recipes-devtools/python/python3-svglib_2.4.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-svglib_2.3.3.bb
rename to meta-python/recipes-devtools/python/python3-svglib_2.4.0.bb
index 9f47ffe581..4b77e8d092 100644
--- a/meta-python/recipes-devtools/python/python3-svglib_2.3.3.bb
+++ b/meta-python/recipes-devtools/python/python3-svglib_2.4.0.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b52f2d57d10c4f7ee67a7eb9615d5d24"
 
 CVE_PRODUCT = "svglib"
 
-SRC_URI[sha256sum] = "1aef52f3dc651416119b55716e673995d2c9f90c86a07df0b2bcf6de26c7e0ff"
+SRC_URI[sha256sum] = "90f58628ca7e6d48b40f638ad0dab472f2994f823eb33a623c8fa28e434ce574"
 
 inherit pypi python_hatchling
 
-- 
2.47.3

