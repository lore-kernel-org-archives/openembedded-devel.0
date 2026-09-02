Return-Path: <emailaddress.ashish@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2004EC61DD6
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 16:20:21 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1202.1788366015279775326
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2026 09:20:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=eorlt4uv;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: emailaddress.ashish@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2d8fd3b729dso11510445ad.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 09:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788366015; x=1788970815; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hH6oAG35PaJ0eDN7dCMlbW9L0vsc6RCPPPSOyZnjers=;
        b=eorlt4uvWu4JjhQBQBRu4cbPV7qD4RucTfer6iCD0cCQRMpEZgRefPHRvoaunNxxDC
         QVSmRvsWhszdX35KIJINugolwcwwL2mhfeztoeDLAX7pPg4H79Y4ft9JSIuHpec5OPGL
         tZ97orjcjbvqZzzb+aztG/RSmRjizCS8Pcv0cRuPmR7iw0ogD5k8KE7phr/O3a32tS92
         R14HYVM+YcW720JinDNNAyFPt1jCJtEUlJnKlBi0UFu05DImZIJxYC3dx/NReuLo/fr8
         r3hUnGclO5lP33swcuASHMT+82Xf5+Tr1kPbWGPbf2WMkixQKDLRwD0JOq2v8j7y7zeH
         M25Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788366015; x=1788970815;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hH6oAG35PaJ0eDN7dCMlbW9L0vsc6RCPPPSOyZnjers=;
        b=RFxg2Eeks0OGexpoT2Po7BqyK55IoysHBxGrk7hxjZCHzzry3x+RhPupiV4y2gQ1GD
         EUI2Od68AQVwotBBYp44IdPKrtWeG3EBMU9+ggeZdM5ULag5+2PlXuW6kyMl+zlMGCr4
         wUmAoTTC1C1xOTSi7O+Jjg/4QPFsd3zJ/BBXOv5BF7M3SLUb6ZDVpHL6/2WeQH2fCR4H
         lqxskzB4vkeLoToHlKfYWiOcdAFBI2FJYuiNYLWI5GQg2yEzX2L6kms23N3Kq1NcKDFx
         lQJZHo11WjSODi2bwblE9bfhj6IXQSJBYO9v+6w0PWGk3haJ6s8D5kAJESWsdUlYwt8k
         ILrQ==
X-Gm-Message-State: AFuF++niRTqJF87OWeJOTsA4+NMhuX7chjemQQR9xsFOCdYtcNR6HECs
	ahxe/o0JBLE+ND1y7OBKispkKPMdcXOxmJ3iTFr2SLDT9Yo4npxY5hgZ036CcA==
X-Gm-Gg: AYBFou0pS7OKQOCsNcz5FhPKw9nwefJp5W2BaP8FZp2l23gq3/wYhsUg4N3cZXFBEmt
	i8ekn0DqAjPoB8NT+0b7kt9c03g229y3TzuSP5efGJYL/jFElDIxbR+qZ96V6jxZ+qjO7Xxu9ke
	4t294NxjDCxe6IDXOwmmAanaOe6wD32/NcywNa1LEXlvWTx9+OiDX2PNbDDh0iUoZPEN94/jZdl
	5NvjUmKszGmVW205SP7EpvrylM7KnnGPD9dpblA+sFKAI9sR0BtRlDHyqJ791z79WGry8Gl/oyh
	KHWQTMzIHSo1yjBxgsBVa1ixJzIDthlDyGrZ0Du7KJvuyb9Uc1139NYgP7ntCwPwEq2T/MgOzy2
	72yyDjfF0/sRgmx0dHB/e0QDYfNmtowgKqPUQZIDPE6nOBVkLBWi2orG324HcnkmuJUUvDdm8p1
	2quENzjsQt0cJaQZuB4kVjo8lAfF+jCh/h+aHtfTJpxQ+ZEHjW2SIXrPS0CcyBWC+2Zob4jpX+K
	4pEEA==
X-Received: by 2002:a17:90b:1dd1:b0:398:a486:81ec with SMTP id 98e67ed59e1d1-39aedf5b05fmr10435374a91.11.1788366014540;
        Wed, 02 Sep 2026 09:20:14 -0700 (PDT)
Received: from ashishkumar.. ([2406:7400:12b:df65:2028:f94d:4945:bb18])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1430ea0b459sm8778051c88.5.2026.09.02.09.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 09:20:13 -0700 (PDT)
From: AshishKumar Mishra <emailaddress.ashish@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: AshishKumar Mishra <emailaddress.ashish@gmail.com>
Subject: [meta-oe][PATCH] image_types_sparse: create symlinks for generated sparse images
Date: Wed,  2 Sep 2026 21:49:46 +0530
Message-ID: <20260902161946.13068-1-emailaddress.ashish@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 16:20:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129697

Ensure that symbolic links (${IMAGE_LINK_NAME}) are created for both
sparse images, matching standard Yocto image deployment behavior

Signed-off-by: AshishKumar Mishra <emailaddress.ashish@gmail.com>
---
 meta-oe/classes/image_types_sparse.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/classes/image_types_sparse.bbclass b/meta-oe/classes/image_types_sparse.bbclass
index 5c1d92bd18..2ee4aa1159 100644
--- a/meta-oe/classes/image_types_sparse.bbclass
+++ b/meta-oe/classes/image_types_sparse.bbclass
@@ -16,11 +16,13 @@ CONVERSION_CMD:sparse = " \
     case '${type}' in \
         ext*) \
             bbnote 'Running e2fsprogs-derived ext2simg_android..' ; \
-            ext2simg_android '${IMAGE_NAME}.${type}' '${IMAGE_NAME}.${type}.simg' || bberror 'ext2simg_android failed' \
+            ext2simg_android '${IMAGE_NAME}.${type}' '${IMAGE_NAME}.${type}.simg' || bberror 'ext2simg_android failed' ;\
+            ln -sf '${IMAGE_NAME}.${type}.simg' '${IMGDEPLOYDIR}/${IMAGE_LINK_NAME}.${type}.simg'; \
             ;; \
         *) \
             bbnote 'Generating sparse image for non-ext filesystem...'; \
             img2simg -s '${IMAGE_NAME}.${type}' '${IMAGE_NAME}.${type}.sparse' ${SPARSE_BLOCK_SIZE}; \
+            ln -sf '${IMAGE_NAME}.${type}.sparse' '${IMGDEPLOYDIR}/${IMAGE_LINK_NAME}.${type}.sparse'; \
             ;; \
     esac; \
     if [ "${DELETE_RAWIMAGE_AFTER_SPARSE_CMD}" = "1" ]; then \
-- 
2.43.0


