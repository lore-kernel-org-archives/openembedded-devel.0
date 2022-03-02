Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B642C433EF
	for <webhook@archiver.kernel.org>; Wed,  2 Mar 2022 15:27:52 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web12.8585.1646234871928302272
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Mar 2022 07:27:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=o9TfojwV;
 spf=pass (domain: gmail.com, ip: 209.85.221.50,
 mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id m6so3341454wrr.10
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Mar 2022 07:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JokrdjVUW2LOBCjMA6zWtoArwtkBSlMN6vT6tRo6SPo=;
        b=o9TfojwVyEsabzpUkP0mMBxx/jfuuLx31cMPwZaS67d77nomiWRPKrQJkP0XES7pjS
         40dlVqQqJVVDOabWj+L6mfPy9Oamqwq9jRZEsaBCMU/vj8oS5bwVHDoJh3f+Ud5IDt5a
         eN1YSPo6G61IQZSvFzZT/rToOZ7tD4pZh68QDybVGI5u5S1bs/QHzTXd9yJfQRWu0rBW
         lzaQvLjifN5TVJ9q0a/3hNOu0Nd69VFiuI356p+LlS2XOf2BBvDEkvkuwG3U8QRhSdLZ
         jQQChVcJ5G1vGd/w8CxWh/0/mE+cMpzeKJDUywNTMqKYzYqtUM4a8kKtF9kyr0DtnQtg
         wQiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JokrdjVUW2LOBCjMA6zWtoArwtkBSlMN6vT6tRo6SPo=;
        b=KKb4adDbh8D/nXfefZ1gpL3k8lgXls6gpApx2Em6Z667ERJv4XJrKllL06aRAicoka
         SJM5hJ1Q3rdX9uRZ0BzP8K0F+EJ5HPbgobb5o4wok2CebAE1AQ0ykr1znF5nIk8QiCcT
         Y5yDTN/aC7ouyel7BclI7QiLPMVyEJsgwG4UDnQXfMydi4+VQ+nwp7mAig7j2OJQ43Q7
         QdXVuqaxXoABy4mDdT5GqvMN6ggwiJt+qBi3ky3wfwoxkT6TXee7xIhsBEmptqa3LLsK
         /FZKE1OO51mOwZ+lEcAK8nwcUDO1KcimKcTT8n5Vmi/jJoKsUgqTsQ1mGzq9qw5Sk4ZV
         sOOA==
X-Gm-Message-State: AOAM532S9vnXi+8x29mv7RFdXvYHqmAfVQdr5oPdqE66fjvGpqWLXb3M
	m/JVwWkZdHCInfjeS5YSsfSOhOWem4Q=
X-Google-Smtp-Source: 
 ABdhPJwcua49F4DWKkMn/nWUh5z0F8RNgAWoNiIOr7qlV5Va4qjc2v2/pNd0++8gIuOltyR9PYBnQA==
X-Received: by 2002:a5d:4e83:0:b0:1ea:99dd:d335 with SMTP id
 e3-20020a5d4e83000000b001ea99ddd335mr24679313wru.16.1646234870027;
        Wed, 02 Mar 2022 07:27:50 -0800 (PST)
Received: from md2ramxc.ad001.siemens.net ([62.32.0.69])
        by smtp.gmail.com with ESMTPSA id
 g6-20020a05600c4ec600b0037bf934bca3sm7470110wmq.17.2022.03.02.07.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Mar 2022 07:27:49 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [meta-networking][PATCH V2 0/2] networkmanager: switch to meson and
 git
Date: Wed,  2 Mar 2022 16:27:11 +0100
Message-Id: <20220302152713.1876638-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Mar 2022 15:27:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95690

Change since V1: Do not switch to git download, stay with tar

Adrian Freihofer (2):
  networkmanager: switch to meson
  networkmanager: new configure options

 ...e.ac-Fix-pkgconfig-sysroot-locations.patch |  22 --
 ...1-do-not-ask-host-for-ifcfg-defaults.patch |  27 +++
 ...ttings-settings-property-documentati.patch |  60 -----
 ...d-to-var-libdir-rather-than-hardcod-.patch |  30 ---
 .../networkmanager/enable-dhcpcd.conf         |   2 +
 .../networkmanager/enable-iwd.conf            |   3 +
 .../networkmanager/networkmanager_1.36.0.bb   | 208 ++++++++++++------
 7 files changed, 170 insertions(+), 182 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-Fixed-configure.ac-Fix-pkgconfig-sysroot-locations.patch
 create mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-do-not-ask-host-for-ifcfg-defaults.patch
 delete mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/0002-Do-not-create-settings-settings-property-documentati.patch
 delete mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/0003-install-firewalld-to-var-libdir-rather-than-hardcod-.patch
 create mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/enable-dhcpcd.conf
 create mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/enable-iwd.conf

-- 
2.34.1


