Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 1696271633
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Mar 2016 13:05:15 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id u128so6277262qkh.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Mar 2016 06:05:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=ZLImeRTxjnvkcq1wiiCnodSOcePLa59SRghYT9JWgzw=;
	b=PdPmrRiSyeqHL24Zg+h6eDsTYFyilDynPoCZacW86wrsfe76qFNPwYlgaQUZyBPdsg
	S24lWdK7IGigsL/Oq4XSkZDdUWFBA3AmLwGL0HXtCismRTbuy1xNik4ACrHSiod+j5Du
	7I7ysXS0+ZX5LL49Gu8APWR4YhMytnxPuzp8vQqwMxq/nSN381I9wVuJUvIcfyI9O4UZ
	AQXB95LrKclU3keHam1yJ0YsGr7HIA8eScWkhvGGUXvEvVtaSKYhzXiNbe/XiWogF9Oi
	eheyZBOwAjZAn1JmND21OvrRK2Nc3aupG+Kg5U4P6SKGH/gCrThM9DQSyLQpRArCySSU
	NZ3w==
X-Gm-Message-State: AD7BkJJZ+WsTXLyAXUQQwtbL4OoiLJOWd8LcRQUdoabqjm0rsZ58g9Wy+s92eBDdw9bDpQ==
X-Received: by 10.55.221.18 with SMTP id n18mr23331940qki.50.1458997516724;
	Sat, 26 Mar 2016 06:05:16 -0700 (PDT)
Received: from build-slave.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168])
	by smtp.gmail.com with ESMTPSA id x6sm7678649qka.16.2016.03.26.06.05.16
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 26 Mar 2016 06:05:16 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 26 Mar 2016 09:04:33 -0400
Message-Id: <bd1e45dd5b69c92d35a5655b26e009874e15a3f2.1458997082.git.derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1458997082.git.derek@asterius.io>
References: <cover.1458997082.git.derek@asterius.io>
In-Reply-To: <cover.1458997082.git.derek@asterius.io>
References: <cover.1458997082.git.derek@asterius.io>
Subject: [meta-python][PATCH 13/30] python-iso8601: update to 0.1.11
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
X-List-Received-Date: Sat, 26 Mar 2016 13:05:16 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-iso8601_0.1.10.bb | 8 --------
 meta-python/recipes-devtools/python/python-iso8601_0.1.11.bb | 8 ++++++++
 2 files changed, 8 insertions(+), 8 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-iso8601_0.1.10.bb
 create mode 100644 meta-python/recipes-devtools/python/python-iso8601_0.1.11.bb

diff --git a/meta-python/recipes-devtools/python/python-iso8601_0.1.10.bb b/meta-python/recipes-devtools/python/python-iso8601_0.1.10.bb
deleted file mode 100644
index f7e30cf..0000000
--- a/meta-python/recipes-devtools/python/python-iso8601_0.1.10.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-SUMMARY = "Simple module to parse ISO 8601 dates"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=ffb8415711cf5d3b081b87c3d0aff737"
-
-SRC_URI[md5sum] = "23acb1029acfef9c32069c6c851c3a41"
-SRC_URI[sha256sum] = "e712ff3a18604833f5073e836aad795b21170b19bbef70947c441ed89d0ac0e1"
-
-inherit pypi setuptools
diff --git a/meta-python/recipes-devtools/python/python-iso8601_0.1.11.bb b/meta-python/recipes-devtools/python/python-iso8601_0.1.11.bb
new file mode 100644
index 0000000..484cf12
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-iso8601_0.1.11.bb
@@ -0,0 +1,8 @@
+SUMMARY = "Simple module to parse ISO 8601 dates"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b05625f2336fa024e8d57e65c6595844"
+
+SRC_URI[md5sum] = "b06d11cd14a64096f907086044f0fe38"
+SRC_URI[sha256sum] = "e8fb52f78880ae063336c94eb5b87b181e6a0cc33a6c008511bac9a6e980ef30"
+
+inherit pypi setuptools
-- 
1.9.1


