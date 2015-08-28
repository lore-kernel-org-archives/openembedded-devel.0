Return-Path: <soren.brinkmann@xilinx.com>
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2on0088.outbound.protection.outlook.com [65.55.169.88])
	by mail.openembedded.org (Postfix) with ESMTP id 563AB71633
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Aug 2015 15:59:50 +0000 (UTC)
Received: from BL2FFO11FD054.protection.gbl (10.173.160.34) by
	BL2FFO11HUB020.protection.gbl (10.173.160.112) with Microsoft SMTP
	Server (TLS) id 15.1.256.10; Fri, 28 Aug 2015 15:59:49 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	BL2FFO11FD054.mail.protection.outlook.com (10.173.161.182) with
	Microsoft SMTP Server (TLS) id 15.1.256.10 via Frontend Transport;
	Fri, 28 Aug 2015 15:59:49 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:33253
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <soren.brinkmann@xilinx.com>) id 1ZVM4C-0006jN-7a
	for openembedded-devel@lists.openembedded.org;
	Fri, 28 Aug 2015 08:59:48 -0700
Received: from [127.0.0.1] (helo=xsj-smtp-dlp1.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <soren.brinkmann@xilinx.com>) id 1ZVM4C-0002om-39
	for openembedded-devel@lists.openembedded.org;
	Fri, 28 Aug 2015 08:59:48 -0700
Received: from xsj-pvapsmtp01 (xsj-mail.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	t7SFxHdx002571 for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Aug 2015 08:59:17 -0700
Received: from [172.19.74.49] (helo=localhost)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <soren.brinkmann@xilinx.com>) id 1ZVM4B-0002oa-I8
	for openembedded-devel@lists.openembedded.org;
	Fri, 28 Aug 2015 08:59:47 -0700
Date: Fri, 28 Aug 2015 08:59:47 -0700
From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20150828155947.GC10421@xsjsorenbubuntu>
References: <1440712214-30967-1-git-send-email-soren.brinkmann@xilinx.com>
	<CAMKF1spGXzAVzKMfc=nvV8ARV6tndHY15g7rj=-HR2z3SMUtNg@mail.gmail.com>
	<20150828080340.GB11673@jama>
MIME-Version: 1.0
In-Reply-To: <20150828080340.GB11673@jama>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.0.0.1202-21776.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BL2FFO11FD054;
	1:NHRHhyMyeUvvyzaCTHuha0QaYdH3TrYsRUhsBUwxw07UpVhtEATN5FYtflpTznE3r6E+Rwjo6zBrb1dPp/BUfhpmaFGyw/TdQhNeT3ovRHWPeZ9LMHLCfTX40ugKul0QyywIT7mn1oAuxPjIxFDIAGXWoiidORymxdD4ISZnBafXhgUCucQdo3BFOyqWAbt/4dHXwC+NcJwlUxXO85H5awmjCn9fuEprmoE2bc4ZbAj0GY0Fq7891i+oIpSLz3i4LFhDT0eB75v08X9Bp3FwBLx6CKIUWRESPJSNXpVR3Gp4zLs1C6VkWucCUYjrGnshivAqZ5MN4gHEnP9cjn5h4w==
X-Forefront-Antispam-Report: CIP:149.199.60.100; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(2980300002)(438002)(3050300001)(377454003)(164054003)(199003)(24454002)(189002)(377424004)(23676002)(15975445007)(450100001)(64706001)(85182001)(77156002)(110136002)(5001960100002)(62966003)(5007970100001)(47776003)(5001860100001)(54356999)(5001830100001)(107886002)(46102003)(92566002)(50986999)(4001540100001)(2950100001)(33656002)(77096005)(2351001)(106466001)(76506005)(85202003)(57986006)(33716001)(76176999)(4001350100001)(81156007)(50466002)(87936001)(83506001)(189998001)(19580405001)(86362001)(6806004)(19580395003)(63266004)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BL2FFO11HUB020;
	H:xsj-pvapsmtpgw02; FPR:; SPF:Pass;
	PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com; A:1; MX:1;
	LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BL2FFO11HUB020;
	2:KujwM+ieBB8q/JOow/4e9oS03/Cazch3Va2ZXsXDeHpxC5Zc8pfpVyDRhI5ntwlbjKVRWCkmB/0V9+aLO4YNxxh+qe64fWpI4hihO0G00AfLlGi5/bwN8fJPi28JxRv+m4hH9+CyfClga9d4iOdnpyOtK1f8g0VWUo+n/WkfzwM=;
	3:znVPiNA0H9EiSu0ID3FgvFTwBig2oScnM034J3rAF8RX/A49auB/p2pCpws0gFxvBg5GdSHLv7emNYgoeaNn2JlpsnVuKf4hvgj7MXlL40PJkFTVbzR3jcr5btnyNWuv3cngcX53QihQAY5jqEjzfKwZhJ6A9pAfgJtCk1FLSjo+Jvoihso3Pi/KTRWvSI1Bh0gElbj9VCA9i5fR3vrxfsh4oyz8kK18h+HdVcc8SoEQqqBd2Ij1sHbBqNKwsY5dBhw+ylKxMTQzqREos7/Cvg==;
	25:uoTaWOUsZdCKOf3TktSsC4JkVXje2enp2uWrfK9GSjo68nyLbmVxm9tAnZIsCLdsGeEyoxHD25P776+ClS6xZk8T9HWXq1ps8h1Zxvso29ujMzMoPUM+X57NPly271uofNGgS9fVsqKafXPqlu3kJLZO8JyPIIbDnCTWO3GF5ORtItsjHF+9+M8BoVxnHHX+d7J7NgZS4Qw6Gj54AgF7Lk/1e+m6tT14fCmM7pUz0/wqFkDBiS8KvopF8O54Z5TlRKOMhN1s5qoDukP/wVGA9Q==
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(8251501001);
	SRVR:BL2FFO11HUB020; 
X-Microsoft-Exchange-Diagnostics: 1; BL2FFO11HUB020;
	20:HoJdfjdmxgsToWnPtfAPX5U9qb1QqniTcbCJ1hVYg4fyhONj+1hnYQBtgyE9r8y0g34vioeiJ6bADDt54iwEqqtIiyVDIC7ZlgR91Iz1UKraNMW/VQm3T9oFM/RcAF9s0iCfj9FNWVueuZ4fXy0nzeBhUtbl7xza91LGx5MbeQQiRIJ/e+V+6hKg3Vc+dgszP3r+D+AiPQfCbViZNEQVGSmit8iftSkgZKrV86ctlxjgmKKVVpQvuogPu5RFChS+Ve1mOp2rtFvvJ+ptyzPtcmFs5eKusbMn8SKxFtMBUg9WSE1yJHTYVcmVL2tfqpQ/ZE1b06T5J+pCRO4rLH6tN3iw3T+da5Fed/HA4ruEFhL2QiCHzF4HhOdOS8ER6FyG735f2InBdNuGRRef7eixI0Cb8QhSf8cDxe9EzhvMtz8aQxChlXmbJ3aZCyb93uiQ9gEvs1zrYnEyafVLGkx8LkeWrw+5UjLWnDaNPBgkBKD+n7mYwcNR4Jw0z1SZRF7u;
	4:mR7PRbduIT2XqYN5NQfUTEKfUk2oKi11XAKIeA08tx5YCsZcR8qjFVm5kcjsognoMWH0totDwXNwClWT6JbNfItE3GHC3EKJ1+DCM6Cvc0BqmU/pHFeAAgr6QjeiEdVJHP8BkBoZiOsP9ARGODrZvNTCpyjV/1/yFOPos/Dr21s18WQeer0H8THBOla9Y18lpMddKK7CckTjvcF5aramoZfSMzivqF5kTL7ufNdJtkY6ed2IhKvg06GyW1n/wZCiDKiUYnO4WZbj71C09SnGNE0wYUIiAu1CFWzsQiUbG1W4HGsWZ8Y9JBpsnsd/RJA4
X-Microsoft-Antispam-PRVS: <BL2FFO11HUB0205696547B1ED33E2B338A8C6E0@BL2FFO11HUB020.protection.gbl>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(8121501046)(5005006)(3002001);
	SRVR:BL2FFO11HUB020; BCL:0; PCL:0; RULEID:; SRVR:BL2FFO11HUB020;
X-Forefront-PRVS: 0682FC00E8
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCTDJGRk8xMUhVQjAyMDsyMzpEb2I4TXBYTUFMSllOOWpTMWpYUjJhMHNC?=
	=?utf-8?B?YjF6M2M5N01sVTBCQ2ZrUTVPOG9wSTRHUHVidGp6U0dRdVhWT0dkN1pGUnkz?=
	=?utf-8?B?M2RiNWx1VjZHMFJ2MG5abUE2a1NFcWRZS1hlUVVLOTgxMWRiOGNVb1V1OFRq?=
	=?utf-8?B?OXRtVGZxYW91RjdrbWl4blNScGFjOTEzZnB1TmlyWjlJSTBLQnZqWG9qTkpB?=
	=?utf-8?B?b011RVAwSW1oNHpFbnE5c201QUYybHhTZWJDckh6amJMUVdKcUZsSzhSNkxl?=
	=?utf-8?B?bHY5YVg3VWFZdWp4ZGxncTF1VUtsa2w4UGJmbTk0VW9LT3FkeXA5dGgzOXh3?=
	=?utf-8?B?SmpUdy9PY0ZMaDN6a2lJTjBOTEc0M1BTdkhHNWFST2gyRFdIS29Cb1FBMnJL?=
	=?utf-8?B?QmM1VW1QZC80VlNPS3JuRU4wK3VMQjdTcUcxOUtSeVVOWnJEVHRrSWtzREoy?=
	=?utf-8?B?R2ZMUzVleDVEZWhtSzlYNkkxTkd0cHAyNUUxNHBsVi9DQ2lrNkowM0JlVjcr?=
	=?utf-8?B?OVVnL0tLcDRsWTJpbVhpUlJ2cU1LYUxEWFdnNDc2MUFrc2JGWUlydGRiNXVm?=
	=?utf-8?B?NkZDZHgzWlR3M3ovNE9aaGdUTEZGMlZ6eFpKVXY5Y2MzRmNtVDdUL2tGNkpp?=
	=?utf-8?B?clRLV1hWL1hHOHEzbjZtVm1VYzRlOGxxT21xN3c0bVRwaTYwWlBzcUdBUUx6?=
	=?utf-8?B?TUIwZExEcWRnZGhyQTJWSENmaEpUYVVXdGx1WllkZE9BOTBPbHZnSXBYcWlE?=
	=?utf-8?B?UEVxd1p4Y2xvQks1YkdZaDZlSEVRTFNHZnl5L051Q3NXM2U3SHhIVWVxL3pp?=
	=?utf-8?B?TGxXc0lqamI3VDRXc2p4MllZWTNZbml2a2hwSEJYVkE1MGhrOUJqR1R1Qlho?=
	=?utf-8?B?REpwU0RQZ1lPYzVsY1BHOXdYYnJMWXlQYWRhaHdRblVqSEpaNG1nT2haMW1h?=
	=?utf-8?B?Z2RkZ2gyRzg3ZzdkSTkvVjI1WXFLVzFKckJHaHoxNFM5VHYrUmlzOVAxWWhI?=
	=?utf-8?B?SnFmVnB1b1oxN0F6am5qZ1lFUDRXeUg3R3V6bHFpV25UZFh4YkQ5ekQ0dWl0?=
	=?utf-8?B?STJ6aC9zRVB0NHhCYVlkUVFGUUlvcjRiUHoya0UvejcyKy8yMkxabHFqREEy?=
	=?utf-8?B?cXBJc0JsUGN0NnBCWkZwdjIyeUtyOVMrQ1g4YXU4S0hWMFRzTXJraFdaN0lL?=
	=?utf-8?B?a2hEMWpQbkhtT0djOEgvMlFFRjVIby8yY1ZUVXVwT3RqYnRZUTJNTGxmdHp5?=
	=?utf-8?B?SngrUjV1NGZpOGlPNVdadjVJL2tQVDVUOWlrb3llTFNuendOak5kaE1QTXZj?=
	=?utf-8?B?MUp2eThmVkhOeXZpandwYlFkS3dmdUFxc2JrMjBVVUtjOWZzeTRqdlV0RExa?=
	=?utf-8?B?bXZRbm55aXlObVErYnI5VjkzZ2xTNVpZWHc3dXBQZGp2cUNPamU1NXNEa0FV?=
	=?utf-8?B?Mk9MLzlDZlFZbGJFditTa2luVEE3dWRaR0x0dkVtZnpRQlNTYVd1RExHOTFT?=
	=?utf-8?B?RmFyWjFYcXdFVUxOS2pXcFJ0RTZZQUE5alV3c3ZrL3JCeWVqNmxMeGQxNkox?=
	=?utf-8?B?NUIzTjM4ekI5MVJEUjRLMFcrVEkwTnh3djZCNVpuKzFBR3RCK3BkcktEbjU1?=
	=?utf-8?B?SWdjby84NFU4M3I2OFY4MDJwNmIwSlhlUWwwSytUWWgvY3E3eW1BUE5nZVZL?=
	=?utf-8?B?Q090LzdBQ1Nobi9JTGR5OGxEWmRZWWUzenh5L0Y3cDNtblp6OG0yM05RcDRZ?=
	=?utf-8?B?U1hhbGJyZnAzR1hxSnJPbmZySFR4RlVlVStwSFFYU09hQWMxV0I0cVJqb2V1?=
	=?utf-8?B?S2UzdGNvZWk3WVkzNXVRRUh5bFE3S3JPeEFIQXhzU1ZXQUJDZWpvaVEyNHc0?=
	=?utf-8?Q?Jg991vQHcFy8=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BL2FFO11HUB020;
	5:v19CC7pgkz/A5G8F+Wy6d1s/z8IVWCWntGtiR6pUPZzHAez4Bn6kPht68MM47uAz6kLaPQmK7gJmxveuKZeXh8BTyKRJL8s5cxySysQ/uKC1PUQ8aXEu5YwK0KyTaaDq41J+eLuQkio27v1i5TRoRg==;
	24:7eW4Tk+hvWyfHvFTp7aumRzalxNOMwaH9/fWLhoMpxRJIMn4718pYiGVrtLBURH1yo9jzVkSON3+hRXDAV50V1zRNNQMPVoZTw/pH7aj1ak=
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2015 15:59:49.0469 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL2FFO11HUB020
Subject: Re: [meta-oe][PATCH v2] Add analyze-suspend
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 28 Aug 2015 15:59:57 -0000
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, 2015-08-28 at 10:03AM +0200, Martin Jansa wrote:
> On Thu, Aug 27, 2015 at 08:44:05PM -0700, Khem Raj wrote:
> > On Thu, Aug 27, 2015 at 2:50 PM, Soren Brinkmann
> > <soren.brinkmann@xilinx.com> wrote:
> > > Signed-off-by: Soren Brinkmann <soren.brinkmann@xilinx.com>
> > > ---
> > > v2:
> > >  - replace 'boot'->'suspend' in commit message
> > >  - document kernel dependencies in recipe
> > >  - pin git commit
> > > ---
> > >  .../analyze-suspend/analyze-suspend_git.bb         | 28 ++++++++++++++++++++++
> > >  1 file changed, 28 insertions(+)
> > >  create mode 100644 meta-oe/recipes-benchmark/analyze-suspend/analyze-suspend_git.bb
> > >
> > > diff --git a/meta-oe/recipes-benchmark/analyze-suspend/analyze-suspend_git.bb b/meta-oe/recipes-benchmark/analyze-suspend/analyze-suspend_git.bb
> > > new file mode 100644
> > > index 000000000000..6932e9fadfc4
> > > --- /dev/null
> > > +++ b/meta-oe/recipes-benchmark/analyze-suspend/analyze-suspend_git.bb
> > > @@ -0,0 +1,28 @@
> > > +SUMMARY = "Analyze Suspend"
> > 
> > If you add  DESCRIPTION with more details it could help folks trying to use this
> > 
> > and please define PV = "3.2+gitr${SRCPV}"
> > 
> > > +HOMEPAGE = "https://01.org/suspendresume"
> > > +LICENSE = "GPLv2"
> > > +LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e"
> > > +
> > > +# Apart from the listed RDEPENDS, analyze-suspend depends on some features
> > > +# provided by the kernel. These options are:
> > > +#   - CONFIG_PM_DEBUG=y
> > > +#   - CONFIG_PM_SLEEP_DEBUG=y
> > > +#   - CONFIG_FTRACE=y
> > > +#   - CONFIG_FUNCTION_TRACER=y
> > > +#   - CONFIG_FUNCTION_GRAPH_TRACER=y
> > > +
> > > +RDEPENDS_${PN} += "python-core python-datetime python-stringold"
> > > +
> > > +SRCREV = "bce3cbec43bc2ce7a8c79b210314dd9d9ac1010b"
> > > +SRC_URI = "git://github.com/01org/suspendresume.git;protocol=https"
> > > +S = "${WORKDIR}/git"
> > > +
> > > +do_install() {
> > > +       install -d -m 0755 ${D}${bindir}
> > > +       install -m 0755 analyze_suspend.py ${D}${bindir}
> > 
> > both these could be squashed into
> > 
> > install -Dm 0755 analyze_suspend.py ${D}${bindir}/analyze_suspend.py
> > 
> > > +
> > > +       install -d -m 0755 ${D}${docdir}/analyze-suspend
> > > +       install -m 0755 README ${D}${docdir}/analyze-suspend
> > 
> > same as above
> 
> and README file shouldn't be executable, use 0644

Good catch. Just fixed that up too together with all the other things
Khem pointed out. I'll send out v3 a little later today.

	Thanks,
	Sören

