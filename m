Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OkuIG-0007BP-9i
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Aug 2010 09:39:41 +0200
Received: by gxk2 with SMTP id 2so1883725gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Aug 2010 00:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=lLKMw1UT3bBkhiiyKn5tB+qvaLHWOLcaSAyCRksPEoU=;
	b=bs9OtxNhXWV4t0iNVCwsODqCsZfsUGBV2UiJQdXjX7JrAcvRvzxH9LItHE+F6ZCl2f
	6OAACFSBNo60SoXQ9rcLiZ2gpJMsslMI2O/jPG1Cjmo25WBqE5x3amxOkxQiM7HViGnU
	BnAgcYBxpoKsTPsa+52zqDsjsvbEoRzz6U10I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=IAVvNMseO0xVMPDOx3+0kQTJgjF50q8GYCqnm73UIoog4qu4HihacS1jh4DdJqrG1L
	1jKiVdYl9NX6uwCHRqxZEZXdiQNjmc3BguElo1YnV0A3DoyDhwUlGL5mBptg2YcHruVp
	MwJanYQ7RaDvc7PHt0fwI9AKNUX57uv/LfsSI=
MIME-Version: 1.0
Received: by 10.101.106.7 with SMTP id i7mr5300521anm.176.1281944362864; Mon,
	16 Aug 2010 00:39:22 -0700 (PDT)
Received: by 10.231.208.72 with HTTP; Mon, 16 Aug 2010 00:39:22 -0700 (PDT)
In-Reply-To: <20100816061540.GA13569@gmail.com>
References: <AANLkTikW6GsKga3=6dWUcviDJqb8WqVqhSmBw6vACM3e@mail.gmail.com>
	<4C68BDBF.1090008@mwester.net> <20100816061540.GA13569@gmail.com>
Date: Mon, 16 Aug 2010 09:39:22 +0200
Message-ID: <AANLkTi=N23DdWZ3nSt-n--3aBW2mUeMt+gQrnwadoaqS@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: cleaning recipes
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
X-List-Received-Date: Mon, 16 Aug 2010 07:39:41 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/8/16 Khem Raj <raj.khem@gmail.com>:
> On (15/08/10 23:25), Mike Westerhof wrote:
>> Frans Meulenbroeks wrote:
>> ...
>> > Anyway, if there are issues because of this action, or if you feel
>> > removal of a recipe was not in accordance with the TSC guidelines, let
>> > me know and I'll repair.
>>
>> Well, here's the first one, docbook-sgml-dtd-3.1-native, full log below:
>
>
> heh I am running into same problem =A0when building from scratch :) This =
is my temporary fix that I am
> building with now at least it goes thru parse stage. I havent looked the
> effects of bumping up this dependency version yet. May be its ok may be i=
t
> is wrong.
>
> diff --git a/recipes/docbook-utils/docbook-utils-native_0.6.14.bb
> b/recipes/docbook-utils/docbook-utils-native_0.6.14.bb
> index 595aa50..52c2ebb 100644
> --- a/recipes/docbook-utils/docbook-utils-native_0.6.14.bb
> +++ b/recipes/docbook-utils/docbook-utils-native_0.6.14.bb
> @@ -3,7 +3,7 @@ LICENSE =3D "GPL"
>
> =A0PR =3D "r2"
>
> -DEPENDS =3D "openjade-native sgmlspl-native docbook-dsssl-stylesheets-na=
tive docbook-sgml-dtd-3.1-native"
> +DEPENDS =3D "openjade-native sgmlspl-native docbook-dsssl-stylesheets-na=
tive docbook-sgml-dtd-4.4-native"
>
> =A0SRC_URI =3D "ftp://sources.redhat.com/pub/docbook-tools/new-trials/SOU=
RCES/docbook-utils-${PV}.tar.gz"
> =A0S =3D "${WORKDIR}/docbook-utils-${PV}"
>

Seems a nice patch to me.
If desired also feel free to revert my removal patch.
Apparently I overlooked the case where recipes could DEPEND on
specific versions of a recipe.

There are probably a few more cases of this (easily identified as
bitbake will complain immediately if it bumps into one of these).
I'll peek at it tonight.

And wrt everyone hit by this: my apologies.
but hey: that is the risk if you want to live on the edge

Have fun! Frans


