Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6358FC001DF
	for <webhook@archiver.kernel.org>; Thu, 13 Jul 2023 21:54:49 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.3816.1689285280277876176
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Jul 2023 14:54:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Wdx+jIX2;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1b8bbcfd89aso7319245ad.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Jul 2023 14:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689285279; x=1691877279;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jmrTIM40aRylHpJIx3u40QsWxw+86ZhthWv6VOoXCBI=;
        b=Wdx+jIX2FPKzmBRoe4NJkidmxC8sNYx6QIuaAV1+Ymg/HnQ23gokp+QsLhb4ourpDF
         pqtBskmRcLpriZugq1fiLzgDUuKsnZVEQLZwD4s737vLVPJdCnnwoF+jjuTieUzTsjla
         Yf+6mM2d45yP+LdpUyUMRATxqZbGduGvw7OL925jYQ4knz61bFToJaB3SFePw9rQZ6vl
         1P8P9SolCcFOcaPe25OPXSRjZQCfKuOFoHlVj921Un1cN6ztfF0bVSQSMje0fdoKksq7
         fRr3wKWlC0NErsE3/C5E06+A3GVgSoO+1lToGUejg8oqwh8GU+sploOLYpM7ZTXvwsmz
         nlhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689285279; x=1691877279;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jmrTIM40aRylHpJIx3u40QsWxw+86ZhthWv6VOoXCBI=;
        b=Wx2MBO0g2G0uEQ7rTvEl/K0cxMBbh0xw5wrn7HybZBP6K5Wh5gc/VeNeRpiLTYQLOB
         ydfWwMSKWCNHhWWK7Z36UkXLq6R8N6xdUEtAlL4aUibzJviUh43KBxODukk0e5KYqerW
         YVid/atmGYydbEiwe1uy7q+DPussgsca+9BnVvKR20O/eLiQ8Jr+yi7nRU/lddcsqpq1
         9OJBXxgH9J2H89LWBMO48S2GbdPs8SW7YNrhGam0Y3PVZOnJcn0kk06d5xigSPdtFhJr
         pNyop9OOHLL6F1yAo+2YzuV6/6ZklHAviem8l5bjUO+H9O/B7t+GDW+eaEJlkF5pOW/3
         alMw==
X-Gm-Message-State: ABy/qLabdXIODclbROEtz9Nui13d726pyeNNR0Ky5eQgdPKNSTOgSOOo
	cD7MHToUPIfAX20NrthI6ZReLKevNZ4=
X-Google-Smtp-Source: APBJJlHYY5W0GNpENaGoR+xj3UibROFH3+Z0N5GCxevIU+y7/H+rrR93hwZD5TZ0jsIXVeARmExelw==
X-Received: by 2002:a17:903:32c4:b0:1b8:95fc:d11 with SMTP id i4-20020a17090332c400b001b895fc0d11mr2521518plr.40.1689285279389;
        Thu, 13 Jul 2023 14:54:39 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::5a1b])
        by smtp.gmail.com with ESMTPSA id i19-20020a170902eb5300b001b7f9963febsm6369861pli.175.2023.07.13.14.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jul 2023 14:54:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] graphviz: Upgrade to 8.1.0 release
Date: Thu, 13 Jul 2023 14:54:36 -0700
Message-ID: <20230713215436.3619288-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Jul 2023 21:54:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103857

Do not build pdf documentation, we do not have host tools needed for
this to build

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...use_tcl-to-be-empty-string-if-tcl-is-disabled.patch | 10 +++++-----
 .../graphviz/{graphviz_2.50.0.bb => graphviz_8.1.0.bb} |  5 ++---
 2 files changed, 7 insertions(+), 8 deletions(-)
 rename meta-oe/recipes-graphics/graphviz/{graphviz_2.50.0.bb => graphviz_8.1.0.bb} (96%)

diff --git a/meta-oe/recipes-graphics/graphviz/graphviz/0001-Set-use_tcl-to-be-empty-string-if-tcl-is-disabled.patch b/meta-oe/recipes-graphics/graphviz/graphviz/0001-Set-use_tcl-to-be-empty-string-if-tcl-is-disabled.patch
index 6d1d441c57..99b53e2e12 100644
--- a/meta-oe/recipes-graphics/graphviz/graphviz/0001-Set-use_tcl-to-be-empty-string-if-tcl-is-disabled.patch
+++ b/meta-oe/recipes-graphics/graphviz/graphviz/0001-Set-use_tcl-to-be-empty-string-if-tcl-is-disabled.patch
@@ -11,7 +11,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1540,7 +1540,7 @@ AC_ARG_ENABLE(tcl,
+@@ -1225,7 +1225,7 @@ AC_ARG_ENABLE(tcl,
    [], [enable_tcl=yes])
  
  if test "x$enable_tcl" != "xyes"; then
@@ -22,12 +22,12 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  if test "x$use_tcl" = "x"; then
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -19,7 +19,7 @@ pkginclude_HEADERS = $(top_builddir)/gra
- man_MANS = graphviz.7
+@@ -11,7 +11,7 @@ pkginclude_HEADERS = $(top_builddir)/gra
+ dist_man_MANS = graphviz.7
  
  # $(subdirs) contains the list from: AC_CONFIG_SUBDIRS
--SUBDIRS = $(subdirs) lib plugin cmd tclpkg doc contrib share graphs rtest tests
-+SUBDIRS = $(subdirs) lib plugin cmd doc contrib share graphs rtest tests
+-SUBDIRS = $(subdirs) lib plugin cmd tclpkg doc contrib share graphs tests
++SUBDIRS = $(subdirs) lib plugin cmd doc contrib share graphs tests
  
  .PHONY: doxygen
  doxygen:
diff --git a/meta-oe/recipes-graphics/graphviz/graphviz_2.50.0.bb b/meta-oe/recipes-graphics/graphviz/graphviz_8.1.0.bb
similarity index 96%
rename from meta-oe/recipes-graphics/graphviz/graphviz_2.50.0.bb
rename to meta-oe/recipes-graphics/graphviz/graphviz_8.1.0.bb
index b63017576a..7ab15c9718 100644
--- a/meta-oe/recipes-graphics/graphviz/graphviz_2.50.0.bb
+++ b/meta-oe/recipes-graphics/graphviz/graphviz_8.1.0.bb
@@ -27,8 +27,7 @@ SRC_URI:append:class-target = "\
 SRC_URI:append:class-nativesdk = "\
            file://graphviz-setup.sh \
 "
-
-SRC_URI[sha256sum] = "6b16bf990df114195be669773a1dae975dbbffada45e1de2849ddeb5851bb9a8"
+SRC_URI[sha256sum] = "d593695fdaa8a19297523b679ad13d3ef2027b0b7f14cc2bc23e77969ed81565"
 
 CVE_CHECK_IGNORE += "\
     CVE-2014-9157 \
@@ -37,7 +36,7 @@ CVE_CHECK_IGNORE += "\
 PACKAGECONFIG ??= "librsvg"
 PACKAGECONFIG[librsvg] = "--with-librsvg,--without-librsvg,librsvg"
 
-EXTRA_OECONF:append = " PS2PDF=/bin/echo"
+EXTRA_OECONF:append = " PS2PDF=/bin/echo --disable-man-pdfs"
 
 EXTRA_OECONF:class-target = "\
                 --with-expatincludedir=${STAGING_INCDIR} \
-- 
2.41.0


