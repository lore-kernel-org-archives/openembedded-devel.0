Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FE23C36010
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 18:57:55 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.1819.1743533873491508118
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Apr 2025 11:57:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kBDe6YPB;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: jan.vermaete@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43cf848528aso51244535e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 01 Apr 2025 11:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743533872; x=1744138672; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2dSINLomAAG8U19uAw3i4/QnaVkQWN3EscZ9R9JFItY=;
        b=kBDe6YPBiQhEOX/08CJuSIOB45/iyTX/ZA5eeYTQyJoDyikeMwi4sKp34WdJHxiUBX
         Eg7ltKXRKylGE8R/qAL76SbqkeFgZgXKQnGafd5LfXBzyWpaEcBIriGnHZ9iPldp54lB
         Fpq+t50WXaeH8IrITilkUw76NDdvo7QfdIrJrq82ZXO2fVu/Qar/eyUyST6XdUgpUSbg
         bfEFq7Ldb2lY2AAjP02Z6kMtoa15ki5uiyzVfpw7HqFY0QJPrC1uXXr1pYQKuIFsGg2/
         nS6UijmIXD+NT+bFrQeyaXncnFr3HK/68pGU7zVSbmLQQBikAwF+nYHPJ/nwnKBCTR1n
         S0Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743533872; x=1744138672;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2dSINLomAAG8U19uAw3i4/QnaVkQWN3EscZ9R9JFItY=;
        b=XWb0naBk07KtJI7W0baDSceuXGUzwd77sKq1nKI4HHUEZ1kEtOlap70IstGDJVq5B+
         daW2At8+Ay3ecdHUC9O2t9aKenQfghKV8SK5hHjcv8CP+YHmTEwB2s4gwLMnBvUDupqa
         IDFnWcmizfu22PmrZXQHPxqIfBqcMH9TZhQXGDWw80Ityx2Oc5VHb60drBpX5sBal4hE
         IDlumZd5HKtvOEynWpoXGGUcYCQAzl42Ji5VVHqlB1LNMHVxtlIZK2J/wrQRuuXgps8H
         oJ1kZHNPEhyMHVHYIaB4Q263GRQzRZ+huYB+uEbWS+aYbP60fwdPdit2dF32waq/241p
         UF/Q==
X-Gm-Message-State: AOJu0Yx6ibUDl6En3EBfWT7cq/RqpjM0/9tu2AFGtixtCpV3/Gla0KiS
	3Egx7TmYWxmcbkRVlugVVqtAqfhxV6KOC4PW3V9UOe2HV7O3bnlcW0gxQA==
X-Gm-Gg: ASbGncuU9uRNEgjGmud8dRCya0ie+EBaUxcvy3RJOrGs85RJ37OVIA8b8Tb1NR9sc9j
	54INqxTTtDEcqHyNWOtcnp4/ta4hTj2N78VDHjq91jnRGH69yQ1oVWGt/OIavzp4bmJQIvwsL5O
	a9nWRMRycprffs4Zrtct2jsan98ga0BgM6kv6URr+mFuHS/odCBrOynQbtHz7lFHJRVF9E8/dR6
	/gz0NYlCBUY6pfVQrWPRmStd8zzP9v2e+tQdnn8ES3ZRaUyEISYV2hJsnvgb7wlL0pQxFULAiYX
	3wHVDXok6lj3bF7RiftxiJV5yUWqs82Qb6VHi7HqALGmgqSVe5coVFjCj3aitekKvUU0lUcqSoo
	K9wp5Lv3hv2A6OPk5iV0E5CXpVtbSDF36g9NCm9aNkOQc65t29ns=
X-Google-Smtp-Source: AGHT+IHEukdlcidqNGZrwWC2PlJ4v7SJzBOoBey/VIabyzPbnJqEG0IJ5++k6MFcsEmqHJxVkPTJww==
X-Received: by 2002:a05:600c:3d06:b0:43c:f184:2e16 with SMTP id 5b1f17b1804b1-43eaa03e0b9mr34392165e9.5.1743533871399;
        Tue, 01 Apr 2025 11:57:51 -0700 (PDT)
Received: from localhost.localdomain (ptr-fij45qxtdobqrxrcewr.18120a2.ip6.access.telenet.be. [2a02:1812:512:2c00:6021:e9a4:5aa0:257b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b7a4351sm15101202f8f.98.2025.04.01.11.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 11:57:51 -0700 (PDT)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>
Subject: [meta-python][PATCH 1/4] python3-mdurl: new recipe version 0.1.2
Date: Tue,  1 Apr 2025 20:57:15 +0200
Message-Id: <20250401185718.2447415-1-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Apr 2025 18:57:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116484

* no tests are distributed in the pypi package

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 .../recipes-devtools/python/python3-mdurl_0.1.2.bb  | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-mdurl_0.1.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-mdurl_0.1.2.bb b/meta-python/recipes-devtools/python/python3-mdurl_0.1.2.bb
new file mode 100644
index 0000000000..cc110784e3
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-mdurl_0.1.2.bb
@@ -0,0 +1,13 @@
+SUMMARY = "Markdown URL utilities"
+DESCRIPTION = "This is a Python port of the JavaScript mdurl package."
+HOMEPAGE = "https://github.com/executablebooks/mdurl"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=aca1dc6b9088f1dda81c89cad2c77ad1"
+
+SRC_URI[sha256sum] = "bb413d29f5eea38f31dd4754dd7377d4465116fb207585f97bf925588687c1ba"
+
+inherit pypi python_flit_core
+
+PYPI_PACKAGE = "mdurl"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.39.5


