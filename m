Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.1])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7491.1793264794375212497
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Oct 2026 02:06:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=qFK94r/4;
 spf=pass (domain: est.tech, ip: 40.107.130.1, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oOdU6ptfQ8RLWlCnHdwNAPiZUMlkNtqIpcoseNAXgU3fJ4lvC5shC9Aeg7HJ48ZcNAqi1A1x0UJI3Z0wjT+hIkAfAcm5oARXo3vUnlcWAF54Eqv/kNQ9U37j9AW3Wm8U4nf2cVH+37/unOemxxMMDcf4MLEsY0WwCQeBGP7kWU3ttnzTKducURFBwxrLOxNzFcaij6M0wt3k151VBs1lP8xgjXThZXAO6CpjZrK++LofvowagsdTJBsCK6bGbOk44cBRhbJth4ImbvUw5lGVBuz6BGSQlWtS6rbpu39vwFTuJ5vsZzC9sUOnk1f/I6trWvcPNYOdTluct1yBmc5ffQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uQs8qjTUjyWsa3fwywe0TD8RsL7AHJfJWOypqKu3apY=;
 b=sNKhwJsSpJ/17M3jFddTDw+37VKk/lATgwz1ydTFsjAT4mH4vji3j+Qkw0C/h8iFEWfRqu3lASkbEgJgmRXVL3n0q6aQJQx0bb8r8Rtqdea6zPZIv3zaJbHj9FLqr2aZ7ACt7hBFT2iqJSeZT1nLqa+MhpR/99cR8kGbkon8UlwpBe+EB6WoMJNlKSyriCag3bivfBF7V7NWrWRmcE+uCQgmSFTzlLSLl9dBewP4mMVWLaRMgwMlOunqJ5phalEv1JTr2W8/XjVQuGmKLDjQiVwcgdbW0gk9EJZnQBnzPzyACM95iHqc2tW1SeTbL3W+ey+a3bdXNmL/7SdwKzfmTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uQs8qjTUjyWsa3fwywe0TD8RsL7AHJfJWOypqKu3apY=;
 b=qFK94r/4tpw80IcmFXCD++VrrU04wbJRsXHVgEf/5cQp/784xjZMelsZpioR+a6CnvS1QIkHGTeYCGjju366I5pkz2Jgwd02z2jjRuXICbDN1856xFxDCqDMepW705S4va1HeHaQJsFXu/YzLLqQVrCOn/EDBeSe3bxeX67KAI+C6rPYuLjCTtneQp1zH2mRo3BEKZv5gaiZjmTAjz/2JnpvX75NR4Z61CmpimeJJJL1+EsRv5Pgxvz/sgqddqWPmVN1aW2oef5o0Nyx55eVaCsU7Kuj8S6JM1Sdv7FPLcc4Mhe4VsaXtfrcme8L5b0c6EfpZKmi87b43se4K4erMA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by DU2PPF136EFA2F4.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::a85) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 09:06:30 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%4]) with mapi id 15.21.0546.021; Thu, 29 Oct 2026
 09:06:29 +0000
From: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][scarthgap][PATCH] strongswan: fix CVE-2026-78135
Date: Thu, 29 Oct 2026 10:06:26 +0100
Message-ID: <20261029090626.498332-1-adarsh.jagadish.kamini@est.tech>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: OS6P279CA0121.NORP279.PROD.OUTLOOK.COM
 (2603:10a6:e10:3b::19) To AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:396::9)
Return-Path: adarsh.jagadish.kamini@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1672:EE_|DU2PPF136EFA2F4:EE_
X-MS-Office365-Filtering-Correlation-Id: df72a679-1ae9-4c98-7388-08df359beb71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|260925022911599003|260925021911599003|260925021311599003|56012099006|11063799006|261009223027099003|261009221227099003|261026140227099003|261026121527099003|261028144727099003|261021123027099003|261022105027099003|261021121427099003|10067099003|12006099003|18002099003|3023799007|13003099007;
X-Microsoft-Antispam-Message-Info: 4nV8jeu+kmIhdw9Yv6Qu/+Z6KJpMS1IQMWqCPHYyIOCp4UjSpEkbIn77m7/OvpM5JQ3zd9hmmB5eioC47trD9i5cGqrXz/gBqGzDY14UU1SsnWR5wg10q3Us3fb+Yh76nex5MpwVD2qLdwSLQ57WLB61EDNn6AkYC32zbA3+Dk7DjhN6046NMmXFdXs6TE9KCbMOxxepIWxXMxScFmQe4Tp7JFO3diEmG1jd8e1qZSmrHhVt13G8ZSNte47IPZ9653qa0QBwRh0VVPZFAelKP2FMBV4bnSdzdVvOUg1JZyf6wtYaFvbzS1wwpCHZiVc+xXPaA0KjNb6MAGX/aFklZzYNeR5ey62hAmz+y3H5ZAGUbHs5Ixs1DbsmoranTeEEVCyb++HjliGu2k3hSmNzgPbcxf9cOglNa9vjvjZNvSUUasAxz4mMS1MDWIpJ5C0cYccXr5H2dZ6JDp5Hb68tb61W8siUqNpReRFTLJRopInfhl6+HSWA30P+Py+ISysI/fhGABVUNThtgH4hhwCj0V2bfNwfNo3tK2PPnGauEFrz+dTQHwKSZasvvOm46gDdCp0Pf19cYSdZ4ncs/4nUSwwOrnWeOy/7Ru8cZU3igowJ35XNVTbWIyBroBzrg1Qz
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(260925022911599003)(260925021911599003)(260925021311599003)(56012099006)(11063799006)(261009223027099003)(261009221227099003)(261026140227099003)(261026121527099003)(261028144727099003)(261021123027099003)(261022105027099003)(261021121427099003)(10067099003)(12006099003)(18002099003)(3023799007)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6lX8Hafxh2E//B/D0eI0UhTZPce7YQzrY19DHpPWEgs8/1+9uWO92KgrbCO5?=
 =?us-ascii?Q?NL571WRkd/UyZZU6b+YmYVrIBcYGLv8/F5LVj/2vhx7bDOtu3LwwM1X456D+?=
 =?us-ascii?Q?Bt01gWcSDtwOlrhZgRfXgERqQOHY6/jezo7/etGGSXrfWqaNBloyqENRVvhi?=
 =?us-ascii?Q?kRV1obRSS9ove7nIN9HRceYzR8F5vg8a+L9xkaSOUzIOSqUaaPpfZkunvSof?=
 =?us-ascii?Q?3mn/mFSBNb7jAW6IjW7DDRFNk8w0FB0tNShgTRIpEQfi7PtWhAOFzlQBQEn2?=
 =?us-ascii?Q?TAk7WdeG60GNV6CBjwNxfIZ+XbRBilNGLTpdXp1TG+aMRzeLpPSw/ZT9nCow?=
 =?us-ascii?Q?xcZGhTsK4jKVzinTnUVIxffbTibDeQjCeLMCFda0hQM0us+x7OJei2b29Fjz?=
 =?us-ascii?Q?cOO+WHzZ/RjYHipqFE6u5ndTdPkzk+S9U9jsKTk5zV32nS8SYhAGJ3Q4/0Mj?=
 =?us-ascii?Q?s+SP/lmgZQqCMdpjn13mc/xpqX9uGKdfd0GBr8GI/w+OaRxt7uIigkKEidtb?=
 =?us-ascii?Q?CLp2vj9GOj4nucpEm9bzfxN1yk5qGqFrT35rGg9QDhfkva+DKnRI4R2FMxHB?=
 =?us-ascii?Q?Ev+gEJYIb/33kfV99N/gHeGB2CE8sGZ4ZMZx1QcxJgxNVXjtA6kI63AHhMhW?=
 =?us-ascii?Q?7fAT+1WObBcojEXlJY1piUFQpERhRG8nF61tZS2R0HDH/aGM3s0UGqyb1eSb?=
 =?us-ascii?Q?ITSeiw0hTx0nm0jtw+Rvrf4q+srwEbl5Eaw9m0u1YmWVS52pMJ4tyBgbS39g?=
 =?us-ascii?Q?sgbM9A6+n6JlN9v4yv+2RtZwHUS1eXGVtvziO3Kp7+JB5vUHtNoI9Ej092/0?=
 =?us-ascii?Q?g7IiDQhiJHIKPQ2j4Xj+fV2Vih6tFgOvBAySae54pY3Aj1IfAUh8zB9aOgkZ?=
 =?us-ascii?Q?gLQIlpLP2Bc2DKe381BgMON4PZWj0xS5GL+Zo3aepAnp1qN227RBn5dpWyIn?=
 =?us-ascii?Q?l5JsgTxe4YcLtWmE0RCpIXGnKGDY9SfpumYdSRH4A0BgcgZzVdxvSVtPlHvy?=
 =?us-ascii?Q?XH3W4p8uqXXt7sMAK2reMgR3XebtS7WGTTDoaXJu02jqc85mN2TK6NpO0CeJ?=
 =?us-ascii?Q?kjcj4S28oy2B/Rx1FBMLYRS4Uk0vS8lwPYdr8jBGTU0Zo7PBF0fpwfXpuq5N?=
 =?us-ascii?Q?iN+cngb/P73+4rKq8C7xvPJFkzBQKbKrgOFUq1WrEUqPjVDjXEqc3gq4mNZC?=
 =?us-ascii?Q?v228HUe4KxtzL6xsLhSTp2YmKYP2ny1WFNac/6yZFRGfsrDV9bWsVMjljXT+?=
 =?us-ascii?Q?xQimt6T090yXphq4cAtAIjVz7YkpsIrWf1u7bIb0FGdOFvWhInfhCmA1rqOC?=
 =?us-ascii?Q?Ge6EteIpRXspwEP21Q1l36szKNeGSYbFr2sqkGyOIqrgX6fpIQq3/0sJuwH5?=
 =?us-ascii?Q?0/qqVyzbD1NQjONHpfifYS9s4YfCio5nLF3E0ksgjydxxuAybZvfXKqyBK9r?=
 =?us-ascii?Q?m/02LitcgzRqs8fz29u0Y7qOaC/GWVYqD1NLzrqckLguIDmn6RyVMnYTPp+E?=
 =?us-ascii?Q?Os+Ji5wnXjWtKTbto6gnBEsa99GJFTHYLBGORiTbcMpP9Ds62XTeyKRU3lyo?=
 =?us-ascii?Q?eU22Cfh8WA732yNM1f5C+3/uGapyW6dqSVGwKKTs1IHg8rja5Ri+Z2CjHYZq?=
 =?us-ascii?Q?1J0VOaSYmnm3N63zqz46cxcVo8Jeiv9frHmSN3P14KYYpc/pTcDNITNFsgoL?=
 =?us-ascii?Q?oYL0qNje4ZUdzVbztYAemcgw1/2XkF0jJ6aHF35XeR5Ai9RigyW7aZUOn1Aj?=
 =?us-ascii?Q?/JoXdq+VD4gHLPRB9J56sg4azkosREE=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: df72a679-1ae9-4c98-7388-08df359beb71
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 09:06:29.8063
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nROJFOemPE88paxyfU13COsK7KmjS7N4nNhCU21OjAVW7tyojIN5JQj2jSl5ksXebxgLjOlWgFEUj47T1kGRkX6eZCltIvaZUH6cl6qGlkM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PPF136EFA2F4
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 29 Oct 2026 09:56:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131657
Content-Type: text/plain; charset="utf-8"

Backport patch to fix CVE-2026-78135.

References:
  https://nvd.nist.gov/vuln/detail/CVE-2026-78135

Upstream fix:
  https://github.com/strongswan/strongswan/commit/4dcb132266a954202509a3b4b=
3be99378f3e3b4d

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
---
 .../strongswan/CVE-2026-78135.patch           | 73 +++++++++++++++++++
 .../strongswan/strongswan_5.9.14.bb           |  1 +
 2 files changed, 74 insertions(+)
 create mode 100644 meta-networking/recipes-support/strongswan/strongswan/C=
VE-2026-78135.patch

diff --git a/meta-networking/recipes-support/strongswan/strongswan/CVE-2026=
-78135.patch b/meta-networking/recipes-support/strongswan/strongswan/CVE-20=
26-78135.patch
new file mode 100644
index 0000000000..d046ef78c1
--- /dev/null
+++ b/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78135.=
patch
@@ -0,0 +1,73 @@
+From 59468f3ba1a8084ea566a50d835d96bf02cebcef Mon Sep 17 00:00:00 2001
+From: Tobias Brunner <tobias@strongswan.org>
+Date: Mon, 27 Jul 2026 08:53:50 +0200
+Subject: [PATCH] ikev2: Properly reject CREATE_CHILD_SA requests on
+ unestablished IKE_SAs
+
+The previous check was not actually enforced as long as there were still
+tasks in the passive queue (it was originally added to fix an issue on
+initiators, so the passive queue was expected to be empty).  This allowed
+an unauthenticated attacker to potentially establish a usable Child SA
+if certain preconditions were met.
+
+First, it required that the initiator is authenticated with EAP so the
+authentication and the creation of the first Child SA is deferred.
+Second, the responder must either not configure an IP address pool or
+an explicit remote TS, otherwise, traffic selector negotiation fails.
+
+Note that the half-open IKE SA and the installed IPsec SA will be removed
+after the default timeout of 30 seconds.
+
+Fixes: 28b33d7cacd2 ("ike-auth: Support exchange between IKE_SA_INIT and I=
KE_AUTH")
+Fixes: 8503077175cd ("ikev2: Reject CREATE_CHILD_SA exchange on unestablis=
hed IKE_SAs")
+Fixes: c60c7694d2d8 ("merged tasking branch into trunk")
+Fixes: CVE-2026-78135
+
+CVE: CVE-2026-78135
+Upstream-Status: Backport [https://github.com/strongswan/strongswan/commit=
/4dcb132266a954202509a3b4b3be99378f3e3b4d]
+
+Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
+---
+ src/libcharon/sa/ikev2/task_manager_v2.c | 21 +++++++++++----------
+ 1 file changed, 11 insertions(+), 10 deletions(-)
+
+diff --git a/src/libcharon/sa/ikev2/task_manager_v2.c b/src/libcharon/sa/i=
kev2/task_manager_v2.c
+index 8c07cf272d..6ac94b8679 100644
+--- a/src/libcharon/sa/ikev2/task_manager_v2.c
++++ b/src/libcharon/sa/ikev2/task_manager_v2.c
+@@ -1088,9 +1088,18 @@ static status_t process_request(private_task_manage=
r_t *this,
+ 	delete_payload_t *delete;
+ 	ike_sa_state_t state;
+=20
++	state =3D this->ike_sa->get_state(this->ike_sa);
++	if (message->get_exchange_type(message) =3D=3D CREATE_CHILD_SA &&
++		(state =3D=3D IKE_CREATED || state =3D=3D IKE_CONNECTING))
++	{
++		DBG1(DBG_IKE, "received CREATE_CHILD_SA request for "
++			 "unestablished IKE_SA, rejected");
++		return FAILED;
++	}
++
++	/* create tasks depending on request type, if not already some queued */
+ 	if (array_count(this->passive_tasks) =3D=3D 0)
+-	{	/* create tasks depending on request type, if not already some queued =
*/
+-		state =3D this->ike_sa->get_state(this->ike_sa);
++	{
+ 		switch (message->get_exchange_type(message))
+ 		{
+ 			case IKE_SA_INIT:
+@@ -1131,14 +1140,6 @@ static status_t process_request(private_task_manage=
r_t *this,
+ 			{	/* FIXME: we should prevent this on mediation connections */
+ 				bool notify_found =3D FALSE, ts_found =3D FALSE;
+=20
+-				if (state =3D=3D IKE_CREATED ||
+-					state =3D=3D IKE_CONNECTING)
+-				{
+-					DBG1(DBG_IKE, "received CREATE_CHILD_SA request for "
+-						 "unestablished IKE_SA, rejected");
+-					return FAILED;
+-				}
+-
+ 				enumerator =3D message->create_payload_enumerator(message);
+ 				while (enumerator->enumerate(enumerator, &payload))
+ 				{
diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.9.14.b=
b b/meta-networking/recipes-support/strongswan/strongswan_5.9.14.bb
index 661727e501..b2aebf188a 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_5.9.14.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_5.9.14.bb
@@ -18,6 +18,7 @@ SRC_URI =3D "https://download.strongswan.org/strongswan-$=
{PV}.tar.bz2 \
            file://constraints-Case-insensitive-matching-and-reject-exc.pat=
ch \
            file://tls-server-Only-accept-non-empty-ECDH-public-keys-wi.pat=
ch \
            file://libradius-Reject-undersized-attributes-in-enumerator.pat=
ch \
+           file://CVE-2026-78135.patch \
            "
=20
 SRC_URI[sha256sum] =3D "728027ddda4cb34c67c4cec97d3ddb8c274edfbabdaeecf7e7=
4693b54fc33678"
