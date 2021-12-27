Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7CEDC4332F
	for <webhook@archiver.kernel.org>; Mon, 27 Dec 2021 02:50:30 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web12.22577.1640573430206783824
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Dec 2021 18:50:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IhmMRJIN;
 spf=pass (domain: gmail.com, ip: 209.85.216.53,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id gj24so12407571pjb.0
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Dec 2021 18:50:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=VObMv5uj1koyhupb/VbSUs83ojzEpQfMYLytwlJNhE0=;
        b=IhmMRJINxXsWUgm9rg5YAsYcak+ZmuZeYvw2s92ux8KT8l7aJWZIz2nsvF21/Qyf+v
         h3IiTYA+UwoPrgz0Tperhk6MWMiaw8xxTrIbyq0tiiO0pTRQug81v3c0LDns2HKrDAPI
         fOAInu+mD5uNaGsZ1zmHnKbV/UW8b1gbE4lTfDabUigP5tYIgKe3Ff0+cKV2+ojU204f
         124/HBJ4H34KbBeInRVpEeW3wRS1ivZiz4ra6YFyyQh6JQBIkyrAng98VYh5A2dcnj7A
         HoOfe5Hf8lNWRte5BXGKmDvvZaU9IcKFLumposRNPjaRca4sH9SnU7Z1Ghb5uD6YJIki
         tsAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VObMv5uj1koyhupb/VbSUs83ojzEpQfMYLytwlJNhE0=;
        b=aFQ7oJnBAiPzZfJQfs4dGETVlKltl87QKYp4iDWozPFl0xYjJvlQRwH/gR0aOKIMxM
         71LFxEfNoTXHKOwajksU5Nj1leTJ9Pmqfbp6Y3CmXo6nj0j+qvA7EovKntQqfHW7loYo
         X2YGM1ROwhGDAzFlwT5NwqKuHjUg6i7/Xto7X7fJ4S5xgzVg3L+Pb3417nZ+V9yOjFft
         5Usy900iAiKDiwXYXzg6m/aISBRCuWP2T7p3TYZjmiBcDuX0zHenTanhigIckYyA3M+1
         49SNnQJmediBDUml640l1zWO0CKgk47Lo9h8wkXK2nKKb9hvj+Nwi7edGEyEQJZL3XaZ
         x5KA==
X-Gm-Message-State: AOAM532QiBf9ov/RP8tX4Oi/5Li0Z4oKqgalUyku0pXVvsoJCwFltJ5r
	KPzkECjX7xVlh9hwTeDnpR2KcK35HTs=
X-Google-Smtp-Source: 
 ABdhPJy71HZfJMgbIfw0GJoP4HzYz0X7JSlT8hn8fp9CD29cwGyPo5vsOt5733Jwm0X1/e0kfQY4aQ==
X-Received: by 2002:a17:902:c7cc:b0:148:b8ab:cee3 with SMTP id
 r12-20020a170902c7cc00b00148b8abcee3mr15910292pla.126.1640573429557;
        Sun, 26 Dec 2021 18:50:29 -0800 (PST)
Received: from keaua.hsd1.ca.comcast.net
 ([2601:202:4180:a5c0:9a12:d2b4:2175:e337])
        by smtp.gmail.com with ESMTPSA id
 e29sm12744268pge.17.2021.12.26.18.50.28
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Dec 2021 18:50:29 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 4/4] strongswan: remove redundant DEPENDS
Date: Sun, 26 Dec 2021 18:50:25 -0800
Message-Id: <20211227025025.1211176-4-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211227025025.1211176-1-akuster808@gmail.com>
References: <20211227025025.1211176-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Dec 2021 02:50:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94503

drop openssl and gmp from DEPENDS, covered in PACKAGECONFIG

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-support/strongswan/strongswan_5.9.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.9.4.bb b/meta-networking/recipes-support/strongswan/strongswan_5.9.4.bb
index 6bdd5e3ab..a311dc47f 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_5.9.4.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_5.9.4.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "http://www.strongswan.org"
 SECTION = "net"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-DEPENDS = "gmp openssl flex-native flex bison-native"
+DEPENDS = "flex-native flex bison-native"
 DEPENDS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'tpm2', '  tpm2-tss', '', d)}"
 
 SRC_URI = "http://download.strongswan.org/strongswan-${PV}.tar.bz2 \
-- 
2.25.1


