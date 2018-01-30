Return-Path: <alejandr@xilinx.com>
X-Greylist: delayed 12045 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 31 Jan 2018 00:43:52 UTC
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam03on0044.outbound.protection.outlook.com [104.47.42.44])
	by mail.openembedded.org (Postfix) with ESMTP id 597A27885D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Jan 2018 00:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=mG8BWi6WdD9pccXfUElkqWH0OfmGcu9wZu1UC44uZMc=;
	b=4qEQV4tKZksiWjjw78EpzPo2i5MCOrfNdsk0/gCn8SNG3f1apggRUk2b5KxdM18SsaMGMibKL07GW/8k9e2JwgQpIPBPa9GV0K4hQwAaB+4r+PKxeoSCp/r4ggR0i9MKBVak8acfCb+13zu7p/8mwmqVJbBrYPtmkhTHwwNTLfQ=
Received: from BY2PR02CA0122.namprd02.prod.outlook.com (10.163.44.176) by
	DM5PR02MB3385.namprd02.prod.outlook.com (10.164.152.161) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.444.14; Tue, 30 Jan 2018 21:07:42 +0000
Received: from SN1NAM02FT048.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::204) by BY2PR02CA0122.outlook.office365.com
	(2a01:111:e400:5261::48) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.444.14 via
	Frontend Transport; Tue, 30 Jan 2018 21:07:42 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; asterius.io; dkim=none (message not signed)
	header.d=none;asterius.io; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	SN1NAM02FT048.mail.protection.outlook.com (10.152.72.202) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.444.13
	via Frontend Transport; Tue, 30 Jan 2018 21:07:41 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:45908
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1egd81-0007G8-4G; Tue, 30 Jan 2018 13:07:41 -0800
Received: from [127.0.0.1] (helo=xsj-smtp-dlp1.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1egd81-0002l1-0J; Tue, 30 Jan 2018 13:07:41 -0800
Received: from xsj-pvapsmtp01 (xsj-smtp.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w0UL7e9u031221; Tue, 30 Jan 2018 13:07:40 -0800
Received: from [172.19.2.8] by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandr@xilinx.com>)
	id 1egd80-0002ky-6F; Tue, 30 Jan 2018 13:07:40 -0800
To: Derek Straka <derek@asterius.io>,
	<openembedded-devel@lists.openembedded.org>
References: <1517333489-20422-1-git-send-email-derek@asterius.io>
From: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>
Message-ID: <52fd194a-2e72-9fac-3b9e-eb597a4e5ee6@xilinx.com>
Date: Tue, 30 Jan 2018 13:07:40 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <1517333489-20422-1-git-send-email-derek@asterius.io>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(346002)(376002)(39380400002)(39860400002)(396003)(2980300002)(438002)(189003)(199004)(23676004)(65806001)(336011)(77096007)(2950100002)(67846002)(83506002)(6246003)(31696002)(2486003)(230700001)(6306002)(110136005)(65956001)(58126008)(47776003)(26005)(53546011)(106002)(106466001)(316002)(36756003)(65826007)(5660300001)(186003)(305945005)(64126003)(2906002)(76176011)(8936002)(229853002)(356003)(966005)(81156014)(8676002)(81166006)(50466002)(63266004)(9786002)(31686004)(478600001)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR02MB3385; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com;
	MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT048;
	1:/h/55gy2dd6Licy6u/R8ZKEm5N4xocUJOjKcdz0twc7VWUEWr9YSC5CaEq32xSGKrY9kCJIBGySIr2IajOld9XnF7trQH/OXkB37VHzcsdhQMxI1R8AhWPNBq0U1Xz2C
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f9694870-73de-4bcc-5752-08d568258077
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(4534165)(4627221)(201703031133081)(201702281549075)(5600026)(4604075)(4608076)(2017052603307)(7153060);
	SRVR:DM5PR02MB3385; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR02MB3385;
	3:UqiirM+YNH0vpdOjitIfKWtlHcDMUQw5YrpE3ICKmqEJH3dTQvC41zEpclpNKdsGeRE4x5QpstknH0jzNjb3vXcAQZFAkaWX48X5++PbEscpWFeWDQeK6BdS5KsYGyXR/RLApnNPfw9zWpCEvB26ZCBIbPpardgJWPsYD+S0ZGzrZKCnvcr2KXcHsUUcIUfxKWL6d4YrMr5du6aCcQr3Mvpy+TFJKLeNsLIeYaPlEhBvIpOGLr2WALI2ZzURK9BrSWtH8KgNTMyYV5xoeSvFnB5cCPqlrwiTPOkrXy400p3QBFLFFrSgkjjNp/yZMUek0jANNHOwisxx8nfwg3xpWoINAQDxyPDRDGJoFpsK4BA=;
	25:4Xt+P0/B/DxQ/I4X5u/J2dsXyD3QOovouW1Vlqvsv8frMBTyZXjYkMDVOHqVkAp5E8K6E/JvjBRQ3TJr0EgE+6oJb3goS9br46zmnvemvblsY1WmzNC+xbDduKUwUIWPgPyufjWP+t4JtTv/G8ja1MsOFytDHTC2DfBPPSniyAdy0HSqfCg+CSj0XI6ppOc6f7cvVzBVVlvFOrK8Q3dQSTL6I9TBdjg7Cw/xgAu/lbKaoo5jfu58rIKevhrzoIhJYUSVsGRPLUzfJciY1DcU5TBL6UUY5KBgG1ytkedDIlt4qlUf3ESUzDbI0tDcakJVfBAtmVqVeSzqq1q1jeDb2A==
X-MS-TrafficTypeDiagnostic: DM5PR02MB3385:
X-Microsoft-Exchange-Diagnostics: 1; DM5PR02MB3385;
	31:duZCXxDy7iRt1yUv112+ec/yeAzNY68/9hlZCJ7muF9xc03SjXu/JVtn9YR6KUARBYNZnKfDJqaHAOT0vwNc5snGKZz5zM2YrEm9iEmHJy/ez0fOZ3QxchCDffEJbRP5wJ3yuVzK6kROCbD+jrFotX6KpvzabdRqurlHHU0HadqQ35JWMgmE6eHxPJD8sRUYixi7WrGBaebYtFLWa+oyrrOrwULshH/ooqBaSX+nBko=;
	20:ykod17W3HGOzNenkXsW4ZzV+ADGU+LmBJ0iPtLglTDdrX6eV+fWkhkhD/Pmjhn/SV6W5BSmBrbEdyYIwcDBwA6opkpyK/Fvz/D7XIikuHb2lAuJNZp4ek/8Zl+vrs614T8HhSs7LcgyCTIk8zrb8Ny6g/jsLcexWtC92UVt5OFoFh5BgYiDF8gJvQQA2jInlK8i9x0mU+1OuwPz+staGjec0atljyIiWtGKLaCPqm5QbGLab34fFeGOBq9ePzO1vHf0kuGp/yNz5aqzRKX3kfSbnyyDx94SHDpgrAdSz39rqVHqA6twHKZVALzLvO3m97oEiTq3K6GSrWT443qIISZj2+ZTjglibfs5PmPUQr3QxnwwJDn0yJHHpVpf6WPFTuj10kU0S1BBPirFU7Ad09EdgA4xSrJvU51nDUUPclYQ8/aa+xKZxt5POe8U0DAt4s70n30b9Iktpk2dHFRMAP+k0bt28EcU7ZeCC6EAyJY8L8xxsNeEJ9oHbEGQRo9Yr
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <DM5PR02MB33854E023263EF6A637224BDACE40@DM5PR02MB3385.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(264703809997249);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040501)(2401047)(5005006)(8121501046)(3002001)(10201501046)(93006095)(93004095)(3231101)(944501161)(6055026)(6041288)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123564045)(20161123558120)(20161123562045)(6072148)(201708071742011);
	SRVR:DM5PR02MB3385; BCL:0; PCL:0; RULEID:; SRVR:DM5PR02MB3385; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR02MB3385;
	4:+KvEcQSjxpCywye+qqh1vx2viF4VRcmOFV7FhLdoaV/8FLGm+WgnAgBZ9z23nA/D/Z3Kf8g3jFiLgwpKFd2R+hYUB/Ok5PvliIJGIOF0nk4yM10Hk+/dID9RnKmEUxNk9DX/rPKhgGGUxTdR3efDCTNMKpNywazgfKARHHYx8sWqvydZaNBsqVS82oLvpzDgDSKAtpr+hO5LWdve40zp9CLXOsamXVf7ehdqV6XewmGuvYsCsPumQxWphPu3sqFy7dXYFcsPE946G6lHJuUtTQSRsKtF+oSolKZ7shAr+BYZWVXODVPZ9No640m66zz4
X-Forefront-PRVS: 0568F32D91
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtETTVQUjAyTUIzMzg1OzIzOjdFZGJmMHdQM2xlYzFwbThiS1QyVUVNNWkx?=
	=?utf-8?B?Yit1STlwaG9vNUlUSkV3Y0ZSYXI5aUFIUFdmRzlnUkg3UVJzc2J4Zk16eThO?=
	=?utf-8?B?am9sUUdhSnk4R1FlK1BJTVJ4bEtuT0JTSTZKcWE3L3ZyQURjdjlWQTc0bEM2?=
	=?utf-8?B?cmo1ZHR3bTNab1FqOWdqdWhFNm44bW1TemhyMlNVOEJlSlZqUUtjVkVlckxN?=
	=?utf-8?B?RDNiMk9SbXlGN01sYi9vZVNsT2tRczRvRlpQZnVJOWFtR1kxKzBhNHFWTHBr?=
	=?utf-8?B?OXJWRFRjcGx2L2NTT3JIKzhzQ01GZlFCY2Nwd0s2aC8zTjhUVXNUV1FUOUtN?=
	=?utf-8?B?MHB0dVhjU3AvWEJzeTRPQUtHaFk3UjFpQXdWMmJ6bXErbHF0M0dTUjdSUGJ2?=
	=?utf-8?B?SW1wb1ZYR09IcmJUZGZHcFBzOUo4aysxUU9QcHhnekZLZGhKWFR3UG9zVkk0?=
	=?utf-8?B?UitQTGFpZnVvbHU2cmZ2THkxa0FTbnFVN3RHVTAyeURDUVhVc3ZnOHk1S05p?=
	=?utf-8?B?TGlyUlBWVXN3WklETkJCMXV4ZnJhcFpZMDN2UkZwQnVmcjNvbXNZbSsvWjl2?=
	=?utf-8?B?WXh5cS9za1JIcjNOWHh1ZDN0U2hUb2VCakk2VlRDYUdhdndkVnoxem42SG5j?=
	=?utf-8?B?NDdpNlpRTUJjQVlWNURYQWFjWHZLbmVXZDRvQlZQdysyc1ZVK1F4QjBhTmFk?=
	=?utf-8?B?THBZYTdwOGlqalRUeHIwSGY4NXA4YTRvS09YMFlxK0hsb0Z0R1VJQm1TVk9n?=
	=?utf-8?B?MVVsaitTbzc3NkFTUitES2RzWUFkZGN4TE9sSUFTcVBLSENVeXF3b0dEa1Mz?=
	=?utf-8?B?ZDVIVlFNK25peXRyakp6SWdpQ20zUlZIZnNlTE5EbHdBSURXWmRPLzZOL3dq?=
	=?utf-8?B?Z0oyQktEajZUYnkxNkxiMDdwczJwYTI5S09PVmlwaS8xWmpMR09DeTEwWERt?=
	=?utf-8?B?OHQ2ZVNDbitRMHBVYy96M3M5RDN1S3N4b3p6SFRtVFpSUDVTclRmbVNON1lu?=
	=?utf-8?B?b0QyTlcvdHJTbkF0dUtaQnJBMTRiK0hwRzFUV3BYMWwyMkY5NGx4RmNzMG9k?=
	=?utf-8?B?R1o5STF2S21vaVNHV3JsNlA5MTJpOUk2enc0QXk3VEl2clRPVkxkS3Z6VUJz?=
	=?utf-8?B?WGlnbjc5alhVeDRJd0taUGdGbW1QYy95dzhvLzA4ODBWT2JWcmgwL2NOaUdI?=
	=?utf-8?B?U0prQVo5NVhtekh4QmM5a3AzdUtRdHliWmI2czdrakpEZEFnaGZKem5Hckhj?=
	=?utf-8?B?VlQyYmtFcHA2SW01OWQweVRmQVVhUHlESUNOc1Q2ZDVNdUsxTG84M2lUWGdm?=
	=?utf-8?B?WnAxVHNYY0xkbmdWN1cwZ1dEaWh5WWFkL0hDbjFneEoya3IyN29xUzJ1TmpS?=
	=?utf-8?B?NmllRzBnN1JsZ09NTmxIQVZIWG01MVFDa0doWXFrb2xZRHpmdVgyOWp2LzQ5?=
	=?utf-8?B?VTdEdkpQcVFwbmM3QVdmbmN0anVNZE0xTm9ybFNLenh1THV6VHBWRnZRV1l4?=
	=?utf-8?B?VE5YOHduQnQ3ZFdsd2xoL01nTzVsU0hXaGIxWVVXVUdKekhPY1V3Z0ExcVcv?=
	=?utf-8?B?OFlVa2ZMSjFEblUzWTlWNWRTbTNaejdQQXJjS0xIUkEvNnFkNVo3ZFR0K25U?=
	=?utf-8?Q?j8IDzrAm0OmQ0akefy0n?=
X-Microsoft-Exchange-Diagnostics: 1; DM5PR02MB3385;
	6:cvUkuUIzi6d0AMvTnOkdtPXBRwo1BthXyirMVQL3B2FFwyVRPUQvQZeIW1ERjJD3Kx/jETuSW9e99snGRrGiQTM2ZiX3HhJIkmGZguksoOvxEGsGioMZwAdGR+UuPTJLDh1DLH4TkjS3DGDyoZOykaMPD+g5w2K6sNoJjhqc1VK7zywd9rdSzQ5ODT1995lTZevDHkdY4wIC4LzI3GY+GCneDc9UmYOnzwud4srzdZ2v/mNNCwEeIdYDAoMtLRtvBtOuAuxz4Frvk3gtpmnLnl/CA0Mj7YTgYEABsoOYz+0saBQnf/kdftD7QhNqfEbOHmnHAtgtmc2gVYz1PYZ4cO5fA7ZFVacl9o2YK6vYfrg=;
	5:u7BIuzyTCVNuRxQZt+HyQN7NPl/kIaIoXyI0kR+naOBgzfaTZHbLwVXn6agcwA/d5gQ4xUTbiqob/AipXZbSGJBP2Iv5z0fUge3QVX6c7PvQz36xuHx8Frdzst6ZZH12PNhJ56ZgpDA/x3B7tu0K7PG83c+YG9j5Et/B/Jf7veY=;
	24:Mjl5GaxDL0QQ7LujurjU8s+JgX377iFTqfqYM0SqI6R2BwRARai18t57/2jY5XN6Pv4GlSSrVHirQYXrIM9sZJYGEEdUoWHtzU5gW3iZ8JE=;
	7:pwnoTC6nIdVI4JL2ghJsGUqnGFqfnsWywfrbcse61+mar9WAaF3dHMXEvwGDRXPjZgqj0Fz/ySL+H+sGD0nPLe2Dj2EfS3++UE+H79nWJdrlYWAgr75jpIU9sHslbOCWTpjSImmXDuXhm4V9dh2fmZZZENhVPM6ADi2GIJKGhSBEzSL56AQUu4g2BTSKBQe5JZRMj99xPCuL6WNzQJEhrU43KUZimNbLiZ6E1f1IOhftf52Hp8SAiAjTNkbJFZp/
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2018 21:07:41.9457 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9694870-73de-4bcc-5752-08d568258077
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB3385
Subject: Re: [meta-python][PATCH] python: remove python3 DEPENDS on python3-misc due to missing _pydecimal.py
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
X-List-Received-Date: Wed, 31 Jan 2018 00:43:53 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Another good catch!, awesome!


On 01/30/2018 09:31 AM, Derek Straka wrote:
> Several packages required numbers, but the _pydecimal.py file was incorrectly
> placed in the misc package.  The underlying issue has been resolved upstream,
> so remove the RDEPENDS here
>
> http://lists.openembedded.org/pipermail/openembedded-core/2018-January/146808.html
>
> Signed-off-by: Derek Straka <derek@asterius.io>
> ---
>   meta-python/recipes-devtools/python/python3-babel_2.5.3.bb       | 3 ---
>   meta-python/recipes-devtools/python/python3-django_1.11.9.bb     | 5 -----
>   meta-python/recipes-devtools/python/python3-dnspython_1.15.0.bb  | 5 -----
>   meta-python/recipes-devtools/python/python3-jinja2_2.10.bb       | 5 -----
>   meta-python/recipes-devtools/python/python3-pymongo_3.6.0.bb     | 5 -----
>   meta-python/recipes-devtools/python/python3-serpent_1.23.bb      | 5 -----
>   meta-python/recipes-devtools/python/python3-simplejson_3.13.2.bb | 5 -----
>   meta-python/recipes-devtools/python/python3-sqlalchemy_1.1.15.bb | 3 ---
>   meta-python/recipes-devtools/python/python3-whoosh_2.7.4.bb      | 5 -----
>   9 files changed, 41 deletions(-)
>
> diff --git a/meta-python/recipes-devtools/python/python3-babel_2.5.3.bb b/meta-python/recipes-devtools/python/python3-babel_2.5.3.bb
> index 05084ac..0715d59 100644
> --- a/meta-python/recipes-devtools/python/python3-babel_2.5.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-babel_2.5.3.bb
> @@ -1,5 +1,2 @@
>   inherit setuptools3
>   require python-babel.inc
> -
> -# Requires _pydecimal.py which is in misc
> -RDEPENDS_${PN} += "${PYTHON_PN}-misc"
> diff --git a/meta-python/recipes-devtools/python/python3-django_1.11.9.bb b/meta-python/recipes-devtools/python/python3-django_1.11.9.bb
> index ef77603..e1e38c3 100644
> --- a/meta-python/recipes-devtools/python/python3-django_1.11.9.bb
> +++ b/meta-python/recipes-devtools/python/python3-django_1.11.9.bb
> @@ -1,7 +1,2 @@
>   require python-django.inc
>   inherit setuptools3
> -
> -# Requires _pydecimal which is in misc
> -RDEPENDS_${PN} += " \
> -    ${PYTHON_PN}-misc \
> -"
> diff --git a/meta-python/recipes-devtools/python/python3-dnspython_1.15.0.bb b/meta-python/recipes-devtools/python/python3-dnspython_1.15.0.bb
> index 091eb36..ce4dfdc 100644
> --- a/meta-python/recipes-devtools/python/python3-dnspython_1.15.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-dnspython_1.15.0.bb
> @@ -1,7 +1,2 @@
>   inherit setuptools3
>   require python-dnspython.inc
> -
> -# Requires _pydecimal.py which is in misc
> -RDEPENDS_${PN} += " \
> -    ${PYTHON_PN}-misc \
> -"
> diff --git a/meta-python/recipes-devtools/python/python3-jinja2_2.10.bb b/meta-python/recipes-devtools/python/python3-jinja2_2.10.bb
> index 8375f8c..61156b6 100644
> --- a/meta-python/recipes-devtools/python/python3-jinja2_2.10.bb
> +++ b/meta-python/recipes-devtools/python/python3-jinja2_2.10.bb
> @@ -1,7 +1,2 @@
>   inherit pypi setuptools3
>   require python-jinja2.inc
> -
> -# Requires _pydecimal which is in misc
> -RDEPENDS_${PN} += " \
> -    ${PYTHON_PN}-misc \
> -"
> diff --git a/meta-python/recipes-devtools/python/python3-pymongo_3.6.0.bb b/meta-python/recipes-devtools/python/python3-pymongo_3.6.0.bb
> index 415ca9f..5164b18 100644
> --- a/meta-python/recipes-devtools/python/python3-pymongo_3.6.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-pymongo_3.6.0.bb
> @@ -1,7 +1,2 @@
>   inherit pypi setuptools3
>   require python-pymongo.inc
> -
> -# Requires _pydecimal which is in misc
> -RDEPENDS_${PYTHON_PN}-bson += " \
> -    ${PYTHON_PN}-misc \
> -"
> diff --git a/meta-python/recipes-devtools/python/python3-serpent_1.23.bb b/meta-python/recipes-devtools/python/python3-serpent_1.23.bb
> index bc8bfff..1e04def 100644
> --- a/meta-python/recipes-devtools/python/python3-serpent_1.23.bb
> +++ b/meta-python/recipes-devtools/python/python3-serpent_1.23.bb
> @@ -1,7 +1,2 @@
>   inherit setuptools3
>   require python-serpent.inc
> -
> -# Requires _pydecimal which is in misc
> -RDEPENDS_${PN} += " \
> -    ${PYTHON_PN}-misc \
> -"
> diff --git a/meta-python/recipes-devtools/python/python3-simplejson_3.13.2.bb b/meta-python/recipes-devtools/python/python3-simplejson_3.13.2.bb
> index d44bc15..38f406c 100644
> --- a/meta-python/recipes-devtools/python/python3-simplejson_3.13.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-simplejson_3.13.2.bb
> @@ -1,7 +1,2 @@
>   inherit setuptools3
>   require python-simplejson.inc
> -
> -# Requires _pydecimal which is in misc
> -RDEPENDS_${PN} += " \
> -    ${PYTHON_PN}-misc \
> -"
> diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.1.15.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.1.15.bb
> index eaa0090..86cf9ed 100644
> --- a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.1.15.bb
> +++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.1.15.bb
> @@ -1,5 +1,2 @@
>   inherit setuptools3
>   require python-sqlalchemy.inc
> -
> -# Requires _pydecimal.py which is in misc
> -RDEPENDS_${PN} += "${PYTHON_PN}-misc"
> diff --git a/meta-python/recipes-devtools/python/python3-whoosh_2.7.4.bb b/meta-python/recipes-devtools/python/python3-whoosh_2.7.4.bb
> index 8ad1c17..5d8af30 100644
> --- a/meta-python/recipes-devtools/python/python3-whoosh_2.7.4.bb
> +++ b/meta-python/recipes-devtools/python/python3-whoosh_2.7.4.bb
> @@ -1,7 +1,2 @@
>   inherit pypi setuptools3
>   require python-whoosh.inc
> -
> -# Requires _pydecimal.py which is in misc
> -RDEPENDS_${PN} += " \
> -    ${PYTHON_PN}-misc \
> -"


