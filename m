Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1PNztB-0002AS-Mh
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Dec 2010 04:31:22 +0100
Received: by bwz10 with SMTP id 10so6695447bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Dec 2010 19:30:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=+K2I7bSd7AH8bnG1YzOM8xXOBMwJSu75Ja+DMQB662Q=;
	b=LWxHqFMeXA6aN28xGiuuvcYf81oIXxaRFumlqyyBE2dvqbStQUbztYOiBlUMVWw9Zm
	n89e0aV9K16R2HLhJtZpyVOA9XNoJK5RR0R9+J0nbfp5URezwctiltHjm+dEXE6Bz/sE
	EeRKceX115aTk88+sytA8CAD7aZE54Ngf91NU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=e9hBI6hANwGr0sZErSm540LDrmJO6P4nDTboTfQucWpRQ8qbmAyeo4dHpAq58csMDO
	qcIsyHaPphgx44zgQ03sGlpsz+N3MOWBqSQIxVUjpxd+uOh7lQ5j0QLq9a6U8OTEDcXG
	Pbj6pHCpllp4Q1s1CLor683DpRKtDKoXa8EXk=
MIME-Version: 1.0
Received: by 10.204.59.193 with SMTP id m1mr9435338bkh.176.1291260601350; Wed,
	01 Dec 2010 19:30:01 -0800 (PST)
Received: by 10.204.113.72 with HTTP; Wed, 1 Dec 2010 19:30:01 -0800 (PST)
In-Reply-To: <4CF6E4B8.5020806@gmail.com>
References: <4CF6E4B8.5020806@gmail.com>
Date: Thu, 2 Dec 2010 14:00:01 +1030
Message-ID: <AANLkTikeNJqUYTmNGJAjzgqVp4UBJqJCoDQ4ayr=AbXf@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/2] automake.inc: bootstrap aclocal.
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
X-List-Received-Date: Thu, 02 Dec 2010 03:31:22 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 2 December 2010 10:43, Graham Gower <graham.gower@gmail.com> wrote:
> Fixes problems seen with micro-uclibc.
>
> NOTE: make -j 12
> CDPATH=3D"${ZSH_VERSION+.}:" && cd . && perllibdir=3D"/mnt/oe/tmp/work/mi=
psel-oe-linux-uclibc/automake-1.11.1-r3.2/automake-1.11.1/lib:./lib" "/mnt/=
oe/tmp/work/mipsel-oe-linux-uclibc/automake-1.11.1-r3.2/automake-1.11.1/acl=
ocal" --acdir=3Dm4 -I m4
> /bin/sh: /mnt/oe/tmp/work/mipsel-oe-linux-uclibc/automake-1.11.1-r3.2/aut=
omake-1.11.1/aclocal: No such file or directory
> make: *** [aclocal.m4] Error 127
> FATAL: oe_runmake failed
>
> Signed-off-by: Graham Gower <graham.gower@gmail.com>
> ---
> =A0recipes/automake/automake.inc | =A0 31 ++++++++++++++++++++++++++++++-
> =A01 files changed, 30 insertions(+), 1 deletions(-)
>
> diff --git a/recipes/automake/automake.inc b/recipes/automake/automake.in=
c
> index e378c04..743c140 100644
> --- a/recipes/automake/automake.inc
> +++ b/recipes/automake/automake.inc
> @@ -29,17 +29,46 @@ RDEPENDS_automake +=3D "\
> =A0 =A0 perl-module-text-parsewords \
> =A0 =A0 perl-module-vars "
> =A0SRC_URI =3D "${GNU_MIRROR}/automake/automake-${PV}.tar.bz2;name=3Dauto=
make"
> -INC_PR =3D "r3"
> +INC_PR =3D "r4"
> =A0AUTOMAKE_API =3D "${@".".join(bb.data.getVar("PV",d,1).split(".")[0:2]=
)}"
>
> =A0inherit autotools
>
> =A0FILES_${PN} +=3D "${datadir}/automake* ${datadir}/aclocal*"
>
> +dosubst () {
> + =A0 =A0 =A0 ver=3D`echo "${PV}" | sed -e 's/^\([[0-9]]*\.[[0-9]]*[[a-z]=
]*\).*$/\1/'`
> + =A0 =A0 =A0 rm -f $2
> + =A0 =A0 =A0 in=3D`echo $1 | sed 's,^.*/,,'`
> + =A0 =A0 =A0 sed -e "s%@APIVERSION@%${ver}%g" \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 -e "s%@PACKAGE@%${PN}%g" \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 -e "s%@PERL@%${STAGING_BINDIR_NATIVE}/perl%=
g" \

This appears to introduce problems when doing a from scratch build.
Automake-native cannot find the perl binary. Adding perl-native to
DEPENDS creates a circular dependency.

Not to mention a whole lot of shebang lines pointing to
/mnt/oe/tmp/sysroots/x86_64-linux/bin/perl get inserted into the cross
automake scripts.

Anyone else got a bright idea how to resolve this?

-Graham


