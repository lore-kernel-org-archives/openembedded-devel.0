Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 837317FC79
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Dec 2019 12:08:17 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id p9so2906859wmc.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Dec 2019 04:08:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=JoMjKD7fXV/dKne9EQdGoIwfdIdoCy5rSnVngC2f+E4=;
	b=ncYJ4TM07R5NE7hlqRpkU3nJvYW8Wgbl+racODqKYBR+cWfAQlSPp4qV7ENBT1piTw
	TxE+TTptfmdfEHDiW+Yvi+/DirDAUISp1+CqlT6pT7WD5oQLeT1ifAzYluAMUbMXFgQB
	rCykFfr5c/ZLgdoIYlQR3hrym1Qp8rs0yUT1Wl8pTRwm7wuJ90PVQnHGM+bv4Cl9JNSt
	qYKUyDe3R3flzIjCGm9ju4NBhbOyYFJ/Psi+L84/I2iIbCPOtZDltwOjy1ppuAcjVuPA
	etyw3/KG+seQtaiGrqvT113V5zXI2th5io6S441JebjSeBJdgdCK/gXHuDJNlaaY0a/5
	/OrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=JoMjKD7fXV/dKne9EQdGoIwfdIdoCy5rSnVngC2f+E4=;
	b=qu6Eupmua3KMCFDbl9o10Ew8tgtGmjZTslwQmdBqUa4QSHwy3x7XTOfKQcA9Tf+WF5
	GBqA9Cf8ejeL5ZHsRcIhqFXGlipEG5mtzA/TGhL0fCCVa506aLmgKzF6l1sdpG4R9im+
	O7uCGvSeKNOVZNk1KjmSLmoZa5hfcv2DDizRwZMYi1gVkIhFYLGJbirZw+3GScObeNUV
	kqMVs0EIEKrxhv9SIiU+0k+wN8CAjUwWm5hTPPkiW/DleC5T094PLOc90Pbti8hto/Ck
	yNtb6NEzkt7ka1naoQhfHf84yUjU6s/tsL+jVRES6L/R9YX5yyVOy4gBYvzy0hhvVzzq
	Dsug==
X-Gm-Message-State: APjAAAVX0TGcAwpzOqXm0HDO1eaQYaCHHiRTZq1D+yrWo5KlKekRz0rz
	ebHeZdQiYtIfG9+QzhNwJotm7uT9
X-Google-Smtp-Source: APXvYqzQqhyhv1WEZzPrNvr6rAhE0vhHx+Zq6aO37Zx0FCWDeSVBBsSVZjA0/AYX6+uY2J7c8uJjmw==
X-Received: by 2002:a1c:a543:: with SMTP id o64mr3526578wme.108.1575979697872; 
	Tue, 10 Dec 2019 04:08:17 -0800 (PST)
Received: from localhost ([109.238.218.228])
	by smtp.gmail.com with ESMTPSA id q3sm3099087wrn.33.2019.12.10.04.08.16
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 10 Dec 2019 04:08:16 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Dec 2019 13:08:08 +0100
Message-Id: <20191210120808.14844-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] googletest: fix build with newer oe-core without python in HOSTTOOLS
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
X-List-Received-Date: Tue, 10 Dec 2019 12:08:17 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-test/googletest/googletest_git.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta-oe/recipes-test/googletest/googletest_git.bb b/meta-oe/recipes-test/googletest/googletest_git.bb
index b675ea0f32..354e7de337 100644
--- a/meta-oe/recipes-test/googletest/googletest_git.bb
+++ b/meta-oe/recipes-test/googletest/googletest_git.bb
@@ -21,3 +21,11 @@ ALLOW_EMPTY_${PN}-dbg = "1"
 RDEPENDS_${PN}-dev += "${PN}-staticdev"
 
 BBCLASSEXTEND = "native nativesdk"
+
+do_configure_prepend() {
+    # explicitly use python3
+    # the scripts are already python3 compatible since https://github.com/google/googletest/commit/d404af0d987a9c38cafce82a7e26ec8468c88361 and other fixes like this
+    # but since this oe-core change http://git.openembedded.org/openembedded-core/commit/?id=5f8f16b17f66966ae91aeabc23e97de5ecd17447
+    # there isn't python in HOSTTOOLS so "env python" fails
+    sed -i 's@^#!/usr/bin/env python$@#!/usr/bin/env python3@g' ${S}/googlemock/scripts/*py ${S}/googlemock/scripts/generator/*py ${S}/googlemock/scripts/generator/cpp/*py ${S}/googlemock/test/*py ${S}/googletest/scripts/*py ${S}/googletest/test/*py
+}
-- 
2.20.1


