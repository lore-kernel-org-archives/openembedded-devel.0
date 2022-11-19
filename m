Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5190C433FE
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 15:58:57 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web10.23553.1668873511589692589
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 19 Nov 2022 07:58:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ofXNo5E6;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: akuster808@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id s18so3744079qvo.9
        for <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 07:58:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bm1gnoPDXor7ZX5sXGnNtmAeztlQhpRbn/YB7smwd5A=;
        b=ofXNo5E69TljgZKoC3YiXLwlih61AwMl/Om9fFfQ0i5bNl483g2H+xkr65j/MX/eF3
         flYTQC1ijBntRXgZD4wYtQymfLdDitUluixPDGJ/lvWSLlsKvo3Zl9zQ0a/leQMnT5oy
         QWNZ1ChojlJlpKAFVsBsISU22z0PZtMQ4mVoKjyx7NQGBA9QvYNOTNf0um7KecLkp3+E
         c/njHxeTrokUsbskGz9cgrrSTV6lkrF9ka0NasXstqb0xH+7ZgMi/U7bJtjQ99T7+Huj
         KttCFpOPsvuIiFEHtO6okVDfWV2fAHiTVLFSJq8BErcjlM4HiXpj9GMpl4+2MZWbIpzG
         /j5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bm1gnoPDXor7ZX5sXGnNtmAeztlQhpRbn/YB7smwd5A=;
        b=GwGX7HV5suBTX30r421vcYg2bWe+m6oh1enae//eUcwExoHJRbiKKcyIgRDWqBy2mj
         fe3xTiYdEExQSDQqpTK1uu2dW7c273o74pSRrs+QLoJJjEqrtqZAxQmeLY8YOq2a/4RG
         9mKN56wZEY7QUFWJm0+UMeo385P0kkwOfU/fXcxYif5U3CV8NieKpXvgoo72tYBzZcAg
         HjlBrQ20d2ogGs3yL/QkLGDCcnx4fahsHmuWtybwYe4DKp1jzinqhHcsjom1Vrlh53Gx
         PewOqH1drS9Sj/r3LT4MwJLNNVCN67Mu7+RGi7twUMKr31NKr4LfzEGoMuCUQXRNy1m4
         +7Cw==
X-Gm-Message-State: ANoB5pnPK7AOp66mRqdQyO5hIcED7+TBGyfkrUXsawYCv5nE/Jz4Tz6H
	6mJm8HDE3SiG7u+iz8k5yzE8+ZROObeFwQ==
X-Google-Smtp-Source: AA0mqf7bVUuCzg8iI77VvgUx1bSjHVOVhIOuBs7yEyJD8wgij3ZMS8eMkrJjeKDXhm4l66CtzKP7Eg==
X-Received: by 2002:a0c:e8cc:0:b0:4c6:a094:9f22 with SMTP id m12-20020a0ce8cc000000b004c6a0949f22mr2271169qvo.62.1668873535610;
        Sat, 19 Nov 2022 07:58:55 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:8dbe:f48d:8b1a:1569])
        by smtp.gmail.com with ESMTPSA id c7-20020a05620a268700b006fb112f512csm4821314qkp.74.2022.11.19.07.58.54
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 07:58:54 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 35/35] chrony: Remove the libcap and nss PACKAGECONFIGs
Date: Sat, 19 Nov 2022 10:57:59 -0500
Message-Id: <c354f92778c1d4bcd3680af7e0fb0d1414de2344.1668873377.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668873377.git.akuster808@gmail.com>
References: <cover.1668873377.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 15:58:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99674

From: Peter Kjellerstedt <pkj@axis.com>

There is no need for these configs on their own and they would only mess
up the sechash and privdrop configs. To actually enable sechash one also
had to enable nss, and to enable privdrop one also had to enable libcap.

This also avoids passing --with-libcap if privdrop is enabled since the
option does not exist.

Change-Id: I64a49741f61385e87ddbc83b9e87213a6fc7668e
Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta-networking/recipes-support/chrony/chrony_4.3.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-networking/recipes-support/chrony/chrony_4.3.bb b/meta-networking/recipes-support/chrony/chrony_4.3.bb
index dad09f826c..870c9d8d6a 100644
--- a/meta-networking/recipes-support/chrony/chrony_4.3.bb
+++ b/meta-networking/recipes-support/chrony/chrony_4.3.bb
@@ -64,14 +64,14 @@ PACKAGECONFIG ??= "editline \
 "
 PACKAGECONFIG[editline] = ",--without-editline,libedit"
 PACKAGECONFIG[sechash] = "--without-tomcrypt,--disable-sechash,nss"
-PACKAGECONFIG[privdrop] = "--with-libcap,--disable-privdrop --without-libcap,libcap"
+PACKAGECONFIG[privdrop] = ",--disable-privdrop,libcap"
 PACKAGECONFIG[scfilter] = "--enable-scfilter,--without-seccomp,libseccomp"
 PACKAGECONFIG[ipv6] = ",--disable-ipv6,"
-PACKAGECONFIG[nss] = "--with-nss,--without-nss,nss"
-PACKAGECONFIG[libcap] = "--with-libcap,--without-libcap,libcap"
 
-# This is left for backwards compatibility, to avoid breaking existing
+# These are left for backwards compatibility, to avoid breaking existing
 # configurations.
+PACKAGECONFIG[libcap] = ""
+PACKAGECONFIG[nss] = ""
 PACKAGECONFIG[readline] = ""
 
 # --disable-static isn't supported by chrony's configure script.
-- 
2.25.1


