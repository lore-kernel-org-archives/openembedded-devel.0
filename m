Return-Path: <daiane.angolini@foundries.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CA69C4332F
	for <webhook@archiver.kernel.org>; Tue, 31 Oct 2023 20:33:54 +0000 (UTC)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
 by mx.groups.io with SMTP id smtpd.web10.6332.1698784425712750906
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 Oct 2023 13:33:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@foundries.io header.s=google header.b=e8tNUTnz;
 spf=pass (domain: foundries.io, ip: 209.85.217.52, mailfrom: daiane.angolini@foundries.io)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-45895225422so1790616137.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 31 Oct 2023 13:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google; t=1698784424; x=1699389224; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bvB616DfGb6uAAciwJmqwgfuHhmx/+cq++A4Qwel7xM=;
        b=e8tNUTnzs+Jio0J8Fy7b9oIuU7C7l7LCjpayoyuHr8FZm00khM9QRSxu3tjYAg+9Hj
         FtZq0n/3MnqtsUJbA3WJy03kPk0YEnNhGoAPemJcYWxlAMk70m/+aXzahmaWugCu1g3y
         DxvLYn9EJsLfx2zAqO4GXwKk5iWzUBXnhhoV+/vEXr0v+eImB1s7LIOI4T5ep9IQ9I6t
         pTb80B870ZDH2DGA2gF+KAVDzIhkA9+9b2fkdARuUfRWp+L1thZmIwbNU8d/NX44qQWm
         BMMFkKGUdbBPBUmE+xOFff2FaKoqF6fMaimkwUMyxVFmcAkhfPtKNF6CM1OwxBCLdYaw
         UQig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698784424; x=1699389224;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bvB616DfGb6uAAciwJmqwgfuHhmx/+cq++A4Qwel7xM=;
        b=DtOOr17bjsOy+q+DAjl0HvPdBQ2LZfEzrE7KHnhdaWzE4DVOk7FBZFYkZwrCTiZb7e
         KYb9wRXXNotcLVeFjRYS02sMtU2bRpnMndYuizYvFDLQ/TjVXtXjfH3kq9bq3VgiO2HB
         Qxx7EkLWZJCHsM74QoGmiQAFvzbgMybvpIZSwq48bZmVOzpo0HL6ln0zO9kj5yTLwJQY
         joo4QZ25/e9I3jXVf9LB+ESM45hUoU+p5SQ7YENKDY1NJHo1iYo/l3W76K1AZIhIwcjo
         hWbJjcirH+eR8FzfqKlXqCWLif43XgoAMasRprBja7TAKEn9vtgZir8UsYvfuV1XDqsU
         H2lw==
X-Gm-Message-State: AOJu0YwvFbnPPhPye5noh1KENQJsLLt1iGscl8X5b45S302WCUMQapYI
	vhAS1HQRmvKYoe1dh5eZi6FFomoZYnKnBDLueWc=
X-Google-Smtp-Source: AGHT+IEygR9MgJI6uClCHazypp+lPkqBizeKxujv+bSOrMML34Lr2z4pN9bLDLcW0FpEMFdCGNyFiw==
X-Received: by 2002:a67:c09d:0:b0:452:99e0:54e3 with SMTP id x29-20020a67c09d000000b0045299e054e3mr9736596vsi.2.1698784424516;
        Tue, 31 Oct 2023 13:33:44 -0700 (PDT)
Received: from nina.lan ([189.55.42.196])
        by smtp.gmail.com with ESMTPSA id e21-20020ac84b55000000b004108ce94882sm791198qts.83.2023.10.31.13.33.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Oct 2023 13:33:44 -0700 (PDT)
From: Daiane Angolini <daiane.angolini@foundries.io>
To: openembedded-devel@lists.openembedded.org
Cc: Daiane Angolini <daiane.angolini@foundries.io>
Subject: [meta-networking][PATCH] wireguard-tools: Use PACKAGECONFIG to select wg-quick and bashcompletion
Date: Tue, 31 Oct 2023 17:33:28 -0300
Message-Id: <20231031203328.3372015-1-daiane.angolini@foundries.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 31 Oct 2023 20:33:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105808

Condition the creation of sub-packages and their consequences to a
PACKAGECONFIG, which can be overriden outside the metalayer.

Signed-off-by: Daiane Angolini <daiane.angolini@foundries.io>
---
 .../wireguard/wireguard-tools_1.0.20210914.bb          | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20210914.bb b/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20210914.bb
index 20435338c..44b9eb2f7 100644
--- a/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20210914.bb
+++ b/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20210914.bb
@@ -11,11 +11,15 @@ do_install () {
     oe_runmake DESTDIR="${D}" PREFIX="${prefix}" SYSCONFDIR="${sysconfdir}" \
         SYSTEMDUNITDIR="${systemd_system_unitdir}" \
         WITH_SYSTEMDUNITS=${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'yes', '', d)} \
-        WITH_BASHCOMPLETION=yes \
-        WITH_WGQUICK=yes \
+        ${PACKAGECONFIG_ARGS} \
         install
 }
 
+PACKAGECONFIG ??= "bashcompletion wgquick"
+
+PACKAGECONFIG[bashcompletion] = "WITH_BASHCOMPLETION=yes, , , , , "
+PACKAGECONFIG[wgquick] = "WITH_WGQUICK=yes, , ,${PN} bash,${PN}-wg-quick, "
+
 PACKAGES += "${PN}-wg-quick"
 
 FILES:${PN} = " \
@@ -27,8 +31,6 @@ FILES:${PN}-wg-quick = " \
     ${systemd_system_unitdir} \
 "
 
-RDEPENDS:${PN}-wg-quick = "${PN} bash"
 RRECOMMENDS:${PN} = " \
     kernel-module-wireguard \
-    ${PN}-wg-quick \
     "
-- 
2.34.1


