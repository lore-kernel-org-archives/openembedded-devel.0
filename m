Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFC74CD4F4B
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 02:59:24 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15570.1763002761188751018
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 18:59:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ktF9YHLq;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3412a946d8=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AD0TIAs080885
	for <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 02:59:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=sdwlJ9rrEKllV0pcKL31AXSJlldBH5Nw5HihCmrox/8=; b=ktF9YHLqDPt6
	Bf1dfrDoe3hqozfrcl7nT5FeFpzvAIFCERtlHMhTd8JUT+BmokQwzknj3CBVZ4jp
	7SP7uLzriywvkt0wjm/FE3f0tmDKSgfzsSWjEkRfEea5wDwdeuEnWj51kQRZObqy
	9V9d2hIuNYTg0uVmMHWp0ddpoTfxGQ+Yy6h4s2IA4YCb4fnIAfWP+Ztmd2FrI+i1
	v3EvA6DTrxkAAIbM0WMiAahEOxJ/fUGMoCWlUTO4+7/OfoxMFcvwhgNMGkzkXzTS
	4gAA5jXe3nePrAV/03mG7U5eACOxertGD2Ncx0bDEaIo0fgox5pguzNnlrGxZxqt
	p2f3RElYaw==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013002.outbound.protection.outlook.com [40.107.201.2])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4acwphs03d-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 02:59:18 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rHUJEM7cIQWvtmRZ9YiPBbLUq5jt0i+IW97eBHbRVwbfDfyAr4PpCh/W/CRH9ww12Qs04zCZpNQxgzPXccUUKcQ7Id0iJH2ycg1n9TwCJjvGch6Mlge3c6arThMMtpANpyQRyZElJQFmpSXZF8hgZHbX3CYJHi8zbE9o5Wie2/MKcJUv8AGaqdYYcxn5YG76OsJ6DzqMhZCl+l7rSyF8ElfipWwagQ4xZBi6jefb5HY1bqIdGPbsZcn4nNRCdbNmv+9dutK3UvwBnmamLIFrMk/5j88t8MQz8oYTU5rfIAxJ3ezfe+kP5CgGFXEW15F1/DRoNh5j82S69lWGyBbSfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sdwlJ9rrEKllV0pcKL31AXSJlldBH5Nw5HihCmrox/8=;
 b=oGf9G8yAWWKpSApnqm/LtgtQW1HzlQyUm5y/vik0DlMl4TTy9w/T7gQhdVUHCdAK84+b9+Q7Psk2HnebfmJAjilvxP1yzbTXgC64cQwLkoI4aHPSDtISiOrYJXsh31Vu9jFuDu/XJ/sOvOwDIlK11r47tNmL7JW3w5UJgSNxOUUB7ddV5ZNt2slXomFpehNi0dtoNrKns0DzRvFOwW4ZN20jbrRI6ymFojAH1y0UI6n8ePc93FVqg8lchfOXYAfFEBZ8qhsj4NKA07yU78rzL5oxt4ujrNTZ3Ih7GvuxmwXYzMPBokGDxAc4ZfJrTeSbvxBsqXS2pq9wpTKMLMj5rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 PH7PR11MB7570.namprd11.prod.outlook.com (2603:10b6:510:27a::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.16; Thu, 13 Nov 2025 02:59:17 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 02:59:17 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 07/11 v2] python3-pytest-mock: add UPSTREAM_CHECK_PYPI_PACKAGE
Date: Thu, 13 Nov 2025 10:58:51 +0800
Message-Id: <20251113025855.1520038-7-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251113025855.1520038-1-yi.zhao@windriver.com>
References: <20251113025855.1520038-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY1PR01CA0197.jpnprd01.prod.outlook.com (2603:1096:403::27)
 To DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|PH7PR11MB7570:EE_
X-MS-Office365-Filtering-Correlation-Id: f6c0e290-c453-4055-e1c3-08de2260a27f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?L516sB/UZxRStmlIc02+zL83y6BhuphtrpBTcGHw3dKMrQll9exKTxf1yifD?=
 =?us-ascii?Q?Z4LHXLStNf08NfU1ThHRVuE5qErGd01x//YehSexAI1S5QhLKqhRKVaPHHJg?=
 =?us-ascii?Q?MHMoq98+UPt6crQJ52J5ivEDquYIeTohCpUPeuSWDa03MqLcMPoayaxesmaH?=
 =?us-ascii?Q?x5R09NaP8Or5TrGn4YOREMOeST8qYMCk+NRZK2VzWJrYqqmB0i5PRxPTihuj?=
 =?us-ascii?Q?aD3rPJylokjIMrpW4aBLqztm6Xx/MKW77KCQA6m9x7N3QNZctwFVbOqBRQlW?=
 =?us-ascii?Q?+VZecgjDB9wA699VvvtWRw2tZS/dK0Dgo3mXVUN9YAruKJ11pvEu1Wsc3cve?=
 =?us-ascii?Q?ipwT1TEW/yIrRhZVmvT0JXkNRRyC+etcygcLiyqELe/+WujxiiQXWyHS4jcb?=
 =?us-ascii?Q?U5CIw8tg8n/BTDRvjXjLjOfym/Yw0ZeDWDrC/hWMTJY9nBa8z3cnqVpR40e6?=
 =?us-ascii?Q?zrpaWrXzL2sKc4493NuqWiqmvqir5jgU1HFNma7vx9EtgRkX3jpuL9iaJe/f?=
 =?us-ascii?Q?1S6WdkcB+wYIu12AbomedJVlqal726BV7ZvNqhJRPYj2nE+88vCvE/oxfRCd?=
 =?us-ascii?Q?2d1oMYmZnuEHYVHC4vUoADhC9CLHf0T0FMmqMqv0No8Ir1BSSgRNbrZoAv9K?=
 =?us-ascii?Q?P8G1FOkwgRBcFim/m7dr1dRg0nT+x+Z0vngAjiea0/0RAC/2ikrRKuYgUBN2?=
 =?us-ascii?Q?JwPk+IaHiL3a66LCkeoDReeFmS9SjQAbyvgkMPK2oBHhGqefnQKJi3GAS7+7?=
 =?us-ascii?Q?UDeOYHC+r3fU9gvSUJfc2zZEuTrVbJVrWt9kTqtCXv0zyq5qooeWQ9b2l+/d?=
 =?us-ascii?Q?VMtHufaDwnnicwgIdrXq59cfvUfMdp7Kf8u6Zx3CAd2lqlivJ45Ok7z/7zMn?=
 =?us-ascii?Q?mIae1YS6UQO+UwMKqe66zdK3joDSlbXctd+Z3m0cPJ7TBUpNq7RGBEdKrdUr?=
 =?us-ascii?Q?TTAm9OOioZ+rLAbQjjp4vzBea6bKygYrgOHZhmhK3O0h9h0VZ2dmouDp3mYD?=
 =?us-ascii?Q?6lIj5bPbY0NTgAHC7t60ndhTSpJGM+1TLynobl12w+rx12OgU3Ycb/D30SbA?=
 =?us-ascii?Q?uzQ5F9h+PQcgIu27zA1qWcvYjmFSx46XBFK73L2xUAeMEEg1ShtPF835eYyJ?=
 =?us-ascii?Q?Jrak1w11FzzYAK9lZ4bSJrHtecEB4YgKPl/q6XU5mdBlVB42r0VawFLKdfLj?=
 =?us-ascii?Q?awaUaV4xEo6KBFSZBmyOy+KuQehgVb75Iu92dG7fzpe/dNWvlYyaWKJZJRzX?=
 =?us-ascii?Q?eFI5xxs7ef3dAFfy8AAnXs4h+bYnoFOPxIt8ziCuvm5DWgNI0tiTccFN9DKX?=
 =?us-ascii?Q?pSXEe8zGrPXxCkg0FXM4QE1XID081ZRldcreCMRd409+U5L2Hzw3VZ68j+Ny?=
 =?us-ascii?Q?gsfciMQUierp2Nhn4u323pSxTBsc9p66TxthiOQmkvsVt9LOi9CpByl0pDFl?=
 =?us-ascii?Q?xc2MKcl2N5tZ6o1BmxcOSFG2aIXyzKL3xA3+zxHui1TFlL9HiwFU0da4RaYO?=
 =?us-ascii?Q?k7mDkBN6yNrU05gF7FonxmwUJmO+rz1QbAf2?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?JGFOFkXQxPKKpjHKD0Az4Id25AALYedUlCSmQjqhBpJLT2RPBa91KoYjTtBu?=
 =?us-ascii?Q?XOd7B6n3hsYQtdh3SrO5zBTr9B15YDC9D3vTEytnTBmNbIiwCZxf2kxdPPqD?=
 =?us-ascii?Q?+rGRF/+oqv56xdrBtGcypM2N7kQ+CiAk7e8DwXrZai5+Y2quP5hbFFlh0GSJ?=
 =?us-ascii?Q?/8DuNI0rXRnkETQih5yu1lmrzvPuGXWGTfsgCSXRbdPN6GTuBNi92Lij9PFV?=
 =?us-ascii?Q?puBnzb0I3AcW3NAz1naG8x+bK4BcNacAWYY3CMHY2v7E28PiODe/RDLKIAzt?=
 =?us-ascii?Q?byjF/IW3TH/vly2QDkiwbxdjmZ4xePQPKkNB3PbvoNFX+bjODdwJ6PJopk8P?=
 =?us-ascii?Q?zS72nnYZTEc4/fSQlZUCtwUv0+AlfOx6gw2ESSSHK04rPWH8nx2kVEMA0K7O?=
 =?us-ascii?Q?1P3d/OVKFZV8D4FQNG4UNph5BzPLlXiSSqIcwDI/2rYKdyLU/ZeTKtzu3PX/?=
 =?us-ascii?Q?Sgo44juC0H73Xs7Vsn0qQaMXR+D8ZIxvd5Y1g8FdZoLKd9Slqxt35GduOL5V?=
 =?us-ascii?Q?WQaey/FqIg82g4b/zRvWowMq+46kJsQHKn+ODT6Okl3KZDuhKm4WkVE66UYy?=
 =?us-ascii?Q?7j0aAZ76g4wC5WrLvzg/2lHs7SUaHUzGbWcjUNf+w/qfTyAsbzemtMP5FJua?=
 =?us-ascii?Q?LE8IAdYQRj8grU643ydwKJq8wOWZ08XqBGP8fJ3ow6axGLj80kZ6sJxN6ZFZ?=
 =?us-ascii?Q?sru1c+MaR8WHFgaZxi5lUfmXRcOn3TXijy7fhfVmnregNrFIBsRt9dZG9qR1?=
 =?us-ascii?Q?nEITFGYyqRq03N6tQlMpJV48b9FVZCPRzS1U6p8/tqRMfBxR2t5kBQSTaTj0?=
 =?us-ascii?Q?kgA5PcvBqt01fPV3NB1ElENvO6koUD6Kajq5mZaLIkiDrQdqizq+cVmjWi8X?=
 =?us-ascii?Q?9PvJTf/qgixV//QmjSNcUQE7kb8z1SNwmARcMy59HtVcBZBp73nwT+kJTinr?=
 =?us-ascii?Q?nCM7cGe3tRoKfanjVzK4/5bSouWnI6VAiGNRplLDFT9xaY88l5CiEyJAIKtJ?=
 =?us-ascii?Q?MPBCRXmHBykdqWr+2o9tm8wKQ6LRLB5e+ghrw3VpxMMYblHExLxeQ/W5j2e8?=
 =?us-ascii?Q?qRq8BQLF5QCysoZcn9Anj5VYHPdrVO7sQEAA1e1Lja+acG4BP0hTRW+vnVaQ?=
 =?us-ascii?Q?JRz0SZf8S34HQcm1cYevdqESzJlMeReHvOHxkngxLmzG+VqBxttnN90yz03N?=
 =?us-ascii?Q?F0uEYQEJbQL5yHSaoN00xElMU0DT+m9kX6rQhk155666WApzxtqnDPl0Lob7?=
 =?us-ascii?Q?O05uRmzbjaFqjkNxQDpPOsAyNFBLX2NYqDEhtu0hmXzM8wjA9F3GM9WdDEZW?=
 =?us-ascii?Q?DuxLj00eYmmdjTm4sizGyyY+kxU/KOHbPavXAbIY6mZdkWcylsUmz5AkEhqZ?=
 =?us-ascii?Q?Ks2h8QaBSvXI5Ms5TvVZj7eVWfiobSDgIP7faOvIx0gnMsRFqXWMCtsETcBD?=
 =?us-ascii?Q?ZPBe/26GTeu9gzYsMvd6jNIRutNkwo26beNFy8BbyzBF3hjyenfRUbELa3CP?=
 =?us-ascii?Q?75PKdRIMzZHllw0GZQr4gte8b4+R8G6v4PUV5mCxoxz0gWwDKiB0HZNFzvpP?=
 =?us-ascii?Q?1qCxKmgpnwdUgwbumrhseMNF7fKNeCpV71XFYajW?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6c0e290-c453-4055-e1c3-08de2260a27f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 02:59:17.4034
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pelAvrV4/GWhKU0YkPoHFx3k8zxRCx+7fvOAaY86vTLVI9bIYgZUOl/fujcP4nZYF7W/GWtW1fx4SaBqvT5idQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7570
X-Proofpoint-GUID: IR3NqXVNBW1asvySHFVq4J72AGy6Ht_T
X-Proofpoint-ORIG-GUID: IR3NqXVNBW1asvySHFVq4J72AGy6Ht_T
X-Authority-Analysis: v=2.4 cv=TKtIilla c=1 sm=1 tr=0 ts=69154986 cx=c_pps
 a=uYXQfM3GD41LpGGBCGkGnQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=kUVeYLXjIIuvM4cXws0A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDAyMCBTYWx0ZWRfX8/A8b+bfLrxM
 qHdTA9bOGR0ml/jJLXpn+RQY3SPYABe/wrZIkVMaGX2RYNdG4vehtY/AueZuXRF5s3IG/WStFT8
 cR6UhVdwjBnTFRcb/IRnVDg+EcXfwbre/elKOQI4FORUXnDWsn+RlXzJClP3Ja4hvvUz7/71QfP
 fMlRGd8xRUl71IzN+oT8eM5CiKtS8HlB2ON4/RXVCXp0X5e+P459x5B9KFT9V9ZP+VJqRY8qT/m
 UI0pW9aDYEYLc1j2bHNlubEfbxKKOGVgqg7isZtTGivd8lnldhIRjqHGMFLqSFivEpGSzM8Fu2I
 0X+MOMJvnMUAYBfUc0D5+0Sy98k5S4fTdKd6O1XAzu9YL/rcuALYeCMIUVQZxW8I8EhShVhZvcv
 yGvrRn+3Tn3dnVPihPSjN2cBgBaf/g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_06,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511130020
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 02:59:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121592

Add UPSTREAM_CHECK_PYPI_PACKAGE to check the correct latest stable
verison.

Before the patch:
$ devtool latest-version python3-pytest-mock
INFO: Current version: 3.14.1
INFO: Latest version: 3.14.0

After the patch:
$ devtool latest-version python3-pytest-mock
INFO: Current version: 3.14.1
INFO: Latest version: 3.15.1

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../recipes-devtools/python/python3-pytest-mock_3.14.1.bb        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-mock_3.14.1.bb b/meta-python/recipes-devtools/python/python3-pytest-mock_3.14.1.bb
index f107e20ff5..07e2c60f54 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-mock_3.14.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-mock_3.14.1.bb
@@ -14,6 +14,7 @@ SRC_URI[sha256sum] = "159e9edac4c451ce77a5cdb9fc5d1100708d2dd4ba3c3df572f1409735
 inherit pypi python_setuptools_build_meta ptest
 
 PYPI_PACKAGE = "pytest_mock"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.34.1


