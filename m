Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PKQ74-0005na-0r
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Nov 2010 07:42:55 +0100
Received: by gyd12 with SMTP id 12so1290169gyd.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Nov 2010 22:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=k0pZRhWIgF1kYKVhD2OB6n4PJobwq5/o78eJdWxx+Ig=;
	b=jpcg/thBV/P4WkrXtZaORXjJblNkD34rT+cbjTikHkCiM42WlsGvPeNj9n3XAkQ3Cv
	KYlmGaGLj+BBoya0gK+fDwmBxFAxoIVvze5qRH2x8ltCrQCsQ+Bdu4KouRDrKxWI6Bma
	Jon7Fc1JCZI8L4Mm1fOMHPUCI28JEDLnQUvYk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=q2VSwyRBk49lMySREDoExO88BKpzk6RHQ/kjUw4KS6VCDE/LaYKuo8dcob8B4hz01E
	om586DuZNadNM/NnmfhB2d9KgqiYwD1l18dyopxfl+Gfj60n+tF0K34U+W21Af9pBafg
	XWcBSAuX8uNzEG6w241mq3ydl71HyB20nSFHc=
Received: by 10.91.12.18 with SMTP id p18mr5310396agi.48.1290408101587; Sun,
	21 Nov 2010 22:41:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.120.8 with HTTP; Sun, 21 Nov 2010 22:41:21 -0800 (PST)
In-Reply-To: <1290383951-6683-2-git-send-email-obi@opendreambox.org>
References: <1290383951-6683-1-git-send-email-obi@opendreambox.org>
	<1290383951-6683-2-git-send-email-obi@opendreambox.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 21 Nov 2010 22:41:21 -0800
Message-ID: <AANLkTik2nb17h=X+GWH_pHTBNd6_ZX_wdYSNVfMW_D7U@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/3] swfdec-gnome: use the pkg-config file installed by swfdec
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
X-List-Received-Date: Mon, 22 Nov 2010 06:42:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 21, 2010 at 3:59 PM, Andreas Oberritter
<obi@opendreambox.org> wrote:
> * swfdec installs swfdec-0.9.pc, not swfdec.pc
>
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>

Acked-by: Khem Raj <raj.khem@gmail.com>
> ---
> =C2=A0recipes/swfdec/swfdec-gnome_2.26.0.bb | =C2=A0 =C2=A04 ++--
> =C2=A01 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes/swfdec/swfdec-gnome_2.26.0.bb b/recipes/swfdec/swfde=
c-gnome_2.26.0.bb
> index 55a49f5..1a7567c 100644
> --- a/recipes/swfdec/swfdec-gnome_2.26.0.bb
> +++ b/recipes/swfdec/swfdec-gnome_2.26.0.bb
> @@ -2,12 +2,12 @@ DESCRIPTION =3D "flash plugin"
> =C2=A0LICENSE =3D "GPL"
>
> =C2=A0DEPENDS =3D "gtk+ gconf swfdec"
> +PR =3D "r1"
>
> =C2=A0inherit gnome pkgconfig
>
> =C2=A0do_configure_prepend() {
> - =C2=A0 =C2=A0 =C2=A0 sed -i -e 's/swfdec-$SWFDEC_MAJORMINOR/swfdec/g' c=
onfigure.ac
> - =C2=A0 =C2=A0 =C2=A0 sed -i -e 's/swfdec-gtk-$SWFDEC_MAJORMINOR/swfdec-=
gtk/g' configure.ac
> + =C2=A0 =C2=A0 =C2=A0 sed -i -e 's/^SWFDEC_MAJORMINOR=3D0\.8/SWFDEC_MAJO=
RMINOR=3D0.9/' configure.ac
> =C2=A0}
>
>
> --
> 1.7.1
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


