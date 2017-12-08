Return-Path: <bill.randle@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id F2BDD7868C
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Dec 2017 05:46:32 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id y89so6524975pfk.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Dec 2017 21:46:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=eZGQBHz13uOteYA9Ok/+U2tfsV2k3zY7u8Uzeq/QU9A=;
	b=fg6tfYc1Ao73JVLpmnjhtlAtY0sDkz69UqCsnLxavzgG1rrYRZNgeLQ0rKFEd3mTWp
	nYl4amCF116QRqUcECr8/+dnvSIDCV50lrbw2bdFadn0HiPa+jZjbI9EM2sPdDkFW5s7
	YtzvSabWg5V4kRC0R0qdtqAKbF8hG1EqicEKHEMK8sMFoeKzQGoqeFcgberRQs7lYcIU
	212N4JpR6V6G60I/d7Va7TPtxKYxLnZD7iH6FtZ7Xsilnw3fYqpjjlwA7K72eKZs2+Qa
	P6cRkt294j6if349Cy2c6BIpgH8gvz9UHqmOKPQ0nrnhEYh4LIFETLLs/rb1R4u/qTiP
	g/Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=eZGQBHz13uOteYA9Ok/+U2tfsV2k3zY7u8Uzeq/QU9A=;
	b=H2GlIXH6KLrFuMKhWdmA+Tz3K2p0c/SAJXZqUIRht0XD5dLzMaesY7g4qF4sBnYYEH
	C5zxzb2nLrBTwT5scgJ07/nm2GCaGH5D3kqfOgzhRDYY719m4Wt8Hc2Sl9o0rTJId85O
	35j5EjwNmAYgkvT+YptIrzFKhi5/7WyFuzJJCU1unrdSux1ocsMaNC4tvFROujFJ2nGV
	1W46a3dlSbVYByMtIKUgaWfnBKXPqAN2Y39SYFgvNjbLEsEabJZwvfn6Ut2cbI9Lp35C
	prmHbJh0mFaQ7Z0zTOS65rnNMX3L57YqhhCeft/B1kaQJQO+iZti23Plp8lpHvCthVRL
	5ZdA==
X-Gm-Message-State: AKGB3mIeHS3WJa+hZOVHPj5Xhpt1AF3VHZ5VRiyCeuuLLFDafsLYR7MR
	V4ciDIerFQnRYy8X+/N8Dx3e4A==
X-Google-Smtp-Source: AGs4zMaXlFtRmvzR707RWBy8qDA9Ag/ww6RjwGE9TcKmJ68LNUVCa17FW35JqC3rV1maUmFjYC2Lqw==
X-Received: by 10.159.245.145 with SMTP id a17mr16348454pls.276.1512711994099; 
	Thu, 07 Dec 2017 21:46:34 -0800 (PST)
Received: from neosoft.neocat.org (67-5-135-101.ptld.qwest.net. [67.5.135.101])
	by smtp.gmail.com with ESMTPSA id w12sm75701pge.59.2017.12.07.21.46.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Dec 2017 21:46:32 -0800 (PST)
From: Bill Randle <bill.randle@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Dec 2017 21:45:45 -0800
Message-Id: <20171208054548.26218-10-bill.randle@gmail.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171208054548.26218-1-bill.randle@gmail.com>
References: <20171208054548.26218-1-bill.randle@gmail.com>
Subject: [meta-python][V2 PATCH 09/12] python-visitor: move core of recipe to a .inc file
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
X-List-Received-Date: Fri, 08 Dec 2017 05:46:33 -0000

Signed-off-by: Bill Randle <bill.randle@gmail.com>
---
 meta-python/recipes-devtools/python/python-visitor.inc      | 6 ++++++
 meta-python/recipes-devtools/python/python-visitor_0.1.3.bb | 8 +-------
 2 files changed, 7 insertions(+), 7 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-visitor.inc

diff --git a/meta-python/recipes-devtools/python/python-visitor.inc b/meta-python/recipes-devtools/python/python-visitor.inc
new file mode 100644
index 0000000..8c2288c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-visitor.inc
@@ -0,0 +1,6 @@
+SUMMARY = "A tiny pythonic visitor implementation."
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148f94f483f3e1489"
+
+SRC_URI[md5sum] = "94a024ed0ec1b02b4497c15267d319ca"
+SRC_URI[sha256sum] = "2c737903b2b6864ebc6167eef7cf3b997126f1aa94bdf590f90f1436d23e480a"
diff --git a/meta-python/recipes-devtools/python/python-visitor_0.1.3.bb b/meta-python/recipes-devtools/python/python-visitor_0.1.3.bb
index 1236506..eee25a5 100644
--- a/meta-python/recipes-devtools/python/python-visitor_0.1.3.bb
+++ b/meta-python/recipes-devtools/python/python-visitor_0.1.3.bb
@@ -1,8 +1,2 @@
-SUMMARY = "A tiny pythonic visitor implementation."
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148f94f483f3e1489"
-
-SRC_URI[md5sum] = "94a024ed0ec1b02b4497c15267d319ca"
-SRC_URI[sha256sum] = "2c737903b2b6864ebc6167eef7cf3b997126f1aa94bdf590f90f1436d23e480a"
-
 inherit pypi setuptools
+require python-visitor.inc
-- 
2.7.4


