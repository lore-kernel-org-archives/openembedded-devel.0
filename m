Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 811B1C43217
	for <webhook@archiver.kernel.org>; Sun, 16 Oct 2022 20:18:58 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web08.33595.1665951534291186592
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Oct 2022 13:18:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jGn7Bmyb;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: alex.kiernan@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id ot12so20867148ejb.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 16 Oct 2022 13:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CB2lC5RAu29u8ZsjkCRI6hYsQ2us0hHrSHEVxD2jB7E=;
        b=jGn7Bmyb+2qAM1fdq8T6H+M+nK1PRCACAY9G8GtRlVDtoy7GyYWRpU+ioPBfkDiHDg
         hkrSHAfQ5SqtBIh04SPtRcPJka+OiGyRynPVm2rnP6VcIO/kFIl24jbaSmnM5yz2+cqf
         BGUjNtynYjT8mHqiUBGzlGfmjBruAtFBUBlnaYSgFKp39fZKlIhQ4ZG72SwgUcgOQ3+t
         wyGnEK8oxiuMG14WgehJBPiRls/xFLwr5gH8FAG6+sYgKjIZQ1zjizC/dz0vhqtQDRKK
         MC/Gs5JHZO3zcb8WG3z7tqIIjYwiGNg2CSnoiN0sPu/TADIbjW/Y9mtA3W8bTwWc4RFJ
         ZLRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CB2lC5RAu29u8ZsjkCRI6hYsQ2us0hHrSHEVxD2jB7E=;
        b=sPj3q2N5fFIo/+IM2dxB7lRMhhG2McN/Ep3bs5dQS9SyDMiUKaVKjGuAWH33EO9gNF
         pZ/9vTGDVneUkeRjASpuvh9CpBCErQvQdz/dzdhviCEjIMvlgeMU/wG7KDavZy5ywsHD
         2z2z8AzzeE+ytcEYqXogoYgzsr5gOLV7okneA9qx/QOPshhwwoCjJ4yPv+87J7IRFsqA
         lp+QCTJSMbh9mNXfihmaMI9jJT5u6SDNNT0kxsseN+zF6hg8A8lo5J+mkTl+A9Mh81mH
         FjfcfhHXWroTroEuYEMFvM11n9LNe+juCbxrVdklvlI+U85T/zSdR07W7TZXlkhk4kwq
         GgrQ==
X-Gm-Message-State: ACrzQf24eQW8hZb5vXEC3mF4M36+kf/+lKJBvvWwbvbJE67jwTleefjm
	ArH5Y9AMB6oAGXw35wpRO0ISc6HuDhU=
X-Google-Smtp-Source: AMsMyM6dMIcSb4OLFXPbhjSqEjxFruZWE2JRNrjo0/2nCT58lVUZkkeMiLI5TuDxbfpdCtc64H/zww==
X-Received: by 2002:a17:907:b0b:b0:78d:8877:9f9e with SMTP id h11-20020a1709070b0b00b0078d88779f9emr6102429ejl.693.1665951532404;
        Sun, 16 Oct 2022 13:18:52 -0700 (PDT)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id ti5-20020a170907c20500b0078d8c1eee44sm4950672ejc.158.2022.10.16.13.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Oct 2022 13:18:51 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-networking][PATCH 3/3] conntrack-tools: Use canonical shell spacing
Date: Sun, 16 Oct 2022 21:16:59 +0100
Message-Id: <20221016201659.14759-3-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221016201659.14759-1-alex.kiernan@gmail.com>
References: <20221016201659.14759-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 16 Oct 2022 20:18:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99182

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 .../conntrack-tools/conntrack-tools_1.4.7.bb  | 24 +++++++++----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.7.bb b/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.7.bb
index 6f88b5fe31b8..8b47ceb1c054 100644
--- a/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.7.bb
+++ b/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.7.bb
@@ -26,21 +26,21 @@ PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd,systemd"
 INITSCRIPT_NAME = "conntrackd"
 
 do_install:append() {
-    install -d ${D}/${sysconfdir}/conntrackd
-    install -d ${D}/${sysconfdir}/init.d
-    install -m 0644 ${S}/doc/sync/ftfw/conntrackd.conf ${D}/${sysconfdir}/conntrackd/conntrackd.conf.sample
-    install -m 0755 ${WORKDIR}/conntrack-failover ${D}/${sysconfdir}/init.d/conntrack-failover
-    install -m 0755 ${WORKDIR}/init ${D}/${sysconfdir}/init.d/conntrackd
-
-    # Fix hardcoded paths in scripts
-    sed -i 's!/usr/sbin/!${sbindir}/!g' ${D}/${sysconfdir}/init.d/conntrack-failover ${D}/${sysconfdir}/init.d/conntrackd
-    sed -i 's!/etc/!${sysconfdir}/!g' ${D}/${sysconfdir}/init.d/conntrack-failover ${D}/${sysconfdir}/init.d/conntrackd
-    sed -i 's!/var/!${localstatedir}/!g' ${D}/${sysconfdir}/init.d/conntrack-failover ${D}/${sysconfdir}/init.d/conntrackd ${D}/${sysconfdir}/conntrackd/conntrackd.conf.sample
-    sed -i 's!^export PATH=.*!export PATH=${base_sbindir}:${base_bindir}:${sbindir}:${bindir}!' ${D}/${sysconfdir}/init.d/conntrackd
+	install -d ${D}/${sysconfdir}/conntrackd
+	install -d ${D}/${sysconfdir}/init.d
+	install -m 0644 ${S}/doc/sync/ftfw/conntrackd.conf ${D}/${sysconfdir}/conntrackd/conntrackd.conf.sample
+	install -m 0755 ${WORKDIR}/conntrack-failover ${D}/${sysconfdir}/init.d/conntrack-failover
+	install -m 0755 ${WORKDIR}/init ${D}/${sysconfdir}/init.d/conntrackd
+
+	# Fix hardcoded paths in scripts
+	sed -i 's!/usr/sbin/!${sbindir}/!g' ${D}/${sysconfdir}/init.d/conntrack-failover ${D}/${sysconfdir}/init.d/conntrackd
+	sed -i 's!/etc/!${sysconfdir}/!g' ${D}/${sysconfdir}/init.d/conntrack-failover ${D}/${sysconfdir}/init.d/conntrackd
+	sed -i 's!/var/!${localstatedir}/!g' ${D}/${sysconfdir}/init.d/conntrack-failover ${D}/${sysconfdir}/init.d/conntrackd ${D}/${sysconfdir}/conntrackd/conntrackd.conf.sample
+	sed -i 's!^export PATH=.*!export PATH=${base_sbindir}:${base_bindir}:${sbindir}:${bindir}!' ${D}/${sysconfdir}/init.d/conntrackd
 }
 
 # fix error message: Do not forget that you need *root* or CAP_NET_ADMIN capabilities ;-)
 pkg_postinst:${PN} () {
-    setcap cap_net_admin+ep "$D/${sbindir}/conntrack"
+	setcap cap_net_admin+ep "$D/${sbindir}/conntrack"
 }
 PACKAGE_WRITE_DEPS += "libcap-native"
-- 
2.35.1


