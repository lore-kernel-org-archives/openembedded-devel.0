Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 835D0C52D7D
	for <webhook@archiver.kernel.org>; Thu,  8 Aug 2024 12:23:17 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web11.58567.1723119789300460348
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Aug 2024 05:23:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=aNZl9IUj;
 spf=pass (domain: konsulko.com, ip: 209.85.167.50, mailfrom: leon.anavi@konsulko.com)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52f01993090so1130195e87.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Aug 2024 05:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1723119787; x=1723724587; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zQ6tn+hTnGOyLG1KaJy0fMVxRT0b5kDpXlPIk0+Vh3s=;
        b=aNZl9IUjOd9sNhQUIJgo3RUit6GxaTiKeCxhrifaKtLVHpam4E7BBrjQI+/1jIrLt8
         bLFj0RNecLyh2ijD5d+AOqnKFFn/5KvvJGIwp7H0S70ej5LIBOPP91lTeQ82fxPD526b
         lvXi/grj6YaO+Kl9/5HXZ5QradxqmG6QBsrHc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723119787; x=1723724587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zQ6tn+hTnGOyLG1KaJy0fMVxRT0b5kDpXlPIk0+Vh3s=;
        b=SAM08sAkdH/KEa1joBiBM5nN+4beDymHBUikKfobOChqfbTLzfgRMXGsLi/xmGJMqX
         6Dv1uSzF+ISUbrhM9byO36jPOuHC7L2P7d2EdWRXUVpCtUwQQRDd1wwPOQ+FX0dQS57l
         6lqfwoQhikWhBgVtJsQGMjyITKSTSKz89KAC4oOGJx78RNl4uFOeZ1UfgLa9LMRzqidH
         rH2RPoYgY2vNgi48xLKTYzqwieU5ucyu4HBh0L5AukxMMwvk0kw+4z3ljcJypDJ6E6ez
         cL9DryvZ9dGA7tFaydapcdVmvG/gaJxewH7z4B+Ch/hlcXeJdgO20xtf/WGT0gylhzHg
         jM0A==
X-Gm-Message-State: AOJu0YyyIivoL275yJRDujoigePEZr9SPXypJuGray0nsNaFsEdNCZs9
	nkHnLBqP54RbsS2HRaBv6WY65fYbrafrUju7zgOuFmbkMb2/yGckoyPEgD7FuYwIX0hipB9/+Qm
	G
X-Google-Smtp-Source: AGHT+IGurq4TfwRfPqjPBdNbl0G9g+PWisievJ9yXCKV2KKF1hkTFJEaWz6xF2EnMTzUnrrU5AoJ0g==
X-Received: by 2002:a05:6512:3d07:b0:52e:a63d:e5c1 with SMTP id 2adb3069b0e04-530e583ca79mr1028864e87.30.1723119786985;
        Thu, 08 Aug 2024 05:23:06 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9ec886esm736135366b.203.2024.08.08.05.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 05:23:06 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/6] python3-hatch-requirements-txt: Add recipe
Date: Thu,  8 Aug 2024 15:23:00 +0300
Message-Id: <20240808122301.2271346-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240808122301.2271346-1-leon.anavi@konsulko.com>
References: <20240808122301.2271346-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Aug 2024 12:23:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111658

This is a hatchling plugin to read project dependencies from
requirements.txt, release 0.4.1.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-hatch-requirements-txt_0.4.1.bb   | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-hatch-requirements-txt_0.4.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-hatch-requirements-txt_0.4.1.bb b/meta-python/recipes-devtools/python/python3-hatch-requirements-txt_0.4.1.bb
new file mode 100644
index 000000000..8b3218790
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-hatch-requirements-txt_0.4.1.bb
@@ -0,0 +1,12 @@
+SUMMARY = "Hatchling plugin to read project dependencies from requirements.txt"
+HOMEPAGE = "https://github.com/repo-helper/hatch-requirements-txt"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=58206c261591d2c13b00ab61cec32abe"
+
+SRC_URI[sha256sum] = "2c686e5758fd05bb55fa7d0c198fdd481f8d3aaa3c693260f5c0d74ce3547d20"
+
+PYPI_PACKAGE = "hatch_requirements_txt"
+
+inherit pypi python_hatchling
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.39.2


