Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE9BCCCA47F
	for <webhook@archiver.kernel.org>; Mon,  6 Jun 2022 22:01:56 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web09.4620.1654552914318013174
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jun 2022 15:01:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pvzyaw4S;
 spf=pass (domain: gmail.com, ip: 209.85.218.54,
 mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id n10so31580353ejk.5
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jun 2022 15:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/tWUxnNbn7Jnr/oQDnSWmbKXOr8P1eLXjECJjap/5kc=;
        b=pvzyaw4SAap04xQ5CbRSRZc8ovKsWwb1RYuCGMylmcnPjEjFkDiGSC7LV+YKjVaz4l
         3o3iwTzHL7AyD2uV3CPtl6EzVmpLeLuK3FFVRDl7GkbfrHCC14//5yvw8pY3mMlZUqMd
         y84S6c8Ncm7P1AA0Ug1s2NU5z11GR0UoByQiR86mqnzC84wuMfArnOyS7AYo3nOdzgPb
         r40JVk1USuOYEJKRqYzmtVXYlKzwF3sBwDT5hG2jwceVOcxJM6GHBpoWaU830RJfDDao
         JsV0RmIEE5Wx7RSl5mxi1dinr44bjJ5P2P/pbtwoU6riOxn1QxSKTj+uBH/D/xX5i9jW
         W5Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/tWUxnNbn7Jnr/oQDnSWmbKXOr8P1eLXjECJjap/5kc=;
        b=hTriIgvaSt7+v+ZLiv1R3Rf5rU5LTJ2jX4D4BzvPJ+36/gmOL+0X2ArElWHEmfV/WC
         LOL7WNYyaZP1T35t4DBOPofESyDeJcvKBCsBghXCn+tK6cm7OJq4HUgSuT652T9Clteo
         pz4JCA8CdfQ38dQBEa2ozLis8iHO1m/pBEiVBN/Km9SWMe5CxIz3Ws8//oyxQ9TF2+v+
         XycaPri3ieCGcjZmDLhLzWjgg0GTXvxuC504imz8I+DGXg0U2QtecotYEgxyalR+kbFD
         7KnVt+OSclTpiBqSO0Jo+Y7f8FZFl4TfCT6x2xNtkj2uruJ4MZuYI+nAjm5EHYYGYLU/
         oacg==
X-Gm-Message-State: AOAM530QB7CNXXq9k4EVsFOQbOa0IYWakehOIjwYu7k21Z68B6oahrtI
	90dqwQhCZ67xS+m260kJ9rehoshgnUwVmw==
X-Google-Smtp-Source: 
 ABdhPJwpnKqxQAIIM6cRYOHdV6OkQpWw7DG4BkvXrbF+A9PSW+4dXwGDN6MvwMG1Q7TC7nkn3dRUIw==
X-Received: by 2002:a17:907:6286:b0:6da:6e24:5e43 with SMTP id
 nd6-20020a170907628600b006da6e245e43mr23358034ejc.449.1654552912737;
        Mon, 06 Jun 2022 15:01:52 -0700 (PDT)
Received: from md2ramxc.ad001.siemens.net ([62.32.0.69])
        by smtp.gmail.com with ESMTPSA id
 d20-20020aa7ce14000000b0042dd4ccccf5sm9134826edv.82.2022.06.06.15.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 15:01:52 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [meta-networking][PATCH 3/5] networkmanager: use nftables by default
Date: Tue,  7 Jun 2022 00:01:35 +0200
Message-Id: <20220606220137.1887491-4-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220606220137.1887491-1-adrian.freihofer@siemens.com>
References: <20220606220137.1887491-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Jun 2022 22:01:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97434

From NEWS file of netowrkmanager 1.32:

firewall: add nftables firewall backend for configuring IPv4 NAT with
shared mode. Now two backends are supported, "iptables" and "nftables".
The default gets detected based on whether /usr/sbin/nft or
/usr/sbin/iptables is installed, with nftables preferred.

With this change nftables is not the prefered backend also with OE. But
it's still possible to set NETWORKMANAGER_FIREWALL_DEFAULT back to
iptables.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 .../networkmanager/networkmanager_1.36.2.bb                 | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.36.2.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.36.2.bb
index 9fc43dceb5..55eb3e7024 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.36.2.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.36.2.bb
@@ -42,6 +42,10 @@ NETWORKMANAGER_DNS_RC_MANAGER_DEFAULT ??= "auto"
 # ['dhcpcanon', 'dhclient', 'dhcpcd', 'internal', 'nettools']
 NETWORKMANAGER_DHCP_DEFAULT ??= "internal"
 
+# The default gets detected based on whether /usr/sbin/nft or /usr/sbin/iptables is installed, with nftables preferred.
+# ['', 'iptables', 'nftables']
+NETWORKMANAGER_FIREWALL_DEFAULT ??= "nftables"
+
 EXTRA_OEMESON = "\
     -Difcfg_rh=false \
     -Dtests=yes \
@@ -238,7 +242,7 @@ FILES:${PN}-daemon += " \
     ${systemd_system_unitdir} \
 "
 RRECOMMENDS:${PN}-daemon += "\
-    iptables \
+    ${NETWORKMANAGER_FIREWALL_DEFAULT} \
     ${@bb.utils.filter('PACKAGECONFIG', 'dnsmasq', d)} \
 "
 INITSCRIPT_NAME:${PN}-daemon = "network-manager"
-- 
2.35.3


