Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3F5BC3601E
	for <webhook@archiver.kernel.org>; Fri, 11 Apr 2025 00:42:16 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.14017.1744332126957892502
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Apr 2025 17:42:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ByuqmKff;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-736e52948ebso1631200b3a.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Apr 2025 17:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744332126; x=1744936926; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7GXUvNu575NOkmJXeAs5GI5mfCwyFTFirFI5isEuzUU=;
        b=ByuqmKffboQ0kqEgRCoSD9m7PHD3LfClGIVg9hJWaZIfoic0sBvXTDV12L8NPapIUY
         CHKoO51C+8CXcuve4WDeZEY5iVgWVgU/sBphbTTZrpy1mcSza17seO6zmC727U0R056+
         rI75QgjOPou7ekaQN/kN1YEolwj0B+PpvVUYe6T5o1Gt6kyXkvD4diHMmXzP7buy8rZe
         i/spImVmXt6XQs8S9dp7DHzA9c2pXD/ioeUpxkS8uARKYXt5tnZ6B7f2iui3Zld9Yr4i
         X6QIkichd6dNIlARLszuGDGNq5GvCRCps2uiE40QDnvkNw+EnsXlrngpP97JiTXrhVEm
         dU1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744332126; x=1744936926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7GXUvNu575NOkmJXeAs5GI5mfCwyFTFirFI5isEuzUU=;
        b=uduTTlkR06i9OdKcN/FKZn8KIGbmpfW95iJqza/duZO32OLzitrC4yyVLRS1IEgXjL
         SJdx4azyMJ0sP4txvcBBcBTutLDf36sG7yTJvoHssSoiHhA6d5X2zfmCfRPXi7zOawEN
         tNsXcqS24FBdseSYgjUEFNbfVUOi9LAoMSz2ec1BNi5wRhHctlIDC4BvV8RGPZ/ZLeV2
         ziRcHQh7jC7Ci4r7UR9i7z7+W5FDJGI5GLUIiDM+1wJrhwRD+jI9qcN3QwuVfYBlLKaq
         sG2vfgKA6tpMrJFrICO6twqB20Kp/elr+/S5OaFrCDPqYzPKZlpbMAXVIHuIf5oArRWk
         Xs9w==
X-Gm-Message-State: AOJu0Yy9uJTnHD42IJmT9FNIxrzIW9E3RztN857rDVS7VUrIFDxgXE3z
	d3KymO8FdrgLL23uN7bUpmVsfln71HgFaOR+KOyo4CK46jUi5AIK+3h6M5lO
X-Gm-Gg: ASbGncvGLZ2AKcE73Ap7snFDp1Oytf8KYntbUK0oN5SOH0YzGkNmuxC63Dkexj0ScfS
	cGemy+Kya0qR5QQqGdu4f7zTwPnEImOqTGSHDwJ/vjFCKqRLa5ZY8y3oTw+TXn122jyiNzFvvo+
	hfoK1hJr6prOihR+RgyFsYLwO+jn7AEoxXYdy4VcqHB/c8YKA3Me6hTuv6Dg4ubsdgNQfaiYVH8
	CHmt5dxHeIyQU7FhHj3XDTAkqh8o1unRHNoPUCtMeomh7mIuKztOIgAg3OU/KQlULhp81RAvVPf
	MkpjKAHOar+6ilxTlojBToANbE5PkbWF
X-Google-Smtp-Source: AGHT+IEj8GLU2YIwpVKzzcoPz14zlzDaVFjpyePjzR81ypEfgp3Hrw7egDSZo1spifQ4ulEmLlAZ2w==
X-Received: by 2002:a05:6a00:b89:b0:736:562b:9a9c with SMTP id d2e1a72fcca58-73bd12b1a09mr1194131b3a.18.1744332125984;
        Thu, 10 Apr 2025 17:42:05 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::c043])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd21c6464sm226987b3a.64.2025.04.10.17.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 17:42:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 02/12] tftpy: switch to PEP-517 build backend
Date: Thu, 10 Apr 2025 17:41:51 -0700
Message-ID: <20250411004201.3826913-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250411004201.3826913-1-raj.khem@gmail.com>
References: <20250411004201.3826913-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Apr 2025 00:42:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116776

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/tftpy_0.8.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/tftpy_0.8.5.bb b/meta-python/recipes-devtools/python/tftpy_0.8.5.bb
index b2c7467df6..3ff5f47d8a 100644
--- a/meta-python/recipes-devtools/python/tftpy_0.8.5.bb
+++ b/meta-python/recipes-devtools/python/tftpy_0.8.5.bb
@@ -10,4 +10,4 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=22770e72ae03c61f5bcc4e333b61368d"
 
 SRC_URI[sha256sum] = "dd38e3744530d0c30fa1c715d7fa454319bc8d399bb40c05839cc771f05d0e6c"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta

