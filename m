Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 981B3C43217
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 15:58:37 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web10.23553.1668873511589692589
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 19 Nov 2022 07:58:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=c5dDDHaZ;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: akuster808@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id s18so3743504qvo.9
        for <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 07:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nqZYNcZN/dqGYfoSuHT3r494BS/3IdpfHHng7p+Qrpk=;
        b=c5dDDHaZWWZcXl+ol16FUXPl7euYYzSZd/QVuzcJHVyd5EJM9x0tp/aW/4qmCFacf/
         heH+Uso0F4Wn7rJaW+AJVVUQZPDApe63rrJjlmgKtGGc45KUJ5OZkRFiS4/HpjTRCWj/
         hPgQsKJNnwGqbJi+l1naFU66RZ3bFLNpcURiy9rORGG/dsGx72+sjJ2RpeiI/+B9+afF
         EffyfihKE10VWUP0ZJLFmbB9GTuaIFjhP8/668sYdrYobGdmJlTKwqGDl5D0ue2HY+3P
         J40X2s2PARQ39BEk8b4B3r/oYF8SRM2prHlb+ImMZ8ygbACnGN+rPY6bem0vew164VxF
         q/lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nqZYNcZN/dqGYfoSuHT3r494BS/3IdpfHHng7p+Qrpk=;
        b=qRZfU+dLO7+0EGC8ehJVJqtSaOs5YFRok2ZNkBgqdeHGggZOgu9CoOs6PyFaANvAZe
         5z1HKbsTvFCYjYJ7vPrsYxDJcGNa+zcEkdx0GppF5fBPr06zyz4WSfLdzJJxUwBaq74V
         q8VMKo4gYfl2PrC9Nkd755oPPdu1j5ta0nBEKQBr4jpFLiARmDLOtYnGeQ6wQ1fotf/e
         Z+4KzWzZSSX3rDR69JOIRe+/+XhumrxorN2IWP4xwYhtBw+585QPzUbTjNfRdp2fUgDC
         ViqEkvgGihaXM7KMR0iAZFBzRbrjd4pkeiOToWix8k4PxhlT560g0ISZsNmR5aWEyrEW
         l18g==
X-Gm-Message-State: ANoB5plKTly+94qr5evVf7IdR7+0JIEQphz0Mu22PZZH1BGGLmjG1jgL
	LCzJ9Acvgl3KQodUhdYlK/zJ/ignaBw2Bg==
X-Google-Smtp-Source: AA0mqf4RQfn+ejxqrnRktpZ/9VEEIN7UlAxUDfh39M2mnkw/juxeFEuVyZfRA0A3p87v82of27u1XQ==
X-Received: by 2002:a05:6214:162c:b0:4c6:92da:3c21 with SMTP id e12-20020a056214162c00b004c692da3c21mr7431817qvw.33.1668873510180;
        Sat, 19 Nov 2022 07:58:30 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:8dbe:f48d:8b1a:1569])
        by smtp.gmail.com with ESMTPSA id c7-20020a05620a268700b006fb112f512csm4821314qkp.74.2022.11.19.07.58.29
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 07:58:29 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 19/35] python3-protobuf: upgrade 4.21.7 -> 4.21.8
Date: Sat, 19 Nov 2022 10:57:43 -0500
Message-Id: <2e95c67c79de16ba29d136361b4dcf64ee3d7b34.1668873377.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668873377.git.akuster808@gmail.com>
References: <cover.1668873377.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 15:58:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99658

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 2f52d33495317913461053954139b597c317beeb)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{python3-protobuf_4.21.7.bb => python3-protobuf_4.21.8.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-protobuf_4.21.7.bb => python3-protobuf_4.21.8.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-protobuf_4.21.7.bb b/meta-python/recipes-devtools/python/python3-protobuf_4.21.8.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-protobuf_4.21.7.bb
rename to meta-python/recipes-devtools/python/python3-protobuf_4.21.8.bb
index 24ce61cad7..1eb1832619 100644
--- a/meta-python/recipes-devtools/python/python3-protobuf_4.21.7.bb
+++ b/meta-python/recipes-devtools/python/python3-protobuf_4.21.8.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=53dbfa56f61b90215a
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "71d9dba03ed3432c878a801e2ea51e034b0ea01cf3a4344fb60166cb5f6c8757"
+SRC_URI[sha256sum] = "427426593b55ff106c84e4a88cac855175330cb6eb7e889e85aaa7b5652b686d"
 
 # http://errors.yoctoproject.org/Errors/Details/184715/
 # Can't find required file: ../src/google/protobuf/descriptor.proto
-- 
2.25.1


