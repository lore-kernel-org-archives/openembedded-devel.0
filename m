Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Omi2D-00027g-Uz
	for openembedded-devel@lists.openembedded.org;
	Sat, 21 Aug 2010 08:58:35 +0200
Received: by iwn2 with SMTP id 2so1099952iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Aug 2010 23:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=lLKpNHFtLQ59bSNiBTxbIkwm2UCxfdDXNfo65vX+BTs=;
	b=i6H0sPWfMY2ft+9TNyetSv4gFO1dSRtsIfHyKDffzArJAMRCLrtm6dvJHeNS7wOfYg
	jHhR/84oxu9gXudc9UREvwfF27JQ0bpud/zBY3dWP2Zs+3g7gxdEXUq9aK3+fq5YhWRf
	UntAukPdAjmmTJ8GSK4Dc0j5dBD8PfIuJdKJA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=AuqdFErq72CJiaeOF1ixgZNscTfpL730R7S9rzxW/49Pfl2b7+Xc32gL8JmNmw10tl
	D5yviIY0WlXxM7y9G1bGJ6cnzuUfeW0kuxXHIKK/zDvRt1fQgiMAwvn9YmzFu1pdZDUt
	HdjGqte9HenTcXcwcc83Z9f6eOVX4+QIenUKA=
MIME-Version: 1.0
Received: by 10.231.184.156 with SMTP id ck28mr2748899ibb.168.1282373892315;
	Fri, 20 Aug 2010 23:58:12 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Fri, 20 Aug 2010 23:58:11 -0700 (PDT)
In-Reply-To: <404544342.1017011281902144985.JavaMail.root@zimbra44-e7.priv.proxad.net>
References: <246310099.1016461281901672121.JavaMail.root@zimbra44-e7.priv.proxad.net>
	<404544342.1017011281902144985.JavaMail.root@zimbra44-e7.priv.proxad.net>
Date: Sat, 21 Aug 2010 08:58:11 +0200
Message-ID: <AANLkTi=DAE8Ch9rkM_FStx4vLjG0Wm=SBtAGvEtA6yLM@mail.gmail.com>
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
Subject: Re: orphaned files
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
X-List-Received-Date: Sat, 21 Aug 2010 06:58:35 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/8/15  <ydirson@free.fr>:

> It would be nice to have a checker script (not like lintian for debian
> packages), which would check for such probable or sure errors in packagin=
g.
> Having it run when a recipe gets updated would help the person currently
> know where to look for improvements, and delaying in this case effective =
removal
> till someone who cares about the recipe can look at it, would probably
> cause a gradual improvement of the recipes. =A0Put another way, that woul=
d
> be: allow people who care with improving quality to just point the oe pro=
ject to
> directions of improvements, and (when meaningful) let the ones who know
> the recipes best decide on the best course of action for that recipe.
>
> Similarly (please excuse my Debian background), publishing the results of
> such automated tests on the oe website would allow someone to quickly get=
 a grasp
> on the state of a package he cares about, possibly bringing more people t=
o
> contribute ? =A0Have a look at packages.qa.debian.org, http://qa.debian.o=
rg/developer.php
> and the services aggregated from there for more details.
>
> That also reminds me I thought a couple of days ago that something like t=
he "Debian External
> Health Status" system would benefit much to oe, to help contributors to f=
ocus. =A0Maybe something
> can even be reused there, we would mostly have to add support for somethi=
ng like debian/watch
> files in the oe recipes and do probably-minor changes to the scripts that=
 use them.
> See http://dehs.alioth.debian.org/stats.html

I think this would definitely help, but I'm not sure how to set this up.
If there is a good testing system, I might be able to get some cpu
cycles and disk space for it.

As a starter it would already be nice to have a tool to check for
stale/unused files.
However, I think it is beyond my python knowledge to write one.

Frans.


