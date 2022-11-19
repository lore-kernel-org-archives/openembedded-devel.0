Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C466C4332F
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 15:58:37 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web11.23277.1668873500241349036
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 19 Nov 2022 07:58:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qVWJlNqe;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: akuster808@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id c8so5325315qvn.10
        for <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 07:58:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pb4yBMOqursBOBA/rHf1L6cbb1KcXvh1pxHXvY6HTxM=;
        b=qVWJlNqegOqfGQQyTU0rpGcQnaqo3AxJY0k/5LnICAdTlLb+klVHQOLL6y4b1cwF3H
         svOsrl4Np98i80TS6fS2jtVo/H/BgD+9e7FknUXRkJbUAph5kONtYdXh9ilsqV9mWbFx
         G4kJWoDZxVxUWn5JuRGnMss18pyl8gyCyHkICrDbm0W0PaZRCsw1etzCDzkJ0L7dHQHF
         3fVJOGjAb668it2Uk2xI+GR8T7oL3peCi7C6fFxHndUh3OtC7BTfZo2r7l7RkHkbM/8S
         oCOjl/e4uiINkP+4U6hLHY175B1fGzelXi1eCTVSlEYlZ8Z7/rsBbE2Y+c1kLsPMRVYz
         BQww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pb4yBMOqursBOBA/rHf1L6cbb1KcXvh1pxHXvY6HTxM=;
        b=o/FOqa3vBycDg18PRH0FryCvl2aHlUitXWfhpEUpF9/7trabH1SdSUACPjLPzxoCLH
         8T9AhU2B0JNXY9mJF5ds73ru2HhwluzG2dCE5Skhr/PLuZYvFpGb4TBgmRCQDlv9e0YY
         icYGQdpwm4C2jOeFHGolD0FahFXwekztsBfo1CDyuMOjzQNg0zwuHLxnoLX2f1rcing8
         j0ymjxHy2WXcZL3LUcPFGDNfHLLuaoeGaeqdENdnJ2l176qfKe5JXDyzW/BRDPcpZpUq
         LNKwIZEIuw6w65KBMJzvLHI7pPt4f/eYYzFjbHaZ8OwtjI/WuVfEMMCwxefYO8ynDS2I
         1Nvw==
X-Gm-Message-State: ANoB5pmbyandxEkY+NIHxOHyktn0MZiOf9Xw48DpBU6P3m18vB+v8mra
	X5+lHIl+ykiXElMhb4jdWM1hNAwgNf2cdQ==
X-Google-Smtp-Source: AA0mqf6zou0UtuOwCd1+19xDcY45zX2DhG+Qu5evN+O+0cuPYa2NnCQX4RCrecza6err7A67Fbm5kw==
X-Received: by 2002:ad4:4f51:0:b0:4b9:1466:ceb6 with SMTP id eu17-20020ad44f51000000b004b91466ceb6mr11310796qvb.71.1668873514266;
        Sat, 19 Nov 2022 07:58:34 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:8dbe:f48d:8b1a:1569])
        by smtp.gmail.com with ESMTPSA id c7-20020a05620a268700b006fb112f512csm4821314qkp.74.2022.11.19.07.58.32
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 07:58:33 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 21/35] python3-socketio: upgrade 5.7.1 -> 5.7.2
Date: Sat, 19 Nov 2022 10:57:45 -0500
Message-Id: <e64afdf8364c9352f791c15e05d20f589482c863.1668873377.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668873377.git.akuster808@gmail.com>
References: <cover.1668873377.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 15:58:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99660

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
 Fixed disconnect implementation when using a message queue #1002 (commit)
 Fixed remote async disconnects via message queue #1003 (commit)
 Support optional payloads in msgpack implementation #981 (commit) (thanks Cromfel!)
 Recommend ASGI integration for Sanic in Documentation (commit)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 940e750b826752f74ba6ed668573397aabe7eff9)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{python3-socketio_5.7.1.bb => python3-socketio_5.7.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-socketio_5.7.1.bb => python3-socketio_5.7.2.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-socketio_5.7.1.bb b/meta-python/recipes-devtools/python/python3-socketio_5.7.2.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-socketio_5.7.1.bb
rename to meta-python/recipes-devtools/python/python3-socketio_5.7.2.bb
index f71d4dad64..bfc5437349 100644
--- a/meta-python/recipes-devtools/python/python3-socketio_5.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-socketio_5.7.2.bb
@@ -9,7 +9,7 @@ inherit pypi python_setuptools_build_meta
 
 PYPI_PACKAGE = "python-socketio"
 
-SRC_URI[sha256sum] = "5011a0cd2545c954d7df09eef7489ec424c93b001cc146599cd72f1dd20f0d46"
+SRC_URI[sha256sum] = "92395062d9db3c13d30e7cdedaa0e1330bba78505645db695415f9a3c628d097"
 
 PACKAGECONFIG ?= "asyncio_client client"
 PACKAGECONFIG[asyncio_client] = ",,,${PYTHON_PN}-aiohttp ${PYTHON_PN}-websockets"
-- 
2.25.1


