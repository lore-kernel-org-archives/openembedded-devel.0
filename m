Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OvyEt-0008Kk-Az
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Sep 2010 22:05:56 +0200
Received: by iwn2 with SMTP id 2so377289iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Sep 2010 13:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=iqtv6oddlOXf6+IVxhQ2gieJyVn6Pqj2LqYTh1R9ET8=;
	b=RrVIkW4wCVLmhhPsXsC0M/0ArKCaTaF3sTSRDw4g6RqCXmXZJhG0+dFQmQF0qXMNur
	ZDTFO/Qk+pjyB1J957J0uuZDllqThcqFjefzQHEXNsGLARxfNX60VoTUdHlQV9fEk239
	EbONLok9tjuTxilBSVsR4xLQOFDg6N8wUKK4U=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=fFndts7A4LZmSPmluj+hYv5nl1yYy7pU3nccoeHIpSCMPghJZwqd1Wy4BsIGKFzdva
	4NPbu36+9hpnvg0atX4H1p6bdwC6wMYf77dflLXBRT/ckhNNJVgdNUyAWDYEou/arRJ9
	LlXuT3AcvgGcMNBadFBm+XalDP/0JreupnQQI=
MIME-Version: 1.0
Received: by 10.231.172.83 with SMTP id k19mr2218091ibz.114.1284581107307;
	Wed, 15 Sep 2010 13:05:07 -0700 (PDT)
Received: by 10.231.205.204 with HTTP; Wed, 15 Sep 2010 13:05:07 -0700 (PDT)
In-Reply-To: <20100915192954.GK4983@home.lan>
References: <1284494173-30471-1-git-send-email-ydirson@altern.org>
	<AANLkTi=dPVmm5iB8mzpTvYSv17uiHcM5rx8z7LX02Z2C@mail.gmail.com>
	<20100915192954.GK4983@home.lan>
Date: Wed, 15 Sep 2010 22:05:07 +0200
Message-ID: <AANLkTimBjk8uFtKEv+Cqy3zUdGzQMAnUJQmKx9Px+mm3@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/2] gnugo_3.8: initial packaging.
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
X-List-Received-Date: Wed, 15 Sep 2010 20:05:56 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/9/15 Yann Dirson <ydirson@free.fr>:
> On Wed, Sep 15, 2010 at 11:07:29AM -0700, Khem Raj wrote:
>> > +
>> > +S =3D "${WORKDIR}/gnugo-${PV}"
>>
>> you might not need to set S here
>
> Right - probably at some point an error somewhere else made that
> necessary, but I can't remember the context - that was 1 month ago
> before leaving on holiday :)
>
>> > +PR =3D "r1"
>> > +
>>
>> PR starts with r0 for initial recipes
>
> Is there some useful convention that can be used locally when
> developping, that would sort lower than r0 ? =A0I used r0.X fo my dev
> build attempts, so it would seem r0 would prevent automatic upgrades ?
>
>
I always just start with 0 and do a bitbake -cclean -b recipe.bb; bitbake r=
ecipe
ofc you can use r0.x instead and when making your patch do a clean,
then reset PR to r0.
And if I recall the sorting is alphabetically so during development
you could probably also use d0, d1 etc

Frans


