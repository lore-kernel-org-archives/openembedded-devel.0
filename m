Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E58C4EC1EA9
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 12:04:30 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19274.1770293065991284430
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Feb 2026 04:04:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dMsq8lhu;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-435903c4040so638190f8f.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Feb 2026 04:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770293064; x=1770897864; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GmvLjrBuGfh45ejuIWy7kIbYfgxs/WJCkc+FfagjlB4=;
        b=dMsq8lhuIAgyKJ2nFdkt5OTqsXXE0QmNn62iDCALVWNoCJU7q4HzuoetcO3GJ2VJ0d
         5LJ0h8mJfjqBgQtUzOW2ddygb6heCAclMHxFkJ1juGqLXfrN68lg74smFO2m/dgKm63a
         xaT6vGMdMF3LKJBnc+ivAICA0PVa/rVgxjTODYpQLOQtrcx37L/cSUw0o0QFxtPZdxyI
         v5WsJc7vTCTfPdVr14OHOaPVbIiZMBH/SzThLm0zm8bbYqemwIIMKrgosqJfC33wLa/Y
         hbwaeMrFgVc+XtmYQOUGb18UpOePHAOhfHINwcYw2mD2lGc/CVhgkwo7nvevlcgoa41c
         rZZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770293064; x=1770897864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GmvLjrBuGfh45ejuIWy7kIbYfgxs/WJCkc+FfagjlB4=;
        b=hFlGNWd8Efv0oFKGMHNBExe9cLVWxRGTG4ekB7HDX6v0uz8k9deCGVxhMRaQ+A8Olm
         XrfCrzpqpv10yh63pjmHlF8Rz6tH8sC2yEmCw8+UOdpXVbXIyBDFTNR5zJUwdkLkwIsm
         7kJxPimPbroKB7A345P/lR+wN2rI3fDcLIkXQarCVtq4YlppOd0vw8TSdHmIOjoivwuZ
         Si3QjJCGM5DZwPgu+WajGkWotaElSzLh+E8fr8S/0el4cfLUUyhCHJAS65yr5oYdluJT
         1VnlhFXRalJP9Scti/rbFYqj8To/yw9fFTm2VvRQqcp/hIQ7+Nm7ZEm2q1DB1ghYOD0i
         sFWQ==
X-Gm-Message-State: AOJu0YxwXHkdtkywFa6f6P8373kgFEbBgpl1W0IHRmtOx+jceSLrn1od
	HNqvuhEkH83xeWJJuUWq7SSJ+R7K1D0t2YZ+1p3D2nb7W5AQuWWUIwwEXvc06g==
X-Gm-Gg: AZuq6aLHJhZFBuJ8825By2s+zBPBs1lNFKBkfNZnCOBAmfBvFAaZiFBJuulzFc0L1Fk
	oEQB5NCMsdUkPX8LQl8OciHJQ5P9bOY52dKf1fi+Vnh6kOdh30jhM3cmAd0KCnMOI4oUkg9u5F7
	SG6epZhSpB8r4Z1c7f8Cnbzp5ig2jmpZbBvpAWC7lSA5GRKpPbZz9QdtWyS7fngOqlHCfcT2l9A
	4hMI8BMbmbhRN1o8DTfWlu5clqttpmkq+SUf+yfNhO+Rgrz+lGfpCtxk9eBFG2NkW/MBbZ61TRq
	wvqoy6mBUWVaf+4QJ3ZpGxwHAkMbGVPfiPqgZvCZoWVTldct1vOCSwoERAU57pU4HHrlC3OejGp
	nvPyq8ob0PFlsmg9ON745vRXp863LxMiWquFJgt7der6NLj1Axn9JngKDbsHHXJBGNgSSHUE6Es
	k4qWHoJ4uI
X-Received: by 2002:a05:6000:250c:b0:432:5c34:fb32 with SMTP id ffacd0b85a97d-43617e40896mr9984785f8f.23.1770293064042;
        Thu, 05 Feb 2026 04:04:24 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436180640e5sm12636556f8f.40.2026.02.05.04.04.23
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 04:04:23 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][whinlatter][PATCH 2/2] wireshark: patch CVE-2026-0962
Date: Thu,  5 Feb 2026 13:04:22 +0100
Message-ID: <20260205120422.1516950-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260205120422.1516950-1-skandigraun@gmail.com>
References: <20260205120422.1516950-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Feb 2026 12:04:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124211

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-0962

Backport the commit that is referenced in the related gitlab issue[1].

[1]: https://gitlab.com/wireshark/wireshark/-/issues/20945

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../wireshark/files/CVE-2026-0962.patch       | 131 ++++++++++++++++++
 .../wireshark/wireshark_4.2.14.bb             |   1 +
 2 files changed, 132 insertions(+)
 create mode 100644 meta-networking/recipes-support/wireshark/files/CVE-2026-0962.patch

diff --git a/meta-networking/recipes-support/wireshark/files/CVE-2026-0962.patch b/meta-networking/recipes-support/wireshark/files/CVE-2026-0962.patch
new file mode 100644
index 0000000000..615b11eb7f
--- /dev/null
+++ b/meta-networking/recipes-support/wireshark/files/CVE-2026-0962.patch
@@ -0,0 +1,131 @@
+From 4b1c045a4639b54a0aea717667a30c01c683001c Mon Sep 17 00:00:00 2001
+From: Gerald Combs <gerald@wireshark.org>
+Date: Mon, 12 Jan 2026 17:01:48 -0800
+Subject: [PATCH] SOME/IP-SD: Fix a buffer overflow
+
+Make sure we don't write past the end of our option port array. Make our
+option count unsigned.
+
+Fixes #20945
+
+(cherry picked from commit 55ec8b3db4968c97115f014fb5974206cdf57454)
+
+Conflicts:
+	epan/dissectors/packet-someip-sd.c
+
+CVE: CVE-2026-0962
+Upstream-Status: Backport [https://gitlab.com/wireshark/wireshark/-/commit/825b83e1ed146f6c8fa8f1d7ad2794061b82c895]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ epan/dissectors/packet-someip-sd.c | 25 +++++++++++++++----------
+ 1 file changed, 15 insertions(+), 10 deletions(-)
+
+diff --git a/epan/dissectors/packet-someip-sd.c b/epan/dissectors/packet-someip-sd.c
+index 85144d5..79935bb 100644
+--- a/epan/dissectors/packet-someip-sd.c
++++ b/epan/dissectors/packet-someip-sd.c
+@@ -242,6 +242,7 @@ static expert_field ef_someipsd_option_unknown = EI_INIT;
+ static expert_field ef_someipsd_option_wrong_length = EI_INIT;
+ static expert_field ef_someipsd_L4_protocol_unsupported = EI_INIT;
+ static expert_field ef_someipsd_config_string_malformed = EI_INIT;
++static expert_field ef_someipsd_too_many_options = EI_INIT;
+ 
+ /*** prototypes ***/
+ void proto_register_someip_sd(void);
+@@ -274,7 +275,7 @@ someip_sd_register_ports(guint32 opt_index, guint32 opt_num, guint32 option_coun
+ }
+ 
+ static void
+-dissect_someip_sd_pdu_option_configuration(tvbuff_t *tvb, packet_info *pinfo, proto_tree *tree, guint32 offset, guint32 length, int optionnum) {
++dissect_someip_sd_pdu_option_configuration(tvbuff_t *tvb, packet_info *pinfo, proto_tree *tree, guint32 offset, guint32 length, unsigned optionnum) {
+     guint32         offset_orig = offset;
+     const guint8   *config_string;
+     proto_item     *ti;
+@@ -317,7 +318,7 @@ dissect_someip_sd_pdu_option_configuration(tvbuff_t *tvb, packet_info *pinfo, pr
+ }
+ 
+ static void
+-dissect_someip_sd_pdu_option_loadbalancing(tvbuff_t *tvb, packet_info *pinfo _U_, proto_tree *tree, guint32 offset, guint32 length, int optionnum) {
++dissect_someip_sd_pdu_option_loadbalancing(tvbuff_t *tvb, packet_info *pinfo _U_, proto_tree *tree, guint32 offset, guint32 length, unsigned optionnum) {
+     tree = proto_tree_add_subtree_format(tree, tvb, offset, length, ett_someip_sd_option, NULL, "%d: Load Balancing Option", optionnum);
+ 
+     /* Add common fields */
+@@ -337,7 +338,7 @@ dissect_someip_sd_pdu_option_loadbalancing(tvbuff_t *tvb, packet_info *pinfo _U_
+ }
+ 
+ static void
+-dissect_someip_sd_pdu_option_ipv4(tvbuff_t *tvb, packet_info *pinfo, proto_tree *tree, guint32 offset, guint32 length, int optionnum, guint32 option_ports[]) {
++dissect_someip_sd_pdu_option_ipv4(tvbuff_t *tvb, packet_info *pinfo, proto_tree *tree, guint32 offset, guint32 length, unsigned optionnum, guint32 option_ports[]) {
+     guint8              type = 255;
+     const gchar        *description = NULL;
+     guint32             l4port = 0;
+@@ -350,7 +351,7 @@ dissect_someip_sd_pdu_option_ipv4(tvbuff_t *tvb, packet_info *pinfo, proto_tree
+ 
+     type = tvb_get_guint8(tvb, offset + 2);
+     description = val_to_str(type, sd_option_type, "(Unknown Option: %d)");
+-    tree = proto_tree_add_subtree_format(tree, tvb, offset, length, ett_someip_sd_option, &ti_top, "%d: %s Option", optionnum, description);
++    tree = proto_tree_add_subtree_format(tree, tvb, offset, length, ett_someip_sd_option, &ti_top, "%u: %s Option", optionnum, description);
+ 
+     if (length != SD_OPTION_IPV4_LENGTH) {
+         expert_add_info(pinfo, ti_top, &ef_someipsd_option_wrong_length);
+@@ -391,7 +392,7 @@ dissect_someip_sd_pdu_option_ipv4(tvbuff_t *tvb, packet_info *pinfo, proto_tree
+ }
+ 
+ static void
+-dissect_someip_sd_pdu_option_ipv6(tvbuff_t *tvb, packet_info *pinfo, proto_tree *tree, guint32 offset, guint32 length, int optionnum, guint32 option_ports[]) {
++dissect_someip_sd_pdu_option_ipv6(tvbuff_t *tvb, packet_info *pinfo, proto_tree *tree, guint32 offset, guint32 length, unsigned optionnum, guint32 option_ports[]) {
+     guint8              type = 255;
+     const gchar        *description = NULL;
+     guint32             l4port = 0;
+@@ -404,7 +405,7 @@ dissect_someip_sd_pdu_option_ipv6(tvbuff_t *tvb, packet_info *pinfo, proto_tree
+     type = tvb_get_guint8(tvb, offset + 2);
+     description = val_to_str(type, sd_option_type, "(Unknown Option: %d)");
+ 
+-    tree = proto_tree_add_subtree_format(tree, tvb, offset, length, ett_someip_sd_option, &ti_top, "%d: %s Option", optionnum, description);
++    tree = proto_tree_add_subtree_format(tree, tvb, offset, length, ett_someip_sd_option, &ti_top, "%u: %s Option", optionnum, description);
+ 
+     if (length != SD_OPTION_IPV6_LENGTH) {
+         expert_add_info(pinfo, ti_top, &ef_someipsd_option_wrong_length);
+@@ -444,11 +445,11 @@ dissect_someip_sd_pdu_option_ipv6(tvbuff_t *tvb, packet_info *pinfo, proto_tree
+ }
+ 
+ static void
+-dissect_someip_sd_pdu_option_unknown(tvbuff_t *tvb, packet_info *pinfo, proto_tree *tree, guint32 offset, guint32 length, int optionnum) {
++dissect_someip_sd_pdu_option_unknown(tvbuff_t *tvb, packet_info *pinfo, proto_tree *tree, guint32 offset, guint32 length, unsigned optionnum) {
+     guint32             len = 0;
+     proto_item         *ti;
+ 
+-    tree = proto_tree_add_subtree_format(tree, tvb, offset, length, ett_someip_sd_option, &ti, "%d: %s Option", optionnum,
++    tree = proto_tree_add_subtree_format(tree, tvb, offset, length, ett_someip_sd_option, &ti, "%u: %s Option", optionnum,
+         val_to_str_const(tvb_get_guint8(tvb, offset + 2), sd_option_type, "Unknown"));
+ 
+     expert_add_info(pinfo, ti, &ef_someipsd_option_unknown);
+@@ -473,7 +474,7 @@ static int
+ dissect_someip_sd_pdu_options(tvbuff_t *tvb, packet_info *pinfo, proto_tree *tree, proto_item *ti, guint32 offset_orig, guint32 length, guint32 option_ports[], guint *option_count) {
+     guint16             real_length = 0;
+     guint8              option_type = 0;
+-    int                 optionnum = 0;
++    unsigned            optionnum = 0;
+     tvbuff_t           *subtvb = NULL;
+ 
+     guint32             offset = offset_orig;
+@@ -484,7 +485,10 @@ dissect_someip_sd_pdu_options(tvbuff_t *tvb, packet_info *pinfo, proto_tree *tre
+     }
+ 
+     while (tvb_bytes_exist(tvb, offset, SD_OPTION_MINLENGTH)) {
+-        ws_assert(optionnum >= 0 && optionnum < SD_MAX_NUM_OPTIONS);
++        if (optionnum >= SD_MAX_NUM_OPTIONS) {
++            expert_add_info(pinfo, ti, &ef_someipsd_too_many_options);
++            return offset;
++        }
+         option_ports[optionnum] = 0;
+ 
+         real_length = tvb_get_ntohs(tvb, offset) + 3;
+@@ -1195,6 +1199,7 @@ proto_register_someip_sd(void) {
+         { &ef_someipsd_option_wrong_length,{ "someipsd.option_wrong_length", PI_MALFORMED, PI_ERROR, "SOME/IP-SD Option length is incorrect!", EXPFILL } },
+         { &ef_someipsd_L4_protocol_unsupported,{ "someipsd.L4_protocol_unsupported", PI_MALFORMED, PI_ERROR, "SOME/IP-SD Unsupported Layer 4 Protocol!", EXPFILL } },
+         { &ef_someipsd_config_string_malformed,{ "someipsd.config_string_malformed", PI_MALFORMED, PI_ERROR, "SOME/IP-SD Configuration String malformed!", EXPFILL } },
++        { &ef_someipsd_too_many_options,{ "someipsd.too_many_options", PI_MALFORMED, PI_ERROR, "SOME/IP-SD Too many options!", EXPFILL } },
+     };
+ 
+     /* Register Protocol, Fields, ETTs, Expert Info, Taps, Dissector */
diff --git a/meta-networking/recipes-support/wireshark/wireshark_4.2.14.bb b/meta-networking/recipes-support/wireshark/wireshark_4.2.14.bb
index bd014055a9..fbe57e7d79 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_4.2.14.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_4.2.14.bb
@@ -14,6 +14,7 @@ SRC_URI = "https://1.eu.dl.wireshark.org/src/all-versions/wireshark-${PV}.tar.xz
            file://0004-lemon-Remove-line-directives.patch \
            file://0001-UseLemon.cmake-do-not-use-lemon-data-from-the-host.patch \
            file://CVE-2025-9817.patch \
+           file://CVE-2026-0962.patch \
            "
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src/all-versions"

