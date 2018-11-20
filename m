Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
	[209.85.214.181])
	by mail.openembedded.org (Postfix) with ESMTP id 5EBE86C4A2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Nov 2018 20:38:30 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id u6so1982987plm.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Nov 2018 12:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=J4eDXsz/c6+ev/yrN5v8fHQt2uOB4AT55K/cwEUMjoU=;
	b=pHMXHsyZVcpxBpeeqkqnG0JllTPOVH6jhjWrC/eK8sAMW5gav0qtTqYyfaRUzN+5K1
	h7l776j2BTIXstc0x15VKvGLs2oHu9Xq5jkR+9dtVdAlViC6jw2MOCcCpNS/5lRalzoT
	ZMADl9KzI2B+ACteWMidTddGo9sRpUyQcCq1w4uozUz6tRIttWlv0qXfIcRlAQUcG6Dd
	nf658ygXgg7WqJBfs6F8DYh+SjCCvh/LDGZ+e6KMZquZgLXjHq39KoH7uzNBX0p4fNU9
	qwHIIZnF4dRj9D4t2XzD+5s/aUiYCf4jTzzJ+Nv08usl8D03YSIxL0ypgOQnqCA2ChZn
	zSWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=J4eDXsz/c6+ev/yrN5v8fHQt2uOB4AT55K/cwEUMjoU=;
	b=gjXlFhftjBqEMdgp50MNqjzAuuDVdRcfirRU8H5d82q0yV0GHiVYcY7eXN2fenJV40
	kIacxd7ebmD3PRNOzyfTQI57Emdw9CNR5vXXbr+4sbNskllwTwNinXAAdqSAG/wF24r1
	wA2ZiUgmuHDu39SjYFaXu+yZIBsFuyMA2gqXghIT9Rur/QRqJy4xfTA1eWlOE/5nKgoH
	554tWu7vH2L4kN58vXUuq6NIDM6CmhztKiYBiA+vKzt+DzBCVzmbpzDiKi5+0heq0IYD
	z5ug9ziVnUyNRxT/6yDkEBmHJjBe1UzEZdK45Mw2Bwph8kKY3t7eoA0lVAu+qfM7FWZj
	sCOw==
X-Gm-Message-State: AGRZ1gIYpJ9r2EVAndt80kpXtoLYJTQjcIORaOhSKjsaoTalPeoF4mh7
	Mzl0LdZrP264LDt67bFh8pP0T7veBQw=
X-Google-Smtp-Source: AJdET5fJvMOT2+JAPmKbf5DJg78lDfF7J5djAMktwu0VPA1htw5M4uWXXSM8sOUCVH28dOKSjfugsQ==
X-Received: by 2002:a62:160c:: with SMTP id 12-v6mr3718828pfw.45.1542746310985;
	Tue, 20 Nov 2018 12:38:30 -0800 (PST)
Received: from localhost.localdomain ([2601:646:877f:9499::26ab])
	by smtp.gmail.com with ESMTPSA id
	x26sm24325479pfn.50.2018.11.20.12.38.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 20 Nov 2018 12:38:30 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 20 Nov 2018 12:38:12 -0800
Message-Id: <20181120203814.11500-8-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181120203814.11500-1-raj.khem@gmail.com>
References: <20181120203814.11500-1-raj.khem@gmail.com>
MIME-Version: 1.0
Cc: Kavi Jivan <kavi.jivan@viavisolutions.com>
Subject: [meta-python][PATCH 08/10] Adds python3 syslog dependency to python3-systemd
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
X-List-Received-Date: Tue, 20 Nov 2018 20:38:30 -0000
Content-Transfer-Encoding: 8bit

From: Kavi Jivan <kavi.jivan@viavisolutions.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-systemd_234.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-systemd_234.bb b/meta-python/recipes-devtools/python/python3-systemd_234.bb
index 580d99352e..78ec431560 100644
--- a/meta-python/recipes-devtools/python/python3-systemd_234.bb
+++ b/meta-python/recipes-devtools/python/python3-systemd_234.bb
@@ -1,2 +1,3 @@
 require python-systemd.inc
+RDEPENDS_${PN} += "python3-syslog"
 inherit setuptools3
-- 
2.19.1


