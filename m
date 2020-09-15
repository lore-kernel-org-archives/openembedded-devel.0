Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.3339.1600132133829375550
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Sep 2020 18:08:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dkjntnOj;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id f18so936951pfa.10
        for <openembedded-devel@lists.openembedded.org>; Mon, 14 Sep 2020 18:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zJq4jQOwrGDlwfqiEIhFjPiayyTNt39DHh0SR3j1EWA=;
        b=dkjntnOjJz6SwBJ+FzwR0Azwu36nQmYwnNmN5aAH9MK0pp4059NPh/j00wZpWv+eVQ
         O7aPM/jqHGhO0sASwJLTDwLjEJ3LQqnXAMK3m1lvi1RnZtpspaQzcYeWuKFlRjL8bXGA
         kKCQqQvYNeAzYgdPUUuKD2BaqAeEapECZK17AKLI3P34KJmY/vbedp6Z7D58ETIfYnvo
         kcj6I7V5C8LuN7QCuA6njjIAnxaTQW27v1S/ImhSyc5nQAqMEtAJxiD48ovbpxDXwpzP
         wXedbot81IIB8YyO7uncG+5lbTXnE3/yGaEhh6rU7ZLZ7QUQIs3N83bpPuGI/pt1XGFQ
         K7Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zJq4jQOwrGDlwfqiEIhFjPiayyTNt39DHh0SR3j1EWA=;
        b=RX7X9ydXTiVmayI8GnTzcDd7relfsIWIGgbDbFn/lXvgVq//m8xuUScQsMdvrTDJ0C
         nW+DgWiRchSOdE+mOn7080kcxxPBzS+SNre/z441udMJ2GzLm5JYhRRt1pjiZr8p8KnQ
         KKdPzn2R7l05fKYqJUxnMwcpoONn8Jbn0EUYwNfdbYr4je31UlXsRq0pyVkTNRgKNcrT
         aoFpytqx432BdDx9wiX+RvGfm2br+cAWq2AXWavtJBgkdRq70NH6DHE5N9cVcocEYtNy
         n3tjsItgeJ5porLfedNFeaD9vDJCPnEiA994JfO1MQXcwyQAoSTMJ8R5U9ZMYXxkXL06
         vJqA==
X-Gm-Message-State: AOAM532w/0WpkKfzUFQ/X8WVlGrwpz97d3y/wgrTwHWU+0R7PrEDB1Is
	jbWZUARaRfCBu6Cs8MAaGtNxnHMvzYHQdw==
X-Google-Smtp-Source: ABdhPJzwR/IuCchXfrkStWBgHw8SF+p4qlFDGyl3d+ogU/R/N07kp6R9Aggtq14todliSnJZ6Eb67Q==
X-Received: by 2002:a63:6d7:: with SMTP id 206mr13173759pgg.167.1600132132817;
        Mon, 14 Sep 2020 18:08:52 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::1759])
        by smtp.gmail.com with ESMTPSA id z84sm11569791pfc.105.2020.09.14.18.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 18:08:52 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Vincent Prince <vincent.prince.fr@gmail.com.com>
Subject: [meta-oe][PATCH] mongodb: Fix build with musl
Date: Mon, 14 Sep 2020 18:08:50 -0700
Message-Id: <20200915010850.2079174-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a patch to include ssize_t definition
Pass OBJCOPY to scons so it does not use the host
objcopy but cross objcopy, which is the right tool
to invoke

Fixes
objcopy: Unable to recognise the format of the input file `build/opt/mongo/mongos'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Vincent Prince <vincent.prince.fr@gmail.com.com>
---
 .../recipes-dbs/mongodb/mongodb/ssize_t.patch   | 17 +++++++++++++++++
 .../recipes-dbs/mongodb/mongodb_git.bb          |  2 ++
 2 files changed, 19 insertions(+)
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/ssize_t.patch

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/ssize_t.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/ssize_t.patch
new file mode 100644
index 0000000000..d297691b69
--- /dev/null
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/ssize_t.patch
@@ -0,0 +1,17 @@
+ssize_t is provided by sys/types.h, musl does not like
+it if the header is not included, for glibc it is included
+indirectly.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+--- a/src/third_party/kms-message/src/kms_request_str.h
++++ b/src/third_party/kms-message/src/kms_request_str.h
+@@ -24,6 +24,7 @@
+ #include <stdbool.h>
+ #include <stdint.h>
+ #include <string.h>
++#include <sys/types.h>
+ 
+ #if defined(_WIN32)
+ #include <basetsd.h>
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
index b8691df9eb..2be7de02a9 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
@@ -24,6 +24,7 @@ SRC_URI = "git://github.com/mongodb/mongo.git;branch=v4.4 \
            file://0001-Support-deprecated-resolver-functions.patch \
            file://0003-Fix-unknown-prefix-env.patch \
            file://1296.patch \
+           file://ssize_t.patch \
            "
 SRC_URI_append_libc-musl ="\
            file://0001-Mark-one-of-strerror_r-implementation-glibc-specific.patch \
@@ -59,6 +60,7 @@ EXTRA_OESCONS = "PREFIX=${prefix} \
                  CXXFLAGS='${CXXFLAGS}' \
                  TARGET_ARCH=${TARGET_ARCH} \
                  MONGO_VERSION=${PV} \
+                 OBJCOPY=${OBJCOPY} \
                  --ssl \
                  --disable-warnings-as-errors \
                  --use-system-zlib \
-- 
2.28.0

