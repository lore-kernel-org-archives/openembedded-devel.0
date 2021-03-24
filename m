Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web08.1222.1616604473838709819
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Mar 2021 09:47:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=reg2dvR0;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id u5so34018138ejn.8
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Mar 2021 09:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=buKmJkHBthkdJEQ3UEz6ZW6LGUeVHlG01cLB6TkgKy4=;
        b=reg2dvR0FGpfg3ZNbgM32b1lHMIBC51vEElCSc4nGot6V1F8KOBVrGuneZ+uZQHDBd
         9xDtLSpXZa0yn9nyZCk1lZGPnSoPrjnesK2J8p5yAHURPDg8DKW5ZFf7ZT74um4Tyw1v
         EhGr944VE9E7pwca4fDznxPmDbXivOTehWBM2dL0EFD2L0wsYTCMXY9GbWfd10jLsDoV
         V8wXqOceVbUmpmal+M5uaWq2ssOWXIdq8zLg2munQoAn1UAFcQobbhAzyjjsVr/tpTns
         AVH7hDkrUvYBOjd4G/5N7BtoZYTN2YY2KONZkPJHdF2mYLqu+IgQGXPjTp+U5D9BFVw/
         TJhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=buKmJkHBthkdJEQ3UEz6ZW6LGUeVHlG01cLB6TkgKy4=;
        b=BZb/A/K3Lsxz89kWL5n/biqDw23EH8nq8UqxKDf2No85JxScDuJGPtUaam5LO9kJhp
         x3YNGLPC2LK1OZnO7zuGgwlnqSRu9ZZV7RLQ6Yp068kuKpAqCHFjcZS/D02St/kib2LO
         FhBXm7O/J1BfuuhDIW2iUZ8nY4ME6WdXxg+94fLIo/377cFtn1O5L0yGB507a+icfjay
         HZ0QE/iQQlA3KHkTc9WV1lS6ZZFrC2IV6J0jyBJDcoxTmlEYDoQdD4lq+r071dL38xJ1
         l7Cqh9UA10Ck4E9WxzqufM32Xk5MAnCZQKbuj0SvQ+tOzb+omR3bNEZWBZgFx/6LfBhG
         x1dA==
X-Gm-Message-State: AOAM530XF377dfClgWt/MZKQJEBWOeM2LGg1RvyZqg+LxAW1Pa1dGqj/
	X90YUhxOJQU3RTcRqbfTMQcARrxiWUg=
X-Google-Smtp-Source: ABdhPJxVutlfgNaASPpr3EQwr6WOHGMGrc8vI6zbWs5AsO1rX+5M7DBVGQnBpBd4SIsq/z87C3QwlQ==
X-Received: by 2002:a17:906:eda3:: with SMTP id sa3mr4656291ejb.147.1616604472326;
        Wed, 24 Mar 2021 09:47:52 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id gz20sm1216759ejc.25.2021.03.24.09.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 09:47:52 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][dunfell][PATCH 2/4] packagegroup-meta-oe: include nodejs without meta-python2 conditional
Date: Wed, 24 Mar 2021 17:47:47 +0100
Message-Id: <20210324164749.390872-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324164749.390872-1-Martin.Jansa@gmail.com>
References: <20210324164749.390872-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* it doesn't depend on meta-python2 since:
  commit eaf9cfb01864a7a64c6ba4142283a8cf76cadd9a
  Author: Martin Jansa <martin.jansa@gmail.com>
  Date:   Thu Jan 23 17:44:06 2020 +0100

    nodejs: use python3native

    Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
    Signed-off-by: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 8358e933d7..0b19f0254a 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -113,14 +113,13 @@ RDEPENDS_packagegroup-meta-oe-devtools ="\
     giflib grpc icon-slicer iptraf-ng jq jsoncpp jsonrpc json-spirit \
     kconfig-frontends lemon libedit libgee libsombok3 \
     libubox log4cplus lshw ltrace lua mcpp memstat mercurial \
-    mpich msgpack-c nlohmann-json openocd pax-utils \
+    mpich msgpack-c nlohmann-json nodejs openocd pax-utils \
     ipc-run libdbd-mysql-perl libdbi-perl libio-pty-perl php \
     protobuf protobuf-c \
     rapidjson serialcheck sip3 tclap uftrace uw-imap valijson \
     xmlrpc-c yajl yasm \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "geany geany-plugins glade tk", "", d)} \
-    ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "nodejs", "", d)} \
-    "
+"
 
 RDEPENDS_packagegroup-meta-oe-devtools_remove_armv5 = "uftrace nodejs"
 RDEPENDS_packagegroup-meta-oe-devtools_remove_mipsarch = "uftrace lshw"
-- 
2.30.2

