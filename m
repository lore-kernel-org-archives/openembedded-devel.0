Return-Path: <costamagna.gianfranco@gmail.com>
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
	[209.85.128.47])
	by mail.openembedded.org (Postfix) with ESMTP id 627A571C9B
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Nov 2018 15:17:01 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id r63-v6so8761145wma.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Nov 2018 07:17:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=6KUXQzZv81EF4OIq6zTTk03tU4e+mvaV/QQIpTLTecI=;
	b=ZLigLWhtbZh//JHZ56BNATymwdDy4vvqy89Xoiy/MO5gWRLCO+wGZiEHJX1tsDQYk5
	M0qiOTURDsePs8gxTK4GeUXBQMHwoozY2QXwqoZeVCZS4BPePOnh77HGTMBb8WDY/ZlP
	YiCtw5i6y2h6H64NJ5k3qeZXx9tZuBdzVhWr4Xmd+noZmVMfHcqYKVIt4/EtyCSgJ+Kw
	WwmtQQaUx9kAx1pJMJtruHt29u6zNP0qR3U07xYZ6BaOJ+RYaQ8VV5Mr2Y9Hv0McA/A4
	TuZtig63EOmZVhuChWd8l6pM3alKmBHvX30xYCcR3RC9Hwa1dcbOaQDDszdo0dZn5ppi
	Ox8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=6KUXQzZv81EF4OIq6zTTk03tU4e+mvaV/QQIpTLTecI=;
	b=tTsuRavTQJ4ebq99Y/gVyA2RrwqD+XDyhDYyWTvg6VivE13B3EMi8AwAtDZeY4GZal
	NwA3jdkkcuh/xcVmQ2nP9X++3xdaMFpyY/mo7K0rfXyDmhp2oDwcaP+AeIzkVazKkf8l
	szhpWuJElnnSOb58gJCDGXNCpdJrcO9zNJevzOhMKkbpQeARS8sUjqfwIXF3hzOGBmnx
	mhZvZJLI29yBea6GlAWdmyDEQJmDSeoO+3gNmNKtjGgxucRYKBaU2BCvJ4OrkitzUYoO
	wsb346R3NI110rhYDvNcmLnYuQCGJmlhC/74jZqj4o8W+dITc4tgQwkRx9IUlF0D83CM
	U6sg==
X-Gm-Message-State: AGRZ1gJVn1HMBv6YflR73EzQyq91bGDi+4oDXPapLdJ0sBR0bHzZ1lwU
	0G44xP5W77q77IG3gjYPhjTL6ZyC
X-Google-Smtp-Source: AJdET5fj8ckqQGUSCpybDaiwIqkdrTtYOMbu1MawYoE6XJK3cMuS+OHb7cWv9uKV3j7CL/c4/yRzXw==
X-Received: by 2002:a1c:d94b:: with SMTP id
	q72-v6mr6912564wmg.41.1541431021191; 
	Mon, 05 Nov 2018 07:17:01 -0800 (PST)
Received: from localhost.localdomain ([109.112.13.138])
	by smtp.gmail.com with ESMTPSA id
	w18-v6sm10945406wrn.66.2018.11.05.07.16.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Nov 2018 07:17:00 -0800 (PST)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  5 Nov 2018 16:16:52 +0100
Message-Id: <20181105151653.16248-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.17.1
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Subject: [meta-oe][PATCH 1/2] brotli: add initial recipe, based on meta-webkit layer
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
X-List-Received-Date: Mon, 05 Nov 2018 15:17:01 -0000

---
 meta-oe/recipes-extended/brotli/brotli_1.0.7.bb | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-oe/recipes-extended/brotli/brotli_1.0.7.bb

diff --git a/meta-oe/recipes-extended/brotli/brotli_1.0.7.bb b/meta-oe/recipes-extended/brotli/brotli_1.0.7.bb
new file mode 100644
index 000000000..b4d4773ee
--- /dev/null
+++ b/meta-oe/recipes-extended/brotli/brotli_1.0.7.bb
@@ -0,0 +1,14 @@
+SUMMARY = "Lossless compression library and tool"
+DESCRIPTIOM = "Brotli is a generic-purpose lossless compression algorithm \
+that it is similar in speed to deflate but offers more dense compression."
+HOMEPAGE = "https://github.com/google/brotli"
+BUGTRACKER = "https://github.com/google/brotli/issues"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=941ee9cd1609382f946352712a319b4b"
+
+SRC_URI = "git://github.com/google/brotli.git"
+# tag 1.0.7
+SRCREV= "d6d98957ca8ccb1ef45922e978bb10efca0ea541"
+S = "${WORKDIR}/git"
+
+inherit cmake lib_package
-- 
2.17.1


