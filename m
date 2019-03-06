Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
	[209.85.210.179])
	by mail.openembedded.org (Postfix) with ESMTP id 3E8127CC9F
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Mar 2019 05:46:03 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id q17so7613685pfh.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Mar 2019 21:46:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=HRCNJWl2X3LqO4wjLjBlAvxZli7nuiv5wS1oAEupoqM=;
	b=e/Reu9JNRC5kzueHFhPdiZ1suXkp3MAEWQcg4kOHZT/SFF/2PiPEcKjxyurJq0sjos
	zJs1cZ9t5rkNIBSVBsKrzZ6exWbQbSbrZV6HlYK0wrG5eREMPIHWkWmOEyid4lSxb9cN
	o+CMvXw6PJgQBwhpRpKMVC252BoabX7a5+IYhu+ncK9IJlkJde8K2kWd1anCOcgUUy44
	XRy1ZcS+i1ugO5vAvemxvDNEQBKEpHpDx0vUoP8O9g5OWjKdb6zkSHLlGhKNg15HioX9
	wjl+vovwxSR12X2ojcxZ/rutsctwM6e6I8+mhiErNOMQBfC1HbLQ4pBuoP0w6YgolWsn
	6YCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=HRCNJWl2X3LqO4wjLjBlAvxZli7nuiv5wS1oAEupoqM=;
	b=FH4IlvKc33U0wjuMMDRo6nJ9CieYubMr3Mz8n5h0zcTnT4ImX65ompvPLvTG5Ka6I+
	L1zksyUIGzEWz1dYS0dGiTKXWtpJ23a94mRxTZ/IONq8f+F0tlxW32maZEc+HpL23JTb
	uW7b+2JnUuFkT9u+zDttezrCTvjdtamK+k/iVF8ip77t4exij5PGz9QfOlxUIlAz9LCj
	6NtKkaAV1RrtiBhlvGOPwAxBreT4vq0sJEUkCCmPL3NX4ebpeDQwz1tABU0Zj6Oc0eiY
	a33pDgVOGhI5HlqTf4WW9REAb+xDD96OIENv0UEv6R86wJ3jJduXp7Mfh1PfbQ4m4Q/C
	EfHQ==
X-Gm-Message-State: APjAAAVlYm/YS7IJwfFmu3yqQZTiGwEQrbkOvjb5LEzXBYkZa825nFr4
	QtMdWwvkgnMlhSgLwnhLEg6GT7WA
X-Google-Smtp-Source: APXvYqxK6yTv4vSNxJKpeYyGqM3+OC/44o++VrnlHWMIjGK2NmBEBepsTgIx4vVxnlSqiNo0Xk1uNQ==
X-Received: by 2002:a65:6259:: with SMTP id q25mr4783945pgv.235.1551851164097; 
	Tue, 05 Mar 2019 21:46:04 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::3401])
	by smtp.gmail.com with ESMTPSA id m24sm1001144pgv.1.2019.03.05.21.46.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Mar 2019 21:46:03 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Mar 2019 21:45:48 -0800
Message-Id: <20190306054548.16430-12-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190306054548.16430-1-raj.khem@gmail.com>
References: <20190306054548.16430-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 12/12] libmxml: Upgrade to 3.0 release
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
X-List-Received-Date: Wed, 06 Mar 2019 05:46:03 -0000
Content-Transfer-Encoding: 8bit

License-Update: Switch to Apache-2.0 as upstream has switched

https://github.com/michaelrsweet/mxml/commit/f166ad1977f2f13295689772a5d9e442f73d46f1#diff-9879d6db96fd29134fc802214163b95a

Fix build on risc-v

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/libmxml/libmxml_git.bb | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-support/libmxml/libmxml_git.bb b/meta-oe/recipes-support/libmxml/libmxml_git.bb
index 542fe81575..b17fc67e0a 100644
--- a/meta-oe/recipes-support/libmxml/libmxml_git.bb
+++ b/meta-oe/recipes-support/libmxml/libmxml_git.bb
@@ -1,13 +1,14 @@
 DESCRIPTION = "Tiny XML Library"
-LICENSE = "Mini-XML-License"
-LIC_FILES_CHKSUM = "file://COPYING;md5=a6ba38606d63bb042c5d8cfee182e120"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 HOMEPAGE = "https://www.msweet.org/mxml/"
 BUGTRACKER = "https://github.com/michaelrsweet/mxml/issues"
 
 SRC_URI = "git://github.com/michaelrsweet/mxml.git"
-SRCREV = "ba3cca82e15a88a9cc6afb60f059288a99afc703"
+SRCREV = "c7755b6992a2afdd34dde47fc9be97f1237cfded"
 S = "${WORKDIR}/git"
-PV = "2.12+git${SRCPV}"
+# v3.0
+PV = "3.0"
 
 CONFIGUREOPTS = " --prefix=${prefix} \
                   --bindir=${bindir} \
@@ -28,6 +29,8 @@ CONFIGUREOPTS = " --prefix=${prefix} \
                 "
 
 do_configure() {
+    install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess ${S}
+    install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S}
     ./configure ${CONFIGUREOPTS} --enable-shared
 }
 
-- 
2.21.0


