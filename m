Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
 by mx.groups.io with SMTP id smtpd.web08.3614.1617934883348505487
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 19:21:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=C/xV5nBV;
 spf=pass (domain: gmail.com, ip: 209.85.167.180, mailfrom: akuster808@gmail.com)
Received: by mail-oi1-f180.google.com with SMTP id x2so4306447oiv.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 19:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=FVJYHEMC9a1U+GLBlycNRVomlfDg5gp4wqZFNWu0ID0=;
        b=C/xV5nBVIaKFhEjFS9/egz0yTlMQ/36lA6tXq2UttR90jhIk0OeMNNcO4wOJc4rQO5
         97RrFuc6K9lMn365q4zuwzQpQJALxR9khTgfH9rey+uzDyYJ5U5SC0/cET5TWVcP45aL
         KnSYE2aO5pEoygpfx0qYSn6bRV0gYhPycoG090PqMRBkkF8PDaCbqoMAYsZlfsYgN0y7
         tCHabsfYPzd9Nw0B32KPn/Te7LC/y8JROBlk6XD8/7n04/24dI9ATkM0FQ3eHqq32kSt
         pnJxocg00s4h39rHREXKXXzC2iLycv9VWjJRdhPJZTT1xfKal2YG2vm7ElzRl9nD7eRi
         ylvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=FVJYHEMC9a1U+GLBlycNRVomlfDg5gp4wqZFNWu0ID0=;
        b=E40oiNhH2yqQWh8396roix7744XZpEFC3/K5QASyFiCGVaaWrThb4yYJOO2rrt+TF4
         /fhWa7b2DhbR5AlsDBwH7LxLDizmtp9K54bfNf/eCrtcXUXT54E/ZsZzIZDSmFzJfd3y
         yiIOi0Z9x2HMoqjAZGgPiEQ+So3WaIBcsoMqbQAaSn5cH0I+EtVYXhOI8MxV3LTZE4CV
         3GDdT81LtwAyL/vI3s+7n5c8D7wGCieKNVUcNUOaoaBUov+5iHhnLAaX77N7RzwVSCMO
         WICZExLBVIjad3v6L03cH/Qkqkfr6sEbCv0FRj9DMi7LnEuaMmGa8kuK42KQnPP+4C4O
         qTRA==
X-Gm-Message-State: AOAM530wjwM1QkEH9JlYnGgVhEVWBzGDNW7dPapEQJ7BWpRrEL/ij9Na
	Z/HfZDJTRCNJe1kJvQ0BmHrrlUS9c/0=
X-Google-Smtp-Source: ABdhPJz65GpwOxlD7HL3nAPQ9zrlN94dwVvMAs/FerHWfYXELolrgHFaM74zWdtygLqDc16OkrSCdw==
X-Received: by 2002:a05:6808:607:: with SMTP id y7mr8053042oih.160.1617934882549;
        Thu, 08 Apr 2021 19:21:22 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8533:6d3:7a8:8272])
        by smtp.gmail.com with ESMTPSA id k65sm299815otk.53.2021.04.08.19.21.21
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 19:21:22 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 33/36] hwdata: upgrade 0.345 -> 0.346
Date: Thu,  8 Apr 2021 19:20:46 -0700
Message-Id: <539e8fd7e6a2ab109162ef77f2d91dcd2df59299.1617934043.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617934043.git.akuster808@gmail.com>
References: <cover.1617934043.git.akuster808@gmail.com>

From: zangrc <zangrc.fnst@fujitsu.com>

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 5b02a417845d91ce57ce89de0a597edc63966213)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/hwdata/hwdata_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/hwdata/hwdata_git.bb b/meta-oe/recipes-support/hwdata/hwdata_git.bb
index 56d814db887..738c32d637b 100644
--- a/meta-oe/recipes-support/hwdata/hwdata_git.bb
+++ b/meta-oe/recipes-support/hwdata/hwdata_git.bb
@@ -5,8 +5,8 @@ SECTION = "System/Base"
 LICENSE = "GPL-2.0+"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1556547711e8246992b999edd9445a57"
 
-PV = "0.345"
-SRCREV = "5d7d97bae533401f60ce9a5a036ff7152c8aca8c"
+PV = "0.346"
+SRCREV = "a2bff16032a68b089eeb169f09dea08094891c9c"
 SRC_URI = "git://github.com/vcrhonek/${BPN}.git"
 
 S = "${WORKDIR}/git"
-- 
2.17.1

