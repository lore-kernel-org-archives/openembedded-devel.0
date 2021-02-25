Received: from IND01-BO1-obe.outbound.protection.outlook.com (IND01-BO1-obe.outbound.protection.outlook.com [40.107.139.57])
 by mx.groups.io with SMTP id smtpd.web10.8379.1614238405967583442
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Feb 2021 23:33:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=ZpiuFUxP;
 spf=pass (domain: kpit.com, ip: 40.107.139.57, mailfrom: rahul.taya@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GHU0hQlLIGEWuXT8x7tLnaEiElcq8vLWPq+W5bFcarDO1vvMZ040R1bLR+aEb9BOcy0LSKgZdpqireVJ1kpFPtcgjlrxjzZQ/MYty8aDs04QQkJNkxsy1mt+4b06IKzFxlHVLLPGc01482ZsoPrRK/jxSPBuoNnZjbUkvRDhjucAxDqbO20712SilmZP68uSsxEvEZWIVaUoGb9XGFBqhb2AT5BJefDJpeVpTETkClgj/HM3Ou0mpqFKcu9bIu+mDNQtlce6HMWMSjOyM+7WJCVDi91iS1QHRuonr3320tMsFIGeLnGGIUvXvNOfLAsvzckUmSlivJf1ekXOvEf6zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KaAcWjReRcAu2oYzUMcG73FhKuT7HgMXFKFVwT8H6KM=;
 b=Ncj0tQBe/kKX54lKkwbfLxhqmQYplH4a1b9d0Q43vxarLvCMzz87zCKefrzDmEPsDEuV+06ND2nh7tCHNNiQ9LRhzZTM/AM0SQqJWE4JsB0FeiKEuDD5SGXT38GyqbpFymFb/nT2jYU4/jM1EhXj3qfKtN8tauGd2IDAXUCgSwpnrzElWcWHsIzYnWOBi0jtBuNFd5O4rtvcvyKvkTnHYsMfQERf0XcuhN/ihEs7vICnfFBEs6FgLBkeZzNmqnz3O0OWg6J2Ab2m5bs7CfiQD5DoVCKny3wjtHyJ88LIYOvOAIHDeKsisO8QreVxICk9GsbwRafwLOrlKQX7a3Qe2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KaAcWjReRcAu2oYzUMcG73FhKuT7HgMXFKFVwT8H6KM=;
 b=ZpiuFUxPAJLuQJAIOAbbxLcp52dmNCvD7vCYo8ZMPehpElOA/6qtI6K5QkWv+MBmulZ3OEloZP3i1QRdfWjsOZ3zu7pAwttOzC8wNPw2ESYZ/MGFg9ACC7MGtk7vtt6gyJsI1sYCcQ4nOAEkBhaXpWSidwSsITQXI18bZpVFp3w=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:58::18)
 by BM1PR01MB2996.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:4d::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27; Thu, 25 Feb
 2021 07:33:14 +0000
Received: from BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5c87:1000:2e85:9ab7]) by BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5c87:1000:2e85:9ab7%7]) with mapi id 15.20.3890.019; Thu, 25 Feb 2021
 07:33:14 +0000
From: "Rahul Taya" <Rahul.Taya@kpit.com>
To: openembedded-devel@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com,
	harpritkaur.bhandari@kpit.com,
	Rahul Taya <Rahul.Taya@kpit.com>
Subject: [meta-openembedded][dunfell][PATCH] nghttp2: Add fix for CVE-2020-11080
Date: Thu, 25 Feb 2021 13:02:59 +0530
Message-Id: <20210225073259.10060-1-Rahul.Taya@kpit.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [122.169.11.218]
X-ClientProxiedBy: BM1PR0101CA0030.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:1a::16) To BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:58::18)
Return-Path: Rahul.Taya@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (122.169.11.218) by BM1PR0101CA0030.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:1a::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19 via Frontend Transport; Thu, 25 Feb 2021 07:33:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4e75e521-91fa-4542-953b-08d8d95f9bf9
X-MS-TrafficTypeDiagnostic: BM1PR01MB2996:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BM1PR01MB2996916DA7A9304C5701ED2FF29E9@BM1PR01MB2996.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:227;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	MVjIpPPi0x2ru1wm7jgrrh8mmhQYcgpRi3neBBWGRS/0czofRDD/ge+bbkEJOpcKzXrgnHwZlnNCPBATKmAhdFt0VlkXXz9XhXlh6i9l22M+qcd+XeKLy9qmsQwdXkyD4J6Lpx8UGKZLhHxzNBDlNE2/P9U0aBiP6EHdkulL5iCzD8L1l7JDI//54Kd5uHG/LTPTGCZ8j2t7m4fV3fcjuuNA9FwqraXBXm+a+Je41959wgdRnSZ3CItlFeGWu1wlyPKq4vcHzFjcbGh7gjL0nvdhDcpMBppehIh3WW5iO56tzn6a9ycqERYVuFkdf6CfBB1JOAa+MFLu0iFXd10HFhMOtW2c7qg/JS1Lfu8IX0XQwXQvunRl7eWd0KCmCZSBYhrT2nHoWb5QaiKMpi1bfqkrD/nX61bJvXWKq3uUhKJNQ/5yQ+e2A7siziDyHukQj5bM9jIjQGlul8kBBoH2ktpKCy67Q59/EXRP07j/2N2hhM0iMmHmZXuK/xMLDxjY+LDOoQb2P82ZfjDGq/m1Nwm82Oqce2iqXlK9hhDBi6L7BaTQimhHqIYkldgN5Fu87jP8IcrnosaLskdrepHwL8Y/X+hJ9bH+IURaU6mxSgq0kqXX+G0T/76eV1kT/yGaPWTBoR/Y6R9c9WwZq6oKzx+HHy+wg9rMbpFTo1/aWrw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(366004)(376002)(39850400004)(346002)(5660300002)(2616005)(36756003)(2906002)(4326008)(8936002)(66476007)(316002)(478600001)(83380400001)(6486002)(16526019)(52116002)(6506007)(186003)(8676002)(6512007)(966005)(956004)(107886003)(66946007)(1076003)(26005)(86362001)(69590400012)(30864003)(6666004)(66556008)(66574015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?71Ou5p/rhQceAQOxaauZyMMZEY5eJ84ax0Mlyu3zduvoknBcK8Gzn3WuJA6H?=
 =?us-ascii?Q?bbWYFbNeyERuhbAp/LL3qj/4mkINOb5J5wWqpmCF5La1OMZ0z4IvwFa4qXmS?=
 =?us-ascii?Q?rGZhBgR5FCHPG5cfaoqYM1QwfBgAhcbMsAHNpq8D5MeJQI2kxsYNidgjziSP?=
 =?us-ascii?Q?RsdbmLJgsPbpyzbA2sLYrEtOb7TgckzduzXyYPLjCf2spaIkny8SDh1aHx6R?=
 =?us-ascii?Q?3WzGUQZRu09YhGZjv/NBFN7fzjxAJM+W8TjiZObHo4cuAaJ6aVukNNfTxYjc?=
 =?us-ascii?Q?CH7cZn9xh7K4DlGiwyZKeC1UZ2IlY8EyQn+3U4ULX1BW7xO4yu4i/ZXMeEnq?=
 =?us-ascii?Q?oZUYgv/wViEqssuvXSjmk/sHT0GmTu16QBEphxhat9y8pi3tZDT6lTGNTGGm?=
 =?us-ascii?Q?iolXS0NWGvvvp6peyFwTpbG5Ws91OXcV7K4BF35dVpTsIzXelPlb7oSNxehF?=
 =?us-ascii?Q?P++TkImc040m6JWoClHj9tTn5KHN19C6rJwAK1XoJYsw+YdhhSh1z/rnLcG3?=
 =?us-ascii?Q?2EgRncEnSrory+ZEB21f4lxbVYLHBRtD5B4uqXLC+hPdukdvdU9yhl0xOeY3?=
 =?us-ascii?Q?uKm4YpVm0rXbO5FOdFEQGT4Mr9hTgSZncU5Od2OqLLZ0MLVaN0ptbP6efP6B?=
 =?us-ascii?Q?hLfXY6YVu8R0SNWQ5LMJ79W2NQt0P50BC2pow3P0FQh8HYsUXkMmA8jfynVS?=
 =?us-ascii?Q?0zW1vpIpOF7QM75K5suLDyCmRNnm0Xos7uVoY71RWtRPMfff8jVCJ0UbP8lZ?=
 =?us-ascii?Q?5R0eZD/ni1cp0eWCvuqT7lkPfVW9gjP5mEq4gGwI7WzGVrEPIO1BwG4MzTUC?=
 =?us-ascii?Q?PmeiF+bwAO+eOwMiwNfBWoorD+yI49jjipe44FsOmwA1TVjZSyqMWhX3yfzo?=
 =?us-ascii?Q?Op37Nm1RW2bvpm9KsV+ylW4Ke8jOHlsoxS/FCxK6K0OQHWw6HFeTJJ9b8BQc?=
 =?us-ascii?Q?4y3xm1IoaBzJwyjL3nlaO9WoSpFC5bLZILaXIHw3ko0zUXLwvR5/OtGrxKpJ?=
 =?us-ascii?Q?/ndfJb8hH9VNavVsHvUGgOq0O8SBdIeEB+Ay2KJtVVBckMc8o3gvSwdnW+pF?=
 =?us-ascii?Q?vmGTnbvo7LAxnqXiMiXW3zXTFNrBrCYM0BpvpzWAdsPvWenWa4VhRVISMnvf?=
 =?us-ascii?Q?HhfX8/vlfuKtRwUuF/aF8fcAdz9mtPR1qYqBVxIsECl692vTx03hdeWWtRBo?=
 =?us-ascii?Q?yaWHH+SRh14vR+BjDnb+N/AbPKHJHsE9k1EGKN6CMuDkMH5LnRgIBbyyKsCJ?=
 =?us-ascii?Q?Imx9Ao/4tMdHv4Sh6rKBEpfiUPz/Pyj95Me+cTg87K8Bd6taLpqzcIEYRd+H?=
 =?us-ascii?Q?m3J/EnKRdDJg8PJLt72FI/En?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e75e521-91fa-4542-953b-08d8d95f9bf9
X-MS-Exchange-CrossTenant-AuthSource: BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2021 07:33:13.8868
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: buUilnOclCh/4rt47Wn6lcd8dk/QWjae30SUgjwJ9aZuSrIhEQnj48qAFSdkQxmxZyGqGh5BbYuqT+eJG1MZTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BM1PR01MB2996
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Added below two patches to fix CVE-2020-11080:

1. CVE-2020-11080-1.patch
2. CVE-2020-11080-2.patch

Signed-off-by: Rahul Taya <Rahul.Taya@kpit.com>
---
 .../nghttp2/nghttp2/CVE-2020-11080-1.patch    |  31 ++
 .../nghttp2/nghttp2/CVE-2020-11080-2.patch    | 308 ++++++++++++++++++
 .../recipes-support/nghttp2/nghttp2_1.40.0.bb |   2 +
 3 files changed, 341 insertions(+)
 create mode 100644 meta-networking/recipes-support/nghttp2/nghttp2/CVE-202=
0-11080-1.patch
 create mode 100644 meta-networking/recipes-support/nghttp2/nghttp2/CVE-202=
0-11080-2.patch

diff --git a/meta-networking/recipes-support/nghttp2/nghttp2/CVE-2020-11080=
-1.patch b/meta-networking/recipes-support/nghttp2/nghttp2/CVE-2020-11080-1=
.patch
new file mode 100644
index 000000000..926e9ecbd
--- /dev/null
+++ b/meta-networking/recipes-support/nghttp2/nghttp2/CVE-2020-11080-1.patc=
h
@@ -0,0 +1,31 @@
+From f8da73bd042f810f34d19f9eae02b46d870af394 Mon Sep 17 00:00:00 2001
+From: James M Snell <jasnell@gmail.com>
+Date: Sun, 19 Apr 2020 09:12:24 -0700
+Subject: [PATCH] Earlier check for settings flood
+
+CVE: CVE-2020-11080
+Upstream-Status: Backport [https://github.com/nghttp2/nghttp2/commit/f8da7=
3bd042f810f34d19f9eae02b46d870af394.patch]
+Comment: No hunk refreshed
+Affects-version: < v1.41.0
+Signed-off-by: Rahul Taya <Rahul.Taya@kpit.com>
+---
+ lib/nghttp2_session.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/lib/nghttp2_session.c b/lib/nghttp2_session.c
+index 415e34776..39f81f498 100644
+--- a/lib/nghttp2_session.c
++++ b/lib/nghttp2_session.c
+@@ -5653,6 +5653,12 @@ ssize_t nghttp2_session_mem_recv(nghttp2_session *s=
ession, const uint8_t *in,
+           break;
+         }
+
++        /* Check the settings flood counter early to be safe */
++        if (session->obq_flood_counter_ >=3D session->max_outbound_ack &&
++            !(iframe->frame.hd.flags & NGHTTP2_FLAG_ACK)) {
++          return NGHTTP2_ERR_FLOODED;
++        }
++
+         iframe->state =3D NGHTTP2_IB_READ_SETTINGS;
+
+         if (iframe->payloadleft) {
diff --git a/meta-networking/recipes-support/nghttp2/nghttp2/CVE-2020-11080=
-2.patch b/meta-networking/recipes-support/nghttp2/nghttp2/CVE-2020-11080-2=
.patch
new file mode 100644
index 000000000..09fb37e93
--- /dev/null
+++ b/meta-networking/recipes-support/nghttp2/nghttp2/CVE-2020-11080-2.patc=
h
@@ -0,0 +1,308 @@
+From 336a98feb0d56b9ac54e12736b18785c27f75090 Mon Sep 17 00:00:00 2001
+From: James M Snell <jasnell@gmail.com>
+Date: Fri, 17 Apr 2020 16:53:51 -0700
+Subject: [PATCH] Implement max settings option
+
+CVE: CVE-2020-11080
+Upstream-Status: Backport [https://github.com/nghttp2/nghttp2/commit/336a9=
8feb0d56b9ac54e12736b18785c27f75090.patch]
+Comment: No hunks refreshed
+Affects-version: < v1.41.0
+Signed-off-by: Rahul Taya <Rahul.Taya@kpit.com>
+---
+ doc/CMakeLists.txt             |  1 +
+ doc/Makefile.am                |  1 +
+ lib/includes/nghttp2/nghttp2.h | 23 +++++++++++++
+ lib/nghttp2_helper.c           |  2 ++
+ lib/nghttp2_option.c           |  5 +++
+ lib/nghttp2_option.h           |  5 +++
+ lib/nghttp2_session.c          | 21 ++++++++++++
+ lib/nghttp2_session.h          |  2 ++
+ tests/main.c                   |  2 ++
+ tests/nghttp2_session_test.c   | 61 ++++++++++++++++++++++++++++++++++
+ tests/nghttp2_session_test.h   |  1 +
+ 11 files changed, 124 insertions(+)
+
+diff --git a/doc/CMakeLists.txt b/doc/CMakeLists.txt
+index 34c027929..f3aec84da 100644
+--- a/doc/CMakeLists.txt
++++ b/doc/CMakeLists.txt
+@@ -42,6 +42,7 @@ set(APIDOCS
+   nghttp2_option_set_no_recv_client_magic.rst
+   nghttp2_option_set_peer_max_concurrent_streams.rst
+   nghttp2_option_set_user_recv_extension_type.rst
++  nghttp2_option_set_max_settings.rst
+   nghttp2_pack_settings_payload.rst
+   nghttp2_priority_spec_check_default.rst
+   nghttp2_priority_spec_default_init.rst
+diff --git a/doc/Makefile.am b/doc/Makefile.am
+index 4d73cef50..f073bfa4c 100644
+--- a/doc/Makefile.am
++++ b/doc/Makefile.am
+@@ -69,6 +69,7 @@ APIDOCS=3D \
+       nghttp2_option_set_peer_max_concurrent_streams.rst \
+       nghttp2_option_set_user_recv_extension_type.rst \
+       nghttp2_option_set_max_outbound_ack.rst \
++      nghttp2_option_set_max_settings.rst \
+       nghttp2_pack_settings_payload.rst \
+       nghttp2_priority_spec_check_default.rst \
+       nghttp2_priority_spec_default_init.rst \
+diff --git a/lib/includes/nghttp2/nghttp2.h b/lib/includes/nghttp2/nghttp2=
.h
+index e3aeb9fed..9be6eea5c 100644
+--- a/lib/includes/nghttp2/nghttp2.h
++++ b/lib/includes/nghttp2/nghttp2.h
+@@ -228,6 +228,13 @@ typedef struct {
+  */
+ #define NGHTTP2_CLIENT_MAGIC_LEN 24
+
++/**
++ * @macro
++ *
++ * The default max number of settings per SETTINGS frame
++ */
++#define NGHTTP2_DEFAULT_MAX_SETTINGS 32
++
+ /**
+  * @enum
+  *
+@@ -398,6 +405,11 @@ typedef enum {
+    * receives an other type of frame.
+    */
+   NGHTTP2_ERR_SETTINGS_EXPECTED =3D -536,
++  /**
++   * When a local endpoint receives too many settings entries
++   * in a single SETTINGS frame.
++   */
++  NGHTTP2_ERR_TOO_MANY_SETTINGS =3D -537,
+   /**
+    * The errors < :enum:`NGHTTP2_ERR_FATAL` mean that the library is
+    * under unexpected condition and processing was terminated (e.g.,
+@@ -2659,6 +2671,17 @@ NGHTTP2_EXTERN void nghttp2_option_set_no_closed_st=
reams(nghttp2_option *option,
+ NGHTTP2_EXTERN void nghttp2_option_set_max_outbound_ack(nghttp2_option *o=
ption,
+                                                         size_t val);
+
++/**
++ * @function
++ *
++ * This function sets the maximum number of SETTINGS entries per
++ * SETTINGS frame that will be accepted. If more than those entries
++ * are received, the peer is considered to be misbehaving and session
++ * will be closed. The default value is 32.
++ */
++NGHTTP2_EXTERN void nghttp2_option_set_max_settings(nghttp2_option *optio=
n,
++                                                    size_t val);
++
+ /**
+  * @function
+  *
+diff --git a/lib/nghttp2_helper.c b/lib/nghttp2_helper.c
+index 91136a619..0bd541472 100644
+--- a/lib/nghttp2_helper.c
++++ b/lib/nghttp2_helper.c
+@@ -334,6 +334,8 @@ const char *nghttp2_strerror(int error_code) {
+   case NGHTTP2_ERR_FLOODED:
+     return "Flooding was detected in this HTTP/2 session, and it must be =
"
+            "closed";
++  case NGHTTP2_ERR_TOO_MANY_SETTINGS:
++    return "SETTINGS frame contained more than the maximum allowed entrie=
s";
+   default:
+     return "Unknown error code";
+   }
+diff --git a/lib/nghttp2_option.c b/lib/nghttp2_option.c
+index e53f22d36..34348e660 100644
+--- a/lib/nghttp2_option.c
++++ b/lib/nghttp2_option.c
+@@ -121,3 +121,8 @@ void nghttp2_option_set_max_outbound_ack(nghttp2_optio=
n *option, size_t val) {
+   option->opt_set_mask |=3D NGHTTP2_OPT_MAX_OUTBOUND_ACK;
+   option->max_outbound_ack =3D val;
+ }
++
++void nghttp2_option_set_max_settings(nghttp2_option *option, size_t val) =
{
++  option->opt_set_mask |=3D NGHTTP2_OPT_MAX_SETTINGS;
++  option->max_settings =3D val;
++}
+diff --git a/lib/nghttp2_option.h b/lib/nghttp2_option.h
+index 1f740aaa6..939729fdc 100644
+--- a/lib/nghttp2_option.h
++++ b/lib/nghttp2_option.h
+@@ -67,6 +67,7 @@ typedef enum {
+   NGHTTP2_OPT_MAX_DEFLATE_DYNAMIC_TABLE_SIZE =3D 1 << 9,
+   NGHTTP2_OPT_NO_CLOSED_STREAMS =3D 1 << 10,
+   NGHTTP2_OPT_MAX_OUTBOUND_ACK =3D 1 << 11,
++  NGHTTP2_OPT_MAX_SETTINGS =3D 1 << 12,
+ } nghttp2_option_flag;
+
+ /**
+@@ -85,6 +86,10 @@ struct nghttp2_option {
+    * NGHTTP2_OPT_MAX_OUTBOUND_ACK
+    */
+   size_t max_outbound_ack;
++  /**
++   * NGHTTP2_OPT_MAX_SETTINGS
++   */
++  size_t max_settings;
+   /**
+    * Bitwise OR of nghttp2_option_flag to determine that which fields
+    * are specified.
+diff --git a/lib/nghttp2_session.c b/lib/nghttp2_session.c
+index 563ccd7de..415e34776 100644
+--- a/lib/nghttp2_session.c
++++ b/lib/nghttp2_session.c
+@@ -458,6 +458,7 @@ static int session_new(nghttp2_session **session_ptr,
+
+   (*session_ptr)->max_send_header_block_length =3D NGHTTP2_MAX_HEADERSLEN=
;
+   (*session_ptr)->max_outbound_ack =3D NGHTTP2_DEFAULT_MAX_OBQ_FLOOD_ITEM=
;
++  (*session_ptr)->max_settings =3D NGHTTP2_DEFAULT_MAX_SETTINGS;
+
+   if (option) {
+     if ((option->opt_set_mask & NGHTTP2_OPT_NO_AUTO_WINDOW_UPDATE) &&
+@@ -521,6 +522,11 @@ static int session_new(nghttp2_session **session_ptr,
+     if (option->opt_set_mask & NGHTTP2_OPT_MAX_OUTBOUND_ACK) {
+       (*session_ptr)->max_outbound_ack =3D option->max_outbound_ack;
+     }
++
++    if ((option->opt_set_mask & NGHTTP2_OPT_MAX_SETTINGS) &&
++        option->max_settings) {
++      (*session_ptr)->max_settings =3D option->max_settings;
++    }
+   }
+
+   rv =3D nghttp2_hd_deflate_init2(&(*session_ptr)->hd_deflater,
+@@ -5657,6 +5663,16 @@ ssize_t nghttp2_session_mem_recv(nghttp2_session *s=
ession, const uint8_t *in,
+           iframe->max_niv =3D
+               iframe->frame.hd.length / NGHTTP2_FRAME_SETTINGS_ENTRY_LENG=
TH + 1;
+
++          if (iframe->max_niv - 1 > session->max_settings) {
++            rv =3D nghttp2_session_terminate_session_with_reason(
++                session, NGHTTP2_ENHANCE_YOUR_CALM,
++                "SETTINGS: too many setting entries");
++            if (nghttp2_is_fatal(rv)) {
++              return rv;
++            }
++            return (ssize_t)inlen;
++          }
++
+           iframe->iv =3D nghttp2_mem_malloc(mem, sizeof(nghttp2_settings_=
entry) *
+                                                    iframe->max_niv);
+
+@@ -7425,6 +7441,11 @@ static int nghttp2_session_upgrade_internal(nghttp2=
_session *session,
+   if (settings_payloadlen % NGHTTP2_FRAME_SETTINGS_ENTRY_LENGTH) {
+     return NGHTTP2_ERR_INVALID_ARGUMENT;
+   }
++  /* SETTINGS frame contains too many settings */
++  if (settings_payloadlen / NGHTTP2_FRAME_SETTINGS_ENTRY_LENGTH
++        > session->max_settings) {
++    return NGHTTP2_ERR_TOO_MANY_SETTINGS;
++  }
+   rv =3D nghttp2_frame_unpack_settings_payload2(&iv, &niv, settings_paylo=
ad,
+                                               settings_payloadlen, mem);
+   if (rv !=3D 0) {
+diff --git a/lib/nghttp2_session.h b/lib/nghttp2_session.h
+index d20827315..07bfbb6c9 100644
+--- a/lib/nghttp2_session.h
++++ b/lib/nghttp2_session.h
+@@ -267,6 +267,8 @@ struct nghttp2_session {
+   /* The maximum length of header block to send.  Calculated by the
+      same way as nghttp2_hd_deflate_bound() does. */
+   size_t max_send_header_block_length;
++  /* The maximum number of settings accepted per SETTINGS frame. */
++  size_t max_settings;
+   /* Next Stream ID. Made unsigned int to detect >=3D (1 << 31). */
+   uint32_t next_stream_id;
+   /* The last stream ID this session initiated.  For client session,
+diff --git a/tests/main.c b/tests/main.c
+index 41e0b03eb..67eb4a1c2 100644
+--- a/tests/main.c
++++ b/tests/main.c
+@@ -317,6 +317,8 @@ int main() {
+                    test_nghttp2_session_set_local_window_size) ||
+       !CU_add_test(pSuite, "session_cancel_from_before_frame_send",
+                    test_nghttp2_session_cancel_from_before_frame_send) ||
++      !CU_add_test(pSuite, "session_too_many_settings",
++                   test_nghttp2_session_too_many_settings) ||
+       !CU_add_test(pSuite, "session_removed_closed_stream",
+                    test_nghttp2_session_removed_closed_stream) ||
+       !CU_add_test(pSuite, "session_pause_data",
+diff --git a/tests/nghttp2_session_test.c b/tests/nghttp2_session_test.c
+index 6eb8e244d..33ee3ad84 100644
+--- a/tests/nghttp2_session_test.c
++++ b/tests/nghttp2_session_test.c
+@@ -10614,6 +10614,67 @@ void test_nghttp2_session_cancel_from_before_fram=
e_send(void) {
+   nghttp2_session_del(session);
+ }
+
++void test_nghttp2_session_too_many_settings(void) {
++  nghttp2_session *session;
++  nghttp2_option *option;
++  nghttp2_session_callbacks callbacks;
++  nghttp2_frame frame;
++  nghttp2_bufs bufs;
++  nghttp2_buf *buf;
++  ssize_t rv;
++  my_user_data ud;
++  nghttp2_settings_entry iv[3];
++  nghttp2_mem *mem;
++  nghttp2_outbound_item *item;
++
++  mem =3D nghttp2_mem_default();
++  frame_pack_bufs_init(&bufs);
++
++  memset(&callbacks, 0, sizeof(nghttp2_session_callbacks));
++  callbacks.on_frame_recv_callback =3D on_frame_recv_callback;
++  callbacks.send_callback =3D null_send_callback;
++
++  nghttp2_option_new(&option);
++  nghttp2_option_set_max_settings(option, 1);
++
++  nghttp2_session_client_new2(&session, &callbacks, &ud, option);
++
++  CU_ASSERT(1 =3D=3D session->max_settings);
++
++  nghttp2_option_del(option);
++
++  iv[0].settings_id =3D NGHTTP2_SETTINGS_HEADER_TABLE_SIZE;
++  iv[0].value =3D 3000;
++
++  iv[1].settings_id =3D NGHTTP2_SETTINGS_INITIAL_WINDOW_SIZE;
++  iv[1].value =3D 16384;
++
++  nghttp2_frame_settings_init(&frame.settings, NGHTTP2_FLAG_NONE, dup_iv(=
iv, 2),
++                              2);
++
++  rv =3D nghttp2_frame_pack_settings(&bufs, &frame.settings);
++
++  CU_ASSERT(0 =3D=3D rv);
++  CU_ASSERT(nghttp2_bufs_len(&bufs) > 0);
++
++  nghttp2_frame_settings_free(&frame.settings, mem);
++
++  buf =3D &bufs.head->buf;
++  assert(nghttp2_bufs_len(&bufs) =3D=3D nghttp2_buf_len(buf));
++
++  ud.frame_recv_cb_called =3D 0;
++
++  rv =3D nghttp2_session_mem_recv(session, buf->pos, nghttp2_buf_len(buf)=
);
++  CU_ASSERT((ssize_t)nghttp2_buf_len(buf) =3D=3D rv);
++
++  item =3D nghttp2_session_get_next_ob_item(session);
++  CU_ASSERT(NGHTTP2_GOAWAY =3D=3D item->frame.hd.type);
++
++  nghttp2_bufs_reset(&bufs);
++  nghttp2_bufs_free(&bufs);
++  nghttp2_session_del(session);
++}
++
+ static void
+ prepare_session_removed_closed_stream(nghttp2_session *session,
+                                       nghttp2_hd_deflater *deflater) {
+diff --git a/tests/nghttp2_session_test.h b/tests/nghttp2_session_test.h
+index e872c5d0b..818c808d0 100644
+--- a/tests/nghttp2_session_test.h
++++ b/tests/nghttp2_session_test.h
+@@ -156,6 +156,7 @@ void test_nghttp2_session_repeated_priority_change(voi=
d);
+ void test_nghttp2_session_repeated_priority_submission(void);
+ void test_nghttp2_session_set_local_window_size(void);
+ void test_nghttp2_session_cancel_from_before_frame_send(void);
++void test_nghttp2_session_too_many_settings(void);
+ void test_nghttp2_session_removed_closed_stream(void);
+ void test_nghttp2_session_pause_data(void);
+ void test_nghttp2_session_no_closed_streams(void);
diff --git a/meta-networking/recipes-support/nghttp2/nghttp2_1.40.0.bb b/me=
ta-networking/recipes-support/nghttp2/nghttp2_1.40.0.bb
index 9ed8c5642..b497058ca 100644
--- a/meta-networking/recipes-support/nghttp2/nghttp2_1.40.0.bb
+++ b/meta-networking/recipes-support/nghttp2/nghttp2_1.40.0.bb
@@ -10,6 +10,8 @@ UPSTREAM_CHECK_URI =3D "https://github.com/nghttp2/nghttp=
2/releases"
 SRC_URI =3D "\
     https://github.com/nghttp2/nghttp2/releases/download/v${PV}/nghttp2-${=
PV}.tar.xz \
     file://0001-fetch-ocsp-response-use-python3.patch \
+    file://CVE-2020-11080-1.patch \
+    file://CVE-2020-11080-2.patch \
 "
 SRC_URI[md5sum] =3D "8d1a6b96760254e4dd142d7176e8fb7c"
 SRC_URI[sha256sum] =3D "09fc43d428ff237138733c737b29fb1a7e49d49de06d2edbed=
3bc4cdcee69073"
--
2.17.1

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.
