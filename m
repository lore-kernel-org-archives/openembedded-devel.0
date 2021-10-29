Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21AA3C433F5
	for <webhook@archiver.kernel.org>; Fri, 29 Oct 2021 09:41:41 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web09.3238.1635500499656975813
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Oct 2021 02:41:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=LRRlnZUN;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.208.170, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f170.google.com with SMTP id k13so15869362ljj.12
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Oct 2021 02:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KU/KxDgTpjZJwDS/i4NpMF+ViRmf45Z5Xw5RXaYGnUY=;
        b=LRRlnZUNpXpIGzjm1t67IPgT7HkZx684m52F32Ja3tlBOiTNLflJLVEIs5wdEOa0Z8
         tl8F6yn93r+GgefYNtF2ImQzboG3HcO/mKLArrtf5yRqUOYu16S3aMCNApZtZAKZqrCX
         PzJvDUSFULxxdfNktmndTQlJq+J5VAyruSOCS9vJ00lnxYj/sjGKL0wBaKV2KZ3RkoVi
         ebU+akZ0VJGop6TyVszylgxO3pJJ/fhU8PStD1I9foR7KIvN+7UTljlwdmv4D26gUYbY
         TpUNlgdznRn6qWAxzYfoJOd9fBzt4TagPgeAunZ6c7jgDZx7DUuVVnPmyCTWo5wlfP8s
         qS8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KU/KxDgTpjZJwDS/i4NpMF+ViRmf45Z5Xw5RXaYGnUY=;
        b=vNij6xjnp8UrLyYlsCJ2h6Ti3AhYNRbtVElCRtUJUXG5vYYbgfSqdRt3zDvWqIX6QX
         iGgxKyqj3AhP2OCwiftNrtnHC5MWwXvS8U82DS8m/yxMxMWAWSe6SVYHnpofBzm2YSFD
         cBrpsbzXhfApDYFhdcJTO9OCWjPps8opl+zL7YG8iwMDuvaamI0w+jvamjAzyqPOkzrE
         1EHiXtuUrx3qRk+mfSoCDYofhlZJUREKhOY3ciR2WWSEnZPaZmSzVS2dS7RjM0ddPXaG
         7dAiwaeImVYyBQ+3iuyvhx0xTecei820/pnanrCYw+QIFLorOEkKZcZpOG3u6EH7U/hf
         YU+A==
X-Gm-Message-State: AOAM533QvaUTu2PIOfpeSIc8BN/MVkNLaI2/SdZH5MiGuhlOG10zbczp
	gBlyxls3UbbWWkq6ElccaKYhwof4SHD0wSqH
X-Google-Smtp-Source: 
 ABdhPJwSrI8wouuWe1rhSXptfSzjI0+vQAqoMGCRHN3wts36heZR8bhRkrjCh/9zvk65Fw4LYpe+Jw==
X-Received: by 2002:a05:651c:b08:: with SMTP id
 b8mr10088864ljr.515.1635500497229;
        Fri, 29 Oct 2021 02:41:37 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id
 q6sm557548lfg.188.2021.10.29.02.41.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Oct 2021 02:41:36 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-oe][PATCH 1/2] python3-protobuf: update to 3.19.0
Date: Fri, 29 Oct 2021 11:41:21 +0200
Message-Id: <20211029094122.1414092-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Oct 2021 09:41:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93644

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{python3-protobuf_3.18.1.bb => python3-protobuf_3.19.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-protobuf_3.18.1.bb => python3-protobuf_3.19.0.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-protobuf_3.18.1.bb b/meta-python/recipes-devtools/python/python3-protobuf_3.19.0.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-protobuf_3.18.1.bb
rename to meta-python/recipes-devtools/python/python3-protobuf_3.19.0.bb
index 8ecb3ab6e..4ef51c6c2 100644
--- a/meta-python/recipes-devtools/python/python3-protobuf_3.18.1.bb
+++ b/meta-python/recipes-devtools/python/python3-protobuf_3.19.0.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=19e8f490f9526b1de8
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "1c9bb40503751087300dd12ce2e90899d68628977905c76effc48e66d089391e"
+SRC_URI[sha256sum] = "6a1dc6584d24ef86f5b104bcad64fa0fe06ed36e5687f426e0445d363a041d18"
 
 # http://errors.yoctoproject.org/Errors/Details/184715/
 # Can't find required file: ../src/google/protobuf/descriptor.proto
-- 
2.25.1


