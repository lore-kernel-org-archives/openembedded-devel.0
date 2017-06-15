Return-Path: <mkelly@xevo.com>
X-Greylist: delayed 2022 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 15 Jun 2017 17:10:39 UTC
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
	(mail-bn3nam01on0054.outbound.protection.outlook.com [104.47.33.54])
	by mail.openembedded.org (Postfix) with ESMTP id 94140782B4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Jun 2017 17:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=4nHrHrTu63O17fYL2x8adrI4y98uTNrQX8gCkZtm+9A=;
	b=KhzBSHZnFx3tiTPPWJZhLc4cLiSemYj85FWsZveSLnraCnXuVdwCUpZNJDy0zCpShmID3ndMBAYUnoIdQRcLFcx4ZGGAP+8SEwJ9u7a4+xufU3IsAuHSFu9TlAOynnP6vrACScGBXpMpcmDoQZA7x5QwmrvBEgKudf8aOPVIrEs=
Authentication-Results: gmail.com; dkim=none (message not signed)
	header.d=none;gmail.com; dmarc=none action=none header.from=xevo.com;
Received: from [10.111.196.131] (66.162.141.202) by
	BN6PR0101MB2932.prod.exchangelabs.com (10.174.87.141) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1157.12; Thu, 15 Jun 2017 16:36:54 +0000
To: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Koen Kooi <koen@dominion.thruhere.net>,
	Martin Jansa <martin.jansa@gmail.com>
References: <e0efb641-fd8b-a8ff-e952-7b32805cc45a@xevo.com>
From: Martin Kelly <mkelly@xevo.com>
Message-ID: <2ef4f2a3-48e9-f3fa-a55e-01522507d86d@xevo.com>
Date: Thu, 15 Jun 2017 09:36:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <e0efb641-fd8b-a8ff-e952-7b32805cc45a@xevo.com>
X-Originating-IP: [66.162.141.202]
X-ClientProxiedBy: MWHPR20CA0008.namprd20.prod.outlook.com (10.171.151.146) To
	BN6PR0101MB2932.prod.exchangelabs.com (10.174.87.141)
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN6PR0101MB2932:
X-MS-Office365-Filtering-Correlation-Id: e5c474c0-436c-4b10-23a2-08d4b40cbcf4
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(201703131423075)(201703031133081);
	SRVR:BN6PR0101MB2932; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR0101MB2932;
	3:2Tu1pmZx+JVqk5RTCWH+pgV81JegF6wTBuJV8yPDnlyFsGXatFeje32Nje87xuZHDWohfh3nHZyNYRG1AWnq7VphGrUhvX4GkRRKRPOUyCpKhtYY+kNVaOwpB2bClU9wFoG8zwhFz/D6OFTYS3aIZ8QX/zlDOzsBfHLpK4Nv4P75tI/yuUePtyRXvQfJ2TVHUj5bE5zGC7qPUJrI56P08A45dzLv0CSjV0UEZFtD8AJqIiha4uR2xAB5pgnWVxa0v4UO6Qzw8frpLDjLOb7i8qgQ7in+O5bbZssIYVmKgOdEgEY4hGfojCNFfwVfxcayBxiV45GVPRz8iPW6cn+Jhw==;
	25:0s38BgiSF48nMy5qJvx/BwdcTIHNm8kvVcpO4ooDMvOXt0IAXOqmFhNnA2Md3msbjcJMBwO+dQaGdGTUfbCQjeccQg+G6msstahKUFpZKh0PyFqiH5Ft2b6+7kJkTgdlY3Yk6z+Qk4yERyhcj5JZp9iZJUvddhzz8fm8vnjCLaLj78JAwN6PC+MDV6sspyEWIglERoJQx/Q7foAv3ds2gZujD8bowOQPQYRu3x8A7LpW2H1gdmxKrcdJvFbKGWf0yPYlcZcXmlkfHBvlbl1vnwdyreWmrOBp8QQHcoaUspVHPkIRDWxdpheSmkUkHP6PAflG0aq5zTZ9oRdTkDzna1pjYvrF+19ohJ1IWRKQIftSX8o7Ln3diB/sgLg+HrOopY0DHAjjiKnGBMJwssLOCDBUnzbXdtkpCCEjU3iGJ16t18xc8W6n2ZUnvTjLfOx44uA3BIkorToXu8UOf2mQIMwkxDR783txC50Xg918Xxg=
X-Microsoft-Exchange-Diagnostics: 1; BN6PR0101MB2932;
	31:n8zpprDlnoeETDKo0IAzFECOi9ZPuus1OT2HDYab01FaAlwyEWFfCxHOny0+LiqtWFihK2nLUrpsWXv3DbkgFZaUiC2LF9HB6FPr1mKt3TOrEGTP4OYY6SRPKNXnX4bRmPNGfHPK63YVXF9HkOZ8P1a6ifhdJMYOvhFTNEhxYWIL11SiCFEJAupfUOyIPl9LDLF8rjtyewZj0wf/GrOaEc5yETlkdJPtQiA3fVAYPcf9D4eeJvPrMLDsCW5YFz+Ssdn31LO0DEgGwkoVNsTO2BI19WpDNjI4BGHYV9zY02A=;
	20:6G9w7KRvoniV2NmFZ66jGjXZPMRsXKOPNU8g1q6vQSbFxKCIEc1a0/6rlf0E/fxUFZ76pO5NEO72i+ZPWYe4Ec4hYLg8pzAPY3xs1vF2+6eVqUNoIZX3xVjQe51pCHTs+ARZITFVKR1qkSuWoQRmbLT6hY+RKn1HZW68vmjPVnWy5pJ1TnL1OCZmg60HbKMYeGc6S4WIge0upcrjE0J2YZQr7DoNg8xf61uemzQEe5IP4m/2OCDTHf5wa2Brd67P/s8a36sxp271RbQp0OF287YBJ5S194j6+hPsKbgNo0lkny9LM1DXRUH0kDIejLdOxgTP9bsHq9PNGoe3xSSX2Q==
X-Microsoft-Antispam-PRVS: <BN6PR0101MB293275436900ADE3C2323A9DABC00@BN6PR0101MB2932.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:(166708455590820);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(8121501046)(5005006)(93006095)(93001095)(100000703101)(100105400095)(3002001)(10201501046)(6041248)(20161123555025)(20161123564025)(20161123562025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123560025)(20161123558100)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:BN6PR0101MB2932; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:BN6PR0101MB2932; 
X-Microsoft-Exchange-Diagnostics: =?Windows-1252?Q?1; BN6PR0101MB2932;
	4:DV+k5mWs1X5cxueR5Biv+FPpc5HUiSVYbr3O?=
	=?Windows-1252?Q?YWX0Q/+ThqxFQFKhEQStjZpMeNKA9GkKxqZD9kLzDVfEj91/YwnL1Crj?=
	=?Windows-1252?Q?SJaRKOzJGtIB76oavauer4P0Rl2+wR7We3UNeoyYeTAssktJNjOzeYvl?=
	=?Windows-1252?Q?HVml58FFh8C1QKRyzC8jzNnfyverq7gTyCyJmQ506wcaB5BXwJQ61ci6?=
	=?Windows-1252?Q?O5pn/Y54+u88FIzXVFVez/Hh1QsN9Ucfo6ruduCbIQybjHq/FhMHkZIh?=
	=?Windows-1252?Q?dWliiR90+9WCn47v2T/qQ9hhDGmkH9JSyiZwEd+j4ambzUFmHFEZeLwl?=
	=?Windows-1252?Q?3Tl8JfcIkZsuIIjKDuYYOi+TcQ5r3FDtRpu4OZjgQWbZITdLVA+dx3zq?=
	=?Windows-1252?Q?RlhyOTdsmuIpxZJPsue8eTOzhB9RYoEtms0L507WgLcePgc5RA/40I+2?=
	=?Windows-1252?Q?mek9gFP1ATnDeC9ABVCXt3rUJdKV8z//0QrkYkmUS4lVFUvCKb+Pjwc+?=
	=?Windows-1252?Q?6poRIo6lBKZI4PTO7ERnw6RaZd3P0HFg8WERNQicslYw/TXdy6iyJtIH?=
	=?Windows-1252?Q?opZtwTrAsgGx3fxV0etAzXmD1Ffq+Ofw4tE+xSoZS4qvOf31KzBk0Lh1?=
	=?Windows-1252?Q?Af12NsQmo0rwPrjYs1Oymuqd4kr7Rn2rZKH4rwk1erOQY15iXA0ng0fV?=
	=?Windows-1252?Q?vt0wgX9DT1JwP/XmQuMGboGhJeLz7SSSfx6vzSdEWAaYbrtF0xwqgWxg?=
	=?Windows-1252?Q?SnEv0bA5FZhd5p0SI2J1yINho81gq+XauRpV7Z+votoXze6JxlHuB4OW?=
	=?Windows-1252?Q?BAjx9pyC8bB44ca+YiJ5X8/wcZhWZkjdKx3dSzTD1QK90UrMSfZax7Uz?=
	=?Windows-1252?Q?T5qLe7yDmCLOzo7w15bDfKyT22fpoiQNtSUWpkqLOVRjYOVCxj07Iq5t?=
	=?Windows-1252?Q?ok0ol3oHHdMmjmS9Wj+K6oNjMYDliaBhW1jhpv82fQzBThMPN05/mOqf?=
	=?Windows-1252?Q?YbaAhrmSfcLPTjfjTwTU0A9yPwsbi+1IHIVHhI7/6HaEJFLupI5qDF1C?=
	=?Windows-1252?Q?7rO4dEB4j+0nz6249Jr0VzvcsLGPPy/uUSmP+ymTUvTnHgnxxWxVUhBx?=
	=?Windows-1252?Q?EZs/mWcOCeB+NwMbBTO10z1gc52yldMg4zbcOB/8GkDmReFijvhHOjAn?=
	=?Windows-1252?Q?FK3ZkDI0SVExk5tZltcjt6OC1HvGaGF05Fm2pc3ltviH7iRzghF/5qLa?=
	=?Windows-1252?Q?tnqEjr9WiGeDzgxmxbOckhRlGfOOgVUSnXeGaJE=3D?=
X-Forefront-PRVS: 0339F89554
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6049001)(6009001)(39450400003)(39400400002)(39830400002)(39410400002)(53754006)(24454002)(377424004)(377454003)(31696002)(66066001)(90366009)(6246003)(230783001)(2950100002)(38730400002)(86362001)(5660300001)(6486002)(77096006)(6666003)(31686004)(42186005)(229853002)(53936002)(83506001)(33646002)(36756003)(478600001)(6306002)(305945005)(966005)(47776003)(7736002)(2906002)(8676002)(81166006)(189998001)(50986999)(4001350100001)(54356999)(76176999)(50466002)(25786009)(23746002)(3846002)(6116002)(230700001)(53546009);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR0101MB2932;
	H:[10.111.196.131]; FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?Windows-1252?Q?1; BN6PR0101MB2932;
	23:1+fnAq6Fc//SH17Hb70N2LKliBwzHWmM+xA?=
	=?Windows-1252?Q?DaD8PHJPsbu68mwpeurSVWVOBpXxfa/DeMI7QJggEDVcfc70rKeSTZ7h?=
	=?Windows-1252?Q?HBWi4VSkt8Kvrf3mFySa9WtUDiCXPjVgxUeec6gPtrqs0pHds4SzPrYO?=
	=?Windows-1252?Q?Gddhr8UbJIjjR3XlVoZVpZrPIJbjhhqL70gXGI4tK5fUDizZKKk1psMk?=
	=?Windows-1252?Q?YQcPBooSh1Pdmq0gr/e1id7BLraIkeJDR7sXV6ccEeHn5Wf7dtP9NewC?=
	=?Windows-1252?Q?URc3PTSJPoUxrg8yQMwt73IfYyYtIkiMNikiHE7WjCHoznh5i7RIOQtb?=
	=?Windows-1252?Q?eqXtW7s+u4FQTAwdf+UjwbSXW6FlvTfNT9AmhBo6CytBLoNGfNfUV9Zs?=
	=?Windows-1252?Q?LZA+Dra2nciaL4ow7C/q7DUNNA1gUE8yHWDL/6jvSdqTtwzxfhLvQH3F?=
	=?Windows-1252?Q?hCTerVmLlRgnxTqAgYEaN+Z7cGc6P5jOscEmf44wIV3ZbCIKdW4pNOmj?=
	=?Windows-1252?Q?lnA5GfQS4tqYfZMonPrjLb2Uw9MVr9XYiZ7fRi01dZ+0F3g/mxrwCK/I?=
	=?Windows-1252?Q?1Hz+otYfuXLok8akFujnj+uVHhAId+bIWkSb0O2WBHxUx/h0KZ3e1f3U?=
	=?Windows-1252?Q?j5HYIe3D+vnAPdv6Ga9MGbTSWU/ahohZnCxXSfZ/AYdO+3jMCYTwjhwi?=
	=?Windows-1252?Q?Kd2JGUOH8/rTXc/3rIa52NW0GWv9lWLK++gmGc8StFCrX5lC4pF77Foi?=
	=?Windows-1252?Q?YHdzXw/IK6oxPTCKqDO3QEoo52cbpfQld5WdNw7a3pIH0Y5gzoIsNzPF?=
	=?Windows-1252?Q?1/hVoQPGM2C31l3aYlkptle4SBDDS8NGa7IcQkmJi3lbzvbSpJrVpfzk?=
	=?Windows-1252?Q?sM8C70hN7W/l3MV3fL3yFpFqd8otFWZMke+TgBWQvdT1QuKpSqf6e2rj?=
	=?Windows-1252?Q?2NxILAC1MJ6skzjhQuZ9SIXjwg+/86boQ81Jlygup76Km2jIrEIt98xW?=
	=?Windows-1252?Q?nUvJh7MF4fyG9/dWdZZ6d/7d2q2itkct7DE29Q8ygnQKJ4YbFejoXKfJ?=
	=?Windows-1252?Q?M2XjwGFhHl5bynQDMH3wIA2wrP6Ud5EeTnWaGlabSwwlqIDpLx/D88P9?=
	=?Windows-1252?Q?CNecyam/Oya5wCET2HORpw0KNtHWWqShkJTYK0ueiurdzrx6s36YpJhg?=
	=?Windows-1252?Q?mxjFF4HOrMvMNsZhQ2kEMnZNSoezG0VizMkVw3TQTmDayxVM1AfjzfWP?=
	=?Windows-1252?Q?0/NMxQfkdCE3F+7u6n06/ltNubHej2CFNITSzRS3XStmZ0Suy3HDkoyi?=
	=?Windows-1252?Q?IPr8U/tc0PFcnAmOH2i8QjhTI8oSp5UQ2sRrqQpZTg7FA08Odz8ZC2tn?=
	=?Windows-1252?Q?gn442LVwPTuCT?=
X-Microsoft-Exchange-Diagnostics: 1; BN6PR0101MB2932;
	6:I+iL8wC27fKpexwQmUPKTd6vgP+5lO/M4WWhm/05ZOLJaQJw2/7bjJrnS5ae1kEnWnrVuy3Wh+hhiiJ3+n9P4NdV/Q3lA9vRwT4Qqa4u2pR6fr4lq2fCpx6AXYm0XALwnMPr4ndr/6UsfOJjqhnQptfmEdihRR8y64flnX4xB1vdU1GpDJjwTpxMIBxwXpl8GjjfV4vKR4PUyTkz6tLqPna0jWNAbs8MO+a7iru1F+qeA5466sZnfDdunUOEcvWgOz2jnqcc3bi7HrEO/sYgEIgTVFpKmStxjRwREwVv8mjJ+YLlAwPDTsyGdVQKDFuC7um1pqSSfPp1fiPrIVOCSVkkXiIhaChAY0TxmFLcLPSvbvV9wf2wN7zSHFNqqH/BagBBigo864v8t6XTdP4s7KavPRrSsNa8Q9vGf00SEakmii+LAKzIBSYJHF7cGgeiNKKaoJqpAYJPBl1R/f2gIulrxS7Z0E2sFl6GTxsJHDSbeUdYHt0vAMimsHx4/KZzZ66WHER2Mq3uTZQdziKK9A==
X-Microsoft-Exchange-Diagnostics: 1; BN6PR0101MB2932;
	5:7N8djMV1lghKee6LnWLLLbtzdnMVP6Vvn9iK5heTnmxQwWil5vv4QsHmt98OdA+BHJSlUHXDEegOPRUWz3ZhR7+EcafVvzgK4DjVH5SHI7By7lY4/lUekPuGGPQ6LPI1/NLaHbTuajkaaSDVXQiH6PtUWtMKspCEduymm6GOiWzEja/zMjU/vmD0OALp9psZ6ZBFNyJMwI21X6sScDqfD15kkXIZJxg8lPb3B3sJ2SKDQdjkDIg7+8X6uoS/7Uf7hb70T7M0DwElRivgb/P5sZ87OQ7g+8f7gKW65ckO5BAzbI7c1yfM+P56nyDC1jKRS6er0NchocAqzAP/+a1dnnMiJKlC6vIEo+9XM7RsYJc8EVkaX1rlznRTqEKkX7asS0VPVGA5ulKnqPLaVh/PVi3AMze2IKwAZ20knCZdRaLkZwEh1QObNyNAHVr4MsXHggQfnRlZYFvBH3sMSQ8yY8Df5WofJqgTPUiRvHD1r2dnGeKMLUJ3+TFWB4tGNxGd;
	24:yx9kxCgBPn0Oms1qEShZIG9XbfruCXoxZj7cnjH8lyzynUMwigUTvVe+TrXtMLyQnGzHkZa8GhUhF8mbO2L+dqU4YDplX5SKgiM8SqpZEWM=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BN6PR0101MB2932;
	7:l+qKT0FGMx/7XKdaH5dWdyTEtGmpcUNgFp3ZHeMzIFkDRiLUvbkG2/gMUrVph3a6Q5q/BrRSXGcskohW1vBNWgyNWPF6cz/bNrT/+w9wrsIHPjF1MLIR39dFggXQBMyBd9rZL1vibWS8inimcmNmozhyd8QSnALUXDZq5KtMhkNJbfSkRngG3na7mDthGpTxxqbVaSLfue2qg7eJSDjtu+zOFxivJv6O4ozRpwHGzTU/6Gb7whIQKlATGDFZvgDjzOfaoxYzwFxoG80k0EgQrWj1zhMwX55k9sfMxm79jDi77qFYMGnI0bpUEpfISIUBLQdBNrm0rcGl7iUiwR63uw==
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2017 16:36:54.6620 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR0101MB2932
Subject: Re: [meta-oe][PATCH 00/14] new recipe: open-vm-tools recipe
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
X-List-Received-Date: Thu, 15 Jun 2017 17:10:44 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 06/09/2017 03:22 PM, Martin Kelly wrote:
> Hi all,
>
> This patch series adds a new recipe for Open VM Tools to meta-oe. This
> recipe is invaluable for using Openembedded with VMWare, as without the
> tools, performance is very slow.
>
> More information about Open VM Tools can be found here:
>
> https://github.com/vmware/open-vm-tools
>
> Please note that, as mentioned in the first commit, this recipe is
> modified from the recipe originally found in the Open-Switch repository.
> The first patch is directly from that repository, and the following
> patches are modifications to it.
>
> Original recipe:
> https://github.com/open-switch/ops-build
> yocto/openswitch/meta-foss-openswitch/recipes-extended/open-vm-tools/open-vm-tools_10.0.5.bb
>
> Commit 9008de2d8e100f3f868c66765742bca9fa98f3f9
>
> Although the original recipe packaging was Apache-licensed, I received
> permission from the author (Diego Dompe) to relicense it under the MIT
> license for inclusion in meta-openembedded:
>
> https://lists.openswitch.net/pipermail/ops-dev/2017-April/014715.html
> https://lists.openswitch.net/pipermail/ops-dev/2017-April/014716.html
>
> --
> The following changes since commit
> 41cf832cc9abd6f2293a6d612463a34a53a9a52a:
>
>   Revert "rrdtool: add gettext-native dependency" (2017-06-05 11:13:09
> +0200)
>
> are available in the git repository at:
>
>   https://github.com/XevoInc/meta-openembedded
>
> for you to fetch changes up to 402d1b3917195beb2ab7cac5dc94aaed8992b5a1:
>
>   open-vm-tools: style changes (2017-06-07 22:31:34 +0000)
>
> ----------------------------------------------------------------
> Martin Kelly (14):
>       add open-vm-tools recipe
>       open-vm-tools: add missing pkgconfig dependency
>       open-vm-tools: add missing glib-2.0-native dependency
>       open-vm-tools: clarify and expand licensing
>       open-vm-tools: base_contains --> bb.utils.contains
>       open-vm-tools: update version to 10.1.5
>       open-vm-tools: don't use mspack
>       open-vm-tools: don't use dnet-config
>       open-vm-tools: add #include to fix build break
>       open-vm-tools: add missing X11 dependencies
>       open-vm-tools: remove kernel module logic
>       open-vm-tools: line up configure options
>       open-vm-tools: support FUSE
>       open-vm-tools: style changes
>
>  .../recipes-support/open-vm-tools/files/tools.conf |  2 +
>  .../open-vm-tools/files/vmtoolsd.service           | 11 +++
>  .../open-vm-tools/0001-Fix-kernel-detection.patch  | 35 +++++++++
>  .../0002-configure.ac-don-t-use-dnet-config.patch  | 41 ++++++++++
>  .../0003-add-include-sys-sysmacros.h.patch         | 33 ++++++++
>  .../open-vm-tools/open-vm-tools_10.1.5.bb          | 90
> ++++++++++++++++++++++
>  6 files changed, 212 insertions(+)
>  create mode 100644 meta-oe/recipes-support/open-vm-tools/files/tools.conf
>  create mode 100644
> meta-oe/recipes-support/open-vm-tools/files/vmtoolsd.service
>  create mode 100644
> meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-Fix-kernel-detection.patch
>
>  create mode 100644
> meta-oe/recipes-support/open-vm-tools/open-vm-tools/0002-configure.ac-don-t-use-dnet-config.patch
>
>  create mode 100644
> meta-oe/recipes-support/open-vm-tools/open-vm-tools/0003-add-include-sys-sysmacros.h.patch
>
>  create mode 100644
> meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.1.5.bb
> --
> 2.1.4

(ping)

