Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C95F5C433F5
	for <webhook@archiver.kernel.org>; Sun,  1 May 2022 16:21:49 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web08.102.1651422101789484131
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 May 2022 09:21:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=H6JsinLl;
 spf=pass (domain: gmail.com, ip: 209.85.214.178,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id c11so629753plg.13
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 May 2022 09:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xM3FdXQ7COwafLKs/ae7QCcbdQe9lCP+9pyHBpMR2QM=;
        b=H6JsinLlwmbMUJCTB56R7e4bZDXW7BX7hi8b7xwzT1+0gE92sicnKVaBIqF8VEzyqJ
         PAwxtMPlpIf4UBpjuS1jZNuWxsNi8wtNJ5RSuWkVKfY8WODaeMW7McKU+AoHmhxuZFG0
         SCmTO/3KoPqL7+PNcgmwSNtdtUp0kCmNV0BG0jo6XI+XKtTTiSN70EvQoANKEGNv6YlJ
         0xVnAghn/htwEm87hRAcZkazXxcgxjJJor3tB9xuJCuvkW7HQ+h1dh7iUe70kFsW8fTO
         Q3PEkTYPQR8um/sOZvHPzE4LK98n8wirrD7vutJvz+t35GsEWDIuu4VzGoQadqdl2x7N
         qYcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xM3FdXQ7COwafLKs/ae7QCcbdQe9lCP+9pyHBpMR2QM=;
        b=esR/Xr3AZo41dklT26ezmeuhDjFlCdwENARCGa4nCHDMcR6Lz5JwD4LC9mwy0lFroZ
         D/rEicYECnuaia0+EkxeQowwcEVvd+0LEVGxBSlUGgZwmfuSxJUD5i1Ufl/GD04SY38G
         1MTsUTy+725WorqzpfJLhzS/f4EUaS6XHOzAPY6Z5PkW9b2U7K8K+NzqEYJ4zPP0dDM/
         42s4KSvrwTUqAf/Supw/YSsdXG3/zkVazEG5wKivZd2g2gN4aslCVM3KPag4BWFRdmsB
         bKm+YDHrhNfbqzKPoc5wCLMjjX3Tk/jlE3x2nYoEZ2aoO4pDeuO0FhPwDL9SxYapo1lW
         Rhsg==
X-Gm-Message-State: AOAM531Y2fw/8pl7Vv9EU5VirWSeNiTQ75ogpB0oUUdfPbM7yKMwkN2d
	EDO99hhwKH94oHnBkzOuAJBRJYtgALh2WA==
X-Google-Smtp-Source: 
 ABdhPJxG3tdMW430OBaQQuxFJqYqT12EapJoGYcZZIsZYMUgZxZFawTHHxjdizel6Re0hSMvclhVhQ==
X-Received: by 2002:a17:90b:694:b0:1d9:6a2e:bc9 with SMTP id
 m20-20020a17090b069400b001d96a2e0bc9mr13851287pjz.169.1651422101058;
        Sun, 01 May 2022 09:21:41 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::2ca3])
        by smtp.gmail.com with ESMTPSA id
 y15-20020a1709027c8f00b0015e8d4eb221sm3048522pll.107.2022.05.01.09.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 May 2022 09:21:40 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Robert Yang <liezhi.yang@windriver.com>
Subject: [meta-python][PATCH] python3-wxgtk4: Needs x11 for sip module
Date: Sun,  1 May 2022 09:21:37 -0700
Message-Id: <20220501162137.2438749-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 01 May 2022 16:21:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96911

sip/cpp/sip_corewxWindow.cpp requires gdk/gdkx.h which wont be built
when gtk is built without x11, therefore require x11 when building this
recipe, if gdkx.h is removed form includes then it fails

../../../../sip/cpp/sip_corewxWindow.cpp:56:16: error: unknown type name 'XID'
        static XID GetXWindow(const wxWindow* wxwin) {
               ^
../../../../sip/cpp/sip_corewxWindow.cpp:59:28: error: use of undeclared identifier 'GDK_WINDOW_XID'
                    return GDK_WINDOW_XID(gtk_widget_get_window((wxwin)->m_wxwindow));
                           ^
../../../../sip/cpp/sip_corewxWindow.cpp:64:28: error: use of undeclared identifier 'GDK_WINDOW_XID'
                    return GDK_WINDOW_XID(gtk_widget_get_window((wxwin)->m_widget));
                           ^
so it is using it and will need some work to get it going without x11
until then disable building it on non-x11 distros

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Robert Yang <liezhi.yang@windriver.com>
---
 .../recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.1.1.bb     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.1.1.bb b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.1.1.bb
index 3583acc9cd..6ec92c2cec 100644
--- a/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.1.1.bb
+++ b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.1.1.bb
@@ -18,7 +18,7 @@ S = "${WORKDIR}/wxPython-${PV}"
 
 inherit pypi setuptools3 pkgconfig features_check
 
-ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
+REQUIRED_DISTRO_FEATURES = "x11"
 
 export WX_CONFIG = "'${RECIPE_SYSROOT_NATIVE}${bindir}/wx-config --prefix=${STAGING_EXECPREFIXDIR} --baselib=${baselib}'"
 
-- 
2.36.0


