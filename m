Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F253AC36010
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 18:58:04 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.1850.1743533878336464707
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Apr 2025 11:57:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZZv3Rqks;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: jan.vermaete@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cfb6e9031so53281285e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 01 Apr 2025 11:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743533876; x=1744138676; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vri2qsZMhb2QDhDgX5XjwuQ8HAgmfYb+IrWR8fqhGyg=;
        b=ZZv3RqksVA+F75Tcn936q6b/fkz3j0DAGUzdV2VQ5lB2mE81YtlaCvm8s/6A986M8B
         sF7TMGQeTIhRfohWfi/Tpbqs2n3fjd3ZvrqBjWJYU3XDT+WhszGpQ1jqyfUOvFp2cKd5
         iKA34v2xPQKUfEh4UpV2tGWJ1ROALgmoVIQsklZHwYgHx67SHCBkyfzSFXyM2B0R3XYc
         26do+nRyAIayJWAJNujM/Ut1S2gl7dmsasYvM4fUUOSHDVOCBQxpfhdS64zvHYOFDP/I
         W1itdrsh+CTZ75RjEleOIg1uK8o3jjN5PYXcZOo0wqUZLzUW9K0FXAb0mu3R5ot9VLX+
         Jxmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743533876; x=1744138676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vri2qsZMhb2QDhDgX5XjwuQ8HAgmfYb+IrWR8fqhGyg=;
        b=IOw/vBWUcd8vxVEoC+QojBT4Ya/nR4wFPp5/97C4qRslJb0mr76mUG8OdDs06e2L5d
         WsyOCrWTICnAU26N8C7HtQ7MAW9XNYUNR0E1GX3mMhtjV1+qv7Az9RCq2AcWkDzYr6LC
         M1NECtearf4+mtul4X1onI/oMX/UvQuEn79wz7BETYaQT0k+FNS2HXBrVf8QwRMOJmaa
         t9lMbFvOOYppbRtqZLv7LQyMksImUWKmG4Z+RN+HkPVJIVxkdASW0/o5StddHrjVO8GC
         pKcvRocnjQ2PZ471zsbWPNq5wCZwZMZpru/6MK3jwHm1VDhaaWPLLRJ+xnhMF9UiPlsM
         SyWQ==
X-Gm-Message-State: AOJu0YzIjTSvEeV7acT5ZgZcRpjQaqDZbeb2Gm+I9Nj1JVFn1ZZudT2u
	SlDxxgj5qH1PC+8qTRTPxpxuhjA3rgh01goh2lvvb9nQ6+owvr6BGuzYPA==
X-Gm-Gg: ASbGncvB90MPt92M0GoMk+7GJTiPa0YrE03QUoEE1qPENfdz0raoRAkvT8lwyCQtI66
	kQNAG0pKDgyyO7Y7smLITpXDTFr/YS2vtkWlZeW65z9PkPY9y69gMxUBnBDeW/fuaQ18wRvbcI4
	ntWvSihHz7z7LmiyVhc6SsMXUC7uzm81ZfJayhJvIsHD3n0m02BiJRbDyYQxToBOLTtehsML/CO
	fdv54oDyI0rWJnTrtODsso/wjX9mxn7lB3M9s0cGYO+UjaTq33i/+fi98jjRy55IdfVc6k6VuYF
	JCVH5Bv5cm8IhAn7+7FuJkqmuonGs/4BQ1FO35BDjmU9z2JnsI9zg6gKRX8G2qOmBGraqW0C+sq
	M/obAyR+B2XfJHxCfwPStI0VyVs5cBdTuJ/lbKUJgqo8GmHNmg1xSM9UpwMXj+w==
X-Google-Smtp-Source: AGHT+IGg+3OTAsbzHB4leotkDBWDyOAr+nNGAqGhWbzLJYlR1GyKBV6gIDENtl1aWwTT4q+K6maYZA==
X-Received: by 2002:a05:6000:4203:b0:391:2c0c:1247 with SMTP id ffacd0b85a97d-39c120cbaf2mr11221450f8f.1.1743533876392;
        Tue, 01 Apr 2025 11:57:56 -0700 (PDT)
Received: from localhost.localdomain (ptr-fij45qxtdobqrxrcewr.18120a2.ip6.access.telenet.be. [2a02:1812:512:2c00:6021:e9a4:5aa0:257b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b7a4351sm15101202f8f.98.2025.04.01.11.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 11:57:56 -0700 (PDT)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>
Subject: [meta-python][PATCH 2/4] python3-markdown-it-py: new recipe version 3.0.0
Date: Tue,  1 Apr 2025 20:57:16 +0200
Message-Id: <20250401185718.2447415-2-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250401185718.2447415-1-jan.vermaete@gmail.com>
References: <20250401185718.2447415-1-jan.vermaete@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Apr 2025 18:58:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116485

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 .../python/python3-markdown-it-py_3.0.0.bb        | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-markdown-it-py_3.0.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-markdown-it-py_3.0.0.bb b/meta-python/recipes-devtools/python/python3-markdown-it-py_3.0.0.bb
new file mode 100644
index 0000000000..c87bc04b0f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-markdown-it-py_3.0.0.bb
@@ -0,0 +1,15 @@
+SUMMARY = "Python port of markdown-it. Markdown parsing, done right!"
+DESCRIPTION = "Markdown parser, done right. 100% CommonMark support, extensions, syntax plugins & high speed. "
+HOMEPAGE = "https://github.com/executablebooks/markdown-it-py"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a38a1697260a7ad7bf29f44b362db1fc"
+
+SRC_URI[sha256sum] = "e3f60a94fa066dc52ec76661e37c851cb232d92f9886b15cb560aaada2df8feb"
+
+inherit pypi python_flit_core
+
+RDEPENDS:${PN} =+ "python3-mdurl"
+
+PYPI_PACKAGE = "markdown-it-py"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.39.5


