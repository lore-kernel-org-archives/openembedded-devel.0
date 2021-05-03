Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
 by mx.groups.io with SMTP id smtpd.web10.1762.1620069140387001646
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 May 2021 12:12:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lLjMKorT;
 spf=pass (domain: gmail.com, ip: 209.85.210.48, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f48.google.com with SMTP id 65-20020a9d03470000b02902808b4aec6dso6076103otv.6
        for <openembedded-devel@lists.openembedded.org>; Mon, 03 May 2021 12:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=w28FXCwWoGjaWk8RtcDx+k4xkA4BzKWgaVBuAcTm1I8=;
        b=lLjMKorTTje5crAKNKRIOPMdauEFsgtRJ4AXd0bLDOmQgrkQWUVjQbcXRjGszbpyjI
         yA3Qi4KasbtGd0WrzoSU8wwdrJ401OewQ28+7aeqYlkcywBW1EdZKlGw5KGfvjWc/nsv
         WDNb/boK0tJ/0MSbhZ+CXGPKu1XPVGlZ96m1PMwutnoawQSPpLLaD7FVgPwhLOVp4I5/
         mw8pNIacw/uD0nTc5ZH0DwbqyM07d8VC0HGxVq6cHPcyYYcBkAbrAEZa7rFcpKf7O+Xs
         odxYTMUZ3IwZYWEszeFbCEWxa27Ljhopsflv/0LF5/iV9sq/PzTfmhktPngLjZgOjqcm
         oFkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=w28FXCwWoGjaWk8RtcDx+k4xkA4BzKWgaVBuAcTm1I8=;
        b=XmTfrXDa2keMnknMGm2BxleWuOHqcIchlm8rh9QxqTEuLdhVBHBpgWyT8OhuTXDcMg
         QX0kPAOUVhiXqwM3uaiSBmFusgt3ng1xSSO0pKCMkxcxtzDmwcbXPYE8r7X4BSG3vRhF
         h48UIGMTmzfC9FvYS78jeA0u7XRXq/vEgPYU6pI1iaix7OGdzg/lhEbcfGOC+MGTK+vQ
         d/P6Ufb2C2yho7wgrX0qzorn2sf5vBbMUU0j3qCGyvWjdSqLzs3R5JfSR7If7vmFnfhI
         kQgW7Y6PXKe0ywruhK8djnsokOry6DwyHezer9KVLQ9kRjLsGvS+eEuHzbUiracVweBA
         dIJw==
X-Gm-Message-State: AOAM531svDm5HsIN0XJcJasto1oniPLyTi9iQKcOSiq5/niR2iQE5wrs
	FdXpOb0WfngZlZQUqOLOP6QCHj9k/3z3jw==
X-Google-Smtp-Source: ABdhPJwLOBxKtMjEFnvewNtcKxa8qksyeZfCaj0s9nsEsJxsYk6O0EwHWzE7bv9KDFb5nzYyt3zJdA==
X-Received: by 2002:a05:6830:22e6:: with SMTP id t6mr11335004otc.194.1620069139562;
        Mon, 03 May 2021 12:12:19 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:dc35:22d6:72af:c1da])
        by smtp.gmail.com with ESMTPSA id s85sm150047oos.4.2021.05.03.12.12.18
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 May 2021 12:12:19 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 11/14] nss: upgrade 3.63 -> 3.64
Date: Mon,  3 May 2021 12:12:04 -0700
Message-Id: <981a6b3cb103e3f51fc3e40530477defec898304.1620069042.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1620069041.git.akuster808@gmail.com>
References: <cover.1620069041.git.akuster808@gmail.com>

From: zangrc <zangrc.fnst@fujitsu.com>

-License-Update: Add the license of MIT.

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit a7d0d878542ec24d718972423b34c59aa5bd2498)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/nss/{nss_3.63.bb => nss_3.64.bb} | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/nss/{nss_3.63.bb => nss_3.64.bb} (96%)

diff --git a/meta-oe/recipes-support/nss/nss_3.63.bb b/meta-oe/recipes-support/nss/nss_3.64.bb
similarity index 96%
rename from meta-oe/recipes-support/nss/nss_3.63.bb
rename to meta-oe/recipes-support/nss/nss_3.64.bb
index b7192a46d1..1863db131b 100644
--- a/meta-oe/recipes-support/nss/nss_3.63.bb
+++ b/meta-oe/recipes-support/nss/nss_3.64.bb
@@ -11,11 +11,12 @@ SECTION = "libs"
 DEPENDS = "sqlite3 nspr zlib nss-native"
 DEPENDS_class-native = "sqlite3-native nspr-native zlib-native"
 
-LICENSE = "MPL-2.0 | (MPL-2.0 & GPL-2.0+) | (MPL-2.0 & LGPL-2.1+)"
+LICENSE = "(MPL-2.0 & MIT) | (MPL-2.0 & GPL-2.0+ & MIT) | (MPL-2.0 & LGPL-2.1+ & MIT)"
 
 LIC_FILES_CHKSUM = "file://nss/COPYING;md5=3b1e88e1b9c0b5a4b2881d46cce06a18 \
                     file://nss/lib/freebl/mpi/doc/LICENSE;md5=491f158d09d948466afce85d6f1fe18f \
-                    file://nss/lib/freebl/mpi/doc/LICENSE-MPL;md5=5d425c8f3157dbf212db2ec53d9e5132"
+                    file://nss/lib/freebl/mpi/doc/LICENSE-MPL;md5=5d425c8f3157dbf212db2ec53d9e5132 \
+                    file://nss/lib/freebl/verified/Hacl_Poly1305_256.c;beginline=1;endline=22;md5=d4096c1e4421ee56e9e0f441a8161f78"
 
 VERSION_DIR = "${@d.getVar('BP').upper().replace('-', '_').replace('.', '_') + '_RTM'}"
 
@@ -32,7 +33,7 @@ SRC_URI = "http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/${VERSIO
            file://nss-fix-nsinstall-build.patch \
            file://0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch \
            "
-SRC_URI[sha256sum] = "182d2fef629102ae9423aabf2c192242b565cf5098e82c5a26cf70c5e4ea2221"
+SRC_URI[sha256sum] = "d3175427172e9c3a6f1ebc74452cb791590f28191c6a1a443dbc0d87c9df1126"
 
 UPSTREAM_CHECK_URI = "https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_Releases"
 UPSTREAM_CHECK_REGEX = "NSS_(?P<pver>.+)_release_notes"
-- 
2.17.1

