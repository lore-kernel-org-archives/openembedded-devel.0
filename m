Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E2AAC4167D
	for <webhook@archiver.kernel.org>; Fri, 25 Nov 2022 22:37:21 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.59067.1669415835503766153
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Nov 2022 14:37:15 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=DW2MBUfc;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8328117f31=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2APMSToi030636
	for <openembedded-devel@lists.openembedded.org>; Fri, 25 Nov 2022 22:37:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=TWtmxRDhQKiIitNGpcGUDpql/rQq+WDpsNoO9NjemL0=;
 b=DW2MBUfcpfjCQtezi5fSsWSWZHYIT0qsyVVFtsJmKVPGxrYZ2xfmbQrLBPHO+An/De3v
 34xDgPWlGYX69qN00fBXW7TUIn1oFQpoZjA/msoh/rKzwbCbCFz3McE9sHmJr/4J4865
 JVojALr69iG2+yV7FKjsB+NNTpOu+VRImg19QzeuIErR2sngxcQuajkgsh+yZfAuP7sU
 7Kgso7xHgLgP9TSaclozRaocfgr4Eoiq/okdZvEAbx1vvdUhyQait+EZDwYunk0BmCXf
 FEPAU2bSocRgLxadmOkx438AUGvL8ATbcJ6Mn2ZKn55EtXrFXHeLdofOJHHV9Jh9UbP4 aw== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2172.outbound.protection.outlook.com [104.47.55.172])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kxnxj5a95-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 25 Nov 2022 22:37:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jMSFpG7BSVNIYgCbzwGV+eU/RlXTeSw5xya+k4nWjem9QtY0XiSjH5BiJNlR6VP2+uD+3nJbim9uQEyyALEvZolEgyJzS40QseJDIlNKH2HIfxeXT+ppscrl8P5IQwNYs8iCU1IuwtZsmI7HRCPQY3TVzX8FRi1qTu9XL5wOXJoPPcjAkZ3JIQ8PRwVC+IX9hzhdXIGO3urEh5PIBIrBWDebbcmIl4IFAOjhDYipb/NRKLarkNWCPEGsgiD4kJK94ImyImPSnPV8McxLEz6O6Q0JQS76Y5GW3IOhmpeqD6ttKIqFRAehQ3sBq7sAahFpakYY6FXV+035cko6rmBArA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TWtmxRDhQKiIitNGpcGUDpql/rQq+WDpsNoO9NjemL0=;
 b=UhJ8ZvGEOsoNQXlRpQe64MBW2pwQN51xEd0K0sAfJhDF3vrXDJ1xLR3epJTejzHCdSE2qsc7k0lm6X62aYJ8EUOIkB/13CT5+D1nZ2gKAhEiJrp2nQeobX3RIVPgxYAWKwSNXfkSM/F6NQZ73Dyp6XwEoAFKpQwoxjw7xS0fh9bjI8lzcXQMXVeGLIMRsX26E1nU0LkiuPhPtBR5xXXYZNr7/fGfnrp0drRPAJgd8FPdf6NvTWN0QQl7ZboaY4lA9KquRiUsOTWEGNg9/5pwoXRbFcOucvrfmftyjjz9ktoTTZzEYtnbX+hsKk9y0QB+DvaXY9DlAe3vs+dGrbADMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by IA0PR11MB7378.namprd11.prod.outlook.com (2603:10b6:208:432::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.19; Fri, 25 Nov
 2022 22:37:09 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::e794:335f:5e0f:8d36]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::e794:335f:5e0f:8d36%6]) with mapi id 15.20.5857.020; Fri, 25 Nov 2022
 22:37:08 +0000
Message-ID: <3416d62e-7d3a-22e0-21da-7cf0377dbf78@windriver.com>
Date: Fri, 25 Nov 2022 17:37:05 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [master][PATCH v2] python3-inotify: add ptest
Content-Language: en-CA
To: Zheng Qiu <zheng.qiu@windriver.com>,
        openembedded-devel@lists.openembedded.org
References: <20221125195601.3696953-1-zheng.qiu@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20221125195601.3696953-1-zheng.qiu@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: BY5PR17CA0045.namprd17.prod.outlook.com
 (2603:10b6:a03:167::22) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|IA0PR11MB7378:EE_
X-MS-Office365-Filtering-Correlation-Id: b0ee3539-8dff-4ec3-19cb-08dacf359627
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	TIowdp1EDYZ2EHA4XPiVjyNFLqjc9lxHkxYOXmA2faLATdZEb2wl5qpG7BjByA1aNzR8W28v7zkcF7ZbxYku4fvl3OB+ChWN1WKkgc0bVgohPJOQNTMto2Q0aCUs9jzV9PS9yna6/yG1w75fhV5jKhaZq1gge8ZzPxLmbzlEp0r3wnnTCuXEB5oWGKIgWmvTei2ANWC+69FybHc5wIXDSa/7gwb+qrXhz25GWKwxxtoalO+4mMcENacffEInhxZJvfNpsfREt2iBvU3xTtk86FdKn4qnF4S2DTJS3TvOIKG4QQyK7okJpEgBAy6cxHXhBlYmz0y6V+agskpMk4yepvdGCMEbEM0i49j+/u+Uo4hzPUgEmTgpvSpsm01+RoYUWhnJJrXQE/JOSRtJgTZTW1qAjP8uVYA30sr0JM6i8kYp3rdWB78J7Lbfb/qxgmERhPU9RIHQz1mqGxb2fiAbGJdj99KQkfCQyKT1Cjg4DpbphP227nmHFEzgLswzGjRlSDTsY4EFxLf8mEdLYIgDfOSR4jkwOkcq3iwX1SEWVIJruNHW1ZwfxIIuDRIDtmGqgWv98oNc51tCpUH4hxzyVL5TxhuuRsi+T+CPrThlCESPwT3Q9oLAHYzYA5oY5B4mib56BKeTC3RjIHCZy/scARlHCrLBymq4ndq3rT3Tc8SzP3WC+yPWe9EG3dmw8mpZWFXQ5EN50u8QpjNgMAOzmQCNKR6RuuIxWcvX4d6k9rMP5hNVorPVY972j876Ex78
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(366004)(136003)(39850400004)(396003)(451199015)(86362001)(38100700002)(66476007)(31696002)(316002)(66946007)(8676002)(6512007)(66556008)(4001150100001)(41300700001)(8936002)(186003)(966005)(5660300002)(2906002)(6486002)(6506007)(6666004)(83380400001)(2616005)(478600001)(26005)(53546011)(31686004)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?N1poazdPbmJORERWWFZkajhGZU1xUUk4bDYzRkxDcHpMR2NhZUdBOGVCRE1N?=
 =?utf-8?B?VnpHOWhGajBSMXdWb0ZCU3FabUI1cEVBN21xQTFXS3UzY0tvb3QvNjc4N2Ix?=
 =?utf-8?B?c1ZzaXBvM1lSOEJnM0ZMenVvTUFMd25HU2h2N2pKcU5SNEEvNjBUdmgyNlFN?=
 =?utf-8?B?b2FMcUFqLzBOMy9HQ2pBb0daZWpDbTFZb1JuZTB4TmpueERJVTh1d3plcFo2?=
 =?utf-8?B?NFZHSEMzc3JSSTE3QnhPR3UrUk5JYVRvTFpPSHcySGZicFpML1pyZW9oVlNo?=
 =?utf-8?B?YmFCV1lZWjZJZWR0cVRRRzBLbVVuamVsa293OHJ5UHlkT1d0TjhDM3hYdlR2?=
 =?utf-8?B?SWNSS00yeVBqTHNHRkJ3SjdsZGV6K0dXWFpKT3F3ZjdMOS80cDh1eS9ZME5D?=
 =?utf-8?B?blhWVUpURGNmdjdOamc2NWJkL0tIeUJrTVZMNnJFWVVYbGIrVVBRSkp5emNr?=
 =?utf-8?B?QkJSa3p4L0FyZlNGYXZXa2pnSlpzbjhhci9GbzJjcEFCV2hKenc5elBQUVZw?=
 =?utf-8?B?akEyeDRaSWRDVllPa3plZm81dEs3SW1KN3poaTltWi9YMXIwRGhoaWVWU0Vh?=
 =?utf-8?B?THZBa2hmdSt6Zkk3cUpLM1pvVkkwbHU3Q1k3VUM1Q0hrMmxxSlE1eXZVRmhy?=
 =?utf-8?B?a3VSdkQxYytoSEtieWVJeFlQVDdZRC9DY0hOeWpwNTJPNU5hcWJBVU5LUUpk?=
 =?utf-8?B?eUl0ZkxYTEZsRlpDMFRHR1BWSUNVcU84VTk3azN0S0VkQm42TnpLanVJYXNZ?=
 =?utf-8?B?bE8xc0IrZ2hLaDhYTzZobVB1WndydFo5dGs0aHJ5czlqajNRM0JWNWNvT1h4?=
 =?utf-8?B?dzhrUFZ2MnZ5UkJMK2gzMGk1ZlV0QnpkUERVb0kxc0FPZFNmTXpLZk1QVjUx?=
 =?utf-8?B?ZHA1SmQxVWNNTlM5SE91TzNuMEpERXEvRW1mVHlSM2NnVFN6TGxZcFZHR0d1?=
 =?utf-8?B?bERYY2k5V2FXbkVvbktDR1BjT2JkTE5Ld0h6K0dKYW5lSVRRUXFyL09BMjZ5?=
 =?utf-8?B?WU1hWUtSWE93bkFqaUI2cC9qSkhNL0tXeVNya2F0akhkU0RWRHpnTTBmTDkv?=
 =?utf-8?B?T3RVZXZJUlhzV2lvYXRmYmpJZ040dEo4NlFJakNwNEszamhhNnkxeS9wQXlV?=
 =?utf-8?B?WWZWTEhNZjJWWVJGYVFQSjFKODJhd2k1a3NoR1l1QnArMVNsWktpdVdGdkFX?=
 =?utf-8?B?bkJRM20rc2tsb0h5SXFsNEtaKy9hUFhYUFkrdnFqOE1KamJ3VDNGa25VMVMz?=
 =?utf-8?B?UUlPNUcwVXNUMHNPUStTVXlBZHZmRjhxNWJubWxEek9aQ0lvcS9hTXFTVmVk?=
 =?utf-8?B?MTBzS28zZW5uYXJvRHkzREhkaEVWbit0NTlTUzMycFVsVzBmNmVzcWI5L2xC?=
 =?utf-8?B?cUV0Wk16YjBKRWRUOFNKU2MvNWpYSWFtTzZXZlRsZ0hwT1pZbmVNSUVrMmpu?=
 =?utf-8?B?T1ovcVNsOGhNMkFSTTFyM3llVWxET01vZUNZdVcxTzlZdi9KZFhjS0trYjBW?=
 =?utf-8?B?c3lPMm92TlNVMlA5enZUa1N3UG1EV2lRZkpweXRkN1hTRzZJWVlRaU9GWjdp?=
 =?utf-8?B?WktNbXVwd01selpuVVRCV21sTzZDb3Y1R1JBZFBjUExTT251QXBqelpzU3RX?=
 =?utf-8?B?ckNIMDF3c3FmOFZ6RHRPL1E5NWxvUnVrMjFINzV4OVppTzJDelE5bkdXclNp?=
 =?utf-8?B?UmFrc2VtQnZZaDdJT0g4SGtBcHlvQXRlT01ZbHNEeC9FVUZGUytCRzFqSUdk?=
 =?utf-8?B?VzQ1L1RyVkt2ZDNQbVprRXcyWmh2VDlCL1hhK3laRFlNU1d2REU1bUZZcHJN?=
 =?utf-8?B?c3pXcDYvdHFQMkZqSTdDdjcwYWlYdkdmZWo3cU5xcUxCSWlaWTUvSG1hTUMz?=
 =?utf-8?B?NDJJK3VVYVV6UWVsVGcyWEVDSnFHNVcwQzRSVnNrQmNVOEVadVRLOGVucHJi?=
 =?utf-8?B?R0g0NWZKWTdISTY3OXFHTkVidEJHM1BlVjNlTkZENUhHRkRKSmR1SHhraUNx?=
 =?utf-8?B?S0FVNW94cGNTMWlUZ1BZc1BHVnN2bkgvVHdRNkI1WXFCSTNGRHpHS2krTTN1?=
 =?utf-8?B?WFd0dCtLQU9Jd2hWU3ZHWHVNMTRoSVQwM2JDeXNQMDc1QjFOeW15dnlZSEpj?=
 =?utf-8?B?LzRMU2w2R2ttSVloVXVPc09DRjlvb0hMQ3dnR0FNUm5vZ0R5NVFycUlkOWFo?=
 =?utf-8?B?cWc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0ee3539-8dff-4ec3-19cb-08dacf359627
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2022 22:37:08.7270
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M2Rj6bRtW2et32zlnNtOD0eqUVCo81UdzvmEmwxo12CczWtyMYdgKhzWDk6OFqz7l7P/6xFOINnqzcQElWDhsJkUFR8yFyMv2WIGk8LEgxc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7378
X-Proofpoint-GUID: D7BwnQN3leND6Wk_XWBvk6yXgVgSGB7y
X-Proofpoint-ORIG-GUID: D7BwnQN3leND6Wk_XWBvk6yXgVgSGB7y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-25_12,2022-11-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 malwarescore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211250174
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 2APMSToi030636
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Nov 2022 22:37:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99743

On 2022-11-25 14:56, Zheng Qiu wrote:
> Add ptest provided from the source code, and run it using pytest.
>=20
> Since the tarball provided with pypi does not include ptest, switch the
> source to be its git repo.
>=20
> ptest result:
>             PASS FAIL SKIP
> qemux86-64 5    3    1
> qemuarm64  5    3    1
>=20
> This issue exists since inotify adds unit test support, and it is
> reported here: https://github.com/dsoprea/PyInotify/issues/95

As you mentioned elsewhere:

   The two of the test are trying to make notifification using the packag=
e
   when a new directory has been created or a directory has been renamed.
   The issue occurs because the result in a list (i.e. ['IN_ISDIR',=20
'IN_CREATE'])
   is in different order but contains same components.

   The other test that is always failing is a test that makes a=20
directory and
   trying to access those directories. The test is failing because a
   bunch of =E2=80=9Cwidth=E2=80=9D variable is not as expected.


so while the tests should be fixed, they don't seem to problems with
the underlying functionality. We'll send fixes to upstream should they
ever come out of open source hibernation.

I still think we should use the git/HEAD as I'm suggested in other email.


../Randy

>=20
> Signed-off-by: Zheng Qiu <zheng.qiu@windriver.com>
> ---
>   .../python/python3-inotify/run-ptest          |  3 ++
>   .../python/python3-inotify_0.2.10.bb          | 14 --------
>   .../python/python3-inotify_git.bb             | 35 ++++++++++++++++++=
+
>   3 files changed, 38 insertions(+), 14 deletions(-)
>   create mode 100644 meta-python/recipes-devtools/python/python3-inotif=
y/run-ptest
>   delete mode 100644 meta-python/recipes-devtools/python/python3-inotif=
y_0.2.10.bb
>   create mode 100644 meta-python/recipes-devtools/python/python3-inotif=
y_git.bb
>=20
> diff --git a/meta-python/recipes-devtools/python/python3-inotify/run-pt=
est b/meta-python/recipes-devtools/python/python3-inotify/run-ptest
> new file mode 100644
> index 000000000..3385d6893
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-inotify/run-ptest
> @@ -0,0 +1,3 @@
> +#!/bin/sh
> +
> +pytest -o log_cli=3Dtrue -o log_cli_level=3DINFO | sed -e 's/\[...%\]/=
/g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPED/=
SKIP/g'| awk '{if ($NF=3D=3D"PASS" || $NF=3D=3D"FAIL" || $NF=3D=3D"SKIP" =
|| $NF=3D=3D"XFAIL" || $NF=3D=3D"XPASS"){printf "%s: %s\n", $NF, $0}else{=
print}}'| awk '{if ($NF=3D=3D"PASS" || $NF=3D=3D"FAIL" || $NF=3D=3D"SKIP"=
 || $NF=3D=3D"XFAIL" || $NF=3D=3D"XPASS") {$NF=3D"";print $0}else{print}}=
'
> diff --git a/meta-python/recipes-devtools/python/python3-inotify_0.2.10=
.bb b/meta-python/recipes-devtools/python/python3-inotify_0.2.10.bb
> deleted file mode 100644
> index 524c3a0d2..000000000
> --- a/meta-python/recipes-devtools/python/python3-inotify_0.2.10.bb
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -SUMMARY =3D "An adapter to Linux kernel support for inotify directory-=
watching."
> -AUTHOR =3D "Dustin Oprea"
> -HOMEPAGE =3D "https://pypi.org/project/inotify/"
> -LICENSE =3D "GPL-2.0-only"
> -LIC_FILES_CHKSUM =3D "file://setup.py;md5=3D79b7ec72aa0d446a552d3cceb5=
799e41;beginline=3D28;endline=3D28"
> -
> -SRC_URI[sha256sum] =3D "974a623a338482b62e16d4eb705fb863ed33ec178680fc=
3e96ccdf0df6c02a07"
> -
> -inherit pypi setuptools3
> -
> -RDEPENDS:${PN} +=3D " \
> -    python3-ctypes \
> -    python3-logging \
> -"
> diff --git a/meta-python/recipes-devtools/python/python3-inotify_git.bb=
 b/meta-python/recipes-devtools/python/python3-inotify_git.bb
> new file mode 100644
> index 000000000..22615a97e
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-inotify_git.bb
> @@ -0,0 +1,35 @@
> +SUMMARY =3D "An adapter to Linux kernel support for inotify directory-=
watching."
> +AUTHOR =3D "Dustin Oprea"
> +HOMEPAGE =3D "https://pypi.org/project/inotify/"
> +LICENSE =3D "GPL-2.0-only"
> +LIC_FILES_CHKSUM =3D "file://setup.py;md5=3D79b7ec72aa0d446a552d3cceb5=
799e41;beginline=3D28;endline=3D28"
> +
> +SRC_URI[sha256sum] =3D "974a623a338482b62e16d4eb705fb863ed33ec178680fc=
3e96ccdf0df6c02a07"
> +
> +SRC_URI =3D " \
> +    git://github.com/dsoprea/pyinotify.git;branch=3Dmaster;protocol=3D=
https \
> +    file://run-ptest \
> +"
> +
> +SRCREV =3D "288a2b01fd4a726dc68d960f8351630aee788a13"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit setuptools3 ptest
> +PIP_INSTALL_PACKAGE =3D "inotify"
> +PIP_INSTALL_DIST_PATH =3D "${S}/dist"
> +
> +
> +RDEPENDS:${PN} +=3D " \
> +    python3-ctypes \
> +    python3-logging \
> +"
> +
> +RDEPENDS:${PN}-ptest +=3D " \
> +    ${PYTHON_PN}-pytest \
> +"
> +
> +do_install_ptest() {
> +    install -d ${D}${PTEST_PATH}/tests
> +    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
> +}

--=20
# Randy MacLeod
# Wind River Linux


