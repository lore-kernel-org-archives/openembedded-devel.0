Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5398CCD1BF
	for <webhook@archiver.kernel.org>; Tue, 28 Oct 2025 11:33:07 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.6119.1761651180903942108
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Oct 2025 04:33:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=B3wuc5DF;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2698384978dso38546555ad.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Oct 2025 04:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761651180; x=1762255980; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uMHRSG85Gq7EydzeDR/zlRniAjJ6MKLN8tA4pc7+tHY=;
        b=B3wuc5DF495/ZfE4o69TcD1zwJ40KazY2mNHoGSVy0iCovp6gdhedFLUWB2nmkmaST
         lT3AEZnPgY2xBlBryV2pvkHClGTPbq2d7gKDozS8kbcilBL4kqvMXOfUqIPGSPPCUFo5
         AHfy5vFMwlUn+a74VdzHOWa5OLyNQQ1YxCdmsrWRPqbtziuk1bQivMdjl4OHkTX83amZ
         dNnhnqPFA6rK3nP2+32W8N8Fifmnw99tpKMmuqdBiMJ/NgVeMO38bOX9bDKYfkeVa2Yc
         h6t4JYvteQhVeZokr+K+yVbctSWLTORzHl/8yawqkLelFE3LexI7FWDHv8o1KfF4vSlC
         sslw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761651180; x=1762255980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uMHRSG85Gq7EydzeDR/zlRniAjJ6MKLN8tA4pc7+tHY=;
        b=Y1d5t7zeQphgxJc3t8gyRFozt/geM2IoBqmXWQo0ASQzhtYNyjmp07bUwBLKiuaLBh
         AADq82xNJzAe60/6OCiAn+GzHe1NHgnuvbmeZgXwY+N+0zzAKzFGecaauyk1/Da5ykrH
         2MyV4+FCn1/H97XISls/eJ6wGjSILOyPN2QcjRbLdtec2gOIo8rUJEOv5FBs5gA/U6qZ
         gpQJT7vtt4AWEnJj4Bni5aMbJDULaLiKWGoUFdsZFplX/79+b/iQ8ndKl143Zbo1jOEx
         HdJ/X3lyvwRWLeBezKhdItCRn9hLzf0u5Jq0fe8hAxzd+OWaqCHcnvyf42QZqm+22jcu
         X+5g==
X-Gm-Message-State: AOJu0YxIufS2Y5m+wvR8V4uQ8VFT602kjJ2iYt1NUDfgsIWIaPHsUZxL
	czUprdDhNT8C7B7LKzIM1M8xwh+QZQtgPOcVp9AcCOSfCuAyh50pfKYVtS3wFw==
X-Gm-Gg: ASbGncvgjD0zvd2nR4Elzaa0PkhpxsbDj+gHFkJhZ6rWLVvx0JZpalxJto1ofeRQ/s1
	sr1KW9F59AGyADHFjtAq91BzkI2dtKh/iEHg4/zBSJfV9Ulsvfh8rilTjxLmQazrOHXbYkUPJ8Y
	LORBVFNkzL+c3jwLQyZKjjcKVLIiPTAYNm9fG2VENg8cR+V52ccbH+gkQ84RkYBVg6Se5LPaYpE
	sucaJahBTDdCQ/QjwLpkPNyY/JxCfNUNM4UpuExOmBWmbNqZKzjSinvC+UFcHP/s7v75EEXXMFB
	WEYxhCJ7xJJD+yd08pAPP5Mai3PxITB0IENlmRzfsqcxr2jrxHNx2Nnkg4vSLvvsJ/bW5vP/pp+
	VdANtcAIOKtnpl0/leFiZaO/IDj+KTDDahFJa4dW6EQIudRjD761sVhpV/4fl/YHStlGcLMsicB
	MpqWbSMNZ61tGZp5E9kgx/WkTN
X-Google-Smtp-Source: AGHT+IGKzx4S/855Hi5MF81y50mrZaUQME1vqk0DZF0FSbrhg0NkxZDeEsgVN0BodUf9ckZdplt38g==
X-Received: by 2002:a17:902:fc85:b0:294:cdc2:6e84 with SMTP id d9443c01a7336-294cdc27181mr32680435ad.17.1761651179873;
        Tue, 28 Oct 2025 04:32:59 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fed81c9e5sm11819686a91.17.2025.10.28.04.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 04:32:59 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 1/7] hdf5: patch CVE-2025-2913
Date: Wed, 29 Oct 2025 00:32:41 +1300
Message-ID: <20251028113247.1761834-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251028113247.1761834-1-ankur.tyagi85@gmail.com>
References: <20251028113247.1761834-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Oct 2025 11:33:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121079

Details https://nvd.nist.gov/vuln/detail/CVE-2025-2913

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../hdf5/files/CVE-2025-2913.patch            | 32 +++++++++++++++++++
 meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2025-2913.patch

diff --git a/meta-oe/recipes-support/hdf5/files/CVE-2025-2913.patch b/meta-oe/recipes-support/hdf5/files/CVE-2025-2913.patch
new file mode 100644
index 0000000000..e1614bee9b
--- /dev/null
+++ b/meta-oe/recipes-support/hdf5/files/CVE-2025-2913.patch
@@ -0,0 +1,32 @@
+From 538a14fc5a1ed393495029d5054d934bc09844ee Mon Sep 17 00:00:00 2001
+From: bmribler <39579120+bmribler@users.noreply.github.com>
+Date: Tue, 5 Aug 2025 09:12:33 -0400
+Subject: [PATCH] Fix reading bad size in the raw header continuation message
+ (#5710)
+
+This issue was reported in GH-5376 as a heap-use-after-free vulnerability in
+one of the free lists.  It appeared that the library came to this vulnerability
+after it encountered an undetected reading of a bad value.  The fuzzer now failed
+with an appropriate error message.
+
+CVE: CVE-2025-2913
+Upstream-Status: Backport [https://github.com/HDFGroup/hdf5/commit/7cc8b5e1010a09c892bc97ac32d9515c3777ce07]
+(cherry picked from commit 7cc8b5e1010a09c892bc97ac32d9515c3777ce07)
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/H5Ocont.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/H5Ocont.c b/src/H5Ocont.c
+index 621095a198..c03f4dd1e9 100644
+--- a/src/H5Ocont.c
++++ b/src/H5Ocont.c
+@@ -100,6 +100,8 @@ H5O__cont_decode(H5F_t *f, H5O_t H5_ATTR_UNUSED *open_oh, unsigned H5_ATTR_UNUSE
+     if (H5_IS_BUFFER_OVERFLOW(p, H5F_sizeof_size(f), p_end))
+         HGOTO_ERROR(H5E_OHDR, H5E_OVERFLOW, NULL, "ran off end of input buffer while decoding");
+     H5F_DECODE_LENGTH(f, p, cont->size);
++    if (cont->size == 0)
++        HGOTO_ERROR(H5E_OHDR, H5E_BADVALUE, NULL, "invalid continuation chunk size (0)");
+ 
+     cont->chunkno = 0;
+ 
diff --git a/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb b/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
index f34e5f183d..d195ec2486 100644
--- a/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
+++ b/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
@@ -15,6 +15,7 @@ SRC_URI = " \
     https://support.hdfgroup.org/ftp/HDF5/releases/hdf5-1.14/hdf5-1.14.4/src/${BPN}-${PV}.tar.gz \
     file://0002-Remove-suffix-shared-from-shared-library-name.patch \
     file://0001-cmake-remove-build-flags.patch \
+    file://CVE-2025-2913.patch \
 "
 SRC_URI[sha256sum] = "019ac451d9e1cf89c0482ba2a06f07a46166caf23f60fea5ef3c37724a318e03"
 

