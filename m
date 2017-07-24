Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 3919E71C54
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jul 2017 18:38:01 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id t2so10700875qkc.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jul 2017 11:38:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=jGeOoV/4zlWCPzGQpt9hQWWlqrou1CJCuknsPvEeXyk=;
	b=O8sWXmn2PPS7mPmE9tchzUelB6OZlpnAdnywSdO6Sx4Hw+0IFt4CKeKpIxaAg1eP2w
	ItWbzCGW5pVztLCagj31AYMaF+E5+AZM63Op9h5IgJagbvq7IHZG5veiDhIEqiHPJJtw
	Bu0PsWyG6AqqNnOGWp6POEKLiKA9Y4AkR7U5Al0vDeDEsdP8rdrJ/L5E1KfTpSoS8zyG
	1NdddjFxWvEY+8GfEOFL+6slvIqhC6XisYBQ5J0YYOKPBpXbxMboYDTgUx5EvWc1Xy6m
	XMI7BJTsf0NSs1E2S9ZnkMZn8xBeapzGRpjqmLhGKV8/g5XfaxDFl7tkWs8ZMT1XrMF9
	daTw==
X-Gm-Message-State: AIVw110LxfXIxgm04/z6Os/tVD+CnXa0cgCJ9eYbTQHg1hQw/e65tJYy
	NowdikEEGjAojP5akhw=
X-Received: by 10.55.164.17 with SMTP id n17mr20802193qke.325.1500921482168;
	Mon, 24 Jul 2017 11:38:02 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.81.71])
	by smtp.gmail.com with ESMTPSA id
	r25sm8539157qki.42.2017.07.24.11.38.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 24 Jul 2017 11:38:01 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Jul 2017 14:37:55 -0400
Message-Id: <1500921475-15664-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pycparser: update to version 2.18
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
X-List-Received-Date: Mon, 24 Jul 2017 18:38:01 -0000

Update license checksum and verify terms are unchanged

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pycparser.inc            | 6 +++---
 .../python/{python-pycparser_2.17.bb => python-pycparser_2.18.bb}   | 0
 .../python/{python3-pycparser_2.17.bb => python3-pycparser_2.18.bb} | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pycparser_2.17.bb => python-pycparser_2.18.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pycparser_2.17.bb => python3-pycparser_2.18.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pycparser.inc b/meta-python/recipes-devtools/python/python-pycparser.inc
index 4913f42..d2fdbfd 100644
--- a/meta-python/recipes-devtools/python/python-pycparser.inc
+++ b/meta-python/recipes-devtools/python/python-pycparser.inc
@@ -1,9 +1,9 @@
 SUMMARY = "Parser of the C language, written in pure Python"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=d0cfca7bbc0610f849707d9e4fd82eac"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=86f1cedb4e6410a88ce8e30b91079169"
 
-SRC_URI[md5sum] = "ca98dcb50bc1276f230118f6af5a40c7"
-SRC_URI[sha256sum] = "0aac31e917c24cb3357f5a4d5566f2cc91a19ca41862f6c3c22dc60a629673b6"
+SRC_URI[md5sum] = "72370da54358202a60130e223d488136"
+SRC_URI[sha256sum] = "99a8ca03e29851d96616ad0404b4aad7d9ee16f25c9f9708a11faf2810f7b226"
 
 BBCLASSEXTEND = "native nativesdk"
 
diff --git a/meta-python/recipes-devtools/python/python-pycparser_2.17.bb b/meta-python/recipes-devtools/python/python-pycparser_2.18.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pycparser_2.17.bb
rename to meta-python/recipes-devtools/python/python-pycparser_2.18.bb
diff --git a/meta-python/recipes-devtools/python/python3-pycparser_2.17.bb b/meta-python/recipes-devtools/python/python3-pycparser_2.18.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pycparser_2.17.bb
rename to meta-python/recipes-devtools/python/python3-pycparser_2.18.bb
-- 
2.7.4


