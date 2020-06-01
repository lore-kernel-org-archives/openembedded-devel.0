Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web11.48690.1591047948636916904
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Jun 2020 14:45:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Tx2eJ0ZI;
 spf=pass (domain: gmail.com, ip: 209.85.128.68, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wm1-f68.google.com with SMTP id d128so1032311wmc.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Jun 2020 14:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Raj0eMdnVPfAYp8H/kz2qZJiI0iGc6Uo5tuAxts1+vM=;
        b=Tx2eJ0ZI5BuBteX4ZEx1iBn7UKPWjOQs7mh35lCaWIum83C4aRDJXhNavhidR/iPm9
         Wv5H+QU10ogBlOA2VaHgll0UoiLilad0ACxr1UVd9NuwmgQ50kcRvNgrngZojRaUZFak
         UfFEti0JiESZ3QoBBdwP4qQa2f1xcPbwOuorjz1hNRus8olpSj16+1849ksIcxUG3Y5D
         naPXnBKj3lUszJ11FILtDhrqfCDBA+GeEW7qh/wmtm14l6xnsNZyhafkBvoudyauZk1U
         xY8+hWXJ78nzvFX0pvI/1Zh2VIJ6+FMwxIVr95dJJxJH2hFRMTPVPou5p2xPa8Go/xtJ
         UPmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Raj0eMdnVPfAYp8H/kz2qZJiI0iGc6Uo5tuAxts1+vM=;
        b=IrbPlof7rOJaXN/GvRjCHrJ1paNtVCddUUG1T5B/dTmOXTREnzFPES9zuTKcLxEn5u
         G7+nucrcDLxk0jIFK1LcWhwG36KY0mijC3QrNR3Uqa5ROZaK6yHTyFTaB3wxcyNNkjho
         9hzBci4RWvt8EaZtoFdtC5YDiDj/J0+2FtZmKT54WSZnJZFMnccoXc8/ExAT2doEkMRx
         45wFf60214K7NdTkrzHrLaYszcZh8pMdMa84gmfZ2WRV0WFj+7QCpmlE5aBssFgh7UzR
         mnLixbmHpr94xUJ1YeKczusQNQhEle2TdkB2TB1zmtABJblf88QXeJcARRmdE6uUJrBE
         fmVw==
X-Gm-Message-State: AOAM5312CUBjlrmHgU3TUFQcA4oxfWdvtSK1p21Mol36cukxVbgug8az
	o5X6UuJX5XFBORjXc98v7YtKo9MfQq0=
X-Google-Smtp-Source: ABdhPJz2CrthmlcV7EsMJpmvfgwt4sGALe0o5aGRmFleFu3y4W+91NGJ9nsAlQhXs+pamZCOZj2jEw==
X-Received: by 2002:a05:600c:2218:: with SMTP id z24mr1137272wml.24.1591047946478;
        Mon, 01 Jun 2020 14:45:46 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f06ad34da2c69d11ac2eac0.dip0.t-ipconnect.de. [2003:f0:7f06:ad34:da2c:69d1:1ac2:eac0])
        by smtp.gmail.com with ESMTPSA id 40sm1050119wrc.15.2020.06.01.14.45.45
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 14:45:45 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 19/38] gtksourceview4: upgrade 4.4.0 -> 4.6.0
Date: Mon,  1 Jun 2020 23:44:57 +0200
Message-Id: <20200601214516.26624-20-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200601214516.26624-1-schnitzeltony@gmail.com>
References: <20200601214516.26624-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

News in 4.6.0, 2020-03-06
-------------------------
* cpp.lang: add C++20 keywords
* commonlisp.lang: add format directives
* Translation updates

News in 4.5.91, 2020-02-14
--------------------------
* GObject Introspection fixes
* Removed use of g_assert() in favor of alternatives in unit tests so
  distribution unit testing is more reliable
* Robustness improvements in internal GtkTextIter movements
* Style scheme improvements for recent GTK 3 theme styling changes
* Build system improvements to support -Bsymbolic, -Wl,-z,relro,
  -Wl,-z,now and -Wl,-z,defs
* Build improvements for Windows, FreeBSD, and macOS
* cmake.lang: track CMake 3.13 changes
* kotlin.lang: register *.kts glob extension
* gradle.lang: register *.grandle glob extension
* php.lang: Large redesigned PHP lang including support for
  unicode and improved heredoc
* sh.lang: Many improvements including various GNU bash extensions
* meson.lang: Support for string escape sequences
* javascript.lang: Redesign of JavaScript language spec to be more flexible
  and reusable from other languages which support JS.
* jsx.lang: Initial support for JSX
* jsdoc.lang: Initial support for JSDoc
* objj.lang: Improvements using javascript improvements
* asciidoc.lang: Improvements to use more generic markup styling
* t2t.lang: Improvements to use more generic markup styling
* css.lang: Redesign to be more flexible, support reuse and embedding, and
  add various new CSS features
* scss.lang: Improve integration with css.lang
* less.lang: Improve integration with css.lang
* ruby.lang: Improvements for string and escape string handling
* html.lang: Improvements using embedded languages
* go.lang: Improvements for escape sequences
* commonlisp.lang: Initial support for Common Lisp
* ftl.lang: Initial support for Mozilla's Fluent ftl
* Translation updates

I'd like to personally thank Jeffery To for the overwhelming amount of work
they have put into reviewing and improving both language specs and style
schemes this cycle. The number of improvements you see above are largely an
example of their quality reviews and improvements!

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{gtksourceview4_4.4.0.bb => gtksourceview4_4.6.0.bb}    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-gnome/recipes-gnome/gtksourceview/{gtksourceview4_4.4.0.bb => gtksourceview4_4.6.0.bb} (79%)

diff --git a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.4.0.bb b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.6.0.bb
similarity index 79%
rename from meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.4.0.bb
rename to meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.6.0.bb
index bb49550c5..bc7f4b05e 100644
--- a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.4.0.bb
+++ b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.6.0.bb
@@ -16,9 +16,9 @@ inherit gnomebase lib_package gettext features_check gtk-doc gobject-introspecti
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtksourceview/4.4/${PNAME}-${PV}.tar.xz"
-SRC_URI[md5sum] = "5c47e314517692f2622a0b724c65e628"
-SRC_URI[sha256sum] = "9ddb914aef70a29a66acd93b4f762d5681202e44094d2d6370e51c9e389e689a"
+SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtksourceview/4.6/${PNAME}-${PV}.tar.xz"
+SRC_URI[md5sum] = "51558b386cd12602b7bb1c460c09bc62"
+SRC_URI[sha256sum] = "4c13e30ab2e602abdc56f55d35f43c1142a79b1cd77aa8839d2fc85e966d9a85"
 
 GIR_MESON_OPTION = 'gir'
 GTKDOC_MESON_OPTION = "gtk_doc"
-- 
2.21.3

