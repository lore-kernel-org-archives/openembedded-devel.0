Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 195C5C54EBD
	for <webhook@archiver.kernel.org>; Sun,  8 Jan 2023 15:21:42 +0000 (UTC)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
 by mx.groups.io with SMTP id smtpd.web11.46805.1673191280498950988
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Jan 2023 07:21:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ckr7oXFB;
 spf=pass (domain: gmail.com, ip: 209.85.210.51, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f51.google.com with SMTP id m7-20020a9d73c7000000b00683e2f36c18so3904150otk.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 08 Jan 2023 07:21:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qqakWtwzBQPVvrZFBkrUAL1LsG1+MzxxlprJnGD8bCQ=;
        b=ckr7oXFBmapoG8OZ6nv6ppL8bvGu2hp8dVN6KWnRW2FYXzZk+ZenBIgbl+zj1UVSyI
         NzUFbuX9BB49XRq8zooPv25tbjLmQ2lxUGmgF8GQD3cXub85g1rxzg2LIZX1e4Xua6ks
         QoXJt4QcInyl5GRl0ToapntviKbkuR+x8/GX9yrzTbAJqyAyyCRa8X1qjhIjMkR9dEGi
         4PlDifB/AEINSI5LKqVh2lDxfm3LW2L1LXjQPaOX2RKpYObOJHF0bTYmM8S2+recyaB6
         LQuqguS4LaVzrauR6vSUXqIrhdTqlNV7WpTBCowrvrdX2IetDlKctuPU5ZoosklRIsg7
         LoLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qqakWtwzBQPVvrZFBkrUAL1LsG1+MzxxlprJnGD8bCQ=;
        b=EVc5SX7h8bGeTuQxnqEzW7uMm8DLQNob8w0QD5fbAI9f6DXxFdbPZ1qFoKXH2m+TUh
         Yx7Daguf+j5EYRoU7PypcwIt7PCU7iOm2nMqnWiQxqAooE+03YCXavzZfkfOY0elGIxn
         m1MkdLBT0nGGWz+7dTUJYmxbtRb7DeJX0d0hoeVyobu1W2bRW0SUmwqJImeKOJJW/c+G
         GnYKduqsU6JAIudk1Cz6hPaAwRAwKP+b1XI8ZgboOb5YxgzRry0nz1KMWHmhdN/xe7CR
         vOG6Fcp9rNhBsl2zvXRTFFhhhHomkuyWdmJ6Zf1ebnfu8G8EHKM6yi6yNakCle1FhWNN
         158g==
X-Gm-Message-State: AFqh2kr8/XilMKQmgxLHDGpYavQEXuWxFRahMMaWOQNj7br5E+wQcVQ6
	YZabq6GKso3fSCej+lUkauzvVCa45FE=
X-Google-Smtp-Source: AMrXdXsQR3xlBQoa/Vq7mYx1NCNE+VfHhOSrDaTC6hPRCqAfcp25RjNefy3bsNpgJWb/YHg2B9DlbA==
X-Received: by 2002:a9d:6e9:0:b0:66d:ef2d:1ded with SMTP id 96-20020a9d06e9000000b0066def2d1dedmr28936473otx.9.1673191300024;
        Sun, 08 Jan 2023 07:21:40 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:14ca:f21f:f9fe:c54d])
        by smtp.gmail.com with ESMTPSA id s24-20020a056830125800b00684074fbce6sm3184725otp.54.2023.01.08.07.21.39
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 07:21:39 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 21/26] postfix: fix multilib conflict of sample-main.cf
Date: Sun,  8 Jan 2023 10:20:56 -0500
Message-Id: <f4b166416f982da54cfb1f9546e89020451ef2b4.1673191116.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1673191116.git.akuster808@gmail.com>
References: <cover.1673191116.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Jan 2023 15:21:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100466

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


