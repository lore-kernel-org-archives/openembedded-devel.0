Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.22182.1627640572438220573
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Jul 2021 03:22:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sakNVSiq;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: salman.isd@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id r2so10691550wrl.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 30 Jul 2021 03:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QJQf0UyXqdx8kY2PmR0WSzqWXpKdsB1pArRcn9OgOAo=;
        b=sakNVSiqRRmhfHQ3G4fD9yfJM5IFBiwaU5VqVgtS/GF5LyN3pJUw7bIJ7ea6OoDZwV
         H/tN+Jhg4RZOKT0ok4bdkcEtGtFjpPy1Xd6itM8/9StgEXIcqMFGqqh8tNTo8TtgBO6x
         D6gJpeY1+W2+A1up5mlPd2gF39OfhXILL8f1cQ2jCKdaAn3VbG/Cl3zif1EOlxAAub1c
         bvnOgYe00rEkKI6Fzwb6yukO/ldKV/o24sTgRRQuR1pIbSnbNVpnvIhiM/67r1+bhYqC
         ZO3BHQwRGp2ITw2eDL9R24cqs+6eHo3eS1VaeNfzZY24h5GV3DVO++cIuygenvaZSk+3
         VNsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QJQf0UyXqdx8kY2PmR0WSzqWXpKdsB1pArRcn9OgOAo=;
        b=MN1L3GIV8Ang3Ip5KTee2A3a9lC+yXjRjDSQDxG+IdGavtyadaMyt6Clu8cb2hwIf6
         HHQsORyB/r6mSRgIS2pWFAr1fWGrEFcDj0xyLT4Mr3fosSEPGdGXK/hwspZgThIeni+6
         CuysDp/sSWoePd6dOhFo95akGwhnI1Utl8UfayXorkQ0x37EWEtdu4aS4sk2Awb6ptIM
         kZNypHD06ACi/eCrGFB4sieGmxlpaCvNebtj0Lx17qDrWBM8F+3Y/M7b/du2t1jXlN94
         Kyk6AKQn/PfDXXq620h9P/ZV7m1+7Rhv2LwzTVOPHri3DY8v/XW/cV/TfCv1jDTw9v8P
         mQmA==
X-Gm-Message-State: AOAM533FwWPswbvFjL66LnkRaMu7ZA4Ica4CmPtY7KVNPHPHhc4nM1qZ
	gHJx+bCN/GEph6oH+yY6nIyECPA2hOgosw==
X-Google-Smtp-Source: ABdhPJzyQLhxgstEVTdwtVwmDBD4ym9Cj3prP5i1sAwm28PwVuDd8HFcpvybTSuUWHDOqjNIJ8OkJQ==
X-Received: by 2002:a5d:4e8f:: with SMTP id e15mr2195782wru.313.1627640570862;
        Fri, 30 Jul 2021 03:22:50 -0700 (PDT)
Return-Path: <salman.isd@gmail.com>
Received: from localhost.localdomain (ip-37-201-145-145.hsi13.unitymediagroup.de. [37.201.145.145])
        by smtp.gmail.com with ESMTPSA id u11sm1164468wrp.26.2021.07.30.03.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 03:22:50 -0700 (PDT)
From: "Salman Ahmed" <salman.isd@gmail.com>
X-Google-Original-From: Salman Ahmed <salman.ahmed@weidmueller.com>
To: openembedded-devel@lists.openembedded.org
Cc: derek@asterius.io
Subject: [[meta-webserver] 1/2] nginx: upgrade 1.18.0 -> 1.20.1
Date: Fri, 30 Jul 2021 12:22:35 +0200
Message-Id: <c14a4416651c1b7d805df123080e80f19e4a3232.1627638813.git.salman.ahmed@weidmueller.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1627638813.git.salman.ahmed@weidmueller.com>
References: <cover.1627638813.git.salman.ahmed@weidmueller.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Salman Ahmed <salman.ahmed@weidmueller.com>
---
 meta-webserver/recipes-httpd/nginx/nginx_1.18.0.bb | 6 ------
 meta-webserver/recipes-httpd/nginx/nginx_1.20.1.bb | 7 +++++++
 2 files changed, 7 insertions(+), 6 deletions(-)
 delete mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.18.0.bb
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.20.1.bb

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.18.0.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.18.0.bb
deleted file mode 100644
index ac303e47d..000000000
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.18.0.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require nginx.inc
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=52e384aaac868b755b93ad5535e2d075"
-
-SRC_URI[md5sum] = "b2d33d24d89b8b1f87ff5d251aa27eb8"
-SRC_URI[sha256sum] = "4c373e7ab5bf91d34a4f11a0c9496561061ba5eee6020db272a17a7228d35f99"
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.20.1.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.20.1.bb
new file mode 100644
index 000000000..7f159a2a3
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.20.1.bb
@@ -0,0 +1,7 @@
+require nginx.inc
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=206629dc7c7b3e87acb31162363ae505"
+
+SRC_URI[md5sum] = "8ca6edd5076bdfad30a69c9c9b41cc68"
+SRC_URI[sha256sum] = "e462e11533d5c30baa05df7652160ff5979591d291736cfa5edb9fd2edb48c49"
+
-- 
2.25.1

