Return-Path: <prvs=877847af4e=adrian.ratiu@ni.com>
X-Greylist: delayed 609 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 28 Aug 2018 09:03:38 UTC
Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com
	[148.163.158.57])
	by mail.openembedded.org (Postfix) with ESMTP id 5435F76086
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Aug 2018 09:03:38 +0000 (UTC)
Received: from pps.filterd (m0098778.ppops.net [127.0.0.1])
	by mx0b-00010702.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
	w7S8k9Fi008929; Tue, 28 Aug 2018 03:53:29 -0500
Authentication-Results: ppops.net;
	dkim=pass header.d=nio365.onmicrosoft.com header.s=selector1-ni-com
Received: from nam02-sn1-obe.outbound.protection.outlook.com
	(mail-sn1nam02lp0021.outbound.protection.outlook.com [216.32.180.21])
	by mx0b-00010702.pphosted.com with ESMTP id 2m342vrcww-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Tue, 28 Aug 2018 03:53:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nio365.onmicrosoft.com; s=selector1-ni-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=f1Vw8KXhzHqLHMvYq17Dn8bfiOQmFehVx3RBIbn3hN8=;
	b=h5l+ohP34fplkcfXv7+CwoR8jZOXN7OZZ6E+1CiLXb5a+YSgX2vwZ1f5Nz+EJf5PQkq+kK5OBSMOV9o01tEWJtnWKQJk+hzp11S4d4W1FPzaILYAHmGvQBB4coKEhMMrosJj7/jvotFgLJVd/3rNsPPG7HhUNc4BXpwaQv9sEbs=
Received: from ionel-work (80.97.64.55) by
	MWHPR04MB0401.namprd04.prod.outlook.com (2603:10b6:300:70::18) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1080.14; Tue, 28 Aug 2018 08:53:25 +0000
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAMKF1sqNPEsJPsr7eQK40NW7-KHTO5iEq-Ph+S2dkktj72FfoQ@mail.gmail.com>
References: <20180827123338.7571-1-adrian.ratiu@ni.com>
	<20180827123338.7571-2-adrian.ratiu@ni.com>
	<CAMKF1sqNPEsJPsr7eQK40NW7-KHTO5iEq-Ph+S2dkktj72FfoQ@mail.gmail.com>
Date: Tue, 28 Aug 2018 11:54:57 +0300
Message-ID: <877ekauazi.fsf@ni.com>
MIME-Version: 1.0
X-Originating-IP: [80.97.64.55]
X-ClientProxiedBy: VI1PR08CA0121.eurprd08.prod.outlook.com
	(2603:10a6:800:d4::23) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cab12b58-1cb0-4843-20a7-08d60cc3b82f
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989137)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(5600074)(711020)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0401; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR04MB0401;
	3:HkFBLYMEA/woehuLOkFkPBm24DUFI80hSxc+4lWOmCdhBA9i3W+eDzG5ZIbl8MhUKGW6V4toThyda9pj42p71xfR2L9hGnOJjIxQ83+bQ2p8KfsGqTYExiiEdKVMpRh7uzidyE4qu/Qknx69J35tXnd8FYrhCwvwYarcoMtgpVPS0DNKZ4OU1GT7iaHrMP4WpYBwCGvoGFN3/GqqdNgJwf5iBGuXEdPbxSKWLz5kIu+kiG30QQYvd41neNwmTHVs;
	25:w7dAMCm29LCZtg3AsJw1NJha0OR0AuZhPDaobo2KIqdB7Tu2exV1KM3Jfxzm85cXtXeYwz0xKt6YClAwOUpTAXQLYhFEw5zLJu2m++kao/+gSGdTzmfPDVkjph2+fZOOYwo0fZcHXuBHINrx5p1b+QRaxcUNzJAHIdq2FhFVLIEeqSbZ6F9NcalmHPuK7I39UUvyRXJgPFDLvNV5ZKl/N4i8sA3PgHVHgldQ49f1WyjCmcDcCkliAH0W/e76xUxZDgj226N87i22H+XGbfnN9s0bJJk1W83Ui0PAqkJ8Gf0G6OtMVh0rib71O+EVX+khnZZ0jWij0pWleodNJKqrUw==;
	31:Fmk6kgjnh2UNjdw2C/IwOiVsLLGDY1rRl1Y2RqZP3EaHm2tcwOtqOCEQGlOMrG7mfSaSm8CxHP2qcey74rUbTrQbIydxiBzb3rbKg/x3xG2bGzxb/n204OHXlTUzMZ1dQzZgWSIbsOh3+a4KjhD5P7PyEut+Bzl1slNmNgWG+NTXUxzPrT2PDHBo8lKmBmCc7To/pxUcMSdLrknLO6HDlbvASLuJ1xFKmvkuCczgmOo=
X-MS-TrafficTypeDiagnostic: MWHPR04MB0401:
X-Microsoft-Exchange-Diagnostics: 1; MWHPR04MB0401;
	20:ZBrdqTrtQd7Hndp5q2ipEKAjK4KinwLtgfG2RqRpbcvbn4xRjUzg29fcqUiPXmqGTehzICZ0Z4nWZLPT/iwgC+QL1LavvDCGPVXUNzBWy+00oHuYuZT2aBZDUFEMBfVMhVSzSRcgb9I0qJfxx7MOiEBNsxeiJiDPV22TjtM/OmX/V6jLbSsYAv2W5a/Ib7CSYD9g9+35UFDdGf29wSGylE62zH7VFFZE1647l1QU8cdPotPdbkpWAI/nD5q3D4tMhtIO/3M/G+aOg4WjSFttOjt9MbNfSYKBFcL0VtRVezKgaBlrjuv6gyfFInTB2eBYib8bcfMQQ48cjZ6uQRUvEUbzRREuxysmNFF2qLoa3dIZ+JI41Jk2jJJbYHwgwuewxAgpz/M1ccJko9Vo9eZzgZe9PTjwbLF8+DjFR/6ajk2o9kscf520rOEhvuXTpaQQY1EE5tnn7+/sgDvhOUjIjMHUzl9aDb66BwVpA0tWlTsAErN3wQJiA0gIlt2YX4VSobHUWmYJOqDPXALO1yoVZ7AxVLFyelHtm/mlFF2EZdVdXPjNw4PbnwqnNcIN34In8z5LTKKEqxREq77PgT14U0N3332rvPIvZ+PDYF8wQmg=
X-Microsoft-Antispam-PRVS: <MWHPR04MB040159CC3A0EE63C9DFA5017F60A0@MWHPR04MB0401.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(10436049006162)(85827821059158)(264703809997249)(145744241990776);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3002001)(3231311)(944501410)(52105095)(93006095)(93001095)(10201501046)(149027)(150027)(6041310)(20161123562045)(20161123558120)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(201708071742011)(7699016);
	SRVR:MWHPR04MB0401; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB0401; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR04MB0401;
	4:XA6pdmw/TfHApO8QTe6/09fy/pX1rg7txyPBlH4EYwoENh96k0+A6PLiUPfglFAffud7QWFivIYIApskamqbQ11jTWDfnhNVTILQm0YsIZ4jnZ6NwKxBxze9DSVu4WRxBcacLDHWQcXy7YPsE/gJXEICKPM3LlBLlUHW0kEK2Wx7kOkaisabepLrTiKEIvvTqxfHBO1ISxFYfPR8B22cBn3Xd6gyPahOfGXfV6VeuBZxk4qnkRibwl708xiC7ztyiXH0+Bh8xGTQXjO/wB3PLfV+8KoLX8NW+lGNu+rlLRrX01SUepTcei587hHDSgCVtsomWKZwi964Tkr8KJr3Fru9LZk9lLJXWP/9urywLDiJ9WaG8DHoyUKV/qFJGo7IopZRwmXRQu/oFm04FPWBUvGJFGMKBbg1ioHMg+TTves=
X-Forefront-PRVS: 077884B8B5
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(39860400002)(136003)(366004)(396003)(376002)(346002)(199004)(189003)(446003)(76176011)(6916009)(2616005)(476003)(486006)(11346002)(386003)(5660300001)(39060400002)(229853002)(956004)(305945005)(16526019)(186003)(105586002)(6666003)(26005)(53546011)(106356001)(6246003)(81166006)(8936002)(2906002)(97736004)(3846002)(6116002)(8676002)(86362001)(478600001)(47776003)(68736007)(6306002)(66066001)(50466002)(16586007)(6496006)(48376002)(316002)(7736002)(6486002)(25786009)(4326008)(36756003)(966005)(51416003)(52116002)(575784001)(53936002)(81156014)(107986001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0401; H:ionel-work; FPR:;
	SPF:None; LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: ni.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; MWHPR04MB0401;
	23:TA6VKi/xJo11WbBsnM37zjgOniDkkI6ulcmZOV8n6?=
	=?us-ascii?Q?yYeZGhz7ryOQG3WeW6L9kvhiKME+/DbNv8oMbG2A0eho7sRWgQ55bRdDhksC?=
	=?us-ascii?Q?z0/082Zypmmzlt/Gu1H/WgYAEdP6R3LnLnKBcabAQgTxu2doNjHMnsExZkYw?=
	=?us-ascii?Q?pZktRrjApphumz5EPRImKWM4v40Fw/ayEGaSdxsQXJYpWwkRQ4i1eOSxzaQe?=
	=?us-ascii?Q?O8Ev2lWgKdGf0nXU/OEuVuOS800vHFqGFE5InVHVfJZi2h0QMJUVXKIuZSIt?=
	=?us-ascii?Q?iZXZNTHvkNvWqaqWfHuEgQxf285hMWflIQkiS5ofvNoEOyUymnfNsxlDmuNi?=
	=?us-ascii?Q?Q7PJ/b32yv9sQtA4slyXXRDGeEr2vEfUL6YxPx9Lvyin/1CaW1pXn/o9EVTn?=
	=?us-ascii?Q?mBZ7KLL1mwcDlcEDSqd9B2xiGhc6YUYHLT8vi6RqN5Srnh9hgj3Thee0kOSU?=
	=?us-ascii?Q?27l6oitlHCG7RYZ4zEz5RQmyajgaOXikpbO2MnclJ81uZo49M/bZZkkvgy3m?=
	=?us-ascii?Q?1sTX3usvfhdkcwkU/4U4OxjBGhkWbFAwQhCIEIqXkiq4O+FzPMkKK7ynmcGu?=
	=?us-ascii?Q?8gIaWyF6z5q2miAj9cCNO0Ji3eDq6JtpnSuFpsUISNLsYMAeYTfWr8uubZhX?=
	=?us-ascii?Q?QODyPRmSwfkAG1m7GfSRLaPAY4363kuk4zE+zbZi7r6YaJeBHTRqn23lcvrx?=
	=?us-ascii?Q?E6iPFZkTl/qsALBXi0rQiui7E2dZPvzxFPocP9Yte8ZfMAr7k4ZVlr0MFrJs?=
	=?us-ascii?Q?ky+00qe8ezasF3TsI5kb1daepE5IH7nFDm4TRw0ylg2YIbEPsGcUlF8ntO35?=
	=?us-ascii?Q?M/GvUq/pJ+e/CFDuwrL5O2NxpQs5abBRZOAe1VHMBytgS6rMu+AQ6YgQHvHG?=
	=?us-ascii?Q?nmdMDEYcmAJlUlVugSFwJRY+GOo9ormeIdignDewkacVOb+Qnl7256LB0YvS?=
	=?us-ascii?Q?imksX2x0o6u7FKaztxH8SOOMs/UzkvneMPIrxMXcNCjNCHBCr0aHpYItOMu1?=
	=?us-ascii?Q?QZekOEexbfGXt1z745HxXh7s9gglGXxE8Br3asafGLAYjuROKdupiHp4V4ht?=
	=?us-ascii?Q?crrm8E8WbOO/ymYsHa3wwt9P1f4J0WCw9xkodvq+eGoaqAA99aqyZHYXkMpU?=
	=?us-ascii?Q?Jmf/tXqTlO8NI8cw1CtaDnRCdX8C5UbaRHh+wAdZUXCkILkT1WmhlFiwjx3x?=
	=?us-ascii?Q?MRtFyrmSSnxILHMlvO/ai8Q6rOQWZkmOWlGJQVRxe0c3+Zm2rdyEZQTrwtPU?=
	=?us-ascii?Q?v/6MDjAwB8b9NaKI81aoSQRF3mV9PpyZAaWNKriocnlfsTnCMv56h3ANpJFU?=
	=?us-ascii?B?UT09?=
X-Microsoft-Antispam-Message-Info: uFOuY/OfJUBFAKTihoMscma1PkkMlwC4vUnnfs739+xZmEPdE5zxDKeuQfuRSWC/vAMPw32K40332tbCFreOP0ePghDiOaeoBfNC2rQSep7+K51MC006LK8GOobfWrYrYanlmu6pg+qy+XRum/8mndjGD6bR981KXH2mio60OCvL5jAq5Ld/HztcE8xSdLUUfwUeOiAs0+GoJBqomkiy3uabNLfsZtCec3GyJ7RPhfmkwObfQRs/XruJxmwadgIVyQvTEG44a0kS3svM7gugIq+3UPaEnbNRwBU3XTcJ98TeJVSt8ZTgC2yeFohNZoYq4Tleib8XIutgLTR9d7PAWsiawoOc5Zi3f0uJNP0K67Q=
X-Microsoft-Exchange-Diagnostics: 1; MWHPR04MB0401;
	6:5VYQoaBoY/XvKXOVTTP3aO6NAT8+0LBjBA90m9vh8Ai7uKtMGQqq1Ob00HFNi0w23NJYR9xpt4xuU5SUq3gcrqSJFHzKOxQ4NNEMzmQFPcE34fhK5niHZ0C52HdxlcJ37qErAVSd5Mof/0kXbY7fZej9xdOidFmP/ZPixPRYFv1qLt+FL45x7XRpSoVGyz3FAe3IpRYR7VAuRGpl9eQPk3uNV3WTKeJW8UJ7rh80ZRg2gaKDR6P0jM17EE5eUj9iUReSA8gZ/M+vpz/89vNuzEt7EQYXrAW/B3FmsuR0KHpn54ZUhv/pawxKsS8qh1yOCXW3t/rvfRjh7eglUSsi1qi6iZJ9Kuk6ThrRA/dYtcieiSsG0Ne1VNsFrRgTpnkL78IaLKOw3zweD6QrhJPoqBi2Np6YTmtdMlmt7w42yDf+ObpigLPZiDHj+PSZ96c0pJ+XJNcveOQQ/yV1QbKcAg==;
	5:XCEC8cPOpuTeQ+FTIrGj21phUWkctvAERZF933pD4yR+y6Z/Tvazssv/PEdtkDeYiKQz6k7awdIfLI1jUotp7wzsJEU3a26YXZLt3cCezFbpXfVXvH+Rnm5+XyaVLRgAqAiyElMcgG7kcDmT9TKPKfFufC7LM7JtfqKho2O6SAE=;
	7:r6Gjywp2FY/B5fNNw2wvUZaz2xm1xvcrDP0NdWPTnyNNCvRCQ96cEAwP08EawgyfEq4p3L9gxwN+rCge8Agud11jtNhviK3nlN4C5sR6F5dBmK4BQaBqw/XkYn3XUv2pVSDGU7BMQpxkUj5qjOhiFTL8k1p3RcS5cEQ0l1F9arwdJVy4NP+qdI5i3GulO90pXJPehto/8KjvN34YkWqlyjP8AQ0Bx2X7E9XNx2NcodouFymq6aqpGX42/Sjl08Tq
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2018 08:53:25.9474 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cab12b58-1cb0-4843-20a7-08d60cc3b82f
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0401
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2018-08-28_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=inbound_policy_notspam policy=inbound_policy
	score=30
	priorityscore=1501 malwarescore=0 suspectscore=2 phishscore=0
	bulkscore=0
	spamscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=30 reason=mlx
	scancount=1 engine=8.0.1-1807170000 definitions=main-1808280091
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH 2/3] python3-pytest-helpers-namespace: add recipe
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
X-List-Received-Date: Tue, 28 Aug 2018 09:03:38 -0000
Content-Type: text/plain

On Mon, 27 Aug 2018, Khem Raj <raj.khem@gmail.com> wrote:
> this patch seems to need python-pytest-helpers-namespace recipe
> and it does not exist. have you tested these patches on master

Yes, tested the series on master but I forgot to cherry-pick the commit
adding the python2 recipe right before sending (perhaps I should
cherry-pick a range next time instead of going through each commit manually).

The commit adding the initial p2 python-pytest-helpers-namespace was done
earlier and by someone else than the p3 recipe. Do you want me to squash
them together instead of sending them separately?

> On Mon, Aug 27, 2018 at 5:32 AM Ioan-Adrian Ratiu <adrian.ratiu@ni.com> wrote:
>>
>> From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
>>
>> Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
>> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
>> ---
>>  .../python/python-pytest-helpers-namespace.inc        | 10 ++++++++++
>>  .../python-pytest-helpers-namespace_2016.7.10.bb      | 11 ++---------
>>  .../python3-pytest-helpers-namespace_2016.7.10.bb     |  7 +++++++
>>  3 files changed, 19 insertions(+), 9 deletions(-)
>>  create mode 100644 meta-python/recipes-devtools/python/python-pytest-helpers-namespace.inc
>>  create mode 100644 meta-python/recipes-devtools/python/python3-pytest-helpers-namespace_2016.7.10.bb
>>
>> diff --git a/meta-python/recipes-devtools/python/python-pytest-helpers-namespace.inc b/meta-python/recipes-devtools/python/python-pytest-helpers-namespace.inc
>> new file mode 100644
>> index 000000000..a69867d91
>> --- /dev/null
>> +++ b/meta-python/recipes-devtools/python/python-pytest-helpers-namespace.inc
>> @@ -0,0 +1,10 @@
>> +DESCRIPTION = "This plugin does not provide any helpers to pytest, it does, however, provide a helpers namespace in pytest which enables you to register helper functions in your conftest.py to be used within your tests without having to import them."
>> +HOMEPAGE = "https://urldefense.proofpoint.com/v2/url?u=https-3A__github.com_saltstack_pytest-2Dhelpers-2Dnamespace&d=DwIBaQ&c=I_0YwoKy7z5LMTVdyO6YCiE2uzI1jjZZuIPelcSjixA&r=fzwh7IUt7VYYiD6094geII0kSDP3DkEnN0B8zB62AxE&m=W74ODSSr60HRrFxzES0jR9ErEDIY0z3NTj08MFJVXQw&s=WFg4fgnvlpFzm8uQU1eEL1mn2d55j6iZhsog43LOoPA&e="
>> +SECTION = "devel/python"
>> +LICENSE = "Apache-2.0"
>> +LIC_FILES_CHKSUM = "file://PKG-INFO;md5=71fac4dfeee99c39c51f617e9486237c"
>> +
>> +SRC_URI[md5sum] = "80fe3e515f640b1459709b539f6b857e"
>> +SRC_URI[sha256sum] = "d8bdb017c0f7271699c08850b6b12e1ce9e52913cbd4461b5febd21082a29113"
>> +
>> +inherit pypi
>> diff --git a/meta-python/recipes-devtools/python/python-pytest-helpers-namespace_2016.7.10.bb b/meta-python/recipes-devtools/python/python-pytest-helpers-namespace_2016.7.10.bb
>> index afca48702..2b6ee8550 100644
>> --- a/meta-python/recipes-devtools/python/python-pytest-helpers-namespace_2016.7.10.bb
>> +++ b/meta-python/recipes-devtools/python/python-pytest-helpers-namespace_2016.7.10.bb
>> @@ -1,13 +1,6 @@
>> -DESCRIPTION = "This plugin does not provide any helpers to pytest, it does, however, provide a helpers namespace in pytest which enables you to register helper functions in your conftest.py to be used within your tests without having to import them."
>> -HOMEPAGE = "https://urldefense.proofpoint.com/v2/url?u=https-3A__github.com_saltstack_pytest-2Dhelpers-2Dnamespace&d=DwIBaQ&c=I_0YwoKy7z5LMTVdyO6YCiE2uzI1jjZZuIPelcSjixA&r=fzwh7IUt7VYYiD6094geII0kSDP3DkEnN0B8zB62AxE&m=W74ODSSr60HRrFxzES0jR9ErEDIY0z3NTj08MFJVXQw&s=WFg4fgnvlpFzm8uQU1eEL1mn2d55j6iZhsog43LOoPA&e="
>> -SECTION = "devel/python"
>> -LICENSE = "Apache-2.0"
>> -LIC_FILES_CHKSUM = "file://PKG-INFO;md5=71fac4dfeee99c39c51f617e9486237c"
>> +require python-pytest-helpers-namespace.inc
>>
>> -SRC_URI[md5sum] = "80fe3e515f640b1459709b539f6b857e"
>> -SRC_URI[sha256sum] = "d8bdb017c0f7271699c08850b6b12e1ce9e52913cbd4461b5febd21082a29113"
>> -
>> -inherit pypi setuptools
>> +inherit setuptools
>>
>>  RDEPENDS_${PN} += " \
>>      python-pytest \
>> diff --git a/meta-python/recipes-devtools/python/python3-pytest-helpers-namespace_2016.7.10.bb b/meta-python/recipes-devtools/python/python3-pytest-helpers-namespace_2016.7.10.bb
>> new file mode 100644
>> index 000000000..f03f5d415
>> --- /dev/null
>> +++ b/meta-python/recipes-devtools/python/python3-pytest-helpers-namespace_2016.7.10.bb
>> @@ -0,0 +1,7 @@
>> +require python-pytest-helpers-namespace.inc
>> +
>> +inherit setuptools3
>> +
>> +RDEPENDS_${PN} += " \
>> +    python3-pytest \
>> +    "
>> --
>> 2.18.0
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> https://urldefense.proofpoint.com/v2/url?u=http-3A__lists.openembedded.org_mailman_listinfo_openembedded-2Ddevel&d=DwIBaQ&c=I_0YwoKy7z5LMTVdyO6YCiE2uzI1jjZZuIPelcSjixA&r=fzwh7IUt7VYYiD6094geII0kSDP3DkEnN0B8zB62AxE&m=W74ODSSr60HRrFxzES0jR9ErEDIY0z3NTj08MFJVXQw&s=mx9ylPEFC1TJQvgUNe0p5wvCczXDM7g8SVJAM3rDwxM&e=

