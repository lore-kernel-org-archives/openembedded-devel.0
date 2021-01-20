Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.31378.1611164593691048427
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Jan 2021 09:43:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ydbyvev8;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id m6so14945004pfm.6
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Jan 2021 09:43:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PhhOaVtHNDaCHsh3ZX4keav4ErF9LJEx4GzJSO99dho=;
        b=Ydbyvev8zAGm37pA4vTa5Nw3V5QlwoRhdcDBlmxwWw8GonQVmvn871c5xcjUwQRNel
         OaxY0veWih2uNLxiSC/ujHR1+0NY0KMBPr0KO7Jxfc82kIFQ0gpDFi8/XzmzJUSx6gvf
         Y0H0MpBgKLR1yuvMfhpnFcDeZwloXd5csiXZ6ox8cTYKLGX8Fc1JXXDW9JJHPlzXHSFK
         cNmCUffPJpQ7nu5iVIlO0qsCRIqHPvVnAsfo22PDtlveu0EBcSFHEgdcIdJHdmp8pTK8
         rFMRocCWq+z234rca6IZFCWa5E07Ept6LYePRv6nFSg0GuuZHLZdmhjWUcvRFxskTuV0
         wL5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PhhOaVtHNDaCHsh3ZX4keav4ErF9LJEx4GzJSO99dho=;
        b=H4dlnke3nQYkVxX4YFe9jIglNo5CX14d6Fzt0516Md8izj8rblc3MnTWhno2frgUm/
         fN60dlIeMd/g+rk+aiPqlZSU7mAVfVquu+lYUueHJh3fDXCuo+VxtTUZkWicSYPFsTuk
         AZzXs2NEPIlciofMm4ti7TGredNqblEIHN7iUhd31UwD+yb3DG5bXUUF0v1VaPYosqOj
         PkstVwePQGw18tjtlbiIK9RAHytNR6o4WEQTraJCcwNNy/b+tPBg65mnW8nMDaVQEkLZ
         N8+GBsdcRtxpsxbth1/V3AzLktsacnBSgTcWJrN+i97UDCanJ9bKPCO5i6jmxmwbwctt
         lR0g==
X-Gm-Message-State: AOAM531xb+YSRXq0J4xMsZmgBSLq1UVY8bXNzkOqOP7Xw4O0s3KVukrM
	8Jgn7G+fBNYJENVh8BZ0bMGBOMDKTiq2/Q==
X-Google-Smtp-Source: ABdhPJxuc8VmGAMXKt0Xd1V4QOSFQmxT1MseV8+36cYjQzww1E6606b5SRmqlSK6zIe9GdIYRJrylQ==
X-Received: by 2002:a62:1981:0:b029:1b7:ec14:e2d9 with SMTP id 123-20020a6219810000b02901b7ec14e2d9mr10031638pfz.54.1611164592547;
        Wed, 20 Jan 2021 09:43:12 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::b408])
        by smtp.gmail.com with ESMTPSA id k6sm2973000pgk.36.2021.01.20.09.43.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jan 2021 09:43:11 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	=?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [meta-oe][PATCH] packagegroup-meta-oe: Add re2
Date: Wed, 20 Jan 2021 09:43:09 -0800
Message-Id: <20210120174309.4991-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

re2 is newly added package

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Clément Péron <peron.clem@gmail.com>
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index ac986a5c1c..94830e2970 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -844,6 +844,7 @@ RDEPENDS_packagegroup-meta-oe-support ="\
     pps-tools \
     raptor2 \
     rdfind \
+    re2 \
     sdparm \
     serial-forward \
     read-edid \
-- 
2.30.0

