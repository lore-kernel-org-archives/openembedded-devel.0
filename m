Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27881CC6B0F
	for <webhook@archiver.kernel.org>; Tue, 13 Oct 2026 09:59:25 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3508.1791885555607037877
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Oct 2026 02:59:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=kMNDBTG1;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3ab33730821so1524291a91.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 13 Oct 2026 02:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791885555; x=1792490355; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y2GZ05SsQvVqj9UW6c9UqSdHRBrdcYCibIAz3PnqTEY=;
        b=kMNDBTG1eQMEleh1f9ZDSU9qssr/Vomqt/ISirW3RwwYNpgpp7LAOO4uKGbJA4Uf1g
         wrQdlsgm+poc4TBKdOHhDqwGshMDpC+kUj8/SMol9jLPkKr/mcVCXguEzYT/XLJXo3jR
         9wt5ona5FDpRdx1Slb21ywDdzcLdvmUdXCt5SIGWQuF1s99zLcndokC3gwbv/ePJOgKT
         H0iS3qoGYLXLaB/s+6z4ZOm3ESEQhu16EL9SRFHG8gn/oQZqruI+u7siXYfSWDC2ntYN
         tGltnZSCHBYF98CWp3r88Gbt72qDsMQeVfaYWQiHrDPPnTqPugaTZHIIqrmx3xV0DY0a
         vN5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791885555; x=1792490355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y2GZ05SsQvVqj9UW6c9UqSdHRBrdcYCibIAz3PnqTEY=;
        b=rBiwMkQCPGhAb4PgBZMXkn406uoYFkxFmoaGz+HLOu+Rx9DVGeqhy2eBcRY2voOv3O
         brahrOlUNznzrVJL4rAuSKgMqlCtE2bS/8yjM11Ky2D34qkK4FCWQEUrPUmlPpj3XNj4
         7TRLPijXVHppiYa0P2PBUWbE6pqGARwk17gttk2RR/hQM7MDzQYAgtnBcL5UwPXaPPNB
         t3IAJQCmpGm67iES6sbCaE9ZQrdufNB10oGkJY5OOwNN7Ym8EMfTwPGyW4jwyoHT6Cmz
         UyGC9anh9Cpj0DGXTzn5R/PnTc4LXv57UQb4PXYdSwtF+wnR98ftWp9pmm3hnzH8eNxm
         a8EA==
X-Gm-Message-State: AFq9FYJQaMReT2Xan6qisoDB6AlikeruflIOAXb7xRY1DK5xPUZpGQUm
	xCoa/nB92CmEwjlPWveAGLpHBAFxYdfi/PWe6S1OUvXSl6uNTnNbpydRCW4jpA==
X-Gm-Gg: AYBFou25harBxf1OlrbxkHQq8At6snOYentLCJfRaEsGcwEZU3ggWSMweYPG3D65/en
	4PlRQMLEKylMznG3ISPax27hhrbjQR6xYWvtrwoJKONmXaygTWHBRQdUrnFUz1EUDlpvQbTISjx
	IFyhst+edI+2baipcCOzrASj8oyV7oxwPE4jQq5fJUVN2jv6cY41JydJAAhs5lv83gd61DkGBbh
	Rqex915FJb4jFU8bPgwUNW8Z1T+4TuYlyRFgb/6jQAdQxG/UewCtK35Dnfgy010rWn68wrXsCLt
	MWjY5UAb/iJPAIFPz+SNZ4A+asRffsIMxUCbdPGoGQ8vHkS9Za1GNAvc+aQzx+ngYxi5bNebf8f
	RW5rcm+h5KS2NR3TjFBemm0WRhbU1hzanp0bPzvcvyXt5NSnJxX81OdRFYh1MudU7k1K1vvDUF2
	XQQQROGkrRXfrfP5WEhkVZOhePO76CHZAWeWaw6J/Xl5Pd/ZY/ojFIryq1sqrAzLbIXZ6Bu37R8
	MSv4nUnNB+SjmNoA+IINQ/ZyoVGcU1LSwEfaKa4zw==
X-Received: by 2002:a17:90b:5444:b0:3a4:b74a:795c with SMTP id 98e67ed59e1d1-3ab3a60cec9mr9735830a91.16.1791885554919;
        Tue, 13 Oct 2026 02:59:14 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab37817414sm21282398a91.2.2026.10.13.02.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 02:59:13 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][blacksail][PATCH 2/28] openvpn: patch CVE-2026-88964
Date: Tue, 13 Oct 2026 22:58:37 +1300
Message-ID: <20261013095903.3544906-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013095903.3544906-1-ankur.tyagi85@gmail.com>
References: <20261013095903.3544906-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Oct 2026 09:59:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130835

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Backport commit identified by Debian[1], also mentioned in the release note
https://github.com/OpenVPN/openvpn/releases/tag/v2.7.8

[1]https://security-tracker.debian.org/tracker/CVE-2026-88964

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../openvpn/openvpn/CVE-2026-88964.patch      | 78 +++++++++++++++++++
 .../recipes-support/openvpn/openvpn_2.7.7.bb  |  1 +
 2 files changed, 79 insertions(+)
 create mode 100644 meta-networking/recipes-support/openvpn/openvpn/CVE-2026-88964.patch

diff --git a/meta-networking/recipes-support/openvpn/openvpn/CVE-2026-88964.patch b/meta-networking/recipes-support/openvpn/openvpn/CVE-2026-88964.patch
new file mode 100644
index 0000000000..a2b9b0ec8a
--- /dev/null
+++ b/meta-networking/recipes-support/openvpn/openvpn/CVE-2026-88964.patch
@@ -0,0 +1,78 @@
+From 22526848c6606698d6374c496f36009b9c6787ce Mon Sep 17 00:00:00 2001
+From: Cole Munz <Munzzyy1@proton.me>
+Date: Sun, 13 Sep 2026 15:23:17 +0200
+Subject: [PATCH] options: fix unsigned underflow when clearing
+ domain_search_list
+
+remove_option() and update_option() clear the domain search list with
+
+    while (o->domain_search_list_len-- > 0)
+
+domain_search_list_len is unsigned, and the post-decrement runs on the
+final test too. When the length reaches 0 the condition is false but
+the decrement has already wrapped it to UINT_MAX, so the field is left
+corrupted. The next reset then does
+
+    o->domain_search_list[UINT_MAX] = NULL
+
+and walks far out of bounds, writing NULL through each slot. A server
+can drive this reset path against a client with PUSH_UPDATE, so on
+Windows and Android this is a remotely reachable out-of-bounds write.
+
+v2:
+  Change to the semantics used for all the other lists there - set
+  length to 0 and clear the list with CLEAR().
+
+Change-Id: I3724236d4acc3d05d786274d6baf34a21c570594
+Signed-off-by: Cole Munz <Munzzyy1@proton.me>
+Acked-by: Razvan Cojocaru <razvanc@mailbox.org>
+Gerrit URL: https://gerrit.openvpn.net/c/openvpn/+/1914
+Github: OpenVPN/openvpn-private-issues#178
+CVE: 2026-88964
+Message-Id: <20260913132322.2283-1-gert@greenie.muc.de>
+URL: https://www.mail-archive.com/openvpn-devel@lists.sourceforge.net/msg39157.html
+Signed-off-by: Gert Doering <gert@greenie.muc.de>
+(cherry picked from commit aa12dd64b74142bbbff9f37cec05959ba115c06d)
+(cherry picked from commit d586f8ad9bfc582cc7984fcd482dc7cfacc940e2)
+
+CVE: CVE-2026-88964
+Upstream-Status: Backport [https://github.com/OpenVPN/openvpn/commit/d586f8ad9bfc582cc7984fcd482dc7cfacc940e2]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/openvpn/options.c | 14 ++++++--------
+ 1 file changed, 6 insertions(+), 8 deletions(-)
+
+diff --git a/src/openvpn/options.c b/src/openvpn/options.c
+index b7d035b6..847572c2 100644
+--- a/src/openvpn/options.c
++++ b/src/openvpn/options.c
+@@ -5220,12 +5220,12 @@ remove_option(struct context *c, struct options *options, char *p[], bool is_inl
+         memset(o->ntp, 0, sizeof(o->ntp));
+         o->nbdd_len = 0;
+         memset(o->nbdd, 0, sizeof(o->nbdd));
+-        while (o->domain_search_list_len-- > 0)
+-        {
+-            o->domain_search_list[o->domain_search_list_len] = NULL;
+-        }
++        o->domain_search_list_len = 0;
++        CLEAR(o->domain_search_list);
+         o->disable_nbt = 0;
+         o->dhcp_options = 0;
++        CLEAR(options->dns_options.from_dhcp);
++
+ #if defined(TARGET_ANDROID)
+         o->http_proxy_port = 0;
+         o->http_proxy = NULL;
+@@ -5524,10 +5524,8 @@ update_option(struct context *c, struct options *options, char *p[], bool is_inl
+             CLEAR(o->ntp);
+             o->nbdd_len = 0;
+             CLEAR(o->nbdd);
+-            while (o->domain_search_list_len-- > 0)
+-            {
+-                o->domain_search_list[o->domain_search_list_len] = NULL;
+-            }
++            o->domain_search_list_len = 0;
++            CLEAR(o->domain_search_list);
+             o->disable_nbt = 0;
+             o->dhcp_options = 0;
+ 
diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.7.7.bb b/meta-networking/recipes-support/openvpn/openvpn_2.7.7.bb
index 9bf699124c..6338a0c816 100644
--- a/meta-networking/recipes-support/openvpn/openvpn_2.7.7.bb
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.7.7.bb
@@ -11,6 +11,7 @@ SRC_URI = "https://github.com/OpenVPN/openvpn/releases/download/v${PV}/${BP}.tar
            file://0001-configure.ac-eliminate-build-path-from-openvpn-versi.patch \
            file://openvpn \
            file://run-ptest \
+           file://CVE-2026-88964.patch \
           "
 
 UPSTREAM_CHECK_URI = "https://openvpn.net/community-downloads"

