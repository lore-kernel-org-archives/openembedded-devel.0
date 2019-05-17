Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
	[209.85.128.45])
	by mail.openembedded.org (Postfix) with ESMTP id F36237DF2E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 May 2019 11:32:25 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id x64so6599189wmb.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 May 2019 04:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=H/ud1R6zjbgmdtGEtXTuQLDT9XMI8qA44t30GuCVdPc=;
	b=OTYJ9u+AWE/tNSmEhlUpjNDG6012wcrXw6HDa7gQQaR9yqHpMqcuh7B0n1ZTrIeJeh
	kIk5qE81GxD/WSQktYORC3kb2+7sQPIetggfLLYBiBZJDCU9U/CsQUzdBA45hWKCxLAk
	YltJHcT7jBwMIMQaA5ONxmvUpZEdVc5VVtomKPyL/VYX9GwyK7UvF41829rDKcNvxgUA
	yMXCGpy6ScTeTTKN3QY2CHTzsEKjaXLDE7tP/XxHhZLvPTGhXsVLV1vvsagrrM/L07aj
	PZd7EfAiTkBhT0GRSRzSvoilhTTkRrGbnPLbKL8IJIUJVqEkik1sOx96aWF7/j3NDHch
	72tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=H/ud1R6zjbgmdtGEtXTuQLDT9XMI8qA44t30GuCVdPc=;
	b=CYmXblzlYVf93nrLsMZepxpA/9F1kPjd6MpJyKN4s1iBri/X6ZfP1jJsFRzp0LRnMP
	+kFZY7OVAH6P+qEsaivquZt3puXDW0WlCYWsmqmOd5uLQv2zSdg8tcsy/tUqFAfzPg3w
	Is7sb56CXA1oAdfhC+jEt8NUCDWG+j4ziaEiYemqiE3ycGaJwaWGNgzYZYoiAb1g4quf
	nh9mSMcImissJ6C6vf4cVUPSaBCvcybbtxe7EPo34ogk5lJhqd1RPoY7H0/5+g69Wl8l
	z949CWtU21G9EsLg5Zgs7nJzOJlgJ/TGltU3SCDJp+rPfJxP2YISgojDAQzwnSVpO5rB
	DfpQ==
X-Gm-Message-State: APjAAAX2LdmoUS7uUy8tz6DWMxvOw9p6gYSobWvuA05UNOCnLF5bn9mO
	4B/vI3htLCaGAPdbK/CtVEqa8tBZ
X-Google-Smtp-Source: APXvYqwm3D/wrQPfL28D4glEwUV9jj+rvUt8P+ovYMEMs7Id5vvRw/VZlxd18fMjZPXa06B02ZJdsQ==
X-Received: by 2002:a1c:a9d4:: with SMTP id s203mr30711640wme.27.1558092746238;
	Fri, 17 May 2019 04:32:26 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	x6sm11534249wru.36.2019.05.17.04.32.25
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 17 May 2019 04:32:25 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 17 May 2019 11:32:23 +0000
Message-Id: <20190517113223.1072-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-python][PATCH] python-cassandra-driver.inc: fix DEPENDS
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
X-List-Received-Date: Fri, 17 May 2019 11:32:26 -0000

* there is no such thing as DEPENDS_${PN}

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-python/recipes-devtools/python/python-cassandra-driver.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-cassandra-driver.inc b/meta-python/recipes-devtools/python/python-cassandra-driver.inc
index 1cc1f4c494..53ebfec337 100644
--- a/meta-python/recipes-devtools/python/python-cassandra-driver.inc
+++ b/meta-python/recipes-devtools/python/python-cassandra-driver.inc
@@ -28,6 +28,6 @@ RDEPENDS_${PN} += "\
     libevent \
 "
 
-DEPENDS_${PN} += "\
+DEPENDS += "\
     ${PYTHON_PN}-cython \
 "
-- 
2.17.1


