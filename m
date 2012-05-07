Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SRQIU-0001Ts-Mf
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 May 2012 17:56:26 +0200
Received: by eaae1 with SMTP id e1so1256346eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 May 2012 08:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=ApYep6EkDlrC6b/iWVXPYRczBHF+p7t5QCsi0prNC48=;
	b=GqHI59CzMScM0kmSwyVifgy7H/IlhHB1gz1JMtsbqQhr1ix3cDcx4jo/dH51nFZD67
	9IfaiJH5G6D0OlaPZN9xFplMcHGxRpM45rj0Uu3lZ79hWJLE3JOdFliaa4s1iRu50lxi
	yKA1LYVhE3Tr1uaMXvKjdjtkCjWm1Q+pcSV2dSTx33PKWRNk4Gduu1TKPrIAa5gwQClb
	btPzZzvYQ87lBg3N3BvdhJVu3DHXGmCpT7lBCmMdTsspcJBawsd6x6+DTaZmFmDEhoSP
	TcH2xpoGq8/0HLWXwnGrbaR+bSind/UsFml2XxiGEj6vZKA+eO3bYZ9+RiE+UmceLfw3
	Tg8g==
MIME-Version: 1.0
Received: by 10.14.47.136 with SMTP id t8mr237377eeb.84.1336405596253; Mon, 07
	May 2012 08:46:36 -0700 (PDT)
Received: by 10.14.2.132 with HTTP; Mon, 7 May 2012 08:46:36 -0700 (PDT)
In-Reply-To: <1336394035.3417.12.camel@dasty-laptop>
References: <1336391680.3417.7.camel@dasty-laptop>
	<4FA7B9DF.60304@mlbassoc.com>
	<1336394035.3417.12.camel@dasty-laptop>
Date: Mon, 7 May 2012 08:46:36 -0700
Message-ID: <CAMKF1sonQpWBRYNSapa16EDGyyQCiRr5AmKoSx02xnqzzn+5yA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Simultaneous build of two intree packages
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 07 May 2012 15:56:26 -0000
Content-Type: text/plain; charset=UTF-8

On Monday, May 7, 2012, Radek Dostal <rd@radekdostal.com> wrote:
> On Mon, 2012-05-07 at 06:02 -0600, Gary Thomas wrote:
>> On 2012-05-07 05:54, Radek Dostal wrote:
>> > Dear All,
>> >
>> > I have three intree recipes A, B and C which are part of the same
layer.
>> > =>  B depends on A
>> > =>  C depends on A.
>> >
>> > There is no dependency between B and C. Only important thing is that B
>> > and C are not build simultaneously. This is not a problem unless I use
>> > configure BB_NUMBER_THREADS>  1. Than builds B and C starts to collide
>> > and produce mess because they are both intree builds.
>>
>> What are you doing that makes these clash?
>
> usually it crashes during "ln -sf target dest" which is executed
> simultaneously with same parameters for both builds. There are other
> issues as well in addition to this ln issue.

This is confusing why does this happen at all

>
>> >
>> > Is there something like a mutex/lock mechanism in openembedded-core,
>> > which would forbid two recipes to be build simultaneously?
>>
>> Just make C depend on B
>
> I have already considered this, but unfortunately I also have
> configurations where only B is included or where only C is included :(
>
> Thanks,
> Radek
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

