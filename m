Return-Path: <emailaddress.ashish@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52973CA1013
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 14:42:44 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web10.16036.1758206561526893035
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Sep 2025 07:42:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VNLOLkmy;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: emailaddress.ashish@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b4ee87cc81eso957608a12.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 07:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758206561; x=1758811361; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IXsb/NHgjvyGRvyTUNg9Tzrsb+hd2eWyo6FNJNyp8zc=;
        b=VNLOLkmyf05NQzzsfx3qdpKDJLC4cC8SqsR+W/oyc3ItiR+DNXYrvi6FKvANwBHsC3
         5s/+KmYHcGKAYuv1GwOBroODMkz6XFgWQXR7XJ45wtAqQ3UgXK4bxy0tuTSxeCR59nuU
         aRcHaTRecKnmno3I+l5xx4YXvehpEzVRhcoeXAFPfQKXyDni6/KwLPQqrIuTZ9ZP9RSI
         DPbmC3HFnfkPcgTtNfGtaaAICKMIDnzFz+0S7rrC5KCT44dPkhdaobxIM1lF6FvCMBGB
         JQRE6Lhj0E6ltoTkMyQlJfAlapC63mXbZj/d6WYZRxVQbvQoVnKftoxhZR/k9fFUpO9E
         WUCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758206561; x=1758811361;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IXsb/NHgjvyGRvyTUNg9Tzrsb+hd2eWyo6FNJNyp8zc=;
        b=GNk1j7DpOTttoO0LzHIdIPuKJYk0nfGPzpNEFRpluonAc+MXk17oCENbPW6to0LCl8
         KSynfzisrS+Kqxyei16QhRVT7WItO7XBDnItIYa3KSHQboh/FDJDAxnLB7n6IgM7EhoA
         9hUy7Rzjqlx7SEOegASy/kbOUd0P7upOLczfRADECB1KXw22Ok9XwlY7a+P1+whQn3Bx
         gJIUK+0/KIwScZpCyRpT2SJif23bjDeaM30jEneYB2pUqecdiGtGTq6KX2AC29KtaVon
         Tdk3dnKzw46EwiZ+UOFPktOGsi83L0nJSFNmdIUdfRdd4x2OGTTOeO9AJKq6mKvxUK4p
         /ZnQ==
X-Gm-Message-State: AOJu0Yx7YGlKhYEEbf7j9qa2/oZMFhFX1Zx6QE5KkUewElQ7m9pyWaNE
	oXZPS19nCaXaGuZVdsbSmUnbafKIzqfiL4BgDy+tVNH8IW23aQPyBsEbay6jhA==
X-Gm-Gg: ASbGncs5zNMZ23ghwmXWsNUBLyOrLDX37AYxvkh6XJhAiiWPRzK2b9hOPFfhqV7W+ni
	l9+Dx8k76e4CT9Gv3mQAGQrEj5ds36C6EwTD60iEBKmQsGuAk5yyY6LgwhBgx6UDbdkU59cB4hW
	EOyg0+0LSNrGUz0u0wzSuC6Sai8owIm0+06R//9DSkPtDXj9LtGyy187bO92YxelkSnRQXQ8507
	QJbigktWtvT64IDahh82JwlMFO07+VO/5izZzTpFTcrr7oqAW+dvfs8l2V5/Or2916/HqO94xwS
	PRPWy5ULChccGIJfVCQOTWyFKElOHFuh9PB9sRJG5sCZyEqf9p+7RtC0gQCHkYpq62JNnJQv3A9
	cirlJM6ZQMUL/RKexBsCq
X-Google-Smtp-Source: AGHT+IFyiYlUj0WzIJFVIFJnHBA7NlXk8s/IFJeis9qUb68FW1s05g+UZXOeOKDUYdC31eW6zcpS1A==
X-Received: by 2002:a17:902:ebc3:b0:269:6c70:ee2 with SMTP id d9443c01a7336-2696c701d0cmr73383975ad.52.1758206558057;
        Thu, 18 Sep 2025 07:42:38 -0700 (PDT)
Received: from ashishkumar.. ([2401:4900:1f27:b34:d313:75f4:7791:1cf1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-269802de57csm28171215ad.66.2025.09.18.07.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 07:42:37 -0700 (PDT)
From: AshishKumar Mishra <emailaddress.ashish@gmail.com>
X-Google-Original-From: AshishKumar Mishra
To: openembedded-devel@lists.openembedded.org
Cc: anuj.mittal@intel.com,
	AshishKumar Mishra <emailaddress.ashish@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [scarthgap] meta-oe: image: optionally remove RAW image after sparse image creation
Date: Thu, 18 Sep 2025 20:12:21 +0530
Message-ID: <20250918144221.2422710-1-emailaddress.ashish@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 14:42:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119577

From: AshishKumar Mishra <emailaddress.ashish@gmail.com>

When creating sparse images, the RAW image is no longer needed in
some workflows such as Android and CI pipelines. These RAW images
can be multi-GB artifacts and consume significant disk space.

This change introduces a configuration option
`DELETE_RAWIMAGE_AFTER_SPARSE_CMD` which, when set to "1",
removes the RAW image after sparse image generation.

This reduces disk usage in builds where sparse images are the
final deliverables and RAW images are not required.

Default behavior is unchanged: RAW images are kept unless the
variable is explicitly enabled:

    DELETE_RAWIMAGE_AFTER_SPARSE_CMD = "1"   # Delete RAW image
    DELETE_RAWIMAGE_AFTER_SPARSE_CMD = "0"   # Default behavior

(cherry-picked from f5246b7df447ac76ec04c6e5add398862d1c9ccd in master )

Signed-off-by: AshishKumar Mishra <emailaddress.ashish@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/classes/image_types_sparse.bbclass | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-oe/classes/image_types_sparse.bbclass b/meta-oe/classes/image_types_sparse.bbclass
index d6ea68968e..5416c2a019 100644
--- a/meta-oe/classes/image_types_sparse.bbclass
+++ b/meta-oe/classes/image_types_sparse.bbclass
@@ -9,9 +9,15 @@ SPARSE_BLOCK_SIZE ??= "4096"
 
 CONVERSIONTYPES += "sparse"
 
+DELETE_RAWIMAGE_AFTER_SPARSE_CMD ??= "0"
+
 CONVERSION_CMD:sparse = " \
     truncate --no-create --size=%${SPARSE_BLOCK_SIZE} "${IMAGE_NAME}.${type}"; \
     img2simg -s "${IMAGE_NAME}.${type}" "${IMAGE_NAME}.${type}.sparse" ${SPARSE_BLOCK_SIZE}; \
+    if [ "${DELETE_RAWIMAGE_AFTER_SPARSE_CMD}" = "1" ]; then \
+        rm -f ${IMAGE_NAME}.${type};\
+        bbwarn "Raw file ${IMAGE_NAME}.${type} removed" ;\
+    fi;\
  "
 
 CONVERSION_DEPENDS_sparse = "android-tools-native"
-- 
2.43.0


