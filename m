Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29BB4C433EF
	for <webhook@archiver.kernel.org>; Sat, 30 Oct 2021 11:16:09 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web08.17979.1635592568476572847
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Oct 2021 04:16:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=acWS2jav;
 spf=pass (domain: gmail.com, ip: 209.85.215.176,
 mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id a9so1900514pgg.7
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Oct 2021 04:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=+koJX6rXOyf6I+YDo8k3g1afMMYlv7q+S6CpqYqa6Q4=;
        b=acWS2jav4dZL7uF+BXq3ZctopatFFJSZX6v+rboHGeZFpJF3fK/ileK6RqIFWKzdeD
         HShicAmvWDDwMIJYDewyG1v83RsIFqlL1afhCQdiqexywBj1fedhResiYcgr6+csBa8s
         OEocAFyunVfUP7PIBreLDG+e9z30ssnnnctWLgDhu3jwsr/4SAUmUc6eCImz2oRYcpYt
         G7nWIaj6TAQjlkfnTgdrtsbaio/rcMMSYCsZpDI/tXhtcf2Dz2CzMKvrG7gnsxXZbKJ0
         hXihA9QTxvmkntJ/lJQm08wivBmFJkYyxOORKjmgR2GWXAdoXeg5J30PmP/Sm7o5Sv5o
         C/ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+koJX6rXOyf6I+YDo8k3g1afMMYlv7q+S6CpqYqa6Q4=;
        b=kgrvtBj7ESIq3HOvaM2oTJgNlHvXpgQIkthRVcivlsKhdvjY5yRxMfoJeiOnLg4L6F
         YYJ6IzzxesHgk+E0oAVKzfX+mCtgSGpOJPYOXfjC63pDEfpwTkyuq7Maz/cD/cVvTXP0
         Dg3CRNFsRBl548ZUW0EXUZo5cXJTT9mc2R3RwNIsN0XBxZDe525tO2KtFVC5qK33c3et
         pXr7dxyk3gce892o+lQBNb2lnnf/4RQVhx79QSdfEzSGS5crLFJT/UGSifcUQbUEeb/L
         CrtjqULYH9tGpIQ5xSKz6593NSavIXFoelQryhq+M6idbXMy9ov22vIQUWuhGlSdZeGa
         Jz3A==
X-Gm-Message-State: AOAM533Ozcb8CJNUzcjEURCiuOd5sLe2ZiNc739MKzcSgpSBdvK/38Tr
	DJiww4HxJIrqtiNDBcrmlWQAqH5gVoM=
X-Google-Smtp-Source: 
 ABdhPJy5NiPE2cyXQysRd82SqeWuC95B0IRJdG5V4FsSLa4Ks0G/5PUmu3GU55HjXfhhKM91qxgjfg==
X-Received: by 2002:a62:f20e:0:b0:47b:f629:6b52 with SMTP id
 m14-20020a62f20e000000b0047bf6296b52mr16414347pfh.53.1635592567802;
        Sat, 30 Oct 2021 04:16:07 -0700 (PDT)
Received: from keaua.hsd1.ca.comcast.net
 ([2601:202:4180:a5c0:7535:c5d2:16af:d4db])
        by smtp.gmail.com with ESMTPSA id
 w12sm13880162pjq.2.2021.10.30.04.16.07
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Oct 2021 04:16:07 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [honister 10/14] networkmanager-openvpn: upgrade 1.8.14 -> 1.8.16
Date: Sat, 30 Oct 2021 04:15:47 -0700
Message-Id: 
 <733bc5257c6b067bb1e361b33e0099f0fa10eff9.1635592420.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1635592420.git.akuster808@gmail.com>
References: <cover.1635592420.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 Oct 2021 11:16:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93667

From: zangrc <zangrc.fnst@fujitsu.com>

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit fd0cd13f423d0278727b6b83f59729b90da36952)
[Bug fix only update]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...ager-openvpn_1.8.14.bb => networkmanager-openvpn_1.8.16.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/networkmanager/{networkmanager-openvpn_1.8.14.bb => networkmanager-openvpn_1.8.16.bb} (91%)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.8.14.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.8.16.bb
similarity index 91%
rename from meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.8.14.bb
rename to meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.8.16.bb
index 9f3054a7c2..19cac13458 100644
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


