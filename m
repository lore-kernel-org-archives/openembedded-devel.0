Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDEA3C4167B
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 13:49:27 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web11.31568.1701870561365504933
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Dec 2023 05:49:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d+z7mziK;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-50bf4f97752so4665170e87.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 06 Dec 2023 05:49:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701870559; x=1702475359; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vcvzlhXHMBvCmru+uUmtqQNzfTZ19/AO9LYkU96soME=;
        b=d+z7mziKn8crgR4J8dU0G0CXZOfAgPAmaRORhJ6t6v7oTMb2dSFNJupmkcfqDxXU0C
         FYXz0CqgfTzQEp5R4znAuGwCL4Cp+b8GqMyHCv2FqQu0sZfuu9ji+N0OC8fFWgPmM8nq
         bbzOQlCQPwbULbZq5sfGVYxUVOLFrzNw/A0rjfJ2uFZjFuf86DFOPwcRdDlVVpD83Bnm
         S2tGJAqkXHTF2UbwR4mohdVO9w0GFz5S1KTsJgUYi4a3JuC9xxxOh1Buz08CsbikH9QX
         j+4Cd3r4l18COSA2m22fNmGtmIvxs7baqQ77oTUAwH9vOzOo2uMmaX67HgVAsvBvWO8S
         ymYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701870559; x=1702475359;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vcvzlhXHMBvCmru+uUmtqQNzfTZ19/AO9LYkU96soME=;
        b=ssEGRrSieXsGkTeI7sSh3JfEDWb6c6gA8aLLYzYqp6dOjCET6hRlvSVL7tVqdwneN9
         zHhzpK9e+MTQ/Xugy7CGY7ix9w9sJlu0Hc1wrpSW58QV7kYapWOeGmDCvqa6pfU+X4FZ
         kDYsIiyvL5JHgJ/JNgskuDopMu/Bem1FtzLH+xBVucu2J/HJ6t9YjwkDV4/MEizpZW44
         STn6K/Fpd6Tds3RO3xeZpVj2Px06F6EWbDyp2zhIVa0fSHSOSi+v3SCcuNTaVMesKhME
         wdy5JeUQPejmj5++i0Yu/xFY5Z8fEdDsOJ9B9BEJmFIJz7ncRMVpxmfvltm+ZvNHwua8
         78UA==
X-Gm-Message-State: AOJu0YxWGsmQFWD68pz1Zm3RgII43EklWU/tmMwigV37VZRbVQ92TEuB
	LKIn4lOhiaOs03Yg8NnTXs8ibzaUtEIzJg==
X-Google-Smtp-Source: AGHT+IHck+nblahvUe4Umpe65X4WMQq3D21jXRP7Fte0A5u9ZxOMOW7J5Q7bvHWQu4jfS+zlRu0TMg==
X-Received: by 2002:a05:6512:4850:b0:50c:f12:6dbc with SMTP id ep16-20020a056512485000b0050c0f126dbcmr591808lfb.118.1701870558755;
        Wed, 06 Dec 2023 05:49:18 -0800 (PST)
Received: from localhost.localdomain ([176.33.71.251])
        by smtp.gmail.com with ESMTPSA id k21-20020aa7c395000000b0054ce0b24cfdsm2435815edq.23.2023.12.06.05.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 05:49:18 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH] xgamma: upgrade 1.0.6 -> 1.0.7
Date: Wed,  6 Dec 2023 16:49:16 +0300
Message-Id: <20231206134916.327864-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Dec 2023 13:49:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107253

Changelog:

* Use strtof() if available, instead of casting atof() to float
* Refactor to reduce code duplication
* Resolve -Wdouble-promotion warnings from clang
* Build xz tarballs instead of bzip2
* gitlab CI: add a basic build test
* Update configure.ac bug URL for gitlab migration
* Update README for gitlab migration
* autogen: add default patch prefix
* autogen.sh: use quoted string variables
* autogen.sh: use exec instead of waiting for configure to finish

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../xorg-app/{xgamma_1.0.6.bb => xgamma_1.0.7.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/xorg-app/{xgamma_1.0.6.bb => xgamma_1.0.7.bb} (71%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xgamma_1.0.6.bb b/meta-oe/recipes-graphics/xorg-app/xgamma_1.0.7.bb
similarity index 71%
rename from meta-oe/recipes-graphics/xorg-app/xgamma_1.0.6.bb
rename to meta-oe/recipes-graphics/xorg-app/xgamma_1.0.7.bb
index 4949616dd..dc9cbadb4 100644
--- a/meta-oe/recipes-graphics/xorg-app/xgamma_1.0.6.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xgamma_1.0.7.bb
@@ -11,5 +11,5 @@ DEPENDS += "libxxf86vm"
 
 BBCLASSEXTEND = "native"
 
-SRC_URI[md5sum] = "90b4305157c2b966d5180e2ee61262be"
-SRC_URI[sha256sum] = "0ef1c35b5c18b1b22317f455c8df13c0a471a8efad63c89c98ae3ce8c2b222d3"
+SRC_URI_EXT = "xz"
+SRC_URI[sha256sum] = "1c79dae85a8953a15f4fe5c2895a033307b43b8613456c87ec47b374b113bc8f"
-- 
2.25.1


