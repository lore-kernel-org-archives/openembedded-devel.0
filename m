Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
 by mx.groups.io with SMTP id smtpd.web10.57296.1597711404463694248
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Aug 2020 17:43:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GFIS+0Om;
 spf=pass (domain: gmail.com, ip: 209.85.216.65, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f65.google.com with SMTP id c10so8605240pjn.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Aug 2020 17:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=F0z6Lngc2zfFbl7B0CsVF7cocjpqDhxXHlPf6kUHQXE=;
        b=GFIS+0OmIAdPvnudAhU8sBgTp/2EjpSc/tDOT21Lr0yQB38KiFzM1YF6968iQ3spTs
         +ioGI8H2eEkWO2oj5BsbK/r5rksvA83gOdwrXM16MHfshhODnNLUf5ZyeDdiUi+4W7Lr
         NILkipEJiAm6RFoEKfIJuMEHlJUET49J04jhokbOEMIcmvseXMYOkp0w38Mvi4Muhkdk
         fUZodTLA07Txcp8lVdAdbW51jPnj472eEnbHlXeGBbXbARZuq2d7dpAMK/9xZpzaJh72
         QEdFwEJrReoon+g4yogFor6n0t1+mKcKJQ5fZIenQ0GmZuGjf+0DECl18SsT06RzMpBH
         i8Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=F0z6Lngc2zfFbl7B0CsVF7cocjpqDhxXHlPf6kUHQXE=;
        b=K6LflZrj4NnlryQ03vQqVG6JklFQYiufy9JAm4fjiIa4O35qvhspjXy5I+mAW9XgBn
         Z54GLoUtaIO7oKn4YRPi4iidPdS1VO82RDIZbKfB2sZEPuJKNKPvZ4UGQo3Wjk8QIh1E
         O+YWEOGC0i1kJSw4e7PWRDWyve/hocqFt36soTBlPsXROKtyrxazmGLVi1Il2Z57Yl8C
         ptZhP32/Dbyrcb0GcBClQMOB5xpiNpnfzcnPQBhgc+DZ8pLIM9lUW39FEqKPB2mk0/4u
         Q6sKwb0xe4vwsQ3WBE3B3ALqdnKGvwUjJU2M7SnwA7EshKxAAOwfpouTs6UlTCuk7JBj
         a8Xg==
X-Gm-Message-State: AOAM532RuiHK+TSFCA7cp8LzFQNwBCHrTTmaifXKdvhKGEd2ZCRUq66L
	F76evaHu5ZAvwVZNUIFwS/kN7t6oAGl67w==
X-Google-Smtp-Source: ABdhPJyIeWd3jsUN++5nvgClBuLBTpKyH6oaLIXqi5+c9b5f8NASeRpf8t29O3je5JHPFU0xgYQTCw==
X-Received: by 2002:a17:902:16b:: with SMTP id 98mr13008872plb.23.1597711403381;
        Mon, 17 Aug 2020 17:43:23 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net (c-73-63-224-124.hsd1.ca.comcast.net. [73.63.224.124])
        by smtp.gmail.com with ESMTPSA id s17sm12240544pgm.63.2020.08.17.17.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2020 17:43:22 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] sedutils: Fix build with clang11
Date: Mon, 17 Aug 2020 17:43:19 -0700
Message-Id: <20200818004319.3846966-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...edDump-Add-typedef-name-to-the-union.patch | 34 +++++++++++++++++++
 .../recipes-extended/sedutil/sedutil_git.bb   |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta-oe/recipes-extended/sedutil/files/0001-DtaAnnotatedDump-Add-typedef-name-to-the-union.patch

diff --git a/meta-oe/recipes-extended/sedutil/files/0001-DtaAnnotatedDump-Add-typedef-name-to-the-union.patch b/meta-oe/recipes-extended/sedutil/files/0001-DtaAnnotatedDump-Add-typedef-name-to-the-union.patch
new file mode 100644
index 0000000000..4be3353c66
--- /dev/null
+++ b/meta-oe/recipes-extended/sedutil/files/0001-DtaAnnotatedDump-Add-typedef-name-to-the-union.patch
@@ -0,0 +1,34 @@
+From 9db49b94336f65453e06fb6a6bc4e6edf9403fea Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 17 Aug 2020 17:22:09 -0700
+Subject: [PATCH] DtaAnnotatedDump: Add typedef name to the union
+
+This is found with clang
+error: anonymous non-C-compatible type given name for linkage purposes by
+typedef declaration; add a tag name here [-Werror,-Wnon-c-typedef-for-linkage]
+| typedef union
+|              ^
+|               CAtomHeader
+
+Upstream-Status: Submitted [https://github.com/Drive-Trust-Alliance/sedutil/pull/332]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Common/DtaAnnotatedDump.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Common/DtaAnnotatedDump.h b/Common/DtaAnnotatedDump.h
+index 2749365..734c8eb 100644
+--- a/Common/DtaAnnotatedDump.h
++++ b/Common/DtaAnnotatedDump.h
+@@ -20,7 +20,7 @@ along with sedutil.  If not, see <http://www.gnu.org/licenses/>.
+ 
+ #pragma pack(push,1)
+ 
+-typedef union
++typedef union CAtomHeader_t
+ {
+     // four bytes in big endian (network) byte order
+     uint8_t     all[4];
+-- 
+2.28.0
+
diff --git a/meta-oe/recipes-extended/sedutil/sedutil_git.bb b/meta-oe/recipes-extended/sedutil/sedutil_git.bb
index 765618433b..1e7a393193 100644
--- a/meta-oe/recipes-extended/sedutil/sedutil_git.bb
+++ b/meta-oe/recipes-extended/sedutil/sedutil_git.bb
@@ -12,6 +12,7 @@ PV = "${BASEPV}+git${SRCPV}"
 SRCREV = "358cc758948be788284d5faba46ccf4cc1813796"
 SRC_URI = "git://github.com/Drive-Trust-Alliance/sedutil.git \
 	file://0001-Fix-build-on-big-endian-architectures.patch \
+        file://0001-DtaAnnotatedDump-Add-typedef-name-to-the-union.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
2.28.0

