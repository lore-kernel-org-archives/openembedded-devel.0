Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB982C79F99
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 10:23:48 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31686.1788776621997309922
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Sep 2026 03:23:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=fjAsyMHU;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cc2276e6daeso2329088a12.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Sep 2026 03:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788776621; x=1789381421; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bHQWEHzxAd/TDBXMxVPKwY5nCkfP6pqlaOGgP+LVR18=;
        b=fjAsyMHUVc5G9pI1lMxDvpqXC7DozhP4SCPtKnE66tcwydgVoELdIMZUb/J85H97qH
         9DOTNts97VwiRCb+vJ0kn1WJd5aAGkXjfmAMy9100gcl8zRROaaZZGQARcplpmQSqltN
         7YEmRbK87ZAcMoT9hPz/jvr/iGvQ6kLbmUVHV0l6Cik3CLEa7mu6gxtoUpQ8LoY7FU8N
         zDje3YaCdy72LWMtiRuLzIimo5ok0Ye2L70l+ZZvbKnD+T8Q4UQvP3caWT7EUMJzfAUN
         n3IKCfooILy40XNcu2AkEdy5+c0iDtACuDyft/wb75TwBXsx7G9zjtq+1zUgRgnf2djW
         34OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788776621; x=1789381421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bHQWEHzxAd/TDBXMxVPKwY5nCkfP6pqlaOGgP+LVR18=;
        b=PdhIvSwf7xl1MogFo26Q2xHsJ+k7gAMlZqkLl+CUBv0eapoylj4+wIZc3gnn4ebpSn
         GvtSFOxeDl+PRkau1l6nZDtalFrva7s1m1ur+Z+LQVmg+EGTzTUf5723LRtxYgXnpH+V
         pZSEPYC69Dsbi1JTAYWLTIFg1yWAgVLqKjTrRMcTYVMtix2TKfzF5Grrt142STW+V2t8
         RZjWgj5MEcntU0yFHpeEzrWkHDOYNPFrFW5YJ6uSWevkxXKOfZBIGuYwzbnkRjZfM57x
         5ugFkuIbu5+55zwSM/+tYwaFb/0S3MvELDZbGzyVOm+o/S67lfD9g2DCOUznsCe4m5Td
         jHjA==
X-Gm-Message-State: AFuF++nIS6Nt9f0VYqsoyKDRvQj+iHnalTfiuya9NEc5XJB6Y7kvO913
	KGgCoFv3fgc4Lq+OXnF5Jq65X6CXuq9HcuutjCiBvIUjgd9XXqp616vWkMi222fh
X-Gm-Gg: AYBFou3vHOwlgUpddgNcIlCPuCpGZZ1DE5JgoILiqpe3E02CuaJIXlWcEJiLliwBQYK
	h7+tkBibIcmQ4S3Lp9ML8yJF7Dt/1gEWkVI0N+ZVlZUZ3hrP5ERzs03WnC8SEpKbTPgRZoVKOwq
	pnQkvGWg/IKEfn44Pv3UqHRXF2gKoY8VvD/HNbd84aHWH+cW/XD8B2QD4jwen2UatoFm64wV/0L
	bp4P9b7fz7lLohtwNJWqvqwcrWgaxYhAoLSYS2s5+xJ0p4ZMdJPZW48TSraGl2hLkilLyVwKWKS
	dczIEqxR1y6xXVVeFsqTYezUgAUlVer2wMRp0LrXZBqCkzSqpoavF3RcHFgFa7PdMxjb5gjUNOx
	OeQSvj9UI4RPk1DKzd2bBVb/64Er1KGFBKAMihYg/pxTtqwd6PtuW7fb9wrjx8giEQ18NDm0CoU
	7AExApxEYPq0PncZ+90pmdSnbGKjM+VKPwYHavk2qNiay5pCrs7KV5PFAFEpYnQeDfGEYk1OKo
X-Received: by 2002:a05:6a21:7a91:b0:3d0:e034:a26f with SMTP id adf61e73a8af0-3da3a0a6f2fmr38361768637.17.1788776621244;
        Mon, 07 Sep 2026 03:23:41 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432441f5f2sm30215104c88.15.2026.09.07.03.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 03:23:40 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][wrynose][PATCH 6/33] miniupnpd: patch CVE-2026-5720
Date: Mon,  7 Sep 2026 22:22:50 +1200
Message-ID: <20260907102318.2459883-6-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907102318.2459883-1-ankur.tyagi85@gmail.com>
References: <20260907102318.2459883-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Sep 2026 10:23:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129818

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-5720

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../miniupnpd/files/CVE-2026-5720.patch       | 35 +++++++++++++++++++
 .../miniupnpd/miniupnpd_2.1.20191006.bb       |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/miniupnpd/files/CVE-2026-5720.patch

diff --git a/meta-networking/recipes-connectivity/miniupnpd/files/CVE-2026-5720.patch b/meta-networking/recipes-connectivity/miniupnpd/files/CVE-2026-5720.patch
new file mode 100644
index 0000000000..902e8321a5
--- /dev/null
+++ b/meta-networking/recipes-connectivity/miniupnpd/files/CVE-2026-5720.patch
@@ -0,0 +1,35 @@
+From d1c82ab65fd685ceed28a1a0de29510df7c3c959 Mon Sep 17 00:00:00 2001
+From: Thomas Bernard <miniupnp@free.fr>
+Date: Mon, 23 Mar 2026 02:37:02 +0100
+Subject: [PATCH] upnphttp.c: fix removal of quotes in ParseHttpHeaders()
+
+the length of the string including the quotes must be at
+least 2 for the string to contain the 2 enclosing quotes !
+
+(cherry picked from commit f56bd09b2f2650126b832c5f30a65a09e28167fa)
+
+CVE: CVE-2026-5720
+Upstream-Status: Backport [https://github.com/miniupnp/miniupnp/commit/f56bd09b2f2650126b832c5f30a65a09e28167fa]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ upnphttp.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/upnphttp.c b/upnphttp.c
+index fc8ccb6..2d9a2a6 100644
+--- a/upnphttp.c
++++ b/upnphttp.c
+@@ -269,9 +269,10 @@ ParseHttpHeaders(struct upnphttp * h)
+ 					p++;
+ 				while(p[n]>=' ')
+ 					n++;
+-				if((p[0] == '"' && p[n-1] == '"')
+-				  || (p[0] == '\'' && p[n-1] == '\''))
++				if((n >= 2) && ((p[0] == '"' && p[n-1] == '"')
++				             || (p[0] == '\'' && p[n-1] == '\'')))
+ 				{
++					/* remove the quotes */
+ 					p++; n -= 2;
+ 				}
+ 				h->req_soapActionOff = p - h->req_buf;
diff --git a/meta-networking/recipes-connectivity/miniupnpd/miniupnpd_2.1.20191006.bb b/meta-networking/recipes-connectivity/miniupnpd/miniupnpd_2.1.20191006.bb
index b7ba37f290..0aadfe9cf6 100644
--- a/meta-networking/recipes-connectivity/miniupnpd/miniupnpd_2.1.20191006.bb
+++ b/meta-networking/recipes-connectivity/miniupnpd/miniupnpd_2.1.20191006.bb
@@ -14,6 +14,7 @@ DEPENDS += "iptables net-tools util-linux libmnl libnetfilter-conntrack openssl"
 SRC_URI = "http://miniupnp.tuxfamily.org/files/download.php?file=${BP}.tar.gz;downloadfilename=${BP}.tar.gz \
            file://miniupnpd.service \
            file://0001-Add-OpenEmbedded-cross-compile-case.patch \
+           file://CVE-2026-5720.patch \
            "
 SRC_URI[sha256sum] = "218fad7af31f3c22fb4c9db28a55a2a8b5067d41f5b38f52008a057a00d2206d"
 

