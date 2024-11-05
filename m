Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 123DFD2C10F
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 14:37:01 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web10.19604.1730817410951806466
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 06:36:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hWsd7vPB;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6ea11b32ab4so36753127b3.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 06:36:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730817410; x=1731422210; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h701cJeR2nJyjirhzEOd2svUc1QpMc+pwHm/eymkJ7E=;
        b=hWsd7vPBlky+jOvbsdMU/xbOqFFtdLiVMO47JpgWmQICZ8l2WeUDMBkNL3E81nCqkP
         V9qZUS6L0CIRtU4g+IrI+agfwHC7HcOA/RoB9M7dFUcI0RF08D7tWqBulYaWFr4UUbcK
         FTSJxENiyvbygR5yEO8Shc4wrqyhyaFFRUj3/7MKaPzNen30nKKbO4zib6OXp/IeCxdW
         GaClTl/o/40/3dV5vWAPRODfhEb/P1xwIrbrNlbT4+vd6X0IBkVMKh/XotSyJfe3zgKa
         IzTzVhQNJ2PbFSzHL3wc9rOIdtfyC+L6ML6dIosB+IQzCCsHYZ068iE/i80RlAtItm7U
         zfSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817410; x=1731422210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h701cJeR2nJyjirhzEOd2svUc1QpMc+pwHm/eymkJ7E=;
        b=rIRcGifUDF3fnFCXElVoNj5rtaaEPPBZ42DMa1GDu7LsHBodn0FsFCB6vfGLbe4w85
         KwpBE/4a84wNYoggUXNWc4+FnZO+iy7WdNc5SfwJG5zdbKGn8IG8BtC2OHoes2rTF43G
         wsHI2rGO5eDTR6poy3zgnxUr/FKKewyRMm3O6WbKpJ1byaRPC32w1/oqY7k60QjGikLS
         OR2qA/gVf+2QpGB962+DyIIzsFZ1iyVCRyVE54Nkz5rVggGGYESf6mVCXdv7JNBVITbx
         9CU2GlI0IZSS5d3UY5FhA8aajgumjfp9p+9wZFUq+YIav3ekov6Osz609TOql+FiPlfg
         6fgg==
X-Gm-Message-State: AOJu0Yz5Udey/mBXGHgl/g7SKgZ2GBYcNxQX+pLXn0CS/1hwLZBA7nTV
	T5siV0aaEc0+j6RJMegws0Tm3CHdQdqF8l4kduteUretRxv1KIJGgurg8A==
X-Google-Smtp-Source: AGHT+IHD2oR1O5ys1sQ0LIoJIi4GSqfdeF1jvZvM07xESgFCvtIcqyytGMPYOhBHVa+xnY6JxZmPJA==
X-Received: by 2002:a05:690c:6c11:b0:6e9:c117:760b with SMTP id 00721157ae682-6ea557df6d0mr158927747b3.5.1730817410044;
        Tue, 05 Nov 2024 06:36:50 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000::29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c8723esm22495977b3.126.2024.11.05.06.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 06:36:49 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 24/90] python3-xmlschema: upgrade 3.3.2 -> 3.4.1
Date: Tue,  5 Nov 2024 09:34:49 -0500
Message-ID: <20241105143638.2301245-25-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105143638.2301245-1-akuster808@gmail.com>
References: <20241105143638.2301245-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 14:37:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113441

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Fix failing URL normalization tests
- Disable protocols checking with elementpath v4.5.0
- Extended ModelVisitor to make it usable as an helper class for generating content

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{python3-xmlschema_3.3.2.bb => python3-xmlschema_3.4.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-xmlschema_3.3.2.bb => python3-xmlschema_3.4.1.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-xmlschema_3.3.2.bb b/meta-python/recipes-devtools/python/python3-xmlschema_3.4.1.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-xmlschema_3.3.2.bb
rename to meta-python/recipes-devtools/python/python3-xmlschema_3.4.1.bb
index 33244d98e5..845735c9ba 100644
--- a/meta-python/recipes-devtools/python/python3-xmlschema_3.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-xmlschema_3.4.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/sissaschool/xmlschema"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=26aa26eda991a3a2b61c11b62d3fda65"
 
-SRC_URI[sha256sum] = "a2f021f21d0b5ab371e9bcb5a1d5c34b9ba2c74ad3e32854474c4159bf94e158"
+SRC_URI[sha256sum] = "4f69eca6f2c446b06c74acd958e7d6613487c253d959a3b75078dfcc880b80ff"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


