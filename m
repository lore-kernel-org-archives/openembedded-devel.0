Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
	[209.85.215.180])
	by mail.openembedded.org (Postfix) with ESMTP id 152367F2C0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jan 2020 00:48:49 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id r11so10799273pgf.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jan 2020 16:48:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=+kwIfNC8HHEODHQ3XfCZ0qTJy3XzNDxszV2fc0nXvSI=;
	b=NXHdXt89nghLPTpu65i9J4QUMHBBG6O5Gdwydmti5s8QyikG0rLy9BvxQUlQQY/spp
	894p8xA1HkhnVwEHhC/+QkALILIsRwm9ocbUDZhekWPVbNrkph6LLQ8YOy2uNIPbDqos
	nw9jgpXnFksS4vqgIDCoxWCxgHzlwV+0IG6SRgXFf+ovhHvHK5iev2RdZzmfAccyW0jh
	l9M6J7IRw/3qKLl9lxOLDfBdwwq2jE+Of1voMhWGEmf97bTHPE/U0RQ1dd7U7YnKdZjO
	8seWurX80W1vy28065gPSi3tOIonyujj07p8vONVlNAr7QQrBlmiwni/zNvJeTsUmshD
	Qkfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=+kwIfNC8HHEODHQ3XfCZ0qTJy3XzNDxszV2fc0nXvSI=;
	b=ZmcnReZ/DhvyzwHJItMhxEnWzXmmJnL0O54E7YwEKw6zZ86tZbpYXldGBCqk09bvvI
	dG0dsj4kfxYfG0pacGWrveghXum7CdE2bdxz9U6ze+RtKw/Omn/bGs3wpleEZqHoyWhG
	IesnnUovexSSXnT8UackPMI1oBkxf3VOXlSABuxKgKZbWMfblQ+yQOgqw1D+WTnf1GA/
	QblJradv4ACfayD8+qqfW6jTTxIZwZYz05QMdxSyxJkBWshjJYgGVzLnUHLYQa/C6UvV
	9toDdCeK1budW7F+hYkJLnvsF+PqeyNOGOV54xejW8fRSqoshjKle5/wnG9ywM+pVs0C
	MKwA==
X-Gm-Message-State: APjAAAVGGoNKsKe3jfIaHsHWvTbrFUhMB/uIAWYxOCK+r6kFQxkwFTmW
	AXtJ7EmmhNOPF/PcrDCIM13/gpQXAZA=
X-Google-Smtp-Source: APXvYqzSEztdxlH/CClcOR6JkA3MgN01fL4/TnXrwyPJxV8A1o7ES7Ud2EcG+SjyeC0/JBE76vZLmw==
X-Received: by 2002:aa7:84c6:: with SMTP id x6mr250291pfn.181.1579222130875;
	Thu, 16 Jan 2020 16:48:50 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e77a])
	by smtp.gmail.com with ESMTPSA id
	11sm27698372pfz.25.2020.01.16.16.48.50
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 16 Jan 2020 16:48:50 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Jan 2020 16:48:49 -0800
Message-Id: <20200117004849.3444434-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200117004849.3444434-1-raj.khem@gmail.com>
References: <20200117004849.3444434-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH v2] ssiapi: Needs boost/ppc support
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
X-List-Received-Date: Fri, 17 Jan 2020 00:48:50 -0000
Content-Transfer-Encoding: 8bit

Internal boost headers are missing ppc support
ssiapi.1.3.0/lib/boost/smart_ptr/detail/sp_counted_base.hpp:66:11: fatal error: boost/smart_ptr/detail/sp_counted_base_gcc_ppc.hpp: No such file or directory

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Also remove from packagegroup-meta-oe-support

 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 1 +
 meta-oe/recipes-support/ssiapi/ssiapi_1.3.0.bb             | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 31c3f4e95d..1be9370f5f 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -263,6 +263,7 @@ RDEPENDS_packagegroup-meta-oe-support_remove_arm ="numactl"
 RDEPENDS_packagegroup-meta-oe-support_remove_mipsarch = "gperftools"
 RDEPENDS_packagegroup-meta-oe-support_remove_riscv64 = "uim"
 RDEPENDS_packagegroup-meta-oe-support_remove_riscv32 = "uim"
+RDEPENDS_packagegroup-meta-oe-support_remove_powerpc = "ssiapi"
 
 RDEPENDS_packagegroup-meta-oe-support-egl ="\
     freerdp libnice opencv \
diff --git a/meta-oe/recipes-support/ssiapi/ssiapi_1.3.0.bb b/meta-oe/recipes-support/ssiapi/ssiapi_1.3.0.bb
index eb086817ef..ce46cf5892 100644
--- a/meta-oe/recipes-support/ssiapi/ssiapi_1.3.0.bb
+++ b/meta-oe/recipes-support/ssiapi/ssiapi_1.3.0.bb
@@ -34,3 +34,5 @@ do_configure_prepend(){
 }
 
 RDEPENDS_${PN} += "mdadm"
+
+COMPATIBLE_HOST_powerpc = 'null'
-- 
2.25.0


