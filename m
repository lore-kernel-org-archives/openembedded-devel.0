Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1ONDk4-0005AM-CG
	for openembedded-devel@lists.openembedded.org;
	Sat, 12 Jun 2010 01:34:31 +0200
Received: by gyg10 with SMTP id 10so1291207gyg.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Jun 2010 16:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=iQSMfb58boel8OsPpd8cukZHsd2n1BpOSRoHfLxCyO0=;
	b=OLQQG76l2ZRKCz+xPi0qEMQ7NIlQ7gKOw2cnruJTP7r9yYA5Tl8DxUlDeGHbymQMPr
	Dfptl7LrcZ5lqIBalmOfS/q0pOehMzjCF9YWlTZ8RhInPAavI/EBN9uoYTdMrVOXf4DA
	c0JX0H0czrYA6aYrdW69TwvJkq7wuL1oRdRwA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=S60wtFrgGezcsLOaj4xTPAF06OgYsgOwEJOzv7pw/VX/Saj3HAyc3XRq6LMYO5Aw2V
	Umbxkcn6mgrtx8JwxY43y22+75mztHLZLK256iFcpVEF0n286iB6mKnjLbn3TPtj+WTa
	AL3Mr0Wok9Op2WcYcZs901f/d8MfV0LnEef/w=
MIME-Version: 1.0
Received: by 10.100.243.18 with SMTP id q18mr2351680anh.166.1276299002796; 
	Fri, 11 Jun 2010 16:30:02 -0700 (PDT)
Received: by 10.100.194.6 with HTTP; Fri, 11 Jun 2010 16:30:02 -0700 (PDT)
In-Reply-To: <huu4pl$15q$1@dough.gmane.org>
References: <AANLkTimkddVJqU15C0NqsM5L3zPVvgfX5sZo4hXU6385@mail.gmail.com>
	<huu4pl$15q$1@dough.gmane.org>
Date: Sat, 12 Jun 2010 01:30:02 +0200
Message-ID: <AANLkTimtrT1cf3KPyQIyLitp3N-WOS0ZusuBctDG5GuA@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: psplash vs. psplash-$DISTRO
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
X-List-Received-Date: Fri, 11 Jun 2010 23:34:31 -0000
Content-Type: text/plain; charset=ISO-8859-1

hello koen,

> No, SPLASH is an image var and has no place in RRECOMMENDS*.

My bad.
Until today I thought SPLASH was a distro thing...:/

> Furthermore, every image that is using psplash-zap was created by an
> angstrom developer, so what is the actual problem you are trying to address?

I was trying minimal and got:

ERROR: Multiple .bb files are due to be built which each provide
virtual/psplash (/oe/openembedded/recipes/psplash/psplash_svn.bb
/oe/openembedded/recipes/psplash/psplash-angstrom_svn.bb).

> In the future if you want to go break basic stuff, please RFC a patch on
> this mailinglist first.

Well, this is not so basic: only 2 images are using psplash-zap!
But you're right, an RFC would have been more appropriated than this thread.

Regards

Andrea


