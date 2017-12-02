Return-Path: <bill.randle@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8AAC8786C8
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  2 Dec 2017 05:13:07 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id d21so7419519pll.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Dec 2017 21:13:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ThV/zo/6epujHUYrHGh8S3rp+eKHDPnT653sq6UmZr0=;
	b=T5YRLepJHIddGueR+k/1iT39jhnZANvFwm2wJn/Bx/gq1EDcFeDWO+Qnq+lrsDeH7s
	RFc4BiSQaDbnSSAEU5SdTtodNp84Of+V1ithAMeYUYDkP2aP9nzdRDVuL5Nod29Z0rN7
	8HhMzWDTXvHGk3SbtWizrVO5G1/0B6IQiEYSvcLq3MJZP41J3hnglseUBIADoUdD76Iv
	kMN/vr6FDJ81fwvNrN1YFkMCioBE+9E/R6i40W2RjhwYK7icZcPcpbSSHf63r9HlUVhF
	Qc3Kx3np7Om48WRJeOv7+RViUEC9rdanuCEZMfgEUsY0+2MwfKTpclUmZQ24Cp7+9ZrE
	NRnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ThV/zo/6epujHUYrHGh8S3rp+eKHDPnT653sq6UmZr0=;
	b=HTqwfLnyoazYhmeKfeUMTPkJLDtJ9ACbaarLtq9EhZSEY9TAUSF0b2hMYe1aQ3K6zA
	scGT6Cse7gaa550GFdeBQ8mM8v1wB1HRGnhj/z7OJOD5XJuy944QtK+vdsLbgVLrQsN5
	LGWUoowCc4Y5jva86kBAvy/4WoSDl4o2EYD5u8M/S3KWkXZ3imuP1uQ28n0AIOF20xo/
	Ih0Og51OyW4XFVPLWHBcZUioxgkLVRXJYxMZYd3+32vC8uKWEzhE6JFgl7VelRvd7cUZ
	zBPO8pe8T9KlIO1sZNNi593bv/PEXdYdrGFEPkRSJM2gLm/ERecvxjlmSlMqrvRPjf9O
	OseQ==
X-Gm-Message-State: AJaThX6KrHInkUU69++Jpw29W9vW4giZ0Iw5SdIpe1wOOvlG9un2asMj
	QI5wMqZq5m42c7apBER4jNIldQ==
X-Google-Smtp-Source: AGs4zMZRE9GRwTT1NTZh0iLdtRAQxRpOMi8myf6/3yNLx6NBhr4NyOuETqqWDzCfvsViMX7Qlxp/0A==
X-Received: by 10.84.248.145 with SMTP id q17mr8070034pll.416.1512191588408;
	Fri, 01 Dec 2017 21:13:08 -0800 (PST)
Received: from neosoft.neocat.org (184-100-225-25.ptld.qwest.net.
	[184.100.225.25]) by smtp.gmail.com with ESMTPSA id
	r1sm14681137pfg.98.2017.12.01.21.13.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 01 Dec 2017 21:13:07 -0800 (PST)
From: Bill Randle <bill.randle@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Dec 2017 21:12:44 -0800
Message-Id: <1512191576-2302-2-git-send-email-bill.randle@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1512191576-2302-1-git-send-email-bill.randle@gmail.com>
References: <1512191576-2302-1-git-send-email-bill.randle@gmail.com>
Cc: ticotim@gmail.com
Subject: [meta-python][PATCH 01/13] python[3]-editor: new recipes
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
X-List-Received-Date: Sat, 02 Dec 2017 05:13:07 -0000

Signed-off-by: Bill Randle <bill.randle@gmail.com>
---
 meta-python/recipes-devtools/python/python-editor.inc       | 9 +++++++++
 meta-python/recipes-devtools/python/python-editor_1.0.3.bb  | 2 ++
 meta-python/recipes-devtools/python/python3-editor_1.0.3.bb | 2 ++
 3 files changed, 13 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-editor.inc
 create mode 100644 meta-python/recipes-devtools/python/python-editor_1.0.3.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-editor_1.0.3.bb

diff --git a/meta-python/recipes-devtools/python/python-editor.inc b/meta-python/recipes-devtools/python/python-editor.inc
new file mode 100644
index 0000000..30650bd
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-editor.inc
@@ -0,0 +1,9 @@
+DESCRIPTION = "Programmatically open and editor, capture the result"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"
+
+SRC_URI[md5sum] = "0aca5f2ef176ce68e98a5b7e31372835"
+SRC_URI[sha256sum] = "a3c066acee22a1c94f63938341d4fb374e3fdd69366ed6603d7b24bed1efc565"
+
+PYPI_PACKAGE = "python-editor"
+
diff --git a/meta-python/recipes-devtools/python/python-editor_1.0.3.bb b/meta-python/recipes-devtools/python/python-editor_1.0.3.bb
new file mode 100644
index 0000000..f7a9a8c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-editor_1.0.3.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools
+require python-editor.inc
diff --git a/meta-python/recipes-devtools/python/python3-editor_1.0.3.bb b/meta-python/recipes-devtools/python/python3-editor_1.0.3.bb
new file mode 100644
index 0000000..8ad2b86
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-editor_1.0.3.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools3
+require python-editor.inc
-- 
2.7.4


