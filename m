Return-Path: <trevor.gamblin@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4082DC433EF
	for <webhook@archiver.kernel.org>; Mon,  1 Nov 2021 19:12:35 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.871.1635793954382756531
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Nov 2021 12:12:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=MbVcaYA8;
 spf=pass (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=69396f8abc=trevor.gamblin@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1A1HcUsn018894
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 1 Nov 2021 12:12:34 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=content-type :
 message-id : date : subject : to : references : from : in-reply-to :
 mime-version; s=PPS06212021;
 bh=l3sWnJWyTd7gAIjRzfk2RS3bv4gA9hZ8sE6aFLrUlTI=;
 b=MbVcaYA8O4vjNdyBdVwJAZaB/TmrZpuSyVGnwmGuXethujTB01wFOP3gQis4yMw8bD5C
 IXNrTmIV49CP47gAgFThisZIv++EcwNokmzx93j+AiPuxr6d9MolXAn5dIRk7nQAtcNO
 UFOnhpSyb9jZPzmURYjly/yksWVr6uZcgnydcP8xhuvY6vUUhRsWaH+Z2EDJoqg5RWua
 Gq6hphRacnGXnwdNzZuYjNKLA0bRSn8vYXcNcJyhp4Rb+pQoBl6YUilg537iXINebuJ4
 tqg3yEu5Ii0wJfIiQlDKdY8FwH0CUiOneFTgZA8ajcQ/XXwsevXTKXaZQPuXFHlojFLF OQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3c2asc0j1p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Nov 2021 12:12:33 -0700
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.16.1.2/8.16.1.2) with ESMTP id 1A1JCXmA006749
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 1 Nov 2021 12:12:33 -0700
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2175.outbound.protection.outlook.com [104.47.58.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3c2asc0j1n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Nov 2021 12:12:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nIGcYdR0ziJ6CSJqaVYyk+hgc71NNCxyh/WdnkBjFXHe3G8BA0uVA0qlM5w48zXK+cajiw+uYHmoNdg+lpw83l/NZ83EmWGbUlERldjAa1sdXJQFGHRSfOVMdZbylHz1mUgNns+mhu2Zh4W3hWvkWxzI8I5XgPPunQPoh7IaM8Z43TPIj4i/rU9lRVuIMRQKYlOfVwNl4pXJuZPEON3UgiJ+vNXN2Jg6EBzA+9zFstUHcDdLBPdFT6J/kXairhRWIqxl0ncooEnJsSj6M69Obkobmeq/MwaG3CAadNtNZgxKM0t+ZsFvP8Z+HLI4fSxJDkNO2DtSvezlqZHHj9G1Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l3sWnJWyTd7gAIjRzfk2RS3bv4gA9hZ8sE6aFLrUlTI=;
 b=gRyYzktI8J0NAO19uvUoq9kaxgI3JAG0f8pj7qTrg1UmdaRDlNzcMHnKf3M+LQOiUcsZBTGzvksMhW5iHc3Cgz0CX4oz7XoZmNqR+sQPUA6Ya1DshBVi7M5aD62Y7kM6SoKt5DfumPyY/xu4LNiwDGlrnu5kPx29bNN7+iLvDN6kdHits/K+4+xBNNrUu/LTUDwOVjAZqlviz6njc+bNW1yNRKFCsDTxOzAHT5CixBvlijU45gnLEr/VCovoisCU3bgIE/QOqJGG25Lf/1oS62fjpchOXM0V/hsxupVzQ3pNbT6v2NiaUpPqfcYo/wvcwDKj1qwzLBNZ4oZHxc7ulg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: burtonini.com; dkim=none (message not signed)
 header.d=none;burtonini.com; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3303.namprd11.prod.outlook.com (2603:10b6:a03:18::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Mon, 1 Nov
 2021 19:12:29 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::ccb2:28ab:f000:8440]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::ccb2:28ab:f000:8440%3]) with mapi id 15.20.4649.019; Mon, 1 Nov 2021
 19:12:29 +0000
Content-Type: multipart/alternative;
 boundary="------------IqrNC9DWqkuOaxghkfANXE0B"
Message-ID: <b10ccd03-dd16-1e54-9372-1fd7c0261a8d@windriver.com>
Date: Mon, 1 Nov 2021 15:12:26 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [oe] [PATCH][meta-python] python3-imgtool: add recipe
Content-Language: en-US
To: Ross Burton <ross@burtonini.com>,
        openembedded-devel@lists.openembedded.org
References: <20211101161831.1978140-1-ross.burton@arm.com>
From: Trevor Gamblin <trevor.gamblin@windriver.com>
In-Reply-To: <20211101161831.1978140-1-ross.burton@arm.com>
X-ClientProxiedBy: MN2PR20CA0059.namprd20.prod.outlook.com
 (2603:10b6:208:235::28) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
MIME-Version: 1.0
Received: from [IPV6:2607:fea8:c29d:d7c0::e120] (2607:fea8:c29d:d7c0::e120) by
 MN2PR20CA0059.namprd20.prod.outlook.com (2603:10b6:208:235::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14 via Frontend
 Transport; Mon, 1 Nov 2021 19:12:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f662484d-b2a8-48a2-74af-08d99d6b8c5f
X-MS-TrafficTypeDiagnostic: BYAPR11MB3303:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3303773D626E867A3E6A735D9F8A9@BYAPR11MB3303.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:935;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	PETyCQFHL/8vw0rD4+Ue+mJuq6CUB29Ds+UG0MiygIP4uibL1aj6Y1TcGKKc8aTavCzd1IKtU7dFiyr9Ptv5L6Zp7sN0zwcWFhDA68VE9cz4q0AsNuivEg64FaK5di6j1mHWCGWsOnQAeSm9lFJXHIcqImTpD4UK+Ft7PfhRRKtz2EoHlwuHJgqzFf0z7Qyd0hcELohdix9wYcDKPNcIgxS1wIaaldbii2Nw4lPNYWLQuKW3AE6xpcRsj/kQaS/UgbkC/djP+PJ20sq/JuGytpcVbhzvMpj+AUkP5TeVcecJ44O/gEtErezrvvyUv+ES2w/cs3ySzb9p2ZR8vrUECDHh0dSY8uxVBJtgD8ckbK8b+Mo/v2vsNODeP0oI2RNCLnOn9SzLFM0o4eJ9hAa/V1V9dKt/51H2Pfg4g/jRizwtSmWtVssIqDSE7MdvlDI8KXoJl9gb6cZfELeB1ywJM8ehU/0CRtYhEj0IPB9CWHScsK02z4RU2m0l5aRyXMkonk4yJep3wYVR2BJhr/MKRxht+pKS5K+X9+Z0E96+cpg22Aw2EUEseRLcLshwblPETrYjOIQpXE6vNHNVl4YY9rcjhJefpGKwM+DymrI5zxCOmtUwbVHjZdGm2mvFD62j/EnFt1OT/E2xUVanFnb2O/MdIxmRez/C7FqBkFKru+ypnyjyUfb49d7NqIFDHN57aaYoj/O/pj6uiXMGIJA6qML4CAfVqUDWPAYupY5NkaokspIrNPtL8I2Vpwz/+qtV6RXJke03LvMXF9QRh/6pK/2Ggj0AvEMnnDy6GYyAh4NI99FEfAAI4X2+tDfIzCYQdl/ZdIiKu4Ny5Xfyg9A0ftkvWefFnR8LnQdefGvWCMA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38100700002)(5660300002)(508600001)(66946007)(6486002)(53546011)(33964004)(83380400001)(166002)(186003)(2906002)(316002)(36756003)(31696002)(2616005)(44832011)(8936002)(966005)(86362001)(8676002)(66476007)(66556008)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aHZvdTc5REtPMjNLN2JnbDk4Nnk1TVVKQnh0VnFzVjFTK1Y5Ym1XNkdINm1z?=
 =?utf-8?B?MVlETkNoME4zNlVUTzRDRmgzSWR5K1RtbnIvS29wR2lwelZHK29TVzkxUVpU?=
 =?utf-8?B?VS8zd3Y0Sk5NUGI3cHhxUjJLVlJKRjVVSnBiRHZEb0ZuUDhrRnNKT0JQbWNM?=
 =?utf-8?B?R1FlVVlyazI2SStiNVgzSDkvZklPVUFoZkhZUDMxaFZIdjNiaW5IdS9VNHB6?=
 =?utf-8?B?UDRYNGpRNVdzS3hZUDlyZWprVUlXanM1R3hCTEFJM0tQdFpUNXVmc3dVN05J?=
 =?utf-8?B?UEIzekxyOUVjSWlWeFVNRmt3N1VKTVUxdFBPQm9vTUtNRzJNL2k3a0JFSUVB?=
 =?utf-8?B?WGVzYXBDQVdiTWZXb3FJZ2YwUHRTU3haWC9FSUtpT3NXVGFibVluRDZjZm9H?=
 =?utf-8?B?RWU3QjdQRHlTL2g0aHc5K0YwMFB5bGdFbHM0UHk2bjdWSVpKb2JPUzVVSkEw?=
 =?utf-8?B?OG52RTV1SnJtbk82TjRxWUxNSmFqeUlKVFBuOHBnOVZFeVBML0lSek91SGpL?=
 =?utf-8?B?bE4zamNoajdXVTlNZks1YWEvRzJ6aWo2SURGQUNHMlRCTk0wMVorb3ovZjVn?=
 =?utf-8?B?L05QYWV1dEZyM0VHOW93UHZYTGRsUVNwQ2hwNW5xRFIyY2xFaFQxaUNXcnZZ?=
 =?utf-8?B?Z20vNHVnMEtBRXR2dE8rSkkrYnQySVFnUkp0bDArQisxcldabW5uTXNxT2lK?=
 =?utf-8?B?ZDBYZXJidk5YS1A5NW1XemxJclRYdk1JN2JYMDhxUFluZkVPMVQ0akRUQ3JL?=
 =?utf-8?B?Z285UllBZXVCbzdPdmdWOW92YlpGRE5yU0tzTFZLZVdjRG5QcE5ha21FTm5Y?=
 =?utf-8?B?Y0RUZmdJOU5raGd1c1Jlck1paFJCUkhuNllJOUtRTFV4bzZZOWlOS1dZMk1C?=
 =?utf-8?B?OUpUMlNnS2RaME9pRXpuWEhGQkhlSTZpR2RwZjh5dlU2ekpCODB4TWxWMmty?=
 =?utf-8?B?aFBJejVwTHZIRldtVHpRVnF1MkNvMmJ1VnBwZGNEU1BGdU45eXpBcHVOWmVQ?=
 =?utf-8?B?RU1pY3FsalVFaE14RlVaUzJBd212cnIzNnRHUHllWlpvM0tsdlFCRHI4V3VT?=
 =?utf-8?B?ZlpmWG5nMUVJY2lQdW8rSmM1UFZIZmd0U21SN0tIWW9GMW55Y2xVbHloK3ha?=
 =?utf-8?B?VDVlZmp1bnYwSmNUa21uOUc4cXk0TEF2TzdtME1zZXpxSHMxU3Q2WTZWWll0?=
 =?utf-8?B?bm9UakdBalpaMlI2THg3M21wMHg2RkVObjR3NFlDOWpaWTJ4eW9yZDFtejV3?=
 =?utf-8?B?NFY0STljaGxLM2xsQzlxOTFDT0NHRURGM3JxUGphQ01vUlU0MGNudXYrU1dS?=
 =?utf-8?B?aUk5V012Y1BlQXhXYVVybjI4THNxZzgvNG5ZWWh6aGU4MmxKL1cyNmJVUEZr?=
 =?utf-8?B?REliU2VqTFlkV01FQldrZVA4VzFMeGw4UGxWNCsvMjlsSHl4ZVd4MkthK2lD?=
 =?utf-8?B?MHo4NGs3RVl3YzlzdmxSYWQ0cE5yZFRZTWd5SlBhVE90Y0N2V05NOXZaMXJj?=
 =?utf-8?B?bVhJbHBBaHV4YlJsaWp0dVpxaWFwaXlOdVdudzhCeFdnNnE1TmlERzNaenY2?=
 =?utf-8?B?OVF6NkNFUW9NZG92UFp5dXdrWVBFRWh4K1BUZ0xTRFNNbVMwck5nL2U4dmFz?=
 =?utf-8?B?WnFySTlrT01WK09UYkVJclN4b3ByWkM0RHZiWXJvaEV0eml3cmhzUzJ5Q1R5?=
 =?utf-8?B?dVlmOEcrUDZQWjJVam9OYTAxZno1NFJ0RnV1NldFR0htVkk0VW5jb1dYbjRX?=
 =?utf-8?B?NHJwMGpRS0F4SWxnbjIvTXdxanFoZHUxQ0hxWW5LMDhKTTNiT0hrTW45T0Z1?=
 =?utf-8?B?djJjV05Kd25EQUNmb1ZkWmhGUGVBZkdMY2Ftb2NwSGV2RTJhT2VpTEs1UVly?=
 =?utf-8?B?UFBDSnI2cXg4SC9EZGprak1QdlNnbkwrQ04vbmdCdm1WMnMxMmJWdG1iR0k5?=
 =?utf-8?B?ZE4zQ1diWmJQSzYwNjd2WjNab3dERks4WWhtL0NpL2tsUGJvQXdHWllvQXY0?=
 =?utf-8?B?Z3YyY0J2Y1drOU00K2RaMVgrdlB6R0N2MUdiYVRtbW82VEtqWEJtb3gxbjc5?=
 =?utf-8?B?VGxhSks5M0ZsVVJNUUk3ZTJLWi8xL1RQTzVPTkRGcDdyRTQyQm1wWkl3a0dx?=
 =?utf-8?B?Sit1RkRzT1JGbDlPNHdDeGMzT2xBMzdYK2Y3U0Zob2VQK0traHJWaFcyMnIy?=
 =?utf-8?B?YmhvYllBYnZqelZweExrZDBzTE5kQ1VVOUVXMFRxendrT3d1dFN2TWJCNzNW?=
 =?utf-8?B?V2VvNEx0K0NLeEhVWUhFNTNLMSt4cW15NFp3SjN2ZTRwUWJ6WWtLYVU0TGxy?=
 =?utf-8?Q?mlOg19GYffKsdHU7LP?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f662484d-b2a8-48a2-74af-08d99d6b8c5f
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2021 19:12:29.4152
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Q1SZE/ERadFdovhaAEynBoFmMUtZG0wRMbQ6yvTGQ2hSuZWIO7QiLUR2Y6OD3UzF+xEmyVdmFzuxUi81VHbgvDjUcnB471OEo+fLiZ/24U4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3303
X-Proofpoint-ORIG-GUID: Qt8UdtbXWDrUogrmR74MPsktkdgYlwWR
X-Proofpoint-GUID: opy_CH_hfu21ia3gfCil1Eu6s6PBLN1i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-01_07,2021-11-01_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0
 spamscore=0 phishscore=0 mlxscore=0 lowpriorityscore=0 priorityscore=1501
 mlxlogscore=752 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111010103
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Nov 2021 19:12:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93751

--------------IqrNC9DWqkuOaxghkfANXE0B
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-11-01 12:18, Ross Burton wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> imgtool is part of MCUboot, used to sign images and manage keys.
>
> Signed-off-by: Ross Burton<ross.burton@arm.com>
> ---
>   .../recipes-devtools/python/python3-imgtool_1.8.0.bb | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-imgtool_1.8.0.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-imgtool_1.8.0.bb b/meta-python/recipes-devtools/python/python3-imgtool_1.8.0.bb
> new file mode 100644
> index 0000000000..143c011a2a
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-imgtool_1.8.0.bb
> @@ -0,0 +1,12 @@
> +SUMMARY = "MCUboot's image signing and key management tool"
> +
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM ="file://imgtool/main.py;beginline=3;endline=18;md5=9965f09ae52c04886a1f04e13ccdce57"
> +
> +SRC_URI[sha256sum] = "4858f5c5f48cfa4a0bb99e60d00aa291172a7ecc2afe4fb77ed96121f59b6e2f"
> +
> +inherit pypi setuptools3
> +
> +RDEPENDS:${PN} = "python3-cbor python3-click python3-cryptography python3-intelhex"
Did you mean python3-cbor2? The layer index suggests that python3-cbor 
is only in meta-iot-cloud/meta-arm/meta-ros-common.
> +
> +BBCLASSEXTEND = "native nativesdk"
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#93747):https://lists.openembedded.org/g/openembedded-devel/message/93747
> Mute This Topic:https://lists.openembedded.org/mt/86744851/3616776
> Group Owner:openembedded-devel+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-devel/unsub  [trevor.gamblin@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
--------------IqrNC9DWqkuOaxghkfANXE0B
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-11-01 12:18, Ross Burton wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20211101161831.1978140-1-ross.burton@arm.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

imgtool is part of MCUboot, used to sign images and manage keys.

Signed-off-by: Ross Burton <a class="moz-txt-link-rfc2396E" href="mailto:ross.burton@arm.com">&lt;ross.burton@arm.com&gt;</a>
---
 .../recipes-devtools/python/python3-imgtool_1.8.0.bb | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-imgtool_1.8.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-imgtool_1.8.0.bb b/meta-python/recipes-devtools/python/python3-imgtool_1.8.0.bb
new file mode 100644
index 0000000000..143c011a2a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-imgtool_1.8.0.bb
@@ -0,0 +1,12 @@
+SUMMARY = &quot;MCUboot's image signing and key management tool&quot;
+
+LICENSE = &quot;Apache-2.0&quot;
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://imgtool/main.py;beginline=3;endline=18;md5=9965f09ae52c04886a1f04e13ccdce57">&quot;file://imgtool/main.py;beginline=3;endline=18;md5=9965f09ae52c04886a1f04e13ccdce57&quot;</a>
+
+SRC_URI[sha256sum] = &quot;4858f5c5f48cfa4a0bb99e60d00aa291172a7ecc2afe4fb77ed96121f59b6e2f&quot;
+
+inherit pypi setuptools3
+
+RDEPENDS:${PN} = &quot;python3-cbor python3-click python3-cryptography python3-intelhex&quot;</pre>
    </blockquote>
    Did you mean python3-cbor2? The layer index suggests that
    python3-cbor is only in meta-iot-cloud/meta-arm/meta-ros-common.<br>
    <blockquote type="cite" cite="mid:20211101161831.1978140-1-ross.burton@arm.com">
      <pre class="moz-quote-pre" wrap="">
+
+BBCLASSEXTEND = &quot;native nativesdk&quot;
--
2.25.1

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#93747): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/message/93747">https://lists.openembedded.org/g/openembedded-devel/message/93747</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/86744851/3616776">https://lists.openembedded.org/mt/86744851/3616776</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:trevor.gamblin@windriver.com">trevor.gamblin@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
  </body>
</html>
--------------IqrNC9DWqkuOaxghkfANXE0B--

