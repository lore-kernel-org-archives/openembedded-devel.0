Return-Path: <soren.brinkmann@xilinx.com>
X-Greylist: delayed 928 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 27 Aug 2015 22:06:03 UTC
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1on0063.outbound.protection.outlook.com [157.56.110.63])
	by mail.openembedded.org (Postfix) with ESMTP id CF36060043
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Aug 2015 22:06:03 +0000 (UTC)
Received: from BN1AFFO11FD016.protection.gbl (10.58.52.32) by
	BN1AFFO11HUB013.protection.gbl (10.58.52.123) with Microsoft SMTP
	Server (TLS) id 15.1.256.10; Thu, 27 Aug 2015 21:50:09 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BN1AFFO11FD016.mail.protection.outlook.com (10.58.52.76) with Microsoft
	SMTP Server (TLS) id 15.1.256.10 via Frontend Transport;
	Thu, 27 Aug 2015 21:50:08 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <soren.brinkmann@xilinx.com>) id 1ZV53f-0000aa-W7
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 Aug 2015 14:50:08 -0700
Received: from [127.0.0.1] (helo=xsj-smtp-dlp2.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <soren.brinkmann@xilinx.com>) id 1ZV53f-0001gT-Nd
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 Aug 2015 14:50:07 -0700
Received: from xsj-pvapsmtp01 (xsj-smtp.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	t7RLnffK016695 for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Aug 2015 14:49:42 -0700
Received: from [172.19.74.49] (helo=localhost)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <soren.brinkmann@xilinx.com>) id 1ZV53e-0001f8-IU
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 Aug 2015 14:50:06 -0700
Date: Thu, 27 Aug 2015 14:50:06 -0700
From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20150827215006.GM32210@xsjsorenbubuntu>
References: <1440470514-26608-1-git-send-email-soren.brinkmann@xilinx.com>
	<20150825093136.GA2459@jama>
MIME-Version: 1.0
In-Reply-To: <20150825093136.GA2459@jama>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.0.0.1202-21774.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BN1AFFO11FD016;
	1:3aeqOBzcFqddvq6fqcQHTcsfZ7mZ94KhV0lyI23Ei5HvTWybhKDvgt++nMSBob2jECCmQek07jVxJhNyeE4CyxHWNoVFXZYqNc5BCHVP0zKY7ZQMMFeDS3U8OjNXvoGbg3vtVGSHLSTDFmOo3JXMAhdiLphF8d6d3H5RgjoE9OLQ+jSuEk+e+ovuQvbyX0qlrp17vqR3Da8MrmpDJL/+qzPLXHTe0L/ORof/QZ17suC0ixNad/pqGUihqozb1liAkiSQxkiKJZTa7h9a7SaUoHIbRhJdAcJA3G9fXuCcw0RzroiF/6N2YGboBdXx/cSfWF3R+qjMLlQolqWYeM3rrA==
X-Forefront-Antispam-Report: CIP:149.199.60.83; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(2980300002)(438002)(3050300001)(377424004)(164054003)(24454002)(189002)(199003)(5007970100001)(4001540100001)(4001350100001)(107886002)(5001960100002)(189998001)(23676002)(110136002)(81156007)(5001860100001)(5001830100001)(64706001)(47776003)(33716001)(76176999)(54356999)(50986999)(46102003)(2351001)(106466001)(57986006)(85202003)(86362001)(76506005)(50466002)(85182001)(33656002)(83506001)(63266004)(77156002)(77096005)(15975445007)(92566002)(450100001)(2950100001)(19580405001)(6806004)(87936001)(62966003)(19580395003)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN1AFFO11HUB013;
	H:xsj-pvapsmtpgw01; FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com;
	MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BN1AFFO11HUB013;
	2:09IMr3tvWAqad002P2u01um8uLxwcdZpQZ9Woa9dKvNQavfMeyGGFTAqf1N04x88hAxvtmM/JDNk5xIszhNnMwarIEzOIllMmrgnuHEyB/CsCI1yiYFlV0NyorKu54zFIueBtuxLFPbSdSv7hpseZQTFCdvFz/U+eEHPhWMAhTU=;
	3:9fm9cu4M3HkFBcxO87Lu+Wc5/gkUyE208b3tym4zHRn62EGiN4wN/VAPGmA+8BWpIyEx89K5aTWjTUT6fMXkXjuGfhFeAeW5IVIRiNKF3dHRLm5zQYkmEqSHTJKuXdCAXcDV+lsNl5fTHa/jOIJ/P+z9kbfUnyM5SbhMA0ob1ppdRz7YXiV5UwvoZofAiK0VzrTz+XIOR70+wY+v5lsShB/rgQsKsbMQOSurnAou8CKgOteWIemWzEQfSiRfpqz8Nf0o26pYRATU5h8ldRqD6Q==;
	25:1iVFw8MLf3lJgsLAwp8huk9IusGu2JB/TFgVtSY3MfVf77lzFc1pmBFwqc1Nhb1yoQXNmxmGydXvEl7/NeFUILAI1YAilORDEwIp+J5i5z+jcT666ULPY7HmETyTdHvaDAQtlHm2CxJl+I3x9kFthg2RGVXjwaUTVGuz55G8/ZYN2bRDTT+45OnZp1gzdcip4VAFiYZHrOF+1MPJf8oYznXWN3riPzg/+yQDvVYQYaSsByHzztrm5TtLe8mtLBbgUXmZl+5x/G99zi24ygivMg==
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(8251501001);
	SRVR:BN1AFFO11HUB013; 
X-Microsoft-Exchange-Diagnostics: 1; BN1AFFO11HUB013;
	20:/CJjE6AX84ocYqhhkNSG9bqMVj4MpvZpnEiSYobeBCT97zJOK+yoL1q1JahpGxcqzJKWu7KOcK5ZqYeOxOQ/7Qii0KWYNcoGrwtGJPc7tYJK2GYTT+x25kDuSeL1WQnTbiSfRGPfgJYC441y4zFhUj0AcMLF02H3b7hp2NMCJuHaaTf2i9uV+jXZEtx+Os+XBzkJ+if8CPBoR0JlCKNLA2nPOox8BRq+3uBiiGQPyJDU2j7S8S7dyr5esjRZqn70I7ln8C+uazmlPuJ5LtcdNH9MsFDxTvD6rtCRKs+xqFrJBlEiHlWujaVNRYEOMYBoAmmSzKYNeI/51rwRhPHlVK159Bk18Lm9Nei8GPVIuw9xKFnILXZCEr3d/SaD4kYBGtmG0o8LRZGWrQRLQiAB76gwizl0mhSEoHTgm/hrcIf5sWpKPxC5X4Pq+w/Tjwp9td6FcvZWNSsN0L60zVJVRmUUFZxKrKX72d3jgIt+u1wiqhfGzp0TbEB9hC6H/sft;
	4:cDxynbvx56ucYJrr8KAExGc9JKt2iNJx17bIWhzSwtqChZa+x4Hwcrfcpfgc/go4k9df4E5CWAoNAXHEKYGzP7cuEvqS7TI4ow/zLybXF9IZFhNIj0uXzPg6k12xIdrkrrYjK9MFHS6BKbSYRD9VQD+AWLPGPU9YU89Le1I/z/MvTcRCXAFcwyBJ5sP84FXtPSpjZwW/HaAiAa1RDXEVEvZ2aSPSg9r8T6OtW61s/mnxDBvF0M2+P2X+MKQRoXBCb6XJC+RiOVRiPcwCXB77VII2UVj67zAMUUQjvroJ3ALarauTp5DYVY1FORyEndhH
X-Microsoft-Antispam-PRVS: <BN1AFFO11HUB013CB4547A7017335CDDDA98C6F0@BN1AFFO11HUB013.protection.gbl>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(8121501046)(5005006)(3002001);
	SRVR:BN1AFFO11HUB013; BCL:0; PCL:0; RULEID:;
	SRVR:BN1AFFO11HUB013; 
X-Forefront-PRVS: 06818431B9
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCTjFBRkZPMTFIVUIwMTM7MjM6cGxQcU5BYWpQRkFmaWYxYytUaE5KMzha?=
	=?utf-8?B?S0ZVZnJ4VlpyeHJobVB2eHE0NlVNdjJjME1ld0xneHIwRFJnYjhDVXlFUjFC?=
	=?utf-8?B?K0Y1NmEzRVUvWHk5WDZqb1pIZG9pN2JPRHl2THlKeVBSTEdPS0ZmVUxyWkpX?=
	=?utf-8?B?bWFsZFhaaW9ldHU0MzlrZ1RETFN0MFl3QTg0cGlwL1hzdTRRV3VHN2t4Qnli?=
	=?utf-8?B?bDZEVy83VFBQZ3JxSmZUc0JBTUdtKzBhYWlMWjJlVlBRYjJQZHJ5YWlEUDFv?=
	=?utf-8?B?a1QxckczUmlNajdNYjU1dG5UWjI1dElGOXhJMnFSL2ZSc1pOZ2lFSzRJRGhy?=
	=?utf-8?B?bjhnSVIyc0VubjE2SUM5ejg1dWYzU1UrUExoYWJvRUJ0RGxTbytMbEljU3kv?=
	=?utf-8?B?UmZMa1d1dXlZUGt5Z3R0UE1Yd0JvUDZLcFZ5NzNTUktJTE1EMm5FYUUwMzdX?=
	=?utf-8?B?SSs3QlBkanpWZnorMWVxNTFwUjkzcTl0VWNhZXJHbVN5N2VCcUtKdTdWK2R1?=
	=?utf-8?B?Z20yZFFBUFRJS3dTSDZEa3JSZ0R2Y0QwN0ROSWRsNFVHelhCZmhaeDRMbUIy?=
	=?utf-8?B?QjZFeVJqWXA1K1prUi9CVFJXbExtK3VSVkFMQnpGeVQzK2pSdmNXL1hrRVFj?=
	=?utf-8?B?SlB4bDZtUVhmamZKUkZIYkxaQUswTjlLN0czeVY4YlJzVy9iM3NJNjNKNzN5?=
	=?utf-8?B?SmJmRFVmYWozL0VUQXc5NUlhUzR2dk1GNndnYUMvSjhNQ0U4VTFTQ3dLa2NG?=
	=?utf-8?B?QmNpQU5NQmQremVkdHlScUhtQXZFM21Pd3lZYmRnRGZlZ1ZZemZBV0NsSkR5?=
	=?utf-8?B?bkplWXlWRkNiWXhRUFVYdUUwWmlPWjhXWWFHWFNqWTZodEJaVENHU3MzSEZC?=
	=?utf-8?B?UEFHM3cyS2V1bWx4dzJLUy9DK083cGNQWmM2c1FMUEZodUZRcUR3clVjeEpN?=
	=?utf-8?B?NlpoUERyK3RoUDJGWlZzems0bEhZY3BIeXluUEEvS1RCeTNwZi9vZENFRjVh?=
	=?utf-8?B?Y0syZkVBZVhqalhvTzA1eC9QOW9ic0YyRURHU3pZendpZTYrMG9scVF5MW1J?=
	=?utf-8?B?NUNWbnFwTERZRDlrdEQ4Zkh3ZDVjRnpUclB4ampuUGMwc0dzWldhenBQZGxR?=
	=?utf-8?B?c0hScUdaOVhkdmlXQVpiL1JDMUUzRWRyeEROSGgzUEFBVktLOVJwRDgwSG1F?=
	=?utf-8?B?NVdodnlrTGdVSDM0QVN3NkZGU2h6VG1rWlZlYnNUU3BiOEVTK0RzcCsrMHJT?=
	=?utf-8?B?UU1GMnZjZVk2YWo5NDliVGp2RG9pbzA2YTZKN09NMTFBcVFWMWVUenpUUHlV?=
	=?utf-8?B?MStyTGlkNGsxYy8yUDY3aytwOGtOajVwVlA3a3NLR05qMU5Oem4vTTVEZCtN?=
	=?utf-8?B?THZSMWdtcDhxY1R5YVE0ZnpXZ0lySGxzTm5iRmUvd21WbGNiNlFrVVMyTXI3?=
	=?utf-8?B?MTRoOGNYMTQvNk8rbUdpZGRSOFNCNFRkNGpSSTc4UXF3Z1FtQmExMlVvN3h1?=
	=?utf-8?B?N0hXSDRsMTVBTlNQdjltOC9IZElIOWtnclRVL2dyRlZPd0lhNEl3bkM3ZDhG?=
	=?utf-8?B?b1ZSREJad0srRHZQWENibVNkMVQzZ281bElIZTBCb2JWUTZtSTQ2ek5YVUNP?=
	=?utf-8?B?Z1NwWUp0UmFJdFlVV2ZYeTNTNDdzcjZjYnJiK1BsSHp0YU1wc2RYdVBJakdO?=
	=?utf-8?B?eXM4dklQbi90TFhHSkNuUWxrUVNHSVN0c2tqNGVqOG95dEhPUnFuaFdvdEVM?=
	=?utf-8?Q?RN2wVr5VX674Y4aIQFzhJdkGdH3zNVQL4EOq54s=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BN1AFFO11HUB013;
	5:hz0QQn9Pp673IBdlnhfEIBN6M6umUMC77oPCTRuYmhkqWDVIXRFxu8D4WUlRxgFkDs4QuP9PZbXzug5VGMvebQUVauouLzB3+a08h8b6BTUM9Yhld/ZHT6b+h4yrkHwLBVFhqhDt44sURY9mSrxlSA==;
	24:E5MHFUGcs69bgWPCQ5cRi+hlaqHRiCZMepdvZUqs8GIzWKraCxyzXoJgtVQd3gaEoFrmOZmvs34w990XaScBFKCZjibCuceOc+5eaBjV9tM=
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2015 21:50:08.9023 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN1AFFO11HUB013
Subject: Re: [meta-oe][PATCH RFC] Add analyze-boot
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
X-List-Received-Date: Thu, 27 Aug 2015 22:06:05 -0000
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Martin,

On Tue, 2015-08-25 at 11:31AM +0200, Martin Jansa wrote:
> On Mon, Aug 24, 2015 at 07:41:54PM -0700, Soren Brinkmann wrote:
> > Signed-off-by: Soren Brinkmann <soren.brinkmann@xilinx.com>
> > ---
> > Hi,
> > 
> > I saw a demo of the analyze_suspend.py script recently and thought it to be a
> > nice little utility. Hence, I'd love to have it easily added in my OE flow and
> > was looking for an appropriate place. I hope, to have found an OK location
> > with meta-oe/recipes-benchmark?
> 
> Seems OK to me.
> 
> > Apart from the location, the tool does depend a couple of kernel configuration
> > option. Could anybody provide some resources/guidance on what the best way for
> > specifying those would be?
> 
> Just document them in the recipe.

OK. That's easy.

> 
> > 
> > 	Thanks,
> > 	Sören
> > 
> >  .../analyze-suspend/analyze-suspend_git.bb           | 20 ++++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> >  create mode 100644 meta-oe/recipes-benchmark/analyze-suspend/analyze-suspend_git.bb
> > 
> > diff --git a/meta-oe/recipes-benchmark/analyze-suspend/analyze-suspend_git.bb b/meta-oe/recipes-benchmark/analyze-suspend/analyze-suspend_git.bb
> > new file mode 100644
> > index 000000000000..8ec3076ba186
> > --- /dev/null
> > +++ b/meta-oe/recipes-benchmark/analyze-suspend/analyze-suspend_git.bb
> > @@ -0,0 +1,20 @@
> > +SUMMARY = "Analyze Suspend"
> > +HOMEPAGE = "https://01.org/suspendresume"
> > +LICENSE = "GPLv2"
> > +LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e"
> > +
> > +RDEPENDS_${PN} += "python-core python-datetime python-stringold"
> > +
> > +SRCREV = "${AUTOREV}"
> 
> NAK, use known-to-work revision.

OK. I just pin it to the latest available.

A v2 is on its way.

	Thanks,
	Sören

