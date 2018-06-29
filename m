Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 8251A753E7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jun 2018 21:18:20 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id s47-v6so9105221qth.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jun 2018 14:18:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=t1vr/EZTBnnhsV1Z6xMl6U7PAALD9ClVSjJAk3l/vo8=;
	b=DUh0O2rAij4jb59T/r6itiBD2+XjAEbS5yACxl8gUan03NcvXGp/Gxj0cUWncopzLt
	CnL1py+6WSjdRnI7ezMABsivVV+Y+NekeoK3pRszfEocPpJxp6uzroplxAAPqc5iLm7B
	KOqxZZtSk5yj7eeyUh+Yl7hag3igGcDEQ2XWWlY0aNpnmbpW8K9TGAKbgIysnijJav8b
	sd/oGOHkH124+M1tSAwxItahKPSogMT206fP3pGYS268mwoatePyTGYk7m0cs02/Ndzg
	Vg0m+h0ZL1Xnx98o1xECF2LFh+DKoun/if9ri2/gyls9OSx7114BRPCWakjXkZZmlEYm
	Kv9w==
X-Gm-Message-State: APt69E0bEgsc3nujlSEtnMwa1kfvXUah2l2kucGYF8KtrAZmqQhv4vkt
	OeAZJRcJhjWgHx8Dhd24chn/iCJP
X-Google-Smtp-Source: AAOMgpemh9+Aqtcq3kgtXYOeuX1D67eIZLWX1ss12p83f0bgKKwgs4qsNwml7d8c5GT/PpCAf7ZM9A==
X-Received: by 2002:aed:3403:: with SMTP id
	w3-v6mr15544989qtd.361.1530307101077; 
	Fri, 29 Jun 2018 14:18:21 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-100-33-240-84.nycmny.fios.verizon.net. [100.33.240.84])
	by smtp.gmail.com with ESMTPSA id
	n125-v6sm3907631qkd.25.2018.06.29.14.18.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 29 Jun 2018 14:18:20 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 29 Jun 2018 17:18:08 -0400
Message-Id: <1530307088-9405-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-alembic: update to version 0.9.10
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
X-List-Received-Date: Fri, 29 Jun 2018 21:18:20 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-alembic.inc                | 4 ++--
 .../python/{python-alembic_0.9.8.bb => python-alembic_0.9.10.bb}      | 0
 .../python/{python3-alembic_0.9.8.bb => python3-alembic_0.9.10.bb}    | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-alembic_0.9.8.bb => python-alembic_0.9.10.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-alembic_0.9.8.bb => python3-alembic_0.9.10.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-alembic.inc b/meta-python/recipes-devtools/python/python-alembic.inc
index f1a6412..4de845c 100644
--- a/meta-python/recipes-devtools/python/python-alembic.inc
+++ b/meta-python/recipes-devtools/python/python-alembic.inc
@@ -2,8 +2,8 @@ DESCRIPTION = "A database migration tool for SQLAlchemy"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c5f1361296835ff94bda73db7dd312a6"
 
-SRC_URI[md5sum] = "5cfef58641c9a94d4a5d547e951a7dda"
-SRC_URI[sha256sum] = "13b8611788acf0d7b617775db5c2ae26554a6d4263c590ef628d448fd05aef56"
+SRC_URI[md5sum] = "117dac728cd081739bdbed73fe252a7d"
+SRC_URI[sha256sum] = "1cd32df9a3b8c1749082ef60ffbe05ff16617b6afadfdabc680dcb9344af33d7"
 
 PYPI_PACKAGE = "alembic"
 
diff --git a/meta-python/recipes-devtools/python/python-alembic_0.9.8.bb b/meta-python/recipes-devtools/python/python-alembic_0.9.10.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-alembic_0.9.8.bb
rename to meta-python/recipes-devtools/python/python-alembic_0.9.10.bb
diff --git a/meta-python/recipes-devtools/python/python3-alembic_0.9.8.bb b/meta-python/recipes-devtools/python/python3-alembic_0.9.10.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-alembic_0.9.8.bb
rename to meta-python/recipes-devtools/python/python3-alembic_0.9.10.bb
-- 
2.7.4


