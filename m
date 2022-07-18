Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4CC2C433EF
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 01:22:38 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.22009.1658107352271013947
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Jul 2022 18:22:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=purzUnoq;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=4198530481=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 26I1MVnf032526
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Jul 2022 01:22:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : from :
 to : references : message-id : date : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=s34jwcRTI9C+JhpW+l9bStsuZ93SwjK1S8ZjwuWDzUo=;
 b=purzUnoq/HFo5YVEALRabqlxipz2nGQBYgseWPIyQzwWJ2t/h9Dwui1cv+O3ysFT1FWR
 JxXrx98ynZoSiZmSTj7mAOOM6W4RnifFAo6iTs9KdWHyxmfVAWQj1SbZGQ8EqN+dZuNz
 gCaBWjyV70QkyFkhrx3PESP2+LIim2TeG/Tah0vkBhjuaDz++LcX1VNUa9A74qY20gbb
 HaXTQQhuBjd5VPi/rRcJDUX525JsMVRON7wkQQaakJwAE0XlPEn5iNshxsPs6CmMeeT2
 qXhxAk+Aci5TApSoc+WL4z/fYGjn1QMIGeKsc38OWD+Kd5JTfLi1wYAgF08g9ISDnJVN KA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hbma9h0w1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Jul 2022 01:22:31 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26I1MUwB032505
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Jul 2022 01:22:30 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2175.outbound.protection.outlook.com [104.47.59.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hbma9h0vx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Jul 2022 01:22:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oc8qTkAJnJZ2xCK90d0J0ddadno/9eahM+RKhYewTO311ILhrRtgQBdbzAvbjuPtziMpQPLghAQN7E+MBvna7DvY783oIXSE/Kma+WF8GlL1EAabSO0spFYExONRu3LTPxW6mUK3NwB66nYTH3s6Y0w7mGwFLpiP7W6Ehu1KxH3dfgWZJrpTFQE4/jISOliBjvKpd/ni4X0dMqAnkE30Rd4nN7iMXK37klSGC/jVxDLPN43CkwtbHv6sjyUx08ihYFzE2EiKerHABmi1T8xzagzLpIlaQ3UBhfte0VsMEva+T8C+xeItITgu5yKgcSRRVkO0KH1WbhhYfhq2moL0Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s34jwcRTI9C+JhpW+l9bStsuZ93SwjK1S8ZjwuWDzUo=;
 b=RLjxO0694QupK6llOY4etbHOSgaXrUSol88fjfyfCZ3xPRFUIvK17+JiT93A/QBfnGYhqCza82M554Hob47YZnjbWML/RWWz+fxLNswEkHqpkrKcLjNNl+g88lGJkJ6QVyBmYzCkEw5iuB7LE0aSTncNJQ+ewUrsY5h/GXn8NhzG4PlX4t4qn4AxnDzebybPWUEZNecjLSgqkr9X3yaLMAdZI6n8rhZiOcNY4KeoRVs/PwMQXQAHXknbp54si5ddHth2ANt84aG4ikT3lVeIa6X6Q0uo/V7yrjnf2SWBS8KGed7ESOQt11kO+1eTqvtEpRM9vGMcnzaTC9eQrnhBGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
 by PH0PR11MB4967.namprd11.prod.outlook.com (2603:10b6:510:41::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Mon, 18 Jul
 2022 01:22:27 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::b15a:47d5:1944:4a86]) by SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::b15a:47d5:1944:4a86%5]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 01:22:27 +0000
Subject: Re: [oe] [kirkstone][PATCH] redis: upgrade 7.0-rc3 -> 7.0.2
From: Changqing Li <changqing.li@windriver.com>
To: openembedded-devel@lists.openembedded.org,
        akuster808 <akuster808@gmail.com>
References: <16FCF2B6D4A71982.1980@lists.openembedded.org>
Message-ID: <ed5e7216-60ad-701b-4025-f42913d39904@windriver.com>
Date: Mon, 18 Jul 2022 09:22:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <16FCF2B6D4A71982.1980@lists.openembedded.org>
Content-Type: multipart/alternative;
 boundary="------------35A6C17174C18B0515471ED1"
Content-Language: en-US
X-ClientProxiedBy: SG2PR01CA0145.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::25) To SN6PR11MB2557.namprd11.prod.outlook.com
 (2603:10b6:805:56::33)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 372e8d9a-7481-4e65-4c67-08da685bfa26
X-MS-TrafficTypeDiagnostic: PH0PR11MB4967:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Kc8VoiNSMBXDBifYOOs4ajkaJUoflSGo3tl63BsbwRNwl3DMnA3p3cDU/UW8UnDsE5RVILJ/EMG+E/epf++yUxc5Yl+V6VbuZrOL6y8qn68IUBYTghG1+UpTBQS9OUQHrFNGVP+Q93vCpPmCPFufj1MvhFxJuNstMSGr6ezCOrKJ9fn2NWyS1zVm8JzqY6Lx+SMlMnJExgnKdvTudVWZhcOD8wEmpwGZCTqkl9s89vOkr7AE9ybE8GO/2HpAsHFLlBndD+fMy29t4ZFFn19m3a8i++TKW+w4OoyFL/HnMTdFIvfbzqATarBfCPRhqypWqaCMhvelXfqmvKSGhsXlDEG9PksP4kT3zMNYnfc4ymVrru2IEETFUeABxnWuhOME7XOwtXatvzj9MASrM3D7pWJbmeKdasv2QCcemoLi1FpU7jvw8pqe9t+nbgyJh9Dvn5Uy+5PDp2ohh+zk/p0eZTCCmK2Ept/mtCQ8umDsygJ8FjiQS16U5bowhGjUbn7HkcundFRfdkK7M6mV6sWv+CFh3bz1HoDpXbH65pWobn5ptgqjGEmSu8Bd4hgbAcLHZUz8Mm19QbH6vvfSBBbEqW0MM6mgHwgDSWP2GBx0Yv/bY5gQMPaMb8DjhxZpf9Tc9wpkwksi+KAIwXTbpU50VRYLrX00icCsxyTrY4a+vnVPqdPHvXBfZXxxdx72pmnZFnv20kpuKI3num/gZ7oJww6fyz6ETYFb0BUlzeRB7bc7LHP3ZupaAPT+aMj6wxN/oSDvXol8sOP6xQKU34egxRGnbkJx3KHHdEEqlD/wamnDsN4NnqOb+nMmPsXsrEm3CYyqMm0sWoKd2OuBnNWBBiJsu2OgX2ocKxtSOXn+66O+zIFasrXm8hGB2ghpy/zPC/0+Z23wm9Fq0v4oTgxhz5kjClg+eoLHcsMG7uEqxhDp/rViHKDu10V9FkHDfcnR
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2557.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(396003)(346002)(136003)(39830400003)(366004)(8936002)(44832011)(5660300002)(8676002)(66476007)(66556008)(66946007)(2906002)(36756003)(31696002)(38100700002)(38350700002)(2616005)(166002)(6486002)(966005)(41300700001)(478600001)(6666004)(316002)(6916009)(186003)(83380400001)(53546011)(6506007)(52116002)(26005)(6512007)(33964004)(31686004)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bVNGaUk1ek9sSDNCVnlIeEQzSlFBY2c5RDJlUDM3bFpmQ2NSUGRQQXluTEth?=
 =?utf-8?B?Kys1cU5GSENqTmNMWmlKNkk1L3lxTmJ0Tk05QjEwcmFwK2ZURnFzY2lnTlFV?=
 =?utf-8?B?ZmxXZG5yOXcweDB6N21HT2U3N2NVNUxUN05EakNXMGZZNzdyaHkwTm0wS0tp?=
 =?utf-8?B?QWVBcVYweHBXZTkyeDNsNjNlOUVtMTdtQ2xGUTNaSXpsOUlwVEZkY0piYVRm?=
 =?utf-8?B?MW15T1JpbE9nWWRvWXIyK05XSERnMGF4MDUrNTdZL2ZjSjdMNmUzT0phdTBo?=
 =?utf-8?B?MmdtbGs4NkF5V2h0RkVBVXF3YkdudWxzdzByYVo3RmxZODB0TSswZzBsTmRm?=
 =?utf-8?B?R1VoVzdiNUxUd2FoNGRRRlVJYWVscm0wMi9PcWRMZzQ4VUsvWjF6YWV0eENj?=
 =?utf-8?B?STRSV3Q0Z3RrWFRSMXkzZjM2Mkx4a3lpNXFJaU1XYXRBelJpazhlUW84TTR6?=
 =?utf-8?B?U252NEcvV3FRY0FsWVVKVzEvSUtucHkxVE15MnJPOUl3NTV4N3JCVFh2TFdl?=
 =?utf-8?B?dWRJUll5eHF5VFBUcHBGb2ZhNmRuQ1ZtNVhycFYvdmFaMWVGVjc0Y01BWjNs?=
 =?utf-8?B?S3p0NHdCdS9lei82ZWVERkNaR2haSHA1bUpoSExaRVZzcEIwVnFPODhFZnQ5?=
 =?utf-8?B?THRiTG1sMkYzS2pUdkV5d3Nxd013bEhFOXlrVExQUkpCQlFsazIvenBxQjlU?=
 =?utf-8?B?bThFY1AxQk4vcXI0Z0hZRFlLejBZTnRjL2srYThSSXZVWm9pdlRIbXVueUx6?=
 =?utf-8?B?UER3NE9oVHdPeFU3YU55QTdkNmtoWXMrZkVkbUhweVZ4cDhwR01UWS9MQU5h?=
 =?utf-8?B?cWVPOEhLOTJrNG5GTDBERVpzS3BFbkhnRGYxZEladXcxUnZ1K0thOGZ3WWYw?=
 =?utf-8?B?WkNxOEhEYnRaaUxTSHE2Z1N3Y2JBRnc5eHE4eTZtQVlMbkZIZ2VYYmg0S2Q5?=
 =?utf-8?B?M0M1NEdKU1UxYktjSDA4UE9ra1BLM2dUdkY0Vnp0WHE2RVBEYlZUUm8ySXBK?=
 =?utf-8?B?c1Q0djdWVHkzUDJDMUJLdGN2RGNrdXBQRzVXdzhSU3A5UTRXazFiK1B6VmpQ?=
 =?utf-8?B?Q0d5NjFTUG40MExLcTM0aXFLL0orbUd2amZ4bVVWZzZiVENaMEZWUTUzUkZV?=
 =?utf-8?B?VnZiWGFYOXZWTEVjZkFlUzA1R0xvNDVpd2RsY2loOEkwUTdvZnJUSkcrUTF3?=
 =?utf-8?B?ZUczak9rV0lIWHZzaVJiNm96dTlKZnRLRlVrQndGckZ2djl0RG9Nck05VExl?=
 =?utf-8?B?bGt6QnYybm9hSTFDLzVlZzkvRUhzV3pUQjNjdXdWWFJJVm1MVHBTeDJtcElp?=
 =?utf-8?B?TVpjeUZmdU5veHNORlVKMEs0NUU3djBlR2dRSGt2UEozVVh0a1I0NTU2NnJo?=
 =?utf-8?B?d1dQY1l5cU1teHFJdHd5aWE4MTlpNlkyeThOaTVGZzdOalBtRmVoLzdFK1B5?=
 =?utf-8?B?UlNlTndJL0s0OU1EM1RHekd0NE5mV1VUL0hoNUtFZXNOa1R6SGtNVVQyL0dx?=
 =?utf-8?B?NSswZXM5dUNPUll4b1B2RExBODNCT0FleFp0a2dHTnE2Y1BIUjJYMWZsa0tM?=
 =?utf-8?B?bzRTZ01wR2E0bWdTVFNENUNDNmRrS3dqeTZZZXV4eGFlclBvVXFvZjhoVEta?=
 =?utf-8?B?dFZoelpROCtrRk00Mk9TTU5hWjREZTFyRXJjY2ttMmhNUStZa1pJMUllKzg2?=
 =?utf-8?B?UnMrRXp0YkozTW5qR3N4VlhKbWNvZXF6eHFvOCtwU3Mra0U0Z1A1MzdSOGFi?=
 =?utf-8?B?N1NScHBjSXFCdkJlczFRTDNGTTFzRWZ2NW9uanZPYitYaHpRV0lxU3ZPRU1u?=
 =?utf-8?B?ajlvNUorS1c0MHd1RHRqOWxFQnh3ZFVDYXNud3pnNDFlaW5TcVhTVjdnbVRm?=
 =?utf-8?B?SjRNZVlWQ3lFR3J3ZzRjQ2tEM0RHN1dTdXFIbE9nVWxoS2dMbkNpRHB0TXBJ?=
 =?utf-8?B?ZE1GZ1VtQWZaZ1libjQyUTBSa2NqTnY3alNKNGxobldyVzd1K1RNdHluc2Ni?=
 =?utf-8?B?Z2U0bEphVkM4UksxSTNXSGNDeUpvTHhadXFacWptL3dBTUdoQytodFJzdGgz?=
 =?utf-8?B?NWNnSUpYUm5yK3A0THFLU2F1VFZPMEE3a0tqQ3A4dndZa2kxTVF2SzVpZ2Iw?=
 =?utf-8?B?dDlHQ3BGYStNekhtd21nVHNkNjd1Z1MwZ0lEOVd3dmZaRkZVOXVna1dEWSty?=
 =?utf-8?B?dHc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 372e8d9a-7481-4e65-4c67-08da685bfa26
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2557.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2022 01:22:27.5722
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 u8DU93Sjw93CamZ8P386wxvPbviJAEp7KMub2VXkqiMKFhYmlTKjHnD4qzpV8WsueosHS+UjYWL2THpqKi73Z0IxB43vCTK3HmOP5SCSvPU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4967
X-Proofpoint-GUID: 28JJ77GQ_uX3hJ6MCyGNBtfUTfrQiALe
X-Proofpoint-ORIG-GUID: oBfIszD6IEl5kj-3V_3vnDdg0eESCSKX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-18_01,2022-07-15_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 mlxlogscore=916 adultscore=0
 mlxscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207180004
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Jul 2022 01:22:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97863

--------------35A6C17174C18B0515471ED1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

ping

On 6/29/22 9:20 AM, Changqing Li wrote:
> From: Changqing Li <changqing.li@windriver.com>
>
> This upgrade include CVE fix:
> CVE-2022-24735
> CVE-2022-24736
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>   .../recipes-extended/redis/{redis_7.0-rc3.bb => redis_7.0.2.bb} | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-oe/recipes-extended/redis/{redis_7.0-rc3.bb => redis_7.0.2.bb} (96%)
>
> diff --git a/meta-oe/recipes-extended/redis/redis_7.0-rc3.bb b/meta-oe/recipes-extended/redis/redis_7.0.2.bb
> similarity index 96%
> rename from meta-oe/recipes-extended/redis/redis_7.0-rc3.bb
> rename to meta-oe/recipes-extended/redis/redis_7.0.2.bb
> index e977d67f6..b188278e1 100644
> --- a/meta-oe/recipes-extended/redis/redis_7.0-rc3.bb
> +++ b/meta-oe/recipes-extended/redis/redis_7.0.2.bb
> @@ -19,7 +19,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
>              file://GNU_SOURCE.patch \
>              file://0006-Define-correct-gregs-for-RISCV32.patch \
>              "
> -SRC_URI[sha256sum] = "66b2ecc2e4b53c62940589434ea8af3a85546df131001680ed294028cd84ecdc"
> +SRC_URI[sha256sum] = "5e57eafe7d4ac5ecb6a7d64d6b61db775616dbf903293b3fcc660716dbda5eeb"
>   
>   inherit autotools-brokensep update-rc.d systemd useradd
>   
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#97613): https://lists.openembedded.org/g/openembedded-devel/message/97613
> Mute This Topic: https://lists.openembedded.org/mt/92057314/3616873
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [changqing.li@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

--------------35A6C17174C18B0515471ED1
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>ping<br>
    </p>
    <div class="moz-cite-prefix">On 6/29/22 9:20 AM, Changqing Li wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:16FCF2B6D4A71982.1980@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>

This upgrade include CVE fix:
CVE-2022-24735
CVE-2022-24736

Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
---
 .../recipes-extended/redis/{redis_7.0-rc3.bb =&gt; redis_7.0.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/redis/{redis_7.0-rc3.bb =&gt; redis_7.0.2.bb} (96%)

diff --git a/meta-oe/recipes-extended/redis/redis_7.0-rc3.bb b/meta-oe/recipes-extended/redis/redis_7.0.2.bb
similarity index 96%
rename from meta-oe/recipes-extended/redis/redis_7.0-rc3.bb
rename to meta-oe/recipes-extended/redis/redis_7.0.2.bb
index e977d67f6..b188278e1 100644
--- a/meta-oe/recipes-extended/redis/redis_7.0-rc3.bb
+++ b/meta-oe/recipes-extended/redis/redis_7.0.2.bb
@@ -19,7 +19,7 @@ SRC_URI = <a class="moz-txt-link-rfc2396E" href="http://download.redis.io/releases/${BP}.tar.gz\file://GNU_SOURCE.patch\file://0006-Define-correct-gregs-for-RISCV32.patch\">&quot;http://download.redis.io/releases/${BP}.tar.gz \
            file://GNU_SOURCE.patch \
            file://0006-Define-correct-gregs-for-RISCV32.patch \
            &quot;</a>
-SRC_URI[sha256sum] = &quot;66b2ecc2e4b53c62940589434ea8af3a85546df131001680ed294028cd84ecdc&quot;
+SRC_URI[sha256sum] = &quot;5e57eafe7d4ac5ecb6a7d64d6b61db775616dbf903293b3fcc660716dbda5eeb&quot;
 
 inherit autotools-brokensep update-rc.d systemd useradd
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#97613): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/message/97613">https://lists.openembedded.org/g/openembedded-devel/message/97613</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/92057314/3616873">https://lists.openembedded.org/mt/92057314/3616873</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:changqing.li@windriver.com">changqing.li@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
  </body>
</html>

--------------35A6C17174C18B0515471ED1--

