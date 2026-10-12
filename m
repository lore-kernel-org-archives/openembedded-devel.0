Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C54CCA9EBD
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 00:11:34 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3537.1791763888016717955
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Oct 2026 17:11:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=KttQJs/H;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so612410a91.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 11 Oct 2026 17:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791763887; x=1792368687; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NXyyvuUcu5QLDCsKxmVu1m7pp0gj/ECe/+J84LPSuKM=;
        b=KttQJs/H6qg6wQDxur0ph/Zjbgrzx1j0E4s40eFrw4aiii/KEnQsk9CPD1yRDnJRWb
         AkEdtKTyInoKDs3qAOIF8h5R0RS6l9n8OlAJ9art2gda5Wrm+O5IBemhESy9ElwwChtV
         Z+vLZALJp2XAP5xelaRIDUxK9nCDyo5kgGTImloMxqH5+6A2RX9lFKod+Se/NBGIjaOF
         VAje+PIYVHkLPyyg5eDbF7O2BhzmoIunijAm8EmAzDhWQWcY08QltwIKZllDuhVdcLHh
         qb7q1SzHNK/GgG5PqUgmn4Abowq0E9viEctUd0YXb2IzIzSJD5ocpOzuJl3QulpeCcwO
         UolA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791763887; x=1792368687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NXyyvuUcu5QLDCsKxmVu1m7pp0gj/ECe/+J84LPSuKM=;
        b=Nv6wyCF4G1rBqvF0fNRNwP4Jr9iDGS3OXed1wWqLy5uVASK1iiNRoOE+w3STrqcB39
         pfTg5vk9Xwpz6X30ywxrDEhRBnyXv8LVprHPeZ/mB5Dx2zBu0hXrsv0fbPNPTdlCIVL2
         dcW+Kb8PslNM65fKfTUhMOftAo8SiTTlxoF2VWdinDl3gzwgMxY73458sUk0enlpgEF0
         EPN20tKxGQ3NL5JsYtUuK4Yi91Y7kb20GSmQaNzRCmCCzSehT13o00gbYbxA+gkZ727V
         5TIhnYGL2DjBQkFPxAATn9+d0/KcPGB5EXen2YoeNvMScIjzhRHJQhuNHlIE+kNu6NE1
         QMtA==
X-Gm-Message-State: AFq9FYJOY8/27W67jm3RZcavAQYYzKr9Mqc/RFdU2otCE7PudBELt9Fh
	WAOszQBiPE1UpTA+AW2FVzyIxWrp8H79lVDA/m7rD9Wi9al4GJZ3jIw0uHJTEaiaeJ4=
X-Gm-Gg: AYBFou1oKCc4d5VVDNo0mzVvQv3ZoT0RX6KPd4TXwB+KlnhPttyNWIxFOEqBNhaRTkQ
	Sb2byiPN/Uj5rZRq5u+NvPW0NVboKQ+n8mqtLvgDmmSbZ90nQlTU1Wl9gfcI738fB16p52nrGCE
	aSA8S3PKOqbD2jPrml++FS6ml36YBsKLgv3MzeJ+ZNfH45dIrBSoQyb2Gjet8zo9EIgT6C7NpJe
	Kn24Agye3eAhDIsh6/FDAHIGKc4wS/JYLo3kI8xKghqgjRKhm7z3B0hqmbt/AFlGGNEFDR7raRZ
	9DPPDVLCKi9LkSgPWHA6GM7cOpQUn0RLFanmEh8a6llB9fhZ/2Bjw+9VlyEa+ddVg3cMD0+C71Y
	tvJ7WyG/u42eimdZoJ8UND1vu8mHUvtHW9PZqW3ZAtQRx0i+uYBcJ/9V1jyqKzh/aeePAA80+0H
	edYQxlwX1U5TrZToEYZ8NIfSFPAm4ddWvPo/dxvYQkvYAPwE6LL0hegijXVAoylRnValtr5qRoE
	vELREUZ87ULCiPOoWpohyUgSpNHEf+Ep6OpRCc=
X-Received: by 2002:a17:90a:d006:b0:3a8:6a04:80ef with SMTP id 98e67ed59e1d1-3ab3a2901c2mr5331955a91.6.1791763887332;
        Sun, 11 Oct 2026 17:11:27 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab3966dc7dsm7850379a91.2.2026.10.11.17.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 17:11:26 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Subject: [oe][meta-networking][PATCH 27/28] tinyproxy: patch CVE-2026-54387
Date: Mon, 12 Oct 2026 13:10:05 +1300
Message-ID: <20261012001007.2541673-27-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012001007.2541673-1-ankur.tyagi85@gmail.com>
References: <20261012001007.2541673-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 00:11:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130752

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Backport commit identified by Debian[1]

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-54387

[1]https://security-tracker.debian.org/tracker/CVE-2026-54387

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit 33649b065762429d18d1d9e9ec94deedb6edb63a)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../tinyproxy/tinyproxy/CVE-2026-54387.patch  | 37 +++++++++++++++++++
 .../tinyproxy/tinyproxy_1.11.3.bb             |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2026-54387.patch

diff --git a/meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2026-54387.patch b/meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2026-54387.patch
new file mode 100644
index 00000000000..c0199c1713c
--- /dev/null
+++ b/meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2026-54387.patch
@@ -0,0 +1,37 @@
+From a9602e492cedd5d5d18dd3675d9be90e9b0d9e66 Mon Sep 17 00:00:00 2001
+From: rofl0r <rofl0r@users.noreply.github.com>
+Date: Thu, 7 May 2026 16:33:11 +0000
+Subject: [PATCH] reqs: prevent request smuggling via both content-length and
+ chunked
+
+addressing point 1 of #609
+
+(cherry picked from commit 623bfc093df009296f0b85d40bc677ef9d5c09bb)
+
+CVE: CVE-2026-54387
+Upstream-Status: Backport [https://github.com/tinyproxy/tinyproxy/commit/623bfc093df009296f0b85d40bc677ef9d5c09bb]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/reqs.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/src/reqs.c b/src/reqs.c
+index 8b68538..e3cfe76 100644
+--- a/src/reqs.c
++++ b/src/reqs.c
+@@ -942,8 +942,13 @@ process_client_headers (struct conn_s *connptr, pseudomap *hashofheaders)
+         connptr->content_length.client = get_content_length (hashofheaders);
+ 
+         /* Check whether client sends chunked data. */
+-        if (connptr->content_length.client == -1 && is_chunked_transfer (hashofheaders))
++        if (is_chunked_transfer (hashofheaders)) {
++                if (connptr->content_length.client != -1)
++                        /* request smuggling, see GH issue #609 */
++                        pseudomap_remove (hashofheaders, "content-length");
++
+                 connptr->content_length.client = -2;
++        }
+ 
+         /*
+          * See if there is a "Connection" header.  If so, we need to do a bit
diff --git a/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.3.bb b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.3.bb
index a0ef5fd62f9..e84aeae53cc 100644
--- a/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.3.bb
+++ b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.3.bb
@@ -10,6 +10,7 @@ SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.gz
            file://CVE-2026-3945-1.patch \
            file://CVE-2026-3945-2.patch \
            file://CVE-2026-31842.patch \
+           file://CVE-2026-54387.patch \
            "
 
 SRC_URI[sha256sum] = "9bcf46db1a2375ff3e3d27a41982f1efec4706cce8899ff9f33323a8218f7592"

