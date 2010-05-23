Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OGDJB-0007y4-BX
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 May 2010 17:41:46 +0200
Received: by iwn2 with SMTP id 2so2528497iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 May 2010 08:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=aTDSjlfZEHAhlqSuRn8iIM671foVeqlMQFmsiN1ZAqQ=;
	b=PuAiA2mMQYqJbgXyA+UQBnWO4oPk8OU4lS6biVhI57s4dkrNnTNuRvnFtLHz3HiO02
	vgZ06mmQNghqJNceQEZYI8LN1z0DBL99ydVwR+iUa+zGOyulruiqfCkJXLizndBchvRx
	s7rpnEmwuKT4vauKHJIuONSncbUZzs9fiUbJ8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=J2QAHu9KPUdl68IdOURSAsEoEqcbxmWt2C0o0G0Pu/pTrfMoAAP3cHqiBMAglnhwGg
	38qnd6sWYyX0zMmYEi/vOuGbivMJGrIEuV6v4O486LCtaA98qn+ZiN2t9qCkL7tFKw47
	UkDPSHe0zscSpgDbdp/QpmLPZNbNW5QvdP/lk=
MIME-Version: 1.0
Received: by 10.231.185.86 with SMTP id cn22mr3014530ibb.69.1274629061328; 
	Sun, 23 May 2010 08:37:41 -0700 (PDT)
Received: by 10.231.30.67 with HTTP; Sun, 23 May 2010 08:37:41 -0700 (PDT)
In-Reply-To: <AANLkTimqsLv69OOmckplXCqoIZbybtIwjTVBAC-Uax4Q@mail.gmail.com>
References: <AANLkTimqsLv69OOmckplXCqoIZbybtIwjTVBAC-Uax4Q@mail.gmail.com>
Date: Sun, 23 May 2010 08:37:41 -0700
Message-ID: <AANLkTimzxtQko6-MOSAhVLlC4rGFakVOC76zDh091D14@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Angstrom distro, qemu: uncaught target signal 4 (Illegal instruction) - core dumped on glibc package
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
X-List-Received-Date: Sun, 23 May 2010 15:41:46 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sun, May 23, 2010 at 3:17 AM, Grzegorz Toporek <top.grzechu@gmail.com> wrote:
> Hi all,
>
> thank you for all your suggestions and help. I started to build angstrom
> distro as you recommended.
>
> Unfortunately, I got this error while building glibc package:
> qemu: uncaught target signal 4 (Illegal instruction) - core dumped
>
> I found this tread which says that gemu doesn't support iwmmxt...but how to
> deal with this? Is there a patch needed? Where to find it?
> http://ibot.rikers.org/%23oe/20060827.html.gz
>
> I use tune-iwmmxt.inc file with my machine.
>
> Please help me with it.
>

I have pushed a fix to qemu recipe to .dev, if you are not using qemu
built with OE then
you have to use it to get this fix. IOW if you have qemu-native in your list of
ASSUME_PROVIDED list then remove it from there.

Thanks

-Khem


