Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 48BF077CF1
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Aug 2017 21:48:21 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id p13so4234923pfd.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Aug 2017 14:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=3IT20T1twAP0Hfc5/Xn3FegFjj51kedixrTTx7eG3/8=;
	b=ZgPLLgZKxTM90eU2wRHEhJTIYjrDNtL+84SfHNMEl1bdNlmClfa5xJihTSdt3LCGZ9
	7lFGoSvaTxiHV+cAoGK4qgZ5Aj2HBWEYMRWOCr5CUcDVBjy3PLNOb4qlfGmH+pgEGGtv
	oKLHOnIH9e398XNatlp4LXaPajUa2yy7T4WJh7rOK9zhTueQ+MoyJu5pxl8Ptuk7yQOJ
	e77+ZyszhXt84zgfKLC3OEYxaG9WpwqvI72kuNAToB4mh2r2SRHRBnvByjvfTL8uCKGM
	wSwg9gSvklE7k6UNqrOXOK+xpO39qe/oLnWwpwCKNoTY6aSKDwl9hoLaIkpUvAWQoF3L
	+hjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=3IT20T1twAP0Hfc5/Xn3FegFjj51kedixrTTx7eG3/8=;
	b=GK77DvJuTaQCdS3LD+AZkFuZNK8GbLxHeldFBGOTNGEmkslFaYntYtH8eE2THgsie+
	wTplUmlAnwjCpanfo3WiYN1DCoZ2Xb4TWvYEgGeoqgUV3gSVSlDZ1wHs+Ra0m1upoGUz
	fK8sxItXHoEmpOXp6DxAXd2QV+ztgagTl8cfHRXvQLfnIIt1YSWOgv5qAhwmcK586P1X
	ZRY3WjNuxelh2HQlst7R91J3FMxChlzDQ/FMlAcjahdwBKFYV70GFyrRuq99laDARC9b
	G28mpEXHrcTvJAoqkvTEgnwPlWTtja4t+u8wZJkAqsTYd8E8ZW+ahIfDliYzDJ3eES2o
	/qPg==
X-Gm-Message-State: AHYfb5iW8h1iUkCA02eU6L5Je4CaH6sQSwqbxnU7Q3Hpz+TqlXPFOT+M
	LD8ESdgYunBUzMwS
X-Received: by 10.84.129.71 with SMTP id 65mr6297635plb.49.1502228902393;
	Tue, 08 Aug 2017 14:48:22 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::f213])
	by smtp.gmail.com with ESMTPSA id
	d135sm2768713pga.6.2017.08.08.14.48.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 Aug 2017 14:48:21 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Aug 2017 14:47:59 -0700
Message-Id: <20170808214800.39621-8-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.0
In-Reply-To: <20170808214800.39621-1-raj.khem@gmail.com>
References: <20170808214800.39621-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 8/9] collectd: Fix build with clang
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
X-List-Received-Date: Tue, 08 Aug 2017 21:48:21 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...onfigure-Check-for-Wno-error-format-truncation-comp.patch | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-extended/collectd/collectd/0001-configure-Check-for-Wno-error-format-truncation-comp.patch b/meta-oe/recipes-extended/collectd/collectd/0001-configure-Check-for-Wno-error-format-truncation-comp.patch
index 70b0983e4..5069a639c 100644
--- a/meta-oe/recipes-extended/collectd/collectd/0001-configure-Check-for-Wno-error-format-truncation-comp.patch
+++ b/meta-oe/recipes-extended/collectd/collectd/0001-configure-Check-for-Wno-error-format-truncation-comp.patch
@@ -1,14 +1,18 @@
-From 14d469bc82c758116aef7d549abd49c131b4170f Mon Sep 17 00:00:00 2001
+From b459c55e4968321e5a82272cb39aa69d4054990f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 22 Apr 2017 11:54:57 -0700
 Subject: [PATCH] configure: Check for -Wno-error=format-truncation compiler
  option
 
 If this option is supported by compiler then disable it ( gcc7+)
+Use -Werror to elevate the warning to an error in case compiler like clang
+which warn about unknown options but not error out unless asked for
+
 Fixes
 client.c:834:23: error: '%s' directive output may be truncated writing up to 1023 bytes into a region of size 1010 [-Werror=format-truncation=]
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  configure.ac                |  3 +-
  m4/ax_check_compile_flag.m4 | 74 +++++++++++++++++++++++++++++++++++++++++++++
@@ -16,7 +20,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  create mode 100644 m4/ax_check_compile_flag.m4
 
 diff --git a/configure.ac b/configure.ac
-index 8854542..f3a6b57 100644
+index 8854542..edb8cfb 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -4,7 +4,6 @@ AC_INIT([collectd],[m4_esyscmd(./version-gen.sh)])
@@ -31,7 +35,7 @@ index 8854542..f3a6b57 100644
          AM_CFLAGS="$AM_CFLAGS -Werror"
          AM_CXXFLAGS="$AM_CXXFLAGS -Werror"
  fi
-+AX_CHECK_COMPILE_FLAG([-Werror=format-truncation],[AM_CFLAGS="$AM_CFLAGS -Wno-error=format-truncation" AM_CXXFLAGS="$AM_CXXFLAGS -Wno-error=format-truncation"])
++AX_CHECK_COMPILE_FLAG([-Werror -Werror=format-truncation],[AM_CFLAGS="$AM_CFLAGS -Wno-error=format-truncation" AM_CXXFLAGS="$AM_CXXFLAGS -Wno-error=format-truncation"])
 +
  AC_SUBST([AM_CFLAGS])
  AC_SUBST([AM_CXXFLAGS])
@@ -117,5 +121,5 @@ index 0000000..dcabb92
 +AS_VAR_POPDEF([CACHEVAR])dnl
 +])dnl AX_CHECK_COMPILE_FLAGS
 -- 
-2.12.2
+2.13.4
 
-- 
2.14.0


