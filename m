Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9099C44501
	for <webhook@archiver.kernel.org>; Thu, 16 Jul 2026 13:01:13 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12152.1784206295337361989
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Jul 2026 05:51:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=Z39Ifb1K;
 spf=pass (domain: baylibre.com, ip: 209.85.219.47, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-9063b380982so39248876d6.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Jul 2026 05:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784206294; x=1784811094; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=H0SZJ4IE8SS/E/ySduCqNyFJq06aIpN6ZWZHGY4obmg=;
        b=Z39Ifb1KfIlEQ2jCtxcVHyBxgUXWY20NVVNw6x+G1fDoSUI6ARzROohc8cpPvn9+l7
         d0TXLRs0fqzsgVttMq6eQaJF+fDJLRXbcGKupDL8gkj2NOEfMiRVFiwYpJcwgQ+GlAEX
         B6XJMOJCBNELBooMkHKPH/mYaSN0oaxKhjhb3qYgKuFLvBuRRzziKdJdaNc7h7U1hWa3
         o+vcbkecTdgBc/vDOVhV6h1AfchfP6RQQV9GjqW+rMKxBmYNq2PuJqBul6IQeug18wfN
         GoCx7KUT/FcPLPlohUtwI949QKVQfy8RqVX/IO1xBKFFpMT+QEr/gKOdyVP/IdJpenSw
         M8HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784206294; x=1784811094;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=H0SZJ4IE8SS/E/ySduCqNyFJq06aIpN6ZWZHGY4obmg=;
        b=YeB2ztT6foXbz81miSmOJDcpvDvWmllwryTykK+Fn5BJ3pqgnUzBDnOoX1wtoDhqrB
         ss0V/LEVZAGVW/4spZlW7iJFPizdKpawPlIkWJ+hbSI8t4w966BVKMZQ7TWs3jjd8o/X
         dCrl2+dgFcmTsIg7VwMSByxfy8dxOlSvOY0035tem/h5uncbeW3JCII4MPRvEV80i0z/
         k+mNba8oklSwvmeVL4AiIulw/P2N0Jggno5ikNgbn0KKmMIMbxPTBUEjCcEEpA8jJpN8
         Mfdkrqpe5JO+dqY6CYrbtuKlaMEeqJO23Hcbg/l8vKeDagjQI0k18i1Qf+1yR6zN7Uf6
         IWew==
X-Gm-Message-State: AOJu0Yxu5ogR1YpVP/bpkH7UMYznGbd4wkSXZMOyNeXqVgziotdlqNDI
	rrJ3f4QOinvjdvClSpDD5Wxvv5Rc3r4jFusaslPcQ+dZlHCKH8bXmXMIK+rPLFIAdzrtBu89+5/
	EX1MJyj0=
X-Gm-Gg: AfdE7cnXBXTsjTOdq/DbfSjWGQH5qOfSKKoi13gvaaG/bn40k4xW2/BjLuyAHqXPvan
	sGdCPuMWL3aNp/QXdoi2ObQqcMGRqQUmFp2XGssvrmdYGajQSyKR73ESyDDtzzqaHpE3BeP9g6l
	A8v3XRnGp4FmWgDHWVmDPnCYxvlB4izmnXNRH4nd7JZ6BYVVP5TVXh851vxzgPAFUaWxwhynFi5
	aY6HkzyePPVOZIdQmf+YkkcFgr5CgWbAEMdCAT36R7CWZVa5X+aVK8Di7yQ7btCIxOyqRKtci6s
	iXU7Ree7n08JRff00yVxeOymw8vk1WFZ3e+T3jkilQw4LUoJStKgcspWaNTbv4DD5SUH74jOYoI
	U4ZDjR9tJpwMDXljQG7cVbn/YZXm9+kr1SSUYpvtAsWncUAbWyWhf+c9fM6y14OEjJ2U032SGSl
	6V5QfJ7Q==
X-Received: by 2002:a05:6214:2b96:b0:8f0:65c7:315d with SMTP id 6a1803df08f44-90758d322admr73941276d6.24.1784206294224;
        Thu, 16 Jul 2026 05:51:34 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90749b913absm79872286d6.10.2026.07.16.05.51.33
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 05:51:33 -0700 (PDT)
From: "Trevor Gamblin" <tgamblin@baylibre.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH] python3-ukkonen: use python_setuptools_build_meta
Date: Thu, 16 Jul 2026 08:51:31 -0400
Message-ID: <20260716125131.909814-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Jul 2026 13:01:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128232

Use the newer setuptools build class to avoid an AttributeError thrown
after warnings about setuptools and related build modules:

|/home/tgamblin/workspace/ypbuilds/oe-nodistro-master-patchtest/build/tmp/work/x86-64-v3-oe-linux/python3-ukkonen/1.1.0/recipe-sysroot-native/usr/lib/python3.14/site-packages/setuptools/__init__.py:92: _DeprecatedInstaller: setuptools.installer and fetch_build_eggs are deprecated.
|!!
|
|        ********************************************************************************
|        Requirements should be satisfied by a PEP 517 installer.
|        If you are using pip, you can try `pip install --use-pep517`.
|
|        This deprecation is overdue, please update your project and remove deprecated
|        calls to avoid build errors in the future.
|        ********************************************************************************
|
|!!

...

|  File "/home/tgamblin/workspace/ypbuilds/oe-nodistro-master-patchtest/build/tmp/work/x86-64-v3-oe-linux/python3-ukkonen/1.1.0/recipe-sysroot-native/usr/lib/python3.14/site-packages/packaging/utils.py", line 96, in canonicalize_name
|    value = name.lower().replace("_", "-").replace(".", "-")
|            ^^^^^^^^^^
|AttributeError: 'NoneType' object has no attribute 'lower'

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta-python/recipes-devtools/python/python3-ukkonen_1.1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-ukkonen_1.1.0.bb b/meta-python/recipes-devtools/python/python3-ukkonen_1.1.0.bb
index 8fc5af1ef7..fe25eda63e 100644
--- a/meta-python/recipes-devtools/python/python3-ukkonen_1.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ukkonen_1.1.0.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=7e49a187324d5a1a6c4ba2b9c3fd4033"
 
 PYPI_PACKAGE = "ukkonen"
 
-inherit setuptools3
+inherit python_setuptools_build_meta
 
 SRC_URI += "git://github.com/asottile/ukkonen;protocol=https;branch=main;tag=v${PV}"
 SRCREV = "5fa9858f0997927d9f9c1794e1741fe8dbd4c1e8"
-- 
2.55.0


