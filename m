Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
	[209.85.221.42])
	by mail.openembedded.org (Postfix) with ESMTP id 7E8D0792A9
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Aug 2018 11:26:43 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id b15-v6so9131208wrv.10
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Aug 2018 04:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ziPRU5OKtsODyhmFw3DjkaxtW6/6ouFRu5XnojMDmXQ=;
	b=NF+abcIqphbnO14JVM1LV5tkjL80EzHr/ORXSyxtA+HNM0TPlJ7cpWRJGFbZ8ypGMe
	UKEA90p4XBIlvtX9ygOTp7gWFPSeCiaFmyJXHC63E7HjLJCQG+80Hb8hEeU4KZd8TENI
	FyJg83ixUlf/itq9swYPHd2l0eD/cIhmDAtx59teJ4DesP80GfDDzW+lgLHlmAzzVgia
	4jKbzjgVTwegmBxYxubS9Nk6snoQNPTL0eLd6HEGOj298Q1BbVM/5D/zDhuDyJPjvvq1
	8ITKoVC0R4gh+MafAaeIc/YndJ3mrCcwWBn3MtHqJ1ZwJq6sXDv1SZIYjM9DSy3hjebj
	9JfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ziPRU5OKtsODyhmFw3DjkaxtW6/6ouFRu5XnojMDmXQ=;
	b=Vl7u+Z8VPSrQib8uypzqZT9B+eAoxkbMYg483URSxgklK1/5LXAT32lNvX3lrAAXPV
	ALNwG18JgjS9XAoFIYZspjuBxYm6vVy0ce6f9NV+97afo1BR3J8HEsICn1bY/Vr355JX
	bLgBjIJT2bcwc9D6Vv3TWbj/6v8PyCy6URzsaESmF15G3RLYPlo1vJz1Hz3jEgIruixP
	iFcQu3v2K7bSXJzXPqAWlvqrwqY3W2Aw6IgdEtpsDX7a/DkNy9QC4nnxruqA6sUioyby
	YPGbTqhbfosDJ6zOjkA8k7ZV6PLmOKRVXKa/1mb7C3LNWKJmbcGZw05eOx9ONkAGRHx+
	0amw==
X-Gm-Message-State: AOUpUlELizIGe8qQ7GOZUdJaxMcE2BPc8A/M1OZvKuVdfBHfRDb+utrC
	eV29zDZZyc8+2DGeKfvZqwCIDWNX
X-Google-Smtp-Source: AA+uWPx05jNI15hjkfBDzBG0iF/jUKV7tR/8O/pf0BGGB7arSSOwDQYpb1gy21VQnn0MT2/bt9rzTA==
X-Received: by 2002:adf:aa09:: with SMTP id
	p9-v6mr24599588wrd.92.1534591604137; 
	Sat, 18 Aug 2018 04:26:44 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	e12-v6sm3771980wrt.29.2018.08.18.04.26.43
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 18 Aug 2018 04:26:43 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 18 Aug 2018 11:26:34 +0000
Message-Id: <20180818112638.10006-3-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180818112638.10006-1-Martin.Jansa@gmail.com>
References: <20180818112638.10006-1-Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-networking][PATCH 3/7] kconfig-frontends: add dependency on bison-native
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
X-List-Received-Date: Sat, 18 Aug 2018 11:26:43 -0000

* fixes:
checking whether yytext is a pointer... yes
checking for bison... no
checking for byacc... no
checking for yacc... no
configure: error: can not find a parser generator (such as yacc or bison)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../kconfig-frontends/kconfig-frontends_4.11.0.1.bb             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/kconfig-frontends/kconfig-frontends_4.11.0.1.bb b/meta-oe/recipes-devtools/kconfig-frontends/kconfig-frontends_4.11.0.1.bb
index df08b8b114..de9a6eb998 100644
--- a/meta-oe/recipes-devtools/kconfig-frontends/kconfig-frontends_4.11.0.1.bb
+++ b/meta-oe/recipes-devtools/kconfig-frontends/kconfig-frontends_4.11.0.1.bb
@@ -11,7 +11,7 @@ HOMEPAGE = "http://ymorin.is-a-geek.org/projects/kconfig-frontends"
 LICENSE = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=9b8cf60ff39767ff04b671fca8302408"
 SECTION = "devel"
-DEPENDS += "ncurses flex bison gperf-native"
+DEPENDS += "ncurses flex bison gperf-native bison-native"
 RDEPENDS_${PN} += "python3 bash"
 SRC_URI = "git://ymorin.is-a-geek.org/kconfig-frontends;branch=4.11.x \
 	   file://0001-Makefile-ensure-frontends-exits-before-writing-into-.patch \
-- 
2.17.1


