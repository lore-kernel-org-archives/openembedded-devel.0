Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.11842.1594608993907352567
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Jul 2020 19:56:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RhLSnRap;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id k5so4863363plk.13
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 Jul 2020 19:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=daCaLId2yCXqdqF/EYTDpNI/4gXawi3HChCeOjtwUas=;
        b=RhLSnRapQ6buLAGEj5fYgjfEl2PzGs0MwyjlV55U6kfnkVVQrPdayt9/0GO5eXdrwy
         3jTbUH5TDI9DQ2kjWwz+BKDLOAOt1Snd//WwECNQLPb3FKRZjvvC3dUURm6fY4nzN6EO
         7owbqTO9z9wXMgfQHCHs87XbR87U+YrnJWYCPgSloLVz3LuF6EIYLv2DY6+gnBEo8O6C
         o7t4nPS1rs+TWkhswYQVTquLUWlwk4ZihzT3E85ux42ubiNCnO58IdiUK0eiyiPNXhay
         Qt3v+ayuO7TjyzjU14XQC1HMlJ5xdo43bIOJxJ5Du4EyvlA7BLk2B3Gh1h+DIpEQpBJR
         3UIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=daCaLId2yCXqdqF/EYTDpNI/4gXawi3HChCeOjtwUas=;
        b=R56EYVALIR93QwvYgNVotOyGa8ckaOgVLiMicsWgeiI+eRqmsj6pG6ezBDMg5Ckvvv
         0248T0dLLGCx3ZRhsalpWr+R+H/scbfpzxKUuhchXGD5Xz+7BnvOuc3BzyzyUZHCB79m
         NxWe8Y3KIDOlL4qDg+ZDV2x4Gr1Qg0T2Bx1cvYWX+9rPlanVaWLovZxuCWpZ78dvMkJY
         R/LjMPd1NRo7xbd0Hq17DBQCpSmTSOSOBjF9hSTKQGGImr3AyBhQRnwyt0Yg/58RadPE
         sy+MJxs3yGVN31ylDM5VDOjrUo1jloRjC674x4zmCu5knFeYKhF0w3pvriEjDsip/fHl
         lxFg==
X-Gm-Message-State: AOAM532Ps3wfrnNCXWL8JyIVknbROS4GLZWJeYIxtS+RKvhO8W2rvsBT
	v3Z4PS1M5n4Pfrd+xeVuGaAgktipSGU=
X-Google-Smtp-Source: ABdhPJxAM+wWoF0MvGBKcOyJYbiCrl11L7tbnucfZhBXE1zl0SZwOG/eWyhEG7vRVfY4qDs9GN2ScA==
X-Received: by 2002:a17:90a:30ea:: with SMTP id h97mr17909337pjb.32.1594608993336;
        Sun, 12 Jul 2020 19:56:33 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:e013:ddd8:d9b9:dad6])
        by smtp.gmail.com with ESMTPSA id u19sm13687976pfk.98.2020.07.12.19.56.32
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2020 19:56:33 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 16/18] multipath-tools: disable parallel build as a workaround
Date: Sun, 12 Jul 2020 19:56:12 -0700
Message-Id: <2103ef7d6425ead1b802f1185fbd84f75c61f9c3.1594608813.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1594608813.git.akuster808@gmail.com>
References: <cover.1594608813.git.akuster808@gmail.com>

From: "Qi.Chen@windriver.com" <Qi.Chen@windriver.com>

With parallel build enabled, we got the following error:

  ld: error in libsg.o(.eh_frame); no .eh_frame_hdr table will be created
  ....
  ld: BFD (GNU Binutils) 2.34.0.20200220 internal error, aborting at ../../bfd/merge.c:933 in _bfd_merged_section_offset
  ....
  | make[1]: *** [Makefile:24: libcheckcciss_tur.so] Error 1
  | make[1]: *** Waiting for unfinished jobs....

However, looking at the Makefile, it does not seem to have problem.

So disable the parallel build as a workaround.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 45d6317353ea7431e2ffbe0419ba7e07a911265b)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb
index af34a4b392..8b0c89338f 100644
--- a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb
+++ b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb
@@ -116,3 +116,4 @@ FILES_kpartx = "${base_sbindir}/kpartx \
                "
 
 RDEPENDS_${PN} += "kpartx"
+PARALLEL_MAKE = ""
-- 
2.17.1

