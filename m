Return-Path: <samuli.piippo@theqtcompany.com>
X-Greylist: delayed 4634 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 11 Apr 2016 07:34:53 UTC
Received: from emea01-db3-obe.outbound.protection.outlook.com
	(mail-db3on0140.outbound.protection.outlook.com [157.55.234.140])
	by mail.openembedded.org (Postfix) with ESMTP id 558696013D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Apr 2016 07:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=digiaonline.onmicrosoft.com; s=selector1-theqtcompany-com;
	h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=RaDPC9za28kwsyhWNcSxFss7o5VttT5Ibcv/psRO17w=;
	b=HvSJ1+vj3A2rKpnT1wnnwYqN6vFsLfqeV5kyPDZ+d0FeTlO6fRsH51giElLWn7MiEkjZfT+sPAhIK1P4V83LANOcfvbWwk6kHHmOhhyIdSiRs1U8kbTZHubxHgQVufr3lk9289eO1m9m3Ng+XKa8+cUdz3XkbawMxNXCpLrjAR0=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=theqtcompany.com;
Received: from [10.9.5.47] (91.217.248.11) by
	HE1PR02MB1178.eurprd02.prod.outlook.com (10.163.173.148) with Microsoft
	SMTP Server (TLS) id 15.1.453.26; Mon, 11 Apr 2016 06:02:24 +0000
To: <openembedded-devel@lists.openembedded.org>
References: <1460317290-4787-1-git-send-email-schnitzeltony@googlemail.com>
	<1460317290-4787-32-git-send-email-schnitzeltony@googlemail.com>
From: Samuli Piippo <samuli.piippo@theqtcompany.com>
Message-ID: <570B3E08.1070908@theqtcompany.com>
Date: Mon, 11 Apr 2016 09:02:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <1460317290-4787-32-git-send-email-schnitzeltony@googlemail.com>
X-Originating-IP: [91.217.248.11]
X-ClientProxiedBy: AM2PR09CA0011.eurprd09.prod.outlook.com (10.161.22.149) To
	HE1PR02MB1178.eurprd02.prod.outlook.com (10.163.173.148)
X-MS-Office365-Filtering-Correlation-Id: 68602a02-b3a6-4eb2-c421-08d361ceda7a
X-Microsoft-Exchange-Diagnostics: 1; HE1PR02MB1178;
	2:2ADzJQWZUbxj2CJ8PJ00XUltORiDKkY5EhXj9AhD34kt/YTUWaZ30B6JMo8/h7QO/GryOrjyjEvnhpKs3yTmXYB05jG7MRGkEeMMGhlCeTOoVsh3lUf+3Xy1U7W/lBeg9D2QAgDyzwvT1FY17JaSDx89Grs86DUnsyyanJGTro7MvaOJcbkgt4GLP8te5gLv;
	3:rS10ewwAmru71kvtZLvlG7JZ1Zss15FO4eComr2cF0e7A/Pq6C6iAMa5RY08zZulZKCDk7whEMi562Djs3f1kpC8zx/r1Jjp/EifOvJt6sI59R2mtb1Vja+nAYmNrxQG;
	25:vDhpB/g891+AAi+/0Za3NToO7MLWHl+EmGDViX3VEM6F6dY4Ww7Z08eeEYaH7TlDeKEgk43S8AtUx5v9MnRcZj1nsFC14/jSBkb8wF8DeblzLum91/i8Sacu96O5hbZ3nB1x0xyFWPtcI1n4QQcztRetpc5ggZ7ni28ggigz0iV1F7uFrqo1El4opq8hjnKwaQnEMqq/58CNpb/Vo93qQ1bdL+BO1xhSekvntpvDcnYAcgf+R0FYV6M+KRp37Dn3xcmk+ZLbci969+B4rG3PEURnKhDDnFxcCwoLAqgrfPPi2+RW9ky3aF+LsinXLqYJYw/bk1wbfe1BLeJszuPZ0Q==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:HE1PR02MB1178;
X-Microsoft-Exchange-Diagnostics: 1; HE1PR02MB1178;
	20:3jb8kHNqjIUAgCWj/o40BPJJE0lz1FOuW9DD5aBuxfXE3Wj57HXKOVopRIooSTooELvvDSsHGmN8LOYLP7rNyvFQs7JiSu9ENpBHGAh+tUaq3Dm93+2nWgw+C+iBkW4Bf+Ll8peevpzVTKpcGcq2RJ35KwJQfC2ZJBlzz0UwSlaEDKj6WuGk9I9kDMr46SWnEV6r2oUq2iTi3u3GchzT2awe1DAuvFTKO21TymvjMFIPiLVlBuc6mpQU2YHb+9FSHpkq0HbDWiZjPFJprFDepvGVE6LZ8EBs6XNVFAVr6S+fIEhhwpzKmypGgLhwfzRMp64UVLBoeCR67CXrlJG4J9lMQAE5mudL7x/5dy75bzkbW0dY1Y3u3YTa7zZRG4aMw0V+saxn2GzlSmqDMbWlI+/RJUZr22s3JhDJ/PQ3psy1OtUOCp28pvLdF0R8Ul3Zrxo/TR7iSzGrS0/C+TejsrLQgf2F3kzWXixSvw7nw8rRe+C23n84DQ5fqtd4wh0q;
	4:nFJw+2UMa3A8iYQbETERVW4JR1wMLck1X897gWjDYet9o4MRy3WEk/3OZdbGEebDAupRNFaXCZlRZmInf0ssUEgEcW9MoV/aD0wu7KXJ8wJWZGw1gAaOZho3ejIBU93v2gbCalULtpkHhDGI8znTaPgPD0T61FPFKTXm96OLwu8QmTpa1g82sDePE+jDqBUyJU1LoL5eSrrd8sRnqH6HFRO98tbN+6kqL1s0VL1wWCDllqZY14rg/ka1tDLmPA+rhh1bf9SBxDMcMpUAebjTJnq6Zo0JXtEyO2K5tb2oEZLOZDcA6QxFVjFsabTwqYWiyvZhGMZgmx25T/1KfR+NoDoVDv2TsBjWprHOsBHIf1b64NUHsEKHBSAUgWDBODwS
X-Microsoft-Antispam-PRVS: <HE1PR02MB11785592D1488CABE02BD2BB90940@HE1PR02MB1178.eurprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(8121501046)(10201501046)(3002001);
	SRVR:HE1PR02MB1178; BCL:0; PCL:0; RULEID:; SRVR:HE1PR02MB1178; 
X-Forefront-PRVS: 09090B6B69
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(4630300001)(6049001)(6009001)(24454002)(92566002)(77096005)(5008740100001)(4001350100001)(47776003)(19580395003)(19580405001)(80316001)(6116002)(42186005)(2870700001)(3846002)(1096002)(586003)(2950100001)(2906002)(33656002)(65956001)(66066001)(86362001)(87266999)(81166005)(450100001)(23676002)(36756003)(50466002)(5004730100002)(189998001)(54356999)(50986999)(76176999)(2351001)(83506001)(59896002)(107886002)(110136002)(7099028);
	DIR:OUT; SFP:1102; SCL:1; SRVR:HE1PR02MB1178; H:[10.9.5.47];
	FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtIRTFQUjAyTUIxMTc4OzIzOnVsU1VXcmZFbUxibm1PVHYwR1B2aTgxcHFI?=
	=?utf-8?B?c3Z0WGVGSmVIL01EczNZRW1Wd2E2cTJJK2pTSStURkRKWG1mNjdiZ0duTXhw?=
	=?utf-8?B?cjZJbk9mdUxwYUJWU1QzQXREVmovWFN0UkRCNDdvaDBsTUxBNk93LytUV09j?=
	=?utf-8?B?NERqN29lb1FTREpDeHdIYXRnUXhxcnRwU1VPM3FaYjZXWFA5RmFoYVZOS1Nj?=
	=?utf-8?B?dnUveTdqcDFSb0EwSithR3l3NVVLUFJIZDIvQldKaExRQUJBK0ZiRE5YeEw3?=
	=?utf-8?B?TkVaZlI1YmVVekhsZ0pMdnJOdE1TNUpzWEE4YmtpanpqK3paeEd5SitrWFZJ?=
	=?utf-8?B?TjYrTVRMUit0dnkvaWsvdkp2amxqcWRIeFZ6V3Y3MHpzb2lHUzdKdm0rVXhJ?=
	=?utf-8?B?OUpJdEFJSXQwbXgwSlBvNkhXa1BMa1g4RXh6ZjZSQU15M0Y5QndlWlpTOHB1?=
	=?utf-8?B?akVYTDhOUjJ4TVRvWWpibmNEZU8ydFJBOENObGFYcC9nSTZuWGs0K3NXalpZ?=
	=?utf-8?B?dnEweUpieGVBU3BsWlNVSW9SSkdHV1FHREs2MEFvc2cvREtEWFFaamxEWk5v?=
	=?utf-8?B?UVFDS2ovYVlNWjdYaG9OZjlqV2dDRlZWdFZJVzB1emZFSmFxMHRFOWZ3V1Vw?=
	=?utf-8?B?dGh4SDVMZytINVMrcyszdkY5aUlGQUFHdjZJTHRMTUl6VFlZUGFPMVpkQStN?=
	=?utf-8?B?dFdmSUYvQ3FzdHJ2RkZuVTNHQURrYi9xTDVkQnF2VGxkZjlPdW1UZDZKQ0Vi?=
	=?utf-8?B?UWx2VnkzTXFBWFJUVTZ1NlhlWDlWK2R1QkxDaGM3aGp5N2cxcWNoVWpXUHN1?=
	=?utf-8?B?eXFScThxMlVXTy9STEE1ZmtXeE1ZZ01oSHRCbjJCNXNPMng0YmpWR3VBN0dy?=
	=?utf-8?B?NnJuMEkvMElPZUszVUdadlBJdzJtc2I0YXp2QUZoUy9mSXVuM1NVUkszWUNm?=
	=?utf-8?B?V1RMcjlSRTlRSFljWGxSa2w0VHl3OVR4c2dwMkZHOVYzUWZNMmtKRHFaR2hZ?=
	=?utf-8?B?U1NNMXRtWjhqajlqYmdUTlZ5dWp4QTc2TUVuWE5uZG8yK1FuNFFuUnROMThT?=
	=?utf-8?B?UkU1MHNFQ3pzMEtuQkEwQyt0aEZYM1NneTFIK3FSejlrY0RyL0ZFdnQzcmtL?=
	=?utf-8?B?UU9wYkRGeG1SZlJxMG54aXMwU0M3cEtyTjVUMkIrZGZDNkFOdEUvRnVoWDBN?=
	=?utf-8?B?YVpBZnFmOTNmSHJHeHI0eVdidTNKdXpvMG5pRTRTOXMwT0N4L1FqbGxPOFlL?=
	=?utf-8?B?Y2ZBdDdwTVIwYm4rZkl0TjA1alhQdnlhdFh6VHVLc1RaN3pwei83YjB2cDhz?=
	=?utf-8?B?Skd1K0hzZlJzQ1RUSm1qd1ViL2J5dm85TmJhLzVQUFBaazdKV3R3VkYxNFQr?=
	=?utf-8?B?Q05Zc1NxZzdkbzhOdEtxRThrdEJ6OWJ3aSt1N1R6MUU4NS8yK1NlYk4xbEx6?=
	=?utf-8?Q?eMgipEQUeX25fdAjI2SNWhMmL0S?=
X-Microsoft-Exchange-Diagnostics: 1; HE1PR02MB1178;
	5:cBCu8P1Y4DR4FC5lA4QXHiRpESMoQr7t0Ki0+XcSq3ckYzCo1nI2MoJq1UWk10vradEIgv3KwVAzM0FLG2qCsvIsJWUd66VE6vz0X4V4gqk5KSBkM5oXHBRBAxXPyO6B40PWTHDvF/Wx56In20teGA==;
	24:RPWdFCCxaAuqTRLTiGMqY12TDwdZSwZ4TBbLklQKCq8jemAiIdQll2X4XPRvkFMC2s1VAljyJaIfSfUQocPa3+mah9PhdhIR9QywxLcZML8=
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: theqtcompany.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2016 06:02:24.3664 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR02MB1178
Subject: Re: [meta-qt5][PATCH v2 31/31] qtquickcontrols2: initial add 5.6.0
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
X-List-Received-Date: Mon, 11 Apr 2016 07:34:55 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 10.04.2016 22:41, Andreas Müller wrote:
> Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
> ---
>   recipes-qt/qt5/qtquickcontrols2_git.bb | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
>   create mode 100644 recipes-qt/qt5/qtquickcontrols2_git.bb
>
> diff --git a/recipes-qt/qt5/qtquickcontrols2_git.bb b/recipes-qt/qt5/qtquickcontrols2_git.bb
> new file mode 100644
> index 0000000..41c781e
> --- /dev/null
> +++ b/recipes-qt/qt5/qtquickcontrols2_git.bb
> @@ -0,0 +1,15 @@
> +require qt5.inc
> +require qt5-git.inc
> +
> +LICENSE = "GFDL-1.3 & BSD & LGPL-3.0 | GPL-3.0"
> +LIC_FILES_CHKSUM = " \
> +    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
> +    file://LICENSE.LGPLv3;md5=8ba7f2099d17d636d5fcc8303bb17587 \
> +    file://LICENSE.GPLv3;md5=40f9bf30e783ddc201497165dfb32afb \
> +"
> +
> +DEPENDS += "qtdeclarative"
> +
> +FILES_${PN}-qmlplugins += "${libdir}/qt5/qml/Qt"

all /designer/ files should go the ${PN}-designer package, since they 
are not needed in the target.
Should be added by including one more level of subfolders in qt5.inc

> +
> +SRCREV = "7fc567eda8a187e365f4c29c6e8f08440bf31218"
>

