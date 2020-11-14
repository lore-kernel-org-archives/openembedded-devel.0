Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
 by mx.groups.io with SMTP id smtpd.web09.10279.1605380666814209978
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2020 11:04:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WioqygN2;
 spf=pass (domain: gmail.com, ip: 209.85.210.194, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f194.google.com with SMTP id x15so8763246pfm.9
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2020 11:04:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bsbdJJT8jm/aJR3jj43sqLq5OrHXH3H9yv8IoeFst7Y=;
        b=WioqygN2J44vQYk1hupHLwHhWDYiix47PKzFz1aLtWLCucgufza0Hqh7rfjNf93KaL
         oePnhvxoUrWudBoV/j2Zc67D7LsUugrxRAKSki82xmN1G8zQUbvrcZ+CUkGS6o7nd2sb
         tIgbXWzKD72gOHSmTmeqLKa+7o5MC9BUVF7ZfzF4gDJF/YJgR4NUohssI+GDxegiK8Hc
         D7jVmPYNRsZNFP8YvSOCIj4PhGryK7zoMapujA2UqRQp30B99XmVZxEUitcY9tMotF01
         oRWxL/TEZG5vOLCU2dbvw3WMkGZN1Y9pq+pt8kU0etGuqzS5O0f1aTsnoUSxwdIfBEHZ
         iJ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bsbdJJT8jm/aJR3jj43sqLq5OrHXH3H9yv8IoeFst7Y=;
        b=YNTRp/2sQ/jAFEmVhNg9c72HK1Vk3JfTQrsAXQEv2syXdmlPIPt3mQeWQILmxvb1+z
         VUqCXrCQCBHC13PemOpnkoq6/v5Af/jDNP8yTLOVNcTPry8J8WTXQjLoGcB4o5hSc8Un
         Tg4CIMBPYT1yHmEGs1hQa+8gPJplL3ZJBfMAD0pRsNA9oFJKuA35ZUTbqYb2JSpXOiJ1
         vzsag7fxYkyy/sRkf6OAz0f2bxdZ6MyXV2/a9Gx2VPiMcBOMxAAYU+CFEUkUFHi08mDB
         4GoMVO0T5aFBs8dZDg3fN1BxYO9VWLreyQ7bohCGnGKcmUicMzaF+ypJQCJdRJ2yIADL
         jbBg==
X-Gm-Message-State: AOAM532zSHFgWJL6qj5JpIaJncjy8d894iym02yNe7MSb1WsBRNiZsZG
	zihP1+EgtvCsVCtdYHRXoJEHc2dHXN7FCLr+
X-Google-Smtp-Source: ABdhPJzTqX5VzmhTAtxRXN50lJksAqYyUczcJfK5EbwqmMxebPjwsOrzGvEdm7dn0Xs/Cqa5jLw/iQ==
X-Received: by 2002:a63:181b:: with SMTP id y27mr6698511pgl.408.1605380665728;
        Sat, 14 Nov 2020 11:04:25 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::740e])
        by smtp.gmail.com with ESMTPSA id 82sm13274444pfv.149.2020.11.14.11.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2020 11:04:25 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/5] gmime: Fix append to do_configure
Date: Sat, 14 Nov 2020 11:04:18 -0800
Message-Id: <20201114190422.2777143-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It should be a function append

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-gnome/gmime/gmime_3.2.6.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-gnome/gmime/gmime_3.2.6.bb b/meta-oe/recipes-gnome/gmime/gmime_3.2.6.bb
index 9d1bb7d04b..4ae13e7efe 100644
--- a/meta-oe/recipes-gnome/gmime/gmime_3.2.6.bb
+++ b/meta-oe/recipes-gnome/gmime/gmime_3.2.6.bb
@@ -13,4 +13,7 @@ SRC_URI[archive.md5sum] = "656548dc431004d1ebf95e5d0bb4b9c8"
 SRC_URI[archive.sha256sum] = "abff194c7c4802fba2e233890d09dde8bf7170c3ad5e13000601c8d5b3c44717"
 
 export ac_cv_have_iconv_detect_h="yes"
-do_configure_append = "cp ${WORKDIR}/iconv-detect.h ${S}"
+
+do_configure_append () {
+    cp ${WORKDIR}/iconv-detect.h ${S}
+}
-- 
2.29.2

