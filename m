Return-Path: <ricardo@foundries.io>
Received: from mail-qt0-f180.google.com (mail-qt0-f180.google.com
	[209.85.216.180])
	by mail.openembedded.org (Postfix) with ESMTP id BDD7B60616
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jul 2018 02:30:51 +0000 (UTC)
Received: by mail-qt0-f180.google.com with SMTP id n6-v6so176489qtl.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jul 2018 19:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=foundries-io.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=x/kAUAoZ6RCHiEPJhwei521qN8Rd0AMtF/hJcZr1NcY=;
	b=sraVw3ZAf5FLMVdUbqUJQyfBR0zdfJ5QyCZTb7QIsr7ZxnGRH/tj2yUxm3YSjoPghY
	aNGCWW3S1tdyWJP1G6V3xJ+4nlEqxVvskI6qZmi9aXARr30HgyPK+ozFSZSypoAiR2+o
	5nyrb0rjBOKC1jrNT4eSL21uAoKzpj2GvJvSNo5VjnOeSYOElqZqI+WQxIRwKcuNLuIH
	NEDf2/CFm64C6PH3Y+3fgEsTNt6AolWYgajPqXz+77LZdjjeqB5V+sHEa8Il0peu3AyO
	QPNgPumjwTbzpUiXduM6VJWwCka+3UOvKR7xzOpuR93aHoyQxfl0ZBeWlERWipd4rAo5
	CROg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=x/kAUAoZ6RCHiEPJhwei521qN8Rd0AMtF/hJcZr1NcY=;
	b=eHFl+6rRgT14+G50buXF/UwddafF7XarPg0ReW6pp7zpdDeBqYkyQa7ObEK/NdTHI7
	TujGYdfBbhXfHE8LOo/CVB5ZwR9GdEMEyzKO9z+le4Cg/qbLpMVMRSZbT87XY323gEBf
	sbc/VJuj+crdsVOyTVMs9VP0l4Kr4wqWHbb4+Wd1+EHRCHjph34Chkp0uegLAy4Ay916
	wjRcGPXycbYSoI78xqV3Zn27NFgg5TXOj+bMbvrGQUF8jLfQR09L92q78hL+Y1TJ1p4K
	tgHu6o17YumDR6VKdMx87TMi7DRE2/9Jr4K4scFyVzzwlT1fft3fTKUps6rTK7zs0gP0
	7AXA==
X-Gm-Message-State: AOUpUlFZxXg5huK5tR+8Aw97UXDfIJThWZhsNGJHAHtyGdaDd13IaT1D
	OaHKZAQ9w3KfV07fwi/lgiLSqb4gaQ==
X-Google-Smtp-Source: AAOMgpfKqj77dimpkRMxTGVvbgjkm7kdcXDjboC9FOGsL5JnmbYjxRQYI65z55s58cWiNybMbScc8A==
X-Received: by 2002:ac8:196c:: with SMTP id g41-v6mr55138qtk.277.1532572252249;
	Wed, 25 Jul 2018 19:30:52 -0700 (PDT)
Received: from localhost.localdomain ([189.4.104.186])
	by smtp.gmail.com with ESMTPSA id
	u21-v6sm42893qka.88.2018.07.25.19.30.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 25 Jul 2018 19:30:51 -0700 (PDT)
From: Ricardo Salveti <ricardo@foundries.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 25 Jul 2018 23:30:45 -0300
Message-Id: <1532572245-30916-1-git-send-email-ricardo@foundries.io>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] python-idna: remove bundled egg-info from source
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
X-List-Received-Date: Thu, 26 Jul 2018 02:30:51 -0000

Remove bundled egg-info from the source tarball as it will be generated
by the build system with the correct permissions during build time.

This fixes a permission denied issue when importing pkg_resources as a
normal user.

Signed-off-by: Ricardo Salveti <ricardo@foundries.io>
---
 meta-python/recipes-devtools/python/python-idna.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-idna.inc b/meta-python/recipes-devtools/python/python-idna.inc
index d6d8d92..519812d 100644
--- a/meta-python/recipes-devtools/python/python-idna.inc
+++ b/meta-python/recipes-devtools/python/python-idna.inc
@@ -10,4 +10,9 @@ RDEPENDS_${PN}_class-target = "\
     ${PYTHON_PN}-codecs \
 "
 
+# Remove bundled egg-info
+do_compile_prepend() {
+    rm -rf ${S}/idna.egg-info
+}
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4


