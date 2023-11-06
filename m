Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EDA4C4332F
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 15:08:11 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.56939.1699283289746862315
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Nov 2023 07:08:09 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=PqK2WjFz;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=96743c33b2=narpat.mali@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3A6CGst4029966
	for <openembedded-devel@lists.openembedded.org>; Mon, 6 Nov 2023 07:08:09 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=zVMUMUmEKN1M/y5RB0viVk7Sv5uCSUBYBEQ4BV3TrAw=; b=
	PqK2WjFzj5mX0c6rzlYmitex/pQ0WRyI6P1WGHEeyS5/xPmwXgBCSoLgg/DTEkuG
	f8wyF4lYrmFyFjBjv9wXpLxeOv+qtTlT0ds+ExKjMfxStfq3WeL2KpmIwZJJOaO6
	JN//AqV02Vx0goiQ9oudke/MrMqiByWeTOYUzVfeqK3Zd+zTJGqQQvZbkvxVKyFH
	k/Q2vCeGrnOeqaijy25PCvB4u7f+/3wAOUIwAY/WRogWiR9KElpBzwRRHX6AAofj
	FLfmudOxV1/cLQNNj6WwGhHtBvSJtVdfRo8FstumhzQnKwboO9jfDzSyQ0eVIZOM
	QsjX9qFXWV9+nrLexL2rtA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3u5nffscjh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 06 Nov 2023 07:08:09 -0800 (PST)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 3A6F880e012298
	for <openembedded-devel@lists.openembedded.org>; Mon, 6 Nov 2023 07:08:08 -0800
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3u5nffscje-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Nov 2023 07:08:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VPjgXRcSQi8Q0yQqRl8vRxVnWRbCMzLzjU/6F2/3fMMe1/mZJs0kF0Amwu+Tzf2vhhu8ju2cZWP8kX+EdSg4pWbwhf01jf19cGZeKFLNgLxXnCNbeXfxRJoZ3Y1ePMtWYqyUA9bDG1KhXnwfvwNdJjdvT2yDilTmaff40TuUnfSkwJe1KXPF9lUQD4WAhdF6Bw782fsPIB71fRzEBwHY2A7b0YkJi3E6TW6n1EVvUMb7upHzpQv2pK26OWkzehWV7pKF8hC2wB5Zohcd/yHJgIEact+AdkZrHSkkUO2VuanK8gv1vCDfxa5B7+veXzSquCLK+ZRbJtQ9o9GFYKVViw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zVMUMUmEKN1M/y5RB0viVk7Sv5uCSUBYBEQ4BV3TrAw=;
 b=KRNJ2wGV9se1QTdDh0cSY1knkE8BD1bgryCLobxtGJvmLnpAlYype4OCq3FeUvoYsK/djPe0H02we2FtRyFcJ1xg0B0cX064mIsYjVInJTgGH8zQ/itjyYRYY9vhjArGBbb6QX8OV8Le4Oq9OnXOq6NZTtBEau3B8dZkRcU11JHUZ9Jll+iuZ2dOTt/gYpVexuYKOS6lybJfBWi+cYoZWiaQfoGDT1KT05ZGQdQtxYRN2b1R+Hlt5eIFFhoDjt/06FWbL5pw0vQ/EK+9EWCiuLSH0u6K0mOLM6LqRHA6r2rbdOzZ5mBrQWsfwzX/tYrqC/DFiKsmEdswoo/C2HglRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5550.namprd11.prod.outlook.com (2603:10b6:5:38b::24)
 by CY8PR11MB7035.namprd11.prod.outlook.com (2603:10b6:930:51::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Mon, 6 Nov
 2023 15:08:05 +0000
Received: from DM4PR11MB5550.namprd11.prod.outlook.com
 ([fe80::fa81:7416:3c85:80fb]) by DM4PR11MB5550.namprd11.prod.outlook.com
 ([fe80::fa81:7416:3c85:80fb%4]) with mapi id 15.20.6954.028; Mon, 6 Nov 2023
 15:08:05 +0000
Message-ID: <b62bcd3b-19ee-416e-86f6-c3db007fb204@windriver.com>
Date: Mon, 6 Nov 2023 20:34:17 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][kirkstone][PATCH 1/1] open-vm-tools: fix
 CVE-2023-20900
To: openembedded-devel@lists.openembedded.org, akuster808@gmail.com
References: <1787376B597A1E36.28251@lists.openembedded.org>
 <178D581CBA90C2A9.29357@lists.openembedded.org>
 <1793304EEFA9B8DB.7262@lists.openembedded.org>
Content-Language: en-US
From: "Mali, Narpat" <narpat.mali@windriver.com>
In-Reply-To: <1793304EEFA9B8DB.7262@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: PH8PR22CA0022.namprd22.prod.outlook.com
 (2603:10b6:510:2d1::17) To DM4PR11MB5550.namprd11.prod.outlook.com
 (2603:10b6:5:38b::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5550:EE_|CY8PR11MB7035:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e0abbf9-99c7-463d-1be9-08dbdeda2d8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8X+Kgji2+6xYCjiMH6p9qTs55TXNuKdvef/CRBbseMs0o87lZ9h2c6df560/ZHnoVL/z99jbS7s8e4Wp0/owm9CzVmcXu2iD5cpxqr4uRUz7WYD80os3D31srWqmt7J3pBqA2Mj0uOKyIV+7xIZ+UDYxNUDUcK44V0CUUY5hNFrohw95/XH0RdvqkeQ5trC+Yuhrzb/iXzYTS6Bm5M5KgUwr2JpIPtwHz0kAdG/DMup2T5UNeo6mB0iGkM/Nz5/PO0228vFiIZgXz0SXBByutqXCD713niSrBS3mvIFA6OtMeshpGOIl8rn87GPZ/93q6Se74Ors/aGNwaMhpavhtnvJjYzknmekR0S+llqVehzWEeoi++2reuzVMu/ESyUeoX1EatTNiEejOblkIJHu+NAdJSE50GHZVw/rike3I7C03GHqo0cTkcNCgiwWNctoMrfpKoMe7cOOaoBs7lPq600kybxkpsw4eluzcK+rgV55FUTSZRmf/XjTEL8zq6e0nJsda5rC5xpWRqoWGYoNymAfNI6M/OkA6Dhe3Dqe4Tj6SrNZpdU/ajvP+Km0Bp/+kq3MjeTyZF56VWcGuuJVxLE02ihuV10OM7+Z4GrEKIzZ57D0nxeO3QTqGIuCMgNbGZvAOET/aJFwVvKEz/5q+Tk43ofNrQbh5eNIdEIl/gEuIOPKy+eU3rGVqZSTf2b6vRMT/7T6Mpmff+smTTgUToRmS+tde7L72Dv/W698RNA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5550.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(39850400004)(346002)(376002)(396003)(230922051799003)(230173577357003)(230273577357003)(64100799003)(451199024)(1800799009)(186009)(2906002)(5660300002)(8676002)(8936002)(83380400001)(31686004)(86362001)(38100700002)(41300700001)(84970400001)(31696002)(2616005)(6512007)(66899024)(316002)(66556008)(66476007)(66946007)(6506007)(6666004)(55236004)(53546011)(6486002)(966005)(26005)(478600001)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?K0x0ZWZWT204dVhFVCtIVEgvR012eW83MS81Y3JCWnlQRkw5bWNNWmU5OFIy?=
 =?utf-8?B?eE9wMGpxME5SYmFEQ3RnRExwNCs1SjlrNVMySkNsYUdpdlhJQitteHVqY3ZP?=
 =?utf-8?B?T1c5ekxRWGxaelJuYnJLSE9qU0VOc2UvZUR0MFQ5MHN0V2I2NDRIdWh1bnVL?=
 =?utf-8?B?Mi9VMHI1TXRuamh1aU5CeE5oSXB5NUFiMEV2VDU0RDZzNmJJaG14YXlTcWlj?=
 =?utf-8?B?OFVobmQvTk5lWGk5bTltVlIxeUZKWlhMc2YvVWcwTzBHc1BWdTBlYXd5RE9S?=
 =?utf-8?B?ZFhPOXdLZDdqUmJTQXNNUVUxTUpCVmx6dFk5akd2WUpEZzA4OVUxbEdqb2pZ?=
 =?utf-8?B?R3VITUwzZU9ZaU4wR1plRDFwelZvT3dnWmx0ZjFlQkNQUXdZckpVWStTcHFr?=
 =?utf-8?B?VG9NcUtDY3hCZEN4eFBYN0wyYmtXd01WL1M1d3dva3htMHNIR28xRW4rTDZK?=
 =?utf-8?B?ZXRMZ093ZFNXYkVoZTEwOXZmS0NKNjZ2UzZLUXFSRUhweHgyL1JFMU5PKy9M?=
 =?utf-8?B?R3puU3dvMlFqeHJvWDhUNXlMWEtHcnF1eituUWg0cVY3b2RaenBHRzFkamt4?=
 =?utf-8?B?Yks0RTlaNWFvOW95VHhRYmM0ZVJIbXk4Y2xSQjVLYW1kYXZVNC9VdmxoREEz?=
 =?utf-8?B?VnBGQ3UveG00V1VoZkxUdjhnMktUeVpBb1NJNmFVZmRmR1hrKzVWTTkyYkFM?=
 =?utf-8?B?WW1mUDQzNmoxb1BhNWZtWUhmUTNrd3ExMXpsQ215cm4vRUpuMmtJNFJmTExl?=
 =?utf-8?B?ZVhNdWdURHZ4cFZrMVdSQlFJd0R6VjB0R2I5bFJEQ1RTZmN6dHhGU3JjdHp4?=
 =?utf-8?B?aE10MmJNNjBhbmVCblBwbnB0YzUySFdLT3Q2NDZ4NzRRMko1elZXZXFremJp?=
 =?utf-8?B?NldaOUVMaTU2UnVuMnAwdUNBOTZmZTRGMVFiQ3o5K0F0QVp5aVMyanJWZDZ5?=
 =?utf-8?B?Wm1ZR2tyUTRYcTJ2NDNNdXR2ajJaSkUrR3NsQ1BnZEZRbFFReW5SK3VacFdx?=
 =?utf-8?B?QmpJRnhIZTl6TE1admJwMTU5emwvazJmYVVZWlh1Lzd6WWFLWU9xdWxDQTRZ?=
 =?utf-8?B?TS9DVkk4VVIzbXVrdlhpK1hXZzF4RUs0S1lzWHhNOUt5LzVJdEg0QnhheEpw?=
 =?utf-8?B?MDdqSjUyV1hyT0FmMHMyakxCOTBDRVY2ZXVhNlprWnBjTG1EdGFOY3FKY2s4?=
 =?utf-8?B?cDJIRU40L0tWYXlxTUxMWFdUaTc2bnp1NlNaaEVFbTJYTmp5SlN4T2daeGFJ?=
 =?utf-8?B?TFU4eURSeG5hQ3pKOXRuc2UzTjR6a3lDdE01M2NERGhBNEE5TjJGZkJNRHVK?=
 =?utf-8?B?LzNnd2NhWmZ0YTFDenYzbUhGRzNZUWJodm9QbjIyNWFBeEtNUGtsUUt0dUVQ?=
 =?utf-8?B?MHF3LzFXNzFsNkJHWE01NnpMamR2ODNVVGIvd1hZV29kbFQ3TU11eVpKTTZV?=
 =?utf-8?B?NklaMld4MEpIb2IzVWJvbElFb0hKVC9TZm1MSUt0ZWJpQVZkb2dKUmlBa1pM?=
 =?utf-8?B?ak83SUVZVk9lK2MwN2syUlY5NDdDTitYNlh5M1RLb08weTh0SEh3djBIVHJz?=
 =?utf-8?B?eVp1c3JBZFViQWJiWmtVOXZXRWhhT05aNVMwakFLUEZlVklqVUtZRCtLaTZw?=
 =?utf-8?B?cDg2VmtLdGplRkh5bHFhMkgxV0hrSW5SQXVSUmtBUzZTZjMrQ3ppcjMzNTNW?=
 =?utf-8?B?QTV0R0FXL3FzaVpEM1ZjbTBNY2VBUjNQT0ZwNldDaHhheTlzNUYzRU5MVDR0?=
 =?utf-8?B?WW14V2hNZkN3TGI5eU1LcVZrZWJRd01MY0prNnVaZHc3MHliQnR0UVh6NHo1?=
 =?utf-8?B?SnFUei9nTGpEOHFvSDVHUGs5bWdJa3huWFlOSTBBTEU2bk0ram5RRlFOalhq?=
 =?utf-8?B?M3Bpc2JmeVVhMGFLbjNjWHplU3IzaFFydkxNaU12eEpZdU9HcjVBaEVkMFhB?=
 =?utf-8?B?KzN4ZFRkUzYwMVpiV3BKNzFtY3V3aXFKVmZTTHAwUVVmYlBORXVZOVJQZFFr?=
 =?utf-8?B?djY2WVFKbHJUWGNaSkM5RUFreWhvSGRLM2JUaGhxM1A3N0pjb1Rialp5OW1h?=
 =?utf-8?B?R21XRHBkazlPSU9XUHFkVmxEQmVTNjlrb05rZ3JXZ3NHUXhMdmU3c3ZaOVRM?=
 =?utf-8?B?YlNxanlWTzNlK3A2UWV5cE96Yk5LQStJazZlcDlXaWJsU3ZaTEdNQjB4WmJ4?=
 =?utf-8?B?Ymc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e0abbf9-99c7-463d-1be9-08dbdeda2d8b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5550.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2023 15:08:05.3248
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pKrgYLclpSwOIbrArWngtieyUUpZ6zjpWC8wXZ5mDsk1WTEp4Tu8/3U6WPCr7tgyu045Uc0MkIxzaHLUPV7DV3D+wVVF0BqjWTmCQNDbemU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7035
X-Proofpoint-GUID: LBF1-_jwV4tvBwZt-QMuyewElObgJQAl
X-Proofpoint-ORIG-GUID: 9tZMuaIFqNZ7a3Ltd9H6WJNchyrMdxzN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-06_12,2023-11-02_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2310240000 definitions=main-2311060122
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 3A6CGst4029966
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Nov 2023 15:08:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106416

On 31-10-2023 17:42, Narpat Mali via lists.openembedded.org wrote:
> On 12-10-2023 16:44, Narpat Mali via lists.openembedded.org wrote:
>> On 22-09-2023 17:41, Narpat Mali via lists.openembedded.org wrote:
>>> From: Narpat Mali <narpat.mali@windriver.com>
>>>
>>> A malicious actor that has been granted Guest Operation Privileges
>>> https://docs.vmware.com/en/VMware-vSphere/8.0/vsphere-security/GUID
>>> -6A952214-0E5E-4CCF-9D2A-90948FF643EC.html in a target virtual machin=
e
>>> may be able to elevate their privileges if that target virtual machin=
e
>>> has been assigned a more privileged Guest Alias https://vdc-download.
>>> vmware.com/vmwb-repository/dcr-public/d1902b0e-d479-46bf-8ac9-cee0e31
>>> e8ec0/07ce8dbd-db48-4261-9b8f-c6d3ad8ba472/vim.vm.guest.AliasManager.=
html=20
>>> .
>>>
>>> References:
>>> https://nvd.nist.gov/vuln/detail/CVE-2023-20900
>>> https://security-tracker.debian.org/tracker/CVE-2023-20900
>>>
>>> Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
>>> ---
>>> =C2=A0 .../open-vm-tools/CVE-2023-20900.patch=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 36=20
>>> +++++++++++++++++++
>>> =C2=A0 .../open-vm-tools/open-vm-tools_11.3.5.bb=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 1 +
>>> =C2=A0 2 files changed, 37 insertions(+)
>>> =C2=A0 create mode 100644=20
>>> meta-networking/recipes-support/open-vm-tools/open-vm-tools/CVE-2023-=
20900.patch
>>>
>>> diff --git=20
>>> a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/CVE-202=
3-20900.patch=20
>>> b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/CVE-202=
3-20900.patch=20
>>>
>>> new file mode 100644
>>> index 0000000000..1b51e500aa
>>> --- /dev/null
>>> +++=20
>>> b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/CVE-202=
3-20900.patch
>>> @@ -0,0 +1,36 @@
>>> +From 108d81c70d0a6792847051d121a660ef3511517d Mon Sep 17 00:00:00 20=
01
>>> +From: Katy Feng <fkaty@vmware.com>
>>> +Date: Fri, 22 Sep 2023 10:15:58 +0000
>>> +Subject: [PATCH] Allow only X509 certs to verify the SAML token=20
>>> signature.
>>> +
>>> +CVE: CVE-2023-20900
>>> +
>>> +Upstream-Status: Backport=20
>>> [https://github.com/vmware/open-vm-tools/commit/74b6d0d9000eda1a2c8f3=
1c40c725fb0b8520b16]
>>> +
>>> +Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
>>> +---
>>> + open-vm-tools/vgauth/serviceImpl/saml-xmlsec1.c | 9 ++++++++-
>>> + 1 file changed, 8 insertions(+), 1 deletion(-)
>>> +
>>> +diff --git a/open-vm-tools/vgauth/serviceImpl/saml-xmlsec1.c=20
>>> b/open-vm-tools/vgauth/serviceImpl/saml-xmlsec1.c
>>> +index aaa5082a..ad8fe304 100644
>>> +--- a/open-vm-tools/vgauth/serviceImpl/saml-xmlsec1.c
>>> ++++ b/open-vm-tools/vgauth/serviceImpl/saml-xmlsec1.c
>>> +@@ -1273,7 +1273,14 @@ VerifySignature(xmlDocPtr doc,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
>>> +=C2=A0=C2=A0=C2=A0 bRet =3D RegisterID(xmlDocGetRootElement(doc), "I=
D");
>>> +=C2=A0=C2=A0=C2=A0 if (bRet =3D=3D FALSE) {
>>> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 g_warning("failed to register ID\n")=
;
>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 g_warning("Failed to register ID\n")=
;
>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto done;
>>> ++=C2=A0=C2=A0 }
>>> ++
>>> ++=C2=A0=C2=A0 /* Use only X509 certs to validate the signature */
>>> ++=C2=A0=C2=A0 if (xmlSecPtrListAdd(&(dsigCtx->keyInfoReadCtx.enabled=
KeyData),
>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BAD=
_CAST xmlSecKeyDataX509Id) < 0) {
>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 g_warning("Failed to limit allowed k=
ey data\n");
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto done;
>>> +=C2=A0=C2=A0=C2=A0 }
>>> +
>>> +--
>>> +2.40.0
>>> diff --git=20
>>> a/meta-networking/recipes-support/open-vm-tools/open-vm-tools_11.3.5.=
bb=20
>>> b/meta-networking/recipes-support/open-vm-tools/open-vm-tools_11.3.5.=
bb
>>> index 4670a85a67..cf3af007b9 100644
>>> ---=20
>>> a/meta-networking/recipes-support/open-vm-tools/open-vm-tools_11.3.5.=
bb
>>> +++=20
>>> b/meta-networking/recipes-support/open-vm-tools/open-vm-tools_11.3.5.=
bb
>>> @@ -45,6 +45,7 @@ SRC_URI =3D=20
>>> "git://github.com/vmware/open-vm-tools.git;protocol=3Dhttps;branch=3D=
maste
>>> file://0002-hgfsServerLinux-Consider-64bit-time_t-possibility.patch;p=
atchdir=3D..=20
>>> \
>>> file://0001-open-vm-tools-Correct-include-path-for-poll.h.patch;patch=
dir=3D..=20
>>> \
>>> file://0001-Properly-check-authorization-on-incoming-guestOps-re.patc=
h;patchdir=3D..=20
>>> \
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://=
CVE-2023-20900.patch;patchdir=3D.. \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 "
>>> =C2=A0 =C2=A0 UPSTREAM_CHECK_GITTAGREGEX =3D "stable-(?P<pver>\d+(\.\=
d+)+)"
>>>
>>>
>> Gentle Reminder !!
>>
>> ../Narpat
>
> Hi Armin,
>
> Gentle Reminder !!
>
> It's pending from last month.
>
> ../Narpat
>>
>>
Hi Armin,

Gentle Reminder !!

It's pending from September month.

../Narpat
>>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#105802): https://lists.openembedded.org/g/openembed=
ded-devel/message/105802
> Mute This Topic: https://lists.openembedded.org/mt/101519654/7199376
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[narpat.mali@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

