Return-Path: <crogers122@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 229E3C6FD1F
	for <webhook@archiver.kernel.org>; Fri, 10 Mar 2023 15:37:00 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web11.22352.1678462615516233109
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Mar 2023 07:36:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OHlfAUVs;
 spf=pass (domain: gmail.com, ip: 209.85.160.181, mailfrom: crogers122@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id c3so6057807qtc.8
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Mar 2023 07:36:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678462614;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4GruZb74edD6cxsc0SGu0a+XdIojOx0l3II7nNX65Eo=;
        b=OHlfAUVstn/DfSxsxuN8Qy0iHmkBcTO5+YSKTZ68j5xhotuitS513pLoO3FwAQl6WI
         oNkbQhyM6iKRcygdx6SB4VWNxjLczshQjVhfUhxPS4saXLfMzxuGF5Ar2CV8/bTZzdtf
         /uCsAwqCCC41icMCDIHYcSclunx0qZLi6TDjdNZGKO3G9o2FClKm7oT8TtILoBfHgHYX
         tRv/USi1H1tOz2ei50q+MN0vPAgOLF9WtmuqOI9GH6AaFh+4cPUZijkgnp99WRsTfGfI
         kD7xCt07DasYmk6QHtmqNjMAsxFG81z/sAgEAtQg1GOKZGjGUXHcLo5+QJVXcjOzJm3H
         qkJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678462614;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4GruZb74edD6cxsc0SGu0a+XdIojOx0l3II7nNX65Eo=;
        b=dlmixIzhwjCunLn96JAI4TBNTH9iZiJV7BJ5VQWaM3K/BNDvQqWOM5Td5CXyueqHh/
         Q3+rgcA5kL8jeW66WB4kbR3sAz1NXRDNsfQhOcKFsvesL+tXIoLsCYSBwzbrzo+DTVyR
         rMStESOfB0+CLodyo2OERPBYE7hJnzjaeoo13leNi5B9h8y5jRZY3g+d3t0ovA+sM9ml
         TEjAGSpOSGHDVaj7zGRqSuvw6KJMV2fsJLs/aeYW6PA/Afszn8P+cs4U/NFYhIrdYgTA
         JO5NGugW+9lvkt9LamsHQEozwHL9Rx4nCa9Q2jxvqxBCkvTcDmvQVBA2BLT5zXHHTFfl
         hijQ==
X-Gm-Message-State: AO0yUKXYT9ZLSDg1XU1etVgF5Y0aF9VSrPaJv2PTiduQJ04n+PueMNy5
	Laz8diazU+4zEG1ZKnlxTtrEwX9GGVnoSm1b
X-Google-Smtp-Source: AK7set/69ldE5c7auzsWJcPZ834tMM6yMdL1drPGwP68FZjVT4YpR4TmHmEBWAY+NvRYHG3QvE75QQ==
X-Received: by 2002:a05:622a:180f:b0:3bd:d8f:2da9 with SMTP id t15-20020a05622a180f00b003bd0d8f2da9mr5605265qtc.2.1678462613959;
        Fri, 10 Mar 2023 07:36:53 -0800 (PST)
Received: from UBU-rogers-L.fios-router.home (pool-74-111-44-222.syrcny.fios.verizon.net. [74.111.44.222])
        by smtp.gmail.com with ESMTPSA id c4-20020ac81e84000000b003b9a573aec6sm5048qtm.70.2023.03.10.07.36.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 07:36:53 -0800 (PST)
From: Chris Rogers <crogers122@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: akuster808@gmail.com,
	Chris Rogers <crogers122@gmail.com>
Subject: [meta-oe][dunfell][PATCH] xterm: Remove undeclared variables introduced by backport
Date: Fri, 10 Mar 2023 10:36:34 -0500
Message-Id: <20230310153634.3376415-1-crogers122@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Mar 2023 15:37:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101492

CVE-2022-45063 ported onto the dunfell baseline introduces two
variables that cause xterm to fail compilation with the error

./fontutils.c:4143:13: error: 'added' undeclared (first use in this function)

These two variables don't appear to be defined at all in findXftGlyph for
xterm_353, so they should be removed.

Fixes: 10148c538ebc("xterm : Fix CVE-2022-45063 code execution via OSC 50 input sequences] CVE-2022-45063")
Signed-off-by: Chris Rogers <crogers122@gmail.com>
---
 .../xorg-app/xterm/CVE-2022-45063.patch       | 21 ++++++-------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/meta-oe/recipes-graphics/xorg-app/xterm/CVE-2022-45063.patch b/meta-oe/recipes-graphics/xorg-app/xterm/CVE-2022-45063.patch
index 8d1be3210..e63169a20 100644
--- a/meta-oe/recipes-graphics/xorg-app/xterm/CVE-2022-45063.patch
+++ b/meta-oe/recipes-graphics/xorg-app/xterm/CVE-2022-45063.patch
@@ -574,16 +574,7 @@ index 4b0ef85..d9bfaf8 100644
  			}
  		    }
  		}
-@@ -4119,6 +4140,8 @@ findXftGlyph(XtermWidget xw, XftFont *given, unsigned wc)
- 		    }
- #endif
- 		    if (foundXftGlyph(xw, check, wc)) {
-+	    (void) added;
-+	    (void) actual;
- 			markXftOpened(xw, which, n, wc);
- 			reportXftFonts(xw, check, "fallback", tag, myReport);
- 			result = check;
-@@ -4317,7 +4340,7 @@ lookupOneFontSize(XtermWidget xw, int fontnum)
+@@ -4317,7 +4338,7 @@ lookupOneFontSize(XtermWidget xw, int fontnum)
  
  	memset(&fnt, 0, sizeof(fnt));
  	screen->menu_font_sizes[fontnum] = -1;
@@ -592,7 +583,7 @@ index 4b0ef85..d9bfaf8 100644
  	    if (fontnum <= fontMenu_lastBuiltin
  		|| strcmp(fnt.fn, DEFFONT)) {
  		screen->menu_font_sizes[fontnum] = FontSize(fnt.fs);
-@@ -4722,13 +4745,14 @@ HandleSetFont(Widget w GCC_UNUSED,
+@@ -4722,13 +4743,14 @@ HandleSetFont(Widget w GCC_UNUSED,
      }
  }
  
@@ -608,7 +599,7 @@ index 4b0ef85..d9bfaf8 100644
  
      TRACE(("SetVTFont(which=%d, f_n=%s, f_b=%s)\n", which,
  	   (fonts && fonts->f_n) ? fonts->f_n : "<null>",
-@@ -4737,34 +4761,31 @@ SetVTFont(XtermWidget xw,
+@@ -4737,34 +4759,31 @@ SetVTFont(XtermWidget xw,
      if (IsIcon(screen)) {
  	Bell(xw, XkbBI_MinorError, 0);
      } else if (which >= 0 && which < NMENUFONTS) {
@@ -659,7 +650,7 @@ index 4b0ef85..d9bfaf8 100644
  	    }
  
  	    USE_CACHED(f_n, fNorm);
-@@ -4774,7 +4795,7 @@ SetVTFont(XtermWidget xw,
+@@ -4774,7 +4793,7 @@ SetVTFont(XtermWidget xw,
  	    USE_CACHED(f_wb, fWBold);
  #endif
  	    if (xtermLoadFont(xw,
@@ -668,7 +659,7 @@ index 4b0ef85..d9bfaf8 100644
  			      doresize, which)) {
  		/*
  		 * If successful, save the data so that a subsequent query via
-@@ -4786,10 +4807,8 @@ SetVTFont(XtermWidget xw,
+@@ -4786,10 +4805,8 @@ SetVTFont(XtermWidget xw,
  		SAVE_FNAME(f_w, fWide);
  		SAVE_FNAME(f_wb, fWBold);
  #endif
@@ -680,7 +671,7 @@ index 4b0ef85..d9bfaf8 100644
  		Bell(xw, XkbBI_MinorError, 0);
  	    }
  	    FREE_FNAME(f_n);
-@@ -4802,7 +4821,8 @@ SetVTFont(XtermWidget xw,
+@@ -4802,7 +4819,8 @@ SetVTFont(XtermWidget xw,
      } else {
  	Bell(xw, XkbBI_MinorError, 0);
      }
-- 
2.25.1


