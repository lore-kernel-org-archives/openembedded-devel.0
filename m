Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.8166.1620490048656133132
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 08 May 2021 09:07:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FYZGLZ8J;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id a5so3076863pfa.11
        for <openembedded-devel@lists.openembedded.org>; Sat, 08 May 2021 09:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MB+Y7uUTrmK76fFtEYlvywjBkFjmt8IWgGwTRVXtIRI=;
        b=FYZGLZ8JHX5x3Vop0qxY/VTNcgrb46yFQH20WDTl7l4YWEr6bbo38c9CjIk+b07w+w
         j+EtFRU9Fd6v1eAb5Yc1agA6E1zZp9N4EI+lwsAIlDxflVi8wd+i41qFeeVOrD2/jjxq
         ORznaLx1sO8HFljZyY9mx60rfrL5Fb9K24q8upX3FoQd9LO5UMdfgqRGYtCJD65g0fmS
         pvu6Y1bB8CkXX1fdbycN1WeVEhiBpaavc8EN4Vpfz7DAARBX6kZxcMK7zZyOfzSsO303
         Vq4AZoZwpft2cB1puKHKx62hHYfYhSWV4DxDOsripdSX5c+yQXqUj7m5dgtZbyd++ygs
         A4Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MB+Y7uUTrmK76fFtEYlvywjBkFjmt8IWgGwTRVXtIRI=;
        b=Hzd7z6XV8ELP0hOlUHOfLBhkbiP3ysd4F9TS6IVMmnNM7H6AMpwnjGpVRjh6oqgrTY
         qwh6qzZHm9tJsgED+QCmZP92xQp8iX7ykOtB1mMeCiILKS0rtUcdhkOzSYrkXiAITWCW
         6Qvz/eE/gMSOuCsvrvuTVdIT+nMlJYedlLBd9DpKhA9sWLvko0n9ZSpspSLCV2jA73br
         XzFOcl/rIlXBvIeJvVUZopyJyEKFRmMT2lVK/xF6U5bAy0oxNYXpItG+/2rpY9DnnldG
         m31pSaq0s32gaU4nVeVeZJ3LB52ZmRFKeXeEgAMvsIFx+If6wKnqHdSE0NVWmH3fgTYd
         K1tw==
X-Gm-Message-State: AOAM533zPHH48qW03EFoq6jN3BELuNlT4WJymDqC7i0jH/NRw+4flIdn
	R4O3s5nPHT16pSGqywclg35xypEQd4rpxg==
X-Google-Smtp-Source: ABdhPJwcWvhazl1T8IR7Ls76ko5svGn8zkZMVO87DaOYFVeSrJQ/kLpLKvbAa23STKiF63yF45zFgg==
X-Received: by 2002:a05:6a00:bc7:b029:28e:aa38:6332 with SMTP id x7-20020a056a000bc7b029028eaa386332mr15680906pfu.34.1620490047904;
        Sat, 08 May 2021 09:07:27 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::308d])
        by smtp.gmail.com with ESMTPSA id a65sm7736461pfb.116.2021.05.08.09.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 May 2021 09:07:27 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	=?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
Subject: [meta-gnome][PATCH] evolution-data-server: Update to 3.40.1
Date: Sat,  8 May 2021 09:07:25 -0700
Message-Id: <20210508160725.3385101-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andreas Müller <schnitzeltony@gmail.com>
---
 .../evolution-data-server/evolution-data-server.inc          | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc
index f39440cc6f..870a9c0e94 100644
--- a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc
+++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc
@@ -9,6 +9,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6a6e689d19255cf0557f3fe7d7068212 \
 
 inherit gnomebase upstream-version-is-even
 
-SRC_URI[archive.sha256sum] = "c555528c546d457be0dc0eaca5d766d4dfef7c408276cb05f9724c463bfe7fd9"
-PV = "3.36.5"
-
+SRC_URI[archive.sha256sum] = "eac75f348aa5defbe9473fa30ab6084635ee64d8e3eaaec60a62c27f149c3e22"
+PV = "3.40.1"
-- 
2.31.1

