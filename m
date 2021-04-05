Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web09.5839.1617634479930239510
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Apr 2021 07:54:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kInNq1II;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id l123so6802454pfl.8
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 Apr 2021 07:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=4tlyTB4dauZjH/5TyNtg76iGe7z1aM0vXPEmiYPIXBA=;
        b=kInNq1IIUm8qRIbtvDAJ+EF4RraSCUjVCA/s0xkaiHHHTo6ZLtmH5KEYNvJscrFlFx
         TSV6NahzxY29mmxYgy43kpofCn3kOkiLiz+YudXLb3F61hbGETB4zmBvsrh9WTgRL/q+
         JZBMEYKvsP7pdmcj/+Iw7hS1wwW3n1g5Plmv4VLHinIlrps1vefnKu+BLY3zaPFG7FMe
         qLmduE3DWXsufvqMnZ4rhDPUqQUuLd1FtEuzcKYxFWoCpImRZ/tSviwiucmQEHpXb9aE
         iAYtSM/6xNYAWiK7BwP0NKqYw7HnuQ50xEjIywjFa742DbIaeekgMTljFE4/o1xtVd2m
         abwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=4tlyTB4dauZjH/5TyNtg76iGe7z1aM0vXPEmiYPIXBA=;
        b=OxF6YulTcDJYBdEhyt3bdtRawRan/KDLZTe5pOHTLd1ZVwv0vi6tKbzVOSVn0jsVZn
         BB9Cr51kEr7ctE2CqD8Ab9UI7lmR83aI12KLIBvbViZtOu6P3+qqMiytX/A6yFS+QZZv
         ZmfmGqhD4ienKVGZo3KPVjDULiNWnvBAqIoUjpVj0DdRU4SYadXW+tIcaLQsFcfUgv69
         WAbABA+SvoFaxWIBSZKoX/AIa45BCUOcnA88kRt4P4WvYPFfgt7Ul/f72XKgbFGN41PU
         S7CvC8ltIkgnDXBCQJIzm4dXUjG1ngg/zWtCIlLEL0qlCvYCRaNF13FNJ9CilYD/8X18
         qe4g==
X-Gm-Message-State: AOAM533Pyen/ujiaCNsI+35vm53N/OUq/IkfvsFP8HeWmTugHs85JDmW
	ArHOGZSJF2iLW6/eiyqH8FZiEkLYgbM=
X-Google-Smtp-Source: ABdhPJxDgmJUj0+aN0desBJw7E08WzV39c6CMl8F5+67XXv4hdBDmhkruy1xLvKlPVc+4Qd6XcPM0A==
X-Received: by 2002:a62:1594:0:b029:1f1:5ede:5245 with SMTP id 142-20020a6215940000b02901f15ede5245mr23944147pfv.6.1617634479315;
        Mon, 05 Apr 2021 07:54:39 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:cb2:3225:c999:3d47])
        by smtp.gmail.com with ESMTPSA id k11sm16501654pjs.1.2021.04.05.07.54.38
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 07:54:38 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [Dunfell patch review 08/11] packagegroup-meta-oe: include nodejs without meta-python2 conditional
Date: Mon,  5 Apr 2021 07:54:21 -0700
Message-Id: <6e017e4c9a5ce1168525fbf34ea20920f0a77597.1617634345.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617634345.git.akuster808@gmail.com>
References: <cover.1617634345.git.akuster808@gmail.com>

From: Martin Jansa <Martin.Jansa@gmail.com>

* it doesn't depend on meta-python2 since:
  commit eaf9cfb01864a7a64c6ba4142283a8cf76cadd9a
  Author: Martin Jansa <martin.jansa@gmail.com>
  Date:   Thu Jan 23 17:44:06 2020 +0100

    nodejs: use python3native

    Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
    Signed-off-by: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 8358e933d71..0b19f0254a2 100644
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
2.17.1

