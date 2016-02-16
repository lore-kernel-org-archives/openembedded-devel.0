Return-Path: <samuli.piippo@theqtcompany.com>
Received: from emea01-am1-obe.outbound.protection.outlook.com
	(mail-am1on0134.outbound.protection.outlook.com [157.56.112.134])
	by mail.openembedded.org (Postfix) with ESMTP id 105216E680
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Feb 2016 09:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=digiaonline.onmicrosoft.com; s=selector1-theqtcompany-com;
	h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=OBnabth2g7WSFLj46pEVlVLpVebIghwr0p2KYv61ItM=;
	b=KniodwxI2mkQLY5NrneRfJ0BJCfY4rnPUto+6SkxZrcBvFIrvqF8eA+Jiswg/DyqXl0t3vNbmX7GG/h0had1zE1EbGiSb00Hs7R9riXho/NXXttLAjdkwtNe000+uJlSDlTuOWZU1euzFbv6qjcgCl9aBfB4Dh+FTulzC2VWHGg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=theqtcompany.com;
Received: from [10.9.5.47] (91.217.248.11) by
	VI1PR02MB1183.eurprd02.prod.outlook.com (10.163.164.23) with Microsoft
	SMTP Server (TLS) id 15.1.409.15; Tue, 16 Feb 2016 09:13:12 +0000
To: <openembedded-devel@lists.openembedded.org>
References: <1455467128-4533-1-git-send-email-samuli.piippo@theqtcompany.com>
	<CAP9ODKrU=fgJ_ooz4_oOpMWRxw+e_UHLc9VrNy3ne=wWdS3Msw@mail.gmail.com>
From: Samuli Piippo <samuli.piippo@theqtcompany.com>
X-Enigmail-Draft-Status: N1110
Message-ID: <56C2E83A.6080908@theqtcompany.com>
Date: Tue, 16 Feb 2016 11:13:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <CAP9ODKrU=fgJ_ooz4_oOpMWRxw+e_UHLc9VrNy3ne=wWdS3Msw@mail.gmail.com>
X-Originating-IP: [91.217.248.11]
X-ClientProxiedBy: DB5PR02CA0002.eurprd02.prod.outlook.com (25.161.237.12) To
	VI1PR02MB1183.eurprd02.prod.outlook.com (25.163.164.23)
X-Microsoft-Exchange-Diagnostics: 1; VI1PR02MB1183;
	2:Sg5fEgYJaIKkeRSm53TegYglJRMhiybZVuEVB72USqqKGsio5WcZhevu8ROX/og9raS7fBNP+YeZOHg2mIq1xH5TA5WtV5pLNaanmNYUSyega5Ae3xTNuYdN5mdWcop4/ojOIIQvHM+UXvH5i217pw==;
	3:GFiEl4OrcaShCaVki5dtxIM/vkxp08g14Dfshic9mClmuDWGvXQCgh7PS2aeTY6owUTexVrGPExJG15M0SD8fb9K3GqFa3kIFvd4otBkHbLMrwhPsVQbHrpwm4gmFykc;
	25:XDJaB8JaiMD2G2MAjsIa17V8tQd9l+TvBvLOPkAkF6230IT1PA1YtvHK9OUENlcWdghrXQzDIsJPSH3m7nlQoOd07uyN7SUhDJFgKbKrU7YcXr4YxT6IHMhhafr6mQikoabYsMcEAYJzKUhUMkB4NprS7hVvPY/5ndOj2jK4EwfWUjCQpzJWs1i9EfqJ3q0H/jCq8FrezicDUeQH9+ZqHhoYR+U5OcQQ3B7I+KRSmS1Z1kMFpw/CbzUU2IhLfSFgGuUjdz36+1wM5eWEuLHsRpGSMxi90LfcRcB7TyypkB/YxI/9G16Vwe2uPYkjh40R
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:VI1PR02MB1183;
X-MS-Office365-Filtering-Correlation-Id: 49c69a8a-c530-41e3-6802-08d336b16538
X-Microsoft-Exchange-Diagnostics: 1; VI1PR02MB1183;
	20:syowrwztW+Jd9uYTlU3ipuQevw3XVKOIkkerOjaC2USbfjBBosUHLxa+aMbsQyTX2mzQx6OYL3RFCRJyTnn1VwdWE6si2Djqk/N1eyqTMI0xC3d1w+wsOBcFvBZW3hKyo3lJ/0fvugcJ0bn4zinZwExezPZWd3X0dnYt9hoaETnXCckwJeXP/a8/OstyHr4Hb6TcQ/6no0lJSLRJCf+ge+sz2CprU4ckPWz9w0gr3JXpfAwE0m1UkwnQZqz25680vnwiu8PoQWgwhPdy8lQuNzuZ/6JA9wXPaZtcTCKRJGN+UjuU6WIdRuCi3ud6Kjiu0tibRiRNUmF05N/9PEat9/yA59Ye3oooy541jF8e2z7fUN8NUI1JMWon5Zu5RqoLkNZy4fWuQrRj9Qfb4Ran4ZnaNvRMrIUostJ/8xXjAw9SOjlTNfcQSIulZxqT3+5yIp/XOzqAoeYLd5Kjk15WX/NcioF40U4MyuS+0NHzBRVu8ZRJjNDwo8BKyUGVYcGn;
	4:tX/v9LjV6RRQBe+zqaAfWCXg9gQ/pacN9+6VtZ0FG+ytx6pmh3iILnGQKfkpn6THjDkdDIwXh2Y1ms7BhlNLKj35cXkmjGKKcGxYP/rQLAEeJxgkV8I/ljhp5FhiQyNIsi3hB9J0sgP+Av4R7r7tegFxhrmE6x7tBOSIEa5/SdwN8wEMf3548qVVbNbE3/Pp/RTeg2Zo9ST8dyHBz1LvKhY3/61x/d4GRPAUeusT5Zb8VSm5yFEwhyidDpLLOr/ImxpjKAn6W7090GIEclNRcX3R7n+areGTEwJXG/d+boEo3fFxCR7D3D70UfFlsloppdsJEMEqsHaD40kCcBxoikLHO3qcv19dEOFe6x/pHPEIFvbBEVrbT4/wJZjzhFnX
X-Microsoft-Antispam-PRVS: <VI1PR02MB1183D11E3B912647DF3CF44B90AD0@VI1PR02MB1183.eurprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(8121501046)(10201501046)(3002001);
	SRVR:VI1PR02MB1183; BCL:0; PCL:0; RULEID:; SRVR:VI1PR02MB1183; 
X-Forefront-PRVS: 0854128AF0
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(4630300001)(6049001)(6009001)(377454003)(24454002)(189998001)(122386002)(92566002)(2351001)(107886002)(40100003)(4001350100001)(110136002)(5001960100002)(19580395003)(19580405001)(450100001)(80316001)(50466002)(83506001)(23746002)(5008740100001)(586003)(54356999)(87266999)(65816999)(50986999)(76176999)(5004730100002)(66066001)(65956001)(3846002)(33656002)(6116002)(230700001)(86362001)(87976001)(1096002)(2906002)(42186005)(77096005)(36756003)(2950100001)(47776003)(7099028);
	DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR02MB1183; H:[10.9.5.47];
	FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?Windows-1252?Q?1; VI1PR02MB1183;
	23:52xaP4OpvScT/bpK8EgSWEpYy/MTvSdnS2Wco?=
	=?Windows-1252?Q?A4EUNdVIBysYzEvRtCk1EClPPI0a5Mm/cSYvmPrgpPProSDkkl+sbBrV?=
	=?Windows-1252?Q?hxkIOxxPc6dB8cNkytDtnrg8Rfg0yqLAW1hsb+vy2sjv1oTDCCjbhP4j?=
	=?Windows-1252?Q?2oD88vr/AvlkmbgesG3z5LE9E7s31OIcBW3Au7mVBj3lTLEIY8aH9p29?=
	=?Windows-1252?Q?lfgrL1Z0dQRzGRgUw/SpmS1FXFlABtXlI7+6HmYWwVETSom7VPTU+0FD?=
	=?Windows-1252?Q?4hRl/bll8IjuLXQUm7rQywBnf4BhvUiTissxLgpMxMMTKiWd6xo/0X94?=
	=?Windows-1252?Q?D+Wn6NsYHBUGiXgwHyes/5j+E7qrIdz5EAs1hAmSyYjKIRgi4KWiaDuD?=
	=?Windows-1252?Q?cxAZT9LcU+otq68wtYP2tPwUxH1T40/8GwOV+2K/aXkjYcVSYLZfv7FS?=
	=?Windows-1252?Q?SCtjuSOViz8TePQwNcIoFg2lb8LA7Fvvf9bNW2Jn2IyPuefbEVhwF62r?=
	=?Windows-1252?Q?8jYgYE9djck9tsQnN45DjB44k0/4WSSmzWIu2rTetvFwUiA3Cq40g+JR?=
	=?Windows-1252?Q?SSKTOn7H8/nqDYvU7yxfjgwYV1RmeVGomwjC6g/E6QeF2pH5tdoZiuLJ?=
	=?Windows-1252?Q?HkULaThTO0dI7JcQkCPG5RoZ8VlV+RwlCwBNBiLy25Jf2Fo8TolWVdvp?=
	=?Windows-1252?Q?fMCopCvHK7UKEzYprI8bh57WNZz9QKWtpHOxYQm6U57IFr9+s/s5NEGG?=
	=?Windows-1252?Q?uvUFov1d80A0P3J/s9eaqgYnUHZP+5Ul16kBCNAkJruJiVDCRTkgnFUZ?=
	=?Windows-1252?Q?8hToKcvWbU+u3P0yxk+NCFr0Sb1T+WwtSqjngRQaDM+nDDPzzT6gzT8b?=
	=?Windows-1252?Q?kfLOKnmFZovl7b3Av5mWo7Beg6hETLRLek29xwCEu6Y2sI1tVyr/Ickb?=
	=?Windows-1252?Q?+zgT+KNUUFa9CIRZhGjJwEK7nf7ctXvBY//fLXa92lL5wal+v7qXamqn?=
	=?Windows-1252?Q?MU2VGW4K8S9r7l3zoHa9gf8ckrWNeA31WF7YGsn/r+iBOTyp6Sy6TUrZ?=
	=?Windows-1252?Q?9e7rfP9btjw8ZqvJzqynAh5gpg5MfEErSaMkywc5Athjw3TqfGUrS9xr?=
	=?Windows-1252?Q?AL011Y5EGtEfdwudc/aZ3XZnem77gHiLOyF8bc4jE3o++DCOxeff9GrR?=
	=?Windows-1252?Q?bNBpSGelzlCZysljQvg+Uyc5StETUl4tNOqLja6oGLh6zTgC3b9+X6ab?=
	=?Windows-1252?Q?S3y8EQPwJ3uB+7q6Zu0/jUU3s5ci/9WQyFR5pI=3D?=
X-Microsoft-Exchange-Diagnostics: 1; VI1PR02MB1183;
	5:4rMYRfH8zCdT1b6B7wZUeIePkjchytkIT1fTH/G0UZqz5XKxb2bsZUYccaPfRUNu/FyjaflFWohfTt6yOZYR6tluxQD5lCmcH7qsjWZFrhCtjmr8e8JPiCrJPqGx0OQlOzwuuARFihPPhFSqSZrO4w==;
	24:7rNtUdDjdQbDMa0oZoRITJ8YsJ3vdJvw9mdSmHgPd4NH1OxjvK3C8RxC/1VWVGMzGJasdJDJ82gUjCr+YvfL5X1DVKxC4Bl3T5QOlZTp+5A=
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: theqtcompany.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2016 09:13:12.1397 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR02MB1183
Subject: Re: [meta-qt5][PATCH] nativesdk-qtbase: use runtime linked dbus
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
X-List-Received-Date: Tue, 16 Feb 2016 09:27:53 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 16.02.2016 00:34, Otavio Salvador wrote:
> On Sun, Feb 14, 2016 at 2:25 PM, Samuli Piippo
> <samuli.piippo@theqtcompany.com> wrote:
>> Remove direct dependency to nativesdk-dbus. Instead configure
>> qtbase to use runtime linked dbus library, if that is found.
>>
>> Signed-off-by: Samuli Piippo <samuli.piippo@theqtcompany.com>
>
> Why? This puts a dependency on the host operating system version.
>
> Am I missing something?
>

Currently nativesdk-qtbase does not package libQt5DBus.so, so there 
nothing in the SDK that actual uses dbus, but it's still built as a 
dependency.
If "qt5: add Qml support to lupdate" patch is merged, then 
nativesdk-dbus would be pulled into SDK as well, although I think it's 
still unlikely that anyone would need it. If there is really need for 
it, then you can always add nativesdk-dbus to your toolchain.

