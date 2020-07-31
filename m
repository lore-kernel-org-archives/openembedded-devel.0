Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web11.8122.1596153626709303142
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jul 2020 17:00:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pApkKOjq;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id df16so4857699edb.9
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Jul 2020 17:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=/FHCeJLZtm3zv7PPeGCK3goR7H5QJ01Onyb9P32JABU=;
        b=pApkKOjqoHK1aZoUyYEeAVxn3Amlp/h04/1Qr4t6HPWqlfXzg0IXodaLLQ73hIgZAo
         /AFuHsTCsxL8YHElRpGeCkWIUeA374IA2wm7ij/3jGT0Fji/aQF7OPUDtOUyMYf/S5u8
         Va8v+6wlzeCaMwcTKB6MOJIoecupuSS4dNjWk7jREzr1/Ar47qKiH4lgtEOX1ZQxplm3
         KdFDDPPRtoHbvODCgLMPAnW0MVzfn3eGRRQVkqf78g1Qt4j63HvtptCm61cDp7EYH9Qp
         gO1G06s5DGmIYX7ojO5hRv08ZSXDuLZDE96jVjAi4JiIRJW6dylIUBbXVELkrIM6Dimh
         FICA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/FHCeJLZtm3zv7PPeGCK3goR7H5QJ01Onyb9P32JABU=;
        b=myssz70BPq6V0FE/Vv+DweTavN4IJtQggdE+a0ln/N0by51zuscMmapP1/U8SQ/W86
         xh513Pa1d0ZGnmvtNGlWD7qQ7hKj3+du3zdFCXmifqCr3VMrtrzpiDRDXQMYD+lgWFjF
         zwvl2yxG7orFRKml8MlB0UAfPzsJ0B0hFx+SZka+GEWIcNHV1p65FgZ1qwa4GaOnXq94
         ZHd5UQsLTOajAJvEflM8kXJ4qMaEnYkCMuRhgYEDaBXeoeoR82f2KjGs8dByIUPGoyZ0
         f0ATeX4LzqkZdiU78CHxNxUgsugSynDR2DIb9nWXI18AmfNQMEyPGO0kqV6U/kmeGSYH
         6yew==
X-Gm-Message-State: AOAM531n+6hkkEV/KNub/AtpJ38HXSdVfiP4tI7Rp7Qm0ZCACuhfrRGY
	JTc5JRY9t25+67V2Mx9BANKte86r
X-Google-Smtp-Source: ABdhPJzAvl5zhJf7hhjUT0cCJsNF+3peg4RBQREIXz64vuOmEoubggwtVxzj3WKCHHAp7TsRuWEA5Q==
X-Received: by 2002:a50:9987:: with SMTP id m7mr1432978edb.176.1596153625059;
        Thu, 30 Jul 2020 17:00:25 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f120620ff8937d1a8714aa4.dip0.t-ipconnect.de. [2003:f0:7f12:620:ff89:37d1:a871:4aa4])
        by smtp.gmail.com with ESMTPSA id a19sm7687997ejg.116.2020.07.30.17.00.23
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2020 17:00:24 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 4/4] live555: upgrade 20190828 -> 20200721
Date: Fri, 31 Jul 2020 02:00:07 +0200
Message-Id: <20200731000007.452878-4-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200731000007.452878-1-schnitzeltony@gmail.com>
References: <20200731000007.452878-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../live555/{files => live555}/config.linux-cross            | 2 +-
 .../live555/{live555_20190828.bb => live555_20200721.bb}     | 5 ++++-
 2 files changed, 5 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-multimedia/live555/{files => live555}/config.linux-cross (90%)
 rename meta-oe/recipes-multimedia/live555/{live555_20190828.bb => live555_20200721.bb} (96%)

diff --git a/meta-oe/recipes-multimedia/live555/files/config.linux-cross b/meta-oe/recipes-multimedia/live555/live555/config.linux-cross
similarity index 90%
rename from meta-oe/recipes-multimedia/live555/files/config.linux-cross
rename to meta-oe/recipes-multimedia/live555/live555/config.linux-cross
index d1277da8d..fe6a28604 100644
--- a/meta-oe/recipes-multimedia/live555/files/config.linux-cross
+++ b/meta-oe/recipes-multimedia/live555/live555/config.linux-cross
@@ -12,6 +12,6 @@ CONSOLE_LINK_OPTS =	$(LINK_OPTS)
 LIBRARY_LINK =		$(LD) -o
 LIBRARY_LINK_OPTS =	$(LINK_OPTS) -r -Bstatic
 LIB_SUFFIX =			a
-LIBS_FOR_CONSOLE_APPLICATION =
+LIBS_FOR_CONSOLE_APPLICATION = -lssl -lcrypto
 LIBS_FOR_GUI_APPLICATION =
 EXE =
diff --git a/meta-oe/recipes-multimedia/live555/live555_20190828.bb b/meta-oe/recipes-multimedia/live555/live555_20200721.bb
similarity index 96%
rename from meta-oe/recipes-multimedia/live555/live555_20190828.bb
rename to meta-oe/recipes-multimedia/live555/live555_20200721.bb
index 39e1fddfc..df85cd484 100644
--- a/meta-oe/recipes-multimedia/live555/live555_20190828.bb
+++ b/meta-oe/recipes-multimedia/live555/live555_20200721.bb
@@ -7,13 +7,16 @@ HOMEPAGE = "http://live.com/"
 LICENSE = "LGPLv3"
 SECTION = "devel"
 
+DEPENDS = "openssl"
+
 URLV = "${@d.getVar('PV')[0:4]}.${@d.getVar('PV')[4:6]}.${@d.getVar('PV')[6:8]}"
 SRC_URI = "https://download.videolan.org/pub/contrib/live555/live.${URLV}.tar.gz \
            file://config.linux-cross"
+
 # only latest live version stays on http://www.live555.com/liveMedia/public/, add mirror for older
 MIRRORS += "http://www.live555.com/liveMedia/public/ http://download.videolan.org/contrib/live555/ \n"
 
-SRC_URI[sha256sum] = "a3dcd157865186cf883c3a80b4bb09637e91fff96b234b2c780a7f7dcc7a35dc"
+SRC_URI[sha256sum] = "89b2d99589de2ce9b4007ea6625dfce28317421604cf5131f4e1bf5bf7040b63"
 
 S = "${WORKDIR}/live"
 
-- 
2.26.2

