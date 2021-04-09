Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
 by mx.groups.io with SMTP id smtpd.web10.3670.1617934860790254088
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 19:21:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qRrs0B/K;
 spf=pass (domain: gmail.com, ip: 209.85.167.180, mailfrom: akuster808@gmail.com)
Received: by mail-oi1-f180.google.com with SMTP id k25so4305400oic.4
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 19:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=4TxjYn736aOQV8IW8t5EZMhjCsqq0EJ/B2HyZxwcim0=;
        b=qRrs0B/K52yB1P+rD/uUfuMW2G2EUTZ1yRWD4Zz5zVKojyDbiYVORcYJbDr3Aoac7c
         cAAOcxrksULo5ONSGaTZUdOPXQ4sdG2ufDvSKMcVcO0ZBjxumg5HnRHNRI5aQW39YxpN
         jK8BNHcAyZX9mPoxqV+e19x9V9oFjJaCoGSvG8OcDZt7Y5oPaX5gCFJ4z/8xjTLoX034
         FA12lyEs+oBBHNu/RGB+Yo/YC/AQ9vaVxO5MbohAD82fYSQSqGj5o47OAqLvPxROmz3s
         vnAWl3lLgh71sruwasncLK2P5+ty3yUu1Dwja/lCGCljCZWCLHTYbo8mS+eX4kAXDKAE
         w8Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4TxjYn736aOQV8IW8t5EZMhjCsqq0EJ/B2HyZxwcim0=;
        b=RW6egW8S3Yx1jRFzfj7sGMrG0VFsxydP/4sVtPjsPd/jqYlqV3qX8+md5LzKyGoW6w
         lMvI24D1XLPNzdDWSON3BqWwyTUsr1JDgdBxsvoBNG1CQ5pWO8woDy1QodX+Nsa/owNp
         Vkn/tsUCxa/tHFNES8WEmeGw5wzBOxPvH/CDY8oA4MJu0HYh9XcOrDNTNUBEIqUVzS3t
         5vbtApGqcLA3dGv9IiAsCF5HI+BJALLxC2XsuyFwhAkN0fWj0tAHY3JsLPN+ociZXIsd
         1/QM27hlrnw4pHM6+OIJxP7HuuYHSnDfuC6pY2LLO2DvEjby/LbHfjtfhz2VlycUcahu
         mjlQ==
X-Gm-Message-State: AOAM532fubPLgMpnZPBJQ/C6Kuq3fX2TDcVyMOvrNAxsH1sGzKGK0PaY
	wVzMwAqcTXMs6rCxQ8D/6NDLbqr2tBg=
X-Google-Smtp-Source: ABdhPJyqZzDN3vjyvuADI871ViiRlV0Y8lBNS9LdzTEF4cidEf58y1hnzbIWkJgTeJd6XRk3aIMSnA==
X-Received: by 2002:aca:53cb:: with SMTP id h194mr8535575oib.175.1617934860069;
        Thu, 08 Apr 2021 19:21:00 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8533:6d3:7a8:8272])
        by smtp.gmail.com with ESMTPSA id k65sm299815otk.53.2021.04.08.19.20.59
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 19:20:59 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 07/36] networkmanager-openvpn: Fix packageing
Date: Thu,  8 Apr 2021 19:20:20 -0700
Message-Id: <da54fa14f51ef82ce923a8b95ff3f4e9c111327b.1617934043.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617934043.git.akuster808@gmail.com>
References: <cover.1617934043.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Andreas Müller <schnitzeltony@gmail.com>

Recent upgrade introduced:
| ERROR: networkmanager-openvpn-1.8.14-r0 do_package: QA Issue: networkmanager-openvpn: Files/directories were installed but not shipped in any package:
|  /usr/share/metainfo
|  /usr/share/metainfo/network-manager-openvpn.metainfo.xml

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit a23fa069d0a60cf348dcc6399f7990de59105c21)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../networkmanager/networkmanager-openvpn_1.8.14.bb              | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.8.14.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.8.14.bb
index a1a61bed1e3..1f76d8ab521 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.8.14.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.8.14.bb
@@ -38,6 +38,7 @@ USERADD_PARAM_${PN} = "--system nm-openvpn"
 
 FILES_${PN} += " \
     ${datadir}/dbus-1 \
+    ${datadir}/metainfo \
     ${libdir}/NetworkManager/*.so \
     ${nonarch_libdir}/NetworkManager/VPN/nm-openvpn-service.name \
 "
-- 
2.17.1

