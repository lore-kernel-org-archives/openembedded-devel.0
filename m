Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id E4F8B7458F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jul 2018 20:24:13 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id o2-v6so12285082qkc.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jul 2018 13:24:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=9OgcbaxtWQ574QEsFkaGrHHnyAGA70Lp7WMDRKgqrbM=;
	b=kbdvzyuJEzTkaDT5FpVgZTRXk0Hpyzt3AMuDyIvX+a3Ua9/Y15P/3MVm6YSksjpTL+
	wfbEHV0sjn6lZESC9YlGAEgkwo7WCm92PkCv9OimZUCPajTGpzIchXzk5OkGEWnfBVMT
	qEoyTMXwf1EhYH+uNGBN6+z/XnX7gKgt5rioUz1OAQ8J9T0CUsprhzOZyemvT9Vu/fsf
	w3ztXpY4Wch4z9hV6rcdl5zExnrCQ/oAbKuFuRvvFXYS5XztaQ+QmhsjTM6YMMdm1OVi
	VqvClS47c2B+NuXbrT9eLNBSMthfJKpsn1I9KGhRlSgNBKQluhww5Ju+X55nujB/mgpl
	o/8w==
X-Gm-Message-State: APt69E1mtoZEsa/agwyxZUH+qyp7clK9SYCclBDj1rSPZ0NpYAWyZ612
	/aZxbwfEl8F0wTZ6qXrZO99VFhDh
X-Google-Smtp-Source: AAOMgpd9zgCYRVhoFVaA1ii2cyFQWf3VXN/dDXsMsFDkz2nLoxhgMQLnwrMBx9MrBRK/gJ3IptixKg==
X-Received: by 2002:a37:c887:: with SMTP id
	t7-v6mr23437921qkl.300.1531254254429; 
	Tue, 10 Jul 2018 13:24:14 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.61.164])
	by smtp.gmail.com with ESMTPSA id
	v71-v6sm16440445qkl.42.2018.07.10.13.24.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 10 Jul 2018 13:24:13 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Jul 2018 16:24:06 -0400
Message-Id: <1531254246-6022-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-astroid: update to version 1.6.5
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
X-List-Received-Date: Tue, 10 Jul 2018 20:24:14 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-astroid.inc                | 4 ++--
 .../python/{python-astroid_1.6.3.bb => python-astroid_1.6.5.bb}       | 0
 .../python/{python3-astroid_1.6.3.bb => python3-astroid_1.6.5.bb}     | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-astroid_1.6.3.bb => python-astroid_1.6.5.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-astroid_1.6.3.bb => python3-astroid_1.6.5.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-astroid.inc b/meta-python/recipes-devtools/python/python-astroid.inc
index ead2b6e..fae0f13 100644
--- a/meta-python/recipes-devtools/python/python-astroid.inc
+++ b/meta-python/recipes-devtools/python/python-astroid.inc
@@ -4,8 +4,8 @@ SECTION = "devel/python"
 LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-SRC_URI[md5sum] = "7d7dc000b25f0cbfcca20cb9a8dc0310"
-SRC_URI[sha256sum] = "35cfae47aac19c7b407b7095410e895e836f2285ccf1220336afba744cc4c5f2"
+SRC_URI[md5sum] = "2dd01ef0d5b5f0fc754c1ba40137b61c"
+SRC_URI[sha256sum] = "fc9b582dba0366e63540982c3944a9230cbc6f303641c51483fa547dcc22393a"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-astroid_1.6.3.bb b/meta-python/recipes-devtools/python/python-astroid_1.6.5.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-astroid_1.6.3.bb
rename to meta-python/recipes-devtools/python/python-astroid_1.6.5.bb
diff --git a/meta-python/recipes-devtools/python/python3-astroid_1.6.3.bb b/meta-python/recipes-devtools/python/python3-astroid_1.6.5.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-astroid_1.6.3.bb
rename to meta-python/recipes-devtools/python/python3-astroid_1.6.5.bb
-- 
2.7.4


