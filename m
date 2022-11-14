Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31281C4332F
	for <webhook@archiver.kernel.org>; Mon, 14 Nov 2022 21:26:18 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web12.898.1668461169476985244
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Nov 2022 13:26:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=N7chdWKk;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id t4so8397401wmj.5
        for <openembedded-devel@lists.openembedded.org>; Mon, 14 Nov 2022 13:26:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wMGXKYZdB7tyk9ZaU2dARORPS0zv67+5o9ZawXqyk3s=;
        b=N7chdWKkHY8P8jj+OHCM2AjyhkNNf0sjTHc7GF13tIgwtXOMoRLz+diTOF1PzdaxCm
         jLNtfhe5WoyvV2Q2DZT9810KjlSkePLjPfqZ6tK2KQIHd1HmcdyeVdP5UYn4kb+7Z9Nt
         2kq75UgpdcpjPNaIJq1+9IA1vZPBdrUQl4lHEu6/mbbOBp0ed3cildQhxO8w6K1oE6OV
         83Y0MnNIMfmsSX51ucSE16PwtqacNGQZtwq39ACZJ/C2Tt4wHO0bgZskT9+ImsEaYSsz
         Zv6VrJF1pFGbushnYSRpWs0DkSpbyySnS7Xt8nxi0zYorX7vH8u/HjOy9jWzkbm4hyhP
         ff8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wMGXKYZdB7tyk9ZaU2dARORPS0zv67+5o9ZawXqyk3s=;
        b=v50YBXS0f33liymGBxcyp/zPf9zyuFZDhMkQslowH/YPmyLm+F91L5LwsLQify/4+H
         omxS5bp706u0+L3hanA9HVPrK9OikVjPcOPnohJ2tNejlcr2BDmk6I9I2Rm3+LVA+qVD
         cYklsSA+yzEpQu8bXw7hqKsjjoHgRCYCYZiAdc/zj2HDLwF6TBJs4PNlNBEQUzx/UhM8
         gnbXBnu7zw2zOkppzW1XJOgVb/Eq/H9FG3CMh+uS6FmiNJ4DQBbTvW6M6WcRmHl+0Tr5
         tuD5VgwKZME+FQtAXUv5wu9WZFrk7WhCuYTVWE3+x/8eE9And06+0Z1NSSO/sZvAY8DQ
         fX7Q==
X-Gm-Message-State: ANoB5pn+4fTJOIjm/zDZSCeMpnUSjCc0OOfjPAfFJAkH4sGaRnW3iSEI
	3Yff5QqZmmC0w3bwUj4YZOHQWme9s0U=
X-Google-Smtp-Source: AA0mqf4Q6hs09VW0yL3GEVySPqoYnuHKcxtHbY0h9a+Bm1tHzO8yL/QmMGDTppYf/np1rQOql9hxmA==
X-Received: by 2002:a05:600c:350c:b0:3c6:c013:9345 with SMTP id h12-20020a05600c350c00b003c6c0139345mr9297209wmq.172.1668461167838;
        Mon, 14 Nov 2022 13:26:07 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id q10-20020adff94a000000b0022cc6b8df5esm10489640wrr.7.2022.11.14.13.26.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 13:26:07 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH] nss: fix SRC_URI
Date: Mon, 14 Nov 2022 22:26:04 +0100
Message-Id: <20221114212604.3149068-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Nov 2022 21:26:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99588

* http://ftp.mozilla.org/pub/mozilla.org now returns 404, but the SRC_URI still works without
  "mozilla.org" directory

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/nss/nss_3.74.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/nss/nss_3.74.bb b/meta-oe/recipes-support/nss/nss_3.74.bb
index 333bbdfef0..591b12a917 100644
--- a/meta-oe/recipes-support/nss/nss_3.74.bb
+++ b/meta-oe/recipes-support/nss/nss_3.74.bb
@@ -20,7 +20,7 @@ LIC_FILES_CHKSUM = "file://nss/COPYING;md5=3b1e88e1b9c0b5a4b2881d46cce06a18 \
 
 VERSION_DIR = "${@d.getVar('BP').upper().replace('-', '_').replace('.', '_') + '_RTM'}"
 
-SRC_URI = "http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/${VERSION_DIR}/src/${BP}.tar.gz \
+SRC_URI = "http://ftp.mozilla.org/pub/security/nss/releases/${VERSION_DIR}/src/${BP}.tar.gz \
            file://nss.pc.in \
            file://0001-nss-fix-support-cross-compiling.patch \
            file://nss-no-rpath-for-cross-compiling.patch \
-- 
2.38.1


