Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PpuSb-0000U4-6A
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Feb 2011 04:23:17 +0100
Received: by fxm17 with SMTP id 17so2043444fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Feb 2011 19:22:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=avILaJ2TmcPe0hwkuT/2zlouFg0i/Ue9fNPv27H46sE=;
	b=nA0cXVN8dfgrGKpNUWO5Iy2jcA5AJFqrvgyg0W6TnzCrIzGDr1zLvJfz205LT4l2n0
	4nns0sjwIwCGrJ3nHeJBtWgyk4zaYP/aSmq7wh72d8JHJtHPKey14eEdahAWtlt8S39F
	1oQFmsSPQHs7bha5n6O9IzcN5HyrlOdSuzlQo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	b=ALOtcA00kmGlHPHw/cEDSwBcZspqSMy+5GdNa3O5pCyAPscBMQIcP1eghURTnFii1i
	y0HS2NaM+iFDk5MgAxxPq32oJjrgbpI18+ppwzHobuDWwpU0NgRlmNPlC39PyZ1i1MEu
	SkvaKpPmpF5qJFz0CSqHAroIPbaBdMhq3uHmA=
Received: by 10.223.96.199 with SMTP id i7mr1712305fan.101.1297912925517; Wed,
	16 Feb 2011 19:22:05 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.66.22 with HTTP; Wed, 16 Feb 2011 19:21:45 -0800 (PST)
In-Reply-To: <201102170226.53460.schnitzeltony@gmx.de>
References: <201102170226.53460.schnitzeltony@gmx.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 16 Feb 2011 19:21:45 -0800
Message-ID: <AANLkTinefnq9o6Ygep829mGNOjeXqVMsn1hO_c8zXcRk@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: QA RPATH error for c++ packages?
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
X-List-Received-Date: Thu, 17 Feb 2011 03:23:17 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Feb 16, 2011 at 5:26 PM, Andreas Mueller <schnitzeltony@gmx.de> wrote:
> Good evening OE folks,
>
> have started to investigate QA RPATH error for clutter-box2d. More or less
> accidental I fell over the following lines in 'clutter-box2d-0.10.0-
> r2.0+git4e72b9c135a9439b82d801c62422531db611f98b/git/clutter-
> box2d/.libs/libclutter-box2d-0.10.lai':


Is this recipe using its own version of libtool ? IOW is it overriding
do_configure
that it gets from autotools


