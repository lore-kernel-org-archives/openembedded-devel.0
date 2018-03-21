Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 172AF7896C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Mar 2018 14:16:15 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id d1so1979850pgv.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Mar 2018 07:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=nV8cskB3QKaWvC3yRSiQVZNvHYDjs1EWZT/tawfAu84=;
	b=COE3sqdDTRqhmQgDMmyKZc5raSwxcfjK/3Z8YO7oEz0ruDRb9mN/iNu3n1h5cjvmZm
	o8e2l5JL1/s9bIHRhhwiMumrTCKROwYxHQNxKvjC3EDdn5dqYFazVxMYRjoXet2eNe5x
	JAEk21NCAkReKXdDtohx4Rk12b6AdIr2vqaWTB96StN32b8FB5uHtrYbH4p2RthQ/e01
	30aUpLyT0Tw3i3HKYamRa7tK2cG2sBRUGnFeLj+uTiO/wH1UxfQXKg9mqpwnOQhgyJxK
	yWOdIb3s4WxZ37klcT89FzXy1vZFKP1JNqfGqOjZjj6lH5IxR0jeE2qmF0nwWuBwg3S6
	0jFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=nV8cskB3QKaWvC3yRSiQVZNvHYDjs1EWZT/tawfAu84=;
	b=oKoOob34+WWRB5Z66I+3yiicB6CO9RckBjOQRNgM5ic5cD9e77ZUcgaQqJBNOz4y5i
	7pkXfbPpDNrAUXiEfqOKs9Zv5//ucElD4uCQN6iJZZ0pwymW4GTDpYrGMpfo1GiOyjnR
	gzfQaINbhGasL1Qr73hmvmUnQDiic2mp9+E3Kxbwr/kSv5HLDQ6i1DVrEmY8OzWLRj58
	KOKSCoPuZfnVdUjPhQbsk3ETxtWd4O9/0aZJyT9G9ou4jstHztg+8anebC4WoaOa+NTF
	pUBWmJyV9eDQO6UALUhSfKV6Cy2qT5VLLMtzOtghnFOb95DwoSh6i77KVb/ydlLYrTdx
	T01g==
X-Gm-Message-State: AElRT7GmmGv+sm7sq/ABa0/fF62UUigs1JgyqnJBCBlLPjMQyWDoLUuy
	xO4eBN94wo5qiXDY0pJ/Hjc=
X-Google-Smtp-Source: AG47ELvPpVlyAdZMruBa/ryxIHkkmlNh7sGUNXtPMGSBZgCfcPvYj3+KOQoe3WebHQAris7dNyUi1w==
X-Received: by 10.99.108.2 with SMTP id h2mr15103716pgc.396.1521641777394;
	Wed, 21 Mar 2018 07:16:17 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:a1c1:eb3f:f249:aed1])
	by smtp.gmail.com with ESMTPSA id
	v18sm8138907pgb.23.2018.03.21.07.16.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 21 Mar 2018 07:16:16 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-devel@lists.openembedded.org
Date: Wed, 21 Mar 2018 07:16:12 -0700
Message-Id: <1521641775-2171-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH 1/4] leveldb: move to recipes-dbs
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
X-List-Received-Date: Wed, 21 Mar 2018 14:16:16 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../leveldb/leveldb/0001-Makefile-Fix-parallel-build.patch                | 0
 .../leveldb/leveldb/0001-build_detect_platform-Check-for-__SSE4_2__.patch | 0
 .../leveldb/leveldb/0002-makefile-build-SHARED_MEMENVLIB.patch            | 0
 meta-oe/{recipes-security => recipes-dbs}/leveldb/leveldb_git.bb          | 0
 4 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-oe/{recipes-security => recipes-dbs}/leveldb/leveldb/0001-Makefile-Fix-parallel-build.patch (100%)
 rename meta-oe/{recipes-security => recipes-dbs}/leveldb/leveldb/0001-build_detect_platform-Check-for-__SSE4_2__.patch (100%)
 rename meta-oe/{recipes-security => recipes-dbs}/leveldb/leveldb/0002-makefile-build-SHARED_MEMENVLIB.patch (100%)
 rename meta-oe/{recipes-security => recipes-dbs}/leveldb/leveldb_git.bb (100%)

diff --git a/meta-oe/recipes-security/leveldb/leveldb/0001-Makefile-Fix-parallel-build.patch b/meta-oe/recipes-dbs/leveldb/leveldb/0001-Makefile-Fix-parallel-build.patch
similarity index 100%
rename from meta-oe/recipes-security/leveldb/leveldb/0001-Makefile-Fix-parallel-build.patch
rename to meta-oe/recipes-dbs/leveldb/leveldb/0001-Makefile-Fix-parallel-build.patch
diff --git a/meta-oe/recipes-security/leveldb/leveldb/0001-build_detect_platform-Check-for-__SSE4_2__.patch b/meta-oe/recipes-dbs/leveldb/leveldb/0001-build_detect_platform-Check-for-__SSE4_2__.patch
similarity index 100%
rename from meta-oe/recipes-security/leveldb/leveldb/0001-build_detect_platform-Check-for-__SSE4_2__.patch
rename to meta-oe/recipes-dbs/leveldb/leveldb/0001-build_detect_platform-Check-for-__SSE4_2__.patch
diff --git a/meta-oe/recipes-security/leveldb/leveldb/0002-makefile-build-SHARED_MEMENVLIB.patch b/meta-oe/recipes-dbs/leveldb/leveldb/0002-makefile-build-SHARED_MEMENVLIB.patch
similarity index 100%
rename from meta-oe/recipes-security/leveldb/leveldb/0002-makefile-build-SHARED_MEMENVLIB.patch
rename to meta-oe/recipes-dbs/leveldb/leveldb/0002-makefile-build-SHARED_MEMENVLIB.patch
diff --git a/meta-oe/recipes-security/leveldb/leveldb_git.bb b/meta-oe/recipes-dbs/leveldb/leveldb_git.bb
similarity index 100%
rename from meta-oe/recipes-security/leveldb/leveldb_git.bb
rename to meta-oe/recipes-dbs/leveldb/leveldb_git.bb
-- 
2.7.4


