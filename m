Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 705BA780CE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Jul 2017 05:40:42 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id u62so9393679pgb.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Jul 2017 22:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Ao72C2I9nig5wD2/csojUj16FVXdXkKt6m+wZhI1o9s=;
	b=Pg5HNpmoeqbZN50ag6VZ6rNRl6bS21iB4gqpNzTuxSlrd8TccuJTQxOTDLpe0qMlfA
	uDcstcUositxIyc7aMx7QNnGEWca5A/T/zhX7k73vIQb+pSvy/Spr7EwUpeAqOSKLjH3
	/1BjOCPNN9jRH4PY+mgAgSF8WpxHvO86yyQF0psmgwItfTYvr8Gg3HXf7oj2WbJ96yb6
	MZDegUNa/R6MwZqWn7Tin7oYYA9QXUQWeK+PEm3WS07smHwplt+LiK9bXUyBkKEgQ3i5
	3WoCOc0Ww7QduojdYeLknx6+0SCmMUX5hcG+4m8ouM32hsqZntMPJCGd8NcKQrmDW3kb
	3ULA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Ao72C2I9nig5wD2/csojUj16FVXdXkKt6m+wZhI1o9s=;
	b=RjYE3TMsWBmqKysOAkRIKcrKQ4zU+50Sgwnjj+xpxwJUaMqrZcescrDZlXEQxxcq2+
	z25NaiYAv7LSKljES1IJQKrL65NtgevDjTnSrWUlb4rQ7YResF6v2JquGTPW0k0YK+YE
	8bSpTDyBPOX7Pa59IM1bhcM2bedElnr/w7ClySHxj8YhyOF13vuxrHdX8dpEWhwdiKFZ
	vxwQjjXINSHmVOrJe0Q8Q38spw8vhSZEpf+k8Xal/ylPrY3qJnybfD1NJh81p4P905J/
	ph7ZKvvvG+ZY+QTf0xCfxilrUWcNi02Y2klZQ1u1KLR+jS9MxKef9pPyDDIVeFlgi+M2
	/cGQ==
X-Gm-Message-State: AIVw1132BlgmQLYPHAKANdsIS7Mj1ZwBdLKtfGEjbxgWoXFxUZGD57Dw
	FrPIbaZa8NZRHP5o
X-Received: by 10.99.104.10 with SMTP id d10mr12890653pgc.186.1500010843798;
	Thu, 13 Jul 2017 22:40:43 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::7028])
	by smtp.gmail.com with ESMTPSA id
	z86sm17519420pfl.40.2017.07.13.22.40.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Jul 2017 22:40:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Jul 2017 22:40:09 -0700
Message-Id: <20170714054013.34458-14-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170714054013.34458-1-raj.khem@gmail.com>
References: <20170714054013.34458-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 14/18] can-utils: Update to tip of master
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
X-List-Received-Date: Fri, 14 Jul 2017 05:40:42 -0000

Fixes build issues with musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/socketcan/can-utils_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/socketcan/can-utils_git.bb b/meta-oe/recipes-extended/socketcan/can-utils_git.bb
index 931e33289..a2d62c366 100644
--- a/meta-oe/recipes-extended/socketcan/can-utils_git.bb
+++ b/meta-oe/recipes-extended/socketcan/can-utils_git.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://include/linux/can.h;endline=43;md5=390a2c9a3c5e3595a0
 DEPENDS = "libsocketcan"
 
 SRC_URI = "git://github.com/linux-can/${BPN}.git;protocol=git;branch=master"
-SRCREV = "67a2bdcd336e6becfa5784742e18c88dbeddc973"
+SRCREV = "4c8fb05cb4d6ddcd67299008db54af423f86fd05"
 
 PV = "0.0+gitr${SRCPV}"
 
-- 
2.13.2


