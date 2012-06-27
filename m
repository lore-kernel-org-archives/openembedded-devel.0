Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Sjufe-0002w4-QG
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 Jun 2012 18:00:47 +0200
Received: by eaal1 with SMTP id l1so471650eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jun 2012 08:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=N0VqvGnNvobFeHerOc1CPO9nzQfRpHSp6aXf+0Ah/Wc=;
	b=yg49vuoRejWz+iioBCEAuZOJiR2MAO14nHy1LVSBK4T4DVTvYiVtq+a8pOsMyo9/4+
	57bEgCiHE673O8T8CHoLCWjItkqta++tDvAu3C5Gy52E1mW0fSn0ZLbJGg7vJu79tTCj
	z88W4I0q4baHP6uQ18XoHqnX/UZrIXWxNMW0Eoojuk2KxNGDXr1Q8vAkSqAFiCd/PGQj
	beG7cCJQzP+AGo0d4Mcxx4B+zh1c/DijtrpwLaGaNOM1Z8FqWQoVnjcxVVHQjlcTYeMn
	H+kf5+fQ+kSMvHzzyrfI0zuimxaG0ZaWoCSyYcu7ADQS6Posk36jVtX4GkXPSw//Vnb9
	STrQ==
Received: by 10.14.119.202 with SMTP id n50mr4124179eeh.33.1340812193313; Wed,
	27 Jun 2012 08:49:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.219.71 with HTTP; Wed, 27 Jun 2012 08:49:22 -0700 (PDT)
In-Reply-To: <20317992.tBZ1YY1I5v@helios>
References: <20317992.tBZ1YY1I5v@helios>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 27 Jun 2012 08:49:22 -0700
Message-ID: <CAMKF1spB5Q3BHhbbnf6ARfJBZ=si-LE-7wYw07w=_ODSG4dPOA@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: yocto@yoctoproject.org, openembedded-devel@lists.openembedded.org,
	joe.macdonald@windriver.com
Subject: Re: [yocto] LAMP layer
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
X-List-Received-Date: Wed, 27 Jun 2012 16:00:47 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jun 27, 2012 at 7:05 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> Hi all,
>
> In conjunction with the folks at Wind River I'm currently in the process of
> putting together a layer to support the traditional LAMP stack, and wanted to
> solicit some opinions on how this might be structured/named/etc.
>
> I think we have the "L" pretty much covered ;) and we have MySQL in meta-oe
> (I'm not convinced that's where it should stay, although perhaps it need not
> be tied to this layer either). So the layer would at the very least be adding
> Apache and PHP, with the possibility of web-related python and perl recipes
> being added at a later date.
>
> Some of the other things I'm looking at adding more immediately:
>
> * collectd
> * mysql-connector-odbc
> * phpMyAdmin
> * unixODBC
> * xdebug
>
> The question of how this should all be structured is still not fully
> determined. I'm thinking this ought to be at least one additional layer (i.e.
> meta-lamp, or some other name), even in the face of the proposed meta-
> networking, since the number of recipes in the LAMP layer is likely to grow
> over time and it's a specific set of functionality that people would explicitly
> select.
>
> I now have updated apache and modphp recipes building and working reasonably
> well, although further testing will be needed. Initially I'm prepared to
> maintain these recipes, however if not immediately at some point in the near
> future it would be good to see a maintainer step forward with more specific
> knowledge of these particular pieces of software.
>
> Thoughts?
>

I think PHP probably is common enough to be part
of meta-oe or core. instead of lamp call it something else may be
meta-webservers or something
and more alternatives can also be put in there
> Cheers,
> Paul
>
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre
> _______________________________________________
> yocto mailing list
> yocto@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/yocto


