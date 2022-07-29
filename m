Return-Path: <mike.petersen@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C3E5C00144
	for <webhook@archiver.kernel.org>; Fri, 29 Jul 2022 17:09:00 +0000 (UTC)
Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com
 [148.163.158.57])
 by mx.groups.io with SMTP id smtpd.web12.552.1659114535902897169
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Jul 2022 10:08:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ni.com header.s=pps11062020 header.b=02dDJghx;
 spf=pass (domain: ni.com, ip: 148.163.158.57,
 mailfrom: prvs=5209489cf0=mike.petersen@ni.com)
Received: from pps.filterd (m0239463.ppops.net [127.0.0.1])
	by mx0b-00010702.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 26TD2JoL027927
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Jul 2022 12:08:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com;
 h=from : to : subject :
 date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS11062020;
 bh=eiL4B2US4eLcK94LOGcWxmeAzedaBOzzLVQ3HmxoKdw=;
 b=02dDJghxAc/EHj43xt6GQiskh2gqIlD00v1w3jZwKYybbEZPaXNbtqH9WlmlTYD/6kou
 ffGAbgh0YeUlCmvNjRYwYd6ERTdS+W9HgGTM1pfeTf/dPaLhauJ4rf0hRX3ah1gJ6iMG
 qZB1ycLSns2jOr3pGHmwPjiNh9RGS5o2iMtH2sAOhFtOU1eqDq/LdgPnTapmW5KGsDU2
 MTdpxJ0jFfI9cwuRSvU+RyaTsOqM90pbazPDahIKc8anMS2ZRL4XS08aO9nLz5Nd4zge
 VQz0G/gnBLuatNEaG7LP/T5U6AGlJ0IblEQd2EcTCsGgBNkr8vz78BGkHejZH+cthomd eQ==
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2044.outbound.protection.outlook.com [104.47.51.44])
	by mx0b-00010702.pphosted.com (PPS) with ESMTPS id 3hgccf3d6g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Jul 2022 12:08:54 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WgXFCgKzkDuMxsUpyc29Y2r8nONAMdbcmMXaZH4akSEw5ZR0x3AydOdVK812HystY1jHkpEBtsxaGZDQU1kmo7pafkBYLg9t9AnaB5I0y/oSsJ7lKTXiwJJhKPxDfJoVn7nrMayYIasHkeStopCJyIe/TpDZf1gz92//ILT+RJLWmyg7S3+2VCOaLgFdVhNyt2IU3PEHqTI22BnOZvYsHOgxR1R+5sVypVQeQHDzYlILRxN90mDt77rhFogNQ+h2eluy/vI6bNlowiEPBcoASRQ0wWZBRWnAXJ+q8XxhSUbhZAEJ6KuWRWhH6mJLx/YnlpRffeE8gb940kB1jcibjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eiL4B2US4eLcK94LOGcWxmeAzedaBOzzLVQ3HmxoKdw=;
 b=iUg/RgWdpUFzIlKYXfLEapCXNLLFkGWfXvrRI1gt9qHuIHgzcxDwQOvRmNH675NLb4q+taw7OiBPwkCAMdjZ9EmyiLuxuZ9NJn/UUtO5vQbMSpW9b7RRrYvJUAbsYALZhwdK4yPeEUzTlmn1v4Fjge1+9VQfTCGWUhbeq5z4ARkhY1MPNg1urcvFx6ZFxJfh1jwnjKFJY1Ixim7TUW7NaOHkn+pwESLuvjmKCAR2kN7JSXS4284VXsA424156TSKL5ooCG63GGApNpzR2elnhJ4Koa76rW1ufVYXkWjHGJAcZ8aRMzr6bziZQ5cbz/PjX4ZvcUnN8YQimO9CpWhOnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nio365.onmicrosoft.com; s=selector2-nio365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eiL4B2US4eLcK94LOGcWxmeAzedaBOzzLVQ3HmxoKdw=;
 b=BrYbcFbSK0nyHlJCYfAP7nLwwc8ltqhdlfyoAfNVJEthfSeG3iM2+i9KnP9kIibSeQRPxVDwuOlByUS4xcs0/wvAr5wgD100eVIIOwr472wJ5mnQT/E5kWbDozHWNDk02n/7ALWdb2JlHQ+EUtrWI1LuPjJD9BadASx+UahmlwU=
Received: from DM6PR04MB5420.namprd04.prod.outlook.com (2603:10b6:5:105::30)
 by MW4PR04MB7362.namprd04.prod.outlook.com (2603:10b6:303:7d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.6; Fri, 29 Jul
 2022 17:08:51 +0000
Received: from DM6PR04MB5420.namprd04.prod.outlook.com
 ([fe80::fda0:b935:cbdd:4d93]) by DM6PR04MB5420.namprd04.prod.outlook.com
 ([fe80::fda0:b935:cbdd:4d93%3]) with mapi id 15.20.5458.024; Fri, 29 Jul 2022
 17:08:51 +0000
From: Mike Petersen <mike.petersen@ni.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH v2] sshpass: add recipe
Date: Fri, 29 Jul 2022 12:08:43 -0500
Message-Id: <20220729170844.68097-1-mike.petersen@ni.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN4PR0501CA0068.namprd05.prod.outlook.com
 (2603:10b6:803:41::45) To DM6PR04MB5420.namprd04.prod.outlook.com
 (2603:10b6:5:105::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7f0bf24f-ab92-4f11-127d-08da7185025e
X-MS-TrafficTypeDiagnostic: MW4PR04MB7362:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Uue5NpXvNBDrPfV7Zl99fn+6aHYB4HPWhQG1G3dewDDONKb/Sz3itAw1fJy35K6CgCDd+PmQ7tRw/9WpcTbj9T2pnKYn2FG9fVgES6pPBhSHpo8+7E7k5i9EQIa5vxhL3ZrCGZhS/H+67gnxbXnVQc8SQEKojjNtG8WOiI9LYxL7LjZPIbPH1S1+Th2KGxb/FEABTQLyQtKVrppZJNKwOOgKSpRbN0F4LUwacq4bAiLwQfIaWXLBgTc0Nh7loL2aGWd7UIq0omUuBIcJ6L85L2SgyrZ4HihsOg2J+s7VybqEZz2Fl5ddO0r2FVM5jsOBk4IxnRoDazQLCJWidMM+tr61rx07bNIKPC+13ELdk+oSulOJbdrc7dEWNFUajuU0LqIDxpkKcpKXkG27PRb9gzW6LqASHUYwPaQzRG6iutrjmPJ5FNLo8/qSMHrl2Ab88il1u3ltx2ONRDPfAYrkDY2fV04NX5NZcNIGTD0zXvCJP0jZ0l/rDuQw5moK3hg9Aq3EehueiRy5HnxfwDNVB1Vsq7495iGzmfEXjT5ts4miFB36LUnni09rhH2GHbNWXMpK3tTVjdR7hv73hAIrmt75nJfHg/omQmo0Ye4YngP7HOH27kNYej/bFtQ14xR1AQReDK9bInHUXjySskZfhwBThblWCP/d8/VScG7omS5jaDCGxo8c4qEbCDW6+TcBR9Ohz2p/SPfN/3SbMXjBUpwbiosDXukIOh97PglSiwHqNIT6FWAHpKZ3EfR5JXtX
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR04MB5420.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(376002)(39860400002)(346002)(396003)(366004)(2906002)(6666004)(5660300002)(6506007)(44832011)(478600001)(2616005)(41300700001)(6486002)(86362001)(26005)(8936002)(38100700002)(558084003)(186003)(316002)(1076003)(8676002)(66946007)(6512007)(66556008)(66476007)(36756003)(83380400001)(6916009);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?iC+EKWYx81WYoY/Ow+VTTD38ihN1IYJQnFKmbPK9f6LwC3bjZUV4numHnqiI?=
 =?us-ascii?Q?0kvHIum55Vgk6l4G74DU4REQTmYo8vzXKn43U/JkTXiJfHbtyB9gbUe3oJ+q?=
 =?us-ascii?Q?PLFk+X6xdswN4DwsI1cnD32VFn6eq3DqItlKcAZMmNCkhCRZG9G9ZUu7+v9M?=
 =?us-ascii?Q?laKun+2m5hSQPdnNFYt9bFkHIzADTUL2G9xTVBq886JTaeiJUNiCMwi+PO9Y?=
 =?us-ascii?Q?9KWsLtYqJSZktA8qr+k2KViAi9m06oL84PacBaKL2XkNCWfYB5nJ5Qbs8wzE?=
 =?us-ascii?Q?OWsqxtWHd2luuQIo/DmdFH5M2NdUURJOfEHNYuRwEp6m7ipS/1JUaUi7r4SI?=
 =?us-ascii?Q?DAs9O+R+AHH6BT4e5MOyAia3E66J23itrvzluQKz95ejKVbQQcdjfun7cBjl?=
 =?us-ascii?Q?++p1eD+0wCag98woaHtyMBRhBhwKgFV31YDMrXAg8lZN0H3Omn+s9G5rCp5N?=
 =?us-ascii?Q?kPvuX1dqJ7VMtn1BTLZwWE4KHPDj0TwrKPATZrSGmCtj+F0lowm4X9CIPbs6?=
 =?us-ascii?Q?4rQJPAE+9DsqmpIUQdnahn40YGgzCl7+wKmvkK/UAy5B/bFBdp55B0zdTQ5r?=
 =?us-ascii?Q?y89LwKiMml88p99m8r53bHrObIIHFhMjsvEIQdAQ54mSbUSXA6R4lI6ZsVwf?=
 =?us-ascii?Q?EAXKLNaQdx61g82sekoKf5jVG8HZPr5eMYHhH4qImS7XYsgeHJxq+IYj7zZ1?=
 =?us-ascii?Q?jigtFzKbfFGw6UDO8Ddo7WGDIqKniu/KZAlQzQ8BMuY1MCySwhkVVZxN7IWT?=
 =?us-ascii?Q?h3eCh61DGc7CBxBaFje+Ilc8hPA2rOSO/nU4KZsC/JNHSArOisCHrcmQf2LR?=
 =?us-ascii?Q?0+CmGK5EAqm9FCGOH+PCwfoODUF4Hf+m72vp1cH+x0QKKlLxZIJs7FW834FU?=
 =?us-ascii?Q?3qFBM/KpeiptcREEKRqdwrdjKBtaGHXD2F8h2n82iMw7/QxRvsK5kmz51hVP?=
 =?us-ascii?Q?+ZyazSSrZmTjMBeaI1VZamC1X7X110qoUiFZioplCUsSnro3i2gLthympqaU?=
 =?us-ascii?Q?nvjKzZ7GHM1FFXlWGEdpzKdfGHYHHfIiKSSH8sciztVMGMAlBwfqVAHLckvw?=
 =?us-ascii?Q?hlw3nh5VzBuNSQhA8mi+KrrJCdJUwn03GOvMvuPxD95cYKXKL5IiL4IEHwJz?=
 =?us-ascii?Q?jfffp4yocAywN4F+2aIb5wRGOaboY7QXawUE4ZZOYjcXCOiBl9h4uV/AF1zp?=
 =?us-ascii?Q?rX2hFln6VEtAZ8RIqc/gZeTAvjRPktlu/+g/8A1iPifmsuAWqTaMbeFB7g7S?=
 =?us-ascii?Q?24qoOA/+5LR1Z/oBE7A9qRvy6eazAua/SBheOovNcHnPKnnd+3QQrRONUojw?=
 =?us-ascii?Q?9yRcxzNRIaZvtfW1fB8muaHKCxOwuv8XYVE4m7TKSbw+TOOWS34xo8jGvcCe?=
 =?us-ascii?Q?7Y6pF9F6ISLqICNs0pCpnAwLEsnSacaHhPOX8g4fgTaeaH4hw9rqkfAMVPWz?=
 =?us-ascii?Q?3PUiN/rYKMYTnR2HwWuIV18Ucf/tVlP9vNzBCC1RD7pynIfNNH8qsnmdtiYy?=
 =?us-ascii?Q?bwOZIhTqwRQyaW4kO859SU8YYUZNrq6+FnURahTov2/QlErgLcGxJqlCyH47?=
 =?us-ascii?Q?YWeke+hIFJKVUcqFj31vw/OZuzZsf3TTEjNdy0ho?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7f0bf24f-ab92-4f11-127d-08da7185025e
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB5420.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2022 17:08:51.1905
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 vX26M1L78aPHsGAffDr4sHNPDhr1nUUUATXyRJpqSarp8Jqb89T9N66Bw2ZcbMJGDUhMf3nRlTCdHqV5+KyNyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR04MB7362
X-Proofpoint-ORIG-GUID: JywANpIh-sZB2WodHeEzyFGNZxUAhDwU
X-Proofpoint-GUID: JywANpIh-sZB2WodHeEzyFGNZxUAhDwU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-29_17,2022-07-28_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy
 score=30 phishscore=0
 mlxlogscore=661 priorityscore=1501 mlxscore=0 suspectscore=0 adultscore=0
 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=30 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207290074
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Jul 2022 17:09:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98049

Changes in version 2:
 - removed use of PR variable
 - combined recipe and include files
 - upgraded to 1.09


