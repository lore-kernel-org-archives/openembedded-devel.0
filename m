Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 756B1C5AD4C
	for <webhook@archiver.kernel.org>; Fri, 17 Nov 2023 08:52:02 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.7997.1700211114435657103
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Nov 2023 00:51:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RVNEDqy8;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-9d10f94f70bso231676866b.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Nov 2023 00:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700211113; x=1700815913; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CNV56fkFwnQBU2XeJ2L6tqjg3PJAZNXmZDV0Jvzq+KA=;
        b=RVNEDqy8zStSnCN9jRyvSh/JV7WS1ipV2E5/dePHlcqhQZJcHwIzEPACK1q+Ji0X/w
         fi3N38O5MGgJ6atxbO+QKHBfDTCmkMn0KjUqCwgSmHlo9T5ZwabJKp9NmZuFO97pIXvg
         bhRdjDvMTaI7PYafsXO5fow5yzRhHUOIX0rvl6Q+NeFdENtXjPVs8BR4nWIdsibWhlLu
         X7C7kaYXVFsHbe8gtE+OQrGQpMciqd6EvL/DD7+VE+NDx64kFUHTnFxD7+gj1ovesp0F
         ObHBYGlAjVxDDxMhU4m+MZmsC49feW+df5LmGDNlq69W6weHOcWcJI2HNbRbt4kJ+nHr
         VwIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700211113; x=1700815913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CNV56fkFwnQBU2XeJ2L6tqjg3PJAZNXmZDV0Jvzq+KA=;
        b=gRhHn4dZ7vI0Zc9/ERpgJgIO8DRcYoQNL4EjxyOQlVkzkJ7dYJnfMxTbjQKPn+xDsb
         uYWaDXGNsJXHBEvQ6qI12fPlGH5+kctlZcm/mI5yAQjc2HtIdP35AbWiw2GrACcu4gX+
         kaVVw9i8pmR4GJhVwEUyrU0AmQLl2ZjABGvGWnta1YpgkeE40u9Wfz18VGAQXl+D+qEV
         CRqYlm+I3Dap6d5tgWivI6R/GHvVhetp/ec2r2oVWeL2ODM8yBF134MTDVTotss4XQcy
         CHmbO5pQAdfTjzZVmNfLoJbQPv0UtBbNe+Qgxi1U9LiZa4CaHADAw5Koag5dyt70dsbg
         phjg==
X-Gm-Message-State: AOJu0YzQeoKGiTTChSsqdnn8z68PfISJRcqv7a5o4fqWo0fuQwKPOXc5
	6IQW3dR87ZHPXSYqMqaI4orUN/40Q7I=
X-Google-Smtp-Source: AGHT+IG0RcANfCUecSOKkWWulqgIHi4pk4qC0GCPzydDpQ3t3fU/YE9qT4zMB9tymzvtO9PdIDKFSA==
X-Received: by 2002:a17:907:1c9b:b0:9e7:c9e3:d63d with SMTP id nb27-20020a1709071c9b00b009e7c9e3d63dmr17789793ejc.7.1700211112949;
        Fri, 17 Nov 2023 00:51:52 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id s27-20020a170906169b00b009b29553b648sm540966ejd.206.2023.11.17.00.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 00:51:52 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH 4/8] fluentbit: drop ${PE}, ${PR} from /usr/src/debug paths
Date: Fri, 17 Nov 2023 09:51:39 +0100
Message-ID: <20231117085143.3813216-4-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231117085143.3813216-1-martin.jansa@gmail.com>
References: <20231117085143.3813216-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Nov 2023 08:52:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106853

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta-oe/recipes-extended/fluentbit/fluentbit_1.9.7.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit_1.9.7.bb b/meta-oe/recipes-extended/fluentbit/fluentbit_1.9.7.bb
index 26238e51f1..fc06095475 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit_1.9.7.bb
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit_1.9.7.bb
@@ -45,7 +45,7 @@ DEPENDS:append:libc-musl = " fts "
 
 # flex hardcodes the input file in #line directives leading to TMPDIR contamination of debug sources.
 do_compile:append() {
-    find ${B} -name '*.c' -or -name '*.h' | xargs sed -i -e 's|${TMPDIR}|/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/|g'
+    find ${B} -name '*.c' -or -name '*.h' | xargs sed -i -e 's|${TMPDIR}|${TARGET_DBGSRC_DIR}/|g'
 }
 
 PACKAGECONFIG ?= "yaml"
@@ -88,5 +88,5 @@ inherit cmake systemd pkgconfig
 
 SYSTEMD_SERVICE:${PN} = "td-agent-bit.service"
 
-EXTRA_OECMAKE += "-DCMAKE_DEBUG_SRCDIR=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/"
+EXTRA_OECMAKE += "-DCMAKE_DEBUG_SRCDIR=${TARGET_DBGSRC_DIR}/"
 TARGET_CC_ARCH += " ${SELECTED_OPTIMIZATION}"
-- 
2.42.1


