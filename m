Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6929CEDF163
	for <webhook@archiver.kernel.org>; Fri, 13 Feb 2026 13:44:03 +0000 (UTC)
Received: from alln-iport-1.cisco.com (alln-iport-1.cisco.com [173.37.142.88])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.71332.1770989334786538654
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Feb 2026 05:28:55 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=ilHUPaap;
 spf=pass (domain: cisco.com, ip: 173.37.142.88, mailfrom: adongare@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=9967; q=dns/txt;
  s=iport01; t=1770989334; x=1772198934;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=jw5xXoSNubZrfJbMYZpXe1lvyDAN2KE7nYX0Y3S48HM=;
  b=ilHUPaapl+pPHcxdO5Fj7r4aU25Q4Z14kmVE9Ra6T8uHs5EEN/qmyXhf
   /yds2qDNgIDW6Xc5gLg63pSzz0RSI/eiZqiHu0bHxVbGejtPe5ov8Xykz
   2ZxRnV1GJE9FJrDmfYM8qvcjonJA0n1kADfezt6A12tabaSmTRi4PCN8I
   hsxveojE1eksLWZbr89/vGgxcrHDO3gIpz2gxvqbYSGYJi7yeD8z2aW99
   Qc+S0I/alLZMhL27G4ZuINpsB3Gr6e4h3wlKCBRGPZkcCMFozVtGZur+Y
   Wbomeh0FBbPDOwbWMS8uQ/VCmZqG2FLXblNDZKSSFVxHAy6U4eniMuOk4
   Q==;
X-CSE-ConnectionGUID: Ilil4rsDS9y67sUCOLAtOw==
X-CSE-MsgGUID: 4hc0IKWrR1q/awnK6906/Q==
X-IPAS-Result: =?us-ascii?q?A0AQBAA1Jo9p/4//Ja1aglmCSA9xXkNJlkueHYF/DwEBA?=
 =?us-ascii?q?Q89FAQBAYUHjSACJjQJDgECBAEBAQEDAgMBAQEBAQEBAQEBAQsBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4Thk8NhloBAgE1ARgBHw4sAwECWiMhgwIBgnMDEQatcIIsgQGDKAExB?=
 =?us-ascii?q?QkCQ0/bJgELFAGBOIU8iBlbGAGEeicbG4FygRQBg2iBBYFcAYIHhh4EgiKBD?=
 =?us-ascii?q?oFhIw+GdwaKX0iBHgNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjPheBCxsHBYgLD?=
 =?us-ascii?q?4kHeG6BIHwDCxgNSBEsNxQbBD5uB45IQYIzgQ4BK12BTxE9klcaE5IioQ4KK?=
 =?us-ascii?q?IN0jB6VOhozhASmZ5kGgliLMZVnaYRogWg8gUcLB3AVgyIJSRkPji0LC4Neg?=
 =?us-ascii?q?X+DFLwyJTICATkCBwsBAQMJk2cBAQ?=
IronPort-Data: A9a23:Srszw6CYBQjkUBVW/3niw5YqxClBgxIJ4kV8jS/XYbTApG8g1DIBy
 2ZLWmyBa/mMYGL9KNF2a96wpB9UuZWDxtU1OVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGdIZvCCeA+n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jWmthh
 fuo+5eBYAX8gGYtWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TE4vFvCB0sJqEjq/cpXnpz3
 ts8ASwqcUXW7w626OrTpuhEnM8vKozveYgYoHwllW+fBvc9SpeFSKLPjTNa9G5v3YYVQrCEO
 pdfMGY0BPjDS0Un1lM/AZ45muihnHTXeDxDo1XTrq0yi4TW5FIuieO3YYSNIrRmQ+0Jnk3Ah
 0H55V6gG1YTK9q8l2vdrDWV07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR63rOe0jma6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYGUNZWVul/4waXx++MvUCSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXPIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:vYCgzqOiGmqhH8BcTsqjsMiBIKoaSvp037Dk7S9MoHtuA6mlfq
 +V/cjzuSWYtN9zYgBDpTnjAsm9qBrnnPYfi7X5Vo3NYOCJggeVxflZnOjfK/mKIVyYygabvp
 0QF5RDNA==
X-Talos-CUID: 9a23:QDtYam7SaUeFBbVxFNss1UoVHpw/aVHmnWaOfFSFIkFNYaGyVgrF
X-Talos-MUID: 9a23:n4bgSgocrGrBzzfkagcez21iP59JwJu0MhkU1pwZveraZHQufA7I2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.21,288,1763424000"; 
   d="scan'208";a="671329600"
Received: from rcdn-l-core-06.cisco.com ([173.37.255.143])
  by alln-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 13 Feb 2026 13:28:53 +0000
Received: from sjc-ads-10055.cisco.com (sjc-ads-10055.cisco.com [10.30.210.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-06.cisco.com (Postfix) with ESMTPS id A49131800025D;
	Fri, 13 Feb 2026 13:28:53 +0000 (GMT)
Received: by sjc-ads-10055.cisco.com (Postfix, from userid 1870532)
	id 47DAECC12A6; Fri, 13 Feb 2026 05:28:53 -0800 (PST)
From: "Anil Dongare -X (adongare - E INFOCHIPS PRIVATE LIMITED at Cisco)" <adongare@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com, to@cisco.com,
	Anil Dongare <adongare@cisco.com>
Subject: [meta-OE] [scarthgap] [PATCH] wireshark 4.2.14: Fix CVE-2026-0962
Date: Fri, 13 Feb 2026 05:28:46 -0800
Message-ID: <20260213132846.1616740-1-adongare@cisco.com>
X-Mailer: git-send-email 2.44.1
MIME-Version: 1.0
X-Outbound-SMTP-Client: 10.30.210.59, sjc-ads-10055.cisco.com
X-Outbound-Node: rcdn-l-core-06.cisco.com
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Feb 2026 13:44:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124388

From: Anil Dongare <adongare@cisco.com>

Upstream Repository: https://gitlab.com/wireshark/wireshark.git

Bug Details: https://nvd.nist.gov/vuln/detail/CVE-2026-0962
Type: Security Fix
CVE: CVE-2026-0962
Score: 6.5
Patch: https://gitlab.com/wireshark/wireshark/-/commit/825b83e1ed14

Signed-off-by: Anil Dongare <adongare@cisco.com>
---
 .../wireshark/files/CVE-2026-0962.patch       | 152 ++++++++++++++++++
 .../wireshark/wireshark_4.2.14.bb             |   1 +
 2 files changed, 153 insertions(+)
 create mode 100644 meta-networking/recipes-support/wireshark/files/CVE-2026-0962.patch

diff --git a/meta-networking/recipes-support/wireshark/files/CVE-2026-0962.patch b/meta-networking/recipes-support/wireshark/files/CVE-2026-0962.patch
new file mode 100644
index 0000000000..c9a3723ba9
--- /dev/null
+++ b/meta-networking/recipes-support/wireshark/files/CVE-2026-0962.patch
@@ -0,0 +1,152 @@
+From 912286bc877a2914f089a063dbf5fa8037efd709 Mon Sep 17 00:00:00 2001
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
+(cherry picked from commit 825b83e1ed146f6c8fa8f1d7ad2794061b82c895)
+
+CVE: CVE-2026-0962
+Upstream-Status: Backport [https://gitlab.com/wireshark/wireshark/-/commit/825b83e1ed14]
+
+Backport Changes:
+- In the epan/dissectors/packet-someip-sd.c file, the variable
+  ef_someipsd_too_many_options was added in place of ei_someipsd_too_many_options
+  to maintain consistency with the existing expert_field naming conventions.
+- This update is already included in Wireshark version 4.4 with the following
+  commit: https://gitlab.com/wireshark/wireshark/-/commit/9e59a18db82f
+
+Signed-off-by: Anil Dongare <adongare@cisco.com>
+---
+ epan/dissectors/packet-someip-sd.c | 30 ++++++++++++++++++------------
+ 1 file changed, 18 insertions(+), 12 deletions(-)
+
+diff --git a/epan/dissectors/packet-someip-sd.c b/epan/dissectors/packet-someip-sd.c
+index 85144d5925..7088ee5210 100644
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
+@@ -274,13 +275,13 @@ someip_sd_register_ports(guint32 opt_index, guint32 opt_num, guint32 option_coun
+ }
+
+ static void
+-dissect_someip_sd_pdu_option_configuration(tvbuff_t *tvb, packet_info *pinfo, proto_tree *tree, guint32 offset, guint32 length, int optionnum) {
++dissect_someip_sd_pdu_option_configuration(tvbuff_t *tvb, packet_info *pinfo, proto_tree *tree, guint32 offset, guint32 length, unsigned optionnum) {
+     guint32         offset_orig = offset;
+     const guint8   *config_string;
+     proto_item     *ti;
+     proto_tree     *subtree;
+
+-    tree = proto_tree_add_subtree_format(tree, tvb, offset, length, ett_someip_sd_option, NULL, "%d: Configuration Option", optionnum);
++    tree = proto_tree_add_subtree_format(tree, tvb, offset, length, ett_someip_sd_option, NULL, "%u: Configuration Option", optionnum);
+
+     /* Add common fields */
+     proto_tree_add_item(tree, hf_someip_sd_option_length, tvb, offset, 2, ENC_BIG_ENDIAN);
+@@ -317,8 +318,8 @@ dissect_someip_sd_pdu_option_configuration(tvbuff_t *tvb, packet_info *pinfo, pr
+ }
+
+ static void
+-dissect_someip_sd_pdu_option_loadbalancing(tvbuff_t *tvb, packet_info *pinfo _U_, proto_tree *tree, guint32 offset, guint32 length, int optionnum) {
+-    tree = proto_tree_add_subtree_format(tree, tvb, offset, length, ett_someip_sd_option, NULL, "%d: Load Balancing Option", optionnum);
++dissect_someip_sd_pdu_option_loadbalancing(tvbuff_t *tvb, packet_info *pinfo _U_, proto_tree *tree, guint32 offset, guint32 length, unsigned optionnum) {
++    tree = proto_tree_add_subtree_format(tree, tvb, offset, length, ett_someip_sd_option, NULL, "%u Load Balancing Option", optionnum);
+
+     /* Add common fields */
+     proto_tree_add_item(tree, hf_someip_sd_option_length, tvb, offset, 2, ENC_BIG_ENDIAN);
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
+@@ -484,7 +485,11 @@ dissect_someip_sd_pdu_options(tvbuff_t *tvb, packet_info *pinfo, proto_tree *tre
+     }
+
+     while (tvb_bytes_exist(tvb, offset, SD_OPTION_MINLENGTH)) {
+-        ws_assert(optionnum >= 0 && optionnum < SD_MAX_NUM_OPTIONS);
++        if (optionnum >= SD_MAX_NUM_OPTIONS) {
++            expert_add_info(pinfo, ti, &ef_someipsd_too_many_options);
++            return offset;
++        }
++
+         option_ports[optionnum] = 0;
+
+         real_length = tvb_get_ntohs(tvb, offset) + 3;
+@@ -1195,6 +1200,7 @@ proto_register_someip_sd(void) {
+         { &ef_someipsd_option_wrong_length,{ "someipsd.option_wrong_length", PI_MALFORMED, PI_ERROR, "SOME/IP-SD Option length is incorrect!", EXPFILL } },
+         { &ef_someipsd_L4_protocol_unsupported,{ "someipsd.L4_protocol_unsupported", PI_MALFORMED, PI_ERROR, "SOME/IP-SD Unsupported Layer 4 Protocol!", EXPFILL } },
+         { &ef_someipsd_config_string_malformed,{ "someipsd.config_string_malformed", PI_MALFORMED, PI_ERROR, "SOME/IP-SD Configuration String malformed!", EXPFILL } },
++        { &ef_someipsd_too_many_options,{ "someipsd.too_many_options", PI_MALFORMED, PI_ERROR, "SOME/IP-SD Too many options!", EXPFILL } },
+     };
+
+     /* Register Protocol, Fields, ETTs, Expert Info, Taps, Dissector */
+--
+2.43.7
diff --git a/meta-networking/recipes-support/wireshark/wireshark_4.2.14.bb b/meta-networking/recipes-support/wireshark/wireshark_4.2.14.bb
index c313075ea4..d3fbbc8f3a 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_4.2.14.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_4.2.14.bb
@@ -15,6 +15,7 @@ SRC_URI = "https://1.eu.dl.wireshark.org/src/all-versions/wireshark-${PV}.tar.xz
            file://0001-UseLemon.cmake-do-not-use-lemon-data-from-the-host.patch \
            file://CVE-2025-9817.patch \
            file://CVE-2025-13499.patch \
+           file://CVE-2026-0962.patch \
            "
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src/all-versions"
-- 
2.44.1


