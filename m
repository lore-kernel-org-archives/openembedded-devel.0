Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web09.41080.1617529423111077570
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Apr 2021 02:43:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=g0aysCID;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id l18so9672448edc.9
        for <openembedded-devel@lists.openembedded.org>; Sun, 04 Apr 2021 02:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xRyFO20Q/afwmKirBbhGlZE9N5trxH6yNIqUQiFL/KQ=;
        b=g0aysCIDLrJkQJXDBZ7sSs/EnQ9Gekt7jAhwYzuAw6qWpVA0Q0JnUX7qKgkm+AyktS
         zvNGpRme3BH2nqiM16eazkhQKdGl9IAaKhhyokUrepVHshGpfTxfrmAEeJust6fPoeeh
         IlXOaOoNnOg5HT9EVvXxD55fr7nVD+JJWUiM6rTb1OHxnc9rpAo3PGv/kyJ3oLoCugpK
         7fEiWr/LwOLlyWa8s3ryfOhjEKq2CJzhZTZ1YuU6/JobhMHawqqfXuJ8WvLXNlCQXyEh
         cG11u5DxLhkx7+FxqrMyMY8Yc0Y9WG/dyfxJo3HfhffPCk249rajA71NaNie5Db7Fjl3
         3NWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xRyFO20Q/afwmKirBbhGlZE9N5trxH6yNIqUQiFL/KQ=;
        b=jre4yN8bFBCg+9j8bRGuG2TLvRyTdVzpd7s5gzVOg2Zv9axpbF3VPn6miNw+EVfM++
         cMfbolk6qIaRAydNtvfqOFFTLSimzFZZ2zawbJtLvzdJZefV2JZ06rQqXCu4X75Uoe+i
         SpHOMUUVCpYNjyHFmbXd7tFwjrwzC3QkQJ+iB7RaQsynHSDqm+Y6fpDXrfiFloAFwn/j
         jcvHOdUBFxJGGypIrqdSToadCigV5tpAbOJyi2jHifdJiEG8eVAqPTqPgyZuApMMhvNH
         VKJgF+lU2ebbDlRIhc6h5s4vJRWnTYES4PX7UpVvCyj74JnWpODQFa5jxA/E9wp6VrZs
         jOhA==
X-Gm-Message-State: AOAM533cbZCKZXmPmFzw1cq1nxZbzQ0m45pUdXKIfs21KIMWZmqZ43xG
	7dYqVQmdvA4c5af+sUNNN8kEXyf7QOk=
X-Google-Smtp-Source: ABdhPJyrrVwr/iWvPBnRFb8IfqdzsLVbimxRWZ8W6U99S9xJHU1zFyTXzqs+xAxVVwmencCPQpI6hA==
X-Received: by 2002:aa7:d759:: with SMTP id a25mr4450875eds.248.1617529421637;
        Sun, 04 Apr 2021 02:43:41 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id g11sm8368163edw.37.2021.04.04.02.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Apr 2021 02:43:41 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][gatesgarth][PATCH] packagegroup-meta-multimedia: include projucer only with x11 in DISTRO_FEATURES
Date: Sun,  4 Apr 2021 11:43:38 +0200
Message-Id: <20210404094338.2062148-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../packagegroups/packagegroup-meta-multimedia.bb               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb b/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
index b4f09cdf54..75d0a4a009 100644
--- a/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
+++ b/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
@@ -53,7 +53,7 @@ RDEPENDS_packagegroup-meta-multimedia = "\
     bigbuckbunny-720p \
     tearsofsteel-1080p \
     schroedinger \
-    projucer \
+    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "projucer", "", d)} \
     libcamera \
     ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "libde265 openh264", "", d)} \
     vorbis-tools \
-- 
2.30.2

