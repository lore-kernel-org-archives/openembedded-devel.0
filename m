Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OyqvU-0004iU-I6
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Sep 2010 20:54:00 +0200
Received: by gwb1 with SMTP id 1so729673gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Sep 2010 11:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=WC48ebXV+XRRgbeUfOYcpkxuqpxxmpniwLaGMZ3YMss=;
	b=CKhMIeDcSmxubP3Zwa7ELNEKIJxv2ZvlusqO0UIcJxl6Lbcovy87WCuJtMIc/G9dyr
	G13Rs60FJsPjmY/cTs2Qjs9Z8HIuzH2AVOzckHuW9L37pzJNinLdivxJwCoZ7pqTMnHF
	iSlNTwCdOAoFSIhbZ0LdPPIMqP6u+SG6GyqdE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=cYP4OLOmPqR5Vyxf756WygJxPFqFMix5Cy/u4eoKXyo5OGASmVbFSVppcnRlqVHeMN
	OoKkB6r28beH8kJD+74U3uKpal6RmacCU5v3o4hRMxZr7Qz1AAX9yZUzhuy5Kfk2lz7E
	W7C0PIFIXXCkOoKeA1i1Hx8ZxAwS5Ds+PZMwE=
MIME-Version: 1.0
Received: by 10.151.155.21 with SMTP id h21mr3354056ybo.394.1285268013355;
	Thu, 23 Sep 2010 11:53:33 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Thu, 23 Sep 2010 11:53:33 -0700 (PDT)
In-Reply-To: <1285248897-5198-1-git-send-email-schnitzeltony@gmx.de>
References: <1285248897-5198-1-git-send-email-schnitzeltony@gmx.de>
Date: Thu, 23 Sep 2010 20:53:33 +0200
Message-ID: <AANLkTikP=QtJNVf5N=5p-nkwLFM2FMovJEy1tS3s8grU@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v3] clutter-gtk: Bump to 0.10.8
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
X-List-Received-Date: Thu, 23 Sep 2010 18:54:01 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/9/23 Andreas Mueller <schnitzeltony@gmx.de>:
>
> Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>
> ---
> =A0recipes/clutter/clutter-gtk_0.10.6.bb | =A0 10 ----------
> =A0recipes/clutter/clutter-gtk_0.10.8.bb | =A0 10 ++++++++++
> =A02 files changed, 10 insertions(+), 10 deletions(-)
> =A0delete mode 100644 recipes/clutter/clutter-gtk_0.10.6.bb
> =A0create mode 100644 recipes/clutter/clutter-gtk_0.10.8.bb

How has this been tested.
I recall that the introduction of 10.6 caused a breakage in some distro;s.

Frans
>
> diff --git a/recipes/clutter/clutter-gtk_0.10.6.bb b/recipes/clutter/clut=
ter-gtk_0.10.6.bb
> deleted file mode 100644
> index ab66c77..0000000
> --- a/recipes/clutter/clutter-gtk_0.10.6.bb
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -require clutter-gtk.inc
> -
> -PR =3D "${INC_PR}.1"
> -
> -SRC_URI =3D "http://source.clutter-project.org/sources/clutter-gtk/0.10/=
clutter-gtk-${PV}.tar.bz2 \
> - =A0 =A0 =A0 =A0 =A0"
> -
> -SRC_URI[md5sum] =3D "e7407392b14d6cddd9d4f86feaa9bd3f"
> -SRC_URI[sha256sum] =3D "c65ec1e6b2932ed23b3db145357a96ae5ec7cb0666139468=
eba781d6c56a5371"
> -
> diff --git a/recipes/clutter/clutter-gtk_0.10.8.bb b/recipes/clutter/clut=
ter-gtk_0.10.8.bb
> new file mode 100644
> index 0000000..4f2cdae
> --- /dev/null
> +++ b/recipes/clutter/clutter-gtk_0.10.8.bb
> @@ -0,0 +1,10 @@
> +require clutter-gtk.inc
> +
> +PR =3D "${INC_PR}.0"
> +
> +SRC_URI =3D "http://source.clutter-project.org/sources/clutter-gtk/0.10/=
clutter-gtk-${PV}.tar.bz2 \
> + =A0 =A0 =A0 =A0 =A0"
> +
> +SRC_URI[md5sum] =3D "22b4ebddc795e40d83622d7d23669eff"
> +SRC_URI[sha256sum] =3D "7867f951568871d9f68cbe8a3644fd53d2138f725b7ba61f=
fc0053eb64e80814"
> +
> --
> 1.7.0.2
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


