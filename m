Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEFD9C9830E
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 05:23:12 +0000 (UTC)
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31856.1790486591310055352
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Sep 2026 22:23:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=OQ0tFkXb;
 spf=pass (domain: gmail.com, ip: 74.125.82.42, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-13fc403e373so2982908c88.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 26 Sep 2026 22:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790486591; x=1791091391; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GNbOIW0fqKCqqiidtQIxGvMFqiCOyVs1ZCXYbmQ9ZRY=;
        b=OQ0tFkXbgMLD/JxUtomY0j8iMMBneOQvhEg/kTuPRJQa2Bo4FPBtyE1Njk/Zl5Aw7S
         0huxK2vXJgGwPCxlODtM65djJSMiDhazNKqagAcYL4EosZP+cvp2ufT/AM0ercoWune6
         0ETg7v8f/YznTyl1z/gm02SEZN3zHy9DP6vDnnUHrQZ7JovfJ8acnBv54PlAnNUY6FDy
         HcFGjdFtPR1YQIKPQJAEEx55OVVbcr15Kz8OPJ4XVvoMG6EiGA4C8AA/QgILZ75g95bZ
         8MTX25MJX2r/9WQqe2n4XU72nGx1gutpKbQgWsJ9DpYg395x20YE71VjLnx8DW0PBaPn
         ARYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790486591; x=1791091391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GNbOIW0fqKCqqiidtQIxGvMFqiCOyVs1ZCXYbmQ9ZRY=;
        b=ZmRpZlssT3POiBZZL6cGB4UX/khWg1/TMPhLL49M4RN57OzfxnoyTz5jafKK7Rb+AC
         CBpWPhBnS00SHGDvyZ5B/jHZrE/h2tHU/P1FuuXal4+SxOH5R8jKKmjOhWBRyZjWOi2z
         5/8VrtL27XAc8/me1FgyMPJIw2VVRTUO8lZJhKSpIaKB+psShlgg6fTep/6Qlsx4PpRq
         Dsed87BUR1hlLv9HILMRMZDzJl7Jkzz7XkRmHiyJ611ma87U0hk897rrq4wF6CTobhCC
         fjfHVuFH3Gi52icXeSA2PmrjeUVXMPRzr1uFwh95rIwP247mb24WL3hKAu4FyLgmjV71
         tOpQ==
X-Gm-Message-State: AFuF++nPk3de8s8CNmIkzIPlhcSBMJY5R8tUR1PK5sLa52mne62MBrY/
	+vokiyOdc9T8R8gG0e1W8F0K6C9+J77IwR6fZoWicfBXfMtmqonvOx9HUWaeIPAC
X-Gm-Gg: AYBFou3fS/FAOue6/5bWNDDyhaspMN3My38cp1uQjDmfjFzgzzTS9sn0uzBTCT2wLy4
	5MmhCkpSkffjqZOVqmDIPGoInJV3VapYR1Bhe5u9cUrA3yTnu5CzTO0rp8A4nx+UL7t0NKUM3tF
	C0r2naZVlr7myFRburGxRlOLMmMQhGtEgBFoJEKCCxWtShQHwzqgvkaJwJyejydLf4o8poHX/4X
	RZPN4A/RbjlMZ/Lt0wrp129ezf48vKfO3RI8ITkhuazVNh4oWxbdGrz4pPacRoS2TN8wX9PK95R
	31rR0JRtQlqZ5N/rkENdNuOdLaRiXvE/wxaVmu2eUtjyQEvHtHM/I36f444JXL91pvOgHGGYRQG
	/LN5rnlaabeixWIt3mNHLn0mBsXEXYottbCGwhAtHSVY8TshWQ2DvpEUxnYu3+iCUitWT9aO4P6
	WhEHaPmo0ovpJouKhFtGIUXwOAevJrIoz27MAQ+Nz6buoPYa3+Bec2hzn9DF66m6AhwcpjTI/zO
	uiy5uDthtkR75U0KlcL2YrTj1geH+JRc4HidVilBP9Karr3RcFoEYsKh39XnotOpHos8plIMnDf
	gF1ouDgIqMTZPGC6wsS9MkpVtmbfEJFmX1BE13/6N5QjSkA9GRS6AtWQkT+FE5IioJ+FZql53Hs
	Eorh822Hcu//Adw2pZhmK222Wo3kEWxI7KxSVZK5muX+3gPM4xla7CSH5Nv6bLWY/3/vSVZWjGC
	utS3eQcDxm2EElxiS64YTtwwgohor5nh+5nw+fbw==
X-Received: by 2002:a05:7022:6889:b0:137:24c9:fb7a with SMTP id a92af1059eb24-146ce491ea2mr6977995c88.2.1790486590542;
        Sat, 26 Sep 2026 22:23:10 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145a7318afcsm15681596c88.0.2026.09.26.22.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 22:23:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] opencv: rewrite build-tree paths in all CPU-dispatch stub files
Date: Sat, 26 Sep 2026 22:23:06 -0700
Message-ID: <20260927052306.2867689-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260927052306.2867689-1-khem.raj@oss.qualcomm.com>
References: <20260927052306.2867689-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 05:23:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130334

The recipe already rewrote the absolute ${S} path embedded in two
PowerPC VSX3 dispatch stubs (arithm.vsx3.cpp, convert.vsx3.cpp) before
packaging, but OpenCV's cmake ocv_add_dispatched_file() macro generates
one such stub per enabled ISA in every module (avx, avx2, avx512_skx,
sse4_1, sse4_2, ...). On x86-64-v3 that produced 69 more stub files
under ${B}/modules/* whose #include lines still embedded the raw
build-tree path, tripping the buildpaths QA check (TMPDIR and HOME)
once copied verbatim into the opencv-src package.

OEQA_BUILDPATHS_SKIP would only silence the HOME-directory half of the
check; TMPDIR has no skip mechanism in insane.bbclass. Generalize the
existing sed-based rewrite to find and fix every generated dispatch
stub under ${B}/modules, instead of a hardcoded two-file list, so any
ISA/module combination is covered.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/opencv/opencv_4.14.0.bb | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-support/opencv/opencv_4.14.0.bb b/meta-oe/recipes-support/opencv/opencv_4.14.0.bb
index 286b490870..7cc487c0ce 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.14.0.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.14.0.bb
@@ -214,10 +214,8 @@ do_install:append() {
         rm -rf ${D}${bindir}/setup_vars_opencv4.sh
     fi

-    for fn in arithm.vsx3.cpp convert.vsx3.cpp; do
-        if [ -f ${B}/modules/core/$fn ]; then
-            sed -i -e 's,${S},/usr/src/debug/${PN}/${PV},g' ${B}/modules/core/$fn
-        fi
+    find ${B}/modules -name "*.cpp" | xargs -r grep -l "${S}" | while read -r fn; do
+        sed -i -e 's,${S},/usr/src/debug/${PN}/${PV},g' "$fn"
     done

     if [ -d ${D}/${bindir}/shape ]; then

