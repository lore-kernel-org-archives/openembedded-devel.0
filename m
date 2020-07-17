Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
 by mx.groups.io with SMTP id smtpd.web11.13581.1594999263211704326
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Jul 2020 08:21:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ovBYsq/z;
 spf=pass (domain: gmail.com, ip: 209.85.210.48, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f48.google.com with SMTP id 95so7120364otw.10
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Jul 2020 08:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=7IrCQxY2vMEaTgpzGajW4yP3/huY2UknVXTf+wQ476U=;
        b=ovBYsq/zXtw7mGj3PRWROtAdPHJHsghXGHB+hpx4udB2nOsexSF9lUDmeiS5jylWpz
         WfDv90oUeBV1vg/AkYXYuVQMTIP6Lyhl1ysLXBuLU745wjwYkiUdsQeokNw9S5aU7eKQ
         MDg9Q9I/863fIlOCyZOdaDMYF/2vfEStVaawGmzTwJirBjentaoW9I4j+djgF8AH1eZJ
         aLkCH5kK5jKjoW5IWINqPvhRzwGTVVDMcSEBgtYY4EP3iO6VPAMXXE9vsehxqyEuZoiE
         13+SxDrPQkT5gvPI/i6JP59vdfhoaWMAvTVDQ1gHmuN3CMQxKihFFG32uvoID7AfHrcs
         xPsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=7IrCQxY2vMEaTgpzGajW4yP3/huY2UknVXTf+wQ476U=;
        b=N9ewjhWbmDfRz5DyKzPavP8B9nGnV0PJaVHma8NNJKtRaEcW4J/91lc1+3nrTxTKKR
         vrSqVhu6c9M5b9O8oj2EhlAuBNJqE9E/G8aazPZHcyrAEOdhNbJcAMK+BlpJY28oOPLG
         YDU5PUbS9wApcoDKIzHWEQcj8uIfxlWpcLgyOcswATqVmqPitjZ2RSE7Ilgy2K79rK3h
         X9/AqR0eoEz/rub5vGcSrLuDUD7lZCo6b6uTWQc9K+NhDBReoi0hUVsnXfCoY0uoeUlt
         nIousrNpkziKCURMJLkgKASfBniFJm//dZa51EI2KOpYsO0F7ADmOlr5diBOJ+qp80d+
         Rb+A==
X-Gm-Message-State: AOAM533vhbXbXYVmSzoYtPJCQvXeIJivsFLWnucSUauqn3YZdf+mvmco
	irNvda9P46j/jO+ueziuxYm2PTVvq+U=
X-Google-Smtp-Source: ABdhPJyXZVMPoyYNZXKRuY+XymNIzOZ6jlDOOM9+kiDNlk3TxJ06rKDqb5lBXAiZZC1zlsmNxUFmPA==
X-Received: by 2002:a05:6830:4008:: with SMTP id h8mr9470273ots.158.1594999262403;
        Fri, 17 Jul 2020 08:21:02 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:b082:650f:a46e:c68d])
        by smtp.gmail.com with ESMTPSA id k126sm1868439oib.52.2020.07.17.08.21.01
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2020 08:21:02 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 1/2] Revert "jsoncpp: upgrade 1.9.2 -> 1.9.3"
Date: Fri, 17 Jul 2020 08:20:54 -0700
Message-Id: <0e0b4892f50808b87223a1e8dbcd13d4e16368cf.1594999160.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1594999160.git.akuster808@gmail.com>
References: <cover.1594999160.git.akuster808@gmail.com>

This reverts commit 2b384c59733c437027f9b14cc32da19251efd97b.

It appears that there was a change in soname not noted in the changelog.

https://github.com/open-source-parsers/jsoncpp/commit/8b7ea09b8055df01866a5ce4142b12ed8f9f13eb

ABI change appears to have occured.
https://abi-laboratory.pro/index.php?view=timeline&l=jsoncpp

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../jsoncpp/{jsoncpp_1.9.3.bb => jsoncpp_1.9.2.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/jsoncpp/{jsoncpp_1.9.3.bb => jsoncpp_1.9.2.bb} (93%)

diff --git a/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.3.bb b/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.2.bb
similarity index 93%
rename from meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.3.bb
rename to meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.2.bb
index 97c6361ad8..a88410f2ff 100644
--- a/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.3.bb
+++ b/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.2.bb
@@ -11,7 +11,7 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fa2a23dd1dc6c139f35105379d76df2b"
 
-SRCREV = "6aba23f4a8628d599a9ef7fa4811c4ff6e4070e2"
+SRCREV = "d2e6a971f4544c55b8e3b25cf96db266971b778f"
 SRC_URI = "git://github.com/open-source-parsers/jsoncpp"
 
 S = "${WORKDIR}/git"
-- 
2.17.1

