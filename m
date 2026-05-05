Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAD3DFF885A
	for <webhook@archiver.kernel.org>; Tue,  5 May 2026 12:24:45 +0000 (UTC)
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37535.1777983879369801406
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 May 2026 05:24:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=I+mP9Iae;
 spf=pass (domain: mvista.com, ip: 74.125.82.171, mailfrom: hprajapati@mvista.com)
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2ef8d6ba48bso1989317eec.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 May 2026 05:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1777983878; x=1778588678; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6e0VX3Yi5emjlhDIS8/3I4fjD6nTwWusp3Oygtgqogo=;
        b=I+mP9Iaedgt78D2oUUhSkW3BiHf2xpcfBgjc64obGZpRwjnmOqOrWfCaIVQb7vKteo
         HRmUuTPw3Q6H3Mt5ctGWTUXYSAf/ntoTrRl+N82SXunypGqzyKQE2BKliCNbafP5v0BF
         5NPYXS1mjC9/tflEPoxnKUJWxkh8jo5G+VkF8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777983878; x=1778588678;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6e0VX3Yi5emjlhDIS8/3I4fjD6nTwWusp3Oygtgqogo=;
        b=Co1vhohV30Jv0ZzbWEnXu+xhsIsWcRSN9SAvxw3B0WRX6zRUsAz61ZBz8QlncegTNQ
         3QY69wCZf75tMK/R0Skk6ra3pJNT7z6wX5P1vl2v1wli6jANtUwz4QKgOWMnhnOmCMMi
         aAZnyYvmWC+1MZAZg812313PUTUBPONlF0BT31hwNeIbVmJIu+awmAq+Dh2b4a/XEhGG
         h3OJSkyHHkWnOg935nxaZTQPkZKqROu1p0rXuGdpxMcnE5qlDwQSWh52qiyQnwNuxg8i
         AKNR79YtcVTlSj5ft+bPqgCTxoohdWsHAFd3jTi+ZfVx4Voi2BWD01WzDmoMhSlnRqPa
         lXYw==
X-Gm-Message-State: AOJu0YyS4BOgMOg1HxSnNkz9OBTcbkGxJC6lipeYOLEYO1HiGfOPI4SE
	rRESmqtcIh5K15JWcYeQHzHTnnbSWQtqk+cDNE7Lz1IaB/FeQ6OL70AmEE9/smfBOq7SJZPNoBf
	JPvqCpHE=
X-Gm-Gg: AeBDietd9gX47B0eep9RLtaJpkl9jW2ZyJILmegbL5WD9+mpeVosTSeqvTR0veGuzwd
	ODt0LEE6xA5MteTldRt4qKxlh51hMa3n0C/o8SOYOKIhZaKqOxYIVNM02hBsWHYLOuHh63X89/w
	B59vOCcUaEtP2QJKzZX/MkYJu+yJa0RoscmulIRXtQ3xPZRUeEMzScUEQfXHwZd9dHcU6NtJTKl
	a8C6Z2qRfmO/RhJCjZBuCT2pF7yAZmcGlIVhDdUMQrq09fu8UqIquApaABuDkYnsdjhhsKF/YN+
	4QFG1mymFkDaav/dCI3vg68u3w4tN8AupDZHayFDP4vIz2CtSAAuLrddcq9m5w2PhhSvtQIH/AE
	HQmk5gPgS82rsRTMJ7/t3jnmHaCB27mvhN4k5c5v5uJ4sDD7DLHKMHEu1EkuP426VysuwJyKgkL
	WigUp8pZ4L48FsF18m058UkDmE9X3oLmIwX8FZnCqXmXdNBTw=
X-Received: by 2002:a05:7300:b90d:b0:2f0:c593:986a with SMTP id 5a478bee46e88-2f3cb609119mr1364764eec.0.1777983878384;
        Tue, 05 May 2026 05:24:38 -0700 (PDT)
Received: from MVIN00013.mvista.com ([150.129.170.139])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee38e71cedsm24037785eec.9.2026.05.05.05.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 05:24:38 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-networking][scarthgap][PATCH] wireshark: fix for CVE-2025-13946
Date: Tue,  5 May 2026 17:54:31 +0530
Message-ID: <20260505122431.6015-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 May 2026 12:24:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126787

Pick patch from [1] also mentioned at NVD report in [2]

[1] https://gitlab.com/wireshark/wireshark/-/issues/20884
[2] https://nvd.nist.gov/vuln/detail/CVE-2025-13946
[3] https://security-tracker.debian.org/tracker/CVE-2025-13946

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../wireshark/files/CVE-2025-13946.patch      | 51 +++++++++++++++++++
 .../wireshark/wireshark_4.2.14.bb             |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta-networking/recipes-support/wireshark/files/CVE-2025-13946.patch

diff --git a/meta-networking/recipes-support/wireshark/files/CVE-2025-13946.patch b/meta-networking/recipes-support/wireshark/files/CVE-2025-13946.patch
new file mode 100644
index 0000000000..40f5d316ad
--- /dev/null
+++ b/meta-networking/recipes-support/wireshark/files/CVE-2025-13946.patch
@@ -0,0 +1,51 @@
+From aba1fbe6266beb6bf9b887b6eab008e4f4841c9b Mon Sep 17 00:00:00 2001
+From: AndersBroman <a.broman58@gmail.com>
+Date: Mon, 1 Dec 2025 08:41:55 +0100
+Subject: MEGACO: Handle tvb_get_uint8 returning -1
+
+When dissecting a media descriptor, handle tvb_get_uint8 returning
+-1 when searching for a left or right bracket and not finding it
+by setting the bracket offset to the end offset so that the loop
+will exit. Leaving it at -1 can cause going backwards and at worst
+infinite loops.
+
+Fix #20884
+
+(cherry picked from commit aba1fbe6266beb6bf9b887b6eab008e4f4841c9b)
+
+Co-authored-by: John Thacker <johnthacker@gmail.com>
+origin: https://gitlab.com/wireshark/wireshark/-/merge_requests/22553
+
+
+CVE: CVE-2025-13946
+Upstream-Status: Backport [https://gitlab.com/wireshark/wireshark/-/commit/aba1fbe6266beb6bf9b887b6eab008e4f4841c9b]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ epan/dissectors/packet-megaco.c | 11 +++++++++--
+ 1 file changed, 9 insertions(+), 2 deletions(-)
+
+diff --git a/epan/dissectors/packet-megaco.c b/epan/dissectors/packet-megaco.c
+index 327b849..abf2078 100644
+--- a/epan/dissectors/packet-megaco.c
++++ b/epan/dissectors/packet-megaco.c
+@@ -1775,8 +1775,15 @@ dissect_megaco_mediadescriptor(tvbuff_t *tvb, proto_tree *megaco_tree_command_li
+         mediaParm = find_megaco_mediaParm_names(tvb, tvb_current_offset, tokenlen);
+ 
+         tvb_LBRKT = tvb_find_guint8(tvb, tvb_next_offset , tvb_last_RBRKT, '{');
+-        tvb_next_offset = tvb_find_guint8(tvb, tvb_current_offset+1 , tvb_last_RBRKT, '}');
+-        tvb_RBRKT = tvb_next_offset;
++        if (tvb_LBRKT == -1) {
++            // Not found, use the end offset.
++            tvb_LBRKT = tvb_last_RBRKT;
++        }
++        tvb_RBRKT = tvb_find_guint8(tvb, tvb_current_offset+1 , tvb_last_RBRKT, '}');
++        if (tvb_RBRKT == -1) {
++            // Not found, use the end offset.
++            tvb_RBRKT = tvb_last_RBRKT;
++        }
+ 
+         switch ( mediaParm ){
+         case MEGACO_LOCAL_TOKEN:
+-- 
+2.50.1
+
diff --git a/meta-networking/recipes-support/wireshark/wireshark_4.2.14.bb b/meta-networking/recipes-support/wireshark/wireshark_4.2.14.bb
index 559dd75fe0..1185804282 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_4.2.14.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_4.2.14.bb
@@ -19,6 +19,7 @@ SRC_URI = "https://1.eu.dl.wireshark.org/src/all-versions/wireshark-${PV}.tar.xz
            file://CVE-2026-0962.patch \
            file://CVE-2026-3201.patch \
            file://CVE-2026-0960.patch \
+           file://CVE-2025-13946.patch \
            "
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src/all-versions"
-- 
2.50.1


