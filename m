Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 939A672FCC
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2017 23:03:10 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id 89so2144790wrr.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2017 15:03:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=ZvJ/e36MxVkZZAo4U9bHNUW8snb13vSyE9gcEkh7Ifo=;
	b=cspyzWEOT9/Rylvh2Ve3r30kIogKY3DKROrkqpg/3Xsp3/ticMgsRRIPRh/DzrMcTs
	pXvfo/+2eTSbkrSDU7UyM1FKy3p96lgXBPdUO6brhy5F0GCe/FvhXjVOj6ZaaLunZlCG
	fSwUzlOB2S6dsiaViHub5cGkAVJNSFm5X9SL3fooWh/mpl/ISUnkCiScG7xLb3fTHGI+
	95ND8WrxyRs26UbDoLjcMoCaXzQjKBYBVvPC2S8X79nqXCZQQs/+47fVbA02T47MwyBa
	0Lsf7HHzAy1pKpSdcI1rUA9pZgbSlHxXmN856CWW0twa8bH+HPDL1UvTN7Qaym5Mh7IA
	G/+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ZvJ/e36MxVkZZAo4U9bHNUW8snb13vSyE9gcEkh7Ifo=;
	b=KXRF4liD8wiQ4isHjOqbbOLCrYrYM7pmEIzEvZeU4mRY3Wh154QrsywEliNii2zw+O
	hV61Wyi5uCjabQwX/Of8JXEWxwHufcKX9laVXVmOtmYiF2qmaasX+7XR7lAhkk4n558G
	64bkLoXmMH+8aaWKDAtgaF5H6h6Hf8hwwV8BrWZcj+uhP7zWWh9n7+uLwAKd5f5Gn5Lh
	bUElaYJ+k7bEGLXlvVTB9mQsRTQbbLBz4Ror9tpkTcobqRQubDACLgRrdXgRLOI5j0gM
	arbAkY5ZZhm8cauriBACOSrVGCQT0e2gw6piD3FC1AHyQTWmB7KSrRrvx1KNGMf+8KFv
	fAlw==
X-Gm-Message-State: AMke39lsJ/TCZE0v/deANqtfSEVQrO/DsamgCV2Quua6JdJ0WdVsPnQplw0Xuiz7bszQVg==
X-Received: by 10.223.133.5 with SMTP id 5mr13318201wrh.175.1487804591272;
	Wed, 22 Feb 2017 15:03:11 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E912A1041E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e912:a104:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	q4sm3479696wrc.35.2017.02.22.15.03.10
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 Feb 2017 15:03:10 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Feb 2017 00:02:48 +0100
Message-Id: <20170222230250.30288-10-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170222230250.30288-1-schnitzeltony@googlemail.com>
References: <20170222230250.30288-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 09/11] postgresql: update 9.4.10 -> 9.4.11
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
X-List-Received-Date: Wed, 22 Feb 2017 23:03:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-support/postgresql/postgresql_9.4.10.bb | 11 -----------
 meta-oe/recipes-support/postgresql/postgresql_9.4.11.bb | 11 +++++++++++
 2 files changed, 11 insertions(+), 11 deletions(-)
 delete mode 100644 meta-oe/recipes-support/postgresql/postgresql_9.4.10.bb
 create mode 100644 meta-oe/recipes-support/postgresql/postgresql_9.4.11.bb

diff --git a/meta-oe/recipes-support/postgresql/postgresql_9.4.10.bb b/meta-oe/recipes-support/postgresql/postgresql_9.4.10.bb
deleted file mode 100644
index 5498350..0000000
--- a/meta-oe/recipes-support/postgresql/postgresql_9.4.10.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require postgresql.inc
-
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=3a9c1120056a102a8c8c4013cd828dce"
-
-SRC_URI += "\
-    file://remove.autoconf.version.check.patch \
-    file://not-check-libperl.patch \
-"
-
-SRC_URI[md5sum] = "1171df0426fe4da5a29f6cdaf2e8b812"
-SRC_URI[sha256sum] = "7061678bed1981c681ce54c76b98b6ec17743f090a9775104a45e7e1a8826ecf"
diff --git a/meta-oe/recipes-support/postgresql/postgresql_9.4.11.bb b/meta-oe/recipes-support/postgresql/postgresql_9.4.11.bb
new file mode 100644
index 0000000..e4d2eda
--- /dev/null
+++ b/meta-oe/recipes-support/postgresql/postgresql_9.4.11.bb
@@ -0,0 +1,11 @@
+require postgresql.inc
+
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=81b69ddb31a8be66baafd14a90146ee2"
+
+SRC_URI += "\
+    file://remove.autoconf.version.check.patch \
+    file://not-check-libperl.patch \
+"
+
+SRC_URI[md5sum] = "2fee03f2034034dbfcb3321a0bb0f829"
+SRC_URI[sha256sum] = "e3eb51d045c180b03d2de1f0c3af9356e10be49448e966ca01dfc2c6d1cc9d23"
-- 
2.9.3


