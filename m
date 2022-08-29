Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4D43C64991
	for <webhook@archiver.kernel.org>; Mon, 29 Aug 2022 15:24:36 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.71977.1661786672083906591
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Aug 2022 08:24:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=RNv4nStR;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=6240c2564e=saul.wold@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 27TESgSU010668
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Aug 2022 15:24:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=UBhvhxoIPcdaE6nuytk+5VMUkpjb+9cpZBb6NnzUUT4=;
 b=RNv4nStRxwVoKDoKgt++PefcO1D2swniC6o1tSIIxuU6DOPJWo6UPzgzbFts9q9u4yDG
 KKv3F8USAo9HqKcflN8VX7bh7ZUMN6eD8Jq+C/1QRY0XhWxk3GcqR1BktPBEw6rkBF+y
 pJK/GjFHBFcKQEmcNjNt3XPJm7eqlVsyon8IdPBwRZ692DS0HmH14zTKXFoKpgNpzJpc
 h+YZGTgRKfWhw2AkXHHk3VQG5U3zJs7T95AipMAxfU4DApI6GARVGdq5HhIFjWHqPy38
 jcc14cpvq4fWIwysbpLM/PjVk25ACBkLXjEzRMK/0l0iQwNzLAoyeJJ7cd5TK31SdwC8 SA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3j78g2hsw0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Aug 2022 15:24:30 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27TFOU6K032698
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Aug 2022 15:24:30 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2171.outbound.protection.outlook.com [104.47.59.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3j78g2hsvx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Aug 2022 15:24:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K7pDsxsNQhJ1utpAo1rJQgWwmssh/aOa00iyqPzxfEKyIZQehBO5hn/nSZcVptTFdCR/axBEEquQlhDuYOf3Phy8/IqchUfXFUXGfO9GIGuXHlFYWdU2BIzBctQW0FqRU9SZi4xLTjyDXgrNPCoDb0Siribazc+ktrUaAbLlaNyPZjpXgP3xh0Ls4ilke7aSJXwSl3uVEX1bVQVxdymn6dQ16YXsCcNGOIurs3IeYqEjp5BpIsnHhMr+IOp+KKJNs66mKyC6w+9Hiq28RGinE6C7yo9uL/futgh8ZNBpBq/FAjgHQgbsiTlXbj76slSRbeN4y+XvYhBTrOkAktgbtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UBhvhxoIPcdaE6nuytk+5VMUkpjb+9cpZBb6NnzUUT4=;
 b=IrEt3oTcjnxk0vS9QuDgKM+tBZkexiz7yYZzCtgNJaBv9M1caczMonDxn3UzKMqeRwh3y5mazF7qJ7HZZnzcU6/mYdDb3ix/RQUavMuDB2/9a6KP7gDJ2pKyh690RcJoYvEQ+n/nMUrKJEAHlaiWHwY5ipUg85O8N8VwzLzC/PKK93bUnpxad9Y5p9SOlTQMdpvWPP79qIvx08vpv026lxWviCpwUt89r55rAVK+SLXz4p73HFfb1ypo6UlYgyFJKv+hzuTJNuF0ASxUlaJUIJm4eRWElA1y38+duLq49eK25/WVytSbD7hFF0Qfb0QmrJlLXWU4cB2t13v3BEhPwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB5818.namprd11.prod.outlook.com (2603:10b6:510:132::11)
 by BL0PR11MB2914.namprd11.prod.outlook.com (2603:10b6:208:77::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Mon, 29 Aug
 2022 15:24:28 +0000
Received: from PH7PR11MB5818.namprd11.prod.outlook.com
 ([fe80::d5f6:1024:58f3:d356]) by PH7PR11MB5818.namprd11.prod.outlook.com
 ([fe80::d5f6:1024:58f3:d356%5]) with mapi id 15.20.5566.021; Mon, 29 Aug 2022
 15:24:28 +0000
From: Saul Wold <saul.wold@windriver.com>
To: openembedded-devel@lists.openembedded.org, raj.khem@gmail.com
Subject: [kirkstone][oe][meta-perl 00/10] Backport LICENSE String fixes
Date: Mon, 29 Aug 2022 08:24:04 -0700
Message-Id: <20220829152414.1757540-1-saul.wold@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW3PR05CA0030.namprd05.prod.outlook.com
 (2603:10b6:303:2b::35) To PH7PR11MB5818.namprd11.prod.outlook.com
 (2603:10b6:510:132::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a7d2fb35-ea90-4888-1ee0-08da89d2900b
X-MS-TrafficTypeDiagnostic: BL0PR11MB2914:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	XQuomDD29bMNpmB+05kA7MLEUn9zGkMm2qmO/21bYsoqCRXa5M/oIL3BdguSKmRHNFbf32dWhNtRCdnH46iXO7WfC7C6qkI0WLOrBYNNKBCMl/e4aE7E9l2ICbJHOwLWwoTuCGFtPuywK0Wwf7J9VivstbGOVpYQGpn3hgCFwfzdAXPw0uziV6Iho0Ri5JAgdGCxRfiomguxFpUTT7ctt9LCQz1/6IqEEguPCjYOXPR6eZQWIXh1caerP+aEWXUAgE5Wrs6RISJi7ocmCNVgAhWFjYTU0oOqVhEC2pKRPJWRj1sF4pJYXLtaviUbkM1lbTUFpEPyYfuJgzHXW4WH+CfN8wpNTO7a8pk92NCTqt5D786blJz7xud63QM6E3xaaU7EcpdblyNh1qcZeJ9fD4hO+2RGDADPiPsggxHa9EM+VI6MGyNYsNJ3NFk/pXiztJSNX1VWhUwRJRPiIa0sGSMpM1TvAb6IrdL11/cS2G3m0pE/0G2S1rOMZ+Brsi1fbtYSldQ4nSRZLohLjSWGT1mCNHeAQQ5A4EN1qCi4jMC0BBw9CPOP6fWV54+iQfn8LeAz7KCk0hK/Amyx7GvvnLrLSWFoDBPcPvqkpN5UjWBaASbmwx9UeTtqGWM7dvntHlTnqmqu+HgPmX5cOh1k8SHSm1KJcvCraMPlZQ8iJCingeg8IRIGkIzuliuWKJuVU+XQBNwTDIns8Bj8TBjxl7qoMIs6NChNzJWK/5DK0Qicti9186Wdma19WtwNoWCS
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB5818.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39840400004)(396003)(346002)(376002)(136003)(366004)(86362001)(38350700002)(6486002)(66476007)(66946007)(66556008)(8676002)(5660300002)(478600001)(38100700002)(41300700001)(8936002)(316002)(186003)(1076003)(2616005)(26005)(52116002)(83380400001)(2906002)(6512007)(6666004)(6506007)(44832011)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?nzYCigNDUYeREjOjm74Dj/WSeWSaQJ29xVV8uJ3NYrBi5mmOP7qHdU1cKpXb?=
 =?us-ascii?Q?gvpQHUTZQ7bUn4932kSPnQqnOyK0lC0DDSWA5whV2PO7k79BP6eCWTajJ8r2?=
 =?us-ascii?Q?E7vtQJW3Xrgk87YtXgRC26ZnMQHeInHWA8vlHDqqI+qPmTdPGcGFbYnkk01Z?=
 =?us-ascii?Q?Xd0Ya4v2kapeEYEw6XOti+Wz2jX9oWD+NoNMJ7RZbfF08azP/+DouCNcn2Wl?=
 =?us-ascii?Q?zzXXVat1iPKC2CoPRogToPF/Bqh2WJI1awi42ET6+aMe3BZZablOslf0TEjW?=
 =?us-ascii?Q?4jgn2jx2JwWFKPV3mbSoGUZWZyqqMHf9NDGvdVm8NmkfUqR/Grb7l/+JkcB3?=
 =?us-ascii?Q?6dsHUlNTHNHpoR6RhL2utDJ9os+Eu62XQIcpEX6HdF8q+tvdKvw8IqYdtE/e?=
 =?us-ascii?Q?qF4GSvqnhlo9B7LSv3/M+krmVI1v9oGrdyV0KlRvli1KcxdaINnnesP1QwxZ?=
 =?us-ascii?Q?An7Jve7oM8JmuOq2VSF925N8wrCy8cUP/0AT0TzSOxKPtL4DpM/wuWjBl87C?=
 =?us-ascii?Q?fCgumSUw06irLgWugeMbS9fcy08tqrMnjcEB/2UUNAWHD1nJWcNsZi8f66W1?=
 =?us-ascii?Q?QFfVfKXwEEOPx9qFY/oNv8bt0DKBxh4EZFHomiQI47LCCzAnrUQwAAB8eQ62?=
 =?us-ascii?Q?6aVx5vssdbVSWL7SLwhvH7DlEUWBSWYthyiBlwCMiaiw6feqTrjE26ewZD0P?=
 =?us-ascii?Q?rJfv0F6fSPvUVGSog0HLIT6iHqkTTYkIFSUYTy5zR5oW2LuZ1y54eGW2crVL?=
 =?us-ascii?Q?wkjbEdUPx3BvBBK7wxmvDOtWlytzoz2E+hBcM1VuN76YmdWDwtDpQNvsddyz?=
 =?us-ascii?Q?ZiRochypWz17XCgZ+iAbkkqRUD3zguwSso9V3I1ka+zhDMTNBsHEgOhEz5kQ?=
 =?us-ascii?Q?R9S6FTaIjCEIKlJO4K9lTzKwl2Mb87v0HxJAOtjalkcqWKZHvPL4f7OKOM+w?=
 =?us-ascii?Q?KfZzoXH5Rnelw5b3lxmhzOuOL7rlKlWdtz2ZV+CK37hUl97aI/dR3lyEoAna?=
 =?us-ascii?Q?MVKUY4sirjC5CRTZ+HY45K8h7nZdIkkzt89I1471eSDEPxu9EJl9YWGVNBuT?=
 =?us-ascii?Q?3OXP32/SGGK13/J07rWoaKE2y0k9RZznY3aszf8RLhX8i6S8FKT5aJkMxyNP?=
 =?us-ascii?Q?LTkcbk6q/5xGIaPSXS+6Q5EX74v4RrrqmUjTnxesaj2zcNWbUo3bDvByUPM3?=
 =?us-ascii?Q?mXCS/RTvmf1CVXRPZGHHAOhMprFwAy6t4lP1dX28iE5B+v41ZBdSKWkyztfa?=
 =?us-ascii?Q?L2t6Z+WBlMrRLs7uZrxSw3RFUQmSECziiccko7WrLdb4CR6N9yQfO8PvTN6B?=
 =?us-ascii?Q?/Dbl9CU4COXryM6Xc9+/0OOndc7WpnbHkW5Dma++LL4hosVZHxpmgibr2jBx?=
 =?us-ascii?Q?CQDd3UdcGboo1mDhOuA0qx72FzyW0EzpLHPLa9iuAPcRuqB6h9hXW2gG8JX0?=
 =?us-ascii?Q?32JvKTUCJnisK55hTnjeoxrtn4xWXdZSBHF2EBdTE43OqA79sl6Lwp0lcuFA?=
 =?us-ascii?Q?P/L1RxwPjpcpbVoO7iXITDD1xSmsNHQvsNNYrfSun41IzVE4VjvMN1FxGmkU?=
 =?us-ascii?Q?8Ji3/xR/AkCUaW7rN0r0lTwo7eYDolYPWC6AZW/2oVG/AcCT7pyS9W7siuEd?=
 =?us-ascii?Q?5A=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a7d2fb35-ea90-4888-1ee0-08da89d2900b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB5818.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2022 15:24:28.1162
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 F65GI2ETnYpd9tFigcsSDSVMdwcBHfF+2hY474bOYUolw6aW6Sw6hqh7I2vTvlvNeBOjnx7YrcPT43KefpdACg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB2914
X-Proofpoint-ORIG-GUID: JgIpEvJCpCLfR6Ab0f-kqmGbbS4DMr32
X-Proofpoint-GUID: ToHeWM7hUtLHf6DO8aL_wXJNXJHezzG7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-29_07,2022-08-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 mlxscore=0 mlxlogscore=781 lowpriorityscore=0 adultscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208290072
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Aug 2022 15:24:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98526

Backport these changes to kirkstone for proper SPDX support.

This set of fixes does a small cleanup to the LICENSE string
to add a space around the 'op' (|). This is needed for the
current create_spdx bbclass parser which does not correctly
handle the lack of spaces around the op.  This problem will
be fixed in the future, but for expedencies, I am proposing
this set of fixups.

The error was:
ERROR: libproc-waitstat-perl-1.00-r0 do_create_spdx: Cannot find any
text for license Artistic-1.0|GPL-1.0-or-later


Saul Wold (10):
  libipc-signal-perl: Fix LICENSE string
  libdigest-hmac-perl: Fix LICENSE string
  libio-socket-ssl-perl: Fix LICENSE string
  libdigest-sha1-perl: Fix LICENSE string
  libmime-types-perl: Fix LICENSE string
  libauthen-sasl-perl: Fix LICENSE string
  libnet-ldap-perl: Fix LICENSE string
  libxml-libxml-perl: Fix LICENSE string
  libnet-telnet-perl: Fix LICENSE string
  libproc-waitstat-perl: Fix LICENSE string

 meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.16.bb | 2 +-
 meta-perl/recipes-perl/libdigest/libdigest-hmac-perl_1.03.bb | 2 +-
 meta-perl/recipes-perl/libdigest/libdigest-sha1-perl_2.13.bb | 2 +-
 meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.074.bb  | 2 +-
 meta-perl/recipes-perl/libipc/libipc-signal-perl_1.00.bb     | 2 +-
 meta-perl/recipes-perl/libmime/libmime-types-perl_2.17.bb    | 2 +-
 meta-perl/recipes-perl/libnet/libnet-ldap-perl_0.68.bb       | 2 +-
 meta-perl/recipes-perl/libnet/libnet-telnet-perl_3.05.bb     | 2 +-
 meta-perl/recipes-perl/libproc/libproc-waitstat-perl_1.00.bb | 2 +-
 meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0134.bb   | 2 +-
 10 files changed, 10 insertions(+), 10 deletions(-)

-- 
2.32.0


