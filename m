Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id 2960A6013D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Feb 2016 11:39:42 +0000 (UTC)
Received: by mail-pa0-f51.google.com with SMTP id fy10so49128606pac.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Feb 2016 03:39:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:content-type; bh=yA5hff3puMOi8Bajjns4eDkZ4Fb++QZE+C7yrlEwdeA=;
	b=ugle7dPirjxGHJCaOKwZxIzSD+JWOgR0UT6VWNgMp13rik9NUrNbhRwn6sK1KebT0/
	lHiU55+87WZGMCPiEDZd1T1L2mwOL933lAstZH10KgHo6lJB77TxuSr8bLlNULwt3Kmx
	LHNX96nQkCTHPh2gOEBlNjNgZGxeqUgihWkEwjW5c7k9zpy5hYC5UYoTw2Vjio3h/jsX
	WVU0rlZtgd7s+vJ4341zzaJ+UpihqlF3ZY5GHKSTgBu75ydZaVkR6+RYCxwOMoRAWEU9
	rC55P+bPFGTIUnVqc4emutPSfpQa+H/JIPo7UIMTYEu/t/u+hjP2+4uoNweOa0nwd19S
	h6Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:content-type;
	bh=yA5hff3puMOi8Bajjns4eDkZ4Fb++QZE+C7yrlEwdeA=;
	b=Z6DC/yKcBOOjaL6sVsIUGaMKV4XZlAFOW2xjFp460sHO7tb8O0S/vF/zNALDH1khFh
	A/rQ24CTYYSjP9LrxovZ+/eNkye3PtOI1F9zCczorcJ4Nxkd5Jz/lBfuilVEJ4B+BY2J
	AaKSNUzsckJWU5aVM2MnEeYNig3FMBHniPa/EHYuHhsUomCUxUEC75uB0HAvpGh8bH3g
	7zU2YEystgU2qf18BEWmGzsM/cf9gy79suYTe9rdKhzIPdvxgckhCDOAG10BsXOeUqzo
	Yd5HyO+FjRxLKD8ewGMl5gFze8UK8JyM7Plw4VgH5PQ9Bht1c0n5D0NsM51h8apvIrPw
	Cgsw==
X-Gm-Message-State: AG10YOQlUnnw6jtoYY383nTQ/z8b3WbRzu9w112WUp1pi9s37WNsVG9WZxzRRGr+d98D+w==
X-Received: by 10.66.118.198 with SMTP id ko6mr17302005pab.11.1455881982714;
	Fri, 19 Feb 2016 03:39:42 -0800 (PST)
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com.
	[209.85.220.43]) by smtp.gmail.com with ESMTPSA id
	ud8sm17359417pac.11.2016.02.19.03.39.40
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 19 Feb 2016 03:39:41 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pa0-f43.google.com with SMTP id ho8so50440471pac.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Feb 2016 03:39:40 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.66.151.177 with SMTP id ur17mr17232874pab.68.1455881980526; 
	Fri, 19 Feb 2016 03:39:40 -0800 (PST)
Received: by 10.67.3.163 with HTTP; Fri, 19 Feb 2016 03:39:40 -0800 (PST)
In-Reply-To: <56C6CD05.7070300@gmail.com>
References: <1454512359-2140-1-git-send-email-samuli.piippo@theqtcompany.com>
	<CAP9ODKo9D=V8w1-oJmz605VsDWGtFJ=1raD+35yeSJCkRt-TSw@mail.gmail.com>
	<56C6CD05.7070300@gmail.com>
Date: Fri, 19 Feb 2016 09:39:40 -0200
X-Gmail-Original-Message-ID: <CAP9ODKpWBUH_gFQgNZN28KXM_QOjD+z6S3g2rKYSxQbL49DuUA@mail.gmail.com>
Message-ID: <CAP9ODKpWBUH_gFQgNZN28KXM_QOjD+z6S3g2rKYSxQbL49DuUA@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] qt5: use common PACKAGECONFIG to build examples
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
X-List-Received-Date: Fri, 19 Feb 2016 11:39:43 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Feb 19, 2016 at 6:06 AM, Samuli Piippo <samuli.piippo@gmail.com> wrote:
> On 04.02.2016 13:19, Otavio Salvador wrote:
>>
>> On Wed, Feb 3, 2016 at 1:12 PM, Samuli Piippo
>> <samuli.piippo@theqtcompany.com> wrote:
>>>
>>> Each Qt module's examples can now be enabled with PACKAGECONFIG.
>>> Replace the webkit patch with a PACKAGECONFIG option and follow
>>> common practice by not building QtWayland examples by default,
>>> those can be enabled in a .bbappend with PACKAGECONFIG += "examples"
>>>
>>> Enabling PACKAGECONFIG[examples] in qtbase, will still cause every
>>> Qt module to build their examples.
>>>
>>> Signed-off-by: Samuli Piippo <samuli.piippo@theqtcompany.com>
>>
>>
>> Acked-by: Otavio Salvador <otavio@ossystems.com.br>
>>
>> I think in a subsequent patch, examples should all to be disabled by
>> default. What do you think?
>>
>
> Sorry, I don't follow. QtWayland is the only module that has examples built
> by default, and this disables those as well.
> Is there anything that's needed in a subsequent patch?

I missed that you disabled it as part of the patch; alright! :-)

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

