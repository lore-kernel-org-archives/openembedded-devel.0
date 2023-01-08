Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 273EEC677F1
	for <webhook@archiver.kernel.org>; Sun,  8 Jan 2023 15:21:52 +0000 (UTC)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
 by mx.groups.io with SMTP id smtpd.web11.46813.1673191296640712688
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Jan 2023 07:21:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WdQ9hNrg;
 spf=pass (domain: gmail.com, ip: 209.85.210.44, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f44.google.com with SMTP id i26-20020a9d68da000000b00672301a1664so3852453oto.6
        for <openembedded-devel@lists.openembedded.org>; Sun, 08 Jan 2023 07:21:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KNBaQhRo2Hsigqi1idgJwknuCxvXZCBpYo8fWS2cXBE=;
        b=WdQ9hNrgoxIxpVXeef8zHZYtyiAlK/wbpqGme4ZnJdvkSIrHggqcoDv62jPABcGZpO
         tZRzvRbANIsXgAdOGLeNw5esubwfTGemgsJCvlnFDksUSNDLNTON9L78hq+UHAYp0iuV
         y9UhiMLfKG/A9FUtudz8itX5sUtn8s641ibPQqwfYQHzYwXoVq3fpw7MDSHz4tHN2zcY
         KQkVUHshWJPMG3jectEiPctn08llNLPDmxUYOzAJS/OT+HHbpSysfJQmen8MxBaxX0+r
         2aBHDbX9rn+EJ2ZYDe+TC2MTGTi0IEateRvc6fPe3s08RsYfbuM2pq7KsKiUGzkPpvfB
         FVMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KNBaQhRo2Hsigqi1idgJwknuCxvXZCBpYo8fWS2cXBE=;
        b=NjKcyIcXdwa8+I1oTy94WBOG0UkVTCpiJsWX9tQP1CmFhQxh5XEfoRl6IyTAo+bCCO
         AXomWwOnqp33sK9BUtMHLOuKdQ8UzKHcsUnGfmdoR4p8CfJcJ9S+wAVOLavWorAVSJbT
         3xlTCUSfb82Mj7OHoXsWLt5imjQ37zGaaN4KbjKHy9BtKRsvpjOqFAZ56FyQ27of6rar
         KYpoDOTlYqjZzyF6K9aZo1Ozer0bTRcwVZ4JvdonIWGvh6ioy7y9JeiywtrszQkce6tn
         bHBI33l0PnHiXa9jJ0iMlJleoudGCh218CP5WPCgMlWP12kPnaAAtQf2twolI28cSeUv
         hHvg==
X-Gm-Message-State: AFqh2krFnkjWip2xaE6dRSksLECrCQ24gcuHCyouu6+yWY83xfdi/c+g
	GvtEVUL3iETmp7HXKsZf8DGBxP9Slhc=
X-Google-Smtp-Source: AMrXdXsce43b0ljmV2Hogq1M7056pI+dvGX06CEjEM47zepez3LLvSLZbp6pCnIdhpb7xWfD2gpjmw==
X-Received: by 2002:a05:6830:40c5:b0:670:9610:1ce4 with SMTP id h5-20020a05683040c500b0067096101ce4mr31444405otu.24.1673191305403;
        Sun, 08 Jan 2023 07:21:45 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:14ca:f21f:f9fe:c54d])
        by smtp.gmail.com with ESMTPSA id s24-20020a056830125800b00684074fbce6sm3184725otp.54.2023.01.08.07.21.44
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 07:21:44 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 23/26] networkmanager: fix dhcpcd PACKAGECONFIG
Date: Sun,  8 Jan 2023 10:20:58 -0500
Message-Id: <971a33338ff7fc9b90b4063c273c3df79dca2905.1673191116.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1673191116.git.akuster808@gmail.com>
References: <cover.1673191116.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Jan 2023 15:21:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100468

From: Chen Qi <Qi.Chen@windriver.com>

Without this patch, even if dhcpcd is enabled, the NetworkManager
cannot find it. Below are the messages from NetworkMananger:

  dhcp: init: DHCP client 'dhcpcd' not available
  dhcp: init: Using DHCP client 'internal'

The problem is that dhcpcd needs to be specified as a path, otherwise
NetworkManager tries to find it in /usr/sbin/dhcpcd.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 178123a0066c40db1e75d018dc65f056fb03b826)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../networkmanager/networkmanager_1.40.0.bb                     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.40.0.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.40.0.bb
index 10241e12a6..110b499aaa 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.40.0.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.40.0.bb
@@ -104,7 +104,7 @@ PACKAGECONFIG[ovs] = "-Dovs=true,-Dovs=false,jansson"
 PACKAGECONFIG[audit] = "-Dlibaudit=yes,-Dlibaudit=no"
 PACKAGECONFIG[selinux] = "-Dselinux=true,-Dselinux=false,libselinux"
 PACKAGECONFIG[vala] = "-Dvapi=true,-Dvapi=false"
-PACKAGECONFIG[dhcpcd] = "-Ddhcpcd=yes,-Ddhcpcd=no,,dhcpcd"
+PACKAGECONFIG[dhcpcd] = "-Ddhcpcd=${base_sbindir}/dhcpcd,-Ddhcpcd=no,,dhcpcd"
 PACKAGECONFIG[dhclient] = "-Ddhclient=yes,-Ddhclient=no,,dhcp"
 PACKAGECONFIG[concheck] = "-Dconcheck=true,-Dconcheck=false"
 
-- 
2.25.1


