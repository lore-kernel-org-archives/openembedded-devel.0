Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id 65F8779867
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Oct 2018 20:49:28 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id t6-v6so4383085plo.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Oct 2018 13:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=KJB1qBn0wSNidnA1xFGAt5Rr7sdsxqHd2ZLg+ZaBCQM=;
	b=B7Wxi8oX5fyzLLD/PI2WJ0glTiEbM4/o8J4AWBBfGG+J4+cRnkguSX9jf8Ra5QY4Ii
	1JshXnF43w6xh9+jW/e9bTCW9nnuwio9oZ2FqD+pI15IKbJjC0pt1WN566LWd91wLJtN
	ZwkHML8BxF9Z/ZmwFFilhYzjtvkgNpnbFFTaio/thpgMjU2Fq1v8Q7CWJWogvtSX523f
	Wi7aEGM7bTzb0RGkOiubnlSPfCopSjTiPmdvkTtSQ6QXr8P5+cEVnpXIl4PfZxuQzWcv
	oLw8EcBLFsIO5AcLYYstz2iGUUJTz+dQpPgiDGPVT+/q7Wdq9ZjcYNjVAGLTcTwC3yu1
	pThg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=KJB1qBn0wSNidnA1xFGAt5Rr7sdsxqHd2ZLg+ZaBCQM=;
	b=lNvWyfgew0PPGjDQQVBLC0mlOJXHDauwZWbqflTxzTAy9c9mVJFkLcueZg504bVr/l
	CPnt+58mHkYK3CRj02pb9P7Z7JrwVfUreexoyoUQjZKXHs2L3jyZBEPlIA56SCDti3YJ
	ocY5DAKQSg2UUeE7i45cYVptDa42A/EViQXhcqty0gP+myfDk7qxZFfStWk41/VkiPXt
	EPpdMLWeDWorFjnKerUv4pvhtdwzmWkM1DBGGVlzUQw7H4YNadw7n60tpWoxDLvgY9jP
	XobhS86xdxz2du+XFFDyCmaIzR+lxySsxH1Sv9KWOAuhw1K0SeEt+UC4wQpRhHSkrGms
	/pjw==
X-Gm-Message-State: AGRZ1gJIqlSaqiDIUOoRVNw1wzciaDR5iW7CEr0YLemN+jcyqheIvqno
	cLmmkFOoE1ovGMAgJ9vX4Y/zHoQxe9tE8g==
X-Google-Smtp-Source: AJdET5c2LSZ8xW7x/T5PsvGv70n2mC2CPKGZHPj10rXgVjHFR9kc+JY17aDfBpIZ8wxIIKlMclaQYQ==
X-Received: by 2002:a17:902:b109:: with SMTP id
	q9-v6mr674166plr.83.1540500569088; 
	Thu, 25 Oct 2018 13:49:29 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::2f5b])
	by smtp.gmail.com with ESMTPSA id
	p19-v6sm2540228pff.172.2018.10.25.13.49.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 25 Oct 2018 13:49:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 25 Oct 2018 13:49:15 -0700
Message-Id: <20181025204915.22540-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] libgit2: Upgrade to 0.27.5
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
X-List-Received-Date: Thu, 25 Oct 2018 20:49:28 -0000
Content-Transfer-Encoding: 8bit

add missing dep on libgcrypt

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/libgit2/libgit2_0.27.4.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/libgit2/libgit2_0.27.4.bb b/meta-oe/recipes-support/libgit2/libgit2_0.27.4.bb
index 59fb09c65b..e7f7688922 100644
--- a/meta-oe/recipes-support/libgit2/libgit2_0.27.4.bb
+++ b/meta-oe/recipes-support/libgit2/libgit2_0.27.4.bb
@@ -3,11 +3,11 @@ HOMEPAGE = "http://libgit2.github.com/"
 LICENSE = "GPL-2.0-with-GCC-exception & MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3f2cd5d3cccd71d62066ba619614592b"
 
-DEPENDS = "curl openssl zlib libssh2"
+DEPENDS = "curl openssl zlib libssh2 libgcrypt"
 
 SRC_URI = "git://github.com/libgit2/libgit2.git;branch=maint/v0.27"
-#v0.27.4
-SRCREV = "8b89f362a34fcccdf1c6c5f3445895b71d9c6d56"
+#v0.27.5
+SRCREV = "8e0b172981a046d19f1d9efa5acd6186bccbd3ce"
 
 S = "${WORKDIR}/git"
 
-- 
2.19.1


