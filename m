Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web12.7982.1588332957246266313
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 May 2020 04:35:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gos71+wR;
 spf=pass (domain: gmail.com, ip: 209.85.128.68, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wm1-f68.google.com with SMTP id z6so6053543wml.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 01 May 2020 04:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=oB/lJCYOkPjGtLSrGm3Cr2s5OXG3VfzECEVYSeG4oLY=;
        b=gos71+wRsDVpA9jXjT02nS9DnV2U3I3eihczkoUb1bZWF9mNQjfHL+UD9FbY2vY7z1
         Z2AGVs+688ng8SdPrzmVSAsGGpPKy5hTbZ1gdskeyRzM4IQRzAExOFXLMDd6l6cXiDvz
         yuD1D1KgdfDUKuDYsxM0gVV4LlEB/cdrH+34gzi2K8YkHpUA5OH8XK+NdTo5pLvaNnyz
         hKrjHyV0E2xsab2Yb9Rv2IcxoCj2JI343UpIF1E4lcV4rJ+doPvwFx/fTJcydDdF4U5a
         rfJG45DOmgvO6wzViyW9BDTvTfwc9Ful897dP83aSUY34e39fkIrU2PyzjxmJlyQLJKE
         UeVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oB/lJCYOkPjGtLSrGm3Cr2s5OXG3VfzECEVYSeG4oLY=;
        b=bx5/jRNsEIMgtWcrW7/NbAPkNcqRDfrm1u59W9oJjSejXQwAnMsF1ct7XR2Mx7EJkp
         R0i5w4d5k+6Ri0JB0qWf2zNvuWwiemsWU9hvNwchxpLiuKreJABp3awq407Q3E4pWO6W
         K8Du+XHPIu0iiP0Rp0+8DoSidPVPNjvrEEZHXs4paiWRcAMHr4aVPHKDQr6uKgWvCQ6n
         ORMCJXb/QFHBaY8McwiK7i31QUn8XiUnEvMU3tyTL9jwbjWnU/Sr7DGtDRQkvav0V78j
         czHq4c4ABPCpvAhEr7lFkNYKDKm4exwlhl0n8RtQ7MHYsxqxoiKiJnpKyzzZVuyKaOKP
         DzMA==
X-Gm-Message-State: AGi0PuYMbXDW5RB9QBOt+7k/nxDfM5nJeYDfyIgczRfY9bAKxWT8y++8
	DZn/qf+7sDSvA46QTj/1SRIvjop3
X-Google-Smtp-Source: APiQypK8eJL1lvgZbD9Q0h+PoGBZ9PdLjt5rOI9FyKQUAI3sj5f8LeZDZj5dikghmZGwxQqNS26ZqQ==
X-Received: by 2002:a1c:bad4:: with SMTP id k203mr3526401wmf.15.1588332955467;
        Fri, 01 May 2020 04:35:55 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300F07F0ED437E74431DA4B53FAAD.dip0.t-ipconnect.de. [2003:f0:7f0e:d437:e744:31da:4b53:faad])
        by smtp.gmail.com with ESMTPSA id q10sm3960004wrv.95.2020.05.01.04.35.54
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2020 04:35:54 -0700 (PDT)
From: "Andreas M?ller" <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 07/10] poppler: upgrade 0.86.1 -> 0.88.0
Date: Fri,  1 May 2020 13:35:30 +0200
Message-Id: <20200501113534.16030-7-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200501113534.16030-1-schnitzeltony@gmail.com>
References: <20200501113534.16030-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release 0.88.0:
core:
 * Support Widget Annotation Buttons not linked to any Form
 * SplashOuputDev: Use stroking opacity when clipping to a stroke path
 * Handle 1 bit RGB images in ICC colorspace
 * Internal code improvements

qt5:
 * Add Document::signatures. Returns signatures not attached to any page
 * ArthurOutputDev: Fix font hinting
 * ArthurOutputDev: Set the opacity when filling with axial gradients
 * ArthurOutputDev: Implement the clipToStrokePath method
 * ArthurOutputDev: Use stroking opacity when clipping to a stroke path

glib:
 * Add poppler_page_get_bounding_box
 * Add poppler_form_field_get_alternate_ui_name
 * Implement rotation for 'flagNoRotate' annots. Issue #767

cpp:
 * Add non_raw_non_physical layout for page::text()

utils:
 * pdftohtml: Fix noRoundedCoordinates->noroundcoord in man page
 * pdfsig: Show also signatures that aren't attached to any page

Release 0.87.0:
core:
 * Fix leak in broken files
 * Internal code improvements

qt5:
 * Add option to get form choice for export value
 * ArthurOutputDev: Avoid division by zero in updateLineDash. Issue #695

glib:
 * Internal code improvements

utils:
 * pdftohtml: Fix memory leak in HtmlOutputDev::getLinkDest

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../poppler/{poppler_0.86.1.bb => poppler_0.88.0.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/poppler/{poppler_0.86.1.bb => poppler_0.88.0.bb} (93%)

diff --git a/meta-oe/recipes-support/poppler/poppler_0.86.1.bb b/meta-oe/recipes-support/poppler/poppler_0.88.0.bb
similarity index 93%
rename from meta-oe/recipes-support/poppler/poppler_0.86.1.bb
rename to meta-oe/recipes-support/poppler/poppler_0.88.0.bb
index a6067e634..d6a27f923 100644
--- a/meta-oe/recipes-support/poppler/poppler_0.86.1.bb
+++ b/meta-oe/recipes-support/poppler/poppler_0.88.0.bb
@@ -7,8 +7,8 @@ SRC_URI = "http://poppler.freedesktop.org/${BP}.tar.xz \
            file://0001-Do-not-overwrite-all-our-build-flags.patch \
            file://basename-include.patch \
            "
-SRC_URI[md5sum] = "2a638739f29e82a0a57b633ea39c87f3"
-SRC_URI[sha256sum] = "af630a277c8e194c31339c5446241834aed6ed3d4b4dc7080311e51c66257f6c"
+SRC_URI[md5sum] = "d9aafddce4c079c9ebc7405e42ac25ba"
+SRC_URI[sha256sum] = "b4453804e9a5a519e6ceee0ac8f5efc229e3b0bf70419263c239124474d256c7"
 
 DEPENDS = "fontconfig zlib cairo lcms glib-2.0"
 
-- 
2.21.1

