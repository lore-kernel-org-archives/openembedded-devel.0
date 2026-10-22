Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18667.1792660641230269277
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Oct 2026 02:17:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=YE7LOss7;
 spf=pass (domain: konsulko.com, ip: 209.85.128.54, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a2072b9832so2259025e9.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Oct 2026 02:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792660639; x=1793265439; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RFzlkP+fslPMzwqzGlwFyALlbKFp96YTPokA9W/FX2M=;
        b=YE7LOss7zl/jFYeIScyLiEhGVAownB8ugLqP0jAwd7lrVkkXDSNvySk/UxkpFYiAs2
         XXRnhXU5+W8TN0HyvJCMJaavjUv2nPqQti7v/kKnk+3OFI5I59ivSLDD4xIYc6szNpTf
         XIAorEVjwaygTzBwKbhh74uzJq/MXXgLPWYEY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792660639; x=1793265439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RFzlkP+fslPMzwqzGlwFyALlbKFp96YTPokA9W/FX2M=;
        b=aBkrSlFW5ohOCgsV+NVsw7pgaUFvCUOPkdQ5vITPdPRrHNGLuKp39DrMs7aon/1kmt
         IbHbz3SQFI4RiUxELr4rg37nDAkGU35GKfpnOdL57ng2+u3T6KtXeGRueJxJ/mlGx80u
         zDuTuXhkPE21iu0IhavUQ1tGWarZP6Xjbt6WOmtH6sfuckPudb9ZxX0C2Y/iBWD5ZIxw
         DJpCTgtDottRT4EVMaa6pVjEf+c32QYhZA+Gc4FXunJRHhtf6kewKdK/r6r6HHEZeOvq
         vPUMLr0umiTiLDwyvrBk5pSg9GMS4UIve4qmcHMmqb4+vJ7cUzPUkbPccaTWSVBPfFMV
         ghjA==
X-Gm-Message-State: AFq9FYKCQpzBeb0cmBkld32wJupDIBoDCOAlu7yjVYnULlchbbJWbzXH
	vCGvDqi/JkRZ24PKibYg1i/dMoscbF8HYeuyVWOr1abquMbDy6v9xXvfTt6GEwg/ohX9BD4vVUQ
	8mWVJ
X-Gm-Gg: AYBFou2h9w2rEHxdgN4o2iVjvcpNv2X1GT3XCeEqQldN2IrJgNvbLMaGsvGJRPz4hFI
	qR0dtek6oNeVmT2O3VXfByly1qqJPm277U2ytpF4gBekiflMEqTIPxMM5RCJBL+FHGGr8ao8NZe
	QHVWLTpCqf9JZNRW+qG65PTAjVWXFxzqK7nmC75U0rCUp7R6d0mGzLUXw23jzdn2RQRwjwVy61r
	M29k0GSWPP4ymJAkniX0yRiyJq4n9z6keqUfLtmACu5gSru9O0wIUbw98pDZ2yPkR4ejSGXBUOt
	+9KzQqVZoUsNaWxGVts0mDFpIulPMikvw0FlxSPfD+dp5ljyWP+qhbGkaIwmMmfCTWhS7F0ENcD
	7i5Z6HCbUBtGl/Ww9Lb/LXHiP1ayVYU8g0ngInQ2+c9F1E5hzNVA5BVakN8WKXC7dZwjHa9cLbF
	upLr1JA4oiYZjWnhgNNkuwpwnH2yTP8rFyInKqAE7Lzhoxxa/gJMYjJ6e75OeTIHaNw7/Q/EE3X
	MLPFvaw2E+3BjqDznDn3BiKHYLNNq1anx2KMVgcXGzQnkL/pfmHAYoDWnucG3LjBpe6Z7GzMvmK
	UfpSfj0H2bSMFJBxnMTxCI2bPo8pMU9A/xgShvf5/istugrterhtugUfCae9MpekSS6qxvrKtkF
	BUqGX
X-Received: by 2002:a05:600c:2186:b0:4a2:10d:5e0d with SMTP id 5b1f17b1804b1-4a204cf2057mr27988135e9.14.1792660638789;
        Thu, 22 Oct 2026 02:17:18 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e254eeef6sm11255726f8f.8.2026.10.22.02.17.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:17:16 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/2] python3-pikepdf: Upgrade 10.13.0.post1 -> 10.17.0
Date: Thu, 22 Oct 2026 12:17:07 +0300
Message-ID: <20261022091708.3453622-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261022091708.3453622-1-leon.anavi@konsulko.com>
References: <20261022091708.3453622-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 22 Oct 2026 09:17:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131310
Content-Type: text/plain; charset="utf-8"

Upgrade to release 10.17.0:

- Added {class}pikepdf.ObjectSet, which records the objects that a
  walk of a PDF's object graph has already visited. Objects in a
  PDF are shared and may refer back to their ancestors, so a search
  that only limits its depth can take exponential time on quite
  ordinary files. ObjectSet.add() reports whether an object is new,
  and tells apart direct objects and objects of different Pdf,
  which a set of objgen cannot. See {ref}walking-object-graphs.
- Added {meth}pikepdf.Object.is_same_object_as, which tests whether
  two references lead to the same object. Neither is, == nor
  comparing objgen answers this reliably.
- Added {meth}pikepdf.Pdf.content_scopes and
  {meth}pikepdf.Page.content_scopes, which iterate over every
  content stream that pages can draw, each with the resource
  dictionary it uses: the page itself, form XObjects, annotation
  appearance streams, tiling patterns, Type 3 glyph procedures and
  soft masks, however they are nested or shared. This is the way to
  find every font, image or colour space a document uses. Each
  {class}pikepdf.ContentScope is reported once for the document;
  pages= selects pages and kinds= selects what is reported.
- Added {meth}pikepdf.Page.get_resources, which returns the
  resources of a page or form XObject for reading. Unlike
  {attr}pikepdf.Page.resources, it finds resources inherited from
  the page tree, does not create an empty dictionary when there are
  none, and returns None instead of raising when /Resources is
  malformed.
- Fixed comparing two objects with == taking exponential time when
  the objects being compared share children, such as the same file
  opened twice. Each pair of objects is now compared once.
- Fixed {meth}pikepdf.Pdf.add_pages_from hanging on a page with an
  action whose /Next actions are shared or form a loop.
- Fixed {meth}pikepdf.Pdf.open_outline reading only the first item
  at each level of an outline whose items are direct objects. Such
  items are now made indirect when the outline is saved, as the PDF
  specification requires.
- Reading a stream that will not decode now raises
  {exc}~pikepdf.exceptions.DataDecodingError with the reason,
  whether the stream's data was read from a file or set from
  memory. Previously a stream read from a file raised a
  {exc}~pikepdf.exceptions.PdfError that said only "read_bytes
  called on unfilterable stream", and the reason was available only
  from {meth}pikepdf.Pdf.get_warnings. DataDecodingError is a
  PdfError, so existing handlers are unaffected.
- An exception raised by a JBIG2 decoder now reaches the caller of
  {meth}pikepdf.PdfImage.as_pil_image,
  {meth}pikepdf.PdfImage.extract_to and
  {meth}pikepdf.PdfImage.read_bytes unchanged, with its own type,
  message and traceback. Previously, for an image read from a file,
  it was replaced by a generic DataDecodingError or PdfError.
- Added {exc}~pikepdf.exceptions.QpdfRuntimeError, raised for
  errors from qpdf that pikepdf has no more specific exception for.
  These were previously raised as a bare RuntimeError, which except
  pikepdf.PikepdfError did not catch. The new exception derives
  from both {exc}~pikepdf.exceptions.PikepdfError and RuntimeError,
  so handlers written for RuntimeError still work.
- The empty name / is now supported. The PDF 1.7 and 2.0
  specifications define a lone slash as a valid name made of zero
  characters, but pikepdf.Name('/') raised ValueError, and
  dictionaries refused / as a key. This broke
  {meth}pikepdf.Pdf.add_pages_from on files with an empty-named
  destination such as /Dests << / 3 0 R >>. Such names can now be
  created, used as dictionary keys, and migrated during page
  copying. bool(Name('/')) is False, like an empty
  {class}pikepdf.String. Name(''), which lacks the leading slash,
  is still rejected. PDF/A does not forbid empty names, and the
  PDF/A validator accepts them.
- AcroFormField.get_inheritable_field_value_as_name() now returns a
  {class}pikepdf.Name, as documented, instead of a str. When the
  value is missing or not a name, it returns the empty name
  Name('/'), which is falsy, instead of ''. Comparisons such as ==
  '/Tx' are unaffected.
- Fixed an out-of-bounds read when opening a PDF from a Python file
  object whose readinto() reports more bytes than were requested.
  This now raises ValueError, as writing to such a stream already
  did. Non-blocking streams, whose readinto() returns None, now
  raise ValueError instead of hanging.
- Fixed building from source on PyPy, which failed to compile since
  v10.0. PyPy now reads Python file objects through readinto(),
  like CPython, instead of copying the result of read().
- {func}pikepdf.open reads directly from the file descriptor when
  given a filename, instead of calling the seek() and readinto()
  methods of a Python file object for every read. Opening and
  reading a large file with many objects is about four to five
  times faster, matching the speed of memory mapping
  (access_mode=AccessMode.mmap). Streams passed to
  {func}pikepdf.open, including plain file objects, are read
  through their methods as before.
- Documented {class}pikepdf.TokenFilter with worked examples that
  shorten numbers and convert RGB colors to grayscale, and
  explained when to use a token filter instead of
  {func}pikepdf.parse_content_stream. The API reference no longer
  says that the parser should not be used to edit content streams.
  The TokenFilter.handle_token documentation now says correctly
  that exceptions it raises propagate to the caller.

Extend RDEPENDS with the missing runtime dependencies
python3-fonttools and python3-jsonschema which are required
to import pikepdf.pdfa.

Install pdfa_differential.py to pass the tests from
test_pdfa_differential.py. Fixes:

E   ModuleNotFoundError: No module named 'pdfa_differential'

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python3-pikepdf/0001-pyproject.toml-Do-not-strip.patch  | 4 ++--
 ...-pikepdf_10.13.0.post1.bb => python3-pikepdf_10.17.0.bb} | 6 +++++-
 2 files changed, 7 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pikepdf_10.13.0.post1.bb => python3-pikepdf_10.17.0.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-pikepdf/0001-pyproject.toml-Do-not-strip.patch b/meta-python/recipes-devtools/python/python3-pikepdf/0001-pyproject.toml-Do-not-strip.patch
index 575c3abb7a..3650675069 100644
--- a/meta-python/recipes-devtools/python/python3-pikepdf/0001-pyproject.toml-Do-not-strip.patch
+++ b/meta-python/recipes-devtools/python/python3-pikepdf/0001-pyproject.toml-Do-not-strip.patch
@@ -1,4 +1,4 @@
-From 1b326de10bee40f497386921072dd80e2d7ecbde Mon Sep 17 00:00:00 2001
+From f54475de5f883ab6d021af78b1f33f34e6cd43eb Mon Sep 17 00:00:00 2001
 From: Leon Anavi <leon.anavi@konsulko.com>
 Date: Wed, 8 Jul 2026 11:45:11 +0000
 Subject: [PATCH] pyproject.toml: Do not strip
@@ -19,7 +19,7 @@ Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/pyproject.toml b/pyproject.toml
-index 9e991c3..d7cee23 100644
+index a2843de..950a3c2 100644
 --- a/pyproject.toml
 +++ b/pyproject.toml
 @@ -7,7 +7,8 @@ build-backend = "scikit_build_core.build"
diff --git a/meta-python/recipes-devtools/python/python3-pikepdf_10.13.0.post1.bb b/meta-python/recipes-devtools/python/python3-pikepdf_10.17.0.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-pikepdf_10.13.0.post1.bb
rename to meta-python/recipes-devtools/python/python3-pikepdf_10.17.0.bb
index df98507aae..3801c4826c 100644
--- a/meta-python/recipes-devtools/python/python3-pikepdf_10.13.0.post1.bb
+++ b/meta-python/recipes-devtools/python/python3-pikepdf_10.17.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/pikepdf/pikepdf"
 LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=9741c346eef56131163e13b9db1241b3"
 
-SRC_URI[sha256sum] = "4b73f926ebae81f04bf14527af330bd00bb268be767e0f189f7c4c3e4ad7ae0a"
+SRC_URI[sha256sum] = "de4ccaae83628e86c1fd473b384c09c6ff1dd35a583a8dacbf61d2aa4bea843b"
 
 SRC_URI += "file://0001-pyproject.toml-Do-not-strip.patch"
 
@@ -30,6 +30,8 @@ RDEPENDS:${PN} += " \
     qpdf \
     python3-pillow \
     python3-lxml \
+    python3-jsonschema \
+    python3-fonttools \
 "
 
 RDEPENDS:${PN}-ptest += " \
@@ -58,6 +60,8 @@ do_install_ptest:append() {
     install -m 0644 ${S}/third-party-licenses/openssl.txt ${D}${PTEST_PATH}/third-party-licenses/
     install -m 0644 ${S}/third-party-licenses/qpdf.txt ${D}${PTEST_PATH}/third-party-licenses/
     install -m 0644 ${S}/third-party-licenses/zlib.txt ${D}${PTEST_PATH}/third-party-licenses/
+    install -d ${D}${PTEST_PATH}/misc
+    install -m 0644 ${S}/misc/pdfa_differential.py ${D}${PTEST_PATH}/misc/
 }
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.47.3

