Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FCABC71157
	for <webhook@archiver.kernel.org>; Sat, 21 Jun 2025 11:17:33 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web10.5513.1750504648520684310
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Jun 2025 04:17:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mwDryogn;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-32b49ac6431so22736411fa.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 21 Jun 2025 04:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750504646; x=1751109446; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xkT3efLqnZ962KMt8GcDNRdP1rPREP+F7zi6yOvoRVM=;
        b=mwDryognPB5zGCJkTBm+nRPwgyBOZGyzw4m9U8myRuQnfL8Zc32ixnQYblRLquO9wq
         Ob29HwnkZ4CDXQeKge07clAg6ulKXbqrEro8VEsPzoUC7lomXhLMpH+S5Tl/V87zgHeq
         VYi2/55HN/n8bZzyyf3Z2fNtQgcUlAs6cit3DF/WWgTIzN2K8hF1LMsbPGj1JNyBBvE+
         gU7b2/Zn+mgE/v0VMFUZt4eSKSB1ll9Emwoj5etIMowocBBoobebydd7Wk38X+9l1BfQ
         mFg5xwGpdWJQ5H32z3N9lpY1jz4mV8fY2EJJQs2XX/7wbnRJ5GNpevwmXphhlSL5HtCm
         dDyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750504646; x=1751109446;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xkT3efLqnZ962KMt8GcDNRdP1rPREP+F7zi6yOvoRVM=;
        b=JxfP0/pDSaLvIIj2japDR9pR0PZE54/rCs+4r5k+uRYhnwZNVhKBV0Z+9NsOdXzRcx
         njwy5ZSV8uKSHotr8x1tBl1cEvbgcZV2/Ip1Ya9ag8L66lZz8FnW5QYV/34Dx7ZDyk7+
         zzujcTWzTXbmc2m2Zmy5o+eOERdJZeYx40gAVFWSxglHwZrMwZ+4G0Cv4J4GGPWAm/QS
         xgDHdGpJb4Ajuf6/BFEit9ZVgsLTwNxBa5nndhI/bF81+gcA8id+ai/0SKBlqDgU03/3
         V6iIP1U4/oV6L1WVSGRpDHSJS+Hk9lRR90y/frMsJdcugc2JbLa9Nwu7KV4W/+baXQmf
         IpuQ==
X-Gm-Message-State: AOJu0YxUjBbIO8vlcM5j3nOJ4E1hcGfk2sS9aIr8nJ0gYoenNa2+8lTw
	F+5KLvsUF+UGvmbvtewKjtRlApZUWHjOUU6YhlN9W/nUJZ+xWRKS2JgHr9BnnhED
X-Gm-Gg: ASbGncsdxN8hq79k8/qTIZJhY2pOxIgaCk3ZI+Z/xZIe1sJ7wuB8ywkZn4AD68WJkY0
	kk+2VqFkrrjGvIz+uU5oLsoXDqmS891KcqJwaAOa20MpUCZ+8NKnWq1DJyJVP+PM+QTGc1QaRt+
	RP2dzlSM1Fz2lmZNQD2nsLRGF0q2V3cGUn73Hd6V5pndVzrmlejoaoyeqdb4KG4tkY1ponPtSpL
	K8CpLjmYTrbhXLNIzYYAaIhvFWMzniC5Bvz6LnyAAEHI0kwO4hq4hMDMjMMaRDpwlvJqPYNoGDx
	H8yWUioP3wTsDERkgqEoQtPXpH5+7fsJ13JYwkkhplJZnWoK/pgKLzIvHp6PmyazX4wXosAHwoT
	bHOM=
X-Google-Smtp-Source: AGHT+IFpzaF9tEMCO6jO0zAVidosJJ1AUuV0P4iY693PqyU2FZpTbY53KhK7LBH4sSiW9qTvVzgrdw==
X-Received: by 2002:a2e:bea7:0:b0:32a:8855:f214 with SMTP id 38308e7fff4ca-32b994215aamr14897501fa.27.1750504645747;
        Sat, 21 Jun 2025 04:17:25 -0700 (PDT)
Received: from localhost.localdomain ([176.33.70.153])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b97fac18dsm5859741fa.44.2025.06.21.04.17.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 04:17:25 -0700 (PDT)
From: Alper Ak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alper Ak <alperyasinak1@gmail.com>
Subject: [meta-networking][PATCH] autossh: Replace WORKDIR with UNPACKDIR to prevent compile error
Date: Sat, 21 Jun 2025 14:17:21 +0300
Message-ID: <20250621111721.1857015-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 21 Jun 2025 11:17:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118002

Issue was related to latest UNPACKDIR changes -> https://git.openembedded.org/openembedded-core/commit/?id=46480a5e66747a673041fe4452a0ab14a1736d5e

ERROR: autossh-1.4g-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/core2-64-poky-linux/autossh/1.4g/temp/run.do_compile.2252' failed with exit code 1

Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
---
 .../recipes-connectivity/autossh/autossh_1.4g.bb   | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta-networking/recipes-connectivity/autossh/autossh_1.4g.bb b/meta-networking/recipes-connectivity/autossh/autossh_1.4g.bb
index 4613ac61f1..2bc302081e 100644
--- a/meta-networking/recipes-connectivity/autossh/autossh_1.4g.bb
+++ b/meta-networking/recipes-connectivity/autossh/autossh_1.4g.bb
@@ -11,19 +11,19 @@ SRC_URI[sha256sum] = "5fc3cee3361ca1615af862364c480593171d0c54ec156de79fc421e31a
 
 RDEPENDS:${PN} = "ssh"
 
-CFLAGS:prepend = "-I${WORKDIR}/build "
+CFLAGS:prepend = "-I${B} "
 
 inherit autotools
 
 EXTRA_OECONF = "--with-ssh=/usr/bin/ssh"
 
 do_compile:append() {
-        cp ${WORKDIR}/autossh-${PV}/CHANGES ${WORKDIR}/build
-        cp ${WORKDIR}/autossh-${PV}/README ${WORKDIR}/build
-        cp ${WORKDIR}/autossh-${PV}/autossh.host ${WORKDIR}/build
-        cp ${WORKDIR}/autossh-${PV}/rscreen ${WORKDIR}/build
-        cp ${WORKDIR}/autossh-${PV}/autossh.1 ${WORKDIR}/build
-        cp ${WORKDIR}/autossh-${PV}/autossh.spec ${WORKDIR}/build
+        cp ${UNPACKDIR}/autossh-${PV}/CHANGES ${B}/
+        cp ${UNPACKDIR}/autossh-${PV}/README ${B}/
+        cp ${UNPACKDIR}/autossh-${PV}/autossh.host ${B}/
+        cp ${UNPACKDIR}/autossh-${PV}/rscreen ${B}/
+        cp ${UNPACKDIR}/autossh-${PV}/autossh.1 ${B}/
+        cp ${UNPACKDIR}/autossh-${PV}/autossh.spec ${B}/
 }
 
 do_install:append() {
-- 
2.43.0


