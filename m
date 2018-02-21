Return-Path: <alejandr@xilinx.com>
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam03on0074.outbound.protection.outlook.com [104.47.42.74])
	by mail.openembedded.org (Postfix) with ESMTP id DBBB671A88
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Feb 2018 00:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=271toRTp9D578qoNKwUhMwCVNFVLj/Na7Ad8hW7R3ik=;
	b=jk31uWstOf51CoO/N3jARVHZN0eYEZHL1eqW/9wWgkLUncrPnXzXKUDNixj6+x+qNu70eKOtNPs7iC15/8a6VgtoQAFaTHswIGUb+fHxBWKQdpadIK9EtFMUj3L5V21fxQZJ9c3x0wLpHms5LModS2NGK03iDDwizXU/boCYvGk=
Received: from MWHPR0201CA0095.namprd02.prod.outlook.com
	(2603:10b6:301:75::36) by CY4PR02MB3157.namprd02.prod.outlook.com
	(2603:10b6:910:7c::26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.506.18;
	Wed, 21 Feb 2018 21:48:06 +0000
Received: from SN1NAM02FT034.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::202) by MWHPR0201CA0095.outlook.office365.com
	(2603:10b6:301:75::36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.506.18 via
	Frontend Transport; Wed, 21 Feb 2018 21:48:04 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	SN1NAM02FT034.mail.protection.outlook.com (10.152.72.141) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.506.19
	via Frontend Transport; Wed, 21 Feb 2018 21:48:03 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:49021
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1eocF9-0007ob-AZ for openembedded-devel@lists.openembedded.org;
	Wed, 21 Feb 2018 13:48:03 -0800
Received: from [127.0.0.1] (helo=xsj-smtp-dlp2.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1eocF9-0005nS-55 for openembedded-devel@lists.openembedded.org;
	Wed, 21 Feb 2018 13:48:03 -0800
Received: from xsj-pvapsmtp01 (smtp3.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w1LLm2N4025928 for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Feb 2018 13:48:02 -0800
Received: from [172.19.2.8] by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandr@xilinx.com>) id 1eocF8-0005nF-5w
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Feb 2018 13:48:02 -0800
To: <openembedded-devel@lists.openembedded.org>
References: <20180221192129.2759-1-otavio@ossystems.com.br>
	<20180221192129.2759-2-otavio@ossystems.com.br>
From: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>
Message-ID: <bd62279e-5896-e416-7768-f52552752b46@xilinx.com>
Date: Wed, 21 Feb 2018 13:48:02 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <20180221192129.2759-2-otavio@ossystems.com.br>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(39860400002)(396003)(39380400002)(346002)(376002)(2980300002)(438002)(189003)(199004)(5660300001)(6246003)(230700001)(6916009)(2950100002)(65826007)(2906002)(356003)(305945005)(64126003)(81156014)(8936002)(336011)(8676002)(478600001)(9786002)(316002)(67846002)(26005)(23676004)(186003)(36756003)(31696002)(2351001)(50466002)(77096007)(2486003)(47776003)(81166006)(58126008)(63266004)(53546011)(106002)(229853002)(76176011)(106466001)(31686004)(65806001)(65956001)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR02MB3157; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com;
	MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT034;
	1:oEIYv9+h2svSVyqkPNcRULXU65SDkCPKliAjk5lSDKCASXRS93bPNydZrKEUuiK4mXkOjBViPHUv9Ptq8KTmz+cY5El2PVBSx3kk6uVD1BXSB+ukMuzH+HJ8M1BwEidB
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 489255eb-34e1-4951-2648-08d57974c90b
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(4534165)(4627221)(201703031133081)(201702281549075)(5600026)(4604075)(4608076)(2017052603307)(7153060);
	SRVR:CY4PR02MB3157; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3157;
	3:+AQuOkjqrWlrz+nj7q2DXv+eCLrICcZKIhF06cP7MHatTyeSi8vzxrWUeOlGMiPoQZP+YJYmVNre6M5YLkL3e5kkYZkO/uFpoS4tHbcH/w4+eS1JYbhXYcRTBzuB/qBCiJ6J3kzVKlYgUkVWzWYYCYRtPP6iIDs3xfMu2JX5uZlhlML05QkJD5oJDCGkt6QIzW6G7pQCQGx0PfrjpE6fWEPxE5n8h7OMgr/LAdbucKRjV/CyfAmNziB3cUki3CIgs3EexPI6vzz+ion+hcefxhbdwgvqkmUvkyV8Y4mbM9vIHSGap8epX3Q4f6QrTii3h0+wKlRFWQkoWjCyrC0tHCJMlNNPlW0zzyvLPfP3R2s=;
	25:d+9COSWRIThEPZnKZiplAXFNfrn9c62m7N2NioHvLW5ZgWDL8ecLbsgXkIUm0FIW4kRM18BvecrhbK5Puck9c/UetX+4IxA+ewAeuUh7SQrvlBr/pLYm+pmgFDOzerSq2Ut623xbss8j1iUR9Ov8Um77MPTlBKe5RzYJLmzgbiK/u6gjV1QhDngH7qCMl/IllmP5lAoOdbeJ493BHedA/tr7w+2mVGFOEjfZwFXauFQiVeNtxpFEF1eUPUlmhVmw/VRIVnxHymeCyqgxEZhmjI72/bsjR0OYlsd0Afhm97wklQY+eKBc/zlPZ/EgVKO6k5pAVQGpTXDTat82Etx9zw==
X-MS-TrafficTypeDiagnostic: CY4PR02MB3157:
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3157;
	31:ig9YNKKw2A9TnuRuASp5M4MwOmvAOH5cdFG17cD1QR1DWe8SXQrpayUyVK1Rj+ApqbGoPYhQvzF65ovQtng2S89H7PLtZ7RwFgRvSjnZl1uINc+Z1t+jcY3js2WpmV0jqIOG1Wu0piVY3yKyX9uQJC+A8mv5kJdPeBSo2KJt6xZAPdy+dKiFskxYBaZsa5nyKQfI6SNBAhZIZy2qqGqSBGvkKHxRpyyDWHr/cU2EafY=;
	20:vmft9k7F4joPYxT+6XpLQcVwHfuf3WO+FsUEmYfaMsz3dirRuv9Y9VDWqWLUHeFqnRQTGz03zM0f7Qj1lRTYIoaLQtGsJey301RzjjTAgiRIMhQo0yMpvs0But6SQIIp3p9STCHOiTLi8/OcbfpSVqKd+x8Gb+VmQXGH4Ltl6pyQlsf1gOWjA57xTTDPSYn5aB21UvuLcngoYmh8M1g8FJ5goHW7DCtRVMuAwPgDFavPNVD74rxjVeHTZICTxhbv0bkAQhTRLFX4nvb4G5HQqKb0N9L8QYzlleg4irNSFq7+i0bbzSi/2NOUYH18gF0T1n/rfJnPfSxK1gjiPpmp3axDNEbKyMnClJOUeBFpRkxy9+W9eaev248N5+qioEYvQUcN2ND2p9HCPeyqQIGriT/mA765Xt5MzJCXjchcGFbADzHKaxeD3eh6KxLL8V83rwLMvnwVdQsCQiGY9CDRhiHnbgV/RDikA08vU6vEBbZ00ZRZiu0fLbPS9Nu/w9gj
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <CY4PR02MB315766B60B8F89D7AA2BD922ACCE0@CY4PR02MB3157.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(166494164430575);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040501)(2401047)(5005006)(8121501046)(3231101)(944501161)(10201501046)(93006095)(93004095)(3002001)(6055026)(6041288)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123560045)(20161123558120)(20161123564045)(6072148)(201708071742011);
	SRVR:CY4PR02MB3157; BCL:0; PCL:0; RULEID:; SRVR:CY4PR02MB3157; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3157;
	4:qbXkorhXZ25xYt3GmL+80sTmY5lLoDMzP9oVReCKl5z0SROzUrR+ga7eFS8FnEGQl3U6aF7fSIo24HDrRmC6WuEhGnO7CtgYIezSYGckdD2bjSoQZGDs7g1x6Zo6mSvVmnPPCAUU/H+DaA8osRLXWMKpuwu5H7Jk9wSbNa8hBzA/2LoLqfSU87q3KSJdQu/y4i4lCb60Sta1JfJS0acpYPjR4j7P9VE0wwwaykmEr4uOZoHSmortdWqeN7658weyqyBS/JfrjtuB9yh5Z1WcKW1ffcqNcIlY23lhi/OlEXHE2iKA66X+j+dIG6LpQmpU
X-Forefront-PRVS: 0590BBCCBC
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtDWTRQUjAyTUIzMTU3OzIzOlB6SkFuREJyVHB1RXgvZ215VW9DM3h3Rmda?=
	=?utf-8?B?ZVdOWEpXRU5FejI2d2xxTWdZdy83ODYwYlcyUThKZjdkbTl6OG9SUVFZWkhi?=
	=?utf-8?B?WGVMMmtjVEFiTE0yMEQ5RGZUYWtFK0NWcmc1bllqRjN0RWpYU0xzREJTY0xq?=
	=?utf-8?B?dncxYW5MUFA2RmRJbXdtMEwwV3lDSTVPRi9hekxMMzI5SXhPNjRKeHNKaVhU?=
	=?utf-8?B?bTJGRi94RlBlSWlvNzMyaEE4Qlc4SnFzLzlJL3YxK2FlQlNmQ2RnYy9sdU5v?=
	=?utf-8?B?YXJXcmhrSVJLL05yQVdLcG1IbzZsbHB1NkczbmJRZ2tJd1VNUFQycm5maG9M?=
	=?utf-8?B?ckFJZCswMythVEN6eS9jVnZBSUNEMUxmR3BjQmJKVzFxZ0h2WXJtZmtBS2hL?=
	=?utf-8?B?ckt4MHBMdVdKUFZRMmQva0dlMWdOZVNCQ3g5NXQrWVIzeGV0MExhVmt2M0Q3?=
	=?utf-8?B?dU52NlVqeWtPTFd1cEIxQmhsai9BZGs4QVFSOGhtbW9BRHpKU0VnUjZpY0Y1?=
	=?utf-8?B?SnB1RHpwOHVNWTNITkU4L3ZwajhQcnlLOUhYTlJ4TElsK1k2azdCbEluRWpa?=
	=?utf-8?B?b3NmN1RZRHBqZXpHMWphdm9LMW1OaTB2ZzNjVTJKTUpTeGpIVDkxKzV1Y3l4?=
	=?utf-8?B?cVFRZzBiYkNTQ1Jhc3BORTQvcDVpYzRMVlVtK0thTWk2WkswZW05SXlOSGlh?=
	=?utf-8?B?YU5aYmltampEYVNIOWw3OXlqQkZKbmFDR0Y2SU5MVzFNbHBXbHFEL1Zab2RN?=
	=?utf-8?B?VXlBRUlUeFVMTnNHOUdhM2hTOUNPVlJDNTZDUThtRmFSY1FUK1VZL2tOT3NZ?=
	=?utf-8?B?aXlDZXFRVS9OaXRRRnNNd3Y3d1RoVzV2OHBMcmkwUkpWMERpc2N2OU05SVMv?=
	=?utf-8?B?a045RHdzWnNQWUphanlaRWV0TzZUS1lJV3NuallDTG9JcCtkVU1qN0FmTm9j?=
	=?utf-8?B?S2pwaVd6OGxFWWptMklrdkYweFZNVm5qL1J4SnhVRWZTM1FNcVlPNGZoTHRY?=
	=?utf-8?B?ZVdkWXJsMFFKTGxFSE9oVG9oeUc2dzB3ZXh4c1ZBR2dNbElEWUtNN3BMbExm?=
	=?utf-8?B?WDB4UHZXeWMrQnQrakNlRHVGUjN0QXNCbnJVM3dwTzJWcENKWjVtcWNvekE0?=
	=?utf-8?B?WWtSb0t5RnRzSURXWUpoUENpRjFlV3Y2Qm5YQkorM3NTV3F2VXcwdGV2MXJO?=
	=?utf-8?B?RHhFUmk1OXhMVHVERlVzTjN2V2dFOXFDMzJlYjQ0MWpTYkw1djRIdVJnVXJz?=
	=?utf-8?B?R3dlQkdKYjhDVU1QeGd2aW9SNGpibmZxdDU3L0ZpUnZ0QTYxNWJCdU43L0xV?=
	=?utf-8?B?UDdOUDV1SkFzRm42aFZ4cWpweGNlR1M4bnZWU1FFUlZZYW1ReHRNSk9ZWnRU?=
	=?utf-8?B?bVVIS1pIamNEWHZMUkkraVJKRHBZYjBvZVplRmo0RmZhQVFUNUkwNnlTUUlZ?=
	=?utf-8?B?NWM2a3NraUxUYkYrNXNmbEQrNzRqeXpkd0R4eTltY3R0UzR2RnZvZHg4dDlT?=
	=?utf-8?B?WDlyOUVEWVhqN0Y0eXZ5ZjFwK2NaY0xkdUh5N01iSkZBRXZ2NzQ5SUtxcExM?=
	=?utf-8?B?OWJqTmFsSmFrL3FYS1IwNTlOTzByU1E9PQ==?=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3157;
	6:SjKKjihpr16O0TLyCIheebpSWRhDRnigLgqNijTgvjV9ca8dZpHoDInlkdmdByECof5Benf/CkXGfV2goSjfgobg9XxGhdnWx8b/pbxFBGQI8y84cZwFjLu3QqrjeUO3pdYyv6GLipFK7d/Nck3nC7oDcWmA5q6hixr6JVv/6WX3S42/EENOtDzdMhHjHqXa1057N+zaJJ70y95KvY5YEB3Wbs8N913GtRRKcVRgwuKzXg7bLyivoU3mQsfSlsxrbolnd8idBflSqXV4CHwO6KA/bCifPZy81R7CbiUtBLmw1YmC8/QemLKh6u9veRHxDTtuKcyXWQsDdqo5HfCed+DheB0ffCYRClOZfzXmrFg=;
	5:G0tU2tioyWH28YApHhbpYmbSz+crvVlyyjNC58a89BUojxGWZOYz16iIPGWMWhRPZaWR1W42ldagHGi+b7hlhcBfp5kca/fjrlPt66Uq7ajNfuInSfuQVRK61yr1eaxYXWWGQYlmERCftjW8DjsC5kpT4UomN0y6NWHMqglD+zY=;
	24:oaqTDAaIiy2jw3rVTyvP74TJXXcrSJ1fWy1SnluAHORWl+0Edrcgz+ol83qvh5f0kO1kP1McKH0ECmz+NHzb7eOQQrKTyloUu4lpimrbbNk=;
	7:LX+7BqngdC3izQHkVB8xtniPlz4l2FxnaDKnpieh2ZAqK45hEJzhPOcawto6jUnI6kboLGZ0doe8Qs5vMPnvE+8gSen5aC28DE0M+ijXYl5O9SMY+hYJrIXe5eVnvzjQgXEINemeR+QBzH7XHsa1Ys2JG2BwMSQpQRxlTYViauMbl9yRTpCFQ54Djzathr6pK+YrvZjAzA66wG4Arco/QvxtQms+jg7qchi14m0+DD05TsjYB5N/zEZn/vB21DIT
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2018 21:48:03.7661 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 489255eb-34e1-4951-2648-08d57974c90b
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB3157
Subject: Re: [RESEND meta-python PATCH 2/2] python3-requests: Remove RDEPENDS on python3-misc
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
X-List-Received-Date: Thu, 22 Feb 2018 00:22:08 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hey Otavio,


Just to clarify that the misc package wasnt removed, it still exists, 
but with the rework

selectors was put on core, so your patch is fine, but what was removed 
was the

dependency on misc, not the package itself, just a technicality.


Cheers,


Alejandro


On 02/21/2018 11:21 AM, Otavio Salvador wrote:
> The misc package has been removed when the python3 was reworked.
>
> Tested using updatehub's uhu utility.
>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>
>   meta-python/recipes-devtools/python/python3-requests_2.18.4.bb | 3 ---
>   1 file changed, 3 deletions(-)
>
> diff --git a/meta-python/recipes-devtools/python/python3-requests_2.18.4.bb b/meta-python/recipes-devtools/python/python3-requests_2.18.4.bb
> index d91d993bf..0a2410f85 100644
> --- a/meta-python/recipes-devtools/python/python3-requests_2.18.4.bb
> +++ b/meta-python/recipes-devtools/python/python3-requests_2.18.4.bb
> @@ -1,5 +1,2 @@
>   inherit setuptools3
>   require python-requests.inc
> -
> -# Add the runtime depends for selectors.py
> -RDEPENDS_${PN} += "${PYTHON_PN}-misc"


