Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49ADAC433EF
	for <webhook@archiver.kernel.org>; Sun, 15 May 2022 13:49:50 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web08.16867.1652622582585669627
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 May 2022 06:49:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RLXrUR3B;
 spf=pass (domain: gmail.com, ip: 209.85.216.47,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id
 nk9-20020a17090b194900b001df2fcdc165so1672809pjb.0
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 May 2022 06:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=8pA6Dc+XXi66KIqT+vhSLLTBpXrGQsPbF9u1SzMBBJU=;
        b=RLXrUR3BkEcpJL6VwNeRi36NHqcpD7yJ2HIwlUxCcW+6vbMfQFXqS+HxHNkD04YcQV
         I4aH6YsKIyfvz1rq6kyfaFU1DBxdxsoYQejOqCNHmcnrxokvcoSppq30maZSzQI30efb
         u2PjFKdLCMpyAnJUxDLzQEjTM2P6/AwqyPRO0gSb2AfakSfT7MI0+wMoFjKpJ4yIK/4S
         CGt2o1l8E3h2cWgzUAq4M15nMVzPNkFUsFzdCKX1Mc9K7Z8+GRgOG8J4J9BKNmfol6FN
         ZSxcU6U3VljDZk8F+2XMhNxZZ/q8PDYONRfMinxaBl4mzmARJm5Ik3YPcpXbPA8VY0B2
         E5Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8pA6Dc+XXi66KIqT+vhSLLTBpXrGQsPbF9u1SzMBBJU=;
        b=JdwkMYUQh+c+iZtjUY/PlsU+QIv9bf/IvQID7OgBsJ1V8zPSt2/3Pqs/edfvWD1+iF
         X7mJOeuyYZsBUFXprgm/zFGB4o8fGTzJkr3XhbAR0q3/1u0mAPphgvjNH9WeZF6mgM15
         viBJEN97jRvuc8XulvHjJUVz5U1f0K34ZkgzAUQ0MkBXCEyT1+0ZLKJF6asLrxwfYwdU
         zWYs6yF3GHgZreZECdG1ztL3qxUJ62oTcw7dfmRMq0rcxZ23rcY63qtHzUOBgXiKbNoc
         5qM/QFWCvSuiJ6dIdtaO4Ss+SZ85Xc+MD+xuuJ5M1PrQiNHJZaB4mIuEzgplN6hSWY6g
         wTUA==
X-Gm-Message-State: AOAM533EJM/HIQeyydXtuNuWwEglH3lZktmMvjI5jZYXfNTiTJEyv42o
	FTAzZgyEDANdx/Dbcg3DSYS5bGkwawJeSQ==
X-Google-Smtp-Source: 
 ABdhPJxuaCbQS/Ij6FPJL4EQDn8xMPnn8FzGW2udlWpIb07uApw5RVhuHpc9mjBm8ApFw14LkLi0Zg==
X-Received: by 2002:a17:903:18b:b0:15e:92b9:783 with SMTP id
 z11-20020a170903018b00b0015e92b90783mr13560676plg.30.1652622581799;
        Sun, 15 May 2022 06:49:41 -0700 (PDT)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:48be:3d3d:c26:7949])
        by smtp.gmail.com with ESMTPSA id
 z22-20020a63e556000000b003c644b2180asm4961650pgj.77.2022.05.15.06.49.40
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 May 2022 06:49:41 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 12/22] python3-wxgtk4: Needs x11 for sip module
Date: Sun, 15 May 2022 06:49:12 -0700
Message-Id: 
 <53fad015d8f5821feb90e8cbd1fd2a1ba41ba04f.1652622481.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652622481.git.akuster808@gmail.com>
References: <cover.1652622481.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 May 2022 13:49:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97109

From: Khem Raj <raj.khem@gmail.com>

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
(cherry picked from commit e347168b10a69febd106d758faf20d95c4bd8b62)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
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
2.25.1


