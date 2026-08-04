Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91150C55184
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 01:12:01 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7562.1785805917197709276
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Aug 2026 18:11:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=VcOZXsmI;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2cc61541f8cso5447635ad.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 03 Aug 2026 18:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785805916; x=1786410716; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yKUrnjEQdA0Lzfn/5FR3kthGsHxscuJkES5cjjXEnIQ=;
        b=VcOZXsmI/bt+e3CeoOmFz3ch5564B3SOcz3YToJZ7A4rSbcQJxaLLwJnq2qNV1eCk6
         f+5PELJ0p3KjyqcskJegt8Ys/toHy5Ga6nhiRO/tcnJeSXdx/AAskkLDT7W0W3vlXdU+
         ftOBP6KvW7SkQ0ahx5nYXZ3TQBQnEVbNrTHKjD/c20VxqIKrBjFuRmyIuEHb92zOcv2r
         Q65haKQstIWW3lbfNa+F7rgtg7XILpX/G2f2fDlhtK7SMqgsJSJfL7oonKO3GsQea9Mn
         4HEUm5ONn77GR9/wN7VTxtNybIoqBTfVYqe06AFrbgdoRCOTr/eH++5eL2a2Y2Cd9cWh
         UzFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785805916; x=1786410716;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yKUrnjEQdA0Lzfn/5FR3kthGsHxscuJkES5cjjXEnIQ=;
        b=ALuXLO1jDrvPBiMeAlhFF9baRqbhFO15xgu/kquaj64Yvuk3VbDhKRDfenFlzpJTqc
         juu4SyAY7Mss7LeyW8w2qj6C3h1pXNJIs/0Ykiv2AKlg88yt0VuBahm8yC55eHUbFCok
         w+kuzll5HY3OYOY6zRe4m/eUdRoV+VEuWjMPj3JUVHiHI5cyZzqNoO1NrcvI8DM37qC7
         azHSGa23I7m6eTT/rwPy0L16u5Y5P3oLnpx1rNTwMybxYo3bf3u/i/xUfHSfCVmJ81Fr
         7zAi5LSugKGc1pJvArymwAwZo9JzyweX0zvz65xwNhOXEOft5Sh4LoqKWUETglgpn6ma
         n4xQ==
X-Gm-Message-State: AOJu0YydeNO199HiP6TgTIeQmtA5SgdhfMU8A6nW2d8mIjZ0kI+8SiQ+
	6JcUej0Li8pPSPVdxwnEqY3OJKoXVwKyRD9F0ewG5kMbaGnfGWGU2Opzk5J+vPw2
X-Gm-Gg: AR+sD104/mmZswKmiYYIbxFNPmkEjGTcDKmAEbFOjfue3VxI1UHn54dq7QV+nmFKInC
	+VtB+Aj0CaGLo63bEnef5hf1YRSDnhyuw3fsQGO/DkeF4JmOnszIk6cPCfOMtCO8labpbJCUMZR
	DsvdvCpgtl42rtnxskZaRW7IdXmXGL1ulDhmfnUOGn4+k/idnM3n2cBJKNN/Xr9xqYjZGYODQJ0
	1rWFeZ0KgMfVuaOp1I0RKS+bjJOnFZ8ethisif6uFtJt6+UR3biAR+rEZ+UUWpClHg4g81XG1Ux
	VksHE9wifGRw+z1E2nQKZ5UClkr05+NSSh8IdjTwWxHmkn8S2YtOULPnqMas9GMX/WGf/rmgw+O
	CYqpKv2WGjX5f4hs4/FkS3Z1a42nkpRnyn0hgJN2y9re/NQU+BOC/dSN49mNiEVh2iJkcm15B/O
	h4FFXx3VqBYI/FyrVJHD46fRWIQfctA5fbyaztXJogB888BJ4XVlg8Vblp/hN4h03QBThgwONGc
	Y9GTK07phrwcoObNrmRWb6I3RC2+0rG88VGXhlcs0qzdxD3ktQkumeZgXIe2/BnruRvbMrUKMd9
	qR9GPHEmICnttC+X4L44EA/n9cj6whXivAMwwMUoyKGVVgy/EskPxQ4m3FptXJUHNHpbX2xFECX
	Zug==
X-Received: by 2002:a17:90b:554d:b0:381:10a3:8b10 with SMTP id 98e67ed59e1d1-38fece4a9c5mr1480951a91.14.1785805916398;
        Mon, 03 Aug 2026 18:11:56 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab4cb50dsm59110258c88.10.2026.08.03.18.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 18:11:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH] uim: Fix uim-module-manager segfault from a GC'd require filename
Date: Mon,  3 Aug 2026 18:11:52 -0700
Message-ID: <20260804011152.1624318-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 01:12:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128703

uim-module-manager crashes in uim_init() while requiring key.scm:

    #0  __strlen_evex ()
    #1  make_loaded_str (filename=0x7e)
    #2  scm_p_require ()
    ...
    #29 uim_init ()

scm_p_require() dereferences its FILENAME argument again after the
nested scm_load(), but nothing keeps a tagged ScmObj reference to it.
SigScheme's conservative collector only accepts properly tagged words
(within_heapp() / SCM_TAG_CONSISTENTP()), while the compiler keeps just
SCM_DROP_TAG(filename) and the interior char *, so the string is swept
and its cell recycled mid-load:

    before load: cell=0x7ffff7d5a090 obj_x=0x555555569180 "key.scm"
    after  load: cell=0x7ffff7d5a090 obj_x=0x7e            <- recycled

Whether it triggers is pure allocation timing, which is why uim-native
fell over while the cross-built uim ran the same scm files fine.

Add the patch to the common SRC_URI rather than the class-target one,
since it is uim-native that scm/Makefile runs at build time.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...-protect-the-objects-used-by-require.patch | 103 ++++++++++++++++++
 meta-oe/recipes-support/uim/uim_1.9.6.bb      |   4 +-
 2 files changed, 106 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/uim/uim/0001-sigscheme-GC-protect-the-objects-used-by-require.patch

diff --git a/meta-oe/recipes-support/uim/uim/0001-sigscheme-GC-protect-the-objects-used-by-require.patch b/meta-oe/recipes-support/uim/uim/0001-sigscheme-GC-protect-the-objects-used-by-require.patch
new file mode 100644
index 0000000000..1d2a829268
--- /dev/null
+++ b/meta-oe/recipes-support/uim/uim/0001-sigscheme-GC-protect-the-objects-used-by-require.patch
@@ -0,0 +1,103 @@
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 2 Aug 2026 00:00:00 +0000
+Subject: [PATCH] sigscheme: GC-protect the objects used by require
+
+uim-module-manager segfaults inside uim_init() while requiring key.scm:
+
+    #0  __strlen_evex ()
+    #1  make_loaded_str (filename=0x7e)
+    #2  scm_p_require ()
+    ...
+    #26 uim_scm_require_file ()
+    #29 uim_init ()
+
+scm_p_require() dereferences its FILENAME argument again after
+scm_require_internal() has run, and scm_require_internal() keeps
+LOADED_STR live across a nested scm_load().  Neither object is
+GC-protected.
+
+SigScheme's conservative collector only recognizes *tagged* ScmObj
+values: within_heapp() rejects any candidate word whose tag is not
+consistent with the cell it points to (SCM_TAG_CONSISTENTP()).  An
+optimizing compiler is free to keep only SCM_DROP_TAG(filename) and the
+interior "char *" returned by SCM_STRING_STR(), and gcc does exactly
+that here:
+
+    scm_p_require:
+        mov  %rdi,%rbp
+        and  $0xfffffffffffffff8,%rbp   # SCM_DROP_TAG(filename)
+        mov  0x0(%rbp),%r12             # SCM_STRING_STR(filename)
+        ...                             # no tagged copy is kept anywhere
+
+While the nested scm_load() runs, the string is therefore unreachable
+for the GC.  A cons allocation inside that load triggers a mark & sweep,
+the string cell is put on the free list (its body free()d by
+SCM_CELL_STRING_FIN()) and the cell is immediately recycled.  The
+following SCM_STRING_STR(filename) then returns whatever the new
+occupant stores in obj_x -- 0x7e above -- and strlen() faults:
+
+    before load: cell=0x7ffff7d5a090 obj_x=0x555555569180 "key.scm"
+    after  load: cell=0x7ffff7d5a090 obj_x=0x7e            <- recycled
+
+Whether this is hit depends purely on allocation timing, which is why it
+shows up for one build of uim and not for another built from the same
+sources on the same host.
+
+Protect the objects for as long as they are needed.
+
+Upstream-Status: Submitted [https://github.com/uim/uim/issues]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ sigscheme/src/module-sscm-ext.c | 21 ++++++++++++++++++++-
+ 1 file changed, 20 insertions(+), 1 deletion(-)
+
+--- a/sigscheme/src/module-sscm-ext.c
++++ b/sigscheme/src/module-sscm-ext.c
+@@ -224,11 +224,15 @@
+ {
+     ScmObj loaded_str;
+
+-    loaded_str = make_loaded_str(filename);
++    /* scm_load() below can trigger a GC and the conservative collector only
++     * recognizes tagged ScmObj values, so protect LOADED_STR explicitly. */
++    scm_gc_protect_with_init(&loaded_str, make_loaded_str(filename));
+     if (!scm_providedp(loaded_str)) {
+         scm_load(filename);
+         scm_provide(loaded_str);
+     }
++    scm_gc_unprotect(&loaded_str);
++
+     return NULL;
+ }
+
+@@ -242,15 +246,28 @@
+
+     ENSURE_STRING(filename);
+
++    /* FILENAME is dereferenced again below and its body is handed to
++     * scm_load() as a plain char *.  Optimizing compilers keep only
++     * SCM_DROP_TAG(filename) and SCM_STRING_STR(filename) live, and
++     * within_heapp() rejects both, so without this explicit protection the
++     * string is swept (and its body free()d) by a GC triggered from the
++     * nested load. */
++    scm_gc_protect(&filename);
++
+     scm_require_internal(SCM_STRING_STR(filename));
+
+ #if SCM_COMPAT_SIOD
+-    loaded_str = make_loaded_str(SCM_STRING_STR(filename));
++    scm_gc_protect_with_init(&loaded_str,
++                             make_loaded_str(SCM_STRING_STR(filename)));
+     retsym = scm_intern(SCM_STRING_STR(loaded_str));
+     SCM_SYMBOL_SET_VCELL(retsym, SCM_TRUE);
++    scm_gc_unprotect(&loaded_str);
++    scm_gc_unprotect(&filename);
+
+     return retsym;
+ #else
++    scm_gc_unprotect(&filename);
++
+     return SCM_TRUE;
+ #endif
+ }
diff --git a/meta-oe/recipes-support/uim/uim_1.9.6.bb b/meta-oe/recipes-support/uim/uim_1.9.6.bb
index 3e494e3338..1ea0f488ed 100644
--- a/meta-oe/recipes-support/uim/uim_1.9.6.bb
+++ b/meta-oe/recipes-support/uim/uim_1.9.6.bb
@@ -4,7 +4,9 @@ LICENSE = "BSD-3-Clause AND LGPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ab2826b41ca0ff4030d38cc39791d1c8"
 SECTION = "inputmethods"

-SRC_URI = "https://github.com/uim/uim/releases/download/${PV}/uim-${PV}.tar.bz2"
+SRC_URI = "https://github.com/uim/uim/releases/download/${PV}/uim-${PV}.tar.bz2 \
+    file://0001-sigscheme-GC-protect-the-objects-used-by-require.patch \
+"
 SRC_URI:append:class-target = "\
     file://uim-module-manager.patch \
 "

