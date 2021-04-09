Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
 by mx.groups.io with SMTP id smtpd.web09.3546.1617934884772369192
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 19:21:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QJ9Djfkw;
 spf=pass (domain: gmail.com, ip: 209.85.210.41, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f41.google.com with SMTP id y19-20020a0568301d93b02901b9f88a238eso4288304oti.11
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 19:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=/1i0YJe0zsBOocYPZRjCCVwMopR5pDthqQQTQZdqTOw=;
        b=QJ9DjfkwfFwJ1Y6+UJrV32lGSo2Kmo/XsMhL/M7ywwmYt40HP+1JOmZi2jhj1udWoW
         6eYUPNYRUyxG00OY1uLMxp5gm2ZSRfkzRJWgtF4SLj2EluUvtThJ5XOaUwOAE1oo2rF0
         9aktUXInbx3tF4CSvQCGjeJeX9YZ6fD+lnZcIdSo1PoPZESqSs6gi+S/7tpZHq0WL0jt
         LRJBEXc8S/wFNFtN+NSX1OUELGNmNrgEh0HPyKyvqFAUkfsTn0imNXpJfaNg2UKGBaNX
         iDarD4hnmfN3NnPBjbzyOXQJcSNgu5+NKIKb8Jht3PZvL8f0/gEkZhI/4ES30qWBjvaD
         qvxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=/1i0YJe0zsBOocYPZRjCCVwMopR5pDthqQQTQZdqTOw=;
        b=r05f/x03hTwJmzMZN8pkonfzIBALoF0JC2SbtB8lDzlaBq+j483k8yz+ANLAXJZ13u
         MooRzyA+N2wH55PjKJtcHw1iRBfiURSshTbMkV0J+av2rUnrgjWOF9IRrDwgvsbhTaI3
         MQ1QM9v8ZPwdW/gI+3P1qHB7DJafVTTwKj3gTTDCt8ot1dOqg7VPFprUiJOI7+h1FfI0
         zZpNzAbzq5p4ymejTqL8q7R0EdOYKXJCDyNwaiOd+L4SrVwknmwU9ZQo9ZSfIqjXoXFf
         Y4C6T+bcNV1um7ohd8Nh9SyWWuoqvZiZlfFvCeCfPrvE5PVQTo7PmdICGEuyLoxlchSt
         g/1w==
X-Gm-Message-State: AOAM531QF9iXzxv6sk9BEV+IWWISQXIJ+hsGmRIhZVFOEowDooj/2QeM
	Zh1iqfetOevubx14kh9Qqc0X2we74fI=
X-Google-Smtp-Source: ABdhPJx/jjWADcJuA2Wp9kmqICD7THWobtMC72AhUR5suljL/bgrDheASws0I5NXRBEGQL/NMG8G5w==
X-Received: by 2002:a9d:730c:: with SMTP id e12mr10030977otk.230.1617934884024;
        Thu, 08 Apr 2021 19:21:24 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8533:6d3:7a8:8272])
        by smtp.gmail.com with ESMTPSA id k65sm299815otk.53.2021.04.08.19.21.22
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 19:21:23 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 34/36] live555: upgrade 20210322 -> 20210406
Date: Thu,  8 Apr 2021 19:20:47 -0700
Message-Id: <18e0d6bfbcb3d0254de30dde13eb3b6cfd9d6cfb.1617934043.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617934043.git.akuster808@gmail.com>
References: <cover.1617934043.git.akuster808@gmail.com>

From: zangrc <zangrc.fnst@fujitsu.com>

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit ed78d5d038520edef91982f7b1e9a86f6d169c13)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../live555/{live555_20210322.bb => live555_20210406.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-multimedia/live555/{live555_20210322.bb => live555_20210406.bb} (97%)

diff --git a/meta-oe/recipes-multimedia/live555/live555_20210322.bb b/meta-oe/recipes-multimedia/live555/live555_20210406.bb
similarity index 97%
rename from meta-oe/recipes-multimedia/live555/live555_20210322.bb
rename to meta-oe/recipes-multimedia/live555/live555_20210406.bb
index 89133854898..cc138adb671 100644
--- a/meta-oe/recipes-multimedia/live555/live555_20210322.bb
+++ b/meta-oe/recipes-multimedia/live555/live555_20210406.bb
@@ -16,7 +16,7 @@ SRC_URI = "https://download.videolan.org/pub/contrib/live555/live.${URLV}.tar.gz
 # only latest live version stays on http://www.live555.com/liveMedia/public/, add mirror for older
 MIRRORS += "http://www.live555.com/liveMedia/public/ http://download.videolan.org/contrib/live555/ \n"
 
-SRC_URI[sha256sum] = "b451c7ded8becbfa239e8f4fbe69784413270fb4c5e9b2e74269247dc3dd2e59"
+SRC_URI[sha256sum] = "0bd182fac7d6297d924af4405ce840515a38fa5438cb1a4b90fcb6bc737b36d6"
 
 S = "${WORKDIR}/live"
 
-- 
2.17.1

