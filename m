Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web10.3684.1617934886395082082
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 19:21:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lE42qBMn;
 spf=pass (domain: gmail.com, ip: 209.85.167.173, mailfrom: akuster808@gmail.com)
Received: by mail-oi1-f173.google.com with SMTP id n8so4265537oie.10
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 19:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=f4k6jf/4FHtcVFFYD6mwNw6YkP6qHFovkoleufacbek=;
        b=lE42qBMnD3qNxRndSEQvhbJeDpEcFJ9R8ro9AzdnR4lIjQNC14HMUJob2/bws8H1kB
         7hDRDo56beyCih1dnn5+cXszh7k3QNSnH7U6bfz5VatsP+DeUraE1CBj6IQDd83g4vhH
         bgUFePjbCgeIU0MeZ2VVHoAv9HpJW+44ib+ThR0DRErvtt80PyCIkfxTGgwfaUz5o0tl
         m39BkzogNVjNbxRH1VqnYCCJPRt6Wpk8zsbbTIQMSKNCk5wRFxnJBDqVFMWWc/J3RiXq
         ulbgDhKXh/CfMjuFrs6VeOz4z3eWNlRWjtnf/bSulZ86OvecHypOrH2Ca4HiZLSwrDTE
         OO/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=f4k6jf/4FHtcVFFYD6mwNw6YkP6qHFovkoleufacbek=;
        b=E5ALodX/gtrw+evEcTRTr/cj1sbUo+qSRvQQxqUlJ1rkWq0l9522G3ag5Si5pKPnsQ
         0ABEJe+t10xbf3M50QOvl0/rdGJ26JzGBu7Y9kryhrh30Jn9rK4ia5+e1GK+urcR74aO
         7PIEQ+O45y3QAtA0bLyOuZ/BQQGXcBh6II0pnIFDR8A6pukCtntraMe31GPeiMfQ5crt
         LLwHC9CWekzdfcBde9NEv3JE1V7plZyO9WSrMiXYloK8aWOaOSdp9B0VtUm+dc+xaFjX
         nV11dA1+OzlbPaPvCcGuhuhxiTY6ixGo2W6fhzYR3MdDA+4Tg1M5DmvwxPrQ1gsWPykM
         UHxg==
X-Gm-Message-State: AOAM532SsvOH2RDdZUpeblQceYU+xi9LbtVpagOcPLsqQd41thpBC1S5
	uCbAXkgp+/5GTkbYDdjuAgHpAMclhoQ=
X-Google-Smtp-Source: ABdhPJx4/Di3BAsVKBbhgO46dXfZTkDMGusMUqMbvES8k3qdwVWM8CTpiTogRY7x2iEZI+/ljZvRyA==
X-Received: by 2002:aca:c7c6:: with SMTP id x189mr8372362oif.87.1617934885566;
        Thu, 08 Apr 2021 19:21:25 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8533:6d3:7a8:8272])
        by smtp.gmail.com with ESMTPSA id k65sm299815otk.53.2021.04.08.19.21.24
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 19:21:25 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 36/36] xterm: upgrade 366 -> 367
Date: Thu,  8 Apr 2021 19:20:49 -0700
Message-Id: <94fe80ce8609d62e51cc190595a9f0c2a4a5a89e.1617934043.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617934043.git.akuster808@gmail.com>
References: <cover.1617934043.git.akuster808@gmail.com>

From: zangrc <zangrc.fnst@fujitsu.com>

-License-Update: Copyright year updated to 2021.

Refresh the following patch:
0001-Add-configure-time-check-for-setsid.patch

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 97f59fb2063dae01c72e1e3a690edf5dfe645571)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../0001-Add-configure-time-check-for-setsid.patch     | 10 +++++-----
 .../xorg-app/{xterm_366.bb => xterm_367.bb}            |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)
 rename meta-oe/recipes-graphics/xorg-app/{xterm_366.bb => xterm_367.bb} (89%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xterm/0001-Add-configure-time-check-for-setsid.patch b/meta-oe/recipes-graphics/xorg-app/xterm/0001-Add-configure-time-check-for-setsid.patch
index d3beea8be19..92ecdac224b 100644
--- a/meta-oe/recipes-graphics/xorg-app/xterm/0001-Add-configure-time-check-for-setsid.patch
+++ b/meta-oe/recipes-graphics/xorg-app/xterm/0001-Add-configure-time-check-for-setsid.patch
@@ -18,7 +18,7 @@ diff --git a/configure b/configure
 index 0aafefc..03e8df0 100755
 --- a/configure
 +++ b/configure
-@@ -5411,6 +5411,7 @@ for ac_func in \
+@@ -5605,6 +5605,7 @@ for ac_func in \
  	unsetenv \
  	sched_yield \
  	setpgid \
@@ -42,7 +42,7 @@ diff --git a/main.c b/main.c
 index 5e60589..b81d2be 100644
 --- a/main.c
 +++ b/main.c
-@@ -2868,7 +2868,7 @@ main(int argc, char *argv[]ENVP_ARG)
+@@ -2903,7 +2903,7 @@ main(int argc, char *argv[]ENVP_ARG)
      }
  }
  
@@ -51,7 +51,7 @@ index 5e60589..b81d2be 100644
  #define USE_OPENPTY 1
  static int opened_tty = -1;
  #endif
-@@ -4040,7 +4040,7 @@ spawnXTerm(XtermWidget xw, unsigned line_speed)
+@@ -4074,7 +4074,7 @@ spawnXTerm(XtermWidget xw, unsigned line_speed)
  	    /*
  	     * now in child process
  	     */
@@ -64,14 +64,14 @@ diff --git a/xtermcfg.hin b/xtermcfg.hin
 index 1dbc3b8..4f3ff5b 100644
 --- a/xtermcfg.hin
 +++ b/xtermcfg.hin
-@@ -96,6 +96,7 @@
+@@ -95,6 +95,7 @@
  #undef HAVE_PUTENV		/* AC_CHECK_FUNCS(putenv) */
  #undef HAVE_SCHED_YIELD		/* AC_CHECK_FUNCS(sched_yield) */
  #undef HAVE_SETPGID		/* AC_CHECK_FUNCS(setpgid) */
 +#undef HAVE_SETSID		/* AC_CHECK_FUNCS(setsid) */
  #undef HAVE_STDINT_H		/* AC_PROG_CC_STDC */
  #undef HAVE_STDLIB_H		/* AC_CHECK_HEADERS(stdlib.h) */
- #undef HAVE_STRFTIME		/* AC_CHECK_FUNCS(strftime) */
+ #undef HAVE_STDNORETURN_H	/* CF_C11_NORETURN */
 -- 
 2.24.1
 
diff --git a/meta-oe/recipes-graphics/xorg-app/xterm_366.bb b/meta-oe/recipes-graphics/xorg-app/xterm_367.bb
similarity index 89%
rename from meta-oe/recipes-graphics/xorg-app/xterm_366.bb
rename to meta-oe/recipes-graphics/xorg-app/xterm_367.bb
index 969159bc57b..e0d3dcec135 100644
--- a/meta-oe/recipes-graphics/xorg-app/xterm_366.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xterm_367.bb
@@ -2,13 +2,13 @@ require recipes-graphics/xorg-app/xorg-app-common.inc
 SUMMARY = "xterm is the standard terminal emulator for the X Window System"
 DEPENDS = "libxaw xorgproto libxext libxau libxinerama libxpm ncurses desktop-file-utils-native"
 
-LIC_FILES_CHKSUM = "file://xterm.h;beginline=3;endline=31;md5=996b1ce0584c0747b17b57654cc81e8e"
+LIC_FILES_CHKSUM = "file://xterm.h;beginline=3;endline=31;md5=987de9787175385203a1ea2482246a17"
 
 SRC_URI = "http://invisible-mirror.net/archives/${BPN}/${BP}.tgz \
            file://0001-Add-configure-time-check-for-setsid.patch \
           "
 
-SRC_URI[sha256sum] = "858b2885963fe97e712739066aadc1baeba2b33a0016303a7fec7d38bc73bf6e"
+SRC_URI[sha256sum] = "27f1a8b1c756e269fd5684e60802b545f0be9b36b8b5d6bdbc840c6b000dc51f"
 
 PACKAGECONFIG ?= ""
 PACKAGECONFIG[xft] = "--enable-freetype,--disable-freetype,libxft fontconfig freetype-native"
-- 
2.17.1

