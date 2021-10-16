Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E14AC433F5
	for <webhook@archiver.kernel.org>; Sat, 16 Oct 2021 12:28:45 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web08.10170.1634387324275861176
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 16 Oct 2021 05:28:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=2wXBFelU;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.46, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f46.google.com with SMTP id y15so54045103lfk.7
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 16 Oct 2021 05:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HPX29lHcy0qfr0wdWDJ/mvkwlq6LNT+KA7cEn6UL1tA=;
        b=2wXBFelU/fhnocDoIByMLeBreVxW7uleHwWtEtmv1cl0jqtYO6LR2wo+Ds9wGXHamz
         0XoH0Di46Z0NDNKG7TKz8WBMhDQEQfNYJkQ5cmYLfT4tFerlxVh4wReEof37ewcPITyL
         g6wTwXyGW49RBjZOiz3vn9CpdAf6g1gPwKXY+3LTJxsluuvF8D3OzhkksV9LPJtgYXfa
         1psJjPQ0zHem4ll8UDv5e7dFRF5w0tsSq4zNNRHlR/syEp3rtSnPUm1oesobsvwgKH/h
         n//zhzYwjt8EgtakWMnPVK8Uvwdu2lnyMM0USRyIgKIvP7D76f+nLOuSDk472oceOTtd
         kppg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HPX29lHcy0qfr0wdWDJ/mvkwlq6LNT+KA7cEn6UL1tA=;
        b=DVj361ac+p0tDGN92QAVSUaWpNRa9evgSe4AynM8IxP2zU/jXCk5bSs0YHFTx85U6L
         OMPriJVJ26VgV6x3aQlZY8sgqyP0E61JcZfl2s5AX7sy/5q2TWRimd12lrnnVj1J7hoT
         cSIk4TAownIi6xV94mbeLbMQlasZjRDNZNiNmEBFOtPCfVroDt68vsgsvLn4BpnOlw70
         vGJUt4uFchk9gRD3TijJOcP4EIVTJSjpO/ibLmuxd18yOclszGDdNWa8rRKmCiyE8R9m
         R/jIIzTcUwtXJ/kemQx0tUUm+uccgETdW7yicacy2eOFpYie+e00qVps7JsE/vBZ6yCL
         t4xg==
X-Gm-Message-State: AOAM530FjMJyddESsvC3QcvfxFakqyc9/OiHEmwVu1sqQo/VSkG+zBpn
	UmIoRqiehr9GsW3d6bDUQEC3CutpDEAgm1+U
X-Google-Smtp-Source: 
 ABdhPJxjk3krc0f+8j1tHRk/Bw3X9zOPxTb/UGkDqXxt+/61DH/aXn9R47dTB8q4sgolyt1QLWaq0Q==
X-Received: by 2002:a05:6512:3d16:: with SMTP id
 d22mr17180944lfv.20.1634387322074;
        Sat, 16 Oct 2021 05:28:42 -0700 (PDT)
Received: from localhost.localdomain ([78.82.34.122])
        by smtp.gmail.com with ESMTPSA id
 s3sm833036lfs.175.2021.10.16.05.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Oct 2021 05:28:41 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-networking] networkmanager-openvpn: update to 1.8.16
Date: Sat, 16 Oct 2021 14:28:37 +0200
Message-Id: <20211016122837.3564768-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 16 Oct 2021 12:28:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93394

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...ager-openvpn_1.8.14.bb => networkmanager-openvpn_1.8.16.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/networkmanager/{networkmanager-openvpn_1.8.14.bb => networkmanager-openvpn_1.8.16.bb} (91%)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.8.14.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.8.16.bb
similarity index 91%
rename from meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.8.14.bb
rename to meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.8.16.bb
index 9f3054a7c..19cac1345 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.8.14.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.8.16.bb
@@ -10,8 +10,7 @@ inherit gnomebase useradd gettext systemd
 
 SRC_URI = "${GNOME_MIRROR}/NetworkManager-openvpn/${@gnome_verdir("${PV}")}/NetworkManager-openvpn-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "bef67eca77bee68da703609b92f804a0"
-SRC_URI[sha256sum] = "e7419053fc3b5a7e25f1a7517c313ad4531b6ea280255524ebb85a70c76fdbeb"
+SRC_URI[sha256sum] = "8920de09c7ae5f1f520c83f844455db8faec31427350268fe2dd95b860f91fb5"
 
 S = "${WORKDIR}/NetworkManager-openvpn-${PV}"
 
-- 
2.25.1


