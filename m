Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
	[209.85.210.177])
	by mail.openembedded.org (Postfix) with ESMTP id A8CE57EEAD
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jul 2019 14:41:46 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id y15so16142675pfn.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jul 2019 07:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=mwmw3oYaA7H1G9YY1WrLrkSLRBAXZWs1164xr2lAbhI=;
	b=Ia9Fjnn6m58vIj0+183xzh19Hg0taWZRphddeuGwR6Ey2VHHpiOUQ8y1xKricTPq4l
	PriL+KhhFRbayruCxLiadrFkkWJBv1MDskWxl0riKOSz0wzO/8hUMCziSt/sKXDwThJO
	0A51xDDwlQcVnEPxOCaId4EDCqIRAWAWyp/NnoBPeBF0vyeQDeZk3fEddDb2oYb4A7na
	b+fnvYy0/4o7aZeIz5KwG/PAz7VCSC/YAdSoY8VTt4xUBHK9nMhLXs4c0ifBK1svps6b
	3xaS8mwf6ErTNrfx5ivtOtO5Ppvys2efulB+gpB+SpZukz43nfMdta2lnuWvOkwyN8Vy
	zP0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=mwmw3oYaA7H1G9YY1WrLrkSLRBAXZWs1164xr2lAbhI=;
	b=ZbslUXPkjdLj9e/pZ5H1DSkZvIUvOGK6gXbikQY1DE9RwUHgn+eeclvlb/qpQwh2/J
	diY2WXk/XfHEULh2B2+gR/xzl9AELiPvoRtoy+pfLrisR4zAaEka8Hy7fi06f8kkBGbv
	BAiNiMrHWx3FZTcn93IPJ0A7LmPcvz7hzbHd7Zds2PDWfuzYf9UGNJFNMDvWUM2/hMwT
	tMM7xd3xxD+CgVsue5mdV1dNk7cX3BM3fHnRj1LvtIN0eyX7lB7pCUJlzMuvTKQgL5n3
	xBCzFaM07C9L5KuwSfEOcQcG9WITgi1SxTMrr9YMlkAwdpG01iVN9p0FwVhwba4oOcfv
	P1qQ==
X-Gm-Message-State: APjAAAW3A0/bNZ4ttzquH9a2ie+JLeCsAckSyxD1esjiqWNeLFAQO8Bf
	apE0ZJ1+EsenC6VjTKdh/4UYMp1S
X-Google-Smtp-Source: APXvYqxiKVDjuPOEn8SR9c9xsMfjVUEdGrYxEgi1bj1i581BHrOntql8iGS/V5hkgsPzqVUWL0ayzw==
X-Received: by 2002:a17:90a:3401:: with SMTP id
	o1mr71331667pjb.7.1563720107713; 
	Sun, 21 Jul 2019 07:41:47 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:bd4d:a6f4:da99:27b4])
	by smtp.gmail.com with ESMTPSA id
	t9sm37392604pji.18.2019.07.21.07.41.47
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 21 Jul 2019 07:41:47 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 21 Jul 2019 07:41:35 -0700
Message-Id: <e48b3a9fbb2a96d5230821fa1dae6a547f6c39c4.1563719997.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1563719996.git.akuster808@gmail.com>
References: <cover.1563719996.git.akuster808@gmail.com>
Subject: [warrior] 7/8] SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS add lsb, busybox and util-linux for phoronix-test-suite
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
X-List-Received-Date: Sun, 21 Jul 2019 14:41:46 -0000

From: Martin Jansa <martin.jansa@gmail.com>

* phoronix-test-suite is allarch, but util-linux and lsb aren't
   === Comparing signatures for task do_package_write_ipk.sigdata between qemux86 and qemux86copy ===
  ERROR: phoronix-test-suite different signature for task do_package_write_ipk.sigdata between qemux86 and qemux86copy
  Hash for dependent task lsb/lsb_5.0.bb.do_packagedata changed from 7baca400e354b600fe967ea615032052 to 67888a6c7511339a873b547745287ef2

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/conf/layer.conf | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index bc90390..672e1a0 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -49,6 +49,9 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   phoronix-test-suite->bash \
   phoronix-test-suite->python \
   phoronix-test-suite->php \
+  phoronix-test-suite->lsb \
+  phoronix-test-suite->util-linux \
+  phoronix-test-suite->busybox \
 "
 
 # ttf.inc inherits fontcache which adds fontconfig-utils to RDEPENDS
-- 
2.7.4


