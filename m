Return-Path: <tugrul.kukul@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39FB8C5AC7A
	for <webhook@archiver.kernel.org>; Fri,  7 Aug 2026 07:20:36 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37328.1786087232799350636
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Aug 2026 00:20:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=L1M+fdCg;
 spf=pass (domain: est.tech, ip: 52.101.69.41, mailfrom: tugrul.kukul@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LxVrNFQhxVTfpahnuyb6XznoT4CXsuCFF6twtmNvd7i0/GahL8/b4uE0lQxs75FPadq4eKApcyAcxO7nIsZzvS8b3zSGOslJi1n6RLFOZnsFCHbr7noLXMgZbcIgIKGApCBo2Cy03iictRdAssa0a0yPsdrqUvQoQfg766marbWynTx46vgYYTfxJ/kxHjHVRzLHHdS68YQvhH3oZDE8IfYvvvX/24jzsqqnsMTnLKF8wayjIEoP2xfpGh1Afz6Z15dDiUFujj9C0Q6h9Yj48ljikJxk5owxXBk0jTeBK2Z+/SeZwCQfFkvsQ1KOdTl48GVzQcxPzNluDMrQuBbbig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PJO8RhLtdhw2M+CDaxu/pvTfNin+2pU7GMF7y2YvTkM=;
 b=cwX3+EOJ1vGs5TpGpuazCeb3gnm54BL7NmihiZ3DJcfFdr7avVJr3IOusOuGHvhv5N1iP3bZIbVjrCl/9sO47tOzAon8zuKLu3YkimA/O3PA/IflYHB2DzPE86ZQ5diVyzg3yos9mvBmnUx93E38oSici9ndt217iMwhR2EjISc5cF4tFJThxcz055bBRfGe25Ml4bPzybWja3azFf50ds00gGhTU4Xkwiy8TlYmqDgYXWBTPExWH1yJLmVzTkqRwn3GsRWDxm/X8LZ+nEd4lT75GIh1Ahz+RqBnynM4NovlciLxy4sZwr4+7TWqLGPpkY/xZjU4SWjcatqLy0g0Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PJO8RhLtdhw2M+CDaxu/pvTfNin+2pU7GMF7y2YvTkM=;
 b=L1M+fdCgCv7gAeJbWpUBolxbeON6qUHgZDwRMMJQHoa7JX2GZ8qqwVi6bfk1OB+PPMFvSUh9tBtUW/k4+KSmHyv+znrU2qHe4hhGqhGq1AODTTdB2saZ7IWorVaXJ5u9bDeGfXYjcE+Oyn5DGVbaaVY5/64DmpWT+DAlM2n8IFImjHRsnk3sMj/AnPVJlD0r/LyGMrTDFF3qm0WZnCJjBpFZhBwqkuWIQT8P2g8jAisPCauUzdneNyxfMtdXyVQicw+0TaT3Tj7JMNkBn6QzXVpKKxbHWqpPqzEkQjBqihklINplXyE8gp8CS5kac5Iy519co+z0HZ/jfgfPqE1TUA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from PR3P189MB0970.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:48::11)
 by FRWP189MB3325.EURP189.PROD.OUTLOOK.COM (2603:10a6:d10:184::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.10; Fri, 7 Aug
 2026 07:20:29 +0000
Received: from PR3P189MB0970.EURP189.PROD.OUTLOOK.COM
 ([fe80::c5fd:8284:f8f7:f29c]) by PR3P189MB0970.EURP189.PROD.OUTLOOK.COM
 ([fe80::c5fd:8284:f8f7:f29c%3]) with mapi id 15.21.0315.006; Fri, 7 Aug 2026
 07:20:29 +0000
From: tugrul.kukul@est.tech
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][wrynose][PATCH v2] jq: fix CVE-2026-39956
Date: Fri,  7 Aug 2026 09:20:27 +0200
Message-ID: <20260807072027.3277-1-tugrul.kukul@est.tech>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DB8PR06CA0040.eurprd06.prod.outlook.com
 (2603:10a6:10:120::14) To PR3P189MB0970.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:48::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PR3P189MB0970:EE_|FRWP189MB3325:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e711c7e-fad5-4a3c-79fa-08def4545c1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|10067099003|56012099006|11063799006|6133799003|3023799007|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	uXm/mnsG3dB00g4rOKGN7hpKIVy52DTc916P447yYYxg67LyNdI2tCiLvj/jFcmd7jIKmGlVAxuv9VAChCjFIjhASUo6dRQ7kKRmi/DkPni2C8OYg0kxNqVA9B0r3rBqZj4IiC+PG2BzjNSDEiL87d7pV+ZaRbxd1XFWXzUrrQzmp0Wex9+a9B6+ooXMkC3UxWtpkK2Me5vXoHngUWdEklg1VX+JQ8GoBD1M5IoG/WJOjMf/H9rjiPtovYb36ZpZwXe0cM08VX6mJMGWLwOP0cztwXx8hVksfdpwNQPdBBOF8Ngk3Ks1qGIvNnCjC406aNUoMCmY1TFp7CziBJXD6kokK3d/ovC8wmpc4OZ23oPz6rYDfuI1HNwdx0Ha+/3v6Sj4IC9hHnyXBDbxRRZSe86uqI0mirQejU4mNyCfEVeJW5ESgEIeruWuDZKKXG4tjmFbE1m7Pyq+pR6AfSIrhtZDwsZRdlqERtVuMxd9uG4XXbtjHyGW+a8YQABRuJ1jPPuGqDxCKWmJ+IWd6+mkb196BPgDXLzC7em0FytPwlm4151wyPL8/etO6czjeBt6REHG1leGDnoyzahtMhgpSL8otK/pbuOFh0L4DFuH7ps=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3P189MB0970.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(10067099003)(56012099006)(11063799006)(6133799003)(3023799007)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?vtfjCgOsFWveAXliAa+0TMCWxbGBA2KeyWIYvXyqpOeeYn2ZNVxM8WXb2eHQ?=
 =?us-ascii?Q?YIUehGHQUdXkeXOcyGSKcN/UJrG9jNc4x+WNRAGSWcE5/MV6dgewpYXJG7Qb?=
 =?us-ascii?Q?CcMrlohkJ1WAE0VitqCzBqlM2wjD03Yt9XbYTKZz/a+XsXgN5XQeyZ+1JV3O?=
 =?us-ascii?Q?TEDwXtmamnBrjbdgr7eryey68EUW3+Uop34HI+0ucU2gCNTYXAWElkAIkMMe?=
 =?us-ascii?Q?QOi4RV1ISf1Zo6Ka81TgqC4L1oLAlkxhS8kFvz/FTvhvqgDqLLbgB7Ao250O?=
 =?us-ascii?Q?Uz9lg4phkOJCHXeza0kcABLiLKXnrOfypojXV+YcCnNITBpM8mk+rKqSQBYW?=
 =?us-ascii?Q?s3sgVQC/7ldLHThSwMnVHaVh8wJlIETyeylfb2j+vXh8Osy69Gliblwdg0v/?=
 =?us-ascii?Q?j28+sQNLc9D80LYJApB5p2cb6dru1y+5+0zBm+kHyNIjcC85jEvVGfx4kH41?=
 =?us-ascii?Q?gxqI51PMzAjvSNvddVr2dBYZZd2JjRECDV4yxiS8QZu4nnDvkX1OVNdU0qu+?=
 =?us-ascii?Q?cRFBsiAdHDJWzEt7yfr2XBneQnO/nzLHnuypz29qo6mjO7URo6IQ6Qpnawkv?=
 =?us-ascii?Q?aigGJPUGffdQctYciK1IjxNtbvc6MOiGQZQCyFL0rMFuk1WjK9ZpSSUaCEHw?=
 =?us-ascii?Q?6IW8M1vgdPMxRt8BOwOG6Koz7vSMxDi4FnS2jYll4jAiQhJ4D9ZKeg6mnOXT?=
 =?us-ascii?Q?llZbmn3snKMD/nUIFIsd885XpuVMGElAS5D9uvdacHwJoiVccZuyZDZcT2j3?=
 =?us-ascii?Q?N3gR4lUkedlvbWlXxfjAbcAsIEM/xXoMTSkSFz/mKXeH6k4n863YwKvLXZix?=
 =?us-ascii?Q?KDwWVkLJow/d1Lo9j+UdFFDfECemi9c0dZGfnGfz99J4IwmsbSB3XuHzBWyv?=
 =?us-ascii?Q?ZoqrkzHFSscyKUhA0r3k3JZiWAomq1FVS1GZ2Lr3Z3PsodsWhTkZ+OkIdiw3?=
 =?us-ascii?Q?yK76wkj0/J9Sxg78X1wVT6pGDCvc8Fpt7inF5098U9IpEz1vEzyHgQ9gXcKx?=
 =?us-ascii?Q?qEQQo/VdFy8N9UfbvV+ZKW2WHnZNxZjNXWiu2j74VNtKdILrg7gso/iOuqnU?=
 =?us-ascii?Q?1OsXIeoxEDFmhgZH1CfAxKM3fmWjn5RRGhc0npdNQW1KbCloUIfNYk+smVfp?=
 =?us-ascii?Q?dz+dekDbUdpR9tFwCKudTFPSIKAgcPr5xeSMUrNulQZaaJOPZeBUOHJe73oE?=
 =?us-ascii?Q?c99p+zHBPuyxWqoJ1XRoLMDpbujrk9AFK70JGY5dQD5V1hL48PeOvbQag+Cw?=
 =?us-ascii?Q?aEwJ/XBzBjjRFV9ibTADKOJHnQ7X+0SF7DZ9sbDiL17fzHe71tFFyVLv6Vsd?=
 =?us-ascii?Q?iXJLh1wR6ci0joBq+cyivL4MnQ50k0gVTJFmPyi0zBqJolEwzSc5594Cjf9c?=
 =?us-ascii?Q?GXgrkJZXVykmJUPY/tZx7RqwNklkCPYLhsdvAOvZRpQV2gfR9/qBtee7APBw?=
 =?us-ascii?Q?V3jxfwb6YtXugxjgAmIBOhdD3uGehe+kl7kPSaH3DZxTY5ZyICVLKq157cnS?=
 =?us-ascii?Q?jmR5iXwkJomaTV3bvfuFFLWfiSa8nhnQfjqUJrTD5iD4CYewrgkwgxiFhu5t?=
 =?us-ascii?Q?XOkwaXew+867MJIehdqtsA10fW5u1bb0322LEVartudC5v70694r0zJWYG7z?=
 =?us-ascii?Q?HrCT12USYyS47Ec1/uo6dU5Nk0FjIGTyjTxAm5GO0UQknG1gV7G2uZvLA+8Q?=
 =?us-ascii?Q?ATL3Ma2mrwxn5bA27I/Tyg16zV3atrzsz1QczyQFHNvJ9JQ+NCTN1NSCXwSR?=
 =?us-ascii?Q?IXTNebY8aA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e711c7e-fad5-4a3c-79fa-08def4545c1d
X-MS-Exchange-CrossTenant-AuthSource: PR3P189MB0970.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 07:20:29.4000
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MWoHmrA6jxR+kyN4jQinE6Q8darSvVXDV0xtaJz5eNOOxj/0Gt2MDGMBN8Xh588dOotRZbnvLtf/CIW1HyJMuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWP189MB3325
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Aug 2026 07:20:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128864

From: Tugrul Kukul <tugrul.kukul@est.tech>

Backport patch to fix CVE-2026-39956.

References:
  https://nvd.nist.gov/vuln/detail/CVE-2026-39956
  https://www.cve.org/CVERecord?id=3DCVE-2026-39956
  https://security-tracker.debian.org/tracker/CVE-2026-39956
  https://osv.dev/list?q=3DCVE-2026-39956

Upstream fix:
  https://github.com/jqlang/jq/commit/fdf8ef0f0810e3d365cdd5160de43db46f57e=
d03 [nvd]

Tested with ptest:
Before: PASSED: 7, FAILED: 0, SKIPPED: 0
After: PASSED: 7, FAILED: 0, SKIPPED: 0

Signed-off-by: Tugrul Kukul <tugrul.kukul@est.tech>
---
- v2: Updated missing CVE tag and Signed-off-by

 .../jq/jq/CVE-2026-39956.patch                | 55 +++++++++++++++++++
 meta-oe/recipes-devtools/jq/jq_1.8.1.bb       |  1 +
 2 files changed, 56 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-39956.patch

diff --git a/meta-oe/recipes-devtools/jq/jq/CVE-2026-39956.patch b/meta-oe/=
recipes-devtools/jq/jq/CVE-2026-39956.patch
new file mode 100644
index 0000000000..85b4a0803d
--- /dev/null
+++ b/meta-oe/recipes-devtools/jq/jq/CVE-2026-39956.patch
@@ -0,0 +1,55 @@
+From 8e7a4a3c01da36e0b9509b0e93a005649318e0f7 Mon Sep 17 00:00:00 2001
+From: tlsbollei <170938166+tlsbollei@users.noreply.github.com>
+Date: Wed, 8 Apr 2026 21:43:46 +0200
+Subject: [PATCH] Add runtime type checks to f_string_indexes
+
+This fixes CVE-2026-39956.
+
+CVE: CVE-2026-39956
+Upstream-Status: Backport [https://github.com/jqlang/jq/commit/fdf8ef0f081=
0e3d365cdd5160de43db46f57ed03]
+
+Signed-off-by: Tugrul Kukul <tugrul.kukul@est.tech>
+---
+ src/builtin.c | 8 ++++++++
+ tests/jq.test | 9 +++++++++
+ 2 files changed, 17 insertions(+)
+
+diff --git a/src/builtin.c b/src/builtin.c
+index 52fe77c..ac56f9f 100644
+--- a/src/builtin.c
++++ b/src/builtin.c
+@@ -1286,6 +1286,14 @@ static jv f_string_explode(jq_state *jq, jv a) {
+ }
+=20
+ static jv f_string_indexes(jq_state *jq, jv a, jv b) {
++  if (jv_get_kind(a) !=3D JV_KIND_STRING) {
++    jv_free(b);
++    return type_error(a, "cannot be searched, as it is not a string");
++  }
++  if (jv_get_kind(b) !=3D JV_KIND_STRING) {
++    jv_free(a);
++    return type_error(b, "is not a string");
++  }
+   return jv_string_indexes(a, b);
+ }
+=20
+diff --git a/tests/jq.test b/tests/jq.test
+index 4ecf72f..07aa0cf 100644
+--- a/tests/jq.test
++++ b/tests/jq.test
+@@ -1520,6 +1520,15 @@ split("")
+ "xababababax"
+ [1,7,[1,3,5,7]]
+=20
++# _strindices is used by indices/1 but is callable
++try _strindices("abc") catch .
++123
++"number (123) cannot be searched, as it is not a string"
++
++try _strindices(123) catch .
++"abc"
++"number (123) is not a string"
++
+ # trim
+ # \u000b is vertical tab (\v not supported by json)
+ map(trim), map(ltrim), map(rtrim)
diff --git a/meta-oe/recipes-devtools/jq/jq_1.8.1.bb b/meta-oe/recipes-devt=
ools/jq/jq_1.8.1.bb
index b213e21c57..5d2a1be398 100644
--- a/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
+++ b/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
@@ -27,6 +27,7 @@ SRC_URI =3D "git://github.com/jqlang/jq.git;protocol=3Dht=
tps;branch=3Dmaster;tag=3Djq-${
            file://CVE-2026-43895.patch \
            file://CVE-2026-49839.patch \
            file://CVE-2026-54679.patch \
+           file://CVE-2026-39956.patch \
            "
=20
 inherit autotools ptest

