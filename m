Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9088AC433EF
	for <webhook@archiver.kernel.org>; Sat, 16 Oct 2021 16:52:27 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web12.12971.1634403146775109885
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 16 Oct 2021 09:52:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JqzJ4z7W;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id
 q10-20020a17090a1b0a00b001a076a59640so8849160pjq.0
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 16 Oct 2021 09:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Wyr11I2bZT2wK4uw7UT+54o+P9ecwg3SELeM0nrRPYk=;
        b=JqzJ4z7WbkjpwpQBmi42A+lAAgYao4zNwZ5kQnk/DllPMLwZIT3n7ORnpudta0HQPD
         Nmazf0Obfpb4mrdjyV75fsMCCNNbGbU5aXamcjErUGwVi+1zM10PVkft4i7Nif7jt/zg
         +OghoinscJzH85L2X24Ya2i7j44rcQnwh61Wej17Bk6h5uWepcZOVABN2TT2UwfddAjz
         BIi5vkgbIsTFbiUUjkA4S9rPZmpnkfICoQz61YmiaOE4vGgdAX4hHCbj9r8D7tiuMd1v
         xcX/AlQ/5e8GMw8640dVkSA7wWSZop6eSd2zn7Yfr+Yv/6MtDgHgWt5kGknVEbNFdIKc
         P1jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Wyr11I2bZT2wK4uw7UT+54o+P9ecwg3SELeM0nrRPYk=;
        b=bwxIZvjESgK9yiWg3L63SSat6FemCWqdx1q1GGsdG9ploSC7bCTgypO5jjcW+4LsXb
         GiNCKeiTAE0Ex7M3BwGvFzC7dilOfxaVKrvY+9SAhwndZ2cjb3q4gdE0/SAn9ZSlVPOc
         p9qGSenwzyLKWyURFdLphUKpBXAH2NO0uccAe16Mn8V4Ccxw+u1GPOQjCgRL69oxHDYn
         TlEIfZ7pnaBGqSE3FNenfcrF+d6K55XaOnd4l9s3r0whFE8UFvL94slMTFmNEgmDas78
         6j7vutSYX8U/qF/raXB+pnlYZqIiqOp76JVeDl7OwTlJCwq0vDt4wE8bz7ZtLihXjROO
         iqTg==
X-Gm-Message-State: AOAM531jPBFLBQ2VxOQTT2jy29dBsCLtI7fPof7azXjvNur8GFgWHgpv
	CBAJkfqxKIcJutr+WlBGo3DEWy38Ph98OA==
X-Google-Smtp-Source: 
 ABdhPJxr6Y4tU6FguoDpHuZHlpNz+H40WZGuzJ1zC9/Ee7ARG3UQWFVs4+d/M8+KEv94hh5gkTPY8w==
X-Received: by 2002:a17:903:1247:b0:139:f1af:c044 with SMTP id
 u7-20020a170903124700b00139f1afc044mr17325139plh.23.1634403146070;
        Sat, 16 Oct 2021 09:52:26 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::3fd8])
        by smtp.gmail.com with ESMTPSA id
 i2sm8740756pjt.21.2021.10.16.09.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Oct 2021 09:52:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/3] protobuf-c: Do not use gold linker
Date: Sat, 16 Oct 2021 09:52:21 -0700
Message-Id: <20211016165223.1271496-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 16 Oct 2021 16:52:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93403

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/protobuf/protobuf-c_1.4.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.4.0.bb b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.4.0.bb
index cc037d3934..b5ab0a171c 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.4.0.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.4.0.bb
@@ -19,6 +19,8 @@ S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig
 
+LDFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
+
 # After several fix attempts there is still a race between generating
 # t.test-full.pb.h and compiling cxx_generate_packed_data.c despite
 # BUILT_SOURCES and explicit dependencies.
-- 
2.33.1


