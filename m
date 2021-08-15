Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.11424.1629036413904496780
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Aug 2021 07:06:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qw+meVgZ;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id e15so17844156plh.8
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Aug 2021 07:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=x44XOv+HsXX04HbKLaFEMialnWR4zfavmfjq6/XCQUc=;
        b=qw+meVgZXKNfHFlD6FQT8gsAtvcGTBzqUu3PP3g+KeIcBu9MDl7Lz6oxjM9Wvdytcr
         SEA8XgZlxjfFOcT37MIbBHZovdRN5g/xuXs6quo+vdTjJvEHNoj9DZ+UFc8rTuXcCLHT
         GDQXj0qaZC6kC9+rfu5LZKMnOH5m6JD3rWpL0CcJZGKEXIRHWLQx87mITPUKCXFakW3t
         xkorIxxQayVlAhaF5hnqn/uox1Q7Pp14BUq2Uce2KBdnzFCVsqwo79bv8Xmf7oU/o06T
         26VZBNjaRSGsvLkIuLKtd4HonvvnRgyNkZdVsaS64EocaBrew61FZ0Kqrzi9lddmhcwI
         Wrng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=x44XOv+HsXX04HbKLaFEMialnWR4zfavmfjq6/XCQUc=;
        b=B15R/kRBdW6fM18j+HS1qlMupSq93B/j6etlmKUbgeYD5okKr5qHqUd63xuG4V29X8
         1J8CXySkRPVDoH6dw61nnBXvm360VUK7DMUVaeEKUt7c9zvRfcrl4vYYFqLfIZztUuYM
         SpDva1Ha1XYOgxHLWxIvN0rQqlAKcbwhMqP/dYttyXp1fZRjefRskdAH5ba7d+2Aim3Q
         hrkjfen7O+5HNsKzkz65uURCM9efh/Rw4wlhnrXQxsHTIUZiruBjYoZliZBs4WprN+89
         KfLcVGQLZ0Y13hOLDnm6Gq2x+TUvw8iaBB4dPUXek5l5coNGrbLJphvlXKKegp4WEoDi
         JdSQ==
X-Gm-Message-State: AOAM531NZ7zji9u/zlGamfoIfqSV1iRX846d73wXg3mhHix/Do4bCLnw
	LrDyJAVqfcWw6XNEpcUtGk1P+dI/Wdcn0w==
X-Google-Smtp-Source: ABdhPJx6c7ot1u6J+BbAyox0pcsG3htTAOK2IQZj469ufdWY7zS1pguKcb0ZEvGojSW4VSugQlrqhg==
X-Received: by 2002:a05:6a00:2343:b0:3e0:f9a0:c1fa with SMTP id j3-20020a056a00234300b003e0f9a0c1famr11868201pfj.72.1629036413347;
        Sun, 15 Aug 2021 07:06:53 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.hsd1.ca.comcast.net ([2601:202:4180:a5c0:162c:344d:280d:4a4c])
        by smtp.gmail.com with ESMTPSA id y67sm8332901pfg.218.2021.08.15.07.06.52
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Aug 2021 07:06:53 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 15/18] curlpp: fix QA Issue after LDFLAGS change
Date: Sun, 15 Aug 2021 07:06:27 -0700
Message-Id: <bca3bbbf203086794e5b56a71c04a7bbc59f9bea.1629036279.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1629036279.git.akuster808@gmail.com>
References: <cover.1629036279.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tony Battersby <tonyb@cybernetics.com>

Adding -f*-prefix-map to LDFLAGS caused the following issue:

QA Issue: curlpp.pc failed sanity test (tmpdir)

Fix by filtering out -f*-prefix-map from *.pc files.

[YOCTO #14481]

Signed-off-by: Tony Battersby <tonyb@cybernetics.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit c40e01b0fce73bc289d9499b204350359afc7884)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-support/curlpp/curlpp_0.8.1.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-networking/recipes-support/curlpp/curlpp_0.8.1.bb b/meta-networking/recipes-support/curlpp/curlpp_0.8.1.bb
index 799cf8611c..5df9238a67 100644
--- a/meta-networking/recipes-support/curlpp/curlpp_0.8.1.bb
+++ b/meta-networking/recipes-support/curlpp/curlpp_0.8.1.bb
@@ -16,3 +16,10 @@ S = "${WORKDIR}/git"
 inherit cmake pkgconfig binconfig
 
 BBCLASSEXTEND = "native nativesdk"
+
+do_install:append() {
+    sed -e 's@[^ ]*-ffile-prefix-map=[^ "]*@@g' \
+        -e 's@[^ ]*-fdebug-prefix-map=[^ "]*@@g' \
+        -e 's@[^ ]*-fmacro-prefix-map=[^ "]*@@g' \
+        -i ${D}${libdir}/pkgconfig/*.pc
+}
-- 
2.25.1

