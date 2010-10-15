Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P6oHP-0003Vy-68
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Oct 2010 19:41:20 +0200
Received: by gxk19 with SMTP id 19so462885gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Oct 2010 10:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=M80tvrP98xuGw6vuNlYE0L6qZB+H9rJ55DlEk4JhoKE=;
	b=lIYVYarWs4tQn3qbmRVL4iGe/S97eadgL71vNKfC3TNpgQHBzLiPs6BzHtxD3oceJy
	HfQWgJkW3vsK5EyHhHr17ook0BoBzxtHfVfDly4k49IE+6ClvEqYYILb+2Jrwz3BuIxw
	hqQE6mJaY0SbwaBr5p0iXrJEh3vAgI0/Uf56Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=I7QbQVEqgiiVCRdC4Ezi189bbct5H0Inu5SXyjPoeyKmavJbjJtg++r9XqHebFeXZS
	lMIstGS4yWWR7xzOJInpG9+4rorqyOgaDz+oxcPanf//58AaxqnjcC8x72WjLmTAphn1
	zQ0g2dQZ4eMC9La2GPMS1hp/vrikFQLyyVHBw=
MIME-Version: 1.0
Received: by 10.151.40.14 with SMTP id s14mr2122632ybj.57.1287164445776; Fri,
	15 Oct 2010 10:40:45 -0700 (PDT)
Received: by 10.150.158.9 with HTTP; Fri, 15 Oct 2010 10:40:45 -0700 (PDT)
In-Reply-To: <1287159817.3770.582.camel@mill.internal.reciva.com>
References: <1287159817.3770.582.camel@mill.internal.reciva.com>
Date: Fri, 15 Oct 2010 19:40:45 +0200
Message-ID: <AANLkTimtZ47bGivhqWnkkHVnUp1DBL8vHdFhzyqRKM0m@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: TSC minutes for 20101007
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
X-List-Received-Date: Fri, 15 Oct 2010 17:41:20 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/10/15 Phil Blundell <philb@gnu.org>:

Phil, thanks for your minutes. TSC thanks for the wise decisions.

>
> 3. MAINTAINER(S)
>
> Frans Meulenbroeks requested the TSC to consider whether the MAINTAINER
> field in recipes should be revived, on the grounds that the existing
> MAINTAINERS text file is not performing well and many recipes/distros
> appear to be orphaned.
>
> The TSC considers that the MAINTAINER field has not been a success in
> the past and there is no evidence that it will work better this time.
> The TSC also feels that, since MAINTAINER is included in output
> packages, it would be best left to individual DISTROs to decide how (if
> at all) they wish to set that variable.
>
> However, the TSC acknowledges that the existing MAINTAINERS file is
> indeed stale and of questionable value. =A0Accordingly, the TSC proposes
> to start with a fresh copy of the file and invite active maintainers to
> migrate their entries from the old one.

Actually the request was to add MAINTAINER in distro and machine conf
files and in recipes, and I also indicated that in my opinion at least
for distro and machine it is good to know who is the owner.
We seem to have some stale distro's (see
http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-August/022698.=
html)
and I also feel that we have some stale machines.

Note also that there are ways to define the value in different ways.
E.g. I can image a # comment in the .conf file.
Restarting MAINTAINERS is also possible.

BTW the root cause of my request is not the because I want to have the
MAINTAINER field in the recipe.
Idea is to know whom to contact in case there is an issue, and make it
clear when a distro or machine (and to a lesser extend a recipe)
becomes orphaned.
Since distro's (and to a lesser case conf files) can pin recipes it
seems more important that it has an identified maintainer.
>
> 4. Speed of removal
>
> Richard noted that he feels the pace of removal has been too slow.
>
> Chris noted that the pace of development has been too slow in general,
> and that removals are just one part of this.

Should we discuss this at OEDEM ?

Best regards, Frans


