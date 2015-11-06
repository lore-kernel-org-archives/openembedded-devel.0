Return-Path: <samuli.piippo@theqtcompany.com>
X-Greylist: delayed 919 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 06 Nov 2015 08:43:34 UTC
Received: from emea01-am1-obe.outbound.protection.outlook.com
	(mail-am1on0117.outbound.protection.outlook.com [157.56.112.117])
	by mail.openembedded.org (Postfix) with ESMTP id AA79276E70
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Nov 2015 08:43:34 +0000 (UTC)
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=samuli.piippo@theqtcompany.com; 
Received: from [10.9.5.47] (91.217.248.11) by
	AM3PR02MB1169.eurprd02.prod.outlook.com (10.163.183.147) with Microsoft
	SMTP Server (TLS) id 15.1.318.15; Fri, 6 Nov 2015 08:28:14 +0000
To: <openembedded-devel@lists.openembedded.org>
References: <1446473021-20957-1-git-send-email-samuli.piippo@theqtcompany.com>
	<20151105194617.GF2556@jama>
From: Samuli Piippo <samuli.piippo@theqtcompany.com>
X-Enigmail-Draft-Status: N1110
Message-ID: <563C649E.8080107@theqtcompany.com>
Date: Fri, 6 Nov 2015 10:28:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <20151105194617.GF2556@jama>
X-Originating-IP: [91.217.248.11]
X-ClientProxiedBy: HE1PR06CA0083.eurprd06.prod.outlook.com (25.164.28.179) To
	AM3PR02MB1169.eurprd02.prod.outlook.com (25.163.183.147)
X-Microsoft-Exchange-Diagnostics: 1; AM3PR02MB1169;
	2:hiMIUtJbvi2NvRc0Yi1RAqrZETjl4QZee4mEM6t7CFDg6FUaKQGj7EY9XtA9w9dQRbBLL++Ok/Fi5K5xSrfr/B3wMXBizVDiVwCH1g6au4B2ZunMcmUr/hDOLNLbBCw0G+rO0Kw8yb20Igg3C5GFJVQ//Q3CcRGfIXvIRyklJhA=;
	3:rAjSVN2VvR9svRsR7GENtGn4HEQK59MyJxuk+JTERX4M4gaMuTlfklRuJZmwM3EEKZmFr5pYDCtcJiPWbi4iRCPofIldguI9Mu+kQjBIPOVMYdiPTUTsWfy8THjicklfQWsamIUqPMHwxkKlAL8xLw==;
	25:vignVlW+vp5yj/45Gtg300nULyToLVj0PLPSN3ynomQyN5QdMFFQRY94Ow41zcNgc0aoEPckmExe4f+2CRip9jbNuqMVFVWJEvGhgLlS+6ymPiepASYZLicv4D1lCmosePMe29uOn9N+wAf0WfPLk0hKy6nN4dAxtpK0xEIWgUnFkgK9AA5i2Q8L8TK83AZkdaoZyOGG54jNw5xNgDREmhUpKJmFS2X8y5aIUrU8LofV/6uowtEYDIWQLRA0XsR2
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:AM3PR02MB1169;
X-Microsoft-Exchange-Diagnostics: 1; AM3PR02MB1169;
	20:z4/Yx2dzt9OHoa8wUQV+Qs+00hvdoj7k2BYOtj/w1qImuEgTY8dKaId4eSSH7tUWZuKULl77ymQklCCngTKqIlCuJfMbWPDLkF5zVTEXb1iqmBeo5LxRV0cuQKDnDCIKPXrPyOiQrC/xiMbDZpvEQpeaVxjybfbpdgbbgXDaiTdKJ9Kjg+tGfsk83xE1xCObO+jb7pEVlH89A5qoN6wBsyN3wqHfnN/mfFo34vpixgHXzvQh9skc4eiWGQH210Y6Ef3f+7NTnkfXimvEo7BqnwDLwagYJ1II4cYBvx9v9QscX4mKcdn/P7yQgn0gY8Z1MDc5mxZB6Uacyh1UeThP6Oeb9rBLhdw+yBlxXoVY6hhkCLaGvSVIepiVd1UqPcTVkO5VuNcuLWgvOpHGCJIT+S0HsiawPB1s8rhbDTrtRR+TQTdOqI0S+V5C/domnHWqZEAMXp1LBJjYJnbSBJRMYqyCtPA6QQxTjbNXpy4IsY4jKqN6LkHDrJIFUuIBc34c;
	4:OgOwdvl9T7WhuiKL4+JhbKAuHCMFN41scVi4mUEGGNGO9hOX1cyuqtWQeTjFWpFIwT4VGm0eQdq+cqBXPzh6bmTCQOC2TwzTFDvNIHgmE/mras2BROLwGxenZbSSNye7Nz1Nj/1hy5YumXEDGfVPOF2gO7e2D2laZXptcgNhXyurRSP+L6lVPKwzfc0r4rMi1jRtUl2Ax7WaTWvtSmX+JuksGSfKR9YSCbQwug9mKUUIKbDNDpaHj1BXwjrqESgoJXA2wEjIzBRtlI69eZAwIlTGapkRjO6+cr0PiqS/jvboaVY4yclm3keR724AF7/aJmFyeYpJ3ERceP2GS21iY++ahYhvXoVk/0S8GWY63WfThcUkivTOCcmIOujRqVKl
X-Microsoft-Antispam-PRVS: <AM3PR02MB1169139A2E20FF58E00713D790280@AM3PR02MB1169.eurprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(226695750432114);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(520078)(8121501046)(3002001)(10201501046);
	SRVR:AM3PR02MB1169; BCL:0; PCL:0; RULEID:; SRVR:AM3PR02MB1169; 
X-Forefront-PRVS: 07521929C1
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6049001)(6009001)(199003)(24454002)(189002)(36756003)(230783001)(575784001)(47776003)(42186005)(59896002)(101416001)(65816999)(2950100001)(4001350100001)(50466002)(122386002)(5008740100001)(15975445007)(65806001)(23746002)(65956001)(66066001)(97736004)(1720100001)(40100003)(110136002)(76176999)(54356999)(230700001)(87266999)(33656002)(106356001)(86362001)(50986999)(81156007)(105586002)(5004730100002)(19580395003)(450100001)(189998001)(64126003)(5001920100001)(83506001)(2351001)(5007970100001)(77096005)(80316001)(5001960100002)(92566002)(107886002)(87976001)(19580405001)(7099028)(3076002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AM3PR02MB1169; H:[10.9.5.47];
	FPR:; SPF:None; PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: theqtcompany.com does not
	designate permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?Windows-1252?Q?1; AM3PR02MB1169;
	23:+Msog+1OwE559dt2SQIJ4hmuG+7HK2saocQiY?=
	=?Windows-1252?Q?YF/adzmUkf1qbZYdtnAXSFa2M+l02kYFE++fmzMcMKTTs65+TZ2soXs4?=
	=?Windows-1252?Q?60ldLdCrVjw9V8JMNYqI5VlherUmVb4QC5UQd1cr16leg58eW2z13XTg?=
	=?Windows-1252?Q?NJh/8AoEx7UfagFk/q73eRSiQoePzICIRRNwa2wZRRxyV2qsXV8hkCgu?=
	=?Windows-1252?Q?hj3DHqtuvre3L+MSiXvAbfHkr0zw5ZLLXtlWDyWKR4z7evJPkwyfaypp?=
	=?Windows-1252?Q?naVI5HUl1nTHhnOBufIkod61xBa0/CuYLZ/mdYkWrPiBKZ30DBhHYkTx?=
	=?Windows-1252?Q?e4LXg6hSv7RuAHPqP4OHZ2nQpKzuc0baDRzHMQrS0/0105RY0f9hjShE?=
	=?Windows-1252?Q?OzD28kKdOMzzaSJvn7vf+HrhjqZ5MGBhup68hC2oHHy3OKnOra4EbP0K?=
	=?Windows-1252?Q?K6yAgh0z31VLauaRYU8pINMbIbsc7ltkY0LrWcqd5v6c8QpXNjDvRZVD?=
	=?Windows-1252?Q?8H6TPsPN6r8gQznP6Mny1gEKvUvrUDnNBpcaHqyMxBbqVRi85e6MUX0J?=
	=?Windows-1252?Q?QgfosaoK5UoRpw01BvSK3OaPr3mSrnb9+dSb/msxTHAyRffC+fmxpzgS?=
	=?Windows-1252?Q?WXnhfwMd/iIl8C2qyfEQSL+/44zYfpTB1uNpZNDQ/btrOWCbV4jfF7k/?=
	=?Windows-1252?Q?Rrx0gdfnVpOz1CnUeXwf/WYwDTtF7yDVihOZzVQMXXx5pWQ27r55AcL3?=
	=?Windows-1252?Q?bpKQL4OklxmPDiQzuiDwb8HJsMQejnNHg74RTY4IZ6WDkbgxNsGx/GdY?=
	=?Windows-1252?Q?iLmnx3/lxQMPHOSBPzJhNSQLw8d4wpqIKPLH+zIg7mtFWD86ky9h5iyW?=
	=?Windows-1252?Q?pq8hucFzWftUM+AStcZFSy88A5WSSFcxoLDe9fbgSRxqqcrJYRRGCkUB?=
	=?Windows-1252?Q?U6jKDcv6oZd5jwzXqtujwo9SN94fzPiapGex+uHLX4wdvIScqo5a+SfH?=
	=?Windows-1252?Q?QflWcEQI5EunfLilknREskcHVorCUjPjNcIPaPBXDevIG8BwqfTghV2W?=
	=?Windows-1252?Q?RCNAAP9RBq8dAn77YFZ1y0Zg7hGw4VKS6iXO8TNEPXPlzTmp214dvRtc?=
	=?Windows-1252?Q?MGUfyGl/cOSSevwHXm0CURkeh7fIsAIUdYBlkXYLRckxZ61BIb4aDzQT?=
	=?Windows-1252?Q?f/ajJKPUOu30t/oE9tPJLTBNUFcECEcjJh0RReV7PscXRmIc8zWCXGcJ?=
	=?Windows-1252?Q?Z8QW0J3r6f8wkl2biRxDcEW2hJcuhjEFdK5WrkHnhy3QizF/v5EKKAlR?=
	=?Windows-1252?Q?Ch6DvoycWMMjA4oZvuTj16UGHVMD/s9c/bUVReEfcskxAemquvFHXJ/f?=
	=?Windows-1252?Q?nLT2d1SxlQsvX+TI0XEDLDImfXrtzPc9KEGX6mc++nwxmfohXhM1cDVK?=
	=?Windows-1252?Q?eNpLRqgXilrhpIhHXUugvaHynF9TNvXL0NBSSVs41ts3bt0LAjblx8eu?=
	=?Windows-1252?Q?QTg6fvh2CJmb65qsQrjwXrrilRdDNOmJYa4ndPFJ3BPR4nfrA=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; AM3PR02MB1169;
	5:iCrUEEc3ij0cAQoFS8B9evLYR10wEERt+pbEyWchsOJXdxwDybIvOYSoZ40z+fsX/nLDmEo2frMHMaYjGbLGv4/gj7wSeOW9j3Oqiaka8Q16ofFmSM3twfbvHeME8shJBdDSdpyzMG641q+s9BD9hQ==;
	24:17lcFmYJ5zRO2c1uCnRaSm8ODxBPk1K7vYzDrxRQ/X/sfk/tTKMqkw9vFrhEkR8tpbma0vHduxuyA4hjMQr41TmCe2BwnJPYKR28iUF/vqQ=;
	20:LwrB/QdFmdy3NVP8dgo16i5X9z+J/vIW0Sp8G8cc8Al3CsGo8Qs+ugbsROkOUhD1Dbq43IIxKQExgZxiYttyrg==
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: theqtcompany.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2015 08:28:14.5269 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM3PR02MB1169
Subject: Re: [meta-qt5][PATCH] qtbase: include oe-device-extra.pri unconditionally
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
X-List-Received-Date: Fri, 06 Nov 2015 08:43:37 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

And even more confusing when using qmake from external toolchain. I'll 
prepare a new patch for this.

-samuli

On 05.11.2015 21:46, Martin Jansa wrote:
> On Mon, Nov 02, 2015 at 04:03:41PM +0200, Samuli Piippo wrote:
>> configure parses through the mkspec, but does not handle conditions
>> at all, so oe-device-extra.pri was not included at configure phase.
>> For example QT_QPA_DEFAULT_PLATFORM had no effect for configure.
>> include() is conditional and won't break build even when
>> oe-device-extra.pri does not exist.
>
> And now every log.do_configure shows:
> DEBUG: Executing shell function do_configure
> Cannot read /OE/build/owpb/webos-ports/tmp-glibc/sysroots/qemux86/usr/lib/qt5/mkspecs/oe-device-extra.pri: No such file or directory
>
> Which can confuse some people.. :/
>
>>
>> Signed-off-by: Samuli Piippo <samuli.piippo@theqtcompany.com>
>> ---
>>   recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch b/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
>> index a9c448d..d377921 100644
>> --- a/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
>> +++ b/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
>> @@ -240,7 +240,7 @@ index 0000000..d0a4166
>>   +# for the SDK
>>   +isEmpty(QMAKE_QT_CONFIG):QMAKE_QT_CONFIG = $(OE_QMAKE_QT_CONFIG)
>>   +
>> -+exists(../oe-device-extra.pri):include(../oe-device-extra.pri)
>> ++include(../oe-device-extra.pri)
>>   +
>>   +load(qt_config)
>>   diff --git a/mkspecs/linux-oe-g++/qplatformdefs.h b/mkspecs/linux-oe-g++/qplatformdefs.h
>> --
>> 1.9.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>
>

