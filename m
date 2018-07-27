Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id A62C878CDC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jul 2018 20:05:40 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id n6-v6so6320681qtl.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jul 2018 13:05:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=+9vBkC4yOZ6aZeltK0gniUNBkYdLfJuBUdSCbKCn+XI=;
	b=Q0+Yve+g4qFJo+j+BcaKwrW6HngdhIRLN9eDnREgjvKiksClPe1nY3iumsFZhlEB//
	GVkDqn0W3UdqIZisdx1Z25wf9rrYbwmKlbiMwDCtduSqN7N4YBOEuOSt05YNQht3rz4M
	e2lNKotGOS/cx66Gb6/ZqhWy0wbjE7hiXWWq0a3/7gH5aTNNCYlwg+BdhOfslr/SAm8c
	qAVTZ4J0b49MDs6hwMvnw9+r8W6ujOIOZ2w5HDSmpx2GEUxvRDHXQNfYUXjPpH8pP1AM
	UWWru9yhsxqcRlQEXMOLv3uF45A7aS+eCP/SmNhA8EV5U6RrBSTXJxBZBfEvzZrdDLmv
	Ifwg==
X-Gm-Message-State: AOUpUlGIPzgkc+fXVTUfNlnZi2OylZbhqmylwNI0mYRczrXuDfLtDGZ2
	WEuWpGYvBaR7i+desnGHCFvsrto8EG4=
X-Google-Smtp-Source: AAOMgpe4xd7yyuUL9SwrYXH2YmrhwDYkGpTsB4dhkW1wGwQyqPeVH532ALrqz8sfGNt2pwyJURTxIQ==
X-Received: by 2002:ac8:705a:: with SMTP id
	y26-v6mr7892522qtm.118.1532721941167; 
	Fri, 27 Jul 2018 13:05:41 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.61.164])
	by smtp.gmail.com with ESMTPSA id
	k3-v6sm3766628qkl.95.2018.07.27.13.05.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 27 Jul 2018 13:05:40 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Jul 2018 16:05:32 -0400
Message-Id: <1532721932-28435-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-alembic: update to version 1.0.0
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
X-List-Received-Date: Fri, 27 Jul 2018 20:05:40 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-alembic.inc                | 4 ++--
 .../python/{python-alembic_0.9.10.bb => python-alembic_1.0.0.bb}      | 0
 .../python/{python3-alembic_0.9.10.bb => python3-alembic_1.0.0.bb}    | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-alembic_0.9.10.bb => python-alembic_1.0.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-alembic_0.9.10.bb => python3-alembic_1.0.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-alembic.inc b/meta-python/recipes-devtools/python/python-alembic.inc
index 4de845c..477e89c 100644
--- a/meta-python/recipes-devtools/python/python-alembic.inc
+++ b/meta-python/recipes-devtools/python/python-alembic.inc
@@ -2,8 +2,8 @@ DESCRIPTION = "A database migration tool for SQLAlchemy"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c5f1361296835ff94bda73db7dd312a6"
 
-SRC_URI[md5sum] = "117dac728cd081739bdbed73fe252a7d"
-SRC_URI[sha256sum] = "1cd32df9a3b8c1749082ef60ffbe05ff16617b6afadfdabc680dcb9344af33d7"
+SRC_URI[md5sum] = "762ab9ba56d1c0b1bfbc7c9f7f849c92"
+SRC_URI[sha256sum] = "52d73b1d750f1414fa90c25a08da47b87de1e4ad883935718a8f36396e19e78e"
 
 PYPI_PACKAGE = "alembic"
 
diff --git a/meta-python/recipes-devtools/python/python-alembic_0.9.10.bb b/meta-python/recipes-devtools/python/python-alembic_1.0.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-alembic_0.9.10.bb
rename to meta-python/recipes-devtools/python/python-alembic_1.0.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-alembic_0.9.10.bb b/meta-python/recipes-devtools/python/python3-alembic_1.0.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-alembic_0.9.10.bb
rename to meta-python/recipes-devtools/python/python3-alembic_1.0.0.bb
-- 
2.7.4


