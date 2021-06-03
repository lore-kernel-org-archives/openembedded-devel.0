Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web12.6.1622754341528781700
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Jun 2021 14:05:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VqWgh6Kp;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id k7so11219678ejv.12
        for <openembedded-devel@lists.openembedded.org>; Thu, 03 Jun 2021 14:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qbwcgUdDIb1gs+ZP+y1oWQUZsPUUnIp5tQsWDWCBYQE=;
        b=VqWgh6KpnpLTx+oXtgn+3/FR6b8+hNQgwBEiltqtPTkocVWlymIZ43pyasdO+I47hT
         9yvHc1wF+VSdagPL7kYNGzNhwM0KvpHkVscR06UrD29hPJjccR7sMJ89aD23BTVu9NED
         /v25CirGKk6KwwgL6kw9zhB7EjV46f/cDUmvU2gus+84vcBOI53LrjRIH1UCB9Vl64qg
         aLsFPJ3+f9LCNchGNtOJCx1aYeiMXdKpZhQFHUZpbfKSRoJDkLUiufBLgZIwwiFE+rcp
         DEY11HjsBSMaxgqwzaJBwGNa1BcHlk5wn1S6vYfW/0xJV/ICxixUNYjBlv7DdiYBMYLe
         Qy9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qbwcgUdDIb1gs+ZP+y1oWQUZsPUUnIp5tQsWDWCBYQE=;
        b=VB9k8DG0lnPfwz5uvf56YuRCtolebBlgiL++rQZ7lUnIJ/5IeSpzkEu2jxmIbr8kQ8
         a8wxI5JTVtCyxNkx4kWUV5nq+FJUebuu00A6gIURlu9cV+MCGDEUX0GB6/nAim30hquI
         bKsm2qtRQxdoej1+ocpirvrDyzV+66HliubThZqaffPA9YJ4SqmHNa90VPWtv3oq9teb
         HQ576daTyCU1VOFfC5JgJd+N7x7v8hPmguXWnohI0iRSSb+LVsElgUnUQz3Wb5GdDX2W
         1OsFCdiCgwCvih4oPdwcuq6uErNdaTW2OwD5d0AFvYXE5sP3cBolBRvPbS8r1nkieL2U
         kWOA==
X-Gm-Message-State: AOAM530Qu3Wz+g9C5bp9gZtAetHdBWUu6doecMWIFSMBvLRsY5H/vZJj
	4xJp+GsEMnt0HKGb4dzpDq9N/T3ZFY5kOA==
X-Google-Smtp-Source: ABdhPJzRnAY1zJHyRfPxjOj9BtumcbFkFzNA1knm9K0lPV5ObJnFxyXOQvQ/zucWX6mU3XOxJjYfLg==
X-Received: by 2002:a17:906:2b85:: with SMTP id m5mr1111920ejg.141.1622754339622;
        Thu, 03 Jun 2021 14:05:39 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f11f861d707ea86d7bc33dd.dip0.t-ipconnect.de. [2003:f0:7f11:f861:d707:ea86:d7bc:33dd])
        by smtp.gmail.com with ESMTPSA id j22sm2020050ejt.11.2021.06.03.14.05.38
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jun 2021 14:05:39 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 1/5] poppler: upgrade 21.05.0 -> 21.06.0
Date: Thu,  3 Jun 2021 23:05:27 +0200
Message-Id: <20210603210531.2314701-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release 21.06.0

core:
    * Fix rendering of some extended latin1 characters in annotations. Issue #1070
    * Support some not so well formed documents with password. Issue #1083
    * Add API to get notified if the xref is reconstructed
    * Add somewhat fancier left/right signature visual representation
    * Fix crashes in malformed files
    * Minor code improvements

qt6:
    * Change some functions to return std::unique_ptr

qt5/qt6:
    * Add API to get notified if the xref is reconstructed
    * Add somewhat fancier left/right signature visual representation
    * Don't assert when trying to invert singular matrices

build system:
    * make boost opt-out if building splash

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../poppler/{poppler_21.05.0.bb => poppler_21.06.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/poppler/{poppler_21.05.0.bb => poppler_21.06.0.bb} (96%)

diff --git a/meta-oe/recipes-support/poppler/poppler_21.05.0.bb b/meta-oe/recipes-support/poppler/poppler_21.06.0.bb
similarity index 96%
rename from meta-oe/recipes-support/poppler/poppler_21.05.0.bb
rename to meta-oe/recipes-support/poppler/poppler_21.06.0.bb
index 4cfc5bd86..90fd8f87f 100644
--- a/meta-oe/recipes-support/poppler/poppler_21.05.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_21.06.0.bb
@@ -7,7 +7,7 @@ SRC_URI = "http://poppler.freedesktop.org/${BP}.tar.xz \
            file://0001-Do-not-overwrite-all-our-build-flags.patch \
            file://basename-include.patch \
            "
-SRC_URI[sha256sum] = "dafd537b680fad1215bc40fc53d1f38e8449d7c185bc60d5a89e1d26c90dbd8c"
+SRC_URI[sha256sum] = "4b440708eafdf07a1405e06744c66ac54a5af51a0e38ab17a46fbaff47278342"
 
 DEPENDS = "fontconfig zlib cairo lcms glib-2.0"
 
-- 
2.31.1

