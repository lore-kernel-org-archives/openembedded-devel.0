Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CB2CC35274
	for <webhook@archiver.kernel.org>; Fri,  8 Apr 2022 17:09:35 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.1851.1649388765382189649
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Apr 2022 20:32:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Af/MvQjS;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=1097b23a0a=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 2383Wi3U019599
	for <openembedded-devel@lists.openembedded.org>; Fri, 8 Apr 2022 03:32:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=ZmMIunt/AyPi5GDPHDA0dWTTS6SUO6c98u5baE4Al58=;
 b=Af/MvQjS1j6/9NP2ntMJnRZDXPYMtQNgjlZRACRAWftLSr9G4yQTy16tlqPs9ypiI/vR
 eSZ0qOXi+T4ueyhhGCYCmYu2VK6T3hSCiDbw2LCsPsfgyqRbucvpDfdsTrfLVFhAcZzm
 Eg8N24JRSfhuIKhwMmMLMLGkbjK91A1ZwOxaj7Q8oINmrFDsk+Frgy2MH78+NPqNTs5a
 VllXSgt9xsFMHVY0T4fOawFwaJk4DyBjxKcqtzSCTXVLYolYYA6lx7R5nROolvskrGfP
 oimlXtHTg6H3nZyksZ7QQg6B8zOuv2ZSRcQzm9VgEzot1Iuyx7370z780D9/O5EQPyZW qw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3f6bq24wmv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Apr 2022 03:32:44 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2383WhK5019593
	for <openembedded-devel@lists.openembedded.org>; Fri, 8 Apr 2022 03:32:44 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2172.outbound.protection.outlook.com [104.47.59.172])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3f6bq24wmu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Apr 2022 03:32:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZG0nWPwu09anLx14a9i7YRBrtZ/bGLeLmLv8dJ70eu/1rHRVv1iaQp1qygqWT2GArGcSRTfhhBscZZQXpwHa/6MEgeHAif0VNgGfOpMczE7Uyew3VTSjUSQ/pSgdX0YOVi/iOOGLszy4PQ7cnczd9me4/UY030lVIQf7soOoLi8qG7lKtZ5odAZ/mnN3KfpwjTR6Hb2qlfv61/5JEcAvTh0OmcvYE/4gEwrfv/3OEnt+SgxPUePvEInbBSuGTkbgiMUP//n2KqRLux1kH55Eydz0m8J+3ztPMezm/qoRNpc5dg5b2K7n472QVLLhGQskOOCik6sTBJAJkmW9uZtV1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZmMIunt/AyPi5GDPHDA0dWTTS6SUO6c98u5baE4Al58=;
 b=BBcnEI/fRPZrIHY5JczHgfrJ0bVxz3fbN2aj5OOeUqGemrikkrVd2JtpW9eGhNTbus6UdWLGlmLVDo9foXhrKhPN2N0jsyXowi2bFaWVQ5Ls/Yy6Kdsk4z153uV4dwoTJ3phJRF3dCU70ND4Ad4qMgBqJqZ/qkfRboq7rW6e/aXYGYkvNYigRwEuTmjAWGsdsyX+F5/o621vBtLBh4UoDWf8ZJLABOgJbTb3RED8AVjHbD/iclEEppsoQ928uXjPmf/hXBDWQHPEGxXHAm27DtmKj5Igk6V+7t8PnuJfEV4Wt1A2E1Pnuf7sPREZf3PHLp3lbAuAtLzDUoKlN9GLdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BYAPR11MB2789.namprd11.prod.outlook.com (2603:10b6:a02:cc::11)
 by BY5PR11MB4088.namprd11.prod.outlook.com (2603:10b6:a03:185::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Fri, 8 Apr
 2022 03:32:41 +0000
Received: from BYAPR11MB2789.namprd11.prod.outlook.com
 ([fe80::d96a:d12:74c9:6313]) by BYAPR11MB2789.namprd11.prod.outlook.com
 ([fe80::d96a:d12:74c9:6313%6]) with mapi id 15.20.5144.022; Fri, 8 Apr 2022
 03:32:40 +0000
Message-ID: <a9286332-6f2a-9332-1966-2ddcd49fb196@windriver.com>
Date: Fri, 8 Apr 2022 11:32:32 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [oe] [meta-oe][PATCH] wxwidgets: Fix checking for PACKAGECONFIG
 and DISTRO_FEATURES
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>,
        Samuli Piippo <samuli.piippo@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
        Khem Raj <raj.khem@gmail.com>
References: <20220402032642.107153-1-liezhi.yang@windriver.com>
 <CABXoSoWMamXg3MaxzvJmRovNAQDJqXa2ZZ9dBC=CFg5EJgvNGQ@mail.gmail.com>
 <20220408004529.GP23554@denix.org>
From: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: <20220408004529.GP23554@denix.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HK2PR0302CA0023.apcprd03.prod.outlook.com
 (2603:1096:202::33) To BYAPR11MB2789.namprd11.prod.outlook.com
 (2603:10b6:a02:cc::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b5099358-cfdc-4d30-5310-08da19106f6b
X-MS-TrafficTypeDiagnostic: BY5PR11MB4088:EE_
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4088B7862FE54D974F6B805FFFE99@BY5PR11MB4088.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	EWpjOpq29p/aosq3UxEsW+TquBgViNHHQoCFrEf6S01pagssjpWzpLcPobG/nX4rwNV8O/uR2/eirrxZQDiVmZDwLqAnHbNQ16Zt/LTy/qDux0ngVDY3EjsSzPcdVqqiXPCbhwK9EUcDRCHQdO7VEIazWZgfQZIPXo+2hxcb9g5fFBgi2RBKmxDejzD8IjawreH76DA2SwALjdqzxbA+YUe19Y9/5uxnfNOIw0PgDYWnHbQjn9jqcdA8cycBxKjSgdS9965k8GkWWOAAThhAvlSk/BJsV5Pau4THmBRk5Ldw5ba0hBlY1xnqS5AjaspE9qqozkBsQP1wN2s6sQc03M1fT15xgllZj8lsbKmFEHB20tREE6Lu2uAndUd4sO/zt/VdDW10hKf+viP12LnI/zFCG3Y9+Tluk4ht2OVcv3o6hcBDB1VhEcQh52whCbJSc3vm2K2JU4ItUHYbD4d0IXmpAqUnYKvFL4ZxswXeipYH2pIlJlY+ztWnMc+8F6FkZs4N7gvHyFmlmsfpr1lgcOXCI9BDr5OvG20W4joLIm+QZpHhDQ9izTPztA7B+hdaDi2Ccss3ox4j6tDWppwHLpopKcesEvcedN9eO4R34NVfDebE17DYSybQS0bTOQ/aGCzwUmTDQAHFQP9RnhCPtrQhzbAuagCYyaFZNwYIcOx3JZLgcwDlFH8LoBjpUXiRme/xfaM7uX+sMq8KKbFx8/0xyWYxNyPRuJBhQi7Nv5UhJoTLXAujroAPzr197/QhKyP7PqmRaCh2/tM9y4y8Cg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2789.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(5660300002)(6486002)(86362001)(54906003)(38100700002)(66556008)(31696002)(66476007)(38350700002)(316002)(4326008)(8676002)(26005)(66946007)(110136005)(8936002)(186003)(6512007)(36756003)(83380400001)(2616005)(31686004)(53546011)(508600001)(6666004)(52116002)(2906002)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RDJ2OXc5Y3N3bUJZZ0pMZ1h0Y0d4UG0zRFdvWk9vNzRsUnFyR2g1OG1lWW5K?=
 =?utf-8?B?Yk8zcHJ0R3VIOUVOUXR6RWFEUTZCNVZMZjZvZGRyNEtjMHF3dGVVUVpJekdy?=
 =?utf-8?B?RE4yU2hkNDBybVU4RDFUYmQ4RndjRjhyYTE0Z0JFc1Zsdi9LalhpWkNPK2k5?=
 =?utf-8?B?YllNa3o2L3NzU2ZBSkM1VURJUFJmWXNPc25GUjN5TkZwU1RoK0lxNnVlZTFF?=
 =?utf-8?B?djh5OXNUdjc5bVl0OG5SZjBFZjFrVjQ5cHZOTlgzcTFyZldac3dMRmVORW5m?=
 =?utf-8?B?K3V6RzNQb0QrWVZlUWdhU1E2K0I1SHhXZVNzQnlqUE1FRDByai9HYlhya1NT?=
 =?utf-8?B?NElGNTNQRERZNnNMZ3drZFNEcVZCYU1qN0M1RHJ0S1JiSzZ6MWZqczlXUGly?=
 =?utf-8?B?QW85L3RwTnp4QU00VFpnd0NPaHA3OTI0bDd0TjRaTTBHbzVzMThlS3NyWGJM?=
 =?utf-8?B?UjJpUWJHdTBaS1BxVTVBS1VmREFMSkpSRksvWjZ3Ky9FVWdxZm1NWHg4MU5U?=
 =?utf-8?B?N0xWek1RWWY2RnFuVmY3QWFZS3l4TGhKZ2JrNnNQVC9ncThjcWdIWWVZVFhS?=
 =?utf-8?B?bEpDZUdwUjBBbXhJNW9rMXE1SC91RjYwWXZPVmVOUjJMQnZ6V3l6WVM2WlhT?=
 =?utf-8?B?QzVOeldkc2ZMTlFkczg4OFJNdFNLR29rcGFSK3ZCQlc2NC9PZU1DYXg5L3BP?=
 =?utf-8?B?aDVTWlZmRXQ2NEZ4eFJNSkI4RFo1VGVtVzZOc3JIVmVNT1FaQlIrdXRPanRl?=
 =?utf-8?B?MzVGWjIyOSsyNHNnblBFajczbHdOZ3dHS3JMMkJDZHUrb3lFa0g3UlpzRkg4?=
 =?utf-8?B?NWFLTGdLRU5aRUpzSzZibkZISnA3aUFJRmNpUDU4bmtUU0ljWE1UNC9zNkQx?=
 =?utf-8?B?ajllUDRQUkNoL05BK3IxM1MvaG9PNVFCQmlmOVBFMFVqWE9TdE1EbEtTU2RU?=
 =?utf-8?B?dTVHTWtRRVNjZ2ZLeThoSlBaOG5vOWtjanpBMVN5RkdvRHRlR1I4WG5JbHJj?=
 =?utf-8?B?aGJyNnh5RUNzN3V0dUMrbndxMGVFUDlSNDlZcTdGRnh6TDhqanVPVnV1cTlx?=
 =?utf-8?B?bHlXSzJqQkluRVVUL3B1Y2RoZ3VsWmtVREs0RFZ6cm44VU5EblhWVTdHa1lC?=
 =?utf-8?B?RElLUnJhK2JEL2xJSHNuQm0wSlBHajlhSThIbGhvTFBuK2pPSU5WWHBvbURZ?=
 =?utf-8?B?RU9DM3l3eEJkVUFXMWJxWlU4T09VR2NDWmE0WEhOOEtiZkdVTGhJWXM1dk9R?=
 =?utf-8?B?Q3Y2SkwrM0pVL082cWRvb0FEd1dvVGNxMXMwVnBGeVQ2UEx3U3JwRjAxZHJl?=
 =?utf-8?B?VVpXMFpnMjNCdXhxOGZ6VVROY0RMUkZiLzRYYUVjaVEwbGlGU2ZHcU1aalla?=
 =?utf-8?B?S3E5TVI2UHhsdVI5ZDhqMXBwRVZBSVMyNEd2ZVBPRmlWZGRWSHZlZmowOGpU?=
 =?utf-8?B?TksrRUlpOS9vNkJ0bDVob0cwakxrUkx4czZZaGhxSmxkVUtFS0FJbVR6eDFz?=
 =?utf-8?B?bjZsWVVKeHhmYUw4aGxiblNFVkJaMC9EcEk5YVUvbXB4RXVTQklyRi95WHNu?=
 =?utf-8?B?T1JqSlZzTmJ2K1JYT2U2Qy9GUERWNUk1eTVFYVRCYWZnOFhhZnpvY1Zpc0hl?=
 =?utf-8?B?bDVYVnlDR1dJR3ozU0VhOVozc25abXltU3ZpWS9YS2pSZnVITHNYd3N5VGRN?=
 =?utf-8?B?dE5nU2Z2MWtVb2Q2aUZWbVF1aTY5am5pc05FSXJtalhOWU56NGV0bTVXTDAv?=
 =?utf-8?B?N0hnM1IvampnT2ZXU1JsWTlMN2dKUmwxTk1nUGo5UVBQcW1vQlJzVDA4TGFq?=
 =?utf-8?B?UDBXbThPQTQvQmMwWU9RclYxdFpaeVQ2aFk0OS8zemJJQ3M1TnROVldhNU0x?=
 =?utf-8?B?aXNqUTRwaXc3YkpIMGJkRFdmWTVST2VyM0hOYTB3OUlWSnVyc2RjRFNEeEM1?=
 =?utf-8?B?eDNLeXU1WUJwN3daY0J6a1d1b20xVlhhY05aWm4vaXNyL3cxS1p4akNFbUl3?=
 =?utf-8?B?dEV4b25xS0xaWmdJVk9FRGRVbFN5dGhqZGZLOExabjFGUkszWE1NN2E0a0dK?=
 =?utf-8?B?dFI2MHcyTVk0YVpEbWk1dUc4OFdNaXJwaTFQZGI1VzN6azJqN2tqL2o4cGRE?=
 =?utf-8?B?bnhmU2R6VHJ3V3oxT1dZdVFuZlBhK2VzcFhtdjlhSGlhaFhDb1JFc2JlVjBh?=
 =?utf-8?B?MS9YaUcyUGxyUUlXZEtZMWowdlBSOW9PaEZqaDdOSEY0dGpUVkd3cjJWcXpD?=
 =?utf-8?B?c25OcEo1ckV6UFA3K2MzdTQ1eHlqbWVHZFJZeGdlVCswQTJTY21SSDFId1Rm?=
 =?utf-8?B?bDNvUStPYTdIOGMxM3BNTzJEQmk0bEN2VCtOd3FraGdtT0RFRko0UzhoV3ZY?=
 =?utf-8?Q?lX2He299bbffdpbQ=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b5099358-cfdc-4d30-5310-08da19106f6b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2789.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2022 03:32:40.7540
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 UciVEgHRj4mRcd7KNwYIE0TVz0SPbV9OgUUNlE2BrIQaNJmOUFlo2mTPlU6qRV/WHuheIYfWrm8l7agil1zKmaHKmNZ5b26OW7nPVq64CaY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4088
X-Proofpoint-GUID: 9OBgk41drKqjiSp0FjKl4rMJ5M4NUSW9
X-Proofpoint-ORIG-GUID: PJE5pb4ykawCykePebFaj49MuZm-obcl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-08_01,2022-04-07_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0
 phishscore=0 suspectscore=0 impostorscore=0 bulkscore=0 mlxlogscore=727
 priorityscore=1501 malwarescore=0 clxscore=1011 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204080018
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 Apr 2022 17:09:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96469

Hi Denys,

On 4/8/22 8:45 AM, Denys Dmytriyenko wrote:
> On Thu, Apr 07, 2022 at 09:55:41AM +0300, Samuli Piippo wrote:
>> This commit breaks builds when DISTRO_FEATURES has opengl, but not x11.
> 
> Same here! Moreover, it does not simply breaks the build, it breaks *parsing*
> even when not building wxwidgets! Please fix ASAP or revert.

Sorry for the problem. I think that the fix should be only enable opengl when 
both opengl and x11 are in DISTRO_FEATURES, the opengl can't work without x11
since it depends on libglu, and
oe-core/meta/recipes-graphics/mesa/libglu_9.0.2.bb requires both x11 and opengl.

I will send a patch to fix it.

// Robert

> 
> 
>> ERROR: //meta-openembedded/meta-oe/recipes-extended/wxwidgets/
>> wxwidgets_3.1.5.bb: wxwidgets: PACKAGECONFIG[no_gui] Conflict package
>> config 'opengl' set in PACKAGECONFIG.
>>
>> On Sat, 2 Apr 2022 at 06:26, Robert Yang <liezhi.yang@windriver.com> wrote:
>>
>>> The PACKAGECONFIG depends on DISTRO_FEATURES, not DISTRO_FEATURES depends
>>> on
>>> PACKAGECONFIG. And the REQUIRED_DISTRO_FEATURES is not needed since it can
>>> work
>>> with gtk or x11.
>>>
>>> Fixed when x11 is not in DISTRO_FEATURES:
>>> $ bitbake wxwidgets
>>> ERROR: Nothing PROVIDES 'wxwidgets'
>>> wxwidgets was skipped: missing required distro feature 'x11' (not in
>>> DISTRO_FEATURES)
>>>
>>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>>> ---
>>>   meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb | 11 ++++++-----
>>>   1 file changed, 6 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb
>>> b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb
>>> index f9349b02a..b10742eac 100644
>>> --- a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb
>>> +++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb
>>> @@ -10,10 +10,7 @@ LICENSE = "WXwindows"
>>>   LIC_FILES_CHKSUM =
>>> "file://docs/licence.txt;md5=981f50a934828620b08f44d75db557c6"
>>>
>>>   inherit ${@bb.utils.contains('PACKAGECONFIG', 'qt', 'cmake_qt5', 'cmake',
>>> d)}
>>> -inherit features_check lib_package binconfig pkgconfig
>>> -
>>> -# All toolkit-configs except 'no_gui' require x11 explicitly (see
>>> toolkit.cmake)
>>> -REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('PACKAGECONFIG',
>>> 'no_gui', '', 'x11', d)}"
>>> +inherit lib_package binconfig pkgconfig
>>>
>>>   DEPENDS += " \
>>>       jpeg \
>>> @@ -46,7 +43,11 @@ EXTRA_OECMAKE:append:libc-musl = " \
>>>       -DHAVE_LOCALE_T=OFF \
>>>   "
>>>
>>> -PACKAGECONFIG ?= "gtk ${@bb.utils.filter('DISTRO_FEATURES', 'opengl', d)}"
>>> +# All toolkit-configs except 'no_gui' require x11 explicitly (see
>>> toolkit.cmake)
>>> +PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'gtk',
>>> 'no_gui', d)} \
>>> +    ${@bb.utils.filter('DISTRO_FEATURES', 'opengl', d)} \
>>> +"
>>> +
>>>   PACKAGECONFIG:remove:class-native = "opengl"
>>>
>>>   # Note on toolkit-PACKAGECONFIGs: select exactly one of 'no_gui' / 'gtk'
>>> / 'qt'
>>> --
>>> 2.31.1

