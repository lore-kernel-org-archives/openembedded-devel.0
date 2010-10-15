Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P6eO8-0000NH-OU
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Oct 2010 09:07:37 +0200
Received: by iwn2 with SMTP id 2so559477iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Oct 2010 00:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=zcGddnVNO/YDxP1QAu43vSGsDgIucH/xwUDKi4jSUX8=;
	b=vlBUMzqkw76N1NHBw+fVVVpleI2vTN+zO3E/PcP9Zg0gIfpNb+M2Fx86H3Dau0vKyz
	c40v0MdgK+5zcmhFGUiFDaOXxBowfhk6jQXyzub8WU4A5mPmghfdlOf5sfvFlD1tHDrY
	Oul3KkcpyHkoYx3ZwxRDsO00wT2+kBjipMSmo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=akrOjMQP1B0uCcAyXHdkSO0txnQb0CyawDxWEjK2mNE+cuNsoNv8TrKLL0Z8KCvof0
	qTshjUKt7pCr3OulK9caRD9xoqxD1AGQsbuZBBqyyL4+6ciqLuBds7kRrUtndNLRzZQ/
	Tq8zybI4+6Th2qAj4Be9hEowK06TtCuwHDdEo=
MIME-Version: 1.0
Received: by 10.231.191.138 with SMTP id dm10mr209898ibb.126.1287126428747;
	Fri, 15 Oct 2010 00:07:08 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Fri, 15 Oct 2010 00:07:08 -0700 (PDT)
In-Reply-To: <1287123859-31756-1-git-send-email-morphis@gravedo.de>
References: <1287123859-31756-1-git-send-email-morphis@gravedo.de>
Date: Fri, 15 Oct 2010 09:07:08 +0200
Message-ID: <AANLkTi=tvR6=LmMyEjwXQSuDBHJsbMH6dUZrnpBzOMc3@mail.gmail.com>
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
Subject: Re: [PATCH] python-pycairo: convert to new style staging and bump PR
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
X-List-Received-Date: Fri, 15 Oct 2010 07:07:37 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/10/15 Simon Busch <morphis@gravedo.de>:
> Signed-off-by: Simon Busch <morphis@gravedo.de>
> ---
> =A0recipes/python/python-pycairo_1.4.0.bb | =A0 =A04 ++--
> =A01 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes/python/python-pycairo_1.4.0.bb b/recipes/python/pyth=
on-pycairo_1.4.0.bb
> index 94bb338..b0cbf95 100644
> --- a/recipes/python/python-pycairo_1.4.0.bb
> +++ b/recipes/python/python-pycairo_1.4.0.bb
> @@ -3,7 +3,7 @@ SECTION =3D "devel/python"
> =A0HOMEPAGE =3D "http://cairographics.org/pycairo"
> =A0LICENSE =3D "LGPL MPL"
> =A0DEPENDS =3D "cairo"
> -PR =3D "ml3"
> +PR =3D "ml4"
>
> =A0SRC_URI =3D "http://cairographics.org/releases/pycairo-${PV}.tar.gz \
> =A0 =A0 =A0 =A0 =A0 =A0file://fix-setup-py.patch"
> @@ -15,7 +15,7 @@ do_configure_append() {
> =A0 =A0 =A0 =A0sed -e 's:@prefix@:${prefix}:' -e 's:@includedir@:\$\{pref=
ix\}/include:' -e 's:@VERSION@:${PV}:' pycairo.pc.in > pycairo.pc
> =A0}
>
> -do_stage() {
> +do_install_append() {
> =A0 =A0 =A0 =A0install -d ${STAGING_INCDIR}
> =A0 =A0 =A0 =A0install -m 0644 cairo/pycairo.h ${STAGING_INCDIR}
> =A0}


Some concerns:
I don't think STAGING_INCDIR should be used; guess it should go to
${D}/${includedir} (just like the 1.8.0 version does).
You might also peek at the do_install_append of the 1.8.0 recipe as it
does different/more things. I don't know too much about pycairo, but I
can imagine these make sense for 1.4.0 too.

Then again perhaps it is time to move to 1.8.0; this version has a
DEFAULT_PREFERENCE of -1, but angstrom 2008 and 2010 and kaeilos
already have 1.8.0 as preferred version (and the 1.8.0 version is
around for 1.5 year or so).

BTW the latest version of cairo is 1.8.10 so we might consider moving
to that version too.

Enjoy, Frans


