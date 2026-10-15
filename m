Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84C5FCC6B39
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:44:49 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33264.1792043086129201362
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:44:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=VfVI7adA;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e8f2c3ad6bso20405345ad.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 22:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792043085; x=1792647885; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Y2GZ05SsQvVqj9UW6c9UqSdHRBrdcYCibIAz3PnqTEY=;
        b=VfVI7adAL0oVigTrd06/dLrWgHC2JEV1VR6fXzqPqucnGjW8rx0eOEJu/nxNkWMlM7
         1AUvYWTT1Koo1gosnyTuMqvApUkySeDigsb6uZoWA3jnhQwgkeKnUWEoPk4pBklMycpW
         bhnq6BlRel8ryb24YlzG2Gtbof1LvyxqswQFVv6NRxFbN4XsmrS3XaLBiPOWy3cbx5hC
         la3rl6+xtaAKcVTvNZnd5oFA2DdBys12be7iQ/kaEP/PjnQTb1bMROCW8PEQuWO4Idyl
         aHsKkPwZuiEqfV//fGEmywQunpKYJeBcXxTJ3EXcuxYely3GpSc7JxJUcdsdzztEyISS
         gkMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792043085; x=1792647885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Y2GZ05SsQvVqj9UW6c9UqSdHRBrdcYCibIAz3PnqTEY=;
        b=S0SmRaT4kuCQzw6MdlfmBVymCidFwXTNmc9jZayYhxgwjhORZTSrKBCIvtxwyQrAoi
         W9EjSc/uJpJ5fXqVsvHBi1sgCyUkNbZupTetRK+isHGtwh1tCr8G8kMDd4zaDO2YGWq/
         OnrfLGXsQrN3ROWY0kLBNyWMpRJZoOcuncZIVN/69TGdFT5FtPg+/yIcD6U8UiPnfmx4
         h/TURz9vJDU1TjdU/ubVC1OqIzBRFqLizSoouTCa2FDCQzZU08/qrbL1NNLG9ykv4Hpm
         EX9Q4IZx8D+62ddNvrpR0NtRIqI40JQVQ7T8WQZFj4pZ+saLgy9zflmGMFDNUQ1eYnhS
         UqMg==
X-Gm-Message-State: AFq9FYJ7VPSsDbEX495xYoPb8yo7lLx1sR1PRkwSqtCcC6SyPJhJFvrw
	OLkRB93oeQbQl6eGaEMpwCOwIWlDqttdxmyr5QZbFC8A67fUrc7itpe5y+BN2Q==
X-Gm-Gg: AYBFou0GvDgQ8Dty70MTrsMg+RWmPnpwUpXEH6C7cdxOmVyTGtjGWcrXtu5JCtC43/+
	vzFzpeQdudGKzaXnEm1HyNduVWS8HUMj2QScxN2R1NRumbmIlWTw6uxcIB9bxmYHZFSaFyd3uB1
	A+YPGS28/zE0ty2N+M7i8onkcKCqTFfouJrdVGXDAJoBSfsaCdOdG9yABwCGwXTER+ccO5bl7uI
	Dr7Q4xXjwnRO22b0IRbE6pz/BiIOuEgW4D++pscORoTfF1GVgb9dmkMCw6sheM4zL2J5pR8Bokw
	P+k1GqjxsCAWh7EISJOe8k8vV/wSGKcFQmpNSkm7N7QiOo+JUEx6mUjhlI+9ceBWgRVDhYd2GVl
	XhvrBnSSLJ5kqQGMcKzSzxBMfQQAIRTwnpgt0MK9rPEv5GoL04e7bHs/hUWsXLElDNj1blBlZ3P
	XcHoSGTM9UGpewRu8qc4qOih/N8GfAyDydRM/zAnJzB8gLgojkkH7DK1ILMomv3vevgUbUjNZZo
	SzsQX5JeX8PQUwRKqCP4Ew=
X-Received: by 2002:a17:902:ef4f:b0:2e5:c563:c0dc with SMTP id d9443c01a7336-2e842cdb0f8mr162741675ad.42.1792043085250;
        Wed, 14 Oct 2026 22:44:45 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e967875e58sm549125ad.36.2026.10.14.22.44.43
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:44:44 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 54/82] openvpn: patch CVE-2026-88964
Date: Thu, 15 Oct 2026 18:41:42 +1300
Message-ID: <7bd75dc53f49ca24e01ec11125c81481cc82175a.1791945956.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791945956.git.ankur.tyagi85@gmail.com>
References: <cover.1791945956.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 05:44:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130974

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

