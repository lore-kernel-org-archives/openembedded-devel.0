Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id BFCEA77D6C
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Sep 2017 03:58:13 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id q76so3957573pfq.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Sep 2017 20:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=g9EQUm1i4Ey38yGuivRPtUvs897i+Drw2kjL0p3zqwc=;
	b=OFCiUr5C1SzVbgks1MYMfIEw5s1m/N4fZ3o+3u6l5H8c1pcCH3Cl5Meg4g1oAwDP7L
	n/9ywM10WVMXGUyHDZBP9gFFAB46WHvIGQ1qgY2mdTGuFXJ8JtZCJjO6isWKK5FYgIDW
	obpUBQx+qmAv9+b0n4N5qv5TldIOYMIjIogA3QW5JMTfOuJCe4EgqGP+E93E5C4fr5bd
	l6a9KcN2v1FNa3SThnsq4DitpT/OpkdOin69OOkdqTlSgDXukjmc2o89jbilDXK4Vl/u
	vcFB2bmDLOl+bnugXLdnrDVukopN8BuAeqK9JH2r2zEFizyJZzNMJIgn+bxCkAzh0ql9
	k6eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=g9EQUm1i4Ey38yGuivRPtUvs897i+Drw2kjL0p3zqwc=;
	b=TyBzlk0/aEALNanSkrJ5ee5ioAU7HNvNVgenr9rzjE1Y+xHmmjw1Z/8BYKpqZhGAO2
	nkSUUJv/IbVUXkRAxju+V8niQPgbEQgYHcer0XLLMMXiXYSgXjaMphgUxE/sTDj3/Hy1
	MIrYq4PQzo9qRJ70gADn9zmRPTJB6uQcuHc8FmaWjXV+Kk9/DlZ5TwCYCvfy+QOLYYQq
	hWDc0a42SO61A8T3mme2zAqnaz7gCi7LzxdaXvgW8Russb3UhoZ8Au0h1en2XgyUtE/5
	Gu0v7FMqpgGN7V7NGnR/hVVVj1V7C3f44l5VaeoEk5kdigGdI4Y1I9uJhGy9qeXX1MkX
	2/uA==
X-Gm-Message-State: AHPjjUiSL0aw0fW7wr7e+XHrc+AlGO6tqzRMxc7QzeJ5skDG6FKBhWu6
	o1xFkyFofAOujpPB
X-Google-Smtp-Source: ADKCNb4AThmqUycuv7w6ppMHHYgefh+p2mw+VAgorp6n2YEvcYGGAz+oyIcZV29crGoWhHgbO0uatg==
X-Received: by 10.98.217.220 with SMTP id b89mr1365036pfl.144.1504756695276;
	Wed, 06 Sep 2017 20:58:15 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::be3d])
	by smtp.gmail.com with ESMTPSA id 13sm1637379pfi.55.2017.09.06.20.58.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Sep 2017 20:58:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  6 Sep 2017 20:57:56 -0700
Message-Id: <20170907035758.41689-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170907035758.41689-1-raj.khem@gmail.com>
References: <20170907035758.41689-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/5] pm-qa: Upgrade to 0.5.2
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
X-List-Received-Date: Thu, 07 Sep 2017 03:58:13 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/pm-qa/pm-qa_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/pm-qa/pm-qa_git.bb b/meta-oe/recipes-devtools/pm-qa/pm-qa_git.bb
index 7322df8e7..315ab2115 100644
--- a/meta-oe/recipes-devtools/pm-qa/pm-qa_git.bb
+++ b/meta-oe/recipes-devtools/pm-qa/pm-qa_git.bb
@@ -4,12 +4,12 @@ HOMEPAGE = "https://wiki.linaro.org/WorkingGroups/PowerManagement/Resources/Test
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-PV = "0.4.14"
+PV = "0.5.2"
 
 BRANCH ?= "master"
 
 # Corresponds to tag pm-qa-v0.4.14
-SRCREV = "9111d1930f02337394cf16e84ad2a27f33607cbb"
+SRCREV = "05710ec5032be4c8edafb4109d4d908d31243906"
 
 SRC_URI = "git://git.linaro.org/power/pm-qa.git;protocol=git;branch=${BRANCH}"
 
-- 
2.14.1


