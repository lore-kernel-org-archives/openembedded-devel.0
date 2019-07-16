Return-Path: <joshuagloe@gmail.com>
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
	[209.85.128.48])
	by mail.openembedded.org (Postfix) with ESMTP id 7401A7ECB2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Jul 2019 15:46:18 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id p74so19142284wme.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Jul 2019 08:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=DAZBOfHi8WFk9AOCkWLPqQmwVk2JeA7wIobf8nrutRc=;
	b=N9xhFWXgGqeAgea4qH2tbqzuJx632xw8TimRrxan46ttgi304IsX1DGqLYlzTslO8e
	foiaC28qx3UZYZrjg5xvuoogUc1QBc0pzTE9D107vrNWs+vtxWlLzOEEe+ZlSclqw4Ql
	zmo/bvWLYU7r6N/FqzvQ8/wtCKXGNuGrvP05D4GerfAP7qWUmBIKgL5HomEmbeTYunlD
	7c+9H1vNnJAqGCAKOs7Lk/OSp4dvp5V114vh740oamywVyfUr2mwshJeqi10okKLPTUB
	Se8tNrt0TleJwIKBELt9yjqzwL3OTm+Kp2HtCA6Z/cE+28arAi8ymoF6Kj5h9XPeATV3
	jYJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=DAZBOfHi8WFk9AOCkWLPqQmwVk2JeA7wIobf8nrutRc=;
	b=XOuVbnT8YYna4/nyF0yZt6unRqQB+oncXGiy7im3W2sC/mevYJdUH6zdaE+0tgeKZn
	ujDkFelb6Y8L3Pc05X8c4reozUJrS56h2M9Vkv1JNbj3FJhDAvQJ2e5xKD658Oj2z/r/
	XGM+s9msGDWb3ROcW0fRwHovUIXaQ9H67liZ2lNNM2VEB+ke4Ug3xgeTn0uirWCQ4kzo
	VX9poSwwoPnjoxWEhBiQaU85aWhovJ8OlerSWovZFB5z+okmWISrlhARaFHpUNkqzoTW
	rHmQ/F7rwIs6NtXyQ+JTLIVsRcJMq4vlbrLFLwlilxr97EhwF2P2rifvYoeNPx3hVhpf
	TKrA==
X-Gm-Message-State: APjAAAV3DblsDMaJs8ti9IECRcY4jz51x8WqTbm8mDDV4x/ntF3NoPNl
	kIr0N/ZAH+txUssavKqP/50vVDm1/gs=
X-Google-Smtp-Source: APXvYqwZj6Asl7ZK9f8dU95espR17Mjc75F9ZyrhYxM6d1TL1erbZ/tbwDv3mGjC+qav+tI/T4k2aQ==
X-Received: by 2002:a05:600c:2503:: with SMTP id
	d3mr32249982wma.41.1563291978951; 
	Tue, 16 Jul 2019 08:46:18 -0700 (PDT)
Received: from localhost.localdomain
	(host165-120-157-205.range165-120.btcentralplus.com.
	[165.120.157.205]) by smtp.gmail.com with ESMTPSA id
	o6sm39537200wra.27.2019.07.16.08.46.18
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 16 Jul 2019 08:46:18 -0700 (PDT)
From: Joshua Lock <joshuagloe@gmail.com>
X-Google-Original-From: Joshua Lock <jlock@vmware.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 16 Jul 2019 16:45:45 +0100
Message-Id: <20190716154546.3601-2-jlock@vmware.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190716154546.3601-1-jlock@vmware.com>
References: <20190716154546.3601-1-jlock@vmware.com>
MIME-Version: 1.0
Cc: Joshua Lock <jlock@vmware.com>
Subject: [meta-python][PATCH 2/3] python-attrs: add native BBCLASSEXTEND
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
X-List-Received-Date: Tue, 16 Jul 2019 15:46:18 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Joshua Lock <jlock@vmware.com>
---
 meta-python/recipes-devtools/python/python-attrs.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-attrs.inc b/meta-python/recipes-devtools/python/python-attrs.inc
index 1f767ba19..bd0f7ee2c 100644
--- a/meta-python/recipes-devtools/python/python-attrs.inc
+++ b/meta-python/recipes-devtools/python/python-attrs.inc
@@ -12,3 +12,5 @@ RDEPENDS_${PN}_class-target += " \
     ${PYTHON_PN}-crypt \
     ${PYTHON_PN}-ctypes \
 "
+
+BBCLASSEXTEND = "native"
-- 
2.21.0


