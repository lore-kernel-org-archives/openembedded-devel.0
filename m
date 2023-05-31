Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5834CC7EE37
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 11:13:43 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.web10.11458.1685531619297824701
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 04:13:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=fXs47rDK;
 spf=pass (domain: gmail.com, ip: 209.85.128.171, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-565ba2c7554so44293277b3.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 04:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685531618; x=1688123618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KH12PCA2rhOjD88TgZcw6BMh0/IVJkaymfcLyLtsBJQ=;
        b=fXs47rDKTzfa6OKWYRfxxW1WxkqcXdtfe4dpGIVhmuPmxFIP+bgcv33m3FmhNLdZIg
         s6n8rofiPnnKnDu/eiE2wnZDXi4fuhUqwYw8V/mQ2HEQxwRccnTAbTffBCa5x8EqixIK
         reJaGbL0d/5gzrHTdcm657r3CFId7MpB/SK0ns5D9I9uJ5nONGZm/KMNHFGkAi1o1NTq
         F7FGHDIxlROf+40K2Ky2/u45fRvtFJqDmXpcGAmBz+At1yw93Yz9oBRdJVTeLAGwGqBK
         gvM7oXvF0M+lu84Zet5C+lGxDToV39bgLL+H6/E0bduYhP1KwznmHLKBI2hI4gyQ4tJj
         hwQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685531618; x=1688123618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KH12PCA2rhOjD88TgZcw6BMh0/IVJkaymfcLyLtsBJQ=;
        b=GZfjTQF8DSTO30mNrQ8Qmg5wJhFp3MvNQOUYFci/MuAdcWOEDzlb1fo4pn/q02yK5p
         c1Meegnpe8ixaxk6I/JfEXbkY6pis98VFbgtapADXfn7Bbd6QD29ClHfXTKUAcalXGs0
         +opfj1mpdFDabJ8tBVOtJUOaUN97gIqErF1Gsy0+el4O1pdMYN7fBPrqDAnrAgVBzieJ
         SagynOZjOy2e5VuRIAFMrwZciTnY7Wnf3GoMVg9RkI2Dfue7T9bVqfiPInkmHpycTZEz
         Qhn49D8K+KsKFnycEHfWpVtZ+z1S35gDNYnIe2Wd7GChjpVgkci69FAjZ5gja8yBoxuH
         56kw==
X-Gm-Message-State: AC+VfDwMg7ZGNn4DliaJGmIv5RVdW75fbdpMDmmxqC/bSgu5rr5JkjE3
	5M8cxuB4p7eUuVVwP+PMgkx6MflLUxg=
X-Google-Smtp-Source: ACHHUZ6bPQpSbDWn361fEtBjSiokzVdHd0+WK62IRuJqH4nKOqUiN2q76LCWCGQDEKk3cfmoOFTbfg==
X-Received: by 2002:a0d:ca83:0:b0:556:ea38:eb07 with SMTP id m125-20020a0dca83000000b00556ea38eb07mr5325103ywd.50.1685531618052;
        Wed, 31 May 2023 04:13:38 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:a3c5:f403:52db:88cf])
        by smtp.gmail.com with ESMTPSA id t129-20020a814687000000b00545a08184fdsm5246897ywa.141.2023.05.31.04.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 04:13:37 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][mickledore][PATCH 27/36] freerdp: Fix reference to TMPDIR in libfreerdp2.so
Date: Wed, 31 May 2023 07:13:00 -0400
Message-Id: <20230531111309.2454603-27-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230531111309.2454603-1-akuster808@gmail.com>
References: <20230531111309.2454603-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 11:13:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103056

From: Khem Raj <raj.khem@gmail.com>

Fixes
File /usr/lib/libwinpr2.so.2.10.0 in package libfreerdp contains reference to TMPDIR [buildpaths]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit f523a41888cc0958115aaf762ae397d559f47725)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/freerdp/freerdp_2.10.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-support/freerdp/freerdp_2.10.0.bb b/meta-oe/recipes-support/freerdp/freerdp_2.10.0.bb
index 0fc779a60e..4cb452608e 100644
--- a/meta-oe/recipes-support/freerdp/freerdp_2.10.0.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp_2.10.0.bb
@@ -54,6 +54,10 @@ FILES:libfreerdp = "${libdir}/lib*${SOLIBS}"
 
 PACKAGES_DYNAMIC += "^libfreerdp-plugin-.*"
 
+do_configure:append() {
+    sed -i -e 's|${WORKDIR}||g' ${B}/buildflags.h
+}
+
 # we will need winpr-makecert to generate TLS certificates
 do_install:append () {
     install -d ${D}${bindir}
-- 
2.25.1


