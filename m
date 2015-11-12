Return-Path: <alejandro.delcastillo@ni.com>
X-Greylist: delayed 871 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 12 Nov 2015 16:24:55 UTC
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1bon0142.outbound.protection.outlook.com [157.56.111.142])
	by mail.openembedded.org (Postfix) with ESMTP id B8A9277241
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2015 16:24:55 +0000 (UTC)
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=alejandro.delcastillo@ni.com; 
Received: from [10.2.106.105] (130.164.62.224) by
	BL2PR04MB833.namprd04.prod.outlook.com (10.242.196.140) with Microsoft
	SMTP Server (TLS) id 15.1.318.15; Thu, 12 Nov 2015 16:10:23 +0000
Message-ID: <5644B9E9.3070206@ni.com>
Date: Thu, 12 Nov 2015 10:10:17 -0600
From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <CAOd_LFwgMqDUBKzxjs50G+=F0TgFg8ZuoCBX6jqs6p8fLFQibg@mail.gmail.com>
In-Reply-To: <CAOd_LFwgMqDUBKzxjs50G+=F0TgFg8ZuoCBX6jqs6p8fLFQibg@mail.gmail.com>
X-Originating-IP: [130.164.62.224]
X-ClientProxiedBy: CY1PR20CA0100.namprd20.prod.outlook.com (25.164.213.154) To
	BL2PR04MB833.namprd04.prod.outlook.com (10.242.196.140)
X-Microsoft-Exchange-Diagnostics: 1; BL2PR04MB833;
	2:OteYquqYFey2Xtt3bA5JwQfCxcNUnRhD+6FBgcNfDndm0HC7DgyunzTWNlPHi6GikAVe865oX0SZM4d3V99pabnVKfxw5BmzZLwuGBMy4hJsE82beYQPzG8pRZ9C5e+9MKS/jxzKuoGVAgaQwHrewlviS3MDeMkCzTTkKqnw5Vw=;
	3:7WK964J/DLcQtA7u+PaoSoZpeDxv4Yh/6wwxwCbZSnKL/Os4PFpPLAUvfQ66rKLblsgf+uAIkUb3X6SGjfc2GL9MUGs356oeuT0272i1YvoROmgJmAWQ62IeBWoMj1jhVLcpOtKKgTISJzq+0LrMMQ==;
	25:OCOknj7KDiGWQw9ETfFob1YT/e9l9mkahzViO55EndF8qXMazhZOJyw6EdL38LIHiN9RF8lxkotVT3HoerdUnafrJFSRgEHA0goEEZ/548zxpC/qJyTLmJJBXuonXqY1igN5W7rHwmEXooxrTvfPmnHzmP7EUmxGteMW90RzKr1mz5Dw7bbZzfdqT6xR0BK1/k8afnjvbIRqTVSmKTiMOqpe32IwKSNaTUhg14R0S3pw1yB2Tx8RCk3WoUrKe4QJcuQZNdvAI7iaQljC52aOpQ==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BL2PR04MB833;
X-Microsoft-Exchange-Diagnostics: 1; BL2PR04MB833;
	20:N1jEHLEX0Ctr9SWh6KgeoRVlYOTxF4g2MECywUnQ9zxV0En97X87J7/7hWmLX4RdtjGJ+Ooz3Gox85loWm8yt+AjxDVVhBHj6dgrQ/BzCxU0YH2dLhke3kX4uBBZGb0vafgAMiT31MAg+69MO7BX99dsFCZRcmmC77CRjvbW7QwrRZXXZzdCLZiLXvA/0ox7LEksWdgAMwX5X/cufBSJAg2rNb72UUys79YK/GLrrXrP++kEBP1LTaQY/whZfmXkGjd5MZr+GFi8YGuFqNt8lFFDQALLvmorAytVP8muePX0FLKcKS8Qyg5DIIz0QzFBwUF7EH+4uRiWbycRG78RQvF8EObhS+d6EeE2q7jMtBLEbUU6ISklktzhhcHeCMMHv+C/ZoUhHU2A88RvQ186mMK5ckvPWoTgvym/q+61/J07tNvu43+H2hAsk+yGrNRs7CD1+rzM+DpJwbBzJgRBlUcu1nk3rEo8OfnR5wVaf2hjX+Kefbv3LTNuui9pt83iu3VI1Y2LMzZGbQdE/kBdHPciYj6sJjOO7wJlGLPnWZCZaE2H7Tkbnkp5lTZHSQvmNEok5x3+3smyhpJDq3I2ty4tENLDmBGZ2xAgAG7bz9I=
X-Microsoft-Antispam-PRVS: <BL2PR04MB833B2CB3B51BDEC39FC113B86120@BL2PR04MB833.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(520078)(8121501046)(5005006)(3002001)(10201501046);
	SRVR:BL2PR04MB833; BCL:0; PCL:0; RULEID:; SRVR:BL2PR04MB833; 
X-Microsoft-Exchange-Diagnostics: 1; BL2PR04MB833;
	4:V3wZOSZtbtxboZVrBazBFmaIEtIQndys3ag33xGVZbAFsWN6H8i1kbxVY5WVpIk32qnJGKxdSSDk4SGG2UpGL7WqWHaujJ2E3SBwEJEEUy/82Vnw96TlgEQmaanwxtRO0T5htYMQP8kfFvrjfC0/Ui/qdnO4pPz3YEeiWyv0fq//3XqU1r3WwvuSNSZIWFRP7uSKAdQfhMGmwI7jNR4yH4+Mt7Kd3hudXHAMQlRYIt67gddymU2qUc7XVMmDCuXLwlYZKpnBJXHDKGquvQpOAusfvX5xtYbktEJJSNXxNmxIz5qbLFsK5JzH8VZPzbWNBmCEeX+1sezdr85IRkvOQyfCj1tXFXG7p+FJcnQqM5pMTmavNFwqLN0uvGPsn6au
X-Forefront-PRVS: 07584EDBCD
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(6049001)(164054003)(199003)(189002)(52044002)(2351001)(50986999)(83506001)(59896002)(86362001)(101416001)(19580395003)(76176999)(66066001)(87266999)(54356999)(65816999)(80316001)(42186005)(77096005)(50466002)(23746002)(64126003)(106356001)(87976001)(33656002)(5008740100001)(47776003)(65806001)(15975445007)(5004730100002)(450100001)(36756003)(5001920100001)(97736004)(40100003)(81156007)(65956001)(2950100001)(4001350100001)(105586002)(230700001)(92566002)(5001960100002)(107886002)(5007970100001)(189998001)(110136002)(122386002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BL2PR04MB833; H:[10.2.106.105];
	FPR:; SPF:None; PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: ni.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?Windows-1252?Q?1; BL2PR04MB833;
	23:/ytiY51w3d4FCRYSyUkl8z1kptC4JhoiMCzsBW?=
	=?Windows-1252?Q?yNupWKDgEqYCTJV0JQ9JiyXEE1QMvZlp9WruQ9V+sis2nuy3QL1fisDH?=
	=?Windows-1252?Q?pHYuYcfckTMoi34vluKgLm2Z3x/O8xrju8wS2jJlTDbcnRbkKkiYH/Ld?=
	=?Windows-1252?Q?BKsHowGmisUSS2NkTxtv7zhu1ArgSbT0TnkMeGIh6G59Cxieujm+Yr6e?=
	=?Windows-1252?Q?rSgqNXJ454m0enJDf/TSjYibgAWrQ3ETi8SKKuqqcizFO2L4Jh0O+tms?=
	=?Windows-1252?Q?ZqJxmo/b/AS9nB1CU/yq8g6bVS2ZTfLJMQX7MWR7zsAwGULB9uadTp18?=
	=?Windows-1252?Q?AW3QDEQhQgwE8d4xV6LNgt0KhGKUosk3Bckh5Ue0JAaivuiOYBk5ei8J?=
	=?Windows-1252?Q?WGitm0Wn8I5eYxvsG2vtjXFhY4x4viFLYXeHgPziaUxSU/wAm1oVgzfn?=
	=?Windows-1252?Q?REbjMmn4kAiE9HewvKTE+Rz8ZYTj6SekoC4utfJUQdA1AGb+PxN6srUa?=
	=?Windows-1252?Q?QGeZqnTRlhMF74kX6zPvcDr0/KH53NO0JJjb8Oj0CfMRrh6G5bsW2ert?=
	=?Windows-1252?Q?2/MeaeLr6UT4gT44U23nV+2f1gS02B7MI9EQ/t9jkzKE6QIaRTm86d5J?=
	=?Windows-1252?Q?+hZIveIKPhW9vBzvni5vgHf8X4QEjY5I200LRYIX08lk67GheeZOBQy/?=
	=?Windows-1252?Q?QvXj6ETgvRlNQKvkhpEtlpEvdo3jh52CPbmHjGSomgc+ejrO0y2Ttjyo?=
	=?Windows-1252?Q?Sl3+34ZUp38x4LOK5OY1TXKbAEoz/z4GX1hoa7Gl51vbDAIVV78LtHcN?=
	=?Windows-1252?Q?nVPqT+XhGR1VS/ytqAqDTokjM81InOV9lVxT+TLh49LGoAAqQi4zjIBt?=
	=?Windows-1252?Q?GF9cou5GOdh7s6jbW7rSb1cOnRwACWPCDqCs+oXysUZ/L4ISM+CR5BkH?=
	=?Windows-1252?Q?m81DpWfEfJd7NWgm/tXM6W9Zma6iUSm8socCzUciqWIHJjkR+sjp3fpL?=
	=?Windows-1252?Q?Tpo93kmgn4lwtEdeNyHrmRlMDB3q7uIax0FFmKhq6/LFLosiQIiiHikP?=
	=?Windows-1252?Q?Pzu4wjKqCYDj3UFUIaqzuJ5BkiHFQKnjVlHYhP41JBSxOwhp/RoAjjEE?=
	=?Windows-1252?Q?gQRfnlg2iCi+EbYvNFv/8+D53Nbdc0e2TbtrWXNmSTGuzvBeSEkomIDD?=
	=?Windows-1252?Q?0eb0CItYlNW7ZWJ7M+uUBi86yJyfeMTegaacdYymVYwINBKN+xGXuPkc?=
	=?Windows-1252?Q?hmF2WCozaZcX8IVunBHuRErLEb/2cK4Vo/wH6EbBdl0mbJqWq/mJ+Nqi?=
	=?Windows-1252?Q?CMCPvKhIeE9b9f69Ld1dSWebuEKxVd66WPZQSLjrPIUQ4NtDH/oT9DrV?=
	=?Windows-1252?Q?/75I6P3JW/ks31q5XAym+V2Oe/hxd0CIuIk902kJU99f52GOKTKwM=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BL2PR04MB833;
	5:X394EEX5gkfYOzDDC75qWA/kWsAZ/+/yXxuPClw82bEGvx/9Bqzh+dJAu3CQuFKm3fr85LsTuS9HcEypCP38pkh0WyvY3vnsK5WaCZlnM40+//trOGcWH47yt0QW1CKT/REOyGBNrbK6MOVb79Pe6Q==;
	24:BqnY3e2jMKudiIU/SPJrNhT+fT5xoQLlHV7rKrE668T0m2YXVz0brLkM8P4cCkVHkF3MTrSMQPSnnGFb7SfkQiQmXxUR5pzlmRaei8/FqwE=;
	20:Db405kTcDCBVE/AtLozeG3pCUpVX1BRkn71oqsoUfelnbvXCsI3VfMr1F1Yf/KorIjvOfco9pdevaHsVnevDWw==
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2015 16:10:23.4536 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL2PR04MB833
Subject: Re: OE/Yocto developer survey
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
X-List-Received-Date: Thu, 12 Nov 2015 16:24:57 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit


> How long have you been using OE?  __4 years__
> 
> How do you use OE/Yocto?
> [X] product development
> [  ] hobby/research/education/yocto core developer, etc
> 
> What distro do you use?
> [  ] Poky
> [  ] Angstrom
> [X] nodistro or custom
> 
> How do you organize multiple git repos?
> [X] Git submodules
> [  ] Repo
> [  ] Other
> 
> What packaging system?
> [X] OPKG
> [  ] RPM
> [  ] Other
>  
> What init system?
> [  ] systemd
> [X] sysvinit
> [  ] busybox init
> [  ] Other
> 
> What libc?
> [X] glibc
> [  ] uclibc
> [  ] musl
> [  ] Other
> 
> How do you develop custom applications?
> [  ] application-SDK
> [  ] devshell
> [X] develop on PC, test on target
> [  ] Other
> 
> What language do you primarily use for custom applications?
> [X  C
> [X] C++
> [  ] Python
> [  ] Javascript
> [  ] Lua
> [  ] Other
> 
> What do you use for Continuous Integration?
> [  ] Buildbot
> [X] Jenkins
> [  ] Other
> 
> Do you use any any of the tooling projects
> (https://www.yoctoproject.org/tools-resources/projects) such as ADT,
> Hob, Toaster, etc?
> 
> __Toaster_(analysis)___________
> 
> Reasons or explanations are appreciated, and please feel free to
> include additional choices/information you think are relevant.
> 
> Thanks,
> Cliff
> 

-- 
Cheers,

Alejandro

