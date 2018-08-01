Return-Path: <39X5hWwgJAFo5EALJAQRO2QEG.4GE@flex--dmitriyz.bounces.google.com>
Received: from mail-it0-f73.google.com (mail-it0-f73.google.com
	[209.85.214.73])
	by mail.openembedded.org (Postfix) with ESMTP id 1F35D75421
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Aug 2018 09:35:48 +0000 (UTC)
Received: by mail-it0-f73.google.com with SMTP id w132-v6so5485996ita.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Aug 2018 02:35:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
	bh=RZksRceMfVzGNTpjOsygUCWtBpxEdyUFO2QN4NwU5xU=;
	b=Aj/pVZUXQoZZvoN7Nb2z5yIj3OwZQR9u08qOrqo46BgUYGPiuikv5iOEW8drhJrToZ
	Z6vR7cJjahpr5F06sng4151OwyQF03p+xW22fe6YBbK9DOgetdZogQKhc7Pw0jdcQk/w
	jwJ9nuMxGyMi3enkZ6oLH4rdHrLGDUnayWjbuV174jPEykuGK9kcoTsgrjhBhJE3gjCY
	DTQHkFUQV06lwm+6Rejxh66UEPZw3Ur401af1vUjh3F/x8tlzTWt74pLvSEnyEnBrdZQ
	DijJ8qtuVQCIlWQHT5r4lkNxe16njZmmIe3iVrm6IckVB1Jwhe9hxQ/aWCXC8NJAsqkn
	p6MQ==
X-Gm-Message-State: AOUpUlHyOH+OxUpQjHa9sljb5tPuBOlCGv09bGE9UQ8kVkK2kA87sdQv
	sD4g1m+PfzvTTWAwrXdsNasmpAaGhOoIzY0tj76Lo6Ok0iwDITyXizp1j3KneDoD0ub0uxBAXAY
	5aI1MToChYQe/APsgjsdiZ9rMFi0XTQFXAu8o7nE3y1RWNehtLcwvEQ4f9/LwCUTxFlmqL4wUOt
	prdbiW7GI34tZ+7O0=
X-Google-Smtp-Source: AAOMgpeAJye8+vcGGWJjV7lmFdJvfwBIwYf60nLUtAVSKFAUd/eko/XVWRf/VJs0CF2QbCAkZgwN1C2cUhc+vg==
X-Received: by 2002:a24:b045:: with SMTP id b5-v6mr3125216itj.35.1533116149119;
	Wed, 01 Aug 2018 02:35:49 -0700 (PDT)
Date: Wed,  1 Aug 2018 02:35:44 -0700
Message-Id: <20180801093544.70883-1-dmitriyz@waymo.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.18.0.345.g5c9ce644c3-goog
From: Dima Zavin <dmitriyz@waymo.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] numactl: remove perl runtime dependency
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
X-List-Received-Date: Wed, 01 Aug 2018 09:35:48 -0000
Content-Type: text/plain; charset="UTF-8"

numactl has not been a perl script for a long time.

Signed-off-by: Dima Zavin <dmitriyz@waymo.com>
---
 meta-oe/recipes-support/numactl/numactl_git.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-support/numactl/numactl_git.bb b/meta-oe/recipes-support/numactl/numactl_git.bb
index b9cbcf09d..834691b7e 100644
--- a/meta-oe/recipes-support/numactl/numactl_git.bb
+++ b/meta-oe/recipes-support/numactl/numactl_git.bb
@@ -5,7 +5,6 @@ to run other programs with a specific NUMA policy and a libnuma to do \
 allocations with NUMA policy in applications."
 LICENSE = "GPL-2.0 & LGPL-2.1"
 SECTION = "apps"
-RDEPENDS_${PN} = "perl"
 
 inherit autotools-brokensep ptest
 
-- 
2.18.0.345.g5c9ce644c3-goog


