Return-Path: <adrian.ratiu@ni.com>
X-Greylist: delayed 1574 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 27 Dec 2017 22:13:13 UTC
Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com
	[148.163.158.57])
	by mail.openembedded.org (Postfix) with ESMTP id B058E605B3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Dec 2017 22:13:13 +0000 (UTC)
Received: from pps.filterd (m0098779.ppops.net [127.0.0.1])
	by mx0b-00010702.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
	vBRLfaZW013672; Wed, 27 Dec 2017 15:47:00 -0600
Received: from nam02-bl2-obe.outbound.protection.outlook.com
	(mail-bl2nam02lp0081.outbound.protection.outlook.com [207.46.163.81])
	by mx0b-00010702.pphosted.com with ESMTP id 2f1nu88qg1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Wed, 27 Dec 2017 15:47:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nio365.onmicrosoft.com; s=selector1-ni-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=4MAZikaEJIJkNFD3zPEVMc3OfECJlbKbOycGOXWGMCA=;
	b=B2cFw7DJPh0J/ERG+9jzrNkCbO08xnf7b5Zt86F+bQE9kqXtLWozyMEkTr65Nousfbb1AYtgJU+h37iy6B6+RMzpyemKMkuP5d+qBTvMX7oyT/Z/agd1norK/Im9pao1rwm+3zSRTJr0HPvMCpe2Tul9RMkMcu1GMmQ29MC9n4Q=
Received: from adiPC (2a02:2f0e:1d0:bcc:9f:3b78:e878:2262) by
	MWHPR04MB0513.namprd04.prod.outlook.com (10.173.49.14) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.345.14; Wed, 27 Dec 2017 21:46:56 +0000
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: akuster808 <akuster808@gmail.com>,
	openembedded-devel@lists.openembedded.org
In-Reply-To: <bf6b42e5-d4d5-e483-d71d-7eda025db44e@gmail.com>
References: <20171218140110.1395-1-adrian.ratiu@ni.com>
	<20171218140110.1395-2-adrian.ratiu@ni.com>
	<bf6b42e5-d4d5-e483-d71d-7eda025db44e@gmail.com>
Date: Thu, 28 Dec 2017 01:46:39 +0200
Message-ID: <87o9mjwx7k.fsf@adirat.com>
MIME-Version: 1.0
X-Originating-IP: [2a02:2f0e:1d0:bcc:9f:3b78:e878:2262]
X-ClientProxiedBy: AM5PR0502CA0008.eurprd05.prod.outlook.com (10.175.37.146)
	To MWHPR04MB0513.namprd04.prod.outlook.com (10.173.49.14)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7f7720cc-169a-4d1f-f55c-08d54d735a3d
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(5600026)(4604075)(2017052603307)(7153060);
	SRVR:MWHPR04MB0513; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR04MB0513;
	3:8bddj2D1LbDMuvd6SLLKtAI034nMQTMRZz5pdqlxu+UJiPRvpR+U5+BNam5XIRhJDNeMrrSyeBkbji3FiqEcplS6/2fSm4GawsLSFkzdywdRvOEa8ZcMIPd+ki0PGdqFuo18+NKCzuelWxYeadrVS8XMAr97Aumgei+9kmsNh906dn43P/DCqmGpf12SLhc0G2tGp09xvLZUW7IRVuXIuEqlM9Cg52mZ16gWbKa4jTCNmDmKZSQ4G4xHW7ZB8V4p;
	25:bbJcNgSB/xxkcwMCIEAfCCYN0LWnyMu8JC1OGm3fJ4Kd44hqpJP+JBRvaQGl/BKhG19BELxhMiVdNJCLdl6zkT57RFIme7aCBDeNYKiSujeivwfKmzQAD9Ye5RGubG8lkhDzAXQ3Q7ct56C9vg+bmt0VjhOHAA0To+Uj36RpA007YKH4h/4HPBpmGpluKN+MH5gQz6ycXHHZ1BgnEwdIhPjiUQAqUahKXKzz/ffkiF8gdsLhA7l6H9Ar5rhUL2vrmKhHkaJz6+ImQ3E4nuS1KU8Ewi0jjXaVh6XtAD89gj/hAUuF6VbQjsmOfuye5SHNTA57ZXEZMX1mHmOoP/4Y+Q==;
	31:c6UIQzEpH281gkQiaBD4nxfi3HcvUhu4/mTms9MDvy97gOlG5aexLUWGZr8U8+dThMvOYLbuhgBjrfD7z6234zYbWKe2it/3Jm/Pw08UwARRcJV0Q2mPE3WKw/c6WvWN3kPAdBj32zWhN+8qm5+fq8W5ql2WmuyvLR49Sj+3NtrbZjcMPLHUAz5qJUxYVSDJU5qMlH/1ojx7dwPyo71KNIwqIBZQnryF39GY0S+KRm0=
X-MS-TrafficTypeDiagnostic: MWHPR04MB0513:
X-Microsoft-Exchange-Diagnostics: 1; MWHPR04MB0513;
	20:oSkSO4OGYH0rTgpSRRptlK796TwP+8T0nABpAvtMzNCDRfvKC2QYLxyGfhlIVpLR3hSAZdO1Glhbdqv7u9q16IiCTJ7dYnJjKFvMQ/sha2yWNMT7YAt+67JP36PD9I0pVUwbv6BgJOzE32wEA0tUzv4zERb9lN5YoML8p9tjaNfwc19+ZSoNn90Jw4Dbt1IivDxGnruh24oBk4+rxBdTY5quZr60SZNzOYf6PMF2a42VwUO82jyhvTPEE2nt6gJGBd3p93U9+DP+APXKKXupVEuZwdCeceklDk5GGnHl5qJiBne92dZbykoSq/I39q4jMxOD+AUf1Lr72N9deRPcjCXi2c6zc7SS72hcaTnermAtuHGz807WqCC/PRNZFPAVkVR2LL5mEINEM6hH/hg+jpGlklR5AZsqEkZjUSb0KiLb6Pnn6QjK2/uu2rALYpq4oyy2VrlEPjh8R4MFwSErJzDd1YryaxxThIELuWp0jUt85eqqHq8VbRdINjsS5u8YZh2j9Pp/ImVt6eu3dnJ/XJqUim7iaWJVcC5UdLV6uVWlmcbh1Q9NmNiAw3OhGoICN0DHjkMX6qhVP6ubK3TZXlNVYSAb75PmTgkVJAHBUbM=
X-Microsoft-Antispam-PRVS: <MWHPR04MB05139D2BA50ED07B6C33E9F0F6070@MWHPR04MB0513.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(10436049006162)(145744241990776);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040470)(2401047)(5005006)(8121501046)(3002001)(10201501046)(93006095)(93001095)(3231023)(944501075)(6041268)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123558120)(20161123564045)(20161123562045)(6072148)(201708071742011);
	SRVR:MWHPR04MB0513; BCL:0; PCL:0;
	RULEID:(100000803101)(100110400095); SRVR:MWHPR04MB0513; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR04MB0513;
	4:7IU3JxQn+63Sd8TffpLp9q+/3bxwu/xyw+ff3VHwwUQjKx3zgsv74Fbi0n39ZpRcmw3cwCpH6XsyKq7aJFqyjBobGy2SLBOKYXd7a/eaFg5Waj24gJ5+vXvMb2c+AMMoekMCHz4v7NKZSLkJlencCcEnndNtIv/FxPKLwgUCJiP24iof9jx/GSOCHAtgxUV7ndGA5e4XtLaYZsCFEaa/CGDj5qlD5CHkOJd3wENUG0GlRJYt5LsfpXuQnVRjIRz0YTy4XLML7ZIF7Ielw19ovCiV2togm7RShhHdkJQT+a3Rqqy1hNuYiD8ADopS+sdsdhYc4bEEYL6jsQ40QRSZL15c+tf/Ip8rVq4PZDnqY5w=
X-Forefront-PRVS: 0534947130
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(39380400002)(39860400002)(346002)(376002)(396003)(366004)(377424004)(252514010)(5423002)(189003)(199004)(24454002)(6666003)(106356001)(105586002)(229853002)(52116002)(39060400002)(6486002)(76176011)(8936002)(52396003)(6496006)(8746002)(51416003)(68736007)(47776003)(575784001)(305945005)(316002)(386003)(48376002)(97736004)(59450400001)(53546011)(86362001)(33896004)(81156014)(50466002)(6116002)(6306002)(8676002)(81166006)(7736002)(53936002)(2950100002)(36756003)(6246003)(5660300001)(9686003)(2906002)(478600001)(25786009)(19627235001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0513; H:adiPC; FPR:;
	SPF:None; PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: ni.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; MWHPR04MB0513;
	23:+3UvbC1mwwab4Y8L6fOnJer7MperYUSIVCPh51CDZ?=
	=?us-ascii?Q?Tpa+pAYDLG8dCDGlCY79+dUpdpk+SBWT03dh0ZlKr1S8t/yItn8jBTV4Oq+z?=
	=?us-ascii?Q?IsXM8eiccrhcAzDxAH3wXvjnUGh7Sq6IKHEPPPOhUDxTMszY9qYZre5U2+Ny?=
	=?us-ascii?Q?F33dy9n9orSQmBeZFrCT4PHdqX6EH+YFjKy3Q1atqRIv5PQU0fV22B1NF+gO?=
	=?us-ascii?Q?mOyiYRlgTbyWCv7VAVKr4NZT918rynxiNShGr1YlDA7UPyDsB4oI7WKWgq2G?=
	=?us-ascii?Q?OfmvM5OsVgZ4VYJYRdyMyKymV1hQjDMkI2pCBfOM+X6PfRPqpaXInQXGUt59?=
	=?us-ascii?Q?S+K7hFiX9eae2zqZIPb8xgK8f3sndx/vsL8JPfZn+LzPJaeP1iH2RsKOFaAV?=
	=?us-ascii?Q?3yhZ23t6K94qS2YtgCvQjme2+XMpHQVv13TDqMlv5uMecUpIfC+/QoafwaSD?=
	=?us-ascii?Q?kcWfJlqS/u4ABDF45sjVJfjFxKLHY3W1YrXnHbVYIeMtmFkgw5zgP1StJNmg?=
	=?us-ascii?Q?FTOcfS3kvI0SHgKpfvKNfReAtFb0d+wIJbuV7b21Aq7lRMd5divuj2RxCRSz?=
	=?us-ascii?Q?0DalozxW3gFd0YCLo7+jqc8Azx5Wx4n6rVkK/SU8z5gXb9EmDzppRHzNSABT?=
	=?us-ascii?Q?7yNh1cOFzJsc2E8GN91AlIr6sNusz19eFFcigsgZ3BH8Dx36w4LBFNgdEnLD?=
	=?us-ascii?Q?yJ8HbKcyQ6oWJDoOmVROvW7I1Vg2ILr4zUzxwBj2I4XcEsOGo5Cek/PZix2w?=
	=?us-ascii?Q?DFDJ7FBs6eUPZ8aIBJoP8iJgPjvMfR8HFIlowkbwlq6WSv0M75A4iqfrPx6a?=
	=?us-ascii?Q?9nRCDxPXxbHbVp8ofPHPD8eu2grcBCp7cJcgpl2h0wXD0p+twKKCzp/GeM02?=
	=?us-ascii?Q?e5qIk7qofHWp5V1jt5U1k9tT177BXT36tDU25al/U/y5rfUcTsyJKx0WeZm1?=
	=?us-ascii?Q?W02RC2x8gzNO3HUtRm9/VMYLlYUU3Pyq1ciZN5SxKXJuYo2QOZe+SpASWcB2?=
	=?us-ascii?Q?0xmPY7TTzCscKcHIXNs8RZUXlb/eGqN6vbEuKfFr+LCut8/W4WRMBwPQlJPA?=
	=?us-ascii?Q?1qOIzuLBjK3gniLpgAR78FjbyxzHkR9BL/KODK9Bo+YJwOuJ1FIFPxKouVel?=
	=?us-ascii?Q?HQNgGz/wnAfzUC66T2cOF4cx4/No1+OlImVs1EotrYcUbth3gNimq+nuxoX5?=
	=?us-ascii?Q?Bbubqdw7suTMfKiZRS6skMGHDWFz5AC1uOUG9cRS5TU4sg8yq9QVHoi8Rtrk?=
	=?us-ascii?Q?kAjqqKZscYqKO2lBF2vSnyN/NqmZkwZn0kDmr9r?=
X-Microsoft-Exchange-Diagnostics: 1; MWHPR04MB0513;
	6:bhdI467Pys51BvghTnyTIVIRas6zILEFq/ztL1KA0U3y5NW6q8MkLNHJs9tqbxP4wadGjI+BW3V7lWOs89meTmkHOCbY/loxrC2p4i1YHMY0dA1lPOI2xt5I5bMNV8kVLq34Zd5e39VF2zm6EcyQWHyf8hgmSImZo/GhQIaHjv4Hn46fg4gzbHKoOSA+Ufi67TwvtCDKa6IbtIUHO7TYmZqPt2mFu2Q+M8lvz+Db9Ihp0+5PVJyzt326lALoScqoV67Mb9deqES8eXYpeuGANRU30UdKkTNgAypTgaquKp44C1hgzeBO186PrsESU2e9w1FFRxGlOxtb58YJr7gf7gBOTAv6vkBj4vuViGdjFio=;
	5:RFN8rqZOlD+TEQhsiHlnzv6eRrJQyyUmia5cXCcTvFD3QzyMBMj0m+xAchvJsP5yiGRSOheERrIDMwQfSsU+pgwnZjsgMOZx/Ur7V/VFQ19iy+G2Uivf9ZZmGxDKsr6XtOOko+tw6H2s0f8sKBuZO5tPAaUxXTbC0fRweBPUaKI=;
	24:hg0BIgBb9UNoy2+r7MgmX0Sq6axrM3aovpfX0nYjWN4fgXqIPQW0wXYlAodX4u7KoXkk0l1d/gugrD9jVE/tGZBGAM+TWpnFyD06T22fccg=;
	7:PekAxcJdM4EQBKQULXrMCkpg3M1Lbu1ltRGQFWfxFObBfIvD6jiklaXpmDV+2eDISBEPQIh3KVxoVGjXwWkrd1Dn+e7AA4oLZeywZYtl7zppttyyaXzae7a9bh9NLkUx4pQ0WAz7MidqfrtAR+UqLsXFmbasPER7PliwOfaklhSOuGSUC5U+GV9VdoCiWpy/nMidifOLQHACnuMz/mFAPUk4EL7qFLBM4mHIHANed4pIBN2mD41iNeRN0FTfSSlV
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2017 21:46:56.5099 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f7720cc-169a-4d1f-f55c-08d54d735a3d
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0513
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2017-12-27_15:, , signatures=0
X-Proofpoint-Spam-Details: rule=inbound_policy_notspam policy=inbound_policy
	score=30
	priorityscore=1501 malwarescore=0 suspectscore=2 phishscore=0
	bulkscore=0
	spamscore=0 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=30 reason=mlx
	scancount=1 engine=8.0.1-1711220000 definitions=main-1712270305
Subject: Re: [meta-oe][PATCH 2/2] iperf: rename to iperf2 and bump 2.0.5 -> 2.0.10
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Dec 2017 22:13:13 -0000
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Tue, 26 Dec 2017, akuster808 <akuster808@gmail.com> wrote:
> On 12/18/2017 06:01 AM, Ioan-Adrian Ratiu wrote:
>> Both iperf2 and iperf3 are actively maintained projects. iperf2 was
>> forked from the old iperf codebase because iperf3 is an incompatible
>> and as of yet incomplete rewrite from scratch.
>>
>> Rename the old iperf to ipref2 to avoid ambiguity. Drop all 3 patches
>> we were carrying because they got merged upstream.
>
> I am seeing these error on arm.

I have a patch for these errors pending in OE-core. It removes a
hardcoded value for sizeof(bool) which triggers this error on ARM, so
ideally the oe-core fix should be pulled before these patches.

>
> | In file included from ../../iperf-2.0.10/compat/string.c:54:0:
> | ../../iperf-2.0.10/include/util.h:73:1: error: unknown type name 'bool'=
; did you mean '_Bool'?
> |  bool setsock_blocking(int fd, bool blocking);
> |  ^~~~
> |  _Bool
> | ../../iperf-2.0.10/include/util.h:73:31: error: unknown type name 'bool=
'; did you mean '_Bool'?
> |  bool setsock_blocking(int fd, bool blocking);
> |                                ^~~~
> |                                _Bool
> | In file included from ../../iperf-2.0.10/compat/delay.c:55:0:
> | ../../iperf-2.0.10/include/util.h:73:1: error: unknown type name 'bool'=
; did you mean '_Bool'?
> |  bool setsock_blocking(int fd, bool blocking);
> |  ^~~~
> |  _Bool
> | ../../iperf-2.0.10/include/util.h:73:31: error: unknown type name 'bool=
'; did you mean '_Bool'?
> |  bool setsock_blocking(int fd, bool blocking);
>
>
> Could the removed patch:  0002-fix-bool-size-m4.patch be needed?

Nope. We just need to arm site file path in oe-core.

>
> - armin
>
>>
>> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
>> ---
>>  .../iperf-2.0.5/0001-fix-out-of-tree-config.patch  | 52 ---------------=
-------
>>  .../iperf/iperf-2.0.5/0002-fix-bool-size-m4.patch  | 16 -------
>>  .../iperf/iperf-2.0.5/iperf-2.0.5_ManPage.patch    |  8 ----
>>  meta-oe/recipes-benchmark/iperf/iperf_2.0.5.bb     | 23 ----------
>>  meta-oe/recipes-benchmark/iperf2/iperf2_2.0.10.bb  | 19 ++++++++
>>  5 files changed, 19 insertions(+), 99 deletions(-)
>>  delete mode 100644 meta-oe/recipes-benchmark/iperf/iperf-2.0.5/0001-fix=
-out-of-tree-config.patch
>>  delete mode 100644 meta-oe/recipes-benchmark/iperf/iperf-2.0.5/0002-fix=
-bool-size-m4.patch
>>  delete mode 100755 meta-oe/recipes-benchmark/iperf/iperf-2.0.5/iperf-2.=
0.5_ManPage.patch
>>  delete mode 100644 meta-oe/recipes-benchmark/iperf/iperf_2.0.5.bb
>>  create mode 100644 meta-oe/recipes-benchmark/iperf2/iperf2_2.0.10.bb
>>
>> diff --git a/meta-oe/recipes-benchmark/iperf/iperf-2.0.5/0001-fix-out-of=
-tree-config.patch b/meta-oe/recipes-benchmark/iperf/iperf-2.0.5/0001-fix-o=
ut-of-tree-config.patch
>> deleted file mode 100644
>> index e8a029790..000000000
>> --- a/meta-oe/recipes-benchmark/iperf/iperf-2.0.5/0001-fix-out-of-tree-c=
onfig.patch
>> +++ /dev/null
>> @@ -1,52 +0,0 @@
>> -iperf: fix out of tree configuration
>> -
>> -The configure step uses a package header to check for support of types/=
declares,
>> -this package header encapsulates all the required system header for pro=
viding
>> -the needed resources. When configured from an out of tree directory the=
 package
>> -header is not found due to the hard path.
>> -We now make the path for package header relative to our 'srcdir' so it =
is
>> -found appropriately.
>> -
>> -Signed-off-by: Awais Belal <awais_belal@mentor.com>
>> ----
>> -diff --git a/configure.ac b/configure.ac
>> -index 2b3fd20..d420f9e 100644
>> ---- a/configure.ac
>> -+++ b/configure.ac
>> -@@ -176,8 +176,8 @@ dnl Check for system services
>> -
>> - dnl check for multicast
>> - if test "$ac_cv_multicast" !=3D no; then
>> --  AC_CHECK_TYPES(struct ip_mreq,,,[#include "compat/headers_slim.h"])
>> --  AC_CHECK_DECLS(IP_ADD_MEMBERSHIP,,,[#include "compat/headers_slim.h"=
])
>> -+  AC_CHECK_TYPES(struct ip_mreq,,,[#include "${srcdir}/compat/headers_=
slim.h"])
>> -+  AC_CHECK_DECLS(IP_ADD_MEMBERSHIP,,,[#include "${srcdir}/compat/heade=
rs_slim.h"])
>> -   AC_MSG_CHECKING(for multicast support)
>> -   ac_cv_multicast=3Dno
>> -   if test "$ac_cv_have_decl_IP_ADD_MEMBERSHIP" =3D yes; then
>> -@@ -193,9 +193,9 @@ fi
>> -
>> - dnl check for IPv6
>> - if test "$ac_cv_have_ipv6" !=3D no; then
>> --  AC_CHECK_TYPES(struct sockaddr_storage,,,[#include "compat/headers_s=
lim.h"])
>> --  AC_CHECK_TYPES(struct sockaddr_in6,,,[#include "compat/headers_slim.=
h"])
>> --  AC_CHECK_DECLS(AF_INET6,,,[#include "compat/headers_slim.h"])
>> -+  AC_CHECK_TYPES(struct sockaddr_storage,,,[#include "${srcdir}/compat=
/headers_slim.h"])
>> -+  AC_CHECK_TYPES(struct sockaddr_in6,,,[#include "${srcdir}/compat/hea=
ders_slim.h"])
>> -+  AC_CHECK_DECLS(AF_INET6,,,[#include "${srcdir}/compat/headers_slim.h=
"])
>> -   AC_MSG_CHECKING(for IPv6 headers and structures)
>> -   ac_cv_have_ipv6=3Dno
>> -   if test "$ac_cv_type_struct_sockaddr_storage" =3D yes; then
>> -@@ -211,9 +211,9 @@ fi
>> -
>> - if test "$ac_cv_have_ipv6" =3D yes; then
>> -   if test "$ac_cv_multicast" =3D yes; then
>> --    AC_CHECK_TYPES(struct ipv6_mreq,,,[#include "compat/headers_slim.h=
"])
>> --    AC_CHECK_DECLS(IPV6_ADD_MEMBERSHIP,,,[#include "compat/headers_sli=
m.h"])
>> --    AC_CHECK_DECLS(IPV6_MULTICAST_HOPS,,,[#include "compat/headers_sli=
m.h"])
>> -+    AC_CHECK_TYPES(struct ipv6_mreq,,,[#include "${srcdir}/compat/head=
ers_slim.h"])
>> -+    AC_CHECK_DECLS(IPV6_ADD_MEMBERSHIP,,,[#include "${srcdir}/compat/h=
eaders_slim.h"])
>> -+    AC_CHECK_DECLS(IPV6_MULTICAST_HOPS,,,[#include "${srcdir}/compat/h=
eaders_slim.h"])
>> -     AC_MSG_CHECKING(for IPv6 multicast support)
>> -     ac_cv_have_ipv6_multicast=3Dno
>> -     if test "$ac_cv_type_struct_ipv6_mreq" =3D yes; then
>> diff --git a/meta-oe/recipes-benchmark/iperf/iperf-2.0.5/0002-fix-bool-s=
ize-m4.patch b/meta-oe/recipes-benchmark/iperf/iperf-2.0.5/0002-fix-bool-si=
ze-m4.patch
>> deleted file mode 100644
>> index 348e316ce..000000000
>> --- a/meta-oe/recipes-benchmark/iperf/iperf-2.0.5/0002-fix-bool-size-m4.=
patch
>> +++ /dev/null
>> @@ -1,16 +0,0 @@
>> ---- iperf-2.0.5/m4/dast.m4.orig     2016-06-15 11:42:03.945581785 -0400
>> -+++ iperf-2.0.5/m4/dast.m4  2016-06-15 11:42:11.053581641 -0400
>> -@@ -11,7 +11,12 @@
>> -
>> - AC_DEFUN(DAST_CHECK_BOOL, [
>> -
>> --AC_CHECK_SIZEOF(bool)
>> -+if test "$ac_cv_header_stdbool_h" =3D yes; then
>> -+  AC_CHECK_SIZEOF(bool,,[#include <stdbool.h>])
>> -+else
>> -+    AC_CHECK_SIZEOF(bool)
>> -+fi
>> -+
>> - if test "$ac_cv_sizeof_bool" =3D 0 ; then
>> -   AC_DEFINE(bool, int)
>> - fi
>> diff --git a/meta-oe/recipes-benchmark/iperf/iperf-2.0.5/iperf-2.0.5_Man=
Page.patch b/meta-oe/recipes-benchmark/iperf/iperf-2.0.5/iperf-2.0.5_ManPag=
e.patch
>> deleted file mode 100755
>> index 12e8f4631..000000000
>> --- a/meta-oe/recipes-benchmark/iperf/iperf-2.0.5/iperf-2.0.5_ManPage.pa=
tch
>> +++ /dev/null
>> @@ -1,8 +0,0 @@
>> -diff --git iperf-2.0.5/man/Makefile.am iperf-2.0.5/man/Makefile.am
>> - index ed97bc6..728873f 100644
>> ---- iperf-2.0.5/man/Makefile.am
>> -+++ iperf-2.0.5/man/Makefile.am
>> -@@ -1,2 +1 @@
>> --man_MANS =3D iperf.1
>> --dist_man_MANS =3D $(man_MANS)
>> -+dist_man_MANS =3D iperf.1
>> diff --git a/meta-oe/recipes-benchmark/iperf/iperf_2.0.5.bb b/meta-oe/re=
cipes-benchmark/iperf/iperf_2.0.5.bb
>> deleted file mode 100644
>> index 9981d8275..000000000
>> --- a/meta-oe/recipes-benchmark/iperf/iperf_2.0.5.bb
>> +++ /dev/null
>> @@ -1,23 +0,0 @@
>> -DESCRIPTION =3D "Iperf is a tool to measure maximum TCP bandwidth, allo=
wing the tuning of various parameters and UDP characteristics"
>> -HOMEPAGE =3D "https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__das=
t.nlanr.net_Projects_Iperf_&d=3DDwICaQ&c=3DI_0YwoKy7z5LMTVdyO6YCiE2uzI1jjZZ=
uIPelcSjixA&r=3Dfzwh7IUt7VYYiD6094geII0kSDP3DkEnN0B8zB62AxE&m=3D50XFeLkyJYP=
BWjDGGzP76L5zyicMgYI3oFnzHMmJMyc&s=3DHHOEfIX6EP4CjawtZdH5r5C-_Jy4GNhDSmti1U=
Gdq20&e=3D"
>> -SECTION =3D "console/network"
>> -LICENSE =3D "BSD-2-Clause"
>> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3De8478eae9f479e39bc3497519336=
0298"
>> -
>> -SRC_URI =3D " ${SOURCEFORGE_MIRROR}/iperf/${BP}.tar.gz \
>> -            file://iperf-2.0.5_ManPage.patch \
>> -            file://0001-fix-out-of-tree-config.patch \
>> -            file://0002-fix-bool-size-m4.patch \
>> -          "
>> -
>> -SRC_URI[md5sum] =3D "44b5536b67719f4250faed632a3cd016"
>> -SRC_URI[sha256sum] =3D "636b4eff0431cea80667ea85a67ce4c68698760a9837e1e=
9d13096d20362265b"
>> -
>> -S =3D "${WORKDIR}/${BP}"
>> -
>> -inherit autotools pkgconfig
>> -
>> -EXTRA_OECONF =3D "--exec-prefix=3D${STAGING_DIR_HOST}${layout_exec_pref=
ix}"
>> -
>> -PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'i=
pv6', '', d)}"
>> -PACKAGECONFIG[ipv6] =3D "--enable-ipv6,--disable-ipv6,"
>> diff --git a/meta-oe/recipes-benchmark/iperf2/iperf2_2.0.10.bb b/meta-oe=
/recipes-benchmark/iperf2/iperf2_2.0.10.bb
>> new file mode 100644
>> index 000000000..1322d0788
>> --- /dev/null
>> +++ b/meta-oe/recipes-benchmark/iperf2/iperf2_2.0.10.bb
>> @@ -0,0 +1,19 @@
>> +DESCRIPTION =3D "Iperf is a tool to measure maximum TCP bandwidth, allo=
wing the tuning of various parameters and UDP characteristics"
>> +HOMEPAGE =3D "https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__so=
urceforge.net_projects_iperf2_&d=3DDwICaQ&c=3DI_0YwoKy7z5LMTVdyO6YCiE2uzI1j=
jZZuIPelcSjixA&r=3Dfzwh7IUt7VYYiD6094geII0kSDP3DkEnN0B8zB62AxE&m=3D50XFeLky=
JYPBWjDGGzP76L5zyicMgYI3oFnzHMmJMyc&s=3DXRq46sNKPefK1TwfB1sv_G5f4uOy3757qzs=
YT0eEr8g&e=3D"
>> +SECTION =3D "console/network"
>> +LICENSE =3D "BSD-2-Clause"
>> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3De136a7b2560d80bcbf0d9b3e1356=
ecff"
>> +
>> +SRC_URI =3D " ${SOURCEFORGE_MIRROR}/iperf2/iperf-${PV}.tar.gz"
>> +
>> +SRC_URI[md5sum] =3D "097cf0754bc1afa165975c06a91e6906"
>> +SRC_URI[sha256sum] =3D "7fe4348dcca313b74e0aa9c34a8ccd713b84a5615b8578f=
4aa94cedce9891ef2"
>> +
>> +S =3D "${WORKDIR}/iperf-${PV}"
>> +
>> +inherit autotools pkgconfig
>> +
>> +EXTRA_OECONF =3D "--exec-prefix=3D${STAGING_DIR_HOST}${layout_exec_pref=
ix}"
>> +
>> +PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'i=
pv6', '', d)}"
>> +PACKAGECONFIG[ipv6] =3D "--enable-ipv6,--disable-ipv6,"
National Instruments Romania S.R.L.
------------------------------------------------------
B-dul 21 Decembrie 1989, nr. 77, A2
Cluj-Napoca 400604, Romania
C.I.F.: RO17961616 | O.R.C.: J12/3337/2005
Telefon: +40 264 406428 | Fax: +40 264 406429
E-mail: office.cluj@ni.com
Web: romania.ni.com

Vanzari si suport tehnic:
Telefon gratuit : 0800 070071
E-mail vanzari: ni.romania@ni.com
E-mail suport tehnic: techsupport@ni.com

