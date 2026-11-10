Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16770.1794306635343314942
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Nov 2026 02:30:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=WRGhjiaj;
 spf=pass (domain: konsulko.com, ip: 209.85.128.51, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso12535585e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Nov 2026 02:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794306633; x=1794911433; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FczKrDgjvBkvWmp+NsWWL9IjVJCsgPb3m18e1+jd7gE=;
        b=WRGhjiajvAcmxkIKCK2TlhR7kvzpmXoH3vAfeCbx67xty3qnrqQ9FM+gjG4D1b8iqL
         CfUnKrGcjI8ySgiySjV+E4npQQWeRu3T5gmk27KEA1YgSn2PrbhEmcDIlKXohdPASZy4
         6pG0Zl1B8l0eItDITZ7m19Ik7ryZ0ZYYP5Uh8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794306633; x=1794911433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FczKrDgjvBkvWmp+NsWWL9IjVJCsgPb3m18e1+jd7gE=;
        b=ryFIZjasTDadvcUtDUpKeOOI/95csvoQ5bNXo/aceCkN3TUJocmc95E7bQeZy8u7m8
         NR6JPbtSAjdwL1n8ovnPCrEusk/xH/YIEFgTRv3XQD6xbemMN1i6nbyBLxsDFQk5Xz42
         WJEutqxAq6Mdnpo88T/jFv4M7oiipCDGSxXmnxcm/EcGy8U0/cKaj7fmKQlLnDT7PIZ6
         u6BCc76YUfYBmGDIi/RrwbeHVXfRl5267t9cOgDAzDoIejUecjOo+R0f5oAiC7d44f+i
         glVvz8u7ZKmK0k2vkHoR5chtllEOcu0GV60IojoKWYR43+13g3J9g6P6VIyb/SYYqFDJ
         B8Vw==
X-Gm-Message-State: APuU4Z+ouiHcwtSBNOpp/gGuxzOhdLTpcQTwE/ru9F1QTN9/wCW/rQj9
	RxsVIoiZ3xYb9k9Vu31zOF1UCjsxx+cmNQRpsm+JCQgRcIIeUs9eLhTWUVbYWRTSkqdvZN6Pz3s
	g2ixF
X-Gm-Gg: AYBFou3K07jX9Qi1bOwjkJI4Ir3ZqLO9e8ECbfrPGgir0UBx+b7uN9kDvcZWHMtHlwM
	7fapERXNv3I606a/6bOdRgNeA5ZMEvCubMI5XsrMTQUAUutCokfBSMZbeENuGGlFRsAIEORtQav
	CQm3hNhcA6YiPcq4PrMI1h95kwGuAlBsgMgeY/j+6WEan2b4812AjpUnBgvN02enHx6LBG5LOHy
	UtrsJdRsyfQuhgbBQY2wYsbO3sxa1s6mfspLDFjs+x+sgM/27l3b8Mh679dVU9rSwLtGDYuIlqR
	kP1A3RxscarYO6xo6qiR55UMWGyLbRnA2UC9lKTRNu8KJoo4EyPy71hqajLdXcs2Jli+vB6h2MK
	oVE8JtHwA2tioZcfMOJKcFxa9UNeCyyKpSxBlWi1k42h8zHPat+olIU+NUdCPthUm/hiJD9l5pH
	vdk7TuR2l38AiAIQrSnSP5dL4Gv3rzuRb7G1LAcYDx8m/3H66AHN8kQ0IG32BvtBtoyzxPean+7
	yhcFgqn0qSijqpc8/Lj7f4LqE1wHhnm0aTRafYUiGNctuL0eJBCE76M+by19uIo79f5aqHLeshN
	m9Eww63qIWQ3HucOAlMSlhqcXTQhyBoBlZSpa6pFBJh+BkI3ZTvhCUwm0gGd58eydLDsWjfHnnR
	/dI/V/kJIw6ZlYgWmAuZJfLQ1yySvUwANQU9FQDJC/3cdQP5FPSj3zQ==
X-Received: by 2002:a05:600c:6387:b0:4a2:967:dfb8 with SMTP id 5b1f17b1804b1-4ba02349a18mr33875965e9.20.1794306632906;
        Tue, 10 Nov 2026 02:30:32 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fe2cb2sm52019685e9.3.2026.11.10.02.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 02:30:32 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/2] python3-pikepdf: Upgrade 10.17.0 -> 10.18.0
Date: Tue, 10 Nov 2026 12:30:28 +0200
Message-ID: <20261110103028.1041905-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261110103028.1041905-1-leon.anavi@konsulko.com>
References: <20261110103028.1041905-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 10 Nov 2026 10:30:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132074
Content-Type: text/plain; charset="utf-8"

Upgrade to release 10.18.0:

- pikepdf.Pdf.add_pages_from now carries layers (optional
  content) with the pages it copies. The optional content groups
  that the copied pages depend on are listed in the destination's
  /OCProperties, with the default visibility, place in the layer
  list, lock, radio button groups and automatic states that the
  source's default configuration gave them. Previously the groups
  were copied but not listed, so viewers ignored them: the layer
  list was empty and content hidden in the source was shown.
- pikepdf.Pdf.add_pages_from now carries bookmarks. Outline
  items of the source that lead to a copied page are appended to
  the destination's outline, keeping their hierarchy, titles and
  style; items that lead to pages that were not copied are dropped.
- Both are on by default, which changes what existing callers of
  add_pages_from get: the destination may gain an /OCProperties and
  outline items it did not gain before. Pass layers='ignore' or
  outlines='ignore' for the previous behaviour, for example if you
  build the merged outline yourself. pikepdf.PageCopyResult
  reports layers_added, outline_items_added and
  outline_items_dropped.
- pikepdf.Pdf.check_pdf_syntax now performs the same checks
  as qpdf --check and reports the same problems. It checks the
  linearization data and hint tables of linearized files, which
  previously required a separate call to
  pikepdf.Pdf.check_linearization, and checks the interactive
  form, embedded files, page labels and outlines. A document with
  no pages is reported as ERROR: file does not contain any pages,
  and a page whose content stream cannot be read is reported as
  ERROR: page N: ... along with the other problems found, where it
  previously raised pikepdf.PdfError.
- Inserting a pikepdf.Dictionary or pikepdf.Array
  that refers to another Pdf into a Pdf now raises
  pikepdf.ForeignObjectError, naming the key or index where the
  foreign object was found, and leaves the target unchanged.
  This covers an indirect object of another Pdf held anywhere in
  the value, such as pdf3.Root.X = Dictionary(P=pdf1.Root.Y), and a
  direct dictionary or array that another Pdf already contains.
  Previously the value was accepted: the first kind made the Pdf
  impossible to save, failing part way through writing, and the
  second left two documents sharing one object. It applies to every
  way of inserting a value, including
  pikepdf.Pdf.make_indirect, pikepdf.Page.add_resource,
  adding a page built from a dictionary, name and number trees, and
  stream dictionaries. Use pikepdf.Pdf.copy_foreign to bring
  the foreign object over first.
- A password containing a NUL character now raises {exc}ValueError,
  both when opening a PDF and when encrypting one. Previously the
  password was silently cut short at the NUL, so a wrong password
  could open a file, and an encrypted file could be written with a
  shorter password than requested. PDF passwords may not contain
  NUL.
- Fixed threads interfering with each other inside one Pdf on
  GIL-enabled builds, which could cause an object to be read as
  None. The per-Pdf lock is now in force on every build, and
  pikepdf.Pdf.lock works on GIL-enabled builds too.
- Methods implemented in Python that change a Pdf in several steps,
  such as pikepdf.Page.add_overlay,
  pikepdf.Pdf.add_pages_from and the pikepdf.sanitize functions,
  now hold its lock until they finish. The thread safety section of
  the architecture notes now says which calls are atomic.
- Two threads that each hold the lock of one Pdf and then need the
  other's no longer deadlock; one of them gets a RuntimeError
  instead. What a callback such as a pikepdf.TokenFilter may
  do is now documented: see {ref}callback-restrictions.
- Fixed a crash, a native stack overflow that no Python except can
  catch, when reading, saving or checking a PDF in which a JBIG2
  image's /JBIG2Globals stream is itself JBIG2-encoded and leads
  back to the image, directly or through other streams. Such an
  image is now reported as unfilterable, as JBIG2-encoded globals
  without a cycle already were: reading it raises
  ~pikepdf.exceptions.PdfError, extracting it raises
  ~pikepdf.exceptions.UnsupportedImageTypeError, and saving
  writes it unchanged with a warning.
- A JBIG2 image's /JBIG2Globals are now read only when the image is
  being JBIG2-decoded, rather than every time qpdf checks whether
  the image can be decoded, which included every save.
- Reading the label of a page whose page label style is an unknown
  name, such as /S /Z, now warns and keeps the label prefix, as an
  invalid non-name style already did. Previously it raised
  KeyError.
- Reading the label of a page whose number cannot be written in its
  page label style, such as /S /R /St 0 or a Roman numeral above
  5000, now warns and writes the number in decimal digits.
  Previously it raised ValueError.
- Extracting an image whose /CalGray or /CalRGB colour space array
  lacks its parameter dictionary now decodes it as the
  corresponding device space, without an ICC profile, as a missing
  /WhitePoint already did. Previously it raised IndexError.
- An ICCBased image whose profile stream omits the required /N, or
  gives one that is not an integer, now takes its mode and default
  /Decode from the profile's colour space. Previously its mode
  raised KeyError.
- Fixed pikepdf.form.SignatureField.stamp_overlay stamping
  the overlay twice when the signature widget names its page with
  /P.
- Fixed a Pdf returned by pikepdf.Job.create_pdf not being
  set up like other Pdf objects: setting its conversion_mode raised
  pikepdf.PdfError, and on free-threaded Python none of its
  methods were protected by a lock.
- Matrix.__array__(copy=False) now raises ValueError, as numpy
  expects of an object that cannot share its memory. The check for
  this was written in a way that never fired.
- A progress argument to pikepdf.Pdf.save that is not
  callable is now rejected with TypeError before anything is
  written. Previously the error was raised part of the way through
  writing the file.
- Fixed a small memory leak each time
  pikepdf.AcroForm.get_fields_with_qualified_name or
  pikepdf.AcroForm.fix_copied_annotations returned a field.
- Iterating over a pikepdf.NameTree or
  pikepdf.NumberTree now iterates over the keys it had when
  the iteration began. Previously the tree was read as the
  iteration went on, so changing it meanwhile gave undefined
  results.
- Putting an object that belongs to another Pdf in a
  pikepdf.NameTree or pikepdf.NumberTree now raises
  pikepdf.ForeignObjectError at once, as it does for a
  dictionary or an array. Previously the error was not raised until
  the Pdf was saved.
- x in tree is now False for an x that cannot be a key of a
  pikepdf.NameTree, such as an int, and for None in a
  pikepdf.NumberTree. Previously these raised TypeError.
- Corrected the documentation and type hints of
  pikepdf.NameTree, which said that names are bytes. Names
  are, and have always been, str: qpdf reads each name as a PDF
  text string and compares names by that text.
- Fixed building from source on Android (Termux), where importing
  pikepdf failed with cannot locate symbol "_Py_TrueStruct" since
  v10.6.0. The extension module is now linked against libpython
  when the build interpreter is an Android Python, as that platform
  requires. Android is not a tested platform.

Free-threaded Python fixes:

Many crashes and data races that occurred when several threads used the
same Pdf at once have been fixed. The test suite now runs under
ThreadSanitizer in continuous integration, which is how most of them
were found ().

- Every binding that reads or changes a Pdf now takes that Pdf's
  lock, and the lock of any other Pdf among its arguments, enforced
  at compile time. Many bindings previously did not, notably most
  methods of pikepdf.NameTree, pikepdf.NumberTree,
  attachments, annotations and pikepdf.AcroForm.
- Fixed crashes and data races in pikepdf.Page methods,
  content stream parsing, adding pages from one Pdf to another, and
  dropping the last reference to a Pdf while another thread used
  one of its objects.
- A pikepdf.Dictionary or pikepdf.Array that belongs
  to no Pdf is now protected by a lock shared by all such objects.
  Threads that each build objects of their own contend for it, so
  add a Dictionary or Array to its Pdf as soon as it is created
  rather than building large structures before adding them.
- Fixed "dictionary changed size during iteration" when several
  threads opened a Pdf's metadata for the first time at once.
- Threads that take turns using the same Pdf are no longer slowed
  to a crawl when every CPU is busy.

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python3-pikepdf/0001-pyproject.toml-Do-not-strip.patch    | 4 ++--
 ...{python3-pikepdf_10.17.0.bb => python3-pikepdf_10.18.0.bb} | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pikepdf_10.17.0.bb => python3-pikepdf_10.18.0.bb} (96%)

diff --git a/meta-python/recipes-devtools/python/python3-pikepdf/0001-pyproject.toml-Do-not-strip.patch b/meta-python/recipes-devtools/python/python3-pikepdf/0001-pyproject.toml-Do-not-strip.patch
index 3650675069..8e935fc4ed 100644
--- a/meta-python/recipes-devtools/python/python3-pikepdf/0001-pyproject.toml-Do-not-strip.patch
+++ b/meta-python/recipes-devtools/python/python3-pikepdf/0001-pyproject.toml-Do-not-strip.patch
@@ -1,4 +1,4 @@
-From f54475de5f883ab6d021af78b1f33f34e6cd43eb Mon Sep 17 00:00:00 2001
+From 38c9eb8ee27b1c4fba6035cf346c8efde7cdcd20 Mon Sep 17 00:00:00 2001
 From: Leon Anavi <leon.anavi@konsulko.com>
 Date: Wed, 8 Jul 2026 11:45:11 +0000
 Subject: [PATCH] pyproject.toml: Do not strip
@@ -19,7 +19,7 @@ Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/pyproject.toml b/pyproject.toml
-index a2843de..950a3c2 100644
+index 769a26c..29cb347 100644
 --- a/pyproject.toml
 +++ b/pyproject.toml
 @@ -7,7 +7,8 @@ build-backend = "scikit_build_core.build"
diff --git a/meta-python/recipes-devtools/python/python3-pikepdf_10.17.0.bb b/meta-python/recipes-devtools/python/python3-pikepdf_10.18.0.bb
similarity index 96%
rename from meta-python/recipes-devtools/python/python3-pikepdf_10.17.0.bb
rename to meta-python/recipes-devtools/python/python3-pikepdf_10.18.0.bb
index 3801c4826c..a915f51efa 100644
--- a/meta-python/recipes-devtools/python/python3-pikepdf_10.17.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pikepdf_10.18.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/pikepdf/pikepdf"
 LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=9741c346eef56131163e13b9db1241b3"
 
-SRC_URI[sha256sum] = "de4ccaae83628e86c1fd473b384c09c6ff1dd35a583a8dacbf61d2aa4bea843b"
+SRC_URI[sha256sum] = "cb555ebff93482e8a6eb55881488b469bbb2b5675161c1b93a0510a8642d98d0"
 
 SRC_URI += "file://0001-pyproject.toml-Do-not-strip.patch"
 
-- 
2.47.3

