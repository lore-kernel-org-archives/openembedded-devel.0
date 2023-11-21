Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F5E4C54FB9
	for <webhook@archiver.kernel.org>; Tue, 21 Nov 2023 04:04:17 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web11.27897.1700539455471737328
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Nov 2023 20:04:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Q7f1Lcq2;
 spf=pass (domain: mvista.com, ip: 209.85.215.179, mailfrom: vanusuri@mvista.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-5c2066accc5so2178786a12.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Nov 2023 20:04:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1700539454; x=1701144254; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZC6JXgnmK9EPvDcJtdjQQUnNX3+Y9oMGirEhLJNxFH8=;
        b=Q7f1Lcq2XlKF5uhHtPJl01iDmUiOeuf9jsoL4n9tt3CZDG9kd3ij3cl4wAodPC/CA7
         ghWdiIzCn87dt0uUFrvoaGQP3m3PojaNZfn24INLBfUyI2LdxI20yxBxjyIda5o8kdaj
         IlGckrlJwZiMcS4kJo1B+Ns6Fpzw7OAlCYFcI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700539454; x=1701144254;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZC6JXgnmK9EPvDcJtdjQQUnNX3+Y9oMGirEhLJNxFH8=;
        b=OZ50Y61YF0xOgWoSQUsiAFY4YqmzlaMC3jRmMEtQTXgup+S2QKs5yPJzzhW4AotpTY
         BL+dS6hlL/coQKSmoDDAir1PZMa05BHaEsUQZQ1rMqGlpegDlYyBGKjTXABfYeOf1hV5
         6E6wibfXNo4+YYwoH7VqiBsSmBIdC0qAvD0I3WkgALKhLYJPBCv71szJLonCL+3nYeTE
         EmBfrOXDAN/o9O8XUKrTxyQvviCHxcXj7u80B3sTNsn8SwYmEylPMaNcCER5pV5bULYL
         pvVBmJPzXo7IfT4rg97+4D/PtFGGAaSolJKRIuyYvKGhNtAtvytFs4AIMQ2n6CYoTlL2
         tibQ==
X-Gm-Message-State: AOJu0YyJLDC/56/V6VVdkAaIIG8v9TyY97nUq/PtIzNdE58CU/5vBj2R
	iIr6kyN2wb9iD9uGzVOskI938FbFpnd5JyLzEmpBeQ==
X-Google-Smtp-Source: AGHT+IHWHv2xBu/9c+f+3VwGKdrVVSW10UD2iUTan+wufgbtcvzXU3AGXGjrLX/Kn0ty9qW1WkvFRA==
X-Received: by 2002:a05:6a20:7da0:b0:187:e4a6:10a with SMTP id v32-20020a056a207da000b00187e4a6010amr8881936pzj.53.1700539454417;
        Mon, 20 Nov 2023 20:04:14 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:1cb0:ae01:9f87:1ef0:8606:6776])
        by smtp.gmail.com with ESMTPSA id o7-20020a170902d4c700b001cf59643714sm3624640plg.151.2023.11.20.20.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 20:04:14 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [oe][meta-networking][dunfell][PATCH] traceroute: upgrade 2.1.0 -> 2.1.3
Date: Tue, 21 Nov 2023 09:34:05 +0530
Message-Id: <20231121040405.25042-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Nov 2023 04:04:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106972

From: Vijay Anusuri <vanusuri@mvista.com>

This upgrade incorporates the CVE-2023-46316 fix and other bug fixes.

Changelog:
----------
- Interpret ipv4-mapped ipv6 addresses (::ffff:A.B.C.D) as true ipv4.
- Return back more robast poll(2) loop handling.
- Fix unprivileged ICMP tracerouting with Linux kernel >= 6.1 (Eric Dumazet, SF bug #14)
- Fix command line parsing in wrappers.

References:
https://security-tracker.debian.org/tracker/CVE-2023-46316
https://sourceforge.net/projects/traceroute/files/traceroute/traceroute-2.1.3/

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../traceroute/{traceroute_2.1.0.bb => traceroute_2.1.3.bb}    | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-networking/recipes-support/traceroute/{traceroute_2.1.0.bb => traceroute_2.1.3.bb} (92%)

diff --git a/meta-networking/recipes-support/traceroute/traceroute_2.1.0.bb b/meta-networking/recipes-support/traceroute/traceroute_2.1.3.bb
similarity index 92%
rename from meta-networking/recipes-support/traceroute/traceroute_2.1.0.bb
rename to meta-networking/recipes-support/traceroute/traceroute_2.1.3.bb
index 19bbf03f1..c1ad203bc 100644
--- a/meta-networking/recipes-support/traceroute/traceroute_2.1.0.bb
+++ b/meta-networking/recipes-support/traceroute/traceroute_2.1.3.bb
@@ -19,8 +19,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/traceroute/traceroute/${BP}/${BP}.tar.gz \
            file://filter-out-the-patches-from-subdirs.patch \
 "
 
-SRC_URI[md5sum] = "84d329d67abc3fb83fc8cb12aeaddaba"
-SRC_URI[sha256sum] = "3669d22a34d3f38ed50caba18cd525ba55c5c00d5465f2d20d7472e5d81603b6"
+SRC_URI[sha256sum] = "05ebc7aba28a9100f9bbae54ceecbf75c82ccf46bdfce8b5d64806459a7e0412"
 
 EXTRA_OEMAKE = "VPATH=${STAGING_LIBDIR}"
 
-- 
2.25.1


