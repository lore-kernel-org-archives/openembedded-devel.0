Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web12.17055.1627601816602768612
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Jul 2021 16:36:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fnHvtOVh;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d1so8866994pll.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 29 Jul 2021 16:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=YWkZGLhWJZsS/FEP29y2oL2ynedgmbdrlm37MCjkTLc=;
        b=fnHvtOVhR8odT5LTB38Ne+fMTZAPP8S4cWhB4I63J3pU33Wx4hfm1HVYPOb9oBmotN
         nIamg926aufnGGCQNOpyihR+04Tdd5sC7TEUUrDXDSG5fBNfVxRI71l7aEPn16TGMpjP
         PsU1z/kt5t4f6ScW+1E32924oX9JDJqa/iIk6+rva8ZIoi4nbSSRL0Wqp5NlQEGfB3VP
         LgS/CXXy634nAEo7Yc68LNfbAqqVqndDEydcidv8TR8jfbh7JYOv1ITp5eomPJg8PE3M
         iAV/JFmAMg6zmMHTFNTQt1gipVfH3RSbHpaTOSSjuerkc/T4/wGxKL/JPCuns7yEN27h
         sP3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YWkZGLhWJZsS/FEP29y2oL2ynedgmbdrlm37MCjkTLc=;
        b=FEIH2ESiIVG2riz8+BW+foIz1g9g30I+VAbMdGLJwAm7JoICCzBQzIFNEVMTaS4d8a
         AJ+UkBmD3iugdsRrcwPzBHsLTlyaIoiunC/Tvbur5/60mhUIAMbR+RQnRpl84t1qFpAE
         ZAXfKq7jF1sNj9DK5z+RpLjmpNUvYBGAxcrj0e3udSOFlT1zpSaAfPQj10sfN/JyZ77i
         +aIiKm/LojIZCWsJqEDXFdmodTzlxECxZBdXkN2jzQ6IFOuvwf9MuddIpEcKQH95Wo7E
         UgnYfFQhRVQ0lQB5HaU9CL12fHdh3zfodA5YCtKTbw+ezHcTMhAiNEqNJYq4jzQ9k/85
         Juvw==
X-Gm-Message-State: AOAM531mfGwkxYO9BB0VLmnW4faLPlF72yhbgSDaZF1NDlT5SYCTKqgI
	4ZAIpFMxCSBBT9z8OaezSlYCWmVf/h9GXQ==
X-Google-Smtp-Source: ABdhPJxLPL00dK8iZAx0QNLhAOqpfwjhDruw/1lY4cr18Yk1+xm3KVMh4NHFXvQlvnbT9r3KZV8AaA==
X-Received: by 2002:a65:690f:: with SMTP id s15mr5876031pgq.21.1627601815961;
        Thu, 29 Jul 2021 16:36:55 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.hsd1.ca.comcast.net ([2601:202:4180:a5c0:43fe:2e36:1546:5b06])
        by smtp.gmail.com with ESMTPSA id w15sm2360487pfu.89.2021.07.29.16.36.55
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 16:36:55 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 03/15] redis: fix CVE-2021-29478
Date: Thu, 29 Jul 2021 16:36:36 -0700
Message-Id: <ffb3fbb6fec1ba31192b1b54a25fbf75e904f6b4.1627593245.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1627593245.git.akuster808@gmail.com>
References: <cover.1627593245.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tony Tascioglu <tony.tascioglu@windriver.com>

This patch backports the fix for CVE-2021-29478

CVE: CVE-2021-29478
Upstream-Status: Backport
[https://github.com/redis/redis/commit/29900d4e6bccdf3691bedf0ea9a5d84863fa3592]

An integer overflow bug in Redis 6.2 could be exploited to corrupt the heap and
potentially result with remote code execution.

The vulnerability involves changing the default set-max-intset-entries
configuration value, creating a large set key that consists of integer values
and using the COPY command to duplicate it.

The integer overflow bug exists in all versions of Redis starting with 2.6,
where it could result with a corrupted RDB or DUMP payload, but not exploited
through COPY (which did not exist before 6.2).

Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../redis/redis/fix-CVE-2021-29478.patch      | 42 +++++++++++++++++++
 meta-oe/recipes-extended/redis/redis_6.2.2.bb |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta-oe/recipes-extended/redis/redis/fix-CVE-2021-29478.patch

diff --git a/meta-oe/recipes-extended/redis/redis/fix-CVE-2021-29478.patch b/meta-oe/recipes-extended/redis/redis/fix-CVE-2021-29478.patch
new file mode 100644
index 0000000000..ebbf6e1b94
--- /dev/null
+++ b/meta-oe/recipes-extended/redis/redis/fix-CVE-2021-29478.patch
@@ -0,0 +1,42 @@
+From 29900d4e6bccdf3691bedf0ea9a5d84863fa3592 Mon Sep 17 00:00:00 2001
+From: Oran Agra <oran@redislabs.com>
+Date: Mon, 3 May 2021 08:27:22 +0300
+Subject: [PATCH] Fix integer overflow in intset (CVE-2021-29478)
+
+An integer overflow bug in Redis 6.2 could be exploited to corrupt the heap and
+potentially result with remote code execution.
+
+The vulnerability involves changing the default set-max-intset-entries
+configuration value, creating a large set key that consists of integer values
+and using the COPY command to duplicate it.
+
+The integer overflow bug exists in all versions of Redis starting with 2.6,
+where it could result with a corrupted RDB or DUMP payload, but not exploited
+through COPY (which did not exist before 6.2).
+
+CVE: CVE-2021-29478
+Upstream-Status: Backport
+[https://github.com/redis/redis/commit/29900d4e6bccdf3691bedf0ea9a5d84863fa3592]
+
+Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
+
+---
+ src/intset.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/intset.c b/src/intset.c
+index 1a64ecae8..9ba13898d 100644
+--- a/src/intset.c
++++ b/src/intset.c
+@@ -281,7 +281,7 @@ uint32_t intsetLen(const intset *is) {
+ 
+ /* Return intset blob size in bytes. */
+ size_t intsetBlobLen(intset *is) {
+-    return sizeof(intset)+intrev32ifbe(is->length)*intrev32ifbe(is->encoding);
++    return sizeof(intset)+(size_t)intrev32ifbe(is->length)*intrev32ifbe(is->encoding);
+ }
+ 
+ /* Validate the integrity of the data structure.
+-- 
+2.32.0
+
diff --git a/meta-oe/recipes-extended/redis/redis_6.2.2.bb b/meta-oe/recipes-extended/redis/redis_6.2.2.bb
index e89bb50f15..a36c190af3 100644
--- a/meta-oe/recipes-extended/redis/redis_6.2.2.bb
+++ b/meta-oe/recipes-extended/redis/redis_6.2.2.bb
@@ -17,6 +17,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://GNU_SOURCE.patch \
            file://0006-Define-correct-gregs-for-RISCV32.patch \
            file://fix-CVE-2021-29477.patch \
+           file://fix-CVE-2021-29478.patch \
            "
 SRC_URI[sha256sum] = "7a260bb74860f1b88c3d5942bf8ba60ca59f121c6dce42d3017bed6add0b9535"
 
-- 
2.25.1

