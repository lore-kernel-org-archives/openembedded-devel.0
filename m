Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2251C61DB3
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 13:31:56 +0000 (UTC)
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
 by mx.groups.io with SMTP id smtpd.web11.44978.1674653508098724592
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Jan 2023 05:31:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=akRKSIli;
 spf=pass (domain: gmail.com, ip: 209.85.161.42, mailfrom: akuster808@gmail.com)
Received: by mail-oo1-f42.google.com with SMTP id z12-20020a4a490c000000b004f21c72be42so3135990ooa.8
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 05:31:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qqakWtwzBQPVvrZFBkrUAL1LsG1+MzxxlprJnGD8bCQ=;
        b=akRKSIliabJSRdkhF0fz3cs/wCe7JGYH8JLog7Y8vSU9dyf+buAZzLX1Ml+I4bjZBl
         2YgUwjvBi2dny8VSBk8Y76OuUgYDMuRqRYnqLw2is/DiZOlc6ZVib3sEf/moLI5mhyQ7
         DhLrA3R2lLneNGRH04nn8AJN8SYB2TOOUOmNn1kTkCn1qqVfG/seexRijfq1GmfKQOaO
         6b9+E9sqfJHUDCV1etMSNK7F5q8jFvO8zf9ZcoZqDwCoLAMJ7xtFjTowKpsbJdOOoleR
         TNKDnvB33cquKqWEtYhF9Zg5vbnQObuDtfBZfd2H9+5+huNKOv4wUjNYoLVBULv7rbb/
         lH+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qqakWtwzBQPVvrZFBkrUAL1LsG1+MzxxlprJnGD8bCQ=;
        b=jXrdEef+y3M5IZU1c3EXzOUcZZBTZtTshGseu+Hzx3568gx10u7bkgx2JQlOR/jOPc
         +cSI43vAlG5SP5dhxIXiowWdQC8nJVVjaR+xYIOsTJVbYRJ9QsVf6+fqH9M6ovvFgKWD
         1gJpuFVEpyy/MjVaxnXN3F4L/yagzmVx0/rsLIIw+zXoSjqRdSev4sIJLnxl6dMv+J7V
         f1f+jn9ATJIQVSuZUtfJmmVxWspXeTR1Jt6+VFVGLEOmz2u+ZqAj7HKXWiT3EqtimfGG
         ELueK2RKLX8eBuA4eiYfIjSNiE34MoSU5I1H6dTd1iRb5kkOBrIr2VgsGDcEiHYom/+r
         sQYA==
X-Gm-Message-State: AFqh2kqCWZsnOBjfdyjHN6X+lTIe4F/BlVZmT9EGQ7t386bcrwrdSOlf
	3+JKCys2DCUFB2xB6eT4Whup5URM0XE=
X-Google-Smtp-Source: AMrXdXtR7FE71GFCtsFNNCVQXEX57Wj4zdNyVKdtFw4xNTdAXDFuaMBlRDMfTqEqrg7zMYEc1oL0pA==
X-Received: by 2002:a05:6820:198b:b0:4f7:84a9:1c7 with SMTP id bp11-20020a056820198b00b004f784a901c7mr16290337oob.7.1674653507269;
        Wed, 25 Jan 2023 05:31:47 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:434e:23f3:d1f1:25c3])
        by smtp.gmail.com with ESMTPSA id b43-20020a4a98ee000000b0051134f333d3sm914383ooj.16.2023.01.25.05.31.46
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 05:31:46 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 21/41] postfix: fix multilib conflict of sample-main.cf
Date: Wed, 25 Jan 2023 08:31:03 -0500
Message-Id: <f4b166416f982da54cfb1f9546e89020451ef2b4.1674653280.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674653280.git.akuster808@gmail.com>
References: <cover.1674653280.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 13:31:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100756

From: Kai Kang <kai.kang@windriver.com>

It fails to install postfix and lib32-postfix at same time:

| Error: Transaction test error:
|   file /etc/postfix/sample-main.cf conflicts between attempted installs of
    lib32-postfix-cfg-3.7.3-r0.i586 and postfix-cfg-3.7.3-r0.core2_64

Rename sample-main.cf with ${MLPREFIX}.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit b75c138a1cdfacb4a9fba2a291a0d15f0691526b)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-daemons/postfix/postfix.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/postfix/postfix.inc b/meta-networking/recipes-daemons/postfix/postfix.inc
index 8a4428c504..5133caaa46 100644
--- a/meta-networking/recipes-daemons/postfix/postfix.inc
+++ b/meta-networking/recipes-daemons/postfix/postfix.inc
@@ -115,7 +115,7 @@ do_install () {
         'data_directory=${localstatedir}/lib/postfix' \
         -non-interactive
     rm -rf ${D}${localstatedir}/spool/postfix
-    mv ${D}${sysconfdir}/postfix/main.cf ${D}${sysconfdir}/postfix/sample-main.cf
+    mv ${D}${sysconfdir}/postfix/main.cf ${D}${sysconfdir}/postfix/${MLPREFIX}sample-main.cf
     install -m 755 ${S}/bin/smtp-sink ${D}/${sbindir}/
     install -d ${D}${sysconfdir}/init.d
     install -m 644 ${WORKDIR}/main.cf ${D}${sysconfdir}/postfix/main.cf
-- 
2.25.1


