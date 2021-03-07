Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.27977.1615156501790330310
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Mar 2021 14:35:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UzgtMjXv;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id jt13so16547682ejb.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Mar 2021 14:35:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ogue9rc+QYSHPmn+6W1F+eqs4VnskcvhC5sMit1h6Pk=;
        b=UzgtMjXvaJLd6pFKKNQE7H+8Sy5z+U6JsWHRpcx77eER5jTgX0ZB2xwx+euogd8YYJ
         2nekWkLs/WCQu6dh1+GIZEptm9h65EbGFiO63FNy5/w0qBQweTuzJvN6Or/E5PPZANBD
         Kuxm3pilQCSpsJ1q8oYZyb8F/PesLLZmyTmk5C8sLcT4ynKRQvflcc4r6XfpLzIFYECu
         Q+gssadvywuBbvMyfRwXqf2Pza+gbRRmSt+HnWI6XFX0RBxCMClKhSr6pecpX6kb6eRl
         mBKn6uQg4+OEJMDgu3mGxNeoPSuzuADRuUe9IllYYPQ77YLv90p1On45ZPT5u4sg5L1b
         N2Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ogue9rc+QYSHPmn+6W1F+eqs4VnskcvhC5sMit1h6Pk=;
        b=ZmOzN0Ny0AjLPtCCFRIw810Lhvw4PgIR2pW1jOxe58gyUNmHHkR1H7O9fTkh6hyO4m
         HUCmvsapNI6LwxvYoHd2VUTz8+0f+FXqaiNtdR6EsVlyj1X1SXYOOmmTAByebl4VDXYM
         afkh8geihuorkual+D/p83+YcMEUf8T+8SXY4D9KzJzxHj3r3HqzJlX5E0XkhFGuoOcr
         xDLsIP5l0xgfNihDleeVj3WwzAJR4OR/5+iOgALJOI+GNA6umLGgUTXS2MVhs0s5qscY
         yplYLKoIxJfbdvPDsp1VKgLej4B09qObf8rZ+iAQLy3o82TbjFdqy5jJ+ZeBMZkd91uC
         JO4w==
X-Gm-Message-State: AOAM530KWW6pDzX4AGGsJNn3U9ppAGg3ortTExVka3vblzDHFRF/zQIA
	6RgiyoCg4//q9NdYzBvnz5rZkjlMhM8=
X-Google-Smtp-Source: ABdhPJxykIb2kFYTwLIqY5leHFFhNwnoKaNaaL88VgJVKcjyUNhEClz1w2jR5pYMIxVQYr5q4FMiqg==
X-Received: by 2002:a17:907:d09:: with SMTP id gn9mr6063567ejc.538.1615156500382;
        Sun, 07 Mar 2021 14:35:00 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f3c4e6849043cb4c496f775.dip0.t-ipconnect.de. [2003:f0:7f3c:4e68:4904:3cb4:c496:f775])
        by smtp.gmail.com with ESMTPSA id mc2sm5501399ejb.115.2021.03.07.14.34.59
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Mar 2021 14:34:59 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 2/9] poppler: upgrade 21.02.0 -> 21.03.0
Date: Sun,  7 Mar 2021 23:34:41 +0100
Message-Id: <20210307223448.1063315-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210307223448.1063315-1-schnitzeltony@gmail.com>
References: <20210307223448.1063315-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release 21.03.0
core:
 * Fix parsing text in some broken pdf files. Issue #1040
 * Fix memory issue when using threads. Issue #1050
 * TextSelectionDumper: Fix getText() for space after word
 * Change signature of OutputDev:tilingPatternFill
 * Make PDFDocBuilder return a std::unique_ptr
 * Improve well formed check for shading functions
 * Fix leak in case of fread failing
 * Fix memory leak in broken file in JBIG2Stream::readGenericBitmap
 * PSOutputDev: Fix stack overflow in broken files

glib:
 * poppler_annot_free_text_get_callout_line: Fix wrong static cast
 * poppler-structure-element: fix memleak
 * Improve documentation
 * demo: keep same visual appearance between displayed and copied text

utils:
 * pdftotext: Add -cropbox option
 * pdftoppm: Add -progress option
 * pdftoppm: Fix rounding bug in computation of output bitmap size. Issue #927

qt6:
 * Add missing poppler-qt6.pc.cmake

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../poppler/{poppler_21.02.0.bb => poppler_21.03.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/poppler/{poppler_21.02.0.bb => poppler_21.03.0.bb} (96%)

diff --git a/meta-oe/recipes-support/poppler/poppler_21.02.0.bb b/meta-oe/recipes-support/poppler/poppler_21.03.0.bb
similarity index 96%
rename from meta-oe/recipes-support/poppler/poppler_21.02.0.bb
rename to meta-oe/recipes-support/poppler/poppler_21.03.0.bb
index c85fbf2af..52aa17021 100644
--- a/meta-oe/recipes-support/poppler/poppler_21.02.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_21.03.0.bb
@@ -7,7 +7,7 @@ SRC_URI = "http://poppler.freedesktop.org/${BP}.tar.xz \
            file://0001-Do-not-overwrite-all-our-build-flags.patch \
            file://basename-include.patch \
            "
-SRC_URI[sha256sum] = "5c14759c99891e6e472aced6d5f0ff1dacf85d80cd9026d365c55c653edf792c"
+SRC_URI[sha256sum] = "fd51ead4aac1d2f4684fa6e7b0ec06f0233ed21667e720a4e817e4455dd63d27"
 
 DEPENDS = "fontconfig zlib cairo lcms glib-2.0"
 
-- 
2.26.2

