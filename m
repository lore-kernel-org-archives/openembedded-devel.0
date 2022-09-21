Return-Path: <virendra.thakur@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62949ECAAD8
	for <webhook@archiver.kernel.org>; Wed, 21 Sep 2022 10:05:21 +0000 (UTC)
Received: from IND01-MAX-obe.outbound.protection.outlook.com
 (IND01-MAX-obe.outbound.protection.outlook.com [40.107.222.73])
 by mx.groups.io with SMTP id smtpd.web10.4581.1663754712154615856
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Sep 2022 03:05:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=c1xZtgdz;
 spf=pass (domain: kpit.com, ip: 40.107.222.73,
 mailfrom: virendra.thakur@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TKnYhuNnoZrgxFP5PGjLbe19gNDp42ZBJDQUNnrH2geDVC50EGyKOuG6nIFjf2nmiOXj4FL01hEp8M9mR4g0JgN16ugH+Lfbqj/3gKhy52sG/JFogHXSTEyaswmrKXtLq5mbo6ObuJxHlcq05TrIhwMx3JtvzoHB25b8CK3+gJXhn09MdetWbtfrIqhPIy/mOl9dGYPAbzrracLFUkqlqLGCaLiWbyt37dp7nG02a17kBXP+iokFMlBo2KjG8jRTaJl1IcpmLDMM5CG3QkRYx6GTZqIH7YRoFi+Di34Rof6ltb8RY3nsnyeLhMYTDOIz6jZ+5EroMP7958kf2bOv/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yE8FIMX2JvIy6ctzn3r7fwWfU6VwNC8qCasup7MDMzo=;
 b=CW0S42Ew5A1LXC40iJQhE1MGceJWOnJU8DA2ygO3c+QYgEqtmby+K9CnJCeG8+z3QNDv67mypI2zLmqGLnErniwTlhAKO88e8rkRNplAtCwAD0qxruzbF2cHiUvDdMXvzNOeeo7ZoeX2CJzPDpBgbkCHz1Q8VgwUq6OikGpVCwav1PRHYTnJtQZb8D/fJ0DkayoOK8/7gcDRlBUf85W9KjGJSUMXBMIuv5p7i+LCnKhvOlYkoDmjnGUrxqScwh1v1CebVyG3t3E50F//40jzZbakVJJf0dPiDNEmZyNjqdd7DQXhYMgFvoKZG0ZZiFpZP8rG2gCxxx3YcuOypPZ7HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yE8FIMX2JvIy6ctzn3r7fwWfU6VwNC8qCasup7MDMzo=;
 b=c1xZtgdzCAExZkg1Zu0O0nKTtV84rnsBAOZttqU7+UC3Rt0Hz9X62JpdwEyF1wOm7Ul52zaGegds57TiBGayLWpx0Hun8st1s31qu8D+wbsFJcp8tzMYEWlU7XjLMXCfzPZjmHtCwR8ASx/nXKNhNvLNIat48EeeJr8iY/8bbtQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kpit.com;
Received: from MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:3::12)
 by MAXPR01MB4423.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.16; Wed, 21 Sep
 2022 10:05:04 +0000
Received: from MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::2427:1977:88:b63b]) by MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::2427:1977:88:b63b%3]) with mapi id 15.20.5654.016; Wed, 21 Sep 2022
 10:05:04 +0000
From: Virendra Thakur <virendra.thakur@kpit.com>
To: openembedded-devel@lists.openembedded.org
Cc: akuster808@gmail.com,
	Virendra Thakur <virendrak@kpit.com>
Subject: [meta-networking][dunfell][PATCH ] dnsmasq: Fix CVE-2022-0934
Date: Wed, 21 Sep 2022 15:34:45 +0530
Message-Id: <20220921100445.12649-1-virendra.thakur@kpit.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: PN3PR01CA0125.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:96::11) To MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:3::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAXPR01MB4327:EE_|MAXPR01MB4423:EE_
X-MS-Office365-Filtering-Correlation-Id: e433fefd-8c38-4403-bbf9-08da9bb8c13d
Content-Transfer-Encoding: quoted-printable
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	MmaFtt8T6Jo8A86qXo5dB6K3sSDrN5BbVHiDQEmUEhHR/BtJ3Pshfl6OhWXkailOixTpq35Wo9A/3MNuyrVZevAIIOcP1QV4TaaGnhWrBqfhFHtaJrykUPZr6pZQZwjzfV06j7uxwmbykb82nVFJD2OYmcDO2ZSACZOeU4tHse9d21BmppoC9obudmbBKxr9wWN7e6mnDKJpkECwCVE3OGl25rvIb/5YxBuMF3SsZ1Qw6Z/PVSKu5YjtUuaBEhp31MqUI7Id9zf9i3kBgisrB4y9WqTEwlg9TvRD3Cjn4SQio/c2kY6AFBzLQYMzEXaT3kkS7dVUqcqJxR0lufZISyX3sCdIyv2tZrsqr7k3iCsw+x1koq5EPjUg24p6UJkD5JyIlTPQcwRhCAGZivOu3481QVJAmMmUlaFx9oWa9/Qnalq7xzWEcEEoUWynjtEYA4bwzQa/6Xv0gZ2wflw3wQVMtidZa1cB9GKYh2d3SDOwSP2JFjdaotqFA79B7RzF92SOVLwNQ8uAo7F+gL5A2Hq/Qulc1dxsdDs2uwECNf2vrGWLAMMirbY5TgxIqVDvjwVfVnc/vElycFnpzNTvjU3+IfOu5AAjjKWkHJ1EJCPo1+VhtArORSC2RnoDQIQUGoVJqBlXaze2n2MO7F6JmcF92yo5jm9/wUOQgre2tkin1LWNLDelGy4Sycal2ATm+HAfucZTb7eVVsbx2ZADMn42vIoAGacpLhw7gkZB+5QVH78eu2KJWCOdNQRPrbAoROHP8tETfXQG7y8IAX6GQrTcEzs8vZjN1zNHVBueka0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(396003)(346002)(136003)(39860400002)(376002)(451199015)(186003)(44832011)(5660300002)(6916009)(8936002)(36756003)(66556008)(86362001)(316002)(66476007)(66574015)(4326008)(8676002)(66946007)(2616005)(1076003)(83380400001)(966005)(107886003)(6486002)(6506007)(478600001)(38350700002)(38100700002)(52116002)(6512007)(26005)(41300700001)(6666004)(2906002)(84970400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?IeUUMUc/rENg2s4NRt3jp3TSqYO28TmBXrDjfniNw/CCte7m0wlsj6+3Llmq?=
 =?us-ascii?Q?cz54N6E2HLvZO2hn5GMz3b2jjwtQRPKtH0AASPO5JHpMQFBIu0QIkX5VvpvU?=
 =?us-ascii?Q?0OBhI38WLafgPdUUlVh6vyjmE+qfNlE00Svf2WGxf/3n5FeWXrPcdW6Azvbh?=
 =?us-ascii?Q?4iuBjyD4C0ebDGM/8ERIXsmu/SsgDE+woATH8NxkBLT0OeHTQfaKkqhKW0ZX?=
 =?us-ascii?Q?ZI6HUaZux7XpMDvFJjJvuDStEI+M29Y/WDUdxhLcJUS9hpSF3QT1/7vUZZXa?=
 =?us-ascii?Q?IFC86/br0OclD/8jlIE6uGw1biDWLyAgvIlVxl9f37v3APvOEDN0M7aJFYgW?=
 =?us-ascii?Q?lxjhCsn3dsoy5vUFhZJrDVCwFDYzKn0fqGr6quiXPKGdJYy+semynBIRlcSt?=
 =?us-ascii?Q?AkuysVRnMVsYfhjUYV5GjT9myjdm6UGMIOlpIqQMEPlVgqLVstz43YPb+XHD?=
 =?us-ascii?Q?hejmdXI7TsqIB4tfdLSUK2N2Kco2iUHGutAOateXxw3U3enZBkMt26957xdz?=
 =?us-ascii?Q?HEC2CdMOkrW2XBSPqgW6QzXsfRr0bl8n1x2tfMr7ssiOyU8Cp+zK7e7hYbmR?=
 =?us-ascii?Q?H/vjcu27o9PzJtEnbT6sNPGDkk7Xt+CR8sSz4rIhUNErPXhBOLqX6GHN4b6d?=
 =?us-ascii?Q?TwbPmHVDv4PSUI36kiRpJjOVuT+2uImZ/yKcn+1RQguJ1s/yyaVxyZLpYcHq?=
 =?us-ascii?Q?tMCFbCxm6kiW5whSa8R7r/ntd5Zb6615IV/79G697VJMBVvqr1vFBWcf1mrB?=
 =?us-ascii?Q?TVEsNIGGm34zkCM7eusFYBxZ5xCIf1kd3gIjNXk0lVayH8r40rChc3RAM/9c?=
 =?us-ascii?Q?MZQNzaca3t22mViQzQveXj59acCK4nJt17iT4Pl/s3twf1EX7O62kakal3+C?=
 =?us-ascii?Q?XohPxBgm9A3vWUwPkwKD9fkecTSu2NQ84tc9zvvL0KRQd9/rU5RcdFXXdQY9?=
 =?us-ascii?Q?vmVKz2A98Y8SAEScMS/1GvH5T4HpuXfNy9FzgbD51WnBh6WB7qi6gKlfIejz?=
 =?us-ascii?Q?r3cVJcPHC6AkDAWYhP2d6fDz9ArzBR0kqftTBKcSnrOnQgPVdCxCAc7LNThs?=
 =?us-ascii?Q?IrspyLKj6VoEoLB0kjH/cLrEodg4MD+oEkidm+OaV+U0VVot9UlJ0DH1DsED?=
 =?us-ascii?Q?pcivKfDhk7zubxboCnjpMMCjzQ9U6cZIHsGxRXlRg8AVycb1r0Kkzp62i+Ew?=
 =?us-ascii?Q?T/ETWh6fiJvni06isvKklisubDkkYtBmkrDCq+Z0RK2valmbmmRmmdo/m1eE?=
 =?us-ascii?Q?fSkQjOKEzrvkFXbFz+IykmIPrzD1S6L9U6jMIG+7LusPtcHUMMz7wG8YC2Ep?=
 =?us-ascii?Q?4R9l9YegSCO5wbAMGRx5jSJaozXRtXe6Uxz5iVRHticqUFOFYRqfhRNT9INi?=
 =?us-ascii?Q?j46vI32veZkZEoarGJyNGy374ai9aQkIa/ZSy85FsR0B/+TiJjF4QKVIua81?=
 =?us-ascii?Q?dLJP4HJ6UMtNvTpJtu1VjO5iM6w9Vt+LL6bGSIeMWx6qyD2jWR4T9rsrh6nB?=
 =?us-ascii?Q?Dn4iGtTVoJ+EfcilS47sZz9VrzCPVduWPUiadVk6NqNEDyL4pQKhQ5kmhBFy?=
 =?us-ascii?Q?gHEdMk0N3t3K96uuv0hChhRmkSxfIxys6Fp1nBO0?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e433fefd-8c38-4403-bbf9-08da9bb8c13d
X-MS-Exchange-CrossTenant-AuthSource: MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2022 10:05:04.6401
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 0pYnnt2tIUO0CpPir3ezw3XamVYRDwT9GufVfF0tQXWENAooCtuTObT0M8drj3SXYbX4PCoRJi/0Oa3sEhhpmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAXPR01MB4423
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Sep 2022 10:05:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98913

From: Virendra Thakur <virendrak@kpit.com>

Add patch to fix CVE-2022-0934

Link: https://thekelleys.org.uk/gitweb/?p=3Ddnsmasq.git;a=3Dpatch;h=3D03345=
ecefeb0d82e3c3a4c28f27c3554f0611b39

Signed-off-by: Virendra Thakur <virendrak@kpit.com>
---
 .../recipes-support/dnsmasq/dnsmasq_2.81.bb   |   1 +
 .../dnsmasq/files/CVE-2022-0934.patch         | 188 ++++++++++++++++++
 2 files changed, 189 insertions(+)
 create mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-2022-=
0934.patch

diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.81.bb b/meta=
-networking/recipes-support/dnsmasq/dnsmasq_2.81.bb
index 2fb389915..8db57edb7 100644
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.81.bb
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.81.bb
@@ -11,4 +11,5 @@ SRC_URI +=3D "\
     file://CVE-2020-25686-1.patch \
     file://CVE-2020-25686-2.patch \
     file://CVE-2021-3448.patch \
+    file://CVE-2022-0934.patch \
 "
diff --git a/meta-networking/recipes-support/dnsmasq/files/CVE-2022-0934.pa=
tch b/meta-networking/recipes-support/dnsmasq/files/CVE-2022-0934.patch
new file mode 100644
index 000000000..f14fc358b
--- /dev/null
+++ b/meta-networking/recipes-support/dnsmasq/files/CVE-2022-0934.patch
@@ -0,0 +1,188 @@
+From 03345ecefeb0d82e3c3a4c28f27c3554f0611b39 Mon Sep 17 00:00:00 2001
+From: Simon Kelley <simon@thekelleys.org.uk>
+Date: Thu, 31 Mar 2022 21:35:20 +0100
+Subject: [PATCH] Fix write-after-free error in DHCPv6 code. CVE-2022-0934
+ refers.
+
+Upstream-Status: Backport [https://thekelleys.org.uk/gitweb/?p=3Ddnsmasq.g=
it;a=3Dpatch;h=3D03345ecefeb0d82e3c3a4c28f27c3554f0611b39]
+CVE: CVE-2022-0934
+Comment: Hunk from CHANGELOG and rfc3315.c are refresh base on dnsmasq 2.8=
1 version
+Signed-off-by: Virendra Thakur <virendra.thakur@kpit.com>
+---
+Index: dnsmasq-2.81/CHANGELOG
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- dnsmasq-2.81.orig/CHANGELOG
++++ dnsmasq-2.81/CHANGELOG
+@@ -88,6 +88,9 @@ version 2.81
+
+       Add --script-on-renewal option.
+
++      Fix write-after-free error in DHCPv6 server code.
++      CVE-2022-0934 refers.
++
+
+ version 2.80
+       Add support for RFC 4039 DHCP rapid commit. Thanks to Ashram Method
+Index: dnsmasq-2.81/src/rfc3315.c
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- dnsmasq-2.81.orig/src/rfc3315.c
++++ dnsmasq-2.81/src/rfc3315.c
+@@ -33,9 +33,9 @@ struct state {
+   unsigned int mac_len, mac_type;
+ };
+
+-static int dhcp6_maybe_relay(struct state *state, void *inbuff, size_t sz=
,
++static int dhcp6_maybe_relay(struct state *state, unsigned char *inbuff, =
size_t sz,
+                            struct in6_addr *client_addr, int is_unicast, =
time_t now);
+-static int dhcp6_no_relay(struct state *state, int msg_type, void *inbuff=
, size_t sz, int is_unicast, time_t now);
++static int dhcp6_no_relay(struct state *state, int msg_type, unsigned cha=
r *inbuff, size_t sz, int is_unicast, time_t now);
+ static void log6_opts(int nest, unsigned int xid, void *start_opts, void =
*end_opts);
+ static void log6_packet(struct state *state, char *type, struct in6_addr =
*addr, char *string);
+ static void log6_quiet(struct state *state, char *type, struct in6_addr *=
addr, char *string);
+@@ -104,12 +104,12 @@ unsigned short dhcp6_reply(struct dhcp_c
+ }
+
+ /* This cost me blood to write, it will probably cost you blood to unders=
tand - srk. */
+-static int dhcp6_maybe_relay(struct state *state, void *inbuff, size_t sz=
,
++static int dhcp6_maybe_relay(struct state *state, unsigned char *inbuff, =
size_t sz,
+                            struct in6_addr *client_addr, int is_unicast, =
time_t now)
+ {
+   void *end =3D inbuff + sz;
+   void *opts =3D inbuff + 34;
+-  int msg_type =3D *((unsigned char *)inbuff);
++  int msg_type =3D *inbuff;
+   unsigned char *outmsgtypep;
+   void *opt;
+   struct dhcp_vendor *vendor;
+@@ -259,15 +259,15 @@ static int dhcp6_maybe_relay(struct stat
+   return 1;
+ }
+
+-static int dhcp6_no_relay(struct state *state, int msg_type, void *inbuff=
, size_t sz, int is_unicast, time_t now)
++static int dhcp6_no_relay(struct state *state, int msg_type, unsigned cha=
r *inbuff, size_t sz, int is_unicast, time_t now)
+ {
+   void *opt;
+-  int i, o, o1, start_opts;
++  int i, o, o1, start_opts, start_msg;
+   struct dhcp_opt *opt_cfg;
+   struct dhcp_netid *tagif;
+   struct dhcp_config *config =3D NULL;
+   struct dhcp_netid known_id, iface_id, v6_id;
+-  unsigned char *outmsgtypep;
++  unsigned char outmsgtype;
+   struct dhcp_vendor *vendor;
+   struct dhcp_context *context_tmp;
+   struct dhcp_mac *mac_opt;
+@@ -296,12 +296,13 @@ static int dhcp6_no_relay(struct state *
+   v6_id.next =3D state->tags;
+   state->tags =3D &v6_id;
+
+-  /* copy over transaction-id, and save pointer to message type */
+-  if (!(outmsgtypep =3D put_opt6(inbuff, 4)))
++  start_msg =3D save_counter(-1);
++  /* copy over transaction-id */
++  if (!put_opt6(inbuff, 4))
+     return 0;
+   start_opts =3D save_counter(-1);
+-  state->xid =3D outmsgtypep[3] | outmsgtypep[2] << 8 | outmsgtypep[1] <<=
 16;
+-
++  state->xid =3D inbuff[3] | inbuff[2] << 8 | inbuff[1] << 16;
++
+   /* We're going to be linking tags from all context we use.
+      mark them as unused so we don't link one twice and break the list */
+   for (context_tmp =3D state->context; context_tmp; context_tmp =3D conte=
xt_tmp->current)
+@@ -347,7 +348,7 @@ static int dhcp6_no_relay(struct state *
+       (msg_type =3D=3D DHCP6REQUEST || msg_type =3D=3D DHCP6RENEW || msg_=
type =3D=3D DHCP6RELEASE || msg_type =3D=3D DHCP6DECLINE))
+
+     {
+-      *outmsgtypep =3D DHCP6REPLY;
++      outmsgtype =3D DHCP6REPLY;
+       o1 =3D new_opt6(OPTION6_STATUS_CODE);
+       put_opt6_short(DHCP6USEMULTI);
+       put_opt6_string("Use multicast");
+@@ -619,11 +620,11 @@ static int dhcp6_no_relay(struct state *
+       struct dhcp_netid *solicit_tags;
+       struct dhcp_context *c;
+
+-      *outmsgtypep =3D DHCP6ADVERTISE;
++      outmsgtype =3D DHCP6ADVERTISE;
+
+       if (opt6_find(state->packet_options, state->end, OPTION6_RAPID_COMM=
IT, 0))
+         {
+-          *outmsgtypep =3D DHCP6REPLY;
++          outmsgtype =3D DHCP6REPLY;
+           state->lease_allocate =3D 1;
+           o =3D new_opt6(OPTION6_RAPID_COMMIT);
+           end_opt6(o);
+@@ -809,7 +810,7 @@ static int dhcp6_no_relay(struct state *
+       int start =3D save_counter(-1);
+
+       /* set reply message type */
+-      *outmsgtypep =3D DHCP6REPLY;
++      outmsgtype =3D DHCP6REPLY;
+       state->lease_allocate =3D 1;
+
+       log6_quiet(state, "DHCPREQUEST", NULL, ignore ? _("ignored") : NULL=
);
+@@ -921,7 +922,7 @@ static int dhcp6_no_relay(struct state *
+     case DHCP6RENEW:
+       {
+       /* set reply message type */
+-      *outmsgtypep =3D DHCP6REPLY;
++      outmsgtype =3D DHCP6REPLY;
+
+       log6_quiet(state, "DHCPRENEW", NULL, NULL);
+
+@@ -1033,7 +1034,7 @@ static int dhcp6_no_relay(struct state *
+       int good_addr =3D 0;
+
+       /* set reply message type */
+-      *outmsgtypep =3D DHCP6REPLY;
++      outmsgtype =3D DHCP6REPLY;
+
+       log6_quiet(state, "DHCPCONFIRM", NULL, NULL);
+
+@@ -1097,7 +1098,7 @@ static int dhcp6_no_relay(struct state *
+       log6_quiet(state, "DHCPINFORMATION-REQUEST", NULL, ignore ? _("igno=
red") : state->hostname);
+       if (ignore)
+         return 0;
+-      *outmsgtypep =3D DHCP6REPLY;
++      outmsgtype =3D DHCP6REPLY;
+       tagif =3D add_options(state, 1);
+       break;
+       }
+@@ -1106,7 +1107,7 @@ static int dhcp6_no_relay(struct state *
+     case DHCP6RELEASE:
+       {
+       /* set reply message type */
+-      *outmsgtypep =3D DHCP6REPLY;
++      outmsgtype =3D DHCP6REPLY;
+
+       log6_quiet(state, "DHCPRELEASE", NULL, NULL);
+
+@@ -1171,7 +1172,7 @@ static int dhcp6_no_relay(struct state *
+     case DHCP6DECLINE:
+       {
+       /* set reply message type */
+-      *outmsgtypep =3D DHCP6REPLY;
++      outmsgtype =3D DHCP6REPLY;
+
+       log6_quiet(state, "DHCPDECLINE", NULL, NULL);
+
+@@ -1251,10 +1252,15 @@ static int dhcp6_no_relay(struct state *
+       }
+
+     }
+-
++
++  /* Fill in the message type. Note that we store the offset,
++     not a direct pointer, since the packet memory may have been
++     reallocated. */
++  ((unsigned char *)(daemon->outpacket.iov_base))[start_msg] =3D outmsgty=
pe;
++
+   log_tags(tagif, state->xid);
+   log6_opts(0, state->xid, daemon->outpacket.iov_base + start_opts, daemo=
n->outpacket.iov_base + save_counter(-1));
+-
++
+   return 1;
+
+ }
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

