Return-Path: <bill.randle@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id F19B07850A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Nov 2017 05:48:14 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id e14so2577487pgr.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Nov 2017 21:48:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=eZGQBHz13uOteYA9Ok/+U2tfsV2k3zY7u8Uzeq/QU9A=;
	b=k7J5fVHfgp48C9gjdPsI1IgdDw0y5HVuNvBBaQz2HcIS7RfGhuhZRIthEK4ldrJGKJ
	NsE3DHSCgX5Wyetwa0+ToskN2OtYZPV5hPQdOJEOlsa+MawNNkYVlBtx8WEkXaAWbse6
	pLT4+dt1HTbPF1t7+/LvXLVymgTxFdQ2QpAdwFbp9s+xXh7GyjEVaBhILAj4CffcNAug
	RciTCX4Y75Yvi1h3em57FajYmi9F59ZDdfvkJRzC97cBpwR//vX0ajFO2JcTk7Cih+fm
	xqJG6SMmVEC2l11i9AxXyBuE4Sb5DkP9T8+sv+bQtzZ3XDrFKQKs2xP3ZHEop+xHsuAA
	YhTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=eZGQBHz13uOteYA9Ok/+U2tfsV2k3zY7u8Uzeq/QU9A=;
	b=c5M4+xTE7gIGofK71V71B/6juELRPdGSnnZfJrYuxE5z4EyVAgphbuT07YB8PkVupQ
	x6TW7g6PABiOIKwcmof0pdZb2tbTsXvOheXRzgQNdQsBdBNh2SF6bKOy+iE00nZUCndE
	/hHqcktLArs+JGv+iwhWdOBJNfjApObY15bBsWdx3ca3k0MXMoTOl0WLJGTx3Sn1yNCF
	dSeT7Exu71Tbb7l/XJ8Kv0S/h1m8mOZvvg8Hx7uSI/ckmKDTvIJbfXb02PUjS3NCOs+y
	sf7/kq708pO6UQ7UzLI2RIvcoVxpnRQt5tDjceOkKUwHSqPhF8cW8Opqmvp4VQIpdk7l
	+TXw==
X-Gm-Message-State: AJaThX5Ndy7T7N253zeZ9LKpRODsN507r2amc1fhTVT3WLGLaUNhxmmi
	saZ1ffFOPi8nBXPV2dDDP0OrsA==
X-Google-Smtp-Source: AGs4zMYHmxAYRr7iIZrwhB2krldJYOrQbGVLn4vcBO3v1Ym2SA82PiO53AhwIVJhxSJPj92EhCTmyA==
X-Received: by 10.98.211.73 with SMTP id q70mr5530487pfg.107.1512020895981;
	Wed, 29 Nov 2017 21:48:15 -0800 (PST)
Received: from neosoft.neocat.org (184-100-239-238.ptld.qwest.net.
	[184.100.239.238]) by smtp.gmail.com with ESMTPSA id
	s68sm6387336pfj.81.2017.11.29.21.48.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 29 Nov 2017 21:48:14 -0800 (PST)
From: Bill Randle <bill.randle@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Nov 2017 21:47:08 -0800
Message-Id: <1512020828-4040-10-git-send-email-bill.randle@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1512020828-4040-1-git-send-email-bill.randle@gmail.com>
References: <1512020828-4040-1-git-send-email-bill.randle@gmail.com>
Cc: ticotim@gmail.com
Subject: [meta-python][PATCH 09/12] python-visitor: move core of recipe to a .inc file
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
X-List-Received-Date: Thu, 30 Nov 2017 05:48:15 -0000

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


