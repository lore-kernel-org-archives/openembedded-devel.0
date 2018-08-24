Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id BC4EA7963D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Aug 2018 16:35:05 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id j8-v6so4781108pff.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Aug 2018 09:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ujjVwHlvfWxHbvXd49YbvWSW+GtiF48Z1shBSEv5mjg=;
	b=cpi9USQ3Suo8CDZz3H8oh5+Dd5Pn37GqBNdlLEc2xRW76KyBkAF0fvrnLQLMY3C8l9
	Eai+5kfFMC3d16h2cIuU81scyRxt6G5oR9mmx+dxNGdL7D5vj2ZlnrxMcO6pAO4mbPYi
	EhBE6CE641e/GbgFAUfBc+TYgnHKscpG0yXsNYJigN/gAOzLj3yZDvUcHtVmHcdy4l8H
	ZrkunMbDJfNMNk1JAO+JbSdg5hZbCRtWR2T9TXm3xuZYl2KHZ0+FnyufYyXLq+LmTnlu
	MRb4Wv6iG+d8WrZ1lnilxsoS0W+4ahAa+QTogVVJMCrHM6ZSMrekfhEvfnKdONMFtdAl
	gRAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ujjVwHlvfWxHbvXd49YbvWSW+GtiF48Z1shBSEv5mjg=;
	b=rFcfhXLfM8b6fawl82RI4vBfDC1r0VStNaINrDj8UY6fy8GOoqhR71/xW9u+kfr/wI
	GvDNxDcmtQpKqu2z/mXE8Pxl6+12Cs9xHGMWsQW/Pix48/W9tltJSxSWWS6m8KGwb0hj
	RMG5Uqgk1uvRhA1VRF3dRECJowGjcR9MqHEj5tvtlX9iL9cBwpFaLu7SfrvfJi7hEzZF
	OGCYknS8jrQaVWOVhv1oULj5u7m4YL5aavhTRYSgYgb0E3lDvGYdTaEexTHu8Sp+Jk87
	ThURiX5IifgH5VGxWRw2YBnYKxyDaeo0ifY5y1jL4t49njBTgmAecyTaj4wrlwXnpFPK
	Ol3A==
X-Gm-Message-State: APzg51DWCmosqb8Y/Xvq4t2mbdMFDBQMzBbIqgQfnCHivwr9j6k8cCJR
	H4jfymWTMVlFR8ILoYwvSWNhvGG6
X-Google-Smtp-Source: ANB0VdYQt7Fd2HeTvTdCUCksvKBQ3Bb4PnoeEZx6ZyDNC55XkSEnhH/7/bYysWkuyM50p0jVrhXzzw==
X-Received: by 2002:a63:9c5:: with SMTP id
	188-v6mr2354437pgj.343.1535128506532; 
	Fri, 24 Aug 2018 09:35:06 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::4add])
	by smtp.gmail.com with ESMTPSA id
	f87-v6sm15708240pfh.168.2018.08.24.09.35.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 24 Aug 2018 09:35:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 Aug 2018 09:34:56 -0700
Message-Id: <20180824163456.10528-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180824163456.10528-1-raj.khem@gmail.com>
References: <20180824163456.10528-1-raj.khem@gmail.com>
Subject: [meta-python][PATCH 2/2] python-pyflame: Use SHA instead of tag in SRC_URI
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
X-List-Received-Date: Fri, 24 Aug 2018 16:35:05 -0000

tags are floating and bitbake will ping the remote host
and this will fail in BB_NO_NETWORK cases

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andrew Jeffery <andrew@aj.id.au>
---
 meta-python/recipes-devtools/python/python-pyflame.inc      | 2 +-
 meta-python/recipes-devtools/python/python-pyflame_1.6.6.bb | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-pyflame.inc b/meta-python/recipes-devtools/python/python-pyflame.inc
index 2ee79f7b8a..71fe769765 100644
--- a/meta-python/recipes-devtools/python/python-pyflame.inc
+++ b/meta-python/recipes-devtools/python/python-pyflame.inc
@@ -5,7 +5,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=2ee41112a44fe7014dce33e26468ba93"
 DEPENDS = "python"
 
-SRC_URI = "git://github.com/uber/pyflame.git;protocol=https;tag=v${PV}"
+SRC_URI = "git://github.com/uber/pyflame.git;protocol=https"
 S = "${WORKDIR}/git"
 
 inherit pkgconfig autotools
diff --git a/meta-python/recipes-devtools/python/python-pyflame_1.6.6.bb b/meta-python/recipes-devtools/python/python-pyflame_1.6.6.bb
index abf3ed7fee..8dedb89286 100644
--- a/meta-python/recipes-devtools/python/python-pyflame_1.6.6.bb
+++ b/meta-python/recipes-devtools/python/python-pyflame_1.6.6.bb
@@ -1,4 +1,6 @@
 require python-pyflame.inc
 
+# v1.6.6
+SRCREV = "8a9d8c2acc3b3bb027475b738134f1e6fff14e6c"
 SRC_URI += "file://0001-ptrace-Abstract-over-user_regs_struct-name-which-dif.patch"
 SRC_URI += "file://0001-symbol-Account-for-prelinked-shared-objects.patch"
-- 
2.18.0


