Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web08.1223.1616604475905357180
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Mar 2021 09:47:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cIhNPwDy;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id jy13so33987459ejc.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Mar 2021 09:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5P57YM4EzkXZJZfNkf99gDvXpo354+yAnJEdF3hYGBE=;
        b=cIhNPwDyxVv5X0Bt36sFzY6+niZp+3iTZHXm0kbPfubUqTe2w8P799w6i8INYUmajR
         KpVWokizSyxGdiJxhTpw2e2W6fBuctXz+0StiL7vmQQqdp079zRm3YSUfDKvDZHec7/2
         +GBcrfWjRniVwJ1+aG47gyLpNW4VSaKAFjYahS8CqKW/9AWT5rEEAOaJqgvKbxdAyYKo
         Od4w1YiDFWI1FLkWxP++en1XcZMC65qQIr3RZ2OmG8urP2g6RiF3GdowZ49JehVL19/h
         amOxHZG/ZnnYIOMuSEGHMxaAvPgMRuxu8hmZe0K8tyAT7UffPRlIeGoEGRVyq7wW41fi
         0b4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5P57YM4EzkXZJZfNkf99gDvXpo354+yAnJEdF3hYGBE=;
        b=cyzOxiM/6BZnc+Fu6QeN1Jpn8Eszm7Ib0TPYchHPjDTUW96305BYlBd/o/70M51LM2
         iHn+WD35hLZKhjmQpzc1Pmw+WxGRC3t4pVJ6Zx1dzdTdCmB9kxyEUF741p7wXrwFJYUI
         5fZt3oEqqsEdBf6Ij0rPzcuq6lDPsTh9z156a9c3yn1ZT8MRBXBzcqWMiDqk0HFWEKnb
         ypP3yXyZuY1K9Ap/B5ksRpuZudPwrPJyzl5An4Ht5rKOyIOANkDiS+Mah5PpwXm5m6qf
         pYTWbHp5T7Ack2dMe315uHxk48znaTEeJEkaTU2dW80XarxisycKk8eqvsoQR/9zbh5o
         NXjQ==
X-Gm-Message-State: AOAM531AnAbcrY+o0PItCOlhKEDMbW+GdDN3li7+yUt79jMf56dGRF+y
	a+7O1QSI3I6IGnzHizOlkdJ8pkJlrSA=
X-Google-Smtp-Source: ABdhPJxsK8JRVolVI/fZQzsZWf/h0VZJ5xEfXDdfmSgtYeZcXk2Sq7zUx8CAOR0AwSH5tgmsPNy4eA==
X-Received: by 2002:a17:907:76b6:: with SMTP id jw22mr4678590ejc.11.1616604474276;
        Wed, 24 Mar 2021 09:47:54 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id gj13sm1164052ejb.118.2021.03.24.09.47.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 09:47:53 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][dunfell][PATCH 4/4] packagegroup-meta-oe: add guider
Date: Wed, 24 Mar 2021 17:47:49 +0100
Message-Id: <20210324164749.390872-4-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324164749.390872-1-Martin.Jansa@gmail.com>
References: <20210324164749.390872-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* now when it's not depending on meta-python2 we can add it without conditional

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 13d87a164c..505d4efc1a 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -124,7 +124,7 @@ RDEPENDS_packagegroup-meta-oe-devtools ="\
     android-tools android-tools-conf bootchart breakpad \
     capnproto cgdb cscope ctags \
     debootstrap dmalloc flatbuffers \
-    giflib grpc icon-slicer iptraf-ng jq jsoncpp jsonrpc json-spirit \
+    giflib grpc guider icon-slicer iptraf-ng jq jsoncpp jsonrpc json-spirit \
     kconfig-frontends lemon libedit libgee libsombok3 \
     libubox log4cplus lshw ltrace lua mcpp memstat mercurial \
     mpich msgpack-c nlohmann-json nodejs openocd pax-utils \
-- 
2.30.2

