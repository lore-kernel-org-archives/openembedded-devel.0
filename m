Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6D6FC43334
	for <webhook@archiver.kernel.org>; Sat, 11 Jun 2022 13:23:51 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.5686.1654953823318789077
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Jun 2022 06:23:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=CXEfVmsH;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=316127c30b=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 25BDNhG4005626
	for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Jun 2022 06:23:43 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=xIuwfCj050EHD6LkNjEQIjbUIPjC+UaNvZ2XmkChhLw=;
 b=CXEfVmsHjUnPvLC0pwXDnGjwhTFS5yoEdPNHCn9d/1BNA6/QTYkCaV8FIh0MhvvN70EJ
 p15ab86chKaAP+LjsOiNRPR9C0sTGSnY2tkhTaP7UTUBIw7JKRdywC7chmO7SpWI9wH1
 fyql54I/9VuSpe8GY6JQjjFNH04CVPKOeuOtPPCTqKEVfqs7H47wf6SN11McM/16uY9I
 epEyWqLVycjppQ6mYxCffCQeXZGHGIkiYwGpZG8LWQM/lhI0QkhECczngx3/XtmvQLiN
 PRG36VRBLR9btw0MgI4tUgDDOnT6AzqqBl4CqXy6SM9t0qlo9qFpl/Bc2OqONWgOpsLC mg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3gmpb58506-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Jun 2022 06:23:42 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 25BDNgGJ005617
	for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Jun 2022 06:23:42 -0700
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3gmpb58504-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 11 Jun 2022 06:23:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ly7kztv6K4WO7dyoKZwccQpfyS03w7jta98+hQ9i1KwMyFI/8BXxUBJjV6KKyrZVJ6z4Pe+esLqFNcruwI4lS93NbEk4FlBH2vWbkT1tfpl4ZPfHiv+Au9mICxif/dN5imhIEjx7RteyKJu681Yqnq4akYT1Kml96ErhDoZ+f+qtMDTm3lQZnXsj58x4l49U7vZQAx+fqxzPdQBXag/MHo/d34pRD3PT00tDtOwqsR1CVyFokK60iZPxy5Gjn2t2IqdHd28Yi1PBdBonc6BS9SlPUA1do5JMPCe+meFZjOF/PA+hlSKX+zrF5CJG48l0lUVNAjKHkUX3/kAaAwSokQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xIuwfCj050EHD6LkNjEQIjbUIPjC+UaNvZ2XmkChhLw=;
 b=GVRevekENZGE+kyH4FDxGdm3HjotdOYutxgCZOnuKDQ77ktQadZiQFLpIN0MjeO/grsk/TWXC7NyaSExGKLKhljFbC5tPRQPT4JyqfH5qasPldJ2moHhbTjyAX0ghYzoanEUwNHiZl/TG9WZRq2g0ioWxoKrz+cb2utDaLLbaSLtag2kC8rQg0y1yINRwrTpFXe/SjVSIUYpPnPT2tXt0Re7lHsdhEQSzcXOpDgmRIcQk2iYW8qCVxnAhEh2xJdOOxAyNKzOlYilCAFYg/+yB0IqInOzxnQZpeFa1dgKRw/Dgx4zoheWJqUiF3xK/LnkHprFtVD3trBkHp3fjyqd6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SA2PR11MB4875.namprd11.prod.outlook.com (2603:10b6:806:11a::6)
 by BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.14; Sat, 11 Jun
 2022 13:23:38 +0000
Received: from SA2PR11MB4875.namprd11.prod.outlook.com
 ([fe80::a8e3:9407:2650:5a17]) by SA2PR11MB4875.namprd11.prod.outlook.com
 ([fe80::a8e3:9407:2650:5a17%5]) with mapi id 15.20.5332.013; Sat, 11 Jun 2022
 13:23:38 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Cc: jiaqing.zhao@linux.intel.com
Subject: [meta-oe][PATCH] openldap: pass correct URANDOM_DEVICE to CPPFLAGS
Date: Sat, 11 Jun 2022 21:23:12 +0800
Message-Id: <20220611132312.4070200-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0175.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::31) To SA2PR11MB4875.namprd11.prod.outlook.com
 (2603:10b6:806:11a::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c070e8db-d302-44bb-cece-08da4bad984f
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_
X-Microsoft-Antispam-PRVS: 
	<BL3PR11MB65082910F36F1FFCF78AE950F9A99@BL3PR11MB6508.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Ropz+tdS84EyCSkwj7JIK7g+5tbjaVX6dpPYtZ2ASoRkYCXxWarrlPOzrecnWPr6AgaULRVTAbFE7VbF793DFY6Hiat2oUomqIujuIzd3o1EZmrWpQblYSadsaehkd9/YntO/uNRvQ7rRkzSyIPaB7qSq65sYIj6FBVYrhL/eXmyNnw9yFSviiX+ySkUKCpz/uBHIgLToHL7C9P9zYBIccaQdH0+jzi47S4JxvL20HfvHYNBoLnRZVphwHGkpxwHdPVo7iz8Bsa1BzDPV+0cdh65VsfQsZvO0OObyaVkGGtyjpbJbiuateDj8Cd2E2a/73tmvjS8xZf994dDh+ZvhBnVzL32hgD0nQr2P2JbZrzsx2Is+IGAlF1e4GKA1nV+aOurFd4qbWkvKGGWq9C0lp3K8J+73REIVcOmrhI4zSbLKxAv22jJGUkjkJzbbII6kM7rk3ABYMGhz5WHut2zMiWrlSmEGBantg5HUEnz24UURf1h10VoQMNFaY3qWcncC09Mmrm6d9A9PMJTb0pft14YTB8x+rzuW1YP8cqri0//HuyHJ5PylfefQumFOxuhcVLhzfRGO2NO2gZ/RHJ/P3nhoWIuZ3Iw0xkNLOfp4VeeG8rL8xyei83eXhDpW1LqxxDMZwgE2rTBwuIaxg3vd3dw8RXQbONEVqsubJ5OsIkubnaiSGapxLCDiqqN8fTZig2k77ezh1MNRFx0w0BC/g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA2PR11MB4875.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(1076003)(52116002)(6506007)(186003)(6666004)(2616005)(6512007)(26005)(83380400001)(38350700002)(38100700002)(66946007)(8936002)(44832011)(5660300002)(86362001)(8676002)(4326008)(36756003)(2906002)(66476007)(316002)(66556008)(508600001)(6486002)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?tQLVJXI4x8zAosI+4IxTT1csFfdXi0YdApyRjvilud3jXkv/Ip15vXbAnAJy?=
 =?us-ascii?Q?liNtCilpYrM18Q39YTrRXU8j3TSAy90etmavfCqn3DmC9m84Dtxi/DjrfgnU?=
 =?us-ascii?Q?Gt36g3adgAAX7BumW0HG7LYpvYZnQFUlseshz6Xv/kqD8NJII/7NcRJ+tVYX?=
 =?us-ascii?Q?7yWXhH+zwRBzc9s0TYvXfXPvKdmdSIQ6WCZiSGS58wLIQfqYxZMiM+x2tybI?=
 =?us-ascii?Q?TwICi1G6SGoLba7NPoP65j/3FXiankt4GLP3o9Af1hxEL/YAdW2o/fttSsF2?=
 =?us-ascii?Q?c2td2mpD2S49O/O02b9X9jd6GacVd3b92AT034Efq5S4Zf83tX4VbEu+J+g2?=
 =?us-ascii?Q?/37JznVgU5HkuMSjR1uaYQYm0gBPzpB0ifK+ME7wr63+if7T/bGfgby/3zAa?=
 =?us-ascii?Q?TMCho2hMNYPO0FnE1uqqOQfqKYDuy0Xy2oDB4u9jO3vFFViMZlemVVLOBHU7?=
 =?us-ascii?Q?h1hwREs2EdZVihbDFc/KoOopLpxdDvvz0hdZ7OMU99JzF0098zu6QuHDWZs4?=
 =?us-ascii?Q?L+uIfv31JzeXhl6zqKjvZZac8GVmVyKimXDdDoomprag+xVtYd0Ftur2sJ5c?=
 =?us-ascii?Q?ZocbR7NOo/xuZHqvP9qwCZRNCt62uPqJV7kSBZ1ufhcGQbqKb280DxyF72h5?=
 =?us-ascii?Q?rES/1Lx5lcUEFXQUQXyGDAhLBu+z/9p8VEnajq/9DZNwGKhX4re/B+NAvlqo?=
 =?us-ascii?Q?fRMTeidQBd+SCHBfcNosjQzR8AGKeUp3eM/Hp7ZgzGX1+iNwno1BcZhgmAaj?=
 =?us-ascii?Q?UVu+Ic8vW/2dEUurMBf+fRucfK2nih7PfgvqobvH/xdtbinDXzJoYmT+QHk1?=
 =?us-ascii?Q?/aIstL5+1C1ltdTFYDlxaYWrwrfiJ8a4zLl7KrmCMPt3UC2HHpIm+NtVXPg/?=
 =?us-ascii?Q?zZwxKrjfSX7KwqkDsr9QjYOTLJmdTd7oy3cj5UNZ/ZbPHT08hdyk2Mw+vrdd?=
 =?us-ascii?Q?A3KOpPdJJiySRuOqC5En2K2qFUZwNtcQMis3asp78Lu22cwKh/R4bDpIbAjb?=
 =?us-ascii?Q?8eHk99jAv4HMQWeje39zp/MazJQKIin7AmT2aswrhqwemKvdOCaBt74rw9fA?=
 =?us-ascii?Q?KtUNroXgfU20LAgvNU9UWqCJxJ+01qkBCfiOMvE5iArFxqt0vH7qmWcIdlvu?=
 =?us-ascii?Q?njuYwgftJkTyX/Al2ofcqIis51XG5Z0KaZrM0KoWrYe9j1U5quZmPSsQUvAS?=
 =?us-ascii?Q?ZfKh7nD+ClT7ltumbTRiaks4+N/CHZwSc0VIpxz39c+Qnt6UYKdnfLj+qfHM?=
 =?us-ascii?Q?FpoXkCkXhnYMptnckT6Y2pGYzRSuQEGkBIgGNkG6gh6pPO/UOxrAmI30VU3L?=
 =?us-ascii?Q?pIyI2mDDUae66Wxp3zCVuXSyuyeqoyCvUF5X1a1/lFnH4xV7/GRts5/euJr2?=
 =?us-ascii?Q?KU+dgwOtCwwytg5SCG7A58PZBbpWI3B99Spa0Vo+rIachY8I45QyQDdvyrMU?=
 =?us-ascii?Q?2HH/ihx0inF9Y76nwqaRRdw4rvfbbC84VIP3poT0vjXZ4JZiaIWzIRfM1CbN?=
 =?us-ascii?Q?TCV4RACFhj2vpLUQLaR26KRpbn2kFGt2IyDkLauBiYC68sdbEnHGH6lUx8z4?=
 =?us-ascii?Q?KfE4IuwqLYEt7tyGAjU1cAlitFXp1sdHIvJATv5khQxoXpyLKpwlrYstRXwd?=
 =?us-ascii?Q?NQh4Aly/3rLSj0k44oZwjOmQ4r5rb7pw3CG3V7hYduMUJyCRg4+Ca3gWFSLt?=
 =?us-ascii?Q?pGBLFaSzpgFJaya9iKyF6Ps+p4AFzl/xI7mYytgSxbrePOdg+rx4rwbLfzNH?=
 =?us-ascii?Q?CHDWmUN5UQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c070e8db-d302-44bb-cece-08da4bad984f
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4875.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2022 13:23:38.6575
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 zbYADxA03OM7D8vld5cOkyx+Qbd/T+XH3yvApXm9sT/UuBwiXecxSePyfY3zuxEvfC5/MMc6OT35MDf8ITlBJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6508
X-Proofpoint-ORIG-GUID: Wq_pgdgecz6oCUT4II2IHMmczjHvVQBA
X-Proofpoint-GUID: m0xobv2eJ0S8HoMg8Oobfx0JG4uGb0cl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-11_05,2022-06-09_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 phishscore=0 spamscore=0 malwarescore=0 adultscore=0 mlxlogscore=556
 clxscore=1011 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206110056
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Jun 2022 13:23:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97472

We encountered a runtime error with slappasswd:
$ slappasswd -s foo
Password generation failed for scheme {SSHA}:

This is because the URANDOM_DEVICE is not passed to CPPFLAGS correctly,
then the program can not open /dev/urandom.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-support/openldap/openldap_2.5.12.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/openldap/openldap_2.5.12.bb b/meta-oe/recipes-support/openldap/openldap_2.5.12.bb
index a0ca2b5d3..c01db08e4 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.5.12.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.5.12.bb
@@ -131,7 +131,7 @@ PACKAGES += "${PN}-overlay-proxycache"
 # Append URANDOM_DEVICE='/dev/urandom' to CPPFLAGS:
 # This allows tls to obtain random bits from /dev/urandom, by default
 # it was disabled for cross-compiling.
-CPPFLAGS:append = " -D_GNU_SOURCE -DURANDOM_DEVICE=\'/dev/urandom\' -fPIC"
+CPPFLAGS:append = " -D_GNU_SOURCE -DURANDOM_DEVICE=\\"/dev/urandom\\" -fPIC"
 
 LDFLAGS:append = " -pthread"
 
-- 
2.25.1


