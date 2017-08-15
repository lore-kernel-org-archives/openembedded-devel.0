Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5110578459
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Aug 2017 05:02:30 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id u185so13925404pgb.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Aug 2017 22:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=rHUqjxIla46w8Vd8SYKSsxbxZzaA4IYLXv9Uo4Fx0gc=;
	b=XMsvDMl09uBfAl8ooyhonHm1CNF30Ej5D/BLVz6jmCTiIliSfuBs/J6fvhFrgHM06D
	aEKK9FD0rthPrPWGkcE5S2bfkoXTTsXqA/4Z9a8flmckpM1i18T+iPHEj8LSNImo2Ml4
	wzxGKrrBv6LlhxpdfxQMqhOL4v0tgXkgHckm7qpf1NVIGny755ekIWHbqKVTy3YstO7a
	i1rUzqzzWDi4WwDWO4O9pjNBH7MjlVbnRvBQ7HjGXZ7LZdTIMSN08GMEfyxnwWAQkiRE
	F/6odX6AqsBfmDbKKoBF4tM+YPh0Az8M+P+lN4HRZxdEKMl1a+qQlFjuHJVM3x9T+yle
	x7mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=rHUqjxIla46w8Vd8SYKSsxbxZzaA4IYLXv9Uo4Fx0gc=;
	b=hEdrW/bix43QviWxPrVlnOFLQ+yKrcx7om4HIeZPGwrj+81CtWKTrr76qPqif9n9Pg
	oYa41svd17LfaKpAhbu8Z88prJLis0fTw1gvbPaf2RnQsLlU1PCrHWOYJUgxA9+SfRtk
	CXapEIgCeMw/500bvIFtFZvw95ewDlpFwoY7re1WodpmoCOIVMEcAom7oSRJBmsZw6fF
	tz4DgblTIHQ5VZfydPq4LyyzmfrQZVrJt+nLTbFm/pehITMjcEK9Ytut3f4o6YTOPfHh
	Uq5AFEDv+RQerzHcvXnkPTze+AfgoXE7SYLj82l6k7+cmdbsTjZtCT2xJYC7xtkEiguB
	F20g==
X-Gm-Message-State: AHYfb5jwzWb+wN4ojSbJMy+6vsqU4x0xFGDwDA71ctztFIV8fvaQJQMB
	3C5C8FeGlrSi+NIb
X-Received: by 10.98.160.131 with SMTP id p3mr26914849pfl.236.1502773352419;
	Mon, 14 Aug 2017 22:02:32 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::8319])
	by smtp.gmail.com with ESMTPSA id
	j63sm14640904pge.88.2017.08.14.22.02.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Aug 2017 22:02:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 Aug 2017 22:02:20 -0700
Message-Id: <20170815050221.16408-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170815050221.16408-1-raj.khem@gmail.com>
References: <20170815050221.16408-1-raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 2/3] caps: Mark ARCH empty
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
X-List-Received-Date: Tue, 15 Aug 2017 05:02:31 -0000

This is to ensure that if ARCH is set in Makefiles then
its not used. This variable is generated using uname which
is wrong for cross compile. So we dont want to set it accidently

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-multimedia/recipes-multimedia/caps/caps_0.9.24.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-multimedia/recipes-multimedia/caps/caps_0.9.24.bb b/meta-multimedia/recipes-multimedia/caps/caps_0.9.24.bb
index d7887635e..29167d1aa 100644
--- a/meta-multimedia/recipes-multimedia/caps/caps_0.9.24.bb
+++ b/meta-multimedia/recipes-multimedia/caps/caps_0.9.24.bb
@@ -17,6 +17,7 @@ S = "${WORKDIR}/${PN}-${PV}"
 EXTRA_OEMAKE = " \
     CC='${CXX}' \
     CFLAGS='${CFLAGS} -ffast-math -funroll-loops -fPIC -DPIC' \
+    ARCH='' \
 "
 do_compile() {
     oe_runmake all
-- 
2.14.1


