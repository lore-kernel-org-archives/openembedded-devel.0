Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PmrE5-0008RD-I9
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Feb 2011 18:19:43 +0100
Received: by yie16 with SMTP id 16so2363408yie.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Feb 2011 09:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=XBCpKWssYjj8Airx1KJ2sdk9bpZoOYmHAsok9RSkbM4=;
	b=gXFvLnWmMF+3AWjHYQsvu1fzmGqn1cVgjGx0V1Ofoth/7hKxx77Yy/YAs54R40uEg2
	X0irr7NXbPHaAH7UJmx0oNqk4BCzFEawoQGAaJLMi33kghNFTS/9ek6Uuh6tt8u8JXWB
	y6DqubsYdQrIEfpzkywSPa2gNTGAsxMVcQDhg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=UbqqSFcBZp3RmW7UZfStUCv6iKdRbxkrUIpOe+L/sazJfoJsKv3EyN3/3/X1UzTzFo
	+xRMrGNmztAIXi57wKkMRwfeuVIdNlRRZT6ges79NhXpTMJ7/8izlvb6nx1tmNFkMSuu
	9eBE1JbU0I10aPYkQGMGiaRfQfNLz96YI5GPI=
Received: by 10.90.89.18 with SMTP id m18mr211120agb.169.1297185515916; Tue,
	08 Feb 2011 09:18:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.32.12 with HTTP; Tue, 8 Feb 2011 09:18:15 -0800 (PST)
In-Reply-To: <1297181802-18948-3-git-send-email-kergoth@gmail.com>
References: <1297181802-18948-1-git-send-email-kergoth@gmail.com>
	<1297181802-18948-3-git-send-email-kergoth@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 8 Feb 2011 09:18:15 -0800
Message-ID: <AANLkTi=zGLRdYGyQTsbhn1j5Din+k6_pz_40i_GTt4re@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Chris Larson <chris_larson@mentor.com>
Subject: Re: [PATCH 3/4] autotools: symlink where we can
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
X-List-Received-Date: Tue, 08 Feb 2011 17:19:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 8, 2011 at 8:16 AM, Chris Larson <kergoth@gmail.com> wrote:
> From: Chris Larson <chris_larson@mentor.com>
>
> Signed-off-by: Chris Larson <chris_larson@mentor.com>

now that we will have symlinks will it have any impact on source
package generation ?
otherwise

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
> =C2=A0classes/autotools.bbclass | =C2=A0 =C2=A08 ++++----
> =C2=A01 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/classes/autotools.bbclass b/classes/autotools.bbclass
> index 9744589..a88a4d1 100644
> --- a/classes/autotools.bbclass
> +++ b/classes/autotools.bbclass
> @@ -137,11 +137,11 @@ oe_autoreconf () {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if grep "sed.*POTF=
ILES" $CONFIGURE_AC >/dev/null; then
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0: do nothing -- we still have an old unmodified configure.ac
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 echo "no" | glib-gettextize --force --copy
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 echo "no" | glib-gettextize --force
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi
> =C2=A0 =C2=A0 =C2=A0 =C2=A0else if grep "^[[:space:]]*AM_GNU_GETTEXT" $CO=
NFIGURE_AC >/dev/null; then
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -e ${STAGING_=
DATADIR}/gettext/config.rpath ]; then
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 cp ${STAGING_DATADIR}/gettext/config.rpath ${S}/
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 ln -sf ${STAGING_DATADIR}/gettext/config.rpath ${S}/
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0oenote ${STAGING_DATADIR}/gettext/config.rpath not found. gettext=
 is not installed.
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi
> @@ -151,9 +151,9 @@ oe_autoreconf () {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0for aux in m4 `sed -n -e '/^[[:space:]]*AC_CON=
FIG_MACRO_DIR/s|[^(]*([[]*\([^])]*\)[]]*)|\1|p' $CONFIGURE_AC`; do
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p ${aux}
> =C2=A0 =C2=A0 =C2=A0 =C2=A0done
> - =C2=A0 =C2=A0 =C2=A0 autoreconf -Wcross --verbose --install --force ${E=
XTRA_AUTORECONF} $acpaths || oefatal "autoreconf execution failed."
> + =C2=A0 =C2=A0 =C2=A0 autoreconf -Wcross --verbose --install --symlink -=
-force ${EXTRA_AUTORECONF} $acpaths || oefatal "autoreconf execution failed=
."
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if grep "^[[:space:]]*[AI][CT]_PROG_INTLTOOL" =
$CONFIGURE_AC >/dev/null; then
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 intltoolize --copy --f=
orce --automake
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 intltoolize --force --=
automake
> =C2=A0 =C2=A0 =C2=A0 =C2=A0fi
> =C2=A0}
>
> --
> 1.7.2.3
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


