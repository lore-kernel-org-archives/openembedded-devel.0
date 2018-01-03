Return-Path: <liu.ming50@gmail.com>
Received: from mail-yw0-f195.google.com (mail-yw0-f195.google.com
	[209.85.161.195])
	by mail.openembedded.org (Postfix) with ESMTP id 77C4A77F90
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Jan 2018 01:48:06 +0000 (UTC)
Received: by mail-yw0-f195.google.com with SMTP id w128so92398ywa.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Jan 2018 17:48:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=BpC7nFPiyyiQ+ea2afDyi7+wFZklT4SPAKRbqeJgqOM=;
	b=bM+SwJ38EZwk85t30Rv5gzoMOJlxZ5zHqS5FE3T5wk3awtXAyQV7UgrkLOkf62ppHo
	hpK4G1YPqE9tMmq8LxIm6k+xvdUs4bieV2xf46kKHHsjBuV2fy5xP3m12RljgKy4IXFx
	Ur2ShIbim8Xa1qFABGVbme8AU1lCCy8l3X+MIF+LBEQhRw2HEakA/A/es/m3EN1SSGTI
	eYiAAEsliX95s4bmS8k81+D0WgFKpP1ySnuiiUW8clBQFeD3J3PYisQlOttrYGTtcNC2
	+cgKqzQBbf7wCJ4zSAuOlZn6+Anu85jrLQZXvDAHflDi43wMlE0WRUA7Z8HAPK6OGp3v
	d6VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=BpC7nFPiyyiQ+ea2afDyi7+wFZklT4SPAKRbqeJgqOM=;
	b=huGRfMqO4qkJjFhMk0yzfLSbIHHm1brrigVatbOSWJdm/9G9CuJHK0zkCcyfMzaXRh
	PtCRO9IlZMonX2mn7RIoddI0svMRAgZIFg2zYzEz6Hh7KrTMashS/85Qg/wxzeTig0Jm
	PWypVaNTxA9bVQE6SAy7WltoJkV1shNJCJM3O4QgSvyUjcHrnjY/wfpBh0nzSv0nqBTu
	2sw5Jo70wehtwwRIEfqVs9/ltzMilves6MlbOwAMRzjobFFVJ6/JQPOf4R/bJoteGJUC
	OAfwKisn+8xb/bq6CjJcPe/g/UK+4UMTiN85lCf2fqQd2ebrDo3aP7EeXB7C3vVsUMZk
	N41A==
X-Gm-Message-State: AKGB3mL022akzNByCOLRQawgMB4XQjqCeWeIFqujMUcUs6t9PPlBpvc1
	JCelFGv5E1PoTS0r51+sxw9Nq7Dw
X-Google-Smtp-Source: ACJfBotoPhGgGzR4zNWVqH8f3BFqjJrWsY54tSXKE1uZZ3imF9743rMJqGa/8p9Q5FzoHPccqt/Ntw==
X-Received: by 10.129.67.20 with SMTP id q20mr35071145ywa.329.1514944088293;
	Tue, 02 Jan 2018 17:48:08 -0800 (PST)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([45.77.34.21]) by smtp.gmail.com with ESMTPSA id
	h133sm20457657ywb.52.2018.01.02.17.48.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 02 Jan 2018 17:48:07 -0800 (PST)
From: liu.ming50@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 Jan 2018 02:47:29 +0100
Message-Id: <1514944050-12039-7-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1514944050-12039-1-git-send-email-liu.ming50@gmail.com>
References: <1514944050-12039-1-git-send-email-liu.ming50@gmail.com>
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [meta-java][PATCH 6/7] jamvm: avoid checking x11 distro feature for native build
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
X-List-Received-Date: Wed, 03 Jan 2018 01:48:07 -0000

From: Ming Liu <liu.ming50@gmail.com>

x11 is not a mandatory distro feature for building jamvm-native, so
avoid checking it for native build, or else it would lead parsing
errors.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 recipes-core/jamvm/jamvm.inc    | 3 ++-
 recipes-core/jamvm/jamvm_git.bb | 4 ----
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/recipes-core/jamvm/jamvm.inc b/recipes-core/jamvm/jamvm.inc
index da1ca29..7a6b6b6 100644
--- a/recipes-core/jamvm/jamvm.inc
+++ b/recipes-core/jamvm/jamvm.inc
@@ -15,8 +15,9 @@ RPROVIDES_${PN}_class-native = ""
 
 BBCLASSEXTEND = "native"
 
+inherit java autotools update-alternatives pkgconfig relative_symlinks distro_features_check
 
-inherit java autotools update-alternatives pkgconfig relative_symlinks
+REQUIRED_DISTRO_FEATURES_class-target = "x11"
 
 # This uses 32 bit arm, so force the instruction set to arm, not thumb
 ARM_INSTRUCTION_SET = "arm"
diff --git a/recipes-core/jamvm/jamvm_git.bb b/recipes-core/jamvm/jamvm_git.bb
index 6bbfa52..1762ade 100644
--- a/recipes-core/jamvm/jamvm_git.bb
+++ b/recipes-core/jamvm/jamvm_git.bb
@@ -3,10 +3,6 @@
 
 require jamvm.inc
 
-inherit distro_features_check
-
-REQUIRED_DISTRO_FEATURES = "x11"
-
 SRCREV = "6cef41d859fbc9ce7868a97cb2cb5dd2b10b9103"
 PV = "2.0.0-devel+git${SRCPV}"
 
-- 
2.7.4


