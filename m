Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f43.google.com (mail-pl0-f43.google.com
	[209.85.160.43])
	by mail.openembedded.org (Postfix) with ESMTP id E608A74CAF
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jun 2018 19:19:29 +0000 (UTC)
Received: by mail-pl0-f43.google.com with SMTP id o18-v6so5068004pll.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jun 2018 12:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=aMp1YEfKWXlGd0zL683hdOMKRA4hY3Z+PuYvA0sCfAQ=;
	b=QNr228dXMyeXn1tPticbDIeCcCuE/zWbAuuFahshDPg73DtsdYg3uCAGogNPuBHPMK
	izVINvthiCV54bUPwELCKzvJ09vx3mNMbE1NhUNHe8gpgJwYK43B+e3g7/wV+VF6szRT
	0m56dTSAm8D31qI3yznzf9R/WKZbzJfRXrHYZx8HAAXOiM3/5X0DeC7u6aeosu8NqqK1
	B1RzUajUF2fRdRByMkJKCm5joHFCAHjaj7T4pbEZFRGQjbKZd8i8cXY6c+GmdJq6+nS/
	8SP9DwCWFVMNY/JEHOdszxkl4YVIig41ZkScuJe5nT6IJlwOxfey4tIms97zXwMC84V0
	7Yig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=aMp1YEfKWXlGd0zL683hdOMKRA4hY3Z+PuYvA0sCfAQ=;
	b=JR3bSjE8bj08PO5jjkIz7aPB5bVKlKKURf5TENuGU7wF9+N+PEjyQ4jZ7/oODdvF4o
	eIdjbLZ1HwuKtFoiHEG5VehaShaeauH/gKm0dxjdEfylKnlj7TOHvr92LbE3OHwWpSX7
	y2z7AE8LbJfFa7cJSsJpW1mUxsLCkEZ9V1yUOqgErstpiGIBO8vKv8X6+BsCsu8juJkh
	1JC4X6mmSaHdkPW52YJny0fCbtP74aoDVTTspydHf4ne8q96YQZm22i+HT24WA4DP327
	SSSblBDVu+E0Q3ztaEIQW8lLzGjz66E5e66nr2tKseCwuXMvm6uXrh+SR2ivsGwg7+xO
	pqXg==
X-Gm-Message-State: APt69E3YN3QOh5XyLLsk79cfIMWg5TFmh18eHGOalBnLdSTU6moejEi/
	cg5yxBEg6DMMtjWDXmAGHeqpeQ==
X-Google-Smtp-Source: ADUXVKLxuRFAzD4YpqPMR/ZDfkQgyRCPj7yL5fpgWqo4qgZe9p5vq4wywcDDw25n4jeguM5FU9ZEKg==
X-Received: by 2002:a17:902:381:: with SMTP id
	d1-v6mr9602846pld.309.1529867970717; 
	Sun, 24 Jun 2018 12:19:30 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::91a0])
	by smtp.gmail.com with ESMTPSA id
	m11-v6sm36700461pfj.25.2018.06.24.12.19.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 24 Jun 2018 12:19:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 24 Jun 2018 12:18:27 -0700
Message-Id: <20180624191845.31082-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180624191845.31082-1-raj.khem@gmail.com>
References: <20180624191845.31082-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 02/20] gperftools: add the setting of COMPATIBLE_HOST back
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
X-List-Received-Date: Sun, 24 Jun 2018 19:19:30 -0000

From: Chen Qi <Qi.Chen@windriver.com>

This setting was deleted, but on mips and glibc, we still have this
problem. So add this setting back, but limit it to glibc.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/gperftools/gperftools_2.6.1.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-support/gperftools/gperftools_2.6.1.bb b/meta-oe/recipes-support/gperftools/gperftools_2.6.1.bb
index ecac6c5cc8..e475663f22 100644
--- a/meta-oe/recipes-support/gperftools/gperftools_2.6.1.bb
+++ b/meta-oe/recipes-support/gperftools/gperftools_2.6.1.bb
@@ -19,6 +19,10 @@ inherit autotools
 
 S = "${WORKDIR}/git"
 
+# On mips, we have the following error.
+#   do_page_fault(): sending SIGSEGV to ls for invalid read access from 00000008
+#   Segmentation fault (core dumped)
+COMPATIBLE_HOST_mipsarch_libc-glibc = "null"
 # Disable thumb1
 # {standard input}: Assembler messages:
 # {standard input}:434: Error: lo register required -- `ldr pc,[sp]'
-- 
2.18.0


