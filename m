Return-Path: <richard.leitner@skidata.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 654C0C433FE
	for <webhook@archiver.kernel.org>; Thu, 24 Nov 2022 16:48:11 +0000 (UTC)
Received: from CHE01-GV0-obe.outbound.protection.outlook.com (CHE01-GV0-obe.outbound.protection.outlook.com [40.107.23.116])
 by mx.groups.io with SMTP id smtpd.web11.28576.1669308490899870131
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Nov 2022 08:48:11 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@skidata.com header.s=selector1 header.b=T/hR5KdL;
 spf=pass (domain: skidata.com, ip: 40.107.23.116, mailfrom: richard.leitner@skidata.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jy3zbYABvztENdiauwTHeBsTopTfIhsUGSDMHLcmrvJCN99fnStGFbCDzFzQaW5dXOaQdsX+BLp4SxMH5jeQglJ4a5aWOqskM/2zNxDFTG5TK9/TmvnAAOxhEgBLxVy8nqjJmLlaa/Gc5edXtUqGHQlhI8J4h8NI7mC+MN/a+gULQYWBuk+mWgITzz+P8hBegAit8GE7idoj+jYmLxF7RvLA1v/DcBLeVRYkJ6gzS3gVnABXE3LlzeciZu/peMkiF6AdjdpR9BVLtlzyDUh1LhQgSdPlIFCAuKUYx0cW2nX8k17DHhEH/I8iim5xsqbyNVzu0SlKVJpTuIR2jFcKAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m+EBPxSfg+pB+Wj0IRcroSzD5IhCB+OKfw2HM7+0fXo=;
 b=enm9R2MUrg8Drkz2F8meMmKvOO6x02qT2CfRWLRfmNkgdtpOpOBhq59T9S2sxfBVCaTtjtiEOMGdQA6AToNWD2H8+MnbSz3h7FNTZ2cZa9AzMVOWM3xSFp+OrmNW35LWKuvKFpyawlTJB0qqx76y/xNk0A+4Atif5IB4qXR4jgW3o3Ijx0CF89lxEMsE4mcCcu4nDUULYZR8IU8K9Vsbjs80dE9IdoKa698KlhPzrH0G0dy6czY3tuq4UbmYIcTfilCOdZ7EFzIsNmvgpQZEj6YbLNR/0j/FUy3rEkhgCaPMqsk2ig3N3hJ5M4+HNU2QZ5GFic1Qb2O+xx1DbzRDoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=skidata.com; dmarc=pass action=none header.from=skidata.com;
 dkim=pass header.d=skidata.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skidata.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m+EBPxSfg+pB+Wj0IRcroSzD5IhCB+OKfw2HM7+0fXo=;
 b=T/hR5KdLkKdb6/zHCe56ACoe+Tn0/pNBQ7FrXJ7mkErsuyQ2QRybUOEE7uJlUkA82xsui1JwdKuYITc6Yq/i6LthD9mHpZl7r4KjWyM5KqqYh6x1BK6ubJ0erc4mukDwl0fV5K8y3GCsFoJSjYjBIo8AI1daaClxvxAHZx30n7KyGIu4eHpRn+VrrojYmzJPSLxR5Pi8FqMEnhuJmBxXSSr9Bje/Ya9UkdRg+pMIMOOzJ8zC+lTc29/rtUx6tVOq8/H9hxoq5xksb7yCb8xJb4NA1kmfVYDJIgYWgCaj87AUJa/m1zlwnEM+AQ7hYlNN+zN1YkLRqPGUwdCmaZipwA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=skidata.com;
Received: from GV0P278MB0211.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:30::7) by
 GVAP278MB0150.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:3b::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5857.19; Thu, 24 Nov 2022 16:48:07 +0000
Received: from GV0P278MB0211.CHEP278.PROD.OUTLOOK.COM
 ([fe80::8882:5734:7f7:7a3c]) by GV0P278MB0211.CHEP278.PROD.OUTLOOK.COM
 ([fe80::8882:5734:7f7:7a3c%4]) with mapi id 15.20.5857.017; Thu, 24 Nov 2022
 16:48:07 +0000
Date: Thu, 24 Nov 2022 17:48:05 +0100
From: Richard Leitner <richard.leitner@skidata.com>
To: u.oelmann@pengutronix.de
CC: openembedded-devel@lists.openembedded.org,
	Otavio Salvador <otavio.salvador@ossystems.com.br>
Subject: Re: [oe] [meta-java][PATCH] layer.conf: Mark as compatible with
 langdale
Message-ID: <Y3+gRUhMkJXbG2TM@skidata.com>
References: <20221124163314.3142898-1-u.oelmann@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221124163314.3142898-1-u.oelmann@pengutronix.de>
X-ClientProxiedBy: FR2P281CA0050.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::13) To GV0P278MB0211.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:710:30::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV0P278MB0211:EE_|GVAP278MB0150:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a5ec7cd-59f8-4afc-8ec8-08dace3ba9df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	SnFNV+j3Jxx86FGQjZbbWIizWxsSpUF5TQ31CZjYYRnjXvmHenm+jBioI/hieHU8dk4DfyX4JYn4tETWWDZsWP6rXvvdVAi/SnLlBOWcSIIopYL9v1BdulC+vGDQFGyUSzxOjbykdGwBE14m3HqbZs+0SGoVKJsP9ZeD5aXSMZnDx2abIyWrsYl2exa9VYM8NZ3AHpsXwV3DKr1Ar0RXacvua+yJqgZfMyDPv3+lMVD3GUTFhBhGb4oHgp2Kop++XfKMviLN5wFaErYPuMOHHOaDjQxdSpmgMhLjFFEQMwJbW2kqIhU7N8DjCWS5HI1LsdVeqRbA5VHKS4WKq92/cJWSxjoADgJfVh2jT71784Rlnhhn5BAahthMVM1upq2EtloqKiG/ViIOt4EOlaJ8OznzkhXvxxBZ/Of/LYDgUaceMTfiuhxEeyXOxATlTd8y0QfRY0PzDlG+lJaCQpJEd7hkpWhHHIQWA/+kor2fgF7oAWX6gC4jm0An21a+GwdSxRtXSEZGL53kM71ek6i0lwBoW4LFp9y41BCqUumgZNparJl88HM1mWPVAbRIdS7RzUYIF4ynYuj1iWhjKdnPlBzisaBrGIAMA167jOY5eimlGwJI5CKfhUbUmigwUduBVMjGC6G8EVzAKu/XGoitvm3H31wETX6E7/q87wYXyU1KWOMfV+4ak1TDNrSHtGwv
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV0P278MB0211.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(366004)(346002)(396003)(39860400002)(451199015)(6916009)(316002)(6486002)(6506007)(6512007)(4326008)(8676002)(478600001)(66556008)(66946007)(66476007)(5660300002)(4744005)(66574015)(44832011)(186003)(8936002)(83380400001)(36756003)(2616005)(41300700001)(2906002)(86362001)(38100700002)(67856001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?HHxdhAnubti+xj4wWctnys5YOBkQGwjsi18d6X64+iulVqHSDscFugQ/wZt3?=
 =?us-ascii?Q?SnYKKM+M/PCk44RqIgutW2P+uA1H2U2jQFvveuoGp8d26cEofLlXtSZo3bIA?=
 =?us-ascii?Q?nViIvw088livhW85+EE0azRJlTBqBu7bj9QdEOYVRYPNbSvaU4fKnzwavuhN?=
 =?us-ascii?Q?lx0nZeF84FRc3CGnN6U5Aq6VIZdty64lUlPCYD34oJq89/baooyDw9myfckY?=
 =?us-ascii?Q?fSWhVDbJdd6fJru88g/SV+YgGG4ArhG9k2z2e1NsCepuIibe3CXX9nuwQG0I?=
 =?us-ascii?Q?vZn4ufntZirFUHdC4vZJRTf8vx7eM78JijkmN1TtZ3D1I0m1jc5jeNoJmMyE?=
 =?us-ascii?Q?jJaIX35ygKkWicC+jJmrSw39ZBlFao+BMFikY5z0zmmugIGDh4ArtSHPIjXl?=
 =?us-ascii?Q?PlAOoO7INHU1n5gjdrnyOtxQ6ZOdARlqrKVwtbHQTFmALRzA1h8fAp3gU20z?=
 =?us-ascii?Q?qZY/6AfCCFyK170whnAp4xNv8PMu4/V7nCUDynmfCPua9stS1rNFpYprZdls?=
 =?us-ascii?Q?W8hthne+Um2IWdD6Wbb0Q1VJk/YT5sHBJH9iLmDlJKHUAcE5yodIMvmh/vdb?=
 =?us-ascii?Q?J6moeWwHC324k+sh8WMiumruwZJu34XcrJymcJ/hRERbSWQAZqdQE0QfeK0b?=
 =?us-ascii?Q?aAVTWYAzbRG0TwhhfaTsHXAP4pox46pZeSET8rW+MQ5+ZoMzZKapjX4Rc/OT?=
 =?us-ascii?Q?bEHWJl0lauk6UyhmqR4iDg4GoOWzyiR4ZPx97HDJ3GeENdtKqBr8aWjbM5y9?=
 =?us-ascii?Q?thdjj/IYlReIuZrmNQbvt9qJozKuJRgsuA+p5UlBkbVC+ZBgLlDkXYS5ocOZ?=
 =?us-ascii?Q?MqXPVicpGLvwwGOB/iZMRztF7rpsob91kI8ldONMX3k3uiJzcc4ltcElf8Mn?=
 =?us-ascii?Q?a7lQnFm1oddJocIZnBmueIG8j8mMagblhk9mf+tpa/KneOyMKvCglpJ8fSlS?=
 =?us-ascii?Q?HScD/MMVg7vDDnIIxYqFYa3U7jTu6y5zQk3QIsu5e5RHERE4qQFFMaM5P8zg?=
 =?us-ascii?Q?tHqF05RD+zxSCC2gkr6u8p8QzhZ9NOqMg0WNKRM6UhaflDmOzmHBukSaH2VM?=
 =?us-ascii?Q?txRPAS0tuxhRaXG5iY4wsFxAGlugfdlY7X1HsUYo2dKkV7qw26D2RfCk77L1?=
 =?us-ascii?Q?A7cUjNGrhe/llGhnOc4W6fzzPykeKp8VsSwSg6FOx9D6k/wMgTcyttnXiQui?=
 =?us-ascii?Q?DNNQ4OJMTHS1kaEK0kwR7Tv5flnpK71oaymfMCPZCTXmjCNkSCwVVZ17Ec4i?=
 =?us-ascii?Q?bE6uJpyb6/sG5x0HB2wHkpyGEnMyFu5P5Ar7qRgMJJX9l3vxmD8WzOU6EBVH?=
 =?us-ascii?Q?imPD1edtPe4ygBDoB45UIhFRppAJq+F/5hpdDgxk3T+cXDcYj/YVijPoxkvi?=
 =?us-ascii?Q?UFi3w3XnnuUUt+5o4MDjq1Qmnx9yatg5Xx6pGqCumi1OZkOW/KGTBKHbWFem?=
 =?us-ascii?Q?i2VxCxFjH9Qy8D9GWf4DSf/Kmf/iwb2rcFczGNKjOrSVdo182qmgC8KWyED6?=
 =?us-ascii?Q?wN5qHqwEIahZ95deTZn4JPDwtBdlJFpVn8wcgNjqGDxY4Be1LILjCjXHigGu?=
 =?us-ascii?Q?8wLmBXUwt0CMq7x+17nc6fUVdzsCdmg6kBHRpH78rN9zmCm0xvsV5uM7vh7C?=
 =?us-ascii?Q?znrBhchbdKwDNJuLr+K7GZ6WOulSs5I8pNev/q7Ou4GYE5GWo2yUMmUnq6Sj?=
 =?us-ascii?Q?dqLJPA=3D=3D?=
X-OriginatorOrg: skidata.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a5ec7cd-59f8-4afc-8ec8-08dace3ba9df
X-MS-Exchange-CrossTenant-AuthSource: GV0P278MB0211.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2022 16:48:07.5676
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e5733095-4425-4f08-b6ba-487b9a46a425
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nho7yQWV97kR1arVIM+wvDgK+jBjsOdD4LRpv6cDPPjmZfgaUhlFRPh151ToyGDYfdpv4aui7i2kztZU26Qvh7RQOl3X5L+BaLr9cyFZdUA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVAP278MB0150
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Nov 2022 16:48:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99719

Hi Ulrich,

On Thu, Nov 24, 2022 at 05:33:14PM +0100, Ulrich =C3=96lmann via lists.open=
embedded.org wrote:
> Signed-off-by: Ulrich =C3=96lmann <u.oelmann@pengutronix.de>
> ---
>  conf/layer.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks for the patch. I've merged it to master.

If you have any question please answer to this thread. Thanks.

regards;rl

