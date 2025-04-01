Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F391BC36017
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 18:58:04 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.1821.1743533880269675818
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Apr 2025 11:58:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nAlwJkrm;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: jan.vermaete@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-39c1efc4577so1022277f8f.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 01 Apr 2025 11:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743533878; x=1744138678; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6W6kwMUcuKGm9gAaGWFx6BOIOPtLDceLeDT8AgZbvPA=;
        b=nAlwJkrm6dTciomWbBlidvOTEJZNF4slgEsd4bpzFKl2WReKA/b6CyfoXWvJnDHxSU
         /vKqcOHZULMrVfe0M9duPtK3v+s8G/1iIx5aZGU0l2+1xrxYsLhiAxzoaJI0LdVcIgOb
         WrvH+qFTOh+976V1LWn8sfpJ/CctdbiU8/vwXpo6uvIVAjbf0riSHmrcAeikboumelrE
         rcAWismh4HgCeuhzmO4mLAVmc7fX+T+5L5nBhyIbxWB3si6e+Jo0FqTSAjhdsPqvR8An
         L2Vr+JRu1oBHGJRlLmt7YEO6oH5voNBLen8dFCdm72gR588e5MKL8NWo2DzdWTEwUcx1
         /dtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743533878; x=1744138678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6W6kwMUcuKGm9gAaGWFx6BOIOPtLDceLeDT8AgZbvPA=;
        b=jnStAKO/eJDhF0NsbtJ4gpSpY3PEGH4MMWIjxEJwqA/rqQcxuzuU96nOZKZYt0jh3e
         xTJNZs6CXgJVUvhwl9jqluzYK9+lytKyimLYDcLqVgfNOqO0L2GOt8WF1st8EzjJob5u
         61qf0wc3xqT1XDBl4zWtLO0yagp/Gum/V3AzeUcRNuH28dKxRQYI5nIOpYrEBSRbB4k9
         kJHMtVzTZAsmRBIXB9FSWmpJlV0pTINNu1dDGIFxwulhei1fbfjP4pxsx6UOsK+PeVuc
         rINI2C4M24Y0ZhadZidJ7r9ljTGl47nx3BLS6dreBaHAU+2hAUzt4p4ZUV/hf19gd4z0
         hVZw==
X-Gm-Message-State: AOJu0YxhrKq+fLKclj9kUNyhfUUObQ7gRsFKCVC+Nj90k4sq7KW1oT+1
	3ZUIj4B44DmrKyxTfcsIZrCKkg/pPzFP31wt6pss6P9vL0YJQPiFcoxinQ==
X-Gm-Gg: ASbGncuhs94rpf51jLlBYFsMoMN0Df7e7SR2yla39JUPyKjI9fT5COYGoq0+AoT+Aez
	u/rbeUgC6eE1QoQyTAyGYUeTc4Ut9PDyMesEzhKIgDz48Ov2BtHdywN495H2vRdaXt8pFS/Jucg
	TJRgJxlM8HnthvNCXbF2Mwa4DbVkr3MJ9xjwqFMCAkiSfr56FckJKKAU4vWy630/MMVLNwmxUMA
	9NnJSVQDc6Opq/8RdofMmtfzh83+ivfGjBBBzXzPV0WmT3jaYSkKV0XIrDPVNjmtvF1vOEHpVMc
	y76+EeEwq9Yz0Psscdba7brE4wFzA/ZFx9H4YEFe1cKOwA96t4FoiRWaTIz8LlV1RC6dZBm0TMH
	2VNS4S2d7Lh3MXuUUgmG7/h14mJ2RZYZbG/TVZdwYfXx3sM7bAKw=
X-Google-Smtp-Source: AGHT+IGj8Fi+Kmsd18No9hbZ4tDGR4BsHnsHh1kgFr6Avm2QkRzcnL8wZhT/zW/T38Fh6CykOgb/yw==
X-Received: by 2002:a5d:5f81:0:b0:38d:b325:471f with SMTP id ffacd0b85a97d-39c2364b43fmr3012397f8f.15.1743533878175;
        Tue, 01 Apr 2025 11:57:58 -0700 (PDT)
Received: from localhost.localdomain (ptr-fij45qxtdobqrxrcewr.18120a2.ip6.access.telenet.be. [2a02:1812:512:2c00:6021:e9a4:5aa0:257b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b7a4351sm15101202f8f.98.2025.04.01.11.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 11:57:57 -0700 (PDT)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>
Subject: [meta-python][PATCH 3/4] python3-myst-parser: new recipe version 4.0.1
Date: Tue,  1 Apr 2025 20:57:17 +0200
Message-Id: <20250401185718.2447415-3-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250401185718.2447415-1-jan.vermaete@gmail.com>
References: <20250401185718.2447415-1-jan.vermaete@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Apr 2025 18:58:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116486

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 .../python/python3-myst-parser_4.0.1.bb       | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-myst-parser_4.0.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-myst-parser_4.0.1.bb b/meta-python/recipes-devtools/python/python3-myst-parser_4.0.1.bb
new file mode 100644
index 0000000000..798ffc4dfc
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-myst-parser_4.0.1.bb
@@ -0,0 +1,21 @@
+SUMMARY = "An extended commonmark compliant parser, with bridges to docutils/sphinx"
+HOMEPAGE = "https://github.com/executablebooks/MyST-Parser"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a38a1697260a7ad7bf29f44b362db1fc"
+
+SRC_URI[sha256sum] = "5cfea715e4f3574138aecbf7d54132296bfd72bb614d31168f48c477a830a7c4"
+
+inherit pypi python_flit_core
+
+PYPI_PACKAGE = "myst_parser"
+
+RDEPENDS:${PN} = "\
+    python3-docutils \
+    python3-jinja2 \
+    python3-markdown-it-py \
+    python3-mdit-py-plugins \
+    python3-pyyaml \
+    python3-sphinx \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.39.5


