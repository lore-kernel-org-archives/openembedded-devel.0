Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web11.7848.1631714126795737028
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Sep 2021 06:55:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VB1l/NVp;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id t1so2813338pgv.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Sep 2021 06:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=lmOZkucRZAzvXEogBTAhUcvu73f0xgeB1uLuhhofq2g=;
        b=VB1l/NVpVXuY508Zlb/89rjl2PqMFcQPtuhVOVEx5giOMtCRZ+4mQhBadhvRtAYiBR
         OqwWUQhzS2FxoQOtp5bK4z544ruH2xcy34tGeK8Lry72uUNExEMdEqMARoaBPQ7ByGRz
         Lw9CIyldke34XAm+9VGBhoFfDkHwPiModxQagmj3jA3VnKIT7aFSAUfmMQ9BeTfJ9Gfd
         Z0Gc/xZj6SqhPgWZq+s8OPAxKCIIhbhMrB7VzEtcjhHx9JQF66hbn0o4juMchGJVrYvT
         oUT8FSFLZhQOHIaNkY3nW+f/z/dCNq2+cJdymQUDN/EPhcCUJ9Yxp8pXlYfY8RS3wVc+
         qLQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lmOZkucRZAzvXEogBTAhUcvu73f0xgeB1uLuhhofq2g=;
        b=eS/sXFWacKbmNYPCx+COB93ousL4spYLcH2EpqmkLiX5wjJe0v9OVzq3Hty42wR0QZ
         CnyeU1D954KTk29FDsFxVnf982Rme7/vjOBC2lnr2JdHAeldgntMwZ7cez5IsJd58Fiv
         sFFm5J15FjP/C23yP6NNfxMB5ObGtYBlAxzHLhLL/mLDfm8BCb8JXvLbIhkETtbBcMvF
         10Z9ssqwjxqXD4DcN1Znw8cC0hM+axfWROF5sZ7NCKM0VKvEkB5SXf/BkLJICJ37w3tF
         b90pEt8xGjchHFKJxAFbTDeajajVoSsW3/VKgssB2mimy/iCNbSQh5TMQOD/h4Y4Y7Ez
         Npzw==
X-Gm-Message-State: AOAM53116CTti+zckVFSudvy8ykDKly/0gWbN25lKLIxVReDBRT2WmBA
	ONu/zpRcCvAO59tgRJyej6rVU+4jrfY=
X-Google-Smtp-Source: ABdhPJz272lIzD3hAnWADDoKHhjq8dugrNM26LwhMkwUiPI0pI39YCa0CYL4xlXPJuJCugpuIov4nw==
X-Received: by 2002:a62:7806:0:b0:440:448c:f662 with SMTP id t6-20020a627806000000b00440448cf662mr300520pfc.57.1631714126190;
        Wed, 15 Sep 2021 06:55:26 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.hsd1.ca.comcast.net ([2601:202:4180:a5c0:35e:ec78:cef4:300f])
        by smtp.gmail.com with ESMTPSA id v7sm4824941pjk.37.2021.09.15.06.55.25
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Sep 2021 06:55:25 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 2/9] cjson: upgrade 1.7.14 -> 1.7.15
Date: Wed, 15 Sep 2021 06:55:13 -0700
Message-Id: <08ff683e00d0920c58c2ec99404d96f3af18e5e8.1631713963.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1631713963.git.akuster808@gmail.com>
References: <cover.1631713963.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: wangmy <wangmy@fujitsu.com>

Fixes:
Fix potential core dumped for strrchr, see https://github.com/DaveGamble/cJSON/pull/546
Fix null pointer crash in cJSON_CreateXxArray, see https://github.com/DaveGamble/cJSON/pull/538
Fix several null pointer problems on allocation failure, see https://github.com/DaveGamble/cJSON/pull/526
Fix a possible dereference of null pointer, see https://github.com/DaveGamble/cJSON/pull/519
Fix windows build failure about defining nan, see https://github.com/DaveGamble/cJSON/pull/518

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit fa00ac02df4e3caabe8ba81d1700cec835bcb139)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-devtools/cjson/{cjson_1.7.14.bb => cjson_1.7.15.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/cjson/{cjson_1.7.14.bb => cjson_1.7.15.bb} (90%)

diff --git a/meta-oe/recipes-devtools/cjson/cjson_1.7.14.bb b/meta-oe/recipes-devtools/cjson/cjson_1.7.15.bb
similarity index 90%
rename from meta-oe/recipes-devtools/cjson/cjson_1.7.14.bb
rename to meta-oe/recipes-devtools/cjson/cjson_1.7.15.bb
index 0e33275e23..1a4e53d508 100644
--- a/meta-oe/recipes-devtools/cjson/cjson_1.7.14.bb
+++ b/meta-oe/recipes-devtools/cjson/cjson_1.7.15.bb
@@ -6,7 +6,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=218947f77e8cb8e2fa02918dc41c50d0"
 
 SRC_URI = "git://github.com/DaveGamble/cJSON.git"
-SRCREV = "d2735278ed1c2e4556f53a7a782063b31331dbf7"
+SRCREV = "d348621ca93571343a56862df7de4ff3bc9b5667"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1

