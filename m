Return-Path: <samuli.piippo@theqtcompany.com>
Received: from emea01-db3-obe.outbound.protection.outlook.com
	(mail-db3on0122.outbound.protection.outlook.com [157.55.234.122])
	by mail.openembedded.org (Postfix) with ESMTP id 5418360797
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Feb 2016 10:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=digiaonline.onmicrosoft.com; s=selector1-theqtcompany-com;
	h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=sg69upRqGQvlwMh7mzWe9pdaC9lttWJSI4SZbJoyEMg=;
	b=cx07eLc0V2wzlxQqQdoBOBgfCCtPP/0C8YCwp33xeuGwZ72ZcrSPAUXL7UQGfnj1ZOCHIII1GNGFBaQKlyRw78WtbWYZvlJvbyoNnn7MgQMSaULp/kh9omrmF9ONPjno4BpZx8vpb8S5MS9WkrrKBVnwELEjwUmGYknATpxJXjE=
Authentication-Results: iot.bzh; dkim=none (message not signed)
	header.d=none; iot.bzh;
	dmarc=none action=none header.from=theqtcompany.com; 
Received: from [10.9.5.47] (91.217.248.11) by
	HE1PR02MB1179.eurprd02.prod.outlook.com (10.163.173.149) with Microsoft
	SMTP Server (TLS) id 15.1.396.15; Mon, 1 Feb 2016 10:44:36 +0000
To: <openembedded-devel@lists.openembedded.org>
References: <1453906715-6881-1-git-send-email-manuel.bachmann@iot.bzh>
	<CAP9ODKopO2VAkJV_7-X0YpEaZfUSFLGxhHFvsqeXrUvAEWaPsA@mail.gmail.com>
From: Samuli Piippo <samuli.piippo@theqtcompany.com>
X-Enigmail-Draft-Status: N1110
Message-ID: <56AF3715.3010402@theqtcompany.com>
Date: Mon, 1 Feb 2016 12:44:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <CAP9ODKopO2VAkJV_7-X0YpEaZfUSFLGxhHFvsqeXrUvAEWaPsA@mail.gmail.com>
X-Originating-IP: [91.217.248.11]
X-ClientProxiedBy: DB4PR07CA006.eurprd07.prod.outlook.com (10.242.229.16) To
	HE1PR02MB1179.eurprd02.prod.outlook.com (25.163.173.149)
X-Microsoft-Exchange-Diagnostics: 1; HE1PR02MB1179;
	2:BaOV3cvVIphAFMV/V2Xkq24k+Ww00FCNRfCyK+8VRDyfJerekzNXCv5s/us5iPXS01b19J9zUPaqSQ6oFHTq1q55LDxGfEYL7i9tZnrp9YB0koUaxrgzg2LS1Mem7f7GqaCGltL0n+VYqJlDRLle+w==;
	3:qnJ/LsMsRRz70rDCvc3Oq9fc1sey8oLPIVuxC31kzUepskCUkifzBqbUmB8wjCVkvfX86M1gKQc+cjSKWxy6nuOpUXa9c0aRAk26IlB74bIspgo4Ow+EuH7J623nwnpt;
	25:mSLaImDMYcbZn6Ll/K2CqVhEjnjc+yEhbjNKvh1UNvuBGatICUAhPa0j0gIbla/QDH1R9D9iYE7P2EomiTEk9aYws54F7yEg04j3XzIuzHbSdiUZrBSCIpBW55NPjjXvWOEqYN0xAWCyf5H75F5eXFbO/zMDWC3Udn5HiY/n/hHW+3EfOyizflYgBnK5ZsA0lPfdb7GKIfWwvA6MDiiH/hnQpWAC00SVA0u2/+Yd6fKnqGrYXlmMSm/01YscQ0hb
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:HE1PR02MB1179;
X-MS-Office365-Filtering-Correlation-Id: 46054a1f-5c24-479c-835b-08d32af4ae06
X-Microsoft-Exchange-Diagnostics: 1; HE1PR02MB1179;
	20:4uPQjo0JFug7ffC1sjDDYGNyIgfdCiox0e4ZsUsRzknr45V/qF3qy77U5Rrugl1lxRw4Bhg5B9v4ZC44P3MKw7sbSvE5ZPi0qn6RJ5aUD3HPbhcw72LoFTeKSMx09wkyzWiTBe/Qv6pYUhYsF4FhAvTQu0Etq2Deng7OI2/vW2rarnhRdFnlgSSq/N+6QX7GqDilV1bhjAWeTlse2gejBAwzAJ21TN36YKWn2dtOS6V+bkA8yeJZnm4RiDRqSIdqZGWHepn8oBOKp3/aYhADxnQhXkSTgi3b5Ev5NRl3i6UajhjYFFb4XcvImvctlD9xQal7gsEhffrFCIGuSRYtlxSpJfy9r3eEOZrgAsvm1nBGQ4I4/sj+8vtQNw8IghPG6hJ+ACZ+lZXDG8xfJQjBayeja4K0QmcX3oXcR99Imeu6xwwfpZ55Tr57UaSF0kvP9+Gkw++wBQwFnbgaRLdPWxAYpL+sIaLHysmbj8TfFVq7x0XIf00GGnWRCH81Z0Fl;
	4:cnmzMAUr4W6Z5JAZoLQhatDn83OidixmMNbv0CpaoTb9/3JyR1QZ4ixp2s1hSXpt8CNm4yWa/l0ZCie3d/+J25pizCVSzi97ryO4Nt0jDKQ0lnYWcq9h2oCnqifUoqmkg+xKYCF6J0l2iGicgkabVT7v23iGaqHRbuR7m0XlO5bFiIyElmd7tEKiUTprScpj9hDSJ6NwzMwzytZe2Sfj8taaSaoHrRbwWdeC/dTunViCz8BuP2lbrzqVIOcPaA/oQhvYZvAXOIyFM4dBed88Hby+utGtwCpAWf+OsX+I2xvaWVEl2zIST03vY8aPY3YnYd1I9gpe8AIWzGMJ+7gc4PLY4ElmIrgsNuOQ1aEJLSBiognQj/H/z3UOfdEZ98Lu
X-Microsoft-Antispam-PRVS: <HE1PR02MB1179E636363CA45F5180AB4090DE0@HE1PR02MB1179.eurprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(8121501046)(3002001)(10201501046);
	SRVR:HE1PR02MB1179; BCL:0; PCL:0; RULEID:; SRVR:HE1PR02MB1179; 
X-Forefront-PRVS: 0839D067E7
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(6049001)(24454002)(377454003)(64126003)(50986999)(59896002)(5004730100002)(586003)(1096002)(54356999)(65816999)(76176999)(87266999)(77096005)(2906002)(5008740100001)(2950100001)(66066001)(189998001)(110136002)(5001960100002)(230700001)(65806001)(3846002)(47776003)(3470700001)(36756003)(65956001)(42186005)(2351001)(19580405001)(87976001)(19580395003)(80316001)(92566002)(83506001)(4001350100001)(33656002)(23746002)(40100003)(50466002)(4326007)(122386002)(86362001)(7099028);
	DIR:OUT; SFP:1102; SCL:1; SRVR:HE1PR02MB1179; H:[10.9.5.47];
	FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?Windows-1252?Q?1; HE1PR02MB1179;
	23:m5NNKfzipPtbuCJVs2xfkdgJUphzaSrGTT9tG?=
	=?Windows-1252?Q?JqfxBX9ys7zNnLToUNkx13snKLP158Fc+sy3uw65WpBN9cJohm/lz8ES?=
	=?Windows-1252?Q?sSi5wMNXkhGUYIC3WF+Wx7V6ok8+rzljLZzWWh44jfSQL9lduiv/c2+H?=
	=?Windows-1252?Q?rvCdM9+SokL2iFDwAYYoG2EMl6a8+a1f4hDpO48p8WotShRwR3bpfyys?=
	=?Windows-1252?Q?a3vm4vxGjXzj3HQAH4xuNpXuPQTi0UHJc/Pc+u2I0iciQcACVIJTCU+m?=
	=?Windows-1252?Q?59jb+SCL0WfBM9lT8CBr6ai27fMrZlD2wmMg3pYhcpdj9pQgifInTOye?=
	=?Windows-1252?Q?QkO31CHkPJH9WO+ryMZKHo+GLlvHZliPDVAes1TaPpN5aloRhUYmdQoE?=
	=?Windows-1252?Q?JUEAjaM3ZQgSHs/ytT2snzBjbz2DpIsvz7dBFuxgv5iOEK/ufoZ7ugYH?=
	=?Windows-1252?Q?eWsxVYZzFj2pxNZIvA6PKP26+FTgewbSEof/8UPVqYq3c3jzgCrySg57?=
	=?Windows-1252?Q?5DmeWDxV96E+43QkfCaEkNi8ydGWBi/KqOUnK3nmesYsx/d3XUoepgCZ?=
	=?Windows-1252?Q?yY6XskbZuqMOGB/0AWUU1QcvTpV2BoVIxYJ3R3/HPAObcrBZ+DWIyvci?=
	=?Windows-1252?Q?425gWkDIqA7Re2AIGsdx/7Xwbn1lgamJwM4+9Rk4RJ7WkqaE/hbZONVy?=
	=?Windows-1252?Q?UBA+V3Lb2B6bzr5VCGsekzxGlumniNM0EeJbip5In9QdppvXLyXI7MQc?=
	=?Windows-1252?Q?EkJGKErIISNNWN4FAbzKn+gqR91RX/vY3fzOFPsZG07Pm1qDW3ia7p3d?=
	=?Windows-1252?Q?h/GpTTcQP0EOcqLolPv3QPEi/PP+9nYIzEkF68l1o1g1LaXkdl4bBcGr?=
	=?Windows-1252?Q?E3f4l9aj6zbpB1LaR82Z5ys66YOLumXOMGAs7OQP3OiWwhe4eGoVr7Az?=
	=?Windows-1252?Q?tZ+mnUEFsh73LzjXQ3hz0+gDarh2oVxVIX9EyKdeD4jFImRGCrzgpt4E?=
	=?Windows-1252?Q?h9/YKb427Ik7eaPkg+53bQKPsx+rZqO6hM+HXEO0q80nhz025NUsrwk1?=
	=?Windows-1252?Q?oeXRfzNFzzDNymamFqsC/QIRmPVQOnDY7F3DDihPtm9oYcnEZWA7WWfn?=
	=?Windows-1252?Q?xUOqYiPdk9fWhCwsiSUdalVhFjDWMr6tSzNvicSqIUu0h7Olfostq1Ac?=
	=?Windows-1252?Q?jDDy68cNAFZ/jLKqGf6JcgsLVj9E0tF+Oj5jPsQCUJlzz4fmjeiSd00S?=
	=?Windows-1252?Q?IilMnqHzmnGC8iKNireTJaoKHBLg1tCJ/xFgYOYwVvEj22J+SqoVy3Kg?=
	=?Windows-1252?Q?WAZ?=
X-Microsoft-Exchange-Diagnostics: 1; HE1PR02MB1179;
	5:R48rsnlDxqb4t/ASBvWPWP/6MJj4oP5WVQ3WB88I+Ty+Bc8LyUWZLJxJ3V4dMow1tACxtSEeWhs1vzOZ9Xe0J6EhGVMeHT1sM1gVe4cRE0dwUgz4spVEHb/9YHbiW+vmoVWuSYT9l/Xuong0kVWQqg==;
	24:UtUlbA5x9VJb0jUAJbifm+LwZuVTh5hnTCCug733Mpr22QSNAb/bXqGGF+Cxz2mxF2j7U94/YHYA5RRgD4/2kqD8KRreWZp8sJd9ZHgmPiE=
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: theqtcompany.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2016 10:44:36.4487 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR02MB1179
Cc: Manuel Bachmann <mbc@iot.bzh>
Subject: Re: [meta-qt5][PATCH] qtwebengine: build examples by default
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
X-List-Received-Date: Mon, 01 Feb 2016 10:44:40 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 30.01.2016 16:13, Otavio Salvador wrote:
> On Wed, Jan 27, 2016 at 12:58 PM, Manuel Bachmann
> <manuel.bachmann@iot.bzh> wrote:
>> From: Manuel Bachmann <mbc@iot.bzh>
>>
>> Just as we do for qtwebkit, let us have a patch to build
>> qtwebengine examples by default.
>>
>> Otherwise, the "qtwebengine-examples" package will be
>> empty, and attempting to add it with "IMAGE_INSTALL_append"
>> will result in an error message.
>>
>> Signed-off-by: Manuel Bachmann <manuel.bachmann@iot.bzh>
>
> This should be a distro option and not enabled for everyone.
>

Also there is no need to do this with a patch, same result is achieved with:

EXTRA_QMAKEVARS_PRE += "QT_BUILD_PARTS+=examples"

Maybe this could be added to qt5.inc as a PACKAGECONFIG option?
This would allow easily enable examples on any qt module.

