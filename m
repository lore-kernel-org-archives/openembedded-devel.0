Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2CC6C28B30
	for <webhook@archiver.kernel.org>; Wed, 26 Mar 2025 05:00:55 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.15279.1742965246178269654
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Mar 2025 22:00:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LbsQm5gH;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3015001f862so8002345a91.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 22:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742965245; x=1743570045; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ueq5M6Z9rU1tohk1f4WwqhNmVdKte/kicmD5Avovdw8=;
        b=LbsQm5gHH6Y9+V7iVj4ef+X+bGW1dH6DPACLxr2hHEWZfi6ieYjZ5O5pqGvoxiU5dW
         I2SG+Lf+XtHgjU4cPjSoBIlZVPEQe3K7fPgYQfme0osBEjHe0VlH8COGsI1t9kF2K7Hj
         4rfYqfObQhHDY5Wjkh1TVsxlgOjsmUL4kb7BTvzuZhnhjqiBUIIm/Vy8Rsc3H/Qzsaw3
         M0skOQOwS07w4/dAA3hWcYFmv0x0EZJEFwB55cOPIMBrskT9tojgg6dQVDh1ieId7HIr
         XwlXbAKDBrdoVO0iAegVl83StfpW0YNzYV2+mDegtF9Yv7HwbSeKRErU+y1EZMXqkumM
         aMBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742965245; x=1743570045;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ueq5M6Z9rU1tohk1f4WwqhNmVdKte/kicmD5Avovdw8=;
        b=imL5vbfP3sze8G/n3odfr8Yd1UKEg+hHXNyvAea1TZBz2eRV2V3W9t2JoEzriaomLv
         5EFAl+fb3/vT3FaNszFMIdvMji5hD7lM9HIRiljaZkLvvdw+lYAEqm1Jy15SjsEBJdiA
         /PO5d1FnqNJ58TGz/JQ0IviDd24uMdnFl8XOkLaYxY+wv+M3r9k2CrOW1Jv7JcXJ53dM
         5kxpE3b0LZiPI5ALLvU2UodmFxdxKHwce7d1kGKcOF81R0GAdb3rsHRHFWhJ++S1yTth
         LE3Dvg3aE5xTxZeQ1puWQfr2rCMQ0I0CA4fvSi6soyda9lCTZ3sMVI0ruHsDy++5siaB
         k1eQ==
X-Gm-Message-State: AOJu0Yz6eOLwfKnV+M4T+YMfPcoqBQYkwZu71/i9yz5UGHgp1pIfw1qd
	40HHaWN0GL3WWugrch2wlo+H04mg9x8YgUQ4HVDBLiLM2HZHlTFuHjw1v1IE
X-Gm-Gg: ASbGncs9Ubey2GY3pcXGMLTaKNGHaQqnHhUAJUmRSRlp0NemPwiJ22gNEFWPgjm+zdh
	Caw3/n8GiibfH2JetFlM507wCwgjdLJ+IfPQSk3A6n+KC5KZW+zOyg3vKiEv7sPZd9r5VgHRAjT
	XRKLU//TYc6DZH+vX9Lms0jJxh5l2uwzTf9J7u+cAloTN680KV4RXQ3Uo4I7ry4ZWQWuOttLIAa
	G2Hjj7WXUk9TILw9Fgk+3RCK2uFVPppRjjkPu58q4822sfXtn2dF6JCIFp5jUvVvGOfdqjRIQNk
	xIMJ8dv1wLGQrtfVRIyo/ikie6eKJXpYr0uU
X-Google-Smtp-Source: AGHT+IGdkb6gy0VF2UNR7M8D9EF2tWoNvc2U0uqhTkYgVSDuklOtWXUH5+vpvDJ3AxUMXhDtoUK4vg==
X-Received: by 2002:a05:6a21:2d84:b0:1f0:e706:1370 with SMTP id adf61e73a8af0-1fe43435c1cmr34959108637.35.1742965245193;
        Tue, 25 Mar 2025 22:00:45 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::f147])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af8a2a4761fsm10011184a12.65.2025.03.25.22.00.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 22:00:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] minifi-cpp: Fix build with clang
Date: Tue, 25 Mar 2025 22:00:42 -0700
Message-ID: <20250326050042.3900487-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Mar 2025 05:00:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116287

Disable c++11-narrowing-const-reference warning as error
Fixes
git/extensions/standard-processors/utils/JoltUtils.cpp:498:23: error: non-constant-expression cannot be narrowed from type 'unsigned long long' to 'unsigned int' in initializer list [-Wc++11-narrowing-const-reference]

return ResultT{{std::stoull(std::string{idx_begin, it}), {}}, it};
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.99.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.99.1.bb b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.99.1.bb
index 204d3c6cbf..44daf94c98 100644
--- a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.99.1.bb
+++ b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.99.1.bb
@@ -66,6 +66,7 @@ DEPENDS = "virtual/crypt bison-native flex-native flex openssl curl zlib xz bzip
 
 OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM = "BOTH"
 
+CXXFLAGS:append:toolchain-clang = " -Wno-error=c++11-narrowing-const-reference"
 LDFLAGS:append:riscv32 = " -latomic"
 
 EXTRA_OECMAKE = " \

