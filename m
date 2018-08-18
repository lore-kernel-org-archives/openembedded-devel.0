Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id BE1FB79241
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Aug 2018 15:12:21 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id h15-v6so9426441wrs.7
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Aug 2018 08:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=3z4g94jwLSbWsC6PGcszmKAuEzTiMWe0pZEDBf9SrJg=;
	b=p+IpMx4/YLnjNpGfJJFgbpuaJCOBl2vmb+f2PO60bw1gEnZJAUEKqURsetyzHTv5j6
	ZrdkNl6kS7X8Feo9g+Fz8ykwc7ob5x3/HhYE+ef4S7CTOzciMPBDWDbta0elOCVnnhPJ
	DRSD+nb1rm1Jb1FVYcBL7OmPSUtmXkZtTnZ8ScT4cZ/wLIlq8LgFYYUZCeygQccnOXKs
	cnkIjD1yJpKXXvhvet3rK7Y/yNawekymrdAAzHT1Znx6Na6MHFb+NUK5RnUi9/M1Dm/+
	51x1slWcjoY10Wahyyqey7GXId3YYXPtPVvJUw3IpCPJW/1/7YLVcX6TegEZFhD28MaS
	AdMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=3z4g94jwLSbWsC6PGcszmKAuEzTiMWe0pZEDBf9SrJg=;
	b=po09FhKKWwdO0ZBWny0zDQCRtmfO3bjKlj7eYNlkiVqSXdV78TVgW4EtkahQPMW90Z
	1XvNS77Qzp4JJsCGRu/o2wnyQqTwfYsolIQvqL2Hv4e9sPcnG/dNr6/aV8c+vTQTFlGq
	5zja7njhfnvDmIh0ui6W9J92F3uM/2lpMvJTXDQkYdH1KNzAiRM1lsY5EZsM5WgZ3VrK
	olXLalLdkUQ18McxZTfdE3U+SUOeVmYcfpcobOq6eYjPf7qNUPmYOp5zlOKcY+zKrVuY
	dGNdBKMZeNQk8Ef29XuqPPkkvXVnAuoSZaVUnQxK7LVtFPABTxhmHGbdlr3SCIS5jmQs
	0DOQ==
X-Gm-Message-State: AOUpUlH1VNlNBG8GE9Xl/l25vUw0T59KDga4kYLksSI2/iwbkVvY1SP0
	ukd7OkCU4IDK3wjR8i/WRznHn6D1
X-Google-Smtp-Source: AA+uWPyfFtQvd2KIvOlHoN2OQyHcL1g+A9BFT3pa2o3znkGOC49dl9lR1Baw9SueaNuec4/3Le/GHw==
X-Received: by 2002:adf:c08c:: with SMTP id
	d12-v6mr24376370wrf.268.1534605142326; 
	Sat, 18 Aug 2018 08:12:22 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	200-v6sm12838192wmv.6.2018.08.18.08.12.21
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 18 Aug 2018 08:12:21 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 18 Aug 2018 15:12:18 +0000
Message-Id: <20180818151218.6980-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180818151218.6980-1-Martin.Jansa@gmail.com>
References: <20180818151218.6980-1-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/2] mce-inject: add dependency on bison-native
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
X-List-Received-Date: Sat, 18 Aug 2018 15:12:22 -0000

* fixes:
NOTE: make -j 24 destdir=mce-inject/git-r0/image
Makefile:42: .depend: No such file or directory
bison -d mce.y
bison -d mce.y
make: bison: Command not found
Makefile:20: recipe for target 'mce.tab.h' failed
make: *** [mce.tab.h] Error 127

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/mcelog/mce-inject_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/mcelog/mce-inject_git.bb b/meta-oe/recipes-support/mcelog/mce-inject_git.bb
index 86d50a2bef..cc33cbaf28 100644
--- a/meta-oe/recipes-support/mcelog/mce-inject_git.bb
+++ b/meta-oe/recipes-support/mcelog/mce-inject_git.bb
@@ -10,6 +10,8 @@ SRCREV = "4cbe46321b4a81365ff3aafafe63967264dbfec5"
 
 UPSTREAM_CHECK_COMMITS = "1"
 
+DEPENDS = "bison-native"
+
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://README;beginline=30;md5=94c18755082a2da9c9cf97cba3ad47d6"
 
-- 
2.17.1


