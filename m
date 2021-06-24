Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.197.1624567175535200168
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Jun 2021 13:39:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=gsWMaslx;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=18096f5f7a=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15OKbrNv029801
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Jun 2021 20:39:34 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 39caqms13a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Jun 2021 20:39:34 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15OKdYJB031790
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Jun 2021 20:39:34 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2171.outbound.protection.outlook.com [104.47.56.171])
	by mx0a-0064b401.pphosted.com with ESMTP id 39caqms138-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Jun 2021 20:39:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ah+DfVpipeZS/1mG7vEZ2En9B+gBn2bNFUJkjBcCDtlT2vrFsp4VS09QQk+cfzvCnQg3kI6W23m6BWFppmuXFyTftsUJxmQwarOBOpxC1sDiTltMPhIVQ7Pa/gpLlYABbEwUFCUHN6Mjb7RdzZbvf4Jl3/RrLCji7TTKhhbxSiY1BEBg48Bis1J5hLHTKKjBGVNjfhPCxVZdGR3629wRbrhpnjHFeXp3cb62lMiVJm5+IFwSbdCMf9gV7ApiGvrOnXtDVHb3bzlt7I/K2+UKLS2U5bR8hDGDVNz8cV50bZddF/vJeTSXU6mNWQZDobp8jsooU+rwL1J5u6vRlBVxqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4YSYPjjjW+4eunCxHRogwOmqKZJOtoDFTDNbzG1rK+s=;
 b=US3HLQRYSRW64kldQ9MNzsHnTYvdGi/ywZ/R3sz/kXdGbq/eR/2KDI2ACTYqcYzhYj/dh5mC4kfkfx4CdMCqkiihSh3G8k/ozbgvvgOZUmEA14uaD5CBtiEWsFiam7PbtDg70Pp5ywSH4VI05/KjY+PDh5UNWnQC6iGrjpaM9Z1pwMXHGM5hf4NzreZW1ZrzYAl0MGPyJ3/ll+9g0ojv4HO3azG0Dh0RhOOWn7Cw3fKaWxCAxRSsuQd0LcWjPtpe5lBzDvZcC9bKaRF0PUqIX3XW8nnbs2x1ONeqohfG5owEm43PjpQRSdyKrWZxJPAFKid2g4ktXPw5IVsA4a0S9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4YSYPjjjW+4eunCxHRogwOmqKZJOtoDFTDNbzG1rK+s=;
 b=gsWMaslx/8QivrZH8Arj9wtpOJNptiCHhCXM0sI96GedHfI5ERHrAXNgDPBs/D36MdL4P2Rvh+TqUl9RI2KAFrI8fgKB33Kwaz+GK91gW42QarGW5kHS4zQGTMA6vQAWRHA3G09zVAFbOnyEmwbO+RWCx2sXKrDrouXQPjVc5vA=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB2536.namprd11.prod.outlook.com (2603:10b6:a02:c4::32)
 by SJ0PR11MB4829.namprd11.prod.outlook.com (2603:10b6:a03:2d3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19; Thu, 24 Jun
 2021 20:39:31 +0000
Received: from BYAPR11MB2536.namprd11.prod.outlook.com
 ([fe80::348e:1e92:4134:aaf2]) by BYAPR11MB2536.namprd11.prod.outlook.com
 ([fe80::348e:1e92:4134:aaf2%7]) with mapi id 15.20.4219.025; Thu, 24 Jun 2021
 20:39:30 +0000
Subject: Re: [oe] [meta-oe][PATCH] lmdb: add recipe
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20210616182123.45393-1-sakib.sajal@windriver.com>
 <f815a254-ce73-8d36-33a1-69da5b4047c4@gmail.com>
From: "Sakib Sajal" <sakib.sajal@windriver.com>
Message-ID: <ac751c4e-62bb-f9fb-8b01-9dc959f24fa9@windriver.com>
Date: Thu, 24 Jun 2021 16:39:21 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <f815a254-ce73-8d36-33a1-69da5b4047c4@gmail.com>
X-Originating-IP: [184.147.76.169]
X-ClientProxiedBy: YTXPR0101CA0015.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::28) To BYAPR11MB2536.namprd11.prod.outlook.com
 (2603:10b6:a02:c4::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.48] (184.147.76.169) by YTXPR0101CA0015.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18 via Frontend Transport; Thu, 24 Jun 2021 20:39:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2e59b432-d2d8-49c1-dd26-08d937502add
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4829:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB48292B4439526B55656DC033F2079@SJ0PR11MB4829.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	a8JZP2z5OklGdnTY77WY7vNF33/KZYyD3T95J+fO+VfVLayxuIalbN6cNXEmUZfi3gdJiOQrJQuLZXu69i8bOl71ARqPDUd3HrmPaV2LG8y/uc/MLb/288wfrjn38JnZGEX+X10ovtjXtktefE8jWIMBAIMQKaVg3n6sEF6liz51zJPRfzBPfFd1FneLn4QYF7fDjEYj3InTUR91kH6910Yzlgi7uwAJwDJwwIg/dLDBOP3Napk3x2CIlxPeUqWVWHZbXM7Fo6MUCYUOPmUJxSoohX35R1AtXWcN6YYpUsKdp+hBGtIY2rto1k0U4pTMeppM+srwF2Jf1NSCk1BT9mjneK2XFD9xVGF6WP0EB/6w0uvTS6JxwKh1iwu1KPnVyP01F+t1SRuBaWKtrJlbElcDvCGh+9ZTkk32y3TMA7txQOgfcIR/WiWbIq6yqB/9lYB9VHJKOz4g/JD+oiWJEtBueA2rhMArPDVF8aHhdaRvn1e8KpzxsWtRRwuLIVCed6h0FwWCrUCNr02iDf6eiAFXstTYWYzpnR6tEO2kifllhWqeuxzvW/Kja4QN+q1JeOycKrw4bghz2vYiy9+w0TZJ0Cftn0k2YTPdSnQVzr+Y0DdPP+PlxxX9UJK/VIOtBq1PUNyaZa78zQGsxUlrELowVMCiJz3U42GugfrGTmZyqsxAizy4oX4Hd5wyHm5xGNeTlWP6iFGJz0AgtkmvrLVY02vUvqMBKTsry2alEX00fM6P4YcpZdxWFDlPINtzMm9VcFSB/B8/C4eGJAMvUvpFXP8HB5De4Tb6yWZ1oP+MASidM2S/WGJcaBf9tKyRp+N1y9WbMXRbte86FtSzmfEx0OpWx3zKB9H1BNL5SKKdcyWzjZNrMDoY2zFGNQYxW01GhTMfbZJOZFKMM7+4sTm9Ga33gHySkdHMQd9fj0g=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2536.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(376002)(346002)(396003)(136003)(366004)(66946007)(31696002)(186003)(86362001)(66476007)(16526019)(2906002)(36756003)(26005)(5660300002)(66556008)(478600001)(38100700002)(956004)(52116002)(966005)(31686004)(53546011)(19627235002)(8936002)(38350700002)(8676002)(83380400001)(16576012)(316002)(2616005)(44832011)(6486002)(6666004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dEowRXRVNXZWWkNLbnFlNDVSOUlTdGlzak85SlBIOVVpNWc4eWp5Ynd2WEZX?=
 =?utf-8?B?Vks4Q3ZBVURpSXJoRlBlQUFrOTQ2RDVVUWpZSHpsc01mRFpRWitNcUd3Zm1O?=
 =?utf-8?B?VnNMRVVYRDlJeGJ5bloxMjg2RlFDeXVZY3dJaU5sUXk3aGRrSDZuOG85YW5H?=
 =?utf-8?B?U3gyY2d0L1FWRVdoY1JRZDJsWG16ekdvUGc1Y05QRE9RaTdpVlNBWlI3RnMv?=
 =?utf-8?B?a1Z1SklGRFdGdlE5S0VNWmQzbENKK2tQQUtlUmxRODZCM2MvaFhxNTBJa2Fi?=
 =?utf-8?B?OWQ2Zk9WTGVtVE5BbjhCbDRwcVhDeG93ZXNrRnF0MGxhQ3BObFdlZ0M0a3BL?=
 =?utf-8?B?WW1SdGpteUFVcUNKRU5TS25Ca3djNWRvTUdRVEdVOGo5VmdFaUJaMkJEakpN?=
 =?utf-8?B?eEcvcmRyeWhiOUsrcTBOeVNCTlVXeCtxZGkwTGJyK2MxQnJUcVR5dVRnblFR?=
 =?utf-8?B?UkFvOFhIMFNPNWtKbURmYVZ5T25ITWI5bGtrZHM3Ym0zWWJoWmhHY0ZteElo?=
 =?utf-8?B?OS9nZENQRVh5cTJUME1NUHhqSnRBKzVCV1c3cXgzOG84c0hPMHBwMEY2ejBR?=
 =?utf-8?B?TCtzK1JsTVpDY2hteFNQWExTTHp0aitOUGxralNzKzVqSHY5bm1IWjI4WEZP?=
 =?utf-8?B?MjNKejN4OEN2cXl2RDlHaVhjT2lEOWlsTk1zN08wNVFud0VTSFI3dHZmYlVG?=
 =?utf-8?B?eE1ndzdvWm0rblFmM2N0amo0TzFNOVRRZUZZR2xHLy9wOXBIVDNnUUhlemZw?=
 =?utf-8?B?aFhnV0VaYzZpWlFObXJXWEUzUE9Db0NBaHlTRzZ0V0RmYlJNTzR5ZGUzSWFB?=
 =?utf-8?B?RXdEYzdQSzlXb2J3d1JXRE9FVis5NFU5cUl1Y1JNZWV4STc0SGtUTTgzNzBD?=
 =?utf-8?B?d0llRnJLWGhlVjdMeWRvWnF2d3Q4SUpaWjhCTnhwQ2NkWkFtQ1NxSHlzZkhl?=
 =?utf-8?B?MEJ0c3hzVXY0YklPY3ZjM2VyN3o2L0h2UnJocGFQL1hCZEhLK0d5V01XQlRw?=
 =?utf-8?B?a1ZzMnBsa2RoOTBHZWtRNmdYNmQyMHFjZzFLTWFHRGVTSTZNSnROZXp6MmN4?=
 =?utf-8?B?dUVvcUV2WlpXckozRDFmK21CM2psQi91OElZZjgvVmdoc0xTck9uYk1mZ1lJ?=
 =?utf-8?B?U1hhYzRFU3hETFBXYkQzUTZoMnYyMmdGdnFIazJPa0ZUY2JxdEdUbFNxWTEx?=
 =?utf-8?B?ckNOYW1TTSs2MGsxL21USVNJVHRFOTd4VDlBS3ptbDNCc3hSTGpIM2M2dG1C?=
 =?utf-8?B?eS9wK3JZalJLSlN4ZWpsdFJxcVplVWxlUS82Zzljc0V5NlVXQkx6TFlKTDdm?=
 =?utf-8?B?NDhYRXl1bGxUYzZmWFpmM3E1R2toSUl0ZkxaS1RlWDZSWDlzNk01dlRPRlVk?=
 =?utf-8?B?aXoxYi9iajU3ZmJOZW1YM2FzWUIyZUZ3d1FpS2ZQTEIvN1EwekUwcnBNa21V?=
 =?utf-8?B?WCtGMXBuTkRPRzVaU0s0OERkUFMyZVVITnJGQ2taTmdYK1pZT3JzYk4xZ0Jn?=
 =?utf-8?B?c3puajIvRXNha0l2M0drM3AyRDdsREVhSmtrNWF0K2hRdnp0OHhDdUxjUGJD?=
 =?utf-8?B?K0pzaGNkOEFEd0VDQ2Y2RENpQjN0blIzTUxzdDRuWU1scWN4TUs4YUtNRXRv?=
 =?utf-8?B?U004SVlhMmc5Skx3SXVleVczOHZwTTVhcTJ3YU1XRUYrY3R6c0xpK0ZDQjRp?=
 =?utf-8?B?Zm1VNm1iYmdpOUNvZFl4N1lSVEEzSWY3dXp2WFJQcmJrSWtET1R4WStVWERJ?=
 =?utf-8?Q?3qLBoqKagyTstqJmg+smFAsTJF8LpFr/OfzWGw8?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e59b432-d2d8-49c1-dd26-08d937502add
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2536.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2021 20:39:30.7789
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dE79KfmITIbaoJ1064G/8alHQgSTuiKr6AaRr/dkhbf4dk+YujGMGRW+wY4DFTUckRUoOjhZyN80dCJIgpIhoO1azdNZOKGNkx/6oVK0JNs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4829
X-Proofpoint-GUID: 7XcotPCJmaBCd-L7GLhpPwkg1Lt82XwR
X-Proofpoint-ORIG-GUID: yAdaeFVtgrrG6yck3h4VTs5yofMtEeyV
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-06-24_15:2021-06-24,2021-06-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1011
 adultscore=0 lowpriorityscore=0 suspectscore=0 mlxscore=0 bulkscore=0
 phishscore=0 mlxlogscore=999 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106240114
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 15OKbrNv029801
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable


On 2021-06-16 3:47 p.m., Khem Raj wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> On 6/16/21 11:21 AM, Sakib Sajal wrote:
>> lmdb provides a high-performance embedded transactional
>> database in the form of a key-value store.
>>
>> Recipe is ported from meta-qt5-extra layer.
>>
>> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
>> ---
>> =C2=A0 .../files/0001-Patch-the-main-Makefile.patch=C2=A0 | 90 ++++++++=
+++++++++++
>> =C2=A0 meta-oe/recipes-dbs/lmdb/lmdb_git.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 22 +++++
>> =C2=A0 2 files changed, 112 insertions(+)
>> =C2=A0 create mode 100644=20
>> meta-oe/recipes-dbs/lmdb/files/0001-Patch-the-main-Makefile.patch
>> =C2=A0 create mode 100644 meta-oe/recipes-dbs/lmdb/lmdb_git.bb
>>
>> diff --git=20
>> a/meta-oe/recipes-dbs/lmdb/files/0001-Patch-the-main-Makefile.patch=20
>> b/meta-oe/recipes-dbs/lmdb/files/0001-Patch-the-main-Makefile.patch
>> new file mode 100644
>> index 000000000..9ba626101
>> --- /dev/null
>> +++ b/meta-oe/recipes-dbs/lmdb/files/0001-Patch-the-main-Makefile.patch
>> @@ -0,0 +1,90 @@
>> +From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@googl=
email.com>
>> +Date: Tue, 1 Sep 2015 22:54:31 +0200
>> +Subject: [PATCH] Patch the main Makefile to allow for a build that=20
>> complies to packaging guidelines.
>> +MIME-Version: 1.0
>> +Content-Type: text/plain; charset=3DUTF-8
>> +Content-Transfer-Encoding: 8bit
>> +
>> +Taken from [1]
>> +
>> +[1]=20
>> https://src.fedoraproject.org/rpms/lmdb/raw/master/f/lmdb-make.patch
>> +
>> +Upstream-Status: Pending
>> +
>> +
>> +diff --git a/Makefile b/Makefile
>> +--- a/Makefile
>> ++++ b/Makefile
>> +@@ -26,6 +26,7 @@ OPT =3D -O2 -g
>> + CFLAGS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D $(THREADS) $(OPT) $(W) $(XCF=
LAGS)
>> + LDLIBS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D
>> + SOLIBS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D
>> ++SOVERSION=C2=A0=C2=A0 =3D 0.0.0
>> + SOEXT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D .so
>> + prefix=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D /usr/local
>> + exec_prefix =3D $(prefix)
>> +@@ -38,7 +39,7 @@ mandir =3D $(datarootdir)/man
>> +=20
>> #######################################################################=
#
>> +
>> + IHDRS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D lmdb.h
>> +-ILIBS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D liblmdb.a liblmdb$(SOEX=
T)
>> ++ILIBS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D liblmdb$(SOEXT) liblmdb=
$(SOEXT).$(SOVERSION)
>> + IPROGS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D mdb_stat mdb_copy mdb_dump m=
db_load
>> + IDOCS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D mdb_stat.1 mdb_copy.1 m=
db_dump.1 mdb_load.1
>> + PROGS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D $(IPROGS) mtest mtest2 =
mtest3 mtest4 mtest5
>> +@@ -49,13 +50,13 @@ install: $(ILIBS) $(IPROGS) $(IHDRS)
>> +=C2=A0=C2=A0=C2=A0=C2=A0 mkdir -p $(DESTDIR)$(libdir)
>> +=C2=A0=C2=A0=C2=A0=C2=A0 mkdir -p $(DESTDIR)$(includedir)
>> +=C2=A0=C2=A0=C2=A0=C2=A0 mkdir -p $(DESTDIR)$(mandir)/man1
>> +-=C2=A0=C2=A0=C2=A0 for f in $(IPROGS); do cp $$f $(DESTDIR)$(bindir);=
 done
>> +-=C2=A0=C2=A0=C2=A0 for f in $(ILIBS); do cp $$f $(DESTDIR)$(libdir); =
done
>> +-=C2=A0=C2=A0=C2=A0 for f in $(IHDRS); do cp $$f $(DESTDIR)$(includedi=
r); done
>> +-=C2=A0=C2=A0=C2=A0 for f in $(IDOCS); do cp $$f $(DESTDIR)$(mandir)/m=
an1; done
>> ++=C2=A0=C2=A0=C2=A0 for f in $(IPROGS); do cp -a $$f $(DESTDIR)$(bindi=
r); done
>> ++=C2=A0=C2=A0=C2=A0 for f in $(ILIBS); do cp -a $$f $(DESTDIR)$(libdir=
); done
>> ++=C2=A0=C2=A0=C2=A0 for f in $(IHDRS); do cp -a $$f $(DESTDIR)$(includ=
edir); done
>> ++=C2=A0=C2=A0=C2=A0 for f in $(IDOCS); do cp -a $$f $(DESTDIR)$(mandir=
)/man1; done
>> +
>> + clean:
>> +-=C2=A0=C2=A0=C2=A0 rm -rf $(PROGS) *.[ao] *.[ls]o *~ testdb
>> ++=C2=A0=C2=A0=C2=A0 rm -rf $(PROGS) *.[ao] *.[ls]o* *~ testdb
>> +
>> + test:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 all
>> +=C2=A0=C2=A0=C2=A0=C2=A0 rm -rf testdb && mkdir testdb
>> +@@ -64,20 +65,24 @@ test:=C2=A0=C2=A0=C2=A0 all
>> + liblmdb.a:=C2=A0 mdb.o midl.o
>> +=C2=A0=C2=A0=C2=A0=C2=A0 $(AR) rs $@ mdb.o midl.o
>> +
>> +-liblmdb$(SOEXT):=C2=A0=C2=A0=C2=A0 mdb.lo midl.lo
>> ++liblmdb$(SOEXT):=C2=A0=C2=A0=C2=A0 liblmdb$(SOEXT).$(SOVERSION)
>> ++=C2=A0=C2=A0=C2=A0 rm -f $@
>> ++=C2=A0=C2=A0=C2=A0 ln -s $< $@
>> ++
>> ++liblmdb$(SOEXT).$(SOVERSION):=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mdb=
.lo midl.lo
>> + #=C2=A0=C2=A0 $(CC) $(LDFLAGS) -pthread -shared -Wl,-Bsymbolic -o $@ =
mdb.o=20
>> midl.o $(SOLIBS)
>> +-=C2=A0=C2=A0=C2=A0 $(CC) $(LDFLAGS) -pthread -shared -o $@ mdb.lo mid=
l.lo $(SOLIBS)
>> ++=C2=A0=C2=A0=C2=A0 $(CC) $(LDFLAGS) -pthread -shared -Wl,-soname,$@ -=
o $@ mdb.lo=20
>> midl.lo $(SOLIBS)
>> +
>> +-mdb_stat: mdb_stat.o liblmdb.a
>> +-mdb_copy: mdb_copy.o liblmdb.a
>> +-mdb_dump: mdb_dump.o liblmdb.a
>> +-mdb_load: mdb_load.o liblmdb.a
>> +-mtest:=C2=A0=C2=A0=C2=A0 mtest.o=C2=A0=C2=A0=C2=A0 liblmdb.a
>> +-mtest2:=C2=A0=C2=A0=C2=A0=C2=A0 mtest2.o liblmdb.a
>> +-mtest3:=C2=A0=C2=A0=C2=A0=C2=A0 mtest3.o liblmdb.a
>> +-mtest4:=C2=A0=C2=A0=C2=A0=C2=A0 mtest4.o liblmdb.a
>> +-mtest5:=C2=A0=C2=A0=C2=A0=C2=A0 mtest5.o liblmdb.a
>> +-mtest6:=C2=A0=C2=A0=C2=A0=C2=A0 mtest6.o liblmdb.a
>> ++mdb_stat: mdb_stat.o liblmdb.so
>> ++mdb_copy: mdb_copy.o liblmdb.so
>> ++mdb_dump: mdb_dump.o liblmdb.so
>> ++mdb_load: mdb_load.o liblmdb.so
>> ++mtest:=C2=A0=C2=A0=C2=A0 mtest.o=C2=A0=C2=A0=C2=A0 liblmdb.so
>> ++mtest2:=C2=A0=C2=A0=C2=A0=C2=A0 mtest2.o liblmdb.so
>> ++mtest3:=C2=A0=C2=A0=C2=A0=C2=A0 mtest3.o liblmdb.so
>> ++mtest4:=C2=A0=C2=A0=C2=A0=C2=A0 mtest4.o liblmdb.so
>> ++mtest5:=C2=A0=C2=A0=C2=A0=C2=A0 mtest5.o liblmdb.so
>> ++mtest6:=C2=A0=C2=A0=C2=A0=C2=A0 mtest6.o liblmdb.so
>> +
>> + mdb.o: mdb.c lmdb.h midl.h
>> +=C2=A0=C2=A0=C2=A0=C2=A0 $(CC) $(CFLAGS) $(CPPFLAGS) -c mdb.c
>> diff --git a/meta-oe/recipes-dbs/lmdb/lmdb_git.bb=20
>> b/meta-oe/recipes-dbs/lmdb/lmdb_git.bb
>> new file mode 100644
>> index 000000000..22db6d44b
>> --- /dev/null
>> +++ b/meta-oe/recipes-dbs/lmdb/lmdb_git.bb
>> @@ -0,0 +1,22 @@
>> +SUMMARY =3D "Symas Lightning Memory-Mapped Database (LMDB)"
>> +HOMEPAGE =3D "http://symas.com/mdb/"
>> +LICENSE =3D "OLDAP-2.8"
>
> We might need a copy of this license in meta-oe/licenses too.
>
>> +LIC_FILES_CHKSUM =3D=20
>> "file://LICENSE;md5=3D153d07ef052c4a37a8fac23bc6031972"
>> +
>> +SRC_URI =3D " \
>> +=C2=A0=C2=A0=C2=A0 git://github.com/LMDB/lmdb.git;nobranch=3D1 \
>> +=C2=A0=C2=A0=C2=A0 file://0001-Patch-the-main-Makefile.patch \
>> +"
>> +SRCREV =3D "8ad7be2510414b9506ec9f9e24f24d04d9b04a1a"
>> +S =3D "${WORKDIR}/git/libraries/liblmdb"
>> +PV =3D "0.9.29"
>
> remove PV here and rename recipe to lmdb_0.0.29.bb
>
>> +
>> +do_compile() {
>> +=C2=A0=C2=A0=C2=A0 oe_runmake "CC=3D${CC}"
>> +}
>> +
>> +do_install() {
>> +=C2=A0=C2=A0=C2=A0 oe_runmake DESTDIR=3D${D} prefix=3D${prefix} libdir=
=
=3D${libdir}=20
>> mandir=3D${mandir} install
>> +=C2=A0=C2=A0=C2=A0 chown -R root:root ${D}${bindir}
>> +=C2=A0=C2=A0=C2=A0 chown -R root:root ${D}${libdir}
>
> why do we need this extra chown op? Is pseudo not able to handle it?

without the "chown" ops, following warning is encountered. The package=20
works fine nonetheless. Any ideas on how to resolve it?

WARNING: lmdb-0.9.29-r0 do_package_qa: QA Issue: lmdb:=20
/usr/lib64/liblmdb.so is owned by uid 20885, which is the same as the=20
user running bitbake. This may be due to host contamination=20
[host-user-contaminated]
WARNING: lmdb-0.9.29-r0 do_package_qa: QA Issue: lmdb:=20
/usr/lib64/liblmdb.so.0.0.0 is owned by uid 20885, which is the same as=20
the user running bitbake. This may be due to host contamination
lmdb: /usr/bin/mdb_dump is owned by uid 20885, which is the same as the=20
user running bitbake. This may be due to host contamination
lmdb: /usr/bin/mdb_copy is owned by uid 20885, which is the same as the=20
user running bitbake. This may be due to host contamination
lmdb: /usr/bin/mdb_stat is owned by uid 20885, which is the same as the=20
user running bitbake. This may be due to host contamination

lmdb: /usr/bin/mdb_load is owned by uid 20885, which is the same as the=20
user running bitbake. This may be due to host contamination=20
[host-user-contaminated]

Sakib


>
> please add it to relevant test packagegroup in packagegroups-meta-oe.bb
> as well.
>
>> +}
>>
>>
>>
>>=20
>>
