Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.83])
 by mx.groups.io with SMTP id smtpd.web10.5288.1608001121692869016
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Dec 2020 18:58:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=RjVXWd2h;
 spf=pass (domain: windriver.com, ip: 40.107.236.83, mailfrom: kai.kang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U1TjyVEQCMt8tq7hh3LB0wLWsDmWIwmi/PPcGVzAjJrXDwUyiiAttGq0wbKCxb39QxvJQD4qxTz2p1b+N6O1zByClKw/ZntBXrFBhSAxaoxY2KGfsyNEo+7DG45/7x1LCBcb0HRNvNOUvMrZJ8Vulx3khad2YdxGocsI8YiProsw6ndL0F5qVwlaGAQGtjSslTGfnVlYDTi76gwdUATcYvxc2EV+wyEX9wtyPWoXtdBm7lS1RIh12TwTkOV4rK2ZVTAx0Um/o2bfQe9xFTclV5rvZhmj1REX2P2yH+d6s6lwROmGWkPYXGTsDTLXr+wwlYC+4qe4yRK37Yv0tXO2UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fUDpoMxFXm4M8iinf7OuBTEZlDG3y+r5D4glHRt+Jkg=;
 b=ewXbdLDj1IdkClzXXENQ7UjpeVE5xrjEdNdwBUqh/TRmA5zgCRFyIN0I0BDkhWY9RT4wV0bR4LMm/AnX7r399wIjmmMPrLS3w37rldGDZzyaq8W9g8vHhw7TpMDQDSF20ChbTs74ZL3X896fbmN7xyci5FtRvoSDBXRYofoi6yHjtPlsJArMo6viOmoi2GNgC1neFLcN1OmDpdyTSahy6DDcK5GSMys8Q3r9gZrDD/WdeqieGVrcwxt0DHU03edTdOlXYWhZpQWPFE95qnyVWTi0OZj2Y8kbfY42CpIdFMTq2+YW2SyLwamyyx4lQYIYpNcmpZtBeUAh6gXRq39NuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fUDpoMxFXm4M8iinf7OuBTEZlDG3y+r5D4glHRt+Jkg=;
 b=RjVXWd2hqRT+JGjEMQ6xFCm+Iw25WI0KblcVO0WT2QRc/xGM6abv7ZwJImaUDgCCQ4ce8V5Z+KrWGQrOK4GaThQpcwBqViC0mSw+PDNUYpV1hADcGX2b603RSdLnHIn6ktY+0ojByXZsTSPi7KLlUBzOlX3NvSI1rIQ0N59Jp/4=
Authentication-Results: windriver.com; dkim=none (message not signed)
 header.d=none;windriver.com; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB3294.namprd11.prod.outlook.com (2603:10b6:805:c4::33)
 by SA0PR11MB4607.namprd11.prod.outlook.com (2603:10b6:806:9b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Tue, 15 Dec
 2020 02:58:39 +0000
Received: from SN6PR11MB3294.namprd11.prod.outlook.com
 ([fe80::b4b5:fc79:127b:66f4]) by SN6PR11MB3294.namprd11.prod.outlook.com
 ([fe80::b4b5:fc79:127b:66f4%6]) with mapi id 15.20.3654.024; Tue, 15 Dec 2020
 02:58:39 +0000
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
From: "kai" <kai.kang@windriver.com>
Subject: Fail to start gdm
Message-ID: <5674ee97-bd13-1bae-a3f3-83c1c403f20f@windriver.com>
Date: Tue, 15 Dec 2020 10:58:32 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: YT1PR01CA0058.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::27) To SN6PR11MB3294.namprd11.prod.outlook.com
 (2603:10b6:805:c4::33)
Return-Path: kai.kang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.141] (60.247.85.82) by YT1PR01CA0058.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend Transport; Tue, 15 Dec 2020 02:58:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3a759a75-9f93-4e06-4404-08d8a0a552d6
X-MS-TrafficTypeDiagnostic: SA0PR11MB4607:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<SA0PR11MB4607D117738A61C2037E2C3595C60@SA0PR11MB4607.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bgIn8NPnX/xsQO+uNdUiMhmQWaNYK/nMZwDvGSWnaUgjHAO7TUT3FXap0tOdmKS6WaJLS0wodtZeiMjVu+0E4EyZmOKHtnZr23XUE4z1Kk9HTK4h9ocVCeQ5aWqZovJUbcMCQtE3sEHHDFG5UTuCOOpLPDR4EbSszVKR1oAeUFTD+Tj/FvsVyL0byxKP+2JcxKu1V5vr9Ju4Z84xsaU0Ocn04kWg6k+szGbAh5vBgRhC7IxUZqxlvxjITVaUwpu3Xt9z4yQYvvcj25nMp5W0Cf4L2lnRmshjWstlQLAjRMgYkzVJ8SzqlniHc6M+ZxaY1Yp7Jd8plzdWF/eFoObW2owbfvpec+6XDaPvNbrRe7Twti1/CW5HkQvKCTJw6On8YGHE7pJtEBg6/cSLGLOM7JUWedyLCAjcK8NGlgjHvppV0KjXpFGBwU1C9J/qSg5Shw2SCg9AtPoeZ197MShfSg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB3294.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(366004)(136003)(6916009)(6486002)(36756003)(66556008)(2616005)(5660300002)(16576012)(6706004)(66946007)(4326008)(956004)(3480700007)(31696002)(8676002)(4744005)(16526019)(2906002)(34490700003)(8936002)(66476007)(83380400001)(31686004)(186003)(6666004)(86362001)(26005)(52116002)(508600001)(78286007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?Z1docG00amVlSUpsQUJ6VTM0azl1UUhaaUo0ZndpL1dxUSt0LzlkSUtWQmNQ?=
 =?utf-8?B?cnhlazZ6WHVtMit0R0JYNk9CdkY3MThYTWFlOFpvRDZuM3dXUkg5Y2dQdDdP?=
 =?utf-8?B?NlE1bS82bnU3eWRWcnZmTjlXVlRkNG1qdTE2OHluV1d5akJqK05TbmF0dGxQ?=
 =?utf-8?B?K1RMbXhwS3Q5V1RVbk53VTZzTFFNQVVDbHg5aHcyRm1tN2J3aDFCd0xDZjU4?=
 =?utf-8?B?R1JLTTVQNFZyM29wdCtVaUdPYVNOaHV2K3ZqNStBdGVycmZRRWxGYTY4bGMy?=
 =?utf-8?B?ZmI4L2l3T3ZvL3BOUlk1SnRXVnBWTWRZaVBpc3pveXhTc1BKMlZpQUo3THhQ?=
 =?utf-8?B?QUtETGV3azVDYlZ5SExidVZNeUNPVGVZdU8yWE5vbWZWanhCSTJUb3cvK0RD?=
 =?utf-8?B?ckdINGNGOGJPa1VKNW94T3YyTzBLbmRURHBrbTFkL0toZkRzNlVQQ0lQd2k2?=
 =?utf-8?B?TTRqbC8zYWZhd3NGQ1I1WndrTUI3MVlhOEs3MGZnRTRJSDdNQjlyTWRjQkw4?=
 =?utf-8?B?a2pmU0NNd2h6MFlEQmdsQSt5K3BtbjNXNUdwa0tHZ1V5ajJhSW5qM1FoNzFv?=
 =?utf-8?B?RzhZZ3gwV0pjUHhCcUxoK3pXSmJ1NW1GbjU1dUFzeFlDWVZUUHU0VzlSWHdV?=
 =?utf-8?B?TW9tRHR1MUh4dkt1cy9pME5Nc3BHbEllZVQ0My9tdFdibDNHamM4RUpIUWgx?=
 =?utf-8?B?K1MyYi9LTncwZThCbnFwTzhOSGNaZ0Nacm5LVWJld3FmbGJkMEpHVTFwdUVy?=
 =?utf-8?B?MHVmb0VSUXl2dWpuY3dRVDZkUlY0ZkFPQVFjN3BwaThTdjZYL3VvSW1uYzhq?=
 =?utf-8?B?K0g0ZVhhWnlKWktVdlVOdkl1SUJzd2RpS3lQZ3Z1TXd5NWZMVzV5aVZjYjR0?=
 =?utf-8?B?Kzk2dlRJQVl1SER5UHdncU9HUjVvQlp5MnJkOHFPSDkwTHVOVEY3NlFwOGNt?=
 =?utf-8?B?VEc0NmU1TzBjZHplUzNYZzlFRkFMSGp2Z0xuVmRqcFV5aFhhZ0RwSkw1NzZP?=
 =?utf-8?B?ZnlEVCt3bkxjdnl2ZlNmQzdiZExXOUNwV3hjWXlRNWgxUkYyd05BS0VVa3hz?=
 =?utf-8?B?YjNNMmF3dWNDSTN3aER0SkwyYW91MUxpazJvNjJ2bnpMSHowUkphL2dGVUY3?=
 =?utf-8?B?Lys5MmFVcnBtZ01iQUhlekdhWnp0RXhiUW1xZFZKb2VJbE9aYVZnVnVtZVRw?=
 =?utf-8?B?UDl0dmJXeW5hZUNSbFdiZUFOVDJNdHh4U2VRZ1BXb3hpYW9zbVY1RXhSSmw1?=
 =?utf-8?B?MnVLU1lTSENrVjRKZzRPWmtpaE1xSHpyekJ5V2NZeG5pUEs5K0loSTVXMnAw?=
 =?utf-8?Q?zyxrE9UIuUXlfRghu3dOOiyJNV8/YFePSO?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3294.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2020 02:58:39.1277
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a759a75-9f93-4e06-4404-08d8a0a552d6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S2M4ZK6GBTxsD1VeQpZ0ff8los7ZSmw6g2z/IDwR7dQnThqA2yTVJv3MZ9vd/AL06dZcmPASNLqMWJm0i9rflw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4607
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Andreas,

I am trying to use gdm as graphical_init_manager. But it fails to start 
gdm with core-image-minimal-xfce.

My config in local.conf:

IMAGE_INSTALL_append = ' gdm rsyslog'
VIRTUAL-RUNTIME_graphical_init_manager = "gdm"
DISTRO_FEATURES_append = ' pam polkit'

#
# Use systemd for system initialization
#
DISTRO_FEATURES_append = " systemd"
DISTRO_FEATURES_BACKFILL_CONSIDERED += "sysvinit"
VIRTUAL-RUNTIME_login_manager = "shadow-base"
VIRTUAL-RUNTIME_init_manager = "systemd"
VIRTUAL-RUNTIME_initscripts = "systemd-compat-units"


When I boot the image and run gdm, it shows error:

gdm-x-session: X server did not write display string

I have tried to enable configure option '--enable-suid-wrapper' of 
xserver-xorg, it fails with other error looks like:

GdmManager: uid for sender and uid for session don't match


Did you meet such error when you upgraded gdm, please? And what's you 
config when you validate it?

Thanks a lot.

Kai

