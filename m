Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 5BFC978220
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Jul 2017 18:35:12 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id e199so11818812pfh.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Jul 2017 11:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=7BYFKh/PHmd+2OqNkHE2iZXLQsRmJR7MpD4xkvo+ThM=;
	b=doZs6hdR/1hjp9EBgz37JEpOEPFKQE+DkXXbgwDF2fyd5upZ0mgFFSqIj/Z/VxJpll
	ggpLDeLPRL5O8MslPf4dvjWkCprtFnCGAcHJEgYZXeUfMnMUPymLUaJ0mKEFse/CWPr7
	bOFo+0stgQf6LGqs7Sea0SMbz/6mJ12Nh4vETLTjwCFnRzIgpEkRyIEJdKuSiENcBgxF
	4KMCa6jFsUDIRr5NmZj/cfuaQ1ecQBwccm5ceNWeflpdMq3TRC3Gm7/Fi7zaMTRaOLvT
	/OqIxzPqssWzinCKzFfh4JEqE8cIAbZBwR3tzt2Vb7zb9M2yab3UdXhQEjwBpchC1eNv
	E2fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=7BYFKh/PHmd+2OqNkHE2iZXLQsRmJR7MpD4xkvo+ThM=;
	b=QZmRRaXZ5x7XyGW9a17067Pqpab5vdUdLC0421DmOWBoGn3YtjwzbBnbuHT7qH6X5B
	x55AmxwyOiQmHaAjnFKQjiwx8qnVpqCStVVTYj7Pfq3MmPt79hnbvuBAPgCZWV05cWcD
	d1ecADJmx/n7s5j5K3g1098YL9ZtWERhpiIka/nqaiB4AZWOlYBqriKpqqgcHIiyN3te
	XpWtR4YHpMUwJDG1iEO8xdCwnj5R9dOjkYbygglcZabXf0hzRIhKzmvZPRtL6Ljaz9al
	mOMIAkT7M4/vCPFbtL585ql30E93EHezcqkvLG2XrhqGdNKfkB/SwC+j2kaXIUof6j0I
	G8Cw==
X-Gm-Message-State: AIVw110XINpyqVp9BRTMFqWCSPqCXT2nbSMPJayxIyraqSU+8UQ6n/yk
	Rfz/5TN5HcUQXyju
X-Received: by 10.99.39.69 with SMTP id n66mr16379561pgn.94.1500057314052;
	Fri, 14 Jul 2017 11:35:14 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::7028])
	by smtp.gmail.com with ESMTPSA id
	70sm18639581pft.104.2017.07.14.11.35.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 14 Jul 2017 11:35:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Jul 2017 11:34:55 -0700
Message-Id: <20170714183456.22548-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170714183456.22548-1-raj.khem@gmail.com>
References: <20170714183456.22548-1-raj.khem@gmail.com>
Subject: [meta-webserver][PATCH 5/6] monkey: Link in libexecinfo on musl
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
X-List-Received-Date: Fri, 14 Jul 2017 18:35:13 -0000

Needed for backtrace() APIs

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-webserver/recipes-httpd/monkey/monkey_1.5.6.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta-webserver/recipes-httpd/monkey/monkey_1.5.6.bb b/meta-webserver/recipes-httpd/monkey/monkey_1.5.6.bb
index be8ed37b9..02d4040dd 100644
--- a/meta-webserver/recipes-httpd/monkey/monkey_1.5.6.bb
+++ b/meta-webserver/recipes-httpd/monkey/monkey_1.5.6.bb
@@ -7,6 +7,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2ee41112a44fe7014dce33e26468ba93"
 
 SECTION = "net"
 
+DEPENDS_append_libc-musl = " libexecinfo"
+
 SRC_URI = "http://monkey-project.com/releases/1.5/monkey-${PV}.tar.gz \
            file://monkey.service \
            file://monkey.init"
@@ -24,7 +26,13 @@ EXTRA_OECONF = "--plugdir=${libdir}/monkey/ \
                 --disable-plugins=mbedtls \
                 --debug \
                 --malloc-libc"
+
+EXTRA_OEMAKE += "LIBS='${LIBS}'"
+
 DISABLE_STATIC = ""
+CLEANBROKEN = "1"
+
+LIBS_append_libc-musl = " -lexecinfo"
 
 inherit autotools-brokensep pkgconfig update-rc.d systemd
 
-- 
2.13.3


