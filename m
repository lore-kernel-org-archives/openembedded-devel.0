Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 55D2171C0F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Feb 2018 18:00:24 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id z12so11497321wrg.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Feb 2018 10:00:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=EeHtlpbD4PPC6E1RZlF0J1cS2tVIn40M+t11ELy6bZw=;
	b=dOcreEF3era6UQCNhdRqsgn/MUNEFapEcwk3PM6/BEU4IKD9fmbPtZ3uYzIM4xJ+aW
	IJ3L8ab65uRduFxfM5el/IZ1jr8vatB+os5RYOhUKb8EfjNKYbtQ3E87QdOFReTEMCUF
	BB4FaeJG63TmJEAuKejSkpsEjzgfQ+Zfx5jWZJBNL4FTeHQes75ekYyZF1XEUrhFt5x3
	P6SJvEfh/jwW44v2aBec48igQr+AuUHlf3rIbDb6/GwsmSnENha9KpwXcqOP06TNUvox
	74Ufx4Jj0hW6QQnncsNt/QlUG8Kj3JEVBrxu/RlQERgHFyxt1x5awsBeL4zd3XOXh/gL
	G79A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=EeHtlpbD4PPC6E1RZlF0J1cS2tVIn40M+t11ELy6bZw=;
	b=I5pf7IdGu/pVeFqb+/ErqRVCLjmN9SGtqc/wX75cZxV8vFs9uZWk5XXqWgH2sVilsp
	3aTbk3sU1rRkwZzMFp5Ut2C2tbpoCzNxalZKQh81G5o+2nw+i4CMBkYVsHS1OgvUoPYz
	eR0sTXSRaSBXkQgLwRV3wZuv2gfaCu4BLxcuSrpeNN8Of8PMgEf5XkNH1ZsEQONcIZFz
	zMiCgDv0jvRR7srKnzvdQmInmvOcOBAh0UHQWkr1axzxQOU5JRSOe9NgkA7GW9E1qOoZ
	D5F10bPFB1mxB9BNEHbGAEHEYSE5XjXpeHYVRQ9lSH7Nk17EdbNdW2tXW+6u59ZE1kl0
	uDyQ==
X-Gm-Message-State: APf1xPBp1eth1J0CGb5nRPB4RLvJeqhfJdw3q+D9dBWWeoRlKvdZ275o
	hLwMbfVgPyP8klNqaiotDfVuVA==
X-Google-Smtp-Source: AH8x225f8eg4ib0h0Sn6UF3UdbVwG0LvcFyCB5G1BeonDyzZpybdFFadM0Kas5Am8ZxKGG8RLD0mVA==
X-Received: by 10.223.164.215 with SMTP id h23mr7140552wrb.38.1519322425847;
	Thu, 22 Feb 2018 10:00:25 -0800 (PST)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id 55sm854447wrw.87.2018.02.22.10.00.24
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 22 Feb 2018 10:00:24 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Feb 2018 18:00:22 +0000
Message-Id: <20180222180022.32270-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.15.1
Subject: [meta-qt5][pyro][PATCH] qt5-git.inc: drop nobranch=1
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
X-List-Received-Date: Thu, 22 Feb 2018 18:00:25 -0000

* sneaked in with:
  commit 333949a8239dfa7788b35f1059614733e11a6a25
  Author: Samuli Piippo <samuli.piippo@qt.io>
  Date:   Thu Jan 26 16:54:50 2017 +0200

    Upgrade to Qt 5.8

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/qt5-git.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qt5-git.inc b/recipes-qt/qt5/qt5-git.inc
index f864953..a1dd16a 100644
--- a/recipes-qt/qt5/qt5-git.inc
+++ b/recipes-qt/qt5/qt5-git.inc
@@ -3,7 +3,7 @@
 
 QT_MODULE ?= "${BPN}"
 QT_MODULE_BRANCH ?= "5.8"
-QT_MODULE_BRANCH_PARAM ?= "branch=${QT_MODULE_BRANCH};nobranch=1"
+QT_MODULE_BRANCH_PARAM ?= "branch=${QT_MODULE_BRANCH}"
 
 # each module needs to define valid SRCREV
 SRC_URI = " \
-- 
2.15.1


