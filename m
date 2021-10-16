Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 647FAC433EF
	for <webhook@archiver.kernel.org>; Sat, 16 Oct 2021 12:28:39 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web09.10029.1634387317758182549
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 16 Oct 2021 05:28:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=U4ELL4WN;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.50, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f50.google.com with SMTP id y26so54119374lfa.11
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 16 Oct 2021 05:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ky5GwT2LoDy95BP842h+C3y5026wZar+unO0JB/KdQY=;
        b=U4ELL4WN96kb/KD9clByJ28fZdclYXx+36BiI3gJMFi9n5NtG7eDqkKXqwO/IPL4ND
         4ZdrMZKBPxbgw/vSbqToZyG98scNvVqRFSX/f3q8AR4mwSqi8NL06oBpYR0UHwKv9M/Q
         5H8We97ByTsEWTVr3OsURC+MyJBcPoYyQUMUmbzUG7lRfeJdhdPWdgLd/8owGCVzCF4V
         7ALjTKEDVipizKnDE05pju6pJIcKOpMh4GbAT6aL6xenRKWbX+OKpRyGmxQUealveHMw
         eZEjgtwqMTu9Dda4K+x0+UqCAk/MIWU+F4luU6kEXod38lFjG7Pw2Mv6AllnRo2hFR+2
         T8wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ky5GwT2LoDy95BP842h+C3y5026wZar+unO0JB/KdQY=;
        b=VjcsnAlcKBxzMrLrLXOV+bEqD14GwjFZLUk0yolqBsnrXKpyF6g3RPZ/doA1f/CfaW
         SfJ0IOdfcNw2cR73O9cqzEExP23Y9PPEfQE1wabCB7c/CBacN5+Vw5uufrjKH0YbpiA6
         22PxLgil09BlppP6lB77Rpx00SPZlcbmW7YIjRplPMIyv9zA/E1jrBTa47jh09Lcp1Lt
         D5r9DEgWX4SO06+rrYAhTbwprsUY0h+EOLh29c9yQ3kh2vqQ0qoDWDUdu2whVuQFieDT
         6bdhqi3dO8LwgLFIoZRPlUr2Vv1MrjMb0o+wcr0vcx0m8ihH+JK+voYq70diTCkSE7VE
         ikIQ==
X-Gm-Message-State: AOAM530OOLuwnoTpk45XG7L8lREcexDjX6M8obUnQZmeeeRWMLOEevzS
	XkUfddhhspU8cv5UbHV2t2/IoEfeb+7ipZ7z
X-Google-Smtp-Source: 
 ABdhPJxuSA2fa0+ffdAonfL8O8bGv+w8GBUChtbNRueeLVBB1oyfIEzr7YFpUzCb6kC3IKOPPTZq8Q==
X-Received: by 2002:ac2:4ec1:: with SMTP id p1mr4998513lfr.162.1634387315538;
        Sat, 16 Oct 2021 05:28:35 -0700 (PDT)
Received: from localhost.localdomain ([78.82.34.122])
        by smtp.gmail.com with ESMTPSA id
 b13sm835554lfs.93.2021.10.16.05.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Oct 2021 05:28:35 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-networking] networkmanager: update to 1.32.12
Date: Sat, 16 Oct 2021 14:28:31 +0200
Message-Id: <20211016122831.3564656-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 16 Oct 2021 12:28:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93393

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{networkmanager_1.32.10.bb => networkmanager_1.32.12.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/networkmanager/{networkmanager_1.32.10.bb => networkmanager_1.32.12.bb} (98%)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.32.10.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.32.12.bb
similarity index 98%
rename from meta-networking/recipes-connectivity/networkmanager/networkmanager_1.32.10.bb
rename to meta-networking/recipes-connectivity/networkmanager/networkmanager_1.32.12.bb
index 89f95548c..c45452f75 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.32.10.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.32.12.bb
@@ -27,7 +27,7 @@ SRC_URI = " \
     file://0002-Do-not-create-settings-settings-property-documentati.patch \
     file://0003-install-firewalld-to-var-libdir-rather-than-hardcod-.patch \
 "
-SRC_URI[sha256sum] = "3e5ccc66805659e3f11a718e3a599f9726b79a01d6ff14814be6ad8bc5da8bb8"
+SRC_URI[sha256sum] = "a8ab36a0a502fe73cd8e3bacb6585f97fbb94ebef79e276cdbaf11c33ff8f54b"
 
 S = "${WORKDIR}/NetworkManager-${PV}"
 
-- 
2.25.1


