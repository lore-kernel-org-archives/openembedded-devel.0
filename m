Return-Path: <emailaddress.ashish@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70D76C4452B
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 16:27:47 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27186.1784651257327242749
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Jul 2026 09:27:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Qa49spw6;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: emailaddress.ashish@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-84862b0d5f8so6614114b3a.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 Jul 2026 09:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784651257; x=1785256057; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AYZBRKyczPhYLQFdtNywcUsBTfsdosEdzwZS0FCboVg=;
        b=Qa49spw6wOuppfvSE8tf2g9XlPens82e1wwxvHc+VJzTcTe3QiYA2kgYUuiX5FyhBg
         dY0aAqlENc7L3GLejmIIPQFejWo+poWGqzLYwB1YufUVdG5YPcG1URu4bKZFciqxShVv
         8XvCp48y6OnjLsSDYTVOFS8ZvutdUClLBFNc/0IFr4YijDjxxW+c1GhXvoSjCEzRJZQu
         8ThKeLQc7zlPX3Ztzb43y83MCcBAGLiEhOltijck2Yp51fL2jSf/6bDVsDiawrnPyVSe
         YAF7Xu6GqbWxttI04qkYz0X6XkoPcSCoKhL+GpjFBuJXFcfaMJWWKzRUi67EqhnM9aOq
         qxsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784651257; x=1785256057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AYZBRKyczPhYLQFdtNywcUsBTfsdosEdzwZS0FCboVg=;
        b=RKU4teg6a57/QFXW2WylyeJ8lly2EwGOt78ztCw6Hu+bSQKkmyvHk5GxCjELPlWYio
         lFJQZlS30EVz78ctNRgE0/aSmRUq39+Nc5a5i6oJv4APKjECGRhhoG0GDUAS47rS4tMT
         0aPKQVJuoysyxitUJTNpvYueGDHZGQZAXy+4aLykIb0LqEvbOP0XKkBype3cZpRJPamw
         lBQ6smjJp//kOolu9wXCfSx2ZBODKLTFuHbv0FhmH6ACJcT8y29wPxQ6+ylpOhUBecGA
         /aQwFZ9vQINCkvKNEPRoKJCnUuDkC7NzuQZC6QBx5sHfMRvkcB346cT6Di8Hj2pUCj0q
         uTgw==
X-Gm-Message-State: AOJu0YwS3riD3JoC85cof3j4sVz8ZGC269cPmgN/ptCtmjCETJLNhFTn
	L0jImdeLaWO8Fa3PeeAJjpH9S1vzmhryKZbKCNDCLYVtwLCByzR83JA2NrHjdA==
X-Gm-Gg: AfdE7cnX3SBrYrKLzbSh67FGeJMT3wx9ZoZdqlIN+Hj5g/KUwxRHbSPyK/OQfhYXLzP
	SsyrjqGWOBjcpXb6MTYw8VWsiXFIzAayLkySOT8hu0SVTh22qJAQO7PunZHnbHdtApLZHDquvHn
	zmWmU5FbWe4SIKQ4kPMpJGsf0UsnAdcu9WAnhzhqVWH14C8flDQi3LZfJsIKY/YwPcvvZqEIJe+
	RUBjbDCmBCJvbAwzharVwEeZ0XCFsjS5s46ueBNa1CrvCq9AxjpFtvSXeo5g4qxoK7YVmKwfEEL
	C5/ixIWhSLR7OhneOtfa5mByTrb63oTr1rtVB3hRmza/8dl8zHxd2LE32UxU7GbvH65f9wPcJCn
	vmHX6x2PvmTaSV5JgNZa2yWpbmY9P8p6aCjwjuqgRohs9MFJwOZv+CPfSi7LUv0IZfxPtB/IOOq
	3/ulAOrapnxHgQ2Kb2zg==
X-Received: by 2002:a05:6a21:4a97:b0:3c3:8c88:7b20 with SMTP id adf61e73a8af0-3c3ada1eb3cmr19446683637.44.1784651256462;
        Tue, 21 Jul 2026 09:27:36 -0700 (PDT)
Received: from ashishkumar.. ([2406:7400:12b:e084:b7f2:160:d1f2:65e2])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc1b99esm479421eec.3.2026.07.21.09.27.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 09:27:35 -0700 (PDT)
From: AshishKumar Mishra <emailaddress.ashish@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: AshishKumar Mishra <emailaddress.ashish@gmail.com>
Subject: [meta-openembedded][PATCH v3 3/3] image_types_sparse: switch ext* conversion to ext2simg_android
Date: Tue, 21 Jul 2026 21:56:44 +0530
Message-ID: <20260721162645.2056048-4-emailaddress.ashish@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721162645.2056048-1-emailaddress.ashish@gmail.com>
References: <20260721162645.2056048-1-emailaddress.ashish@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Jul 2026 16:27:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128356

We have RFC discussion at
https://lists.openembedded.org/g/openembedded-devel/message/124499
https://lists.openembedded.org/g/openembedded-devel/message/125497

Move ext* sparse image generation from 'img2simg' to ' ext2simg_android'

Signed-off-by: AshishKumar Mishra <emailaddress.ashish@gmail.com>
---
 meta-oe/classes/image_types_sparse.bbclass | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/meta-oe/classes/image_types_sparse.bbclass b/meta-oe/classes/image_types_sparse.bbclass
index 5416c2a019..5c1d92bd18 100644
--- a/meta-oe/classes/image_types_sparse.bbclass
+++ b/meta-oe/classes/image_types_sparse.bbclass
@@ -13,11 +13,21 @@ DELETE_RAWIMAGE_AFTER_SPARSE_CMD ??= "0"
 
 CONVERSION_CMD:sparse = " \
     truncate --no-create --size=%${SPARSE_BLOCK_SIZE} "${IMAGE_NAME}.${type}"; \
-    img2simg -s "${IMAGE_NAME}.${type}" "${IMAGE_NAME}.${type}.sparse" ${SPARSE_BLOCK_SIZE}; \
+    case '${type}' in \
+        ext*) \
+            bbnote 'Running e2fsprogs-derived ext2simg_android..' ; \
+            ext2simg_android '${IMAGE_NAME}.${type}' '${IMAGE_NAME}.${type}.simg' || bberror 'ext2simg_android failed' \
+            ;; \
+        *) \
+            bbnote 'Generating sparse image for non-ext filesystem...'; \
+            img2simg -s '${IMAGE_NAME}.${type}' '${IMAGE_NAME}.${type}.sparse' ${SPARSE_BLOCK_SIZE}; \
+            ;; \
+    esac; \
     if [ "${DELETE_RAWIMAGE_AFTER_SPARSE_CMD}" = "1" ]; then \
         rm -f ${IMAGE_NAME}.${type};\
-        bbwarn "Raw file ${IMAGE_NAME}.${type} removed" ;\
+        bbnote "Raw file ${IMAGE_NAME}.${type} removed" ;\
     fi;\
  "
 
-CONVERSION_DEPENDS_sparse = "android-tools-native"
+CONVERSION_DEPENDS_sparse = "android-tools-native e2fsprogs-ext4sparse-native"
+do_image_ext4[depends] += "e2fsprogs-ext4sparse-native:do_populate_sysroot"
-- 
2.43.0


