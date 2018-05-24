Return-Path: <twoerner@gmail.com>
Received: from mail-it0-f51.google.com (mail-it0-f51.google.com
	[209.85.214.51])
	by mail.openembedded.org (Postfix) with ESMTP id A6E8E749DE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 May 2018 14:39:08 +0000 (UTC)
Received: by mail-it0-f51.google.com with SMTP id j186-v6so2645238ita.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 May 2018 07:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Kgi4C6pDQeb2FlspuZ7bulbPnG4UAxtaPbO7XF/IiIc=;
	b=urwoVmzaPvmNHsb+ZiWmETdWqWNQBLmzAkcHn2alKvJg7UuSqkF5QqPEVAE4I2G+Gs
	D0HiOU9gmKA7h1gosxARUItuQJJ3G2FxdLIlBJqtyqQSnIl+YAl60LGpqhcY8itYmmTH
	ozBbJOEKy0iO2RDNqMusS9eq0jVTF9g9bapvTFN0bQrotYWVx6LlSdZgL8te1CVQKj8B
	fMpSaWbkLRGucgpy5j42AktL86bEH1WNtp46G+U6iILpOe2yLHGN3PIp94ra9vnQozbH
	EcF8eDAMgYe1HUllk+G7LKbE5Br41p5MccRUc+kK4+IjiljK0tV5rziiWUQPhxMFAKn2
	CLEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Kgi4C6pDQeb2FlspuZ7bulbPnG4UAxtaPbO7XF/IiIc=;
	b=sWi2Q2bJ2ZT+wtSRETZgS40ZhhjBsoy4ntZmfiOrWVbR+8jd8nWA4To/Njn0ARYYQC
	VZRFuGHPMPsQSt8UJCbiLO9qZwmdSKVJNUA42qbf7DDHAMwYyifCPCX3u1SJSbUNgaGi
	XjMbuAxJZGmxKgsoRbWAmnmkBXq1XjbYVF91s9n5wg/aOk33NLFFz9xtfjBW7w8O0eya
	TR4kJc5wbfAsQYwJJOvPxPCld6Z5XLctxkzc9ddsB6h6m+TXGGXtOWprSA/O7irA7QtK
	AYkKoBIRsfWncgYbz8cwcJBfHnnoPIvpNoCdibUw5diKw0umYVWEF3ml/presnLUoGK3
	T1Cg==
X-Gm-Message-State: ALKqPwd5AIaz5umuLGzTNre7C9jMLcQ6GkXS7xNQdw4ZoqHRtit8Wofp
	aGt+6NXoxKfIYdS1AANCveLCBl4j
X-Google-Smtp-Source: AB8JxZpOJzcafEPUVrPlwU5fcKPkBQchEUYgya8cz8jWsdHIDGs/zLm4TTXQjuUasBajyzVGPGC/hw==
X-Received: by 2002:a24:36ca:: with SMTP id
	l193-v6mr9327837itl.103.1527172749128; 
	Thu, 24 May 2018 07:39:09 -0700 (PDT)
Received: from linux-uys3.suse ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id
	a43-v6sm2435261itj.11.2018.05.24.07.39.07
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 24 May 2018 07:39:07 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 May 2018 10:38:39 -0400
Message-Id: <20180524143854.24096-3-twoerner@gmail.com>
X-Mailer: git-send-email 2.17.0.582.gccdcbd54c
In-Reply-To: <20180524143854.24096-1-twoerner@gmail.com>
References: <20180524143854.24096-1-twoerner@gmail.com>
Subject: [meta-oe][master-next][PATCH v3 02/17] rocksdb: rely on cmake.bbclass to put cmake package files in dev package
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
X-List-Received-Date: Thu, 24 May 2018 14:39:09 -0000

The cmake.bbclass in oe-core now ensures that ${libdir}/cmake and
${datadir}/cmake end up in the dev package, so recipes no longer need to
provide custom packaging rules to handles these files.

	http://git.openembedded.org/openembedded-core/commit/?id=d91dc4666683a96e9d03cbbd21b8a546f9069c93

Originally-conceived-by: Andre McCurdy <armccurdy@gmail.com>
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb b/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb
index 9a2f9dd1c5..a3b06fd133 100644
--- a/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb
+++ b/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb
@@ -30,5 +30,3 @@ EXTRA_OECMAKE = "\
     -DWITH_TESTS=OFF \
     -DWITH_TOOLS=OFF \
 "
-
-FILES_${PN}-dev += "${libdir}/cmake"
-- 
2.17.0.582.gccdcbd54c


