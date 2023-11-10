Return-Path: <edi.feschiyan@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39EC7C4332F
	for <webhook@archiver.kernel.org>; Fri, 10 Nov 2023 10:24:34 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web10.24494.1699611869539159268
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Nov 2023 02:24:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=kg9vt/Jy;
 spf=pass (domain: konsulko.com, ip: 209.85.218.50, mailfrom: edi.feschiyan@konsulko.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-9d10972e63eso306797666b.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Nov 2023 02:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1699611868; x=1700216668; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RAcmR7hPk6kDo6VtKy2JV9VYKwu4iUWDVoRVVSoqEbM=;
        b=kg9vt/JybpM56B0Vbp+c0tTeD0VsztNXLWrqPwVFBGwe+ktoGCCMSsmABihQoAXG4y
         awOMbs0SFBZZzXLCQVhtNWZJcGLzuBG5TEQXqoNRyjgHE0tK1O6HkIycYez5dA3lM+9E
         JbeJJx3jSDjqNKXyo3r9ZjKkdh1SEBclU2xuc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699611868; x=1700216668;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RAcmR7hPk6kDo6VtKy2JV9VYKwu4iUWDVoRVVSoqEbM=;
        b=TcCso1g2nJlrBurV60RzZxi9QXiYi4rCiOKXXoVXOIr46NfQIkF0eH5+jkUwWXgBhn
         /MB6OQKo0xeNiEJ7OMVDTPw5WsyQ+64xvoR75ZUWImVSIl7AO6bR92Dn2H4RRSOb3ZHa
         HLZAwfK0OuS4nwVlw6I+NbMsKAa4R8TYguBQX+W4Sfs/mpSLQahKI6xSpXV3UobbvFHX
         CPZ1x3HW5H5c8msM2ZXc8U1ATvSFpfg6t5EhumVKt947YHrAmTyS95aJpoMnKXgj3/EI
         gMrQDuyz+v1uhhCN9noMW/pV4sJTRyD3/9KzSTHQTHIgc+o7IMDElcHvoGEXa1mLWace
         /IFw==
X-Gm-Message-State: AOJu0YwTESqfLcXJ9rqnqAU7qvdWm3W0c1TkP7HxZuiAgXyI5GFS27Jk
	rS9sBeS+zfGSM4lsK3rh9bm2XF6ACUPWrs+61Fs=
X-Google-Smtp-Source: AGHT+IHsyhLWDzRosFz4gsp/9zruqcsbJ5F+5XONhZljixq3PRntCxPsMoqeLP3QjUPf6PDiRfPNfA==
X-Received: by 2002:a17:906:27d9:b0:9e6:8bb5:8d65 with SMTP id k25-20020a17090627d900b009e68bb58d65mr447593ejc.61.1699611867946;
        Fri, 10 Nov 2023 02:24:27 -0800 (PST)
Received: from bricklet.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id t12-20020a17090605cc00b0099bd7b26639sm3741772ejt.6.2023.11.10.02.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Nov 2023 02:24:27 -0800 (PST)
From: Edi Feschiyan <edi.feschiyan@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Edi Feschiyan <edi.feschiyan@konsulko.com>
Subject: [meta-oe][PATCH] libbytesize: update SRC_URI
Date: Fri, 10 Nov 2023 12:24:23 +0200
Message-Id: <20231110102423.405986-1-edi.feschiyan@konsulko.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Nov 2023 10:24:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106533

GitHub has been redirecting for a while, so switch SRC_URI from
github.com/rhinstaller/libbytesize to
github.com/storaged-project/libbytesize instead without redirects.

Signed-off-by: Edi Feschiyan <edi.feschiyan@konsulko.com>
---
 meta-oe/recipes-support/libbytesize/libbytesize_2.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libbytesize/libbytesize_2.10.bb b/meta-oe/recipes-support/libbytesize/libbytesize_2.10.bb
index 926a603b8..28e40f66e 100644
--- a/meta-oe/recipes-support/libbytesize/libbytesize_2.10.bb
+++ b/meta-oe/recipes-support/libbytesize/libbytesize_2.10.bb
@@ -10,7 +10,7 @@ S = "${WORKDIR}/git"
 B = "${S}"
 
 SRCREV = "6e83cc6f6dff4f126fc79284e0c3c1c50123380d"
-SRC_URI = "git://github.com/rhinstaller/libbytesize;branch=main;protocol=https"
+SRC_URI = "git://github.com/storaged-project/libbytesize;branch=main;protocol=https"
 
 inherit gettext autotools pkgconfig python3native
 
-- 
2.39.2


