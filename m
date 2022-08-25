Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 024A2C04AA5
	for <webhook@archiver.kernel.org>; Thu, 25 Aug 2022 11:47:59 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web08.22891.1661428073074471540
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Aug 2022 04:47:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GSveYwbh;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: uvv.mail@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id h1so10137371wmd.3
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Aug 2022 04:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=B6bUObAZA3rkDivRHf6GhOVBh8Mg84XuhxnZhIRgIco=;
        b=GSveYwbhTTTE11O9vfJIzh0vgCkHA3uMFVVxayfWqYZNQb3XQVs/gsBICQAXjPsDna
         N4ZYxDCaZ5nktTrjrYCI8ZaphWzigb5bI1Hm7/Fdn9jPSslXlA73hEV6u3NHhmld473z
         GTWzNk0LjlMCGQpToHmpOn37nLgy3r7ZoGZt7TTqpism4o9/EmNyixDmUcVE3SrLt6on
         qPfuqbjr79KcdKKWTuuagnpGt1BPeGSVfGNTSylENTnxLrANT5S7U+79EHJ/YBZRvjL6
         30LNShSD0LDgnsUNMRut5iW/nLa6ArMqd/L24vfd4e7nBcRjDPRIYgMAfin8JuSYSfGx
         K8tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=B6bUObAZA3rkDivRHf6GhOVBh8Mg84XuhxnZhIRgIco=;
        b=ilpBOx+s4LRZjI7scM72HCCc7CXvoqQSK1KX38fZtDDjLle6pv3eY+DGQz+0ASsyuI
         nkGTNagwPBmc8jL1rZ5yFGHsG1P1lKfC1BrXxHBAh8uNFtPIFoHR6jBJ9mQflufBdfOD
         e3oI4n7z4ERCnxQWFwBk8sSzwHjDWAnKJOr2ZWTXud7TAUJSvpt2/ymTjXjX6fyLt/3A
         ONctC+VD8mAfh+TtN9meyIq/Sm1pk9JfLDteipd0+g1UWW6HLPUMaTCSkj3WyNYQNFJu
         kXbquBYeVdDozmO9cK9Jao5lXEPcM5L4OaLBZVEP5HIU7mrsfjA6NGYPDz8UYhU/okbp
         S3qg==
X-Gm-Message-State: ACgBeo3WtGrfuVzewAX6hqjJ/vdxDibl8OZwRmcsgO1Nn8OZfK0IskLI
	fhQhdB+JVRR+rNAh8yz3Rr4BB1sJwbBmpA==
X-Google-Smtp-Source: 
 AA6agR4VUPni8rSSZJcZI6WknlrN/RQArBIXmlLTjtkDFq9dYjTt7jkCs3qQ1lbb6omeq+sGpli7bQ==
X-Received: by 2002:a05:600c:4e0f:b0:3a5:df56:4ea1 with SMTP id
 b15-20020a05600c4e0f00b003a5df564ea1mr1998493wmq.179.1661428071357;
        Thu, 25 Aug 2022 04:47:51 -0700 (PDT)
Received: from uvv-2004-vm.localdomain
 (dslb-002-205-007-142.002.205.pools.vodafone-ip.de. [2.205.7.142])
        by smtp.gmail.com with ESMTPSA id
 p6-20020a1c5446000000b003a500b612fcsm4913239wmi.12.2022.08.25.04.47.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 04:47:50 -0700 (PDT)
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
Subject: [meta-oe][PATCH 3/3] protobuf: correct ptest dependency
Date: Thu, 25 Aug 2022 13:46:22 +0200
Message-Id: <20220825114622.2978807-3-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220825114622.2978807-1-uvv.mail@gmail.com>
References: <20220825114622.2978807-1-uvv.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Aug 2022 11:47:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98432

From: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>

Signed-off-by: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
---
 meta-oe/recipes-devtools/protobuf/protobuf_3.21.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.21.5.bb b/meta-oe/recipes-devtools/protobuf/protobuf_3.21.5.bb
index 6af02de0e..572a461bc 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_3.21.5.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.21.5.bb
@@ -93,7 +93,7 @@ FILES:${PN}-lite = "${libdir}/libprotobuf-lite${SOLIBS}"
 
 RDEPENDS:${PN}-compiler = "${PN}"
 RDEPENDS:${PN}-dev += "${PN}-compiler"
-RDEPENDS:${PN}-ptest = "bash ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python-protobuf', '', d)}"
+RDEPENDS:${PN}-ptest = "bash ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python3-protobuf', '', d)}"
 
 MIPS_INSTRUCTION_SET = "mips"
 
-- 
2.25.1


