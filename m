Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f178.google.com (mail-pf0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id A76E777FFE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jun 2017 02:08:41 +0000 (UTC)
Received: by mail-pf0-f178.google.com with SMTP id q86so25368693pfl.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Jun 2017 19:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Hj2RKKzuNCzpAlq4M1fF9C7isH8dhEgSYnvRq9pOzAE=;
	b=hsiwIJOh/mMxjvvtnIjJvw4sR7BvW8HtG+FWY0YdQ91l6duQIBmbjckiNFfgWUiNvG
	UHEkUf1dnwz0WILxMLBrxF2jNdPycK0K4cDl8JC/RyOVCmAUgJByrk2zAFB2WyAgcybd
	LEHU2TDu8MNsKjcRJRbfNpYDRGSSGNZh6T8rVtK9hPlpmlkyX0GwlRAE6R3UISGNTLqF
	UJimQ3Fzew9yP4zQaMZ6kUlAUyIQs19Ng5aD4FrPGKOLM3nmKcHj5bNl0g7B9RF59irs
	Q6cJ8Szgy5pntgYuDeqRM0CYJmk64fJIlfgfyCkA5cRMZeM2dhgwRqZdkNHoudgCs/y4
	dttg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Hj2RKKzuNCzpAlq4M1fF9C7isH8dhEgSYnvRq9pOzAE=;
	b=GrFxRysjo8aAwasDQuUppV1q9LTSLtb0BBUUE9kbmHDHQo9gUEjTWiFqMnA0qCeENt
	2vYdkfbvqP+iOI+cJAmN9zchcpsiuG98wVnB1Xc4RR3LKkJLLyyYAFoKgQ6fJaQAYepv
	qZM5LAq/M4OVqG0QV+lPeN3P4if1wptTsaeJMf3FvYDRWuHTpIBAMtSb9J5q9JkpYQY2
	ZYlUvNesiOgzowwtTlMO4LfxqLRadata+wMySwZ3pfqz/X90mwII0pQ5IfD+ZTtMW8/O
	/VgHPaT+AOvrartq+1PBifrTJ32Uk9mEbxL3xGSiJ4AjhrCp4AZy4ArHcRBjIWC3PyuF
	bPDA==
X-Gm-Message-State: AKS2vOzV0vmyU7zsbTHCpmRRyC4PWHpmHtU8D8D/96qhCxb+7OlV8z7u
	3prRldrh8tpR/VfS
X-Received: by 10.99.135.73 with SMTP id i70mr8241481pge.74.1498615722308;
	Tue, 27 Jun 2017 19:08:42 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id b8sm1003591pfd.65.2017.06.27.19.08.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Jun 2017 19:08:41 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Jun 2017 19:08:10 -0700
Message-Id: <20170628020819.17047-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170628020819.17047-1-raj.khem@gmail.com>
References: <20170628020819.17047-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 04/13] umip: Fix buid with hardening
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
X-List-Received-Date: Wed, 28 Jun 2017 02:08:41 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Add-format-string-to-fprintf-call.patch   | 26 ++++++++++++++++++++++
 meta-oe/recipes-connectivity/umip/umip_1.0.bb      |  9 ++++----
 2 files changed, 31 insertions(+), 4 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/umip/files/0001-Add-format-string-to-fprintf-call.patch

diff --git a/meta-oe/recipes-connectivity/umip/files/0001-Add-format-string-to-fprintf-call.patch b/meta-oe/recipes-connectivity/umip/files/0001-Add-format-string-to-fprintf-call.patch
new file mode 100644
index 000000000..8e5f4da36
--- /dev/null
+++ b/meta-oe/recipes-connectivity/umip/files/0001-Add-format-string-to-fprintf-call.patch
@@ -0,0 +1,26 @@
+From a0ad5128d14b022239445e251cf4a9826e86aa96 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 27 Jun 2017 07:48:31 -0700
+Subject: [PATCH] Add format string to fprintf() call
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/vt.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/vt.c b/src/vt.c
+index 795d393..a533d3d 100644
+--- a/src/vt.c
++++ b/src/vt.c
+@@ -499,7 +499,7 @@ static int vt_cmd_dump_candidates(const struct vt_handle *vh,
+ 		}
+ 		llen += cmdlen;
+ 
+-		ret = fprintf(vh->vh_stream, e->cmd);
++		ret = fprintf(vh->vh_stream, "%s", e->cmd);
+ 		if (ret < 0)
+ 			return ret;
+ 
+-- 
+2.13.2
+
diff --git a/meta-oe/recipes-connectivity/umip/umip_1.0.bb b/meta-oe/recipes-connectivity/umip/umip_1.0.bb
index a25056645..cbf306144 100644
--- a/meta-oe/recipes-connectivity/umip/umip_1.0.bb
+++ b/meta-oe/recipes-connectivity/umip/umip_1.0.bb
@@ -10,10 +10,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=073dc31ccb2ebed70db54f1e8aeb4c33"
 DEPENDS = "rpm indent-native"
 
 SRC_URI = "git://git.umip.org/umip.git \
-    file://add-dependency-to-support-parallel-compilation.patch \
-    file://mip6d \
-    file://mip6d.service \
-"
+           file://add-dependency-to-support-parallel-compilation.patch \
+           file://mip6d \
+           file://mip6d.service \
+           file://0001-Add-format-string-to-fprintf-call.patch \
+           "
 SRCREV = "428974c2d0d8e75a2750a3ab0488708c5dfdd8e3"
 
 S = "${WORKDIR}/git"
-- 
2.13.2


