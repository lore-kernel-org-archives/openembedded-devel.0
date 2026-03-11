Return-Path: <sujeetnayak1976@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C8FC1062895
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 12:45:44 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20542.1773233141255812083
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Mar 2026 05:45:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PZTXiwzC;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: sujeetnayak1976@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-829afe24fb5so3370194b3a.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Mar 2026 05:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773233140; x=1773837940; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Mhh0yC0g6DKBNF8ndnOQxt0qrjuQcwN6LODZYyiKHhA=;
        b=PZTXiwzC134sdGrU6vE4+ll/+oAU3s8aodzLwgXPlYZFTeIbpHbEBhc8MV2j6bNZqD
         EYohbdoMOHy5WrEa7tgg3ADBqFvkkiAHijOr/Y2wCv2DNAJQKTUYU9QbnJ9XKG8YJzv2
         5GQGo2+UOHiBrVN5a5HR0OU2ovnFsHmHRCxk+iR3O+wFqOfHC80qppJEP8fzNpGKMlPr
         ASw1BRPLI5aVLJkyQ8ZdJ3l2yjGfqO7rQ3zG9XHQyvwSnCoZb6qcryRhijh4brWU5R1x
         vEdrDOCfP40YRdp2uEJZfwPOxUbKDdbfCiBRNSgouOdkjdhKhvMVBnipQg9SvaEcM3bO
         nFVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773233140; x=1773837940;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mhh0yC0g6DKBNF8ndnOQxt0qrjuQcwN6LODZYyiKHhA=;
        b=o536kW+0BkH50IAHICMB8DmDuCY7VW8FKnqBpohMjL7n3NxTAssWcqDvGNytGCL85k
         J/f6DdwRK7TFWYY2rVD/+msrViAzy1qohGFDSKO4wejp8mb/f6oRLzWAXhAFRr5A2av3
         QZZ+WOCEZZxBZjcWfdUcPzmtnBMP479q0G8KIRlxdhYlC8wbyhIASAsXOjhhkbU2e7MP
         lVn/AOS8eco2ukhoCzN+fPtWc5svj+rLX1LWTspyyePdMibxKUlJR2o2Osd+CMG2WiCl
         srw02jkyMuuggqWiaJhwdAk3of5tcbToKGaEB913o8P0Z6DqPW+68Qk0syTvjFEtmUNt
         d9Bg==
X-Gm-Message-State: AOJu0YwONgE7yMqUGDZq381ERqfwRlbNMIhPBkzybOliWX8MT6cs/NxX
	56etX+Np7EGN/oAxPyYNF2ujXqFTvBo/V9JTsxwZ5srncbB/q2nQGD89vVhSKWAD
X-Gm-Gg: ATEYQzwsX5Eltu+Uec/yi48MTT36fiMyNHrr1sHL5mfvyG6UrPxtp+dWbORUG/3y3q7
	XTwV6vHiJC5Jr1+lBP2HzB55p0+8q1ZE/E2MA5HZyvxAke8+f1MIE0gJOiZmUb5Rxif12H9fSAP
	rZrCJKHrr7gdGFKQ0A3VR1fLdfl6Ezcpvr96DmZwwNxyrj2puww4eORzvu98hPS59lHd36YkFdO
	nhS2YeCmPKA2rmgr1p1d7jTcgZYjU+KggtuHXe/Y4bDkyNvz+gfa/WhXoL6x8QkP0s0Wx4ol4y6
	6ne4quDPvCRJZluvDb3KTsLfpYUUdUiiLgVgf+1l/F+0ammA4372kbtLij2UQKoiDKXPbXdvDoN
	Dhv0oGcjVhpTlX8salRZtcQWeqXHcpTAB5HUfeHy30YBbCo2a/0+3orTPKTPy73L0LsVWNdiQpV
	hqPyr77fxpVMrHKPfC7ND+sANYGcM+k8zgAeqizVs=
X-Received: by 2002:a05:6a00:4092:b0:81f:5037:a318 with SMTP id d2e1a72fcca58-829f6ec1965mr2437996b3a.21.1773233140262;
        Wed, 11 Mar 2026 05:45:40 -0700 (PDT)
Received: from si-sujeet-n.LGE.NET ([2409:40f2:12:c0fb:29a9:7e7:413e:3c3e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6f26dbasm2413898b3a.43.2026.03.11.05.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 05:45:39 -0700 (PDT)
From: sujeetnayak1976@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Sujeet Nayak <sujeetnayak1976@gmail.com>
Subject: [meta-oe][scarthgap][PATCH] libnice: make crypto library configurable via PACKAGECONFIG
Date: Wed, 11 Mar 2026 23:45:20 +1100
Message-ID: <20260311124520.19221-1-sujeetnayak1976@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Mar 2026 12:45:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125086

From: Sujeet Nayak <sujeetnayak1976@gmail.com>

Move gnutls from a hard dependency to a PACKAGECONFIG option,
defaulting to gnutls. This allows users to select openssl as an
alternative crypto library by setting PACKAGECONFIG.

Signed-off-by: Sujeet Nayak <sujeetnayak1976@gmail.com>
---
 meta-oe/recipes-support/libnice/libnice_0.1.22.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libnice/libnice_0.1.22.bb b/meta-oe/recipes-support/libnice/libnice_0.1.22.bb
index 175e10fdf6..5c5436dd8d 100644
--- a/meta-oe/recipes-support/libnice/libnice_0.1.22.bb
+++ b/meta-oe/recipes-support/libnice/libnice_0.1.22.bb
@@ -11,7 +11,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=9c42325015702feda4f4d2f19a55b767 \
 SRC_URI = "http://nice.freedesktop.org/releases/${BP}.tar.gz"
 SRC_URI[sha256sum] = "a5f724cf09eae50c41a7517141d89da4a61ec9eaca32da4a0073faed5417ad7e"
 
-DEPENDS = "glib-2.0 gnutls ${@bb.utils.contains('DISTRO_FEATURES', 'api-documentation', 'graphviz-native', '', d)}"
+DEPENDS = "glib-2.0 ${@bb.utils.contains('DISTRO_FEATURES', 'api-documentation', 'graphviz-native', '', d)}"
+
+PACKAGECONFIG ??= "gnutls"
+PACKAGECONFIG[gnutls] = "-Dcrypto-library=gnutls,,gnutls"
+PACKAGECONFIG[openssl] = "-Dcrypto-library=openssl,,openssl"
 
 PACKAGECONFIG[gupnp] = "-Dgupnp=enabled,-Dgupnp=disabled,gupnp"
 PACKAGECONFIG[gstreamer] = "-Dgstreamer=enabled,-Dgstreamer=disabled,gstreamer1.0"

