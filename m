Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id 86FCA73C22
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Mar 2015 18:57:59 +0000 (UTC)
Received: by igbqf9 with SMTP id qf9so5934103igb.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Mar 2015 11:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=PZF1B7mKHt1psVQc8rRJ0mPoa4QJ8+mJ6GkZehkTEko=;
	b=mEF8/mHTdAxk9hRkJQWWKF8tnQCl0tMQwlW2xn10tcDFPi2BYDYAYdlSAfDb9E3SNZ
	d5HzGPfElHZa7vniElRol7bNMw6Oj8iEeU7BYWp6L5ItLwDN8017rPvBUCQcKPWwcfas
	807PYWITqMScqyJemIUKbbsvHzGoEleystQ+8hFRvVDzGWi+rh/8yEyvGgqHmkl8g9mB
	i0Mkr7JtTKbvJgYeI0TRGNTsC3nQLCCj4dSPLd6G+FCUrmbM/fBPAmEiQy64wifo4es6
	IvAw7JrzvLCmEBuVBs9omg4atKO79dDHuJT5FJhCNnkS6KEJGMo2Aao282fDKD1bqsvr
	AJ4Q==
MIME-Version: 1.0
X-Received: by 10.42.187.7 with SMTP id cu7mr26934115icb.71.1427223480476;
	Tue, 24 Mar 2015 11:58:00 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.107.133.21 with HTTP; Tue, 24 Mar 2015 11:58:00 -0700 (PDT)
In-Reply-To: <CAMKF1sqf=txyROy9rQ0qyPgD5iM+YV358X3-Z3kVmCrg1t+U+w@mail.gmail.com>
References: <1427045315-13142-1-git-send-email-raj.khem@gmail.com>
	<CAP9ODKp=x2GpWVZLB1kf2CjZpMCuBfGZxYuOAQRUsx-D+uRiVw@mail.gmail.com>
	<CAMKF1sqm5ARrWih-TgnzFXgEGXR97o=iUU_xR-fvp_bLC=SyEQ@mail.gmail.com>
	<CAP9ODKoFdepGX7OZu8XxMQVr-ssUCG_Ndyyj6GROOACViiMhEw@mail.gmail.com>
	<8A51FBCF-FD07-4A7A-9829-14964E58A121@gmail.com>
	<CAP9ODKqL1d447vjyEv6wQvJzS_uz1wFFmgOOjh+MKv83xsjTkg@mail.gmail.com>
	<CAMKF1sqf=txyROy9rQ0qyPgD5iM+YV358X3-Z3kVmCrg1t+U+w@mail.gmail.com>
Date: Tue, 24 Mar 2015 15:58:00 -0300
X-Google-Sender-Auth: Wc31vr1wAgtjrBnu1cQxuvvrdHQ
Message-ID: <CAP9ODKrrABT39MyQUYqnZY3BRkvM_amzV8mjaVQRwMvhpQGtuw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: pnandyala <Pavan.Nandyala@lnttechservices.com>,
	Zoltan Kuscsik <zoltan.kuscsik@linaro.org>,
	knagabhirava <kalyankumar.nagabhirava@lnttechservices.com>
Subject: Re: meta-browser][PATCH V2] cef3: Add recipe for Chromium Embedded Framework
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
X-List-Received-Date: Tue, 24 Mar 2015 18:57:59 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Mar 24, 2015 at 3:51 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Mar 24, 2015 9:36 AM, "Otavio Salvador" <otavio@ossystems.com.br> wrote:
>>
>> On Tue, Mar 24, 2015 at 12:51 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> >
>> >> On Mar 24, 2015, at 4:56 AM, Otavio Salvador <otavio@ossystems.com.br>
> wrote:
>> >>
>> >>
>> >> I'd prefer to do it once and avoid adding another recipe and handle
>> >> same problems we had solved there. Also this allows for example the
>> >> use of i.MX patches on meta-fsl-arm.
>> >
>> > My usecase is not i.MX moreover I do not have i.MX h/w to test as well,
> current set work fine for the architectures I need it for, if someone wants
> to help in testing on other machines, its welcome. however as I said, it
> will be in subsequent work to unite both recipes due to the overhead as
> explained in last email.
>>
>> I am not asking you to test cef3 on i.MX, this is fine. I don't want
>> another giant build recipe with duplication.
>
> I am aware of that. This let's other folks hands on it with a working
> version. Moving cef to latest chromium is a bigger exercise and will delay
> this. That's the motivation.

Reuse chromium.inc file for this, so we at least avoid recipe
duplication? If you have a good reason to avoid it I am fine but I
certainly prefer reuse here.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

