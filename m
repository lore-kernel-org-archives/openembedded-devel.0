Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC4BDC4332F
	for <webhook@archiver.kernel.org>; Sat, 11 Nov 2023 17:17:34 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.55694.1699723053911846175
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Nov 2023 09:17:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fzpIO4xE;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-40907b82ab9so24070015e9.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 11 Nov 2023 09:17:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699723052; x=1700327852; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OtgD8poY1PtSp8/0Nbd2I2yMSn/N2LU9ps99pEM6FXw=;
        b=fzpIO4xEozivpI9qi8R/EJcKo/FVSRNGLOTYCdt8lo1a211LsK+fVQ6EP3ict2+XKa
         XJAvRSlc2VVq4GpNx2rciB9ocWBq2PN2gN19BiXeqCp5C9fzq4jEbUekNlyysMGbFmsk
         XQwyrOUB1Ni2gcXTyRBG3TU0kU+kwhT4TcGe8z7yr19WhgvgTeyXq4P+rTvt+nF++JhV
         VJTF5+qb+7kzpEuYzUFJZ+1rkflZbUE174BOztSLJjlVVb4ZOmUm0XSy56BIXuFELJey
         ouTJKuiwMskCmPhf+Os80j/ogJOEsQZdLNWehIS2jeB7IXhzbL/4JPaQ/vcQIu/bpw05
         qHdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699723052; x=1700327852;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OtgD8poY1PtSp8/0Nbd2I2yMSn/N2LU9ps99pEM6FXw=;
        b=C38eek/T/iqEyVQImBTexOvB75BOZD78s6XIqdyRWgtLFu+laENr4pLcD9vkiw8qQ/
         OJPbnll8RkK0PhNYqL3iGNqBf0crZFzVvDKfi5Yv0IL/W+MMpYGvCHJvUmrsfE5Jvl4C
         YjGud/2cCHwUcCNjavvkSkbKdoUoSlw/QZl8oOzNly/BuNcz/rTrLnwLqkchGgnC8gGc
         S4Eq9P7W9MwPgNkeLCzROtGtbUAn42jTzJnPy6IpcpY2iuCZoE01OMKm3J5e7r09u+QS
         TYogY/UK/y3kBPWQVhAJ7FdaAptSQAfNWWlkT7YJsfRwqpyAiYjHPxBTFxO4ox5XHlJE
         eXHw==
X-Gm-Message-State: AOJu0YyfKr29tVZ3gT+P6fRASL3FB+jr8uxzzR4pJw6bbAVw2dz2l7Ny
	BLI00OwvZAUqihVa8fjYOOIh43vdfJMqRA==
X-Google-Smtp-Source: AGHT+IGu/+sB7EaDL3vcWXVKFyUweiq0mtpYY7I2FPMp+BH+JZHKn/+0pX6SMF7IiWRpQ7zFf58cEg==
X-Received: by 2002:a05:600c:548b:b0:407:3e94:bcca with SMTP id iv11-20020a05600c548b00b004073e94bccamr2182323wmb.1.1699723051558;
        Sat, 11 Nov 2023 09:17:31 -0800 (PST)
Received: from localhost.localdomain ([176.33.65.238])
        by smtp.gmail.com with ESMTPSA id bi15-20020a05600c3d8f00b004095874f6d3sm2693937wmb.28.2023.11.11.09.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Nov 2023 09:17:31 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-webserver][PATCHv2] xdebug: upgrade 3.2.0 -> 3.2.2
Date: Sat, 11 Nov 2023 20:17:21 +0300
Message-Id: <20231111171721.3393293-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Nov 2023 17:17:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106558

Changelog:

[2023-07-14] — Xdebug 3.2.2
    -Fixed bug #2175: Crash with EXC_BAD_ACCESS in xdebug_str_create
    -Fixed bug #2180: Crash on extended SplFixedArray
    -Fixed bug #2182: Segfault with ArrayObject on stack
    -Fixed bug #2186: Segfault with trampoline functions and debugger activation
[2023-03-21] — Xdebug 3.2.1
    -Fixed bug #2144: Xdebug 3.2.0 ignores xdebug.mode and enables all features
    -Fixed bug #2145: Xdebug 3.2.0 crash PHP on Windows if xdebug.mode = off
    -Fixed bug #2146: apache2 segfaulting with version 3.2.0 on PHP 8.0
    -Fixed bug #2148: Icon for link to docs in xdebug_info() HTML output does not always render correctly

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 The only difference from v1 is that the forgotten whitespace in the changelog has been deleted.

 .../recipes-php/xdebug/{xdebug_3.2.0.bb => xdebug_3.2.2.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-php/xdebug/{xdebug_3.2.0.bb => xdebug_3.2.2.bb} (91%)

diff --git a/meta-webserver/recipes-php/xdebug/xdebug_3.2.0.bb b/meta-webserver/recipes-php/xdebug/xdebug_3.2.2.bb
similarity index 91%
rename from meta-webserver/recipes-php/xdebug/xdebug_3.2.0.bb
rename to meta-webserver/recipes-php/xdebug/xdebug_3.2.2.bb
index fe6fc5bf9..8ad588d29 100644
--- a/meta-webserver/recipes-php/xdebug/xdebug_3.2.0.bb
+++ b/meta-webserver/recipes-php/xdebug/xdebug_3.2.2.bb
@@ -6,7 +6,7 @@ DEPENDS = "php re2c-native"
 
 SRC_URI = "http://xdebug.org/files/xdebug-${PV}.tgz"
 
-SRC_URI[sha256sum] = "7769b20eecdadf5fbe9f582512c10b394fb575b6f7a8c3a3a82db6883e0032b7"
+SRC_URI[sha256sum] = "f48777371f90cbb315ea4ea082a1ede6765bcfb35d7d6356ab8f71fd6dfcc157"
 
 UPSTREAM_CHECK_REGEX = "xdebug-(?P<pver>\d+(\.\d+)+)\.tgz"
 
-- 
2.25.1


