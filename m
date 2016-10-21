Return-Path: <samuli.piippo@qt.io>
X-Greylist: delayed 36063 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 21 Oct 2016 23:23:03 UTC
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0101.outbound.protection.outlook.com [104.47.2.101])
	by mail.openembedded.org (Postfix) with ESMTP id 475C171A9B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Oct 2016 23:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=qtcompany.onmicrosoft.com; s=selector1-qt-io;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=gSQCeHgamwxWdZjTLmJojHfGHvGKAHJ1d7ZEEMZXRuo=;
	b=QTzMiNlDxwLIN3A6euTgDOoOhpeFQLmKEf/lpxq+KWWVmZeCok2h5hn3bxYg/S+3Sm1SjlCR59wrN5Txaka+2GJQ+gyLYHffZGlsm7sHMSGI4+DAp+/hPs1iv0LKu7s/murx6N2ZHiseoqTSv2HYIIvRQkfds21BkfpUUozkfVQ=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=samuli.piippo@qt.io; 
Received: from [10.9.21.51] (192.89.120.53) by
	VI1PR0202MB2736.eurprd02.prod.outlook.com (10.171.101.138) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.12;
	Fri, 21 Oct 2016 06:47:00 +0000
To: Otavio Salvador <otavio.salvador@ossystems.com.br>, Otavio Salvador
	<otavio@ossystems.com.br>
References: <20161020164624.12103-1-otavio@ossystems.com.br>
	<CAP9ODKpCA6tuXf7Kv=RA5kabS85ju50zt8zaCrzu0kXm6CnvNw@mail.gmail.com>
From: Samuli Piippo <samuli.piippo@qt.io>
Message-ID: <9d63d09b-a249-6a77-197a-15f84f2bce44@qt.io>
Date: Fri, 21 Oct 2016 09:47:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <CAP9ODKpCA6tuXf7Kv=RA5kabS85ju50zt8zaCrzu0kXm6CnvNw@mail.gmail.com>
X-Originating-IP: [192.89.120.53]
X-ClientProxiedBy: VI1PR0601CA0021.eurprd06.prod.outlook.com (10.169.128.31)
	To VI1PR0202MB2736.eurprd02.prod.outlook.com (10.171.101.138)
X-MS-Office365-Filtering-Correlation-Id: 999d8092-991b-4217-1fa9-08d3f97e0f39
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0202MB2736;
	2:YPBKIp6oKAuS5TZ7S8rEI83xdh8BIQtQm0IfhMgrMh+p4QGAWNu9gdyDoxOx4Sc33tHx8dgCwLbCkUS3xlvI7rpYg7WdOdN2ZdP2wEpw+LC6VbANGuIPE9LNlcnAj0sD3636UyLR5JNaoyXqxmOBu6nxgr3Yz5wQfGLUyb+tD3cvoZ1lO84RyfgkrMy3HDOu0IlQSDJK/EB/FOeLPkG/Gg==;
	3:WLHSsJaLmpseII8YYqSNDVXh8QV7/PBeFitSU+7XE/sEDypSUuOLHWbZ9p+y+YSE4i6pvs1MbhksnhfCk1CS02sfYck9RQK8ljN8ZkxAJ8Bp/H0SuOnmSvx7k+sRe3RGimPdbyE9fTLl7x0gISiaMw==;
	25:4j7d7T5J6SDfDGyYSfPweeTAI/2GR+Ztkg4VGlOimy1SRBYr6Kbx644ovVUQ8sGYPh/hls9qBWtseMgyMG3LeBTrTtrVqburvWbceCmTAz/F1nL9+K8kGPiJnLYY+REIXbQIoxh07m2xxKrsFoQ0sEHROEbvjAipBzLrGRk9k5qHGM1gYoHCnN1sExSwVU6Zg1DHqUT/jBIso6aVsf5YUQf39R8FbWxhkYn4s9m0Gjwiz4kCePwlJt2ZYltzF5XE2TNZEjIEyY8S5XuBcBVdOqumZmKO4j9MMawBqc/UWBEUXl56v55w+A6Mf9rxR/BtB+13WBnBKPGyBvHRtVCix1iPVbfknoo6apuTvLxVZSYX0zmA1OBC9kF1TdRAnMPEkffNXCtvm+Aok3CDRnYzcq9MSZPjVrfQP19VnarN0et7YAXIr8aLHca6rV3lyHdO
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:VI1PR0202MB2736;
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0202MB2736;
	31:yaqWVZNJ6FYTQfWxFqNUTFg441+WMtNIZ7bAa2SAxuu6gp6E95TxNDE2lrUixd1gxUeZE5mUjdD7SVrjR1mVMGZ9qnF/OltfEDRAEx3YEcikoi6YSQ9oD2mXjQJyjet6CBfgASGJe6Y1uvGXrzSy0ToljGKw5ZIHZ6zCP5aO64tD0CmAQ4pJ07Ic4MlPG8TndPmaMQ28fqIjLfw0j+0iTsaVg/nNCxkvQ1zUzbSA+waYA4Nyvi9+0bjwNrtaWGbt;
	20:IlN/+InpfxkHrpU1RpB7575Z2uSoAd4lOVbe9ekOSt7xKEwWphHw90ztOXck92ElbUu7tOTcoz8mSyXZT630pbCto7jU668a+bcsG4xa74Ab2AUVRpRoHajhsKNb/WCAaqOloT14+k0Jujx0xr9qXsgcSPZYrCKRlvYPJNuo4R80rR+7ML8koDQ3/XdlVL5RgeCDF6e5CFlgo00N1clttP2s/Or8OIpZcL/E+Kint0E70e7C2C0MeJzE9YwjD8VS
X-Microsoft-Antispam-PRVS: <VI1PR0202MB2736212D8ACD7F722602F2FCE9D40@VI1PR0202MB2736.eurprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(166494164430575);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040176)(601004)(2401047)(8121501046)(5005006)(10201501046)(3002001)(6043046)(6042046);
	SRVR:VI1PR0202MB2736; BCL:0; PCL:0; RULEID:;
	SRVR:VI1PR0202MB2736; 
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0202MB2736;
	4:/GG26Ury9qPIvIDRWxvfr9QeSzH++mMien/FfX7+W7Xoze1ulz0VdK+2nVeLZ9vyUSePbZ5tMZOnsvlEf8TxrS/78wFv8m9/fgYcOxdbIIoqQ7Ohy00Tw5mxEwpF+3N97mw17ZmoDc52sno0JmuLByhmw6I2U0qVRRQ63Kb+zXMKRTH28wscGoT6Gj/HiCqttU2h7P8d5yW1wksRje/UL8/7CMBLrKOjkb6fur3XThGWVZ95vii4Wgt/+BksnP/x21skyc+M9+Qi5VxwdQMMsA1+I6fPynbZCnMgCZBl1OMGNgKq/MTdyFC78QWPbdg3Q6414lEwUyhLU19MROIGY3ssv6b+h1SvpmZlBsoJh9giePXDKlTQv1H36rV226W/H+3xEFGFryB28Q2Y6TmoGsG0Ap/pnPXE5V5djHGXxRPU/BxLjsrQ820t6qfcGgKV+M4zgAoQwSJL/uoHKzb0OjpsFPUV+Z/AUyhp9lRBOJg=
X-Forefront-PRVS: 01026E1310
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(4630300001)(6049001)(6009001)(7916002)(189002)(377454003)(199003)(24454002)(65806001)(4001350100001)(6666003)(6116002)(305945005)(5001770100001)(86362001)(23746002)(7736002)(4326007)(65826007)(81156014)(97736004)(3846002)(81166006)(7846002)(19580405001)(77096005)(66066001)(107886002)(74482002)(586003)(92566002)(19580395003)(189998001)(8676002)(65956001)(106356001)(42186005)(4001430100002)(105586002)(230700001)(50986999)(76176999)(31686004)(5660300001)(64126003)(2906002)(33646002)(68736007)(101416001)(83506001)(54356999)(47776003)(2950100002)(50466002)(31696002)(36756003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR0202MB2736; H:[10.9.21.51];
	FPR:; SPF:None; PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: qt.io does not designate permitted
	sender hosts)
X-Microsoft-Exchange-Diagnostics: =?Windows-1252?Q?1; VI1PR0202MB2736;
	23:MalGCUIcjOG3KMVrvZLVOG7fPRyA20H4zjO?=
	=?Windows-1252?Q?RyYPtpM+osUP4D5ABLf4mmw+9GthXHqJ4WvpfyLEw5UNX93n+YX3s+zL?=
	=?Windows-1252?Q?XvUaUQMETj62E2Zphoan0wPlIWmAOU2EhFhI1fftSWtVQTp8DwC4xD6V?=
	=?Windows-1252?Q?TetRx9y4uKfZoEdHFKK+FqL5jjEksG8azaSxXLLJ35JtRXBA6oYEieCW?=
	=?Windows-1252?Q?0ABAD9ir5Pj9pc6jMqwsEt2+JuiMTePoFyp0S3WhnO2uUMjsr9Hpqutt?=
	=?Windows-1252?Q?9MCSVCvxHEPNFzGli5iIGZ4i2EHFk3MKOK0K5rxD5UAy5ZHtWrkFdMqx?=
	=?Windows-1252?Q?dnX70z6dD5AycnZAPQpD8rWVWYrjGsfN7K40amft9beLonuX1dJtHKdR?=
	=?Windows-1252?Q?2V0fZ63EzVnbt8AhJ6rVAYMuja9vTwMmtE6mpkBw/RMMV4+HR9f8/aEr?=
	=?Windows-1252?Q?ECPvny/6XJlj7hhagvzyj6EQDjzl/nF+/AE08NOLmzpZzyJloEhymjI5?=
	=?Windows-1252?Q?LWubvodeDpFQayO+E9t7sGZsxeYrE0V3PlT9O5QxMQCz1hdjxSselbA9?=
	=?Windows-1252?Q?fR2aJU5idtOS5331v0zHN46qZLIKKNuozl6H3+zSxvQONd/kiTFzLaR6?=
	=?Windows-1252?Q?Gri41Uulv4gMdyTKkfxrfTq1vpRR9wXIVNA4p8b5+/wvK0G3ZTGZy15A?=
	=?Windows-1252?Q?CqhZYNyDMG0zhPOuuwl1f+kzWRU32F+0HpTSKAekAD/Je2GQqy3x+s5W?=
	=?Windows-1252?Q?BBQRIUe+1N6Pm0vYBobunKzxzZjY2mkGOTpoqhcBSqh3SabytuKtjOyA?=
	=?Windows-1252?Q?qibB/W26czM51fUXM3603IjvaX7nFWYAeq3UugQpVOuOZmizCT4udQJX?=
	=?Windows-1252?Q?nNnRvdv4xE1cxlfObOaHoEOu7X5KklakTPRZzjbACNtN0TefzfFPu4Qd?=
	=?Windows-1252?Q?Kpuhc1Wvyjo0hr9JIR2HtUEfUsrEO426w8c1NGgy7tSyP83XlArrn6yT?=
	=?Windows-1252?Q?IFaoGI7Jq3BtopaljhMdzxRXVGx8p9m66PJDy3fsdUQE3sj/HR7YVIAG?=
	=?Windows-1252?Q?P5iivUuUvvamR6VkJWKQyC8XWWHrVNEnbGPzutI+fnmxlCHztl8sIrJQ?=
	=?Windows-1252?Q?UgPBZNQUBtcePr0LoicfDnFJaQHE9SEkd5Tld9wriF7Ak1gwpUdrsWUz?=
	=?Windows-1252?Q?3TxB/XcM8pCDeWB6uV04ZQ6jPD/G4GIP06oc9PR3y3ULXSa+TUE6PjTE?=
	=?Windows-1252?Q?VE8S5+ZbkESGfg/XeFdyEFeqCIcI/Dag4umu6kFUi7is8NAvVYJFF5uJ?=
	=?Windows-1252?Q?9usuBR/hoMPSHvvXW+4l8ikOAmqwdZSZz+JaMBLTOCt6O1zFaZxx9HVr?=
	=?Windows-1252?Q?yYKsT3cXc/9dnh8IkRtOA9zOk4mKveE1BeoB6BoLMalwldANIjx+Jpvk?=
	=?Windows-1252?Q?dMy1Cy1nCGoYvFLfH0fVSbfzKF9YZCqUH0eyyKqb44g=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0202MB2736;
	6:1iiqQRdTAfq9Kfri6K1/SXhbAo4Ru7bH5IQIqRsy5T62LzN4NBFM0KAfzUd+KvhKCzxl1RYibM7vmQeFdKt3LV1J6s5NLrSTXv8Ixz38CcbJzFAyHX2I7ds4oTvMQbOr4mO5dvzYnj1HJO2w1fadVMvyWAXPkpgWuqag0gOd+9eZrMb5UjeuDZxmv1hCGc273R/xqceSEhwWf4XoPAyRIe3ZhJDEWptZrCsJttmdeext21h2FM2qjKQqUoyHLzFQOZNPhMQldO543/oUOa31D9KP2F2IE5ylps7h9SxkWL98PB36pKeJQrgKSqqJHKcnylI8710tVIbjqt9RmiLQ/w==;
	5:wH9cf6KdOeYzDOe6QevRwzZ5Nk0+1vbOLdTiZIlT3myoqHyogHg10FukLLb0Dp2gA9xpamTQR+tHlRQ9CC6Trbc4vT/DItugOuUTy4HUjUY8cGTTIiqB5GTaK+TmCUeFaCBDqDQ7Ioc40agrU6kEQw==;
	24:OVk6Z5XQ1ED4OrNzwyJysgWn+/30lxNLotJz+7w43zYBFLN/tSd5uF2X3fdrSmpn71LQXyi0gcUZDxmeR4/nvyeH5YYgkmiOiheruwvyMwg=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0202MB2736;
	7:4RfL9i46DC52cfKvWNlM7fk9TAqTpMVMEN4C2g4QkLiIwrL+DXMfLaIPtMUVLAWKfhA06nXselCA1XqPpR0VbCU0x5E0C5MR3yCwhAbgoebgZIPDJFmsC7yn4ooDgYM8v7p6SYiuAZoakS89zc5EjRGwtgErVLMyChl6x42bzJGmE1E+7jcSECR5NSNwbK/MdNYy8Iez549f8zLvOiSQkUf0yct9NmJq67LDyBTSzFQvQEfdfZqLdpsKsqkKicj5D3cvVYaCpxFdNCw8W32KOazxQsbQQYxrVZW8d4bOe/q+lC9ms/i/daVrCfmaLAl5X/H+/ZkegsjcRduILmsTDVJ1yFvXl3SdXVN65uJyL3Y=
X-OriginatorOrg: qt.io
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2016 06:47:00.1445 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0202MB2736
Cc: Samuli Piippo <samuli.piippo@theqtcompany.com>,
	Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5 PATCH] qmake5_paths.bbclass: Fix fonts installation path
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
X-List-Received-Date: Fri, 21 Oct 2016 23:23:04 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

That looks like the correct path to use, but how does this fix the problem?
OE_QMAKE_PATH_QT_FONTS doesn't seem to used anywhere in meta-qt5 any 
more and probably should have been removed together with the font 
packaging bits.

-samuli

On 20.10.2016 19:53, Otavio Salvador wrote:
> Hello folks,
>
> On Thu, Oct 20, 2016 at 2:46 PM, Otavio Salvador
> <otavio@ossystems.com.br> wrote:
>> As Qt internal fonts (qtbase-fonts) are not included anymore, we need
>> to rely on system fonts to work.
>>
>> All major distributions, as well as all recipes on OE-Core and
>> Meta-OE, use ${datadir}/fonts as path so we adapt the value for use
>> for Qt use as well.
>>
>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>
> Please take a look at this. This fixes a customer which were trying to
> use morty with Qt Virtual Keyboard.
>

