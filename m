Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29A6AC433FE
	for <webhook@archiver.kernel.org>; Sat, 30 Oct 2021 11:16:06 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web08.17978.1635592565859187557
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Oct 2021 04:16:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=H2DQFvPl;
 spf=pass (domain: gmail.com, ip: 209.85.216.49,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id np13so8986891pjb.4
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Oct 2021 04:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=MKvt6lFgzfTwTMC1pwvrJMhWlkyIpXYe0yZo7R1o0PE=;
        b=H2DQFvPlXqrDpX8/gr31Fb/XBpfxveo+T4tkqN0utlKnh6eDQqxjnASeL3N6+sNTkD
         SVmKXBt/U8Mh+TZAP8r6lvSdQupM65YEVy98nYZml/Wk+pIEeorhQ3z9iZZ+gBf5NIPd
         rz5C9zwIFIFlV4oNsplLEJhuo4FOt1evwA8CLJC5mkJAZP59xcDhRuiZU4g9ttcfqQtI
         /PT7PoHGYGIKkAt9Da+HqGmOeLy/izOCL8D5TesDXZ8/AB+TkzTRQfpr+ROeAl00WrH2
         4ONW+ya1fDAemYInHnlBKi5P3PW302K3ZpeDP2D4t9BWyK0u/cIhgzrqoLzIqi0jV3r1
         dMnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MKvt6lFgzfTwTMC1pwvrJMhWlkyIpXYe0yZo7R1o0PE=;
        b=faE7tiGabMqmj/bcoujQLwdQlbq8wOM8UCgqDahts7p0onBO6ycH2491xd81GSypbM
         3YhdScfOhPxs2EMEJ9b1oxmQKIkw5N7eBQ44fcAscUo87IqjAx5DoQOxJ3tG1pnEHLYu
         3ktYvp+mW9U6VwyLS+RBYpuh9/93MsKTOLd7uxztiOmSEasLOuktZjq6ZyX3BRVGp2p6
         vtGB1m83H3EBbw9TP940iEIbdFlcWHuQrD3ZCW1NxbcK1hIiPc9IAm5HqCEWveJut4wV
         fQPhhukHywn9vt5TKWoTuEI9rX9IhXqKdpELnwMjWf92pNBxz4sBVXrNh/FfzAcNdYZG
         ZIPA==
X-Gm-Message-State: AOAM533qHsBc4EvGWfqYMGl1C7Kb/0JN5Qcl3Pz6i8Y/VUry/BCky2gP
	lFZsN2a30yxdkMltkuacFfscTrC+Hjs=
X-Google-Smtp-Source: 
 ABdhPJzxrzNGi2c5tJFiQpVsblJ7WsWiI3N63WB+FMypTPVMAv8grhviWhMRyXfQDZ/liEofUSFwmw==
X-Received: by 2002:a17:90a:c58f:: with SMTP id
 l15mr3540273pjt.168.1635592565223;
        Sat, 30 Oct 2021 04:16:05 -0700 (PDT)
Received: from keaua.hsd1.ca.comcast.net
 ([2601:202:4180:a5c0:7535:c5d2:16af:d4db])
        by smtp.gmail.com with ESMTPSA id
 w12sm13880162pjq.2.2021.10.30.04.16.04
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Oct 2021 04:16:04 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [honister 07/14] openvpn: upgrade 2.5.3 -> 2.5.4
Date: Sat, 30 Oct 2021 04:15:44 -0700
Message-Id: 
 <c61d6336c97147758359d84f271351cc67156ad2.1635592420.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1635592420.git.akuster808@gmail.com>
References: <cover.1635592420.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 Oct 2021 11:16:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93664

From: wangmy <wangmy@fujitsu.com>

2021.10.04 -- Version 2.5.4

Antonio Quartulli (3):
      route.c: pass the right parameter to IN6_IS_ADDR_UNSPECIFIED
      configure: search also for rst2{man, html}.py
      networking: add networking API net_addr_ll_set() and use it on Linux

Arne Schwabe (1):
      Move examples into openvpn-examples(5) man page

David Korczynski (1):
      Fix argv leaks in add_route() and add_route_ipv6()

David Sommerseth (2):
      doc: Use generic rules for man/html generation
      man: Clarify IV_HWADDR

Gert Doering (1):
      Add error reporting to get_console_input_win32().

Lev Stipakov (3):
      Fix console prompts with redirected log
      Add building man page on Windows
      GitHub Actions: remove Ubuntu 16.04 environment

Max Fillinger (1):
      Update Fox e-mail address in copyright notices

Selva Nair (1):
      Minor doc correction: tls-crypt-v2 key generation

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 1bcc09e8ff56c63da448862a852fd5ea17683acb)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../openvpn/{openvpn_2.5.3.bb => openvpn_2.5.4.bb}             | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-networking/recipes-support/openvpn/{openvpn_2.5.3.bb => openvpn_2.5.4.bb} (95%)

diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.5.3.bb b/meta-networking/recipes-support/openvpn/openvpn_2.5.4.bb
similarity index 95%
rename from meta-networking/recipes-support/openvpn/openvpn_2.5.3.bb
rename to meta-networking/recipes-support/openvpn/openvpn_2.5.4.bb
index a70e9708de..6b588a5f50 100644
--- a/meta-networking/recipes-support/openvpn/openvpn_2.5.3.bb
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.5.4.bb
@@ -14,8 +14,7 @@ SRC_URI = "http://swupdate.openvpn.org/community/releases/${BP}.tar.gz \
 
 UPSTREAM_CHECK_URI = "https://openvpn.net/community-downloads"
 
-SRC_URI[md5sum] = "08895fd1142f25fdd94a98315632e1bf"
-SRC_URI[sha256sum] = "75f0044df449430555ca7b995a2b77ab24f2946fdc3668301b8edc23986a5f7e"
+SRC_URI[sha256sum] = "f80f3c3df1b94a8892ae547df84f152583250684a24bd022ccc98ef56fa93d97"
 
 # CVE-2020-7224 and CVE-2020-27569 are for Aviatrix OpenVPN client, not for openvpn.
 CVE_CHECK_WHITELIST += "CVE-2020-7224 CVE-2020-27569"
-- 
2.25.1


