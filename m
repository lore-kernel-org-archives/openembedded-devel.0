Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f46.google.com (mail-pl0-f46.google.com
	[209.85.160.46])
	by mail.openembedded.org (Postfix) with ESMTP id 3EB516010B
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 May 2018 22:35:23 +0000 (UTC)
Received: by mail-pl0-f46.google.com with SMTP id c19-v6so7624178pls.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 May 2018 15:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=sG9YYB8HerHudjrNLCaU/cyIGUh8OW4+kL48BDXqopc=;
	b=hGhzVWsEBIxhQilRbtX5Xtx1pSHDuo9JMh67VwuWavYMv51l1CpueEMe2zdMF70eka
	XBeRI4ZPxzJdFc+CtGdYH/21+Dd7fAGJHt1PYDuy3H5Y5IPCVjP8dwi04LJGInErkEa4
	a9cQOWokZDBCe/NDpaS35uIYvAIFayqc/TXhYjfTq6/nSV0vW+K4v0hUMJM3K86W9PMg
	1jSXusxe47IAQ04Ptu0yhxOce3TcPzc7R5HD9LvA+t6SxDEOPhkn/1k9y2Kht4RYsqoD
	V0sZBtm/iih5xdiP3RAZ1IIoZMe+0kmk32lQm9/+0re6AEl4sYheVA/nWqFNOfH3zEjd
	YSsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=sG9YYB8HerHudjrNLCaU/cyIGUh8OW4+kL48BDXqopc=;
	b=WtIIdwjrlEVq7ZpI5g5wxiUdK16/jtuSUPh8p6TlUvSQP5eGVsRJPC9WVMnWsS6uaM
	C3b8iuCcdbGY0zYwAwylXQgbFiz/7orExTeRkBBZqklBc3zdZ9oTWfCdLm/fK1OYJtnQ
	KgPrb5X0ynL/NeGHzxTMi+0rsjk8caU/3BIryWBuKohOpGlxwVAeprovqLFVTNQfxohF
	t75o7oY6kpsvelSpM/mQLe3jkPkOp3GcP1dMy55/IlLWgjdzLkdQl3GqSEH3rHlnFv+G
	vaRibCSu1w297nNsk+tEjmB8JlGcvOVpzlBybGopLPL755qacHUQS/v1fhdGhQBHU3Gv
	9EFA==
X-Gm-Message-State: ALKqPwdC2GXr9z47Z8e0/fy7syBQ2cS35FvXt2VnPkk70BZx8ao6Sxvi
	Urbcz4RJzF65FXJeyRzSIdFXqw==
X-Google-Smtp-Source: AB8JxZqrQntikXWgcvJw+3RR05MnmaU/9cQEtWkk5XbJHPPKrlXEnLbMzeilKl8J9GqMrtbOvLnaiQ==
X-Received: by 2002:a17:902:b60c:: with SMTP id
	b12-v6mr18614110pls.44.1526855724785; 
	Sun, 20 May 2018 15:35:24 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	203-v6sm21887763pfz.131.2018.05.20.15.35.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 May 2018 15:35:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 20 May 2018 15:35:17 -0700
Message-Id: <20180520223517.9869-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180520223517.9869-1-raj.khem@gmail.com>
References: <20180520223517.9869-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 6/6] mariadb: Upgrade to 5.5.60
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
X-List-Received-Date: Sun, 20 May 2018 22:35:24 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{mariadb-native_5.5.59.bb => mariadb-native_5.5.60.bb}   | 0
 meta-oe/recipes-dbs/mysql/mariadb.inc                        | 5 ++---
 .../mysql/{mariadb_5.5.59.bb => mariadb_5.5.60.bb}           | 0
 3 files changed, 2 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-dbs/mysql/{mariadb-native_5.5.59.bb => mariadb-native_5.5.60.bb} (100%)
 rename meta-oe/recipes-dbs/mysql/{mariadb_5.5.59.bb => mariadb_5.5.60.bb} (100%)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_5.5.59.bb b/meta-oe/recipes-dbs/mysql/mariadb-native_5.5.60.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb-native_5.5.59.bb
rename to meta-oe/recipes-dbs/mysql/mariadb-native_5.5.60.bb
diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index 99e7050945..8e0e252421 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -18,9 +18,8 @@ SRC_URI = "https://downloads.mariadb.org/f/${BP}/source/${BP}.tar.gz \
            file://change-cc-to-cc-version.patch \
            file://0001-disable-ucontext-on-musl.patch \
           "
-
-SRC_URI[md5sum] = "3cec4afc06b468687ef576c90148d10d"
-SRC_URI[sha256sum] = "c3269ce20b45b177239fd1e3d6d9428a94131711f12758ebf5f65222278bb110"
+SRC_URI[md5sum] = "afbadcf2980ad5aa205084dd401f1b7f"
+SRC_URI[sha256sum] = "4d3d444555416028ce39d3fb4cdc9cf6a658fcd4b0d2d0c45a73f9bf01d07929"
 
 S = "${WORKDIR}/mariadb-${PV}"
 
diff --git a/meta-oe/recipes-dbs/mysql/mariadb_5.5.59.bb b/meta-oe/recipes-dbs/mysql/mariadb_5.5.60.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb_5.5.59.bb
rename to meta-oe/recipes-dbs/mysql/mariadb_5.5.60.bb
-- 
2.17.0


