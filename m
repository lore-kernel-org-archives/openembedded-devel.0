Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 067D5C00140
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 14:25:19 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web12.26243.1659968714958773731
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Aug 2022 07:25:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ogWaaMw6;
 spf=pass (domain: gmail.com, ip: 209.85.216.53,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id
 15-20020a17090a098f00b001f305b453feso14743710pjo.1
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Aug 2022 07:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=KVyPBSj47u0whfJcbhjoJAxYLscm8vfSk2nvRYOBfeM=;
        b=ogWaaMw67yQBud5yGv19xc+pt/pPANqy2FvDEpUyTAzvcolStn258mgBAu4JzEZWDL
         yPMLNKbi74R8AxXKX435xqUFb0OSjCXHsVV4jWHS9XRLXsykWQHV2yiNGEorZGM1XrUA
         vwx9LDokLGWKLtuuyqKfd+mOjDj9O0IUFSb8OxW6vm8ZcQ+/xmy4zfigNhezJE8pCE6k
         aa+kVl9DF4hG+skZ5tyooycO/6ebO1f4Odrk+1lcSD8Y78xW96/zkPpV5vp1SclALpPP
         eHGRy/hBQJbdmLzezFfnY4URRAq8Eja6BEzSJXNNlgM5KKu4lZ/QE0HLDSeUT92GPlQv
         2tcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KVyPBSj47u0whfJcbhjoJAxYLscm8vfSk2nvRYOBfeM=;
        b=hJmm1yE358hbW+P+I4YT71v941DBw1oQjsRyi0aidAvW7aH3DlP+tzv+F4N2qenPtm
         LwE2aAZFzbXL1Nfq5DjuEdNQLKcmHnn1YGMrbtf0xRsZDgtLQpYvPIOFx3EirsMjKnLD
         7IZdRGf+wpj2Myl0Dp1HhNBU8fobpMzt3Vdqm/DBLO/NyxyFb7Ct21ASeTiZZ9CfFZpc
         NVXa/cnp6MKsMVMD+kW8bU6V+cvsGypA6uuxQup7i6nsanVfnaFSki1gva2UpGoMtYwA
         XfsACDh9Dm3V8/7ma55e7dmhtRAADlKQnIv4RviC9u8c2VmHvQ0Uazxqv+GeIC9+QPEK
         A9Rg==
X-Gm-Message-State: ACgBeo0KA1woluWjF01BbU0gJVsmqbE5PIk5fjddxQH3fm2GIu4GBGLF
	BTIZ9UatSbJmagBasLzhxF2hhhLhb+g=
X-Google-Smtp-Source: 
 AA6agR5bCcF9V7A3QFUFiM1G371qtVef1IKTvZUu3B28ccbu27Rf5GLVNxHQRZEqjm3efdng8H67Vg==
X-Received: by 2002:a17:90b:3586:b0:1f4:d507:783e with SMTP id
 mm6-20020a17090b358600b001f4d507783emr28896539pjb.171.1659968713927;
        Mon, 08 Aug 2022 07:25:13 -0700 (PDT)
Received: from keaua.caveonetworks.com (c-67-181-203-136.hsd1.ca.comcast.net.
 [67.181.203.136])
        by smtp.gmail.com with ESMTPSA id
 u8-20020a1709026e0800b0016f1204cde8sm8757492plk.301.2022.08.08.07.25.12
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Aug 2022 07:25:13 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 10/13] openipmi: Fix buildpaths issue
Date: Mon,  8 Aug 2022 07:22:49 -0700
Message-Id: 
 <bbfdaf4cb6a2244c34982f1468139936d0f26500.1659968069.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1659968069.git.akuster808@gmail.com>
References: <cover.1659968069.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Aug 2022 14:25:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98170

From: Mingli Yu <mingli.yu@windriver.com>

Fixes:
   WARNING: openipmi-2.0.32-r0 do_package_qa: QA Issue: File /usr/src/debug/openipmi/2.0.32-r0/OpenIPMI-2.0.32/swig/perl/OpenIPMI_wrap.c in package openipmi-src contains reference to TMPDIR [buildpaths]

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 5abd81567d5ed091ed870abf24e51f260747d593)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-support/openipmi/openipmi_2.0.32.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-networking/recipes-support/openipmi/openipmi_2.0.32.bb b/meta-networking/recipes-support/openipmi/openipmi_2.0.32.bb
index c61303b81e..8625afaa74 100644
--- a/meta-networking/recipes-support/openipmi/openipmi_2.0.32.bb
+++ b/meta-networking/recipes-support/openipmi/openipmi_2.0.32.bb
@@ -85,6 +85,10 @@ do_configure () {
     done
 }
 
+do_compile:append () {
+    sed -i -e 's#${RECIPE_SYSROOT_NATIVE}##g' ${S}/swig/perl/OpenIPMI_wrap.c
+}
+
 do_install:append () {
     echo "SAL: D = $D"
     echo "SAL: libdir = $libdir"
-- 
2.25.1


