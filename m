Return-Path: <george.mccollister@gmail.com>
Received: from mail-it0-f65.google.com (mail-it0-f65.google.com
	[209.85.214.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6115A746E5
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Jun 2018 22:41:19 +0000 (UTC)
Received: by mail-it0-f65.google.com with SMTP id 76-v6so4214079itx.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Jun 2018 15:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=NOkO+9OYbaC5XVPFeXu80xS/yOVnUbJB6g3EB41viK8=;
	b=ShjW+J1fngIXAMLu3u0RypGs0vZ/SkR/EJqJDHU4ypkXcPhyQFAKRXcLQonvYbj7wI
	9iBivpMdB8aN5gnlsChbASnhxMjUPoa8w2dVjoR5+KlQeTy036euZXX9YmLF3lBNyYo0
	3N2CqkDKKB1TYVrnlj9SI76m3vMpN4+cTj0oRiH3yP7aapsJ+ioCkfhjMh7nO7+c464I
	nvzkuZCdLG7rAJYkX+fJRG52N7IhPzG3j0wI05DyUMb60rW7XuPuMfczvqc+93947TqY
	uJ3sAyMNiAi47rDTuf2QsgjxSur0ZJoUAI1/39gbWvRTC5KadF6UpyuMtWylTvyW0pjS
	uoIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=NOkO+9OYbaC5XVPFeXu80xS/yOVnUbJB6g3EB41viK8=;
	b=i2MjIsiBSUpE1UxQlrSZfTClz6uOgpnTCpSbMGRKbkGYPz7Hrk4xAfzKLBKgnt2+gv
	ubwgLCaZW3tPvJKM5/+3W3GDssaEcebJbzWqemeByDqGYP0E4AxCqvTWGcWfAyrPADs1
	a1Tos47lvutgcdDUuPCcYbe75l2R4vSrKuISkKfz9Q1ae//vY2nNOK7ZTMNPNCkN6Pc8
	suusI0L3cZ/VYFU/86cFoBTsomvR2teAiJL2vx+U1eSBGPT+pNRMidc7Dryq2FrZqWzz
	8LBfZmmxxLSFBo3TZHgq5HI5i5scX6Nrw72YDNyZ4/+t7RWZGG+Wx5SEchJNIYaW6QW+
	EDnA==
X-Gm-Message-State: APt69E1vcyw6wKscRGHNvwPgBD/wDu1MKhlr6qSQGzmuQFxLa5y/Zizq
	Pqbba4TBIVWeI1fpOuE06y+w
X-Google-Smtp-Source: ADUXVKKylDhZabMCy+GRCbedzsfvBJbjVCabjbGgz/81NG8vBc+sYLo6v2W3jsGV+6mZvPrdm0usqA==
X-Received: by 2002:a24:7809:: with SMTP id p9-v6mr3304692itc.20.1528497680098;
	Fri, 08 Jun 2018 15:41:20 -0700 (PDT)
Received: from threadripper.novatech-llc.local ([216.21.169.52])
	by smtp.gmail.com with ESMTPSA id
	16-v6sm1408318itk.17.2018.06.08.15.41.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Jun 2018 15:41:19 -0700 (PDT)
From: George McCollister <george.mccollister@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 Jun 2018 17:40:53 -0500
Message-Id: <20180608224053.44345-1-george.mccollister@gmail.com>
X-Mailer: git-send-email 2.11.0
Subject: [sumo][meta-oe][PATCH] poppler: fix linking
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 08 Jun 2018 22:41:19 -0000

Add patch from master commit 327292a30089783236bfe482ec43834f9d118327
to fix linking error.

Signed-off-by: George McCollister <george.mccollister@gmail.com>
---
 ...ists.txt-Add-libpoppler-to-link-along-wit.patch | 29 ++++++++++++++++++++++
 meta-oe/recipes-support/poppler/poppler_0.63.0.bb  |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta-oe/recipes-support/poppler/poppler/0001-glib-CMakeLists.txt-Add-libpoppler-to-link-along-wit.patch

diff --git a/meta-oe/recipes-support/poppler/poppler/0001-glib-CMakeLists.txt-Add-libpoppler-to-link-along-wit.patch b/meta-oe/recipes-support/poppler/poppler/0001-glib-CMakeLists.txt-Add-libpoppler-to-link-along-wit.patch
new file mode 100644
index 000000000..7ed795ef7
--- /dev/null
+++ b/meta-oe/recipes-support/poppler/poppler/0001-glib-CMakeLists.txt-Add-libpoppler-to-link-along-wit.patch
@@ -0,0 +1,29 @@
+From d488de23b75b2f3e235f1c184b2253d1402b4c0f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 10 May 2018 23:47:56 -0700
+Subject: [PATCH] glib/CMakeLists.txt: Add libpoppler to link along with
+ poppler-glib
+
+This is required since poppler-glib uses symbols from poppler and
+we use --as-needed
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ glib/CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/glib/CMakeLists.txt b/glib/CMakeLists.txt
+index 33c6608..87e1b44 100644
+--- a/glib/CMakeLists.txt
++++ b/glib/CMakeLists.txt
+@@ -127,7 +127,7 @@ if (HAVE_INTROSPECTION AND BUILD_SHARED_LIBS)
+   get_directory_property(_tmp_includes INCLUDE_DIRECTORIES)
+   _list_prefix(_includes _tmp_includes "-I")
+   set(Poppler_0_18_gir_CFLAGS ${_includes} -L${CMAKE_BINARY_DIR})
+-  set(Poppler_0_18_gir_LIBS poppler-glib)
++  set(Poppler_0_18_gir_LIBS poppler-glib poppler)
+   _list_prefix(_abs_introspection_files introspection_files "${CMAKE_CURRENT_SOURCE_DIR}/")
+   list(APPEND _abs_introspection_files
+     ${CMAKE_CURRENT_BINARY_DIR}/poppler-enums.c
diff --git a/meta-oe/recipes-support/poppler/poppler_0.63.0.bb b/meta-oe/recipes-support/poppler/poppler_0.63.0.bb
index 8acb35628..997e531d1 100644
--- a/meta-oe/recipes-support/poppler/poppler_0.63.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_0.63.0.bb
@@ -6,6 +6,7 @@ SRC_URI = " \
     http://poppler.freedesktop.org/${BP}.tar.xz \
     file://0001-Do-not-overwrite-all-our-build-flags.patch \
     file://0002-CairoOutputDev.cc-fix-build-error-when-using-fixedpo.patch \
+    file://0001-glib-CMakeLists.txt-Add-libpoppler-to-link-along-wit.patch \
 "
 SRC_URI[md5sum] = "66a54da4896b1408611699feda5c1821"
 SRC_URI[sha256sum] = "27cc8addafc791e1a26ce6acc2b490926ea73a4f89196dd8a7742cff7cf8a111"
-- 
2.11.0


