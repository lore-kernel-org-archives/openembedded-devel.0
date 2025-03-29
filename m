Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C76EC36008
	for <webhook@archiver.kernel.org>; Sat, 29 Mar 2025 05:54:14 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.5788.1743227646339925291
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Mar 2025 22:54:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QDGDR3hk;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2241053582dso24274805ad.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 28 Mar 2025 22:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743227645; x=1743832445; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gaMMHK3PTMOfu20k7+/WPyGUcUpdlmGH81kGWgs7syQ=;
        b=QDGDR3hkwk2mhTS0QUVbF/JbQbVsoJkvCjRCxZ+VvZXB3Y4BuY1MdALk1ZCLA6tCWe
         5Th33Ufa9Dmt9LVmPiszeXTFAJj5Tt/LXQm1VIP1UT3dyYtWmxbnXcUfsNi09MVQAI+3
         FYOJQ6XaW8jEJH2N/jphPBz7H5uiq5zkuAcnArbEy4AqRIpUs+x7i5e1YWiJVhbJO0jN
         X/yiwAOc7NZSJGYuie6piUSpQDpkB2ptyVz5YbJgN34e3QTU7NOrkaU2M6RXbFx1tWjP
         d+Rz/OWtebXvRnBqmWdDoHzAp+K7ZLvpO//NgZCbVueZ2h1XQa+R0AoQ6t3QvBwM/5KM
         d24A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743227645; x=1743832445;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gaMMHK3PTMOfu20k7+/WPyGUcUpdlmGH81kGWgs7syQ=;
        b=JzMNW7SC7DfWIpGgb/pJ6O6WgzqyEAvgIH354ffw8ZtqQRtNun3/A6Nk2sDZO30oae
         gs8mE3Pjx2i8tz0lWLrUrJ84XGmWq6mYUgmacfgVYPegdiPNkVLMeqyBbNcr6HvZRKXX
         gz4OQ4blko+QMHtt2210CBugp1wHqQ2RJ5nB9s9ViymwDibrqxhBaaEZzX5fGZF2gbaO
         VXzpbcyEfi2GA3da7XN/tYtnbNl6YkjF618mkF7D57QMK3yI1yG7b4XT0h3GZAxe0bg2
         ssapBbCrJ6ExFCyOwCI7PW2m2gGUgpAlQV8uos4VaWiQ1SPQJZ7wMk7kH5C9HEhFwJM9
         pMAw==
X-Gm-Message-State: AOJu0YwK79sTkdTgKZmvL5pHcfhW3CqtewTUAnipDtYI7fBSZrMgEID/
	f4ZOmmC9Qgq4bKMx7JUaxystvxWUPTJ7KNCfgyFJo/VOlRDAcETVb44UqxmH
X-Gm-Gg: ASbGnctcc2wbLtMXadrTjlV7pCdQRZCP3t5PNHrtjDajSCHwnbkku4g3gaL8kvo2mFA
	/n7u2EgFBwEGo81ySY7i3wKa7msnNLGRUFfPG9CVRj9m/qyhOr59KRvyM0Aq9Sv3pPFinNT/LjX
	omtfd9gpNgWz8TU+1jj4cr+z0k4Blcbme59yrCLGU0kSkmhl1dYzobM4NcQ2Ikf6j76XSJLcsJ0
	WbRKg/jhBWq4lI+zqrIyYeoGsPfk8CAJ4dVBdXYVdt1XuaeklT8QGaz7ank3tiDD3q2cttoE3ho
	vkJJ8s0d3Dx1E/ugFuzR7CCCQxGY1gm4PJ1k3eSsMrmY56E=
X-Google-Smtp-Source: AGHT+IEUBwESzM/ada/FzE2b+d3JRojwBbQFXLeTXfOHhanVPTK2ei4rrCkW5oMZM/fUk4896QKjQA==
X-Received: by 2002:a05:6a00:4f89:b0:736:2a73:6756 with SMTP id d2e1a72fcca58-7398044854dmr2216775b3a.21.1743227645236;
        Fri, 28 Mar 2025 22:54:05 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::f147])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7397106ba79sm2904967b3a.104.2025.03.28.22.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 22:54:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH] nftables: Fix build on musl when xtables enabled
Date: Fri, 28 Mar 2025 22:54:02 -0700
Message-ID: <20250329055402.4161631-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 29 Mar 2025 05:54:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116368

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-filter/nftables/nftables_1.1.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-filter/nftables/nftables_1.1.1.bb b/meta-networking/recipes-filter/nftables/nftables_1.1.1.bb
index 17709016be..f0f51f5397 100644
--- a/meta-networking/recipes-filter/nftables/nftables_1.1.1.bb
+++ b/meta-networking/recipes-filter/nftables/nftables_1.1.1.bb
@@ -33,6 +33,9 @@ EXTRA_OECONF = " \
 
 PEP517_SOURCE_PATH = "${S}/py"
 
+# xtables will need it on musl see iptables
+CFLAGS:append:libc-musl = " -D__UAPI_DEF_ETHHDR=0"
+
 inherit_defer ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python_setuptools_build_meta', '', d)}
 
 PACKAGES =+ "${@bb.utils.contains('PACKAGECONFIG', 'python', '${PN}-python', '', d)}"

