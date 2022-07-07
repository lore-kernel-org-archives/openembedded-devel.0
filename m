Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6C49C433EF
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 09:08:43 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web08.3506.1657184922117872879
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Jul 2022 02:08:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pPnptseI;
 spf=pass (domain: gmail.com, ip: 209.85.208.41,
 mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id e15so1371536edj.2
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Jul 2022 02:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qVe9iENNGjpA0yz5Dlv7un5OFLntVuazdUmgMeA+KrI=;
        b=pPnptseIskZOl6d+jv+8BRpv+lsMyuN1A+nxDGf33Z76EmbGTKOiQWayZJ2GIrcCTb
         JEmJzUl/y07JNaGqdWFqvVdhphqbEEXIGF6SIYC5AUiUuZfq1Kp018RjQJ0UgQLP9n+C
         5sNLFk404L7mtq8BPmf8o8AXOBxzlzGFVueNVr0kwKM7DsgxCWtxtgruDrw+X0BnmvxI
         9vsPMbS+EBNjsO7JthO3wp4JTywKd+HywdkMtGxOMTx6H/SAlwMBXMv69tfTqvuRqitT
         UvrXL3wDms5fG4WNtaqH6H1sR8HymWMvAzQTgiCYpNPZxH8ZxBl+jrkt+O3AgNgczcoi
         PvlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qVe9iENNGjpA0yz5Dlv7un5OFLntVuazdUmgMeA+KrI=;
        b=mVeg1W1eXv9sIQq5aCmzbXe0CDBMCkhEmuyaN4BnvKEvKr56495c4hP68GvvRcajRm
         b0BWGXMurczh+w5Vvv+G6eZgFoBzjyELbw4edDyM7MDnX6AX3+7m5yfNszgFlErcnrCI
         st5+cP8f7xpakhyKxQENOKnT9Q1A6fdMQREWyXI+nsfJjNGcUb6p+nJAUo+uLJEgiXdI
         txzEIjBOuow05eFWB5/Xr+U6+Mtl3m7bWXYfQ2F1xOcO3iChOSfeqS5xV3HOzMsg3cYX
         bIgbssC9vFjKentUdbuHwXLNz3Z0PCWYDK4GUYiG7bQLrx301t/vMZISn3+AwrhyXHOT
         6VZw==
X-Gm-Message-State: AJIora8u/wjA5ndFXYXt9AQtLW58rIr3tp1o2WhzFu6U7DmQTL/VR4lE
	ItBBaJ1a8oNlMv7Kz4oX+lrM5BIDxpjYq5fGXD0=
X-Google-Smtp-Source: 
 AGRyM1vjrmWY4zABINdI2AWVupg94JPtrn9ldcFmuGl4ziCKX2Mhg8InGEpZNCJmcQaPmp4F81rFhQ==
X-Received: by 2002:a05:6402:150d:b0:43a:2cac:ca24 with SMTP id
 f13-20020a056402150d00b0043a2cacca24mr30771876edw.110.1657184920435;
        Thu, 07 Jul 2022 02:08:40 -0700 (PDT)
Received: from md2ramxc.ad001.siemens.net ([62.32.0.69])
        by smtp.gmail.com with ESMTPSA id
 o19-20020a170906769300b0072b13a10477sm350542ejm.108.2022.07.07.02.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 02:08:40 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [meta-networking][kirkstone][PATCH 3/3] networkmanager: minor fix
 rdepends ppp
Date: Thu,  7 Jul 2022 11:06:53 +0200
Message-Id: <20220707090653.2513017-4-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220707090653.2513017-1-adrian.freihofer@siemens.com>
References: <20220707090653.2513017-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Jul 2022 09:08:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97768

The dependency of networkmanager on ppp was intentionally removed by the
previous patch. networkmanager depends on the ppp plugin, which in turn
depends on ppp.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 .../networkmanager/networkmanager_1.36.2.bb                     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.36.2.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.36.2.bb
index eb9e1553c..47c92f75c 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.36.2.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.36.2.bb
@@ -83,7 +83,7 @@ PACKAGECONFIG[bluez5] = "-Dbluez5_dun=true,-Dbluez5_dun=false,bluez5"
 # consolekit is not picked by shlibs, so add it to RDEPENDS too
 PACKAGECONFIG[consolekit] = "-Dsession_tracking_consolekit=true,-Dsession_tracking_consolekit=false,consolekit,consolekit"
 PACKAGECONFIG[modemmanager] = "-Dmodem_manager=true,-Dmodem_manager=false,modemmanager mobile-broadband-provider-info"
-PACKAGECONFIG[ppp] = "-Dppp=true -Dpppd=${sbindir}/pppd,-Dppp=false,ppp,ppp"
+PACKAGECONFIG[ppp] = "-Dppp=true -Dpppd=${sbindir}/pppd,-Dppp=false,ppp"
 PACKAGECONFIG[dnsmasq] = "-Ddnsmasq=${bindir}/dnsmasq"
 PACKAGECONFIG[nss] = "-Dcrypto=nss,,nss"
 PACKAGECONFIG[resolvconf] = "-Dresolvconf=${base_sbindir}/resolvconf,-Dresolvconf=no,,resolvconf"
-- 
2.35.3


