Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
	[209.85.215.174])
	by mail.openembedded.org (Postfix) with ESMTP id 7F4F37F8AA
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Nov 2019 18:10:57 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id k13so16047532pgh.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Nov 2019 10:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=4/IQbElFtUASzNzydS6PwBf/veI9DZVcgBbWUp382OQ=;
	b=Yo3YhrFssv7lYyxAbgdxD8aGytRqrHxNYoApEqIUQzUl+dFWASc8zWQE4fkbF2fh4b
	B3qDmgUAenloQRKON+XhD7PvnbT3cL5n4+Yw1UBa6Qy9ynqfZdDV9PKnXb8P0ZgQvt+1
	kiZrBUaQG+JhNxxAoETqFi+TQStXoTXwIg5wK7qHxHM4nKziBSLRXENS1IMQYxQJ2swv
	+NIreXP7kyyhAgNdEJcOrWq9WLibPAqgvIXwW06HSsh7ppCUgdrDKgc5CI7wT0msuVbq
	V44Y8RBV5dS2lSsLFHm3/o0IMF9VjYw+JpNwzkb6i7bE12gAUlDvW7qRmZephKkIQNZe
	Z10Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=4/IQbElFtUASzNzydS6PwBf/veI9DZVcgBbWUp382OQ=;
	b=uORdk3MPYaSHuEYqsNulysNV0EfCnm/5nRNIkyi4Mz9yeptFuEWgVVHWkeajS2UaLB
	FykInfkSsg4Buh+n0cJ+W0P/6/vs3SY3cAAl5eg2EFpAHKRGVLCpFlaG9ED2nWDVYKm1
	52k86ShqyshwZppf7let6feqy74lZ1r6mbHeVTKrVNQCDWw5eGsZNjh6oByUxBzaQFjb
	kp+mY4RewyTB0AcGZdp5phd4WGAJQBwGNx3qLMYXOY5pGn8ttiuLnoqwh6Sw/6sDQsbE
	kE1WWKKSkB//UKBe4dxgNW5gg8XMmSj6gymJqauWblByUdy3LM5bB6w15KpvmVX6LbOt
	Oqqw==
X-Gm-Message-State: APjAAAWrjsb2lttnZmRkj7cxttVvIzX3UhJNajfnoTg/BFdKz1pBSDJ4
	6bXGuY6FQLyUjPmVCKGoEyF/Vi4Q
X-Google-Smtp-Source: APXvYqyw1Q3CBXJLv1qNPtS4XTHNUG3enKE436MHTPxNIg8RlLIJN52F0uG+CVSC3Ukf3V2xJ1Nmcg==
X-Received: by 2002:a62:1cd6:: with SMTP id
	c205mr15618128pfc.179.1575137458416; 
	Sat, 30 Nov 2019 10:10:58 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:c050:b516:8fc6:8cbf])
	by smtp.gmail.com with ESMTPSA id d6sm490762pju.8.2019.11.30.10.10.57
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 30 Nov 2019 10:10:58 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 30 Nov 2019 10:10:40 -0800
Message-Id: <866866c06d6a98b4f9e298a39de7383485751165.1575137343.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1575137343.git.akuster808@gmail.com>
References: <cover.1575137343.git.akuster808@gmail.com>
Subject: [PATCH 10/15] rsyslog: fix CVE-2019-17041
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
X-List-Received-Date: Sat, 30 Nov 2019 18:10:57 -0000

From: Trevor Gamblin <trevor.gamblin@windriver.com>

Backport fix to zeus; master branch already has v8.1910.0

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...rwardedfrom-bugfix-potential-misadressing.patch | 43 ++++++++++++++++++++++
 .../recipes-extended/rsyslog/rsyslog_8.1908.0.bb   |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta-oe/recipes-extended/rsyslog/rsyslog/0001-pmaixforwardedfrom-bugfix-potential-misadressing.patch

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/0001-pmaixforwardedfrom-bugfix-potential-misadressing.patch b/meta-oe/recipes-extended/rsyslog/rsyslog/0001-pmaixforwardedfrom-bugfix-potential-misadressing.patch
new file mode 100644
index 0000000..0b32766
--- /dev/null
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog/0001-pmaixforwardedfrom-bugfix-potential-misadressing.patch
@@ -0,0 +1,43 @@
+From 10549ba915556c557b22b3dac7e4cb73ad22d3d8 Mon Sep 17 00:00:00 2001
+From: Rainer Gerhards <rgerhards@adiscon.com>
+Date: Fri, 27 Sep 2019 13:36:02 +0200
+Subject: [PATCH] pmaixforwardedfrom bugfix: potential misadressing
+
+---
+ contrib/pmaixforwardedfrom/pmaixforwardedfrom.c | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+Upstream-Status: Backport [https://github.com/rsyslog/rsyslog/pull/3884]
+CVE: CVE-2019-17041
+Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
+
+diff --git a/contrib/pmaixforwardedfrom/pmaixforwardedfrom.c b/contrib/pmaixforwardedfrom/pmaixforwardedfrom.c
+index 37157c7d4..ebf12ebbe 100644
+--- a/contrib/pmaixforwardedfrom/pmaixforwardedfrom.c
++++ b/contrib/pmaixforwardedfrom/pmaixforwardedfrom.c
+@@ -109,6 +109,10 @@ CODESTARTparse
+ 	/* bump the message portion up by skipLen(23 or 5) characters to overwrite the "Message forwarded from
+ " or "From " with the hostname */
+ 	lenMsg -=skipLen;
++	if(lenMsg < 2) {
++		dbgprintf("not a AIX message forwarded from message has nothing after header\n");
++		ABORT_FINALIZE(RS_RET_COULD_NOT_PARSE);
++	}
+ 	memmove(p2parse, p2parse + skipLen, lenMsg);
+ 	*(p2parse + lenMsg) = '\n';
+ 	*(p2parse + lenMsg + 1)  = '\0';
+@@ -120,6 +124,11 @@ really an AIX log, but has a similar preamble */
+ 		--lenMsg;
+ 		++p2parse;
+ 	}
++	if (lenMsg < 1) {
++		dbgprintf("not a AIX message forwarded from message has nothing after colon "
++			"or no colon at all\n");
++		ABORT_FINALIZE(RS_RET_COULD_NOT_PARSE);
++	}
+ 	if (lenMsg && *p2parse != ':') {
+ 	DBGPRINTF("not a AIX message forwarded from mangled log but similar enough that the preamble has "
+ 		"been removed\n");
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.1908.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.1908.0.bb
index bd0dbc1..f9e4442 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.1908.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.1908.0.bb
@@ -24,6 +24,7 @@ SRC_URI = "http://www.rsyslog.com/download/files/download/rsyslog/${BPN}-${PV}.t
            file://use-pkgconfig-to-check-libgcrypt.patch \
            file://run-ptest \
            file://0001-Out-of-bounds-issue.patch \
+           file://0001-pmaixforwardedfrom-bugfix-potential-misadressing.patch \
 "
 
 SRC_URI_append_libc-musl = " \
-- 
2.7.4


