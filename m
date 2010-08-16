Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Okuc8-0004LQ-NW
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Aug 2010 10:00:13 +0200
Received: by iwn38 with SMTP id 38so1391448iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Aug 2010 00:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=M8pUIutMcpGE426LwPFAbDuOl8E2+7yDOmnXbc8tiBA=;
	b=LmHf7wmBaBRUvOegEFZCDumzmRRotc1ZH+p4zez2JMRn21O0apThf/cnqIS2YgplhR
	c1Kr662E1L65qH2NaPvtQvHyQ2nU8qM+wpAgeQy2/K+t5iVIrXsfjg/IsZzC9DkcS6oR
	PiebBG3nmVUPiggs1hg2gCpueDF5dITktm6r4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=qt8uXGy+FCrewxZDeEGYrjhg2JGj/Xp37XR1VV7uXtd51fHsKtIlaoA+K3lJQaNL2S
	8IMM0XTRx7YIN6OeTGDq4wRQ50nrYY0SyvIqn9DlAJVSqCAL0G/S8OtQqu4vGXhLwOzt
	rNOslAFcyU0iEEHzSDYs6EdWgLPHdWPFqqHX8=
MIME-Version: 1.0
Received: by 10.231.80.213 with SMTP id u21mr5087297ibk.173.1281945597553;
	Mon, 16 Aug 2010 00:59:57 -0700 (PDT)
Received: by 10.231.208.72 with HTTP; Mon, 16 Aug 2010 00:59:57 -0700 (PDT)
In-Reply-To: <AANLkTi=immHiyS5p0WWmCYaii-5xBruCuBi3_jC_s5Pw@mail.gmail.com>
References: <AANLkTi=immHiyS5p0WWmCYaii-5xBruCuBi3_jC_s5Pw@mail.gmail.com>
Date: Mon, 16 Aug 2010 09:59:57 +0200
Message-ID: <AANLkTimLboPPcFegwhZJswLr2cpYayryZMS6zu0SVn9E@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Unable to build system
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
X-List-Received-Date: Mon, 16 Aug 2010 08:00:14 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/8/16 Kousik Maiti <kousiklinux@gmail.com>:
> Hi List,
> I am new to openembeded.
> I read the usermanual of openembeded. I configured my system as given in the
> manual. But when I run
> $ bitbake -b /home/kousikm/work/oe/openembedded/recipes/linux/
> linux_2.6.34.bb
>
Don't use bitbake -b. If you are doing that packages that are needed
to build the package are not build.
If you're new start with
bitbake helloworld
if you are daring then you can do
bitbake virtual/kernel
and/or
bitbake console-image

don't use -b.

Have fun! Frans


