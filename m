Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6BA2C433EF
	for <webhook@archiver.kernel.org>; Thu, 24 Feb 2022 08:02:23 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web08.7769.1645689742933631349
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Feb 2022 00:02:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IfCTINUL;
 spf=pass (domain: gmail.com, ip: 209.85.210.180,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d17so1223288pfl.0
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Feb 2022 00:02:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WwhW1lQJ6kwasHbphr7hHf9Jgd4VDclyukAgA+tOVr4=;
        b=IfCTINULAEQbc/MAPwRFTjhNCCn56MUu2IoT6kkpdZ0mdvU3MlWOp5U34gDf8x7Tue
         XyQ0Lv9vFx++h0TO8cSU9hzVJg8LEbNZbbANSvSgw56UBOCke0kS16rJzbnQliSAhrav
         vn88i88HaP3kYsf4GTMPDSR1RAxUyAsj59szQAyLluXeNim6TCwGeELmmtNMhL5oPIlc
         9lAqHAJPBYgJ+amb2Cc8hCyROtp+d1pOvwPa8Bn1FiAHfUWh+WbTr/30C+5lVTdY08aY
         yO6yvj69G/kwb88bZZvKNLLRoZOwsdh2Ko5ZCsGvDnNEG/mrN4LXjwdsjCMQ+6/4h9JQ
         qHgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WwhW1lQJ6kwasHbphr7hHf9Jgd4VDclyukAgA+tOVr4=;
        b=X/Ni4QMAWLoqugXv4+pzsSZLeo33znrCHga5AhkY0Kj0PgUoqsmvAXJewvPJfjqcjU
         4cGrMaDONqsWtCJTT5z537JKu2WYohDV6hub55t2OA9zrCXgYq66P7VdTwXYECw9ViQo
         Qo98up7zWsTRAkgDHCHSzoRZhA0q/jWxp/o1OUKXmOLLmkM+xM3f/amYADSQPAZXnTEH
         FRX19dzTzQRUWbvcl9AouL5b+6h1owp6WR4rZbddEkcTGh6L6ZBDx5Q6VMRTJDWDMy+S
         25sP1Dy8UBy1Q8kjhheyJI1L7q1XsIyDk7mbeu/PWx260T2ayfbbFDESmWpnTbC++5Mb
         jKlw==
X-Gm-Message-State: AOAM531uQlSzCn2N9AeiCr7tzUn1JWXaUMWZjSb5quzUzSUE1dJdCd5O
	iU4m9tolz9u1EOUYMfdMXVA93EP1z1ti3Q==
X-Google-Smtp-Source: 
 ABdhPJxDWoTGOfuI7Lfok5TpzknC0O8oQ4O3nB4GGQG5kLXKK7lOmJ/6u8t22GllgGHG6twCMLEzBw==
X-Received: by 2002:a63:5055:0:b0:372:f0e7:c034 with SMTP id
 q21-20020a635055000000b00372f0e7c034mr1397228pgl.4.1645689742065;
        Thu, 24 Feb 2022 00:02:22 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::fb6e])
        by smtp.gmail.com with ESMTPSA id
 ck20sm1879689pjb.27.2022.02.24.00.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 00:02:21 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 2/2] netplan: Add knob to enable tests
Date: Thu, 24 Feb 2022 00:02:19 -0800
Message-Id: <20220224080219.1354957-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220224080219.1354957-1-raj.khem@gmail.com>
References: <20220224080219.1354957-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Feb 2022 08:02:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95501

this puts python3-nose away from default requirements, nose dependency
should eventually be removed and perhaps converted to pytest

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-connectivity/netplan/netplan_0.104.bb           | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/netplan/netplan_0.104.bb b/meta-networking/recipes-connectivity/netplan/netplan_0.104.bb
index 6a32f55d47..e26649744c 100644
--- a/meta-networking/recipes-connectivity/netplan/netplan_0.104.bb
+++ b/meta-networking/recipes-connectivity/netplan/netplan_0.104.bb
@@ -22,7 +22,11 @@ SRC_URI:append:libc-musl = " file://0001-don-t-fail-if-GLOB_BRACE-is-not-defined
 
 DEPENDS = "glib-2.0 libyaml ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 
-RDEPENDS:${PN} = "python3 python3-core python3-pyyaml python3-netifaces python3-nose python3-coverage python3-pycodestyle python3-pyflakes util-linux-libuuid libnetplan"
+PACKAGECONFIG ?= ""
+
+PACKAGECONFIG[tests] = ",,,python3-nose python3-coverage python3-netifaces python3-pycodestyle python3-pyflakes python3-pyyaml"
+
+RDEPENDS:${PN} = "python3 python3-core python3-netifaces python3-pyyaml util-linux-libuuid libnetplan"
 
 inherit pkgconfig systemd
 
-- 
2.35.1


