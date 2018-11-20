Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
	[209.85.214.170])
	by mail.openembedded.org (Postfix) with ESMTP id 78DB16B8AC
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Nov 2018 20:38:23 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id t13so1970008ply.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Nov 2018 12:38:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=jM/BXEvRpHhhdnbIJPD8Xqd8n3tJJvElaz4D5fnfNR4=;
	b=RdvbJUwz8kgYqid01q6fsDaO3GC5G2EZSdv6vUQTF/uv0xtpAsmAEIvOYC8a6SDjP1
	XrJtd35ZxhoX1gvsZRukiLFhGdG5mnBhQwArInHD4dux0MZoNDxuQqXTRYkVLe/VKpKZ
	D7hG50TR271wvusJzISF1vINoV2PweGH7gK4wvtXAAVynxmiqDmAD0DYz3TpHQp7lss1
	4zN1Z59R371JeR3GporvM5vKfC0g4je7SdBx2DCrqAeS29FerKdXBqYdAAR7fLlGQa45
	+iC+R/bmatTcPF7rtwM2cJIrHOj9pGKyXwWLF3/2hCCX/fPXv+jmH90YiCzi+AjmtITn
	jWYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=jM/BXEvRpHhhdnbIJPD8Xqd8n3tJJvElaz4D5fnfNR4=;
	b=lxio2nZhPubz0Lk5nXi+OGeGxHMo2UydqXqs1F60Jk5SUH7jgIDyimId0nUFRCvk3M
	T5nBwAHYc7hqtKwBXEw4mvI1XOGbND1cCG/5m3r3k0eJ3vyQ8YkZ3dyEnwu00mfEncf2
	4FVmut1kbOM7/nxeOtmn5BEz0GhKoCII7PULSAd3MRnj3+bkxSMXzF7kpr99SIF6bKVK
	FTB04rfE4sQfDYdHIq2PWb1srldmq/0B2/xySHrqSjvNb+ydSmlYqGz+8chkRdCx8ImL
	AhgzCscX4h9L+ppoXYWU84z0DfL3W9PGyYcncYFgHbZRDh21DnngMadNX2SrrGrYYkRs
	wPjA==
X-Gm-Message-State: AA+aEWYadDG6ZQpjaw19UpXa4Yza4OITMeGOfcOSzD06yJrSTH12WseE
	n+lTTiqrPRYM6z3zH6aU2gf3V3svV24=
X-Google-Smtp-Source: AFSGD/VJiZN5xo5G530lMyFqBz4lhNvHib4TCk/3c5qmxcWMfvII1hwxRL4NBDWVhlFyNxHggIkbJA==
X-Received: by 2002:a17:902:6801:: with SMTP id
	h1-v6mr3735970plk.177.1542746304223; 
	Tue, 20 Nov 2018 12:38:24 -0800 (PST)
Received: from localhost.localdomain ([2601:646:877f:9499::26ab])
	by smtp.gmail.com with ESMTPSA id
	x26sm24325479pfn.50.2018.11.20.12.38.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 20 Nov 2018 12:38:23 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 20 Nov 2018 12:38:06 -0800
Message-Id: <20181120203814.11500-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181120203814.11500-1-raj.khem@gmail.com>
References: <20181120203814.11500-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 02/10] sblim-sfc-common: use official SPDX license
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 20 Nov 2018 20:38:23 -0000
Content-Transfer-Encoding: 8bit

From: Armin Kuster <akuster808@gmail.com>

WARNING: sblim-sfc-common-1.0.1-r0 do_populate_lic: sblim-sfc-common: No generic license file exists for: EPL in any provider

it is  EPL-1.0

Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-extended/sblim-sfc-common/sblim-sfc-common_1.0.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/sblim-sfc-common/sblim-sfc-common_1.0.1.bb b/meta-oe/recipes-extended/sblim-sfc-common/sblim-sfc-common_1.0.1.bb
index 2a9b4bb883..4e90215c0e 100644
--- a/meta-oe/recipes-extended/sblim-sfc-common/sblim-sfc-common_1.0.1.bb
+++ b/meta-oe/recipes-extended/sblim-sfc-common/sblim-sfc-common_1.0.1.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "\
 This package provides a common library for functions shared between Small Footprint CIM Broker (sblim-sfcb) \
 Small Footprint CIM Client (and sblim-sfcc)."
 HOMEPAGE = "http://sourceforge.net/projects/sblim/"
-LICENSE = "EPL"
+LICENSE = "EPL-1.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f300afd598546add034364cd0a533261"
 SECTION = "Development/Libraries"
 
-- 
2.19.1


