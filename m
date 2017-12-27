Return-Path: <adrian.ratiu@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id 07883605C3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Dec 2017 21:48:25 +0000 (UTC)
Received: from pps.filterd (m0098780.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
	vBRLiAVN018982; Wed, 27 Dec 2017 15:48:25 -0600
Received: from nam02-bl2-obe.outbound.protection.outlook.com
	(mail-bl2nam02lp0086.outbound.protection.outlook.com [207.46.163.86])
	by mx0a-00010702.pphosted.com with ESMTP id 2f1nhwa18b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Wed, 27 Dec 2017 15:48:25 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nio365.onmicrosoft.com; s=selector1-ni-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=T1Uw60gfaLMfrTP+xwemLvZ3jp/wtMjJIsm82PUk+do=;
	b=FATQbyydQr+bkTUybs43WwGkO/eYu+5a/P1/7GVKrEA0NJcZqrLd7WJw/ppGcK51WK71aBrmTdXNP/CiBvPs/lSjYYM7/UOmPJVYSF37DGNIPGUh4dZjSLxV71rGsn1DIOHxVhyhjhCYnR+KkvpOXzKUdldrujx4MRqpm5y6nCA=
Received: from adiPC (2a02:2f0e:1d0:bcc:9f:3b78:e878:2262) by
	MWHPR04MB0513.namprd04.prod.outlook.com (10.173.49.14) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.345.14; Wed, 27 Dec 2017 21:48:22 +0000
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: akuster808 <akuster808@gmail.com>,
	openembedded-devel@lists.openembedded.org
In-Reply-To: <bf6b42e5-d4d5-e483-d71d-7eda025db44e@gmail.com>
References: <20171218140110.1395-1-adrian.ratiu@ni.com>
	<20171218140110.1395-2-adrian.ratiu@ni.com>
	<bf6b42e5-d4d5-e483-d71d-7eda025db44e@gmail.com>
Date: Thu, 28 Dec 2017 01:48:03 +0200
Message-ID: <87lghnwx58.fsf@ni.com>
MIME-Version: 1.0
X-Originating-IP: [2a02:2f0e:1d0:bcc:9f:3b78:e878:2262]
X-ClientProxiedBy: HE1PR0202CA0004.eurprd02.prod.outlook.com (10.168.182.14)
	To MWHPR04MB0513.namprd04.prod.outlook.com (10.173.49.14)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d85964f1-6319-48fb-15d8-08d54d738d70
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(5600026)(4604075)(2017052603307)(7153060);
	SRVR:MWHPR04MB0513; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR04MB0513;
	3:n98WWehkcxydTYRXxWSe0/QarMv4T034ZNXVkJ5PVNPbp7RzLcqaDnuUb6OIAuxWqG+DcdmwssECYSlKzMTBQUM7FcNjqfN7M6zQ8kWSWKBVr4CU1o5FYO5tddyrXtiVrKGr3FzkU6Ce7M1k1xgiOqJTMpaMlxf7gJtESN0Lb3ezrIwTGqXYR7likCz/9uKpZ2Ez8vC9ZyTcPTflkDLLuwhzlNHgxBSFvfRV4OiLDKKZyJMd4ppO4ppV5cv6o/OY;
	25:vk+Dk3KRqIJQm4cx8aFufDO16LfFI+vV8Rj514LzASMbrmD9MjAVCT+QjPBJNafpI+wOzPmVGQWXJW1F9faK2wlsaOMSUCc/78Usm3LwNtLaOwyDSkc6Jklfat30Ie4gqAAKcohZrzmdKrzC+5dtQz00SjujFmtka06hrDDIOvPSQZ5ebO4hKgqUDLhsLDVaB10Mla2AQDC4WUBDn/3uKLPMbjKooTSnetEv0Par1QgcdT9g4vrKLGt7+uJ+Ojjvskt2VsAPYEbVQHXVreweiwCAAjdHyl8YjAvCPh77gGOaV9s6EQMCs+J1o6tGypLP58K2oKAehMnqoQiJ/0V5+Q==;
	31:5mlAbbb48uvpT4e0BSoJBb3hMJUmngpY9RxzrAcwmWhykIt9fAVCGaoYmYdLqNyvgb9Y9IJIs8NBL2iMYqMUCH71n3s2bbth+kAZ/9JnVP9csBhsXMRVcTSeVakuAIIERnheNs5ycsgigjpwLq1q1U8GdHL4PVrTJb9z1HqkrKH7FPown/OKdgqURTyHY6k7OZTtQVajbdALxZ1Fik9wr6CSF9xOCEspt8UV5erGfJc=
X-MS-TrafficTypeDiagnostic: MWHPR04MB0513:
X-Microsoft-Exchange-Diagnostics: 1; MWHPR04MB0513;
	20:6s+vMJNhyzeAM4myTDsg+VmNDXdQ6iGyBfDECFizkvNlJk8F8K20IQAuHj5ZZZz2Y05WsKiZe6zRzq9gAlAWdOgtzpBwhxx6VZJjoazqk/5pw0emLpE/xvq3JlTxYPQtoMuCydHwC5nGFvyIBF1B7Qsw2dArfUQqsjdrgN/aFMAqKMKCpPw9CwYvWtnRwxbrocf2F363Rs4S/51CmcZ0G1jMc3omCmUd3PTdKECG43E69C0DJyB+r1MbdCVCLH79c/lw9x5ZVrp86wf97r8MwuR1EGHLKilJLLKgBGRBNPPY/Cea+9L5RzNEt3WzxqpgVRWdaf0tLME0uHCOeNCIus7hLeTlVKzSip/xkjj91QM9HAjmb2Q8bFliEGvHBex8Y+M98iSRZpkd/vbAkZnSPKncNJhtPJIhDPBr2mV1eO+wJ4grDBomenmX1E51mEXDDi6U68pX/RfepQQlEhUGaQMNdsiP910lyD1zBYe5wZH2vDlacisOT0Auf8hQm0eA3UGqRO6TxjumRYdgl3Mk2Zrqq31WEjcXtbDL8FVypC9kEn8JEgMZP8TGwnDr1N05fTKjRRmWxakQYxUs6KWNyWAaviSjzEFYQRpnRci5fjE=
X-Microsoft-Antispam-PRVS: <MWHPR04MB0513E4960B7B50487B0A1638F6070@MWHPR04MB0513.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(10436049006162)(264703809997249)(145744241990776); 
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040470)(2401047)(5005006)(8121501046)(3002001)(10201501046)(93006095)(93001095)(3231023)(944501075)(6041268)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123558120)(20161123564045)(20161123562045)(6072148)(201708071742011);
	SRVR:MWHPR04MB0513; BCL:0; PCL:0;
	RULEID:(100000803101)(100110400095); SRVR:MWHPR04MB0513; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR04MB0513;
	4:r5DOLLwegFOVkFrCHDpuzF6NeoJBW4WKL8F1UftRh3VH8BKv0vXhHX6M9eTg256y0uRm2QNfbqmDRSvIVhhnfRDFqXYLay3NO2hu1VLnyJxxuYXkdpPwRIN5fR5j6sUV7pgfLU57+hU/jXfoZCfMtB7dLKeHeJJFefV50ZuPAnFzC1tYxCTLpaK1YQSPHkdx47s+hn5PnnqwtLo/fxpfbz4svu/inAwpSWndxDHQjO1/HXb4+8qTJgLYwFkoWG5WdPJjrKoWb1Q6H7Ol7EGRBPgTQRMTBlazDK6R3H5fUElCVVIj9qkuXbHjjiOpeo6k2Vv79yuA70d8CK1si0YV6F3IqCDK03OqBYG82n6SKg7KwxEZnKoKTKA7jRt+qhYT
X-Forefront-PRVS: 0534947130
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(39380400002)(39860400002)(346002)(376002)(396003)(366004)(377424004)(252514010)(5423002)(189003)(199004)(24454002)(6666003)(106356001)(105586002)(229853002)(52116002)(39060400002)(6486002)(76176011)(8936002)(52396003)(6496006)(8746002)(51416003)(68736007)(47776003)(15188555004)(575784001)(305945005)(316002)(386003)(48376002)(97736004)(59450400001)(53546011)(86362001)(81156014)(50466002)(6116002)(6306002)(8676002)(81166006)(7736002)(53936002)(966005)(2950100002)(36756003)(6246003)(5660300001)(2906002)(478600001)(25786009)(19627235001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0513; H:adiPC; FPR:;
	SPF:None; PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: ni.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; MWHPR04MB0513;
	23:70JBuL0TeTCpoPaP2Zd4ez8PlSlujkTeQlgQH4gco?=
	=?us-ascii?Q?KnXZtyUceIeKw5mqRzACnw3OpyTbx7q+HTQ4EBfaX6IoUnlStuuVgWUfwaoa?=
	=?us-ascii?Q?xfQYLEo2py7+cJnQ1vPtYvnvfz8bB/dZukaX73hhBtFdsEsj7/oCB93tV+W5?=
	=?us-ascii?Q?xE1VL9jZIHUfIxvia/fIwfWFJNnSFIMFGTg++ThMPqZs3WvS+0tI0WUh/0mz?=
	=?us-ascii?Q?N83G4V2IsjG/FAQgfTFHi5DnEqKJw2lljiL4ZfOezwlKAADgB0fvhxSDo15D?=
	=?us-ascii?Q?PKDGtHd0fh5pkKgdEN29AfFDfURwo+lOgPWXZ2RcEmeLk/rJHkO+qkJyHjME?=
	=?us-ascii?Q?GeCW/1nFQRvm5lHX7tW5jb6KoXAoV6JRXQjohCAhd9mm1KzHPPEyWQDo8Mvo?=
	=?us-ascii?Q?Kr6tvj1uGCWte5pA66u2c8xgevHwzAoxzoGqtnYbDByEPGyAXK+Yi8cGupvU?=
	=?us-ascii?Q?lAEoBQSvStZughTgDPnmJoDl62l0CpPi5dDzlDkWPOO7kjJF+rwUUyFewVSx?=
	=?us-ascii?Q?XQOxUvBLG+gb/KPWHE7iKITFFeABUfWQMGTXCK5EXtpMjQVesZWZcwG+JTAW?=
	=?us-ascii?Q?R+GiIxUt7wgV53jAZUhgd5cPQIcGZvbXEKkf0vdMaVSKp/Ju8SPcVyyAox3f?=
	=?us-ascii?Q?iCzpLFJYmd2i0/c5X0uMgezzbeLT0t1Ib+QAfekOuY6DAQTDgv0IInJW2BPd?=
	=?us-ascii?Q?j312K1pOQ6/sjgAaaBHqiTR0DHfIhWd2zpr9/NV2bRzWbJ1M1S6b9ox+S4fR?=
	=?us-ascii?Q?R2OkZgtyuVKkVHs7z8yx5ZpnMn8KHbX6RQHDNZnKrcgVoOvy1YXiOxKuoyw1?=
	=?us-ascii?Q?vh/8zXgMOKsiIN3a3lMRBsyLhA7wQlSztwP2DI74Ke4Q8wgk8JnHDJ9V6PK+?=
	=?us-ascii?Q?79fx1UAxm1nG863UEfyaH7g2Yvfvy+FgJP7GuMoh18wUdXn5L4HcyRFfTCp9?=
	=?us-ascii?Q?uMiz+YwFZ80PHDEJ6tY9ZxNPIatJtFszW00H+zdDn1AzRZPfR87ceuj+HclK?=
	=?us-ascii?Q?j65L4VA0YSuLwOn1XGwT3010yyAHgPqT3Ersj0k6mr0OQUvddGy6mYiMIdn4?=
	=?us-ascii?Q?JPIsUcTrXMmRC4w/FVQ7M0+ThNKFsT0LQm0ykggM5OFZsPAefPH4mqxlEdXO?=
	=?us-ascii?Q?4FrWJ9It58OhxyKwvgvShGO42WDK2ALhT7cpC794hr6M1NReZCSOTeahA8n6?=
	=?us-ascii?Q?xhbh6DYWOgzEo3jqjWELdzsilzg4ctivNITPsAI7ZWB1rVy0NAlaSAUE/RuY?=
	=?us-ascii?Q?Re3rixXeRbhSxO2nrJpm27PIkntbtHIspOQn2yO?=
X-Microsoft-Exchange-Diagnostics: 1; MWHPR04MB0513;
	6:+C9pKosDC44DDgRPyh2ShCjtCM7iPkh38PNLfUcljA/c9fFycsLs7VXzVFb0fjjM37/hkK9LCP2dXbRNXyYVidyV7w+deopu3BtsuX9jkfYenLBlDFtPnydorlUs4HaZUAgFHyNX55hcroiLc50uENywCTDkK4FgyhYSrUHU6uEC+cw7kWlelg3xCqPPPEunLdKDJFghTklTpBFWPK+ACMkRae0f9OG78WE5NeYcmWXbrhlJSB8wFBU3X36UZ+U5KADt1tNeRufyXELUoMW+55sn5Mm8UOjUw1iOzJFYIBYYua4WIM9QYgzBCSXjuk8yoE0LnK/2Ya2Vj4VQWmZPX8UG9K8FgwQsoEcQD7aOKnE=;
	5:wzweU5g4K9qzNLOaBEb5MwYzn4mA1O1XUrR0XvQL1LDsksHbYKObbpiGcCnAC89UP27xCn1m3lC31Kx+PvOqA2Uff95XamsnORPrN9j/QdkQmY5+3Yv/9S9Ygsrlcx0ULpe9RFwFoc5aPfBQw1hUt+ZLKIzH3bXwJ8mUc+fcgno=;
	24:REJiWEZKySF8pbCpG+JrobaUKIkvgGvisMmVcl+JfHZal4XLfvQlOH20d9r3cP4GqPGhhur7XjyZtsjJOHujBmPSQf0Xvzugv+GOJbk2xGg=;
	7:VHpvFK76vFyQ6U1o1kfnEPlaMLxtKXOGDrdD7cU98Wz7HMKUUS76UTTfcSgghF0w9W/xqTG+0OAO8a65ru+c+u+9Q5tot3vh0+guLWZ5l/X5Jxah+0f3fWxVPV0dUnNC1AiucrONLVA7XcNj/4EcNlZT81g+BpQvLRyNk7BOtLMMR0dXV3dM9+56GuKMdSZqD4TesJbk+xJ2N6cTMwW1NVZCDPdBAW3XDTosSMk5tziqtl6BUCUcMN/4yWCZ/God
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2017 21:48:22.1835 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d85964f1-6319-48fb-15d8-08d54d738d70
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0513
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2017-12-27_15:, , signatures=0
X-Proofpoint-Spam-Details: rule=inbound_policy_notspam policy=inbound_policy
	score=30
	priorityscore=1501 malwarescore=0 suspectscore=2 phishscore=0
	bulkscore=0
	spamscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
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
X-List-Received-Date: Wed, 27 Dec 2017 21:48:26 -0000
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Oh I forgot the link to the OE-core fix in my previous mail :)

http://lists.openembedded.org/pipermail/openembedded-core/2017-December/145=
741.html

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

