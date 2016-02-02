Return-Path: <samuli.piippo@theqtcompany.com>
Received: from emea01-db3-obe.outbound.protection.outlook.com
	(mail-db3on0126.outbound.protection.outlook.com [157.55.234.126])
	by mail.openembedded.org (Postfix) with ESMTP id 8CBEA6012A
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Feb 2016 10:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=digiaonline.onmicrosoft.com; s=selector1-theqtcompany-com;
	h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=unTYEShdy7cvie6Ya43MhY92z2b4mTXkzeASEI/HUHg=;
	b=mus1NizM/SBXC1XssddkQljD89Fu7YfCeXuBoX3jwR8SBU11allvjXBNomqeLUNhrlKOutz57W8fQ7iSlKU3ljeI0GH3ztxAsZ55JuUoGlLEL7wz5LfgLPCgMT8xXrUM2jHscT+f3VMVcXt+4KQyYxS/U8iYGYprP6jhUzA6SKw=
Authentication-Results: iot.bzh; dkim=none (message not signed)
	header.d=none; iot.bzh;
	dmarc=none action=none header.from=theqtcompany.com; 
Received: from [10.9.5.47] (91.217.248.11) by
	DB5PR02MB1173.eurprd02.prod.outlook.com (10.162.163.19) with Microsoft
	SMTP Server (TLS) id 15.1.396.15; Tue, 2 Feb 2016 09:45:51 +0000
To: <openembedded-devel@lists.openembedded.org>
References: <1453906715-6881-1-git-send-email-manuel.bachmann@iot.bzh>
	<CAP9ODKopO2VAkJV_7-X0YpEaZfUSFLGxhHFvsqeXrUvAEWaPsA@mail.gmail.com>
	<56AF3715.3010402@theqtcompany.com>
	<CAP9ODKqVJez0K=6rGfAK3OUgqdSEO4PmzVhFjnjG94WMuhvXsA@mail.gmail.com>
From: Samuli Piippo <samuli.piippo@theqtcompany.com>
X-Enigmail-Draft-Status: N1110
Message-ID: <56B07AD3.2080608@theqtcompany.com>
Date: Tue, 2 Feb 2016 11:45:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <CAP9ODKqVJez0K=6rGfAK3OUgqdSEO4PmzVhFjnjG94WMuhvXsA@mail.gmail.com>
X-Originating-IP: [91.217.248.11]
X-ClientProxiedBy: VI1PR07CA0116.eurprd07.prod.outlook.com (25.165.229.170) To
	DB5PR02MB1173.eurprd02.prod.outlook.com (25.162.163.19)
X-Microsoft-Exchange-Diagnostics: 1; DB5PR02MB1173;
	2:FMlFwflSeUZkI3GNF3YMip2cQROsPuyEGCf/DbHKN7CZTujgvsfMozJ/e1tKyxW9RSRU5WDoCT5c9e3rsqmw4Kj8M5CFhbDjkxYo6OHhnJcj4vyFekohAnLolvtjAIwb4mKPlsgQmeRIzHRkj15SHQ==;
	3:KFN75608A0l+JuO/M0dG1cV3nXUHIdTjQGghuRS7hbvkBCLprqd6wCyL5XBxkWSqJQ51Otp9E2/HqQCzGX6LaSw8AtyQMj3JdjuIAU67R5vMRAUzfseNP9G5IiNZGXAn;
	25:hqoDAeZoadQ89PFNjii0vwc8IgTH2YlEZdJxjJp38I6znDpvV2slJZ/WWl349OtDWrGkCCP9alvwENI86DQjAifJ1iGcP4k0QCltlc1Z59V8KYEdP1Olwx1ejrP6xHGmwO+cpAsYXWU06LM4XmLT9m9nQ96WfzXr9Y142gKl9dy3ABHp7Vglr44wDcEzSw9lHR9htZT4bN0ZSOaA6otzwLY1dWPnWXFvSaSnVDZXao2xrcGlzWFRTIbjE6DiG3Xl
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DB5PR02MB1173;
X-MS-Office365-Filtering-Correlation-Id: 88994ec3-9d79-4caf-8788-08d32bb5a36e
X-Microsoft-Exchange-Diagnostics: 1; DB5PR02MB1173;
	20:sc0iFjzJbxpCGBk/0wCp2Vha1RgpZ1jSzg59zxU9YDbO1p9QMYKpzM2/LAr9snhmYC2zu33VmW1xAFbrixHnNQTX47gFAJFgjzSvg6vUxwjOiuTDGj3pEugdjBj+M9YjjrByazpnlZukcN2wSVkzopS8+W51u3YND+iCIFOyoZi0tD3vfG1MOy1xhXU7QUdmDyZsUx8jvJ1KpKSoZJUkTcAQJE91XOmJ3GD1vtmrjmpHaWaH0ZGegLUmgAaOh5w4Qh/Gcrpj6G4COFxlibN9pUd+O0vt8cAEAeSNV3mSuSOVhRmZ4b4b4nfkoa9szBSk0kMtmCeBXMCgK9idmcoFfImAsdB6iXWqWsG/mHjROQBATSScu6iz/eKvkXVbRQ1spHzY5fTly3hPY0/rEZocfvp5p3uw0ov1NPElf2X1xiJnhUa4X5SZQbUKjJMjkyXWmTR5r5FSkvyAvfVl7PSJpACdza577zMZzc1DJRxyszw0iMRCQNBlznItcorQuKq0;
	4:YfTUreIiwlorCKQR2MDfJ7EJ8TEvQKhrjTGIifur8nyA+GIr3dnVTcwfFWrBohl4QXo+bpNVcpIvuJkjC/aWw97y6s2sjaNEJ+FpK9PKvtEmwTajN42smAAb2RP+8GXTtKWRG73dzjT7JGEw71wRXzxXEaroX8mwgH749uQKuuM7Q0L5HcVIiN/ziKk64M9cwpdx+6xwx8HRbhNbW+ViwQ7BwcjNW8oQEEN+VIAqtk8V9uGFZ6zSVsH6tPWsdfrnvS8AfVvLNbWBZgNLt9XG78iZM/FZsVBTHs0xFdZ2PYM8wbzCh1laEWcZtnj0Q4RhK/F7/xCyoBVlNV4FVDB6zz9+45LpX2T1eiiCHiLnc5eDuF4zBS4y15QGXSxq/KiP
X-Microsoft-Antispam-PRVS: <DB5PR02MB1173F86E12AB4D012710A56590DF0@DB5PR02MB1173.eurprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(8121501046)(5005006)(3002001)(10201501046);
	SRVR:DB5PR02MB1173; BCL:0; PCL:0; RULEID:; SRVR:DB5PR02MB1173; 
X-Forefront-PRVS: 084080FC15
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(6049001)(377454003)(24454002)(87976001)(4001350100001)(80316001)(2950100001)(47776003)(65956001)(189998001)(66066001)(33656002)(92566002)(3470700001)(36756003)(122386002)(76176999)(77096005)(65816999)(4326007)(83506001)(87266999)(54356999)(2906002)(50986999)(6116002)(93886004)(15975445007)(5004730100002)(2351001)(40100003)(19580395003)(19580405001)(1096002)(3846002)(50466002)(586003)(86362001)(5008740100001)(23746002)(42186005)(5001960100002)(110136002)(230700001)(7099028);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DB5PR02MB1173; H:[10.9.5.47];
	FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?Windows-1252?Q?1; DB5PR02MB1173;
	23:8yy9B7PV/29UzCY6Q1g/K1tyCk1e6Bq4WHiMT?=
	=?Windows-1252?Q?jcS7WO4xxNByPKw2604G29NhHEaQdhbtXwi7F569l3fVjxXFjoVfL+fA?=
	=?Windows-1252?Q?KlzlPD1MjAWA2tA7si3YH7Bmy5kI4EFCQEzArRatpH7w8THVkgJe4WKa?=
	=?Windows-1252?Q?OyF+MUBwCC8yxTZFe7KpoKj0UcAv3xyet7MNdnlQbu87DhJkEGJviWyj?=
	=?Windows-1252?Q?+SIFqS4EXxAw1bvlVMUOejOr0tgpWH8jXU704YZ8M2vL5fhTy1PghN+K?=
	=?Windows-1252?Q?Jte06uSsCL+M8wMVqn4D4XElIe3YEGRaAkFaAsv2FMR6PZ27R82OZGNe?=
	=?Windows-1252?Q?JwQrTsj/ZYof+59SvAQk+jvMUzH4nfLPDvJRl/ab3HtP/0gJRy9hvpkB?=
	=?Windows-1252?Q?rJpPdysu2Ukaps9GObFyhcYPS2xjU0i+xUq1JvgZHyBlmpEKkXMi//d4?=
	=?Windows-1252?Q?x6FhcuwmJZHbnet+xM84dNxdEPg/Mh5aVJ9JgRdmqsHRQ3BThPz4HjPC?=
	=?Windows-1252?Q?iCETD7dB6ZFx2h/zSX1p3KkPEDxrTiEITmxvdWjRsnqYzkReV3ORmSBo?=
	=?Windows-1252?Q?a7xL7YFOuX4fzKdDrgBUgk6h6Sc3RP3ZaxTD2VSJLRlt3226Lvmzr6Bt?=
	=?Windows-1252?Q?NiQcn0K24iXZRDc2Wg5wd3+JfpzpjmZo0v5euplhN5Gy5Q/CTZsFNfhC?=
	=?Windows-1252?Q?0u+UqJg4ekUGmZmIoHlq3tSpSqeGBcIadREBV3VeivFLPECP/5Q/3XSK?=
	=?Windows-1252?Q?w+g94emecWEC7wSN5y+PlW/fqxnuiDSJLq0JSQ+DH0McGr1z1oRRLgel?=
	=?Windows-1252?Q?ByYWP8DFbemR5ndqbESGXPFYXLjcSjW3TOlwIkexa4M1+edhLxcgdk94?=
	=?Windows-1252?Q?qpi1CX5yXn/VbO/fhzIzmbabHBwlzssrqZFz7/UdUlC9t7HE4xlx5H97?=
	=?Windows-1252?Q?JW6dq8QM1Oy9Sn6zqzJc+/Rvwk0Z0c3kVmyQwyZWCTSuM/+woI7SSwGN?=
	=?Windows-1252?Q?07JIgvaQe1VvNyhhFWv5pf1KM2xSGPkUcvjVuSN4VzAu84kBNm7jkqIK?=
	=?Windows-1252?Q?HR0YFIe8OcMq7iRun5gee3j8Mp5MUozP6RhOMNGG1GIdl/kM1dCan0ep?=
	=?Windows-1252?Q?OeWyzADaCUO9Ydc+wkWojr7QIAPADrGGi0e7io5H6zOMHzZE/+FWEHjs?=
	=?Windows-1252?Q?6+ndDlv+eLiHw1NYFPf3uiarPT9+gY6Cn4iGPgr3+VYYTtpBReakq6Z0?=
	=?Windows-1252?Q?aGIMlF3TxPN5A/p6yKU3cPf1MrZ/g7Hj18wHUG/iXv3WpbDUMfCktJUa?=
	=?Windows-1252?Q?Yz1?=
X-Microsoft-Exchange-Diagnostics: 1; DB5PR02MB1173;
	5:S0m9yRUuZaO6VhLRdoGHa8Qwc++TV9Pyqpj1fC7nkI+Cuqy/ZKuaE/DWgGKAGTj38gr6Xf549g4LkRz8htAK7QkDUTWd/c8S5IpBr7P0UjJwfQPR7lBlbxH9RhVbJvdzD/Kbl2K6fvnqDTlwvtu4Hw==;
	24:7XISym/N52s540W0InAVZVJM/lURGrLqI1u5Dn4NpUUOzI2VgoJeabD/919d5ZT9vy5ohgP7X55m3l6wmEodEV1A0ydyHAq0nFk7+ga+S/w=
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: theqtcompany.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2016 09:45:51.6782 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR02MB1173
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
X-List-Received-Date: Tue, 02 Feb 2016 10:01:48 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 01.02.2016 13:14, Otavio Salvador wrote:
> On Mon, Feb 1, 2016 at 8:44 AM, Samuli Piippo
> <samuli.piippo@theqtcompany.com> wrote:
>> On 30.01.2016 16:13, Otavio Salvador wrote:
>>>
>>> On Wed, Jan 27, 2016 at 12:58 PM, Manuel Bachmann
>>> <manuel.bachmann@iot.bzh> wrote:
>>>>
>>>> From: Manuel Bachmann <mbc@iot.bzh>
>>>>
>>>> Just as we do for qtwebkit, let us have a patch to build
>>>> qtwebengine examples by default.
>>>>
>>>> Otherwise, the "qtwebengine-examples" package will be
>>>> empty, and attempting to add it with "IMAGE_INSTALL_append"
>>>> will result in an error message.
>>>>
>>>> Signed-off-by: Manuel Bachmann <manuel.bachmann@iot.bzh>
>>>
>>>
>>> This should be a distro option and not enabled for everyone.
>>>
>>
>> Also there is no need to do this with a patch, same result is achieved with:
>>
>> EXTRA_QMAKEVARS_PRE += "QT_BUILD_PARTS+=examples"
>>
>> Maybe this could be added to qt5.inc as a PACKAGECONFIG option?
>> This would allow easily enable examples on any qt module.
>
> It is:
>
> https://github.com/meta-qt5/meta-qt5/blob/master/recipes-qt/qt5/qtbase_git.bb#L67
>

Enabling the PACKAGECONFIG[examples] from qtbase means that every qt 
module will build their examples.
If added to qt5.inc, it would build examples only from a qt module you 
bbappend with PACKAGECONFIG += examples.

