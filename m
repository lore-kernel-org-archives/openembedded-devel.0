Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E034C433EF
	for <webhook@archiver.kernel.org>; Wed, 22 Dec 2021 14:51:33 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web09.20096.1640184691391231751
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Dec 2021 06:51:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=4o+1Z5cm;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.208.169, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f169.google.com with SMTP id p8so4199563ljo.5
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Dec 2021 06:51:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SFr2GWzRjjpwEtQf1MCsIdEyvRlKLMXZ2jJx3N9zVrU=;
        b=4o+1Z5cmafEGJ+0baTX577euiPMIZgQFpOt1onXWqxjj/cuTQXWalITMrJnUTSQXho
         PrDx6o3YUYrmLstUR2cethaS7GMR8zFDdUuVkBArmE6USj1wXnzIPSGlTvdLJyCLB+dz
         3Vj9Fws/pY4PEQqHW2TbjpMucCeFJSk3cOxP26EJ1YWvednirBkDhiro+kkd6CXAbfZ+
         Mv86+phCaXJxJbqTDxlgWw3lCP783hQhkoUiXzELoouBnRlu2jIIlnBe2XcnH4chuhK7
         KUSpcSGLW/3Be9PXIFBT62gj+iqwcoU4lNnDxHSCauKjRM+qNE7XKR/V7MmYb16E1A6G
         AtMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SFr2GWzRjjpwEtQf1MCsIdEyvRlKLMXZ2jJx3N9zVrU=;
        b=KVXjRtm/KKem85DclyvOlIGQR1N/OB02E63DI3iKSgs8jbKejalQYJNP7wHI0Q2UE/
         E7TRHlKbGaT3jwOK77lj2ISnZcQXK3fl1lUZkFGJEHiVvpM9QY047ipTwdVPLr/UUOac
         XQRzgSlKIu21ivGFFekibqpGlxRQ6+EMETNNZnf4ApjXNhC4YDSf+hywB9wRVHh1xRCc
         /g6TecCMp5KRE/KN8riLyUJx3dj/8F8UmeJg74WNFjd4ko5AdWUTgjZSM3P8CgONhe5L
         BBGQGFVnWzdMrB+Xa+roCdm0xtZ6VC3xydZBrm6BteSZ6waWpGJFhVO0y9h+h/uv0jeC
         s3SA==
X-Gm-Message-State: AOAM532MCHjs9Gpri6y5AEG4Zl9iv2WauR3Z8ZelTejQ3ZM718C6VTWp
	Gz2RDNmxLyXcEyANKy9KTmjePMkjStbxoIvM
X-Google-Smtp-Source: 
 ABdhPJw/Bi3hfUgHNUKm4/Hy1KJhCqy8I/m7uSodjRHuc70xMBRmpkL11PwP2mgWS5OynlzLEEA5WQ==
X-Received: by 2002:a2e:990:: with SMTP id 138mr2238374ljj.507.1640184688806;
        Wed, 22 Dec 2021 06:51:28 -0800 (PST)
Received: from localhost.localdomain
 (c-7918524e.023-160-67626725.bbcust.telenor.se. [78.82.24.121])
        by smtp.gmail.com with ESMTPSA id
 k5sm235099lfj.112.2021.12.22.06.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Dec 2021 06:51:28 -0800 (PST)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-networking][PATCH] xl2tpd: update to 1.3.16
Date: Wed, 22 Dec 2021 15:51:25 +0100
Message-Id: <20211222145125.2482096-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Dec 2021 14:51:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94484

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../xl2tpd/{xl2tpd_1.3.14.bb => xl2tpd_1.3.16.bb}             | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta-networking/recipes-protocols/xl2tpd/{xl2tpd_1.3.14.bb => xl2tpd_1.3.16.bb} (91%)

diff --git a/meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.14.bb b/meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.16.bb
similarity index 91%
rename from meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.14.bb
rename to meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.16.bb
index 21f97eba2..d96a28eac 100644
--- a/meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.14.bb
+++ b/meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.16.bb
@@ -9,7 +9,9 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/xelerance/xl2tpd.git;branch=master;protocol=https"
-SRCREV = "ba619c79c4790c78c033df0abde4a9a5de744a08"
+SRCREV = "1ef2a025981223c1e16fc833bef226c86ff8c295"
+
+UPSTREAM_CHECK_URI = "https://github.com/xelerance/xl2tpd/releases"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


