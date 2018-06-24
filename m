Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f178.google.com (mail-pf0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id 008A574E1A
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jun 2018 19:19:46 +0000 (UTC)
Received: by mail-pf0-f178.google.com with SMTP id y8-v6so5423107pfm.10
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jun 2018 12:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=iCaOw0qeiyCifNMHXIaPDpkuUuo/vExxPks7IAIfWeU=;
	b=IL2/CeuXUiQJJSMhu9CGdaOeD/xbO/KZAYpKJ/LWELeGakbc0pp5iJf2r2LTRKNdDC
	R1T+VTXTsXmvmdHlQVr5VbMNFqdemS5kzHC0RNxn96I2lsG7n0QhDjr4MiZgIavgjswz
	PL+CsmPtYb62t2Uhzw8dXl/QufS3CieMnRHVhRRMUNmUYXQvpWqSkoUp3PY1O8SBtrD4
	xtTuFjGn0A24aowSc7XbtKzEyZEj/BttMOdx7P2UJuBJaxERjJd+KEBZ1oxgVC2ITMek
	5S5lD3CulFH8yFIMw76MWQThwne+zPSFMpMkN2HPfhOL5d4eMBRG+Eaqs1P5NjxAaL6V
	AMgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=iCaOw0qeiyCifNMHXIaPDpkuUuo/vExxPks7IAIfWeU=;
	b=cqpQvbQ27AFImvycmqcZKyVjdYIz5Jw+k6Exa+uKtbN+LpWgjQhXAK26iAncj3MxoX
	i6URSsU0JEh8mSG6qek24M8dzaIfnBjkkJ8eIrcrSnRP4zGyVv6EPJf8i7XYDNVeqmBp
	ciJdOjIQIofv/D51NVmyCE4NmWXCHJXHT7X2J78gB052iZeapzO+P6KrLjxxTHxf74Gr
	TZStPseIUJ4IkNHNwYhtVFjwgKExWVzjXMQjgxozpeUbDCv9km41A9JTdiff8m0eaDwP
	XevQIA9eaKxnxwAedpnHqfaXVJd6uIXmp6ZxqnxKSXEMFeVTxlKYKBKHcZEMRTTF8X4f
	+v+A==
X-Gm-Message-State: APt69E2+gplS1U+nzo0ZxJnOFmp8nHjqciJcQaMu5dbLZSMpjgkNYq9A
	vm+ASZvrZnWYZlmAqhwxLc0zLQ==
X-Google-Smtp-Source: ADUXVKJ29oQfPSg003+ZrH+l5K5QEFeN4IvVHNHzcjDt3jieVBa7SXe2VOiaiJj7rADNgH0mANhH3w==
X-Received: by 2002:a65:590c:: with SMTP id
	f12-v6mr8441490pgu.128.1529867987832; 
	Sun, 24 Jun 2018 12:19:47 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::91a0])
	by smtp.gmail.com with ESMTPSA id
	m11-v6sm36700461pfj.25.2018.06.24.12.19.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 24 Jun 2018 12:19:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 24 Jun 2018 12:18:43 -0700
Message-Id: <20180624191845.31082-18-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180624191845.31082-1-raj.khem@gmail.com>
References: <20180624191845.31082-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 18/20] check: add recipe
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
X-List-Received-Date: Sun, 24 Jun 2018 19:19:47 -0000

It is a C unittest framework

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-test/check/check_git.bb | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta-oe/recipes-test/check/check_git.bb

diff --git a/meta-oe/recipes-test/check/check_git.bb b/meta-oe/recipes-test/check/check_git.bb
new file mode 100644
index 0000000000..e7bfece3cf
--- /dev/null
+++ b/meta-oe/recipes-test/check/check_git.bb
@@ -0,0 +1,21 @@
+# Copyright (C) 2018 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+DESCRIPTION = "A unit testing framework for C"
+HOMEPAGE = "https://libcheck.github.io/check/"
+LICENSE = "LGPL-2.1"
+LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=2d5025d4aa3495befef8f17206a5b0a1"
+
+PV = "0.12.0+git${SRCPV}"
+
+SRCREV = "285d04b3d461ba68dc39e0f9e847784fb6064bb3"
+
+SRC_URI = "git://github.com/libcheck/check"
+
+S = "${WORKDIR}/git"
+
+inherit cmake
+
+do_install_append() {
+    rm -rf ${D}${exec_prefix}/cmake
+}
-- 
2.18.0


