Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OlSFl-0005fJ-QI
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Aug 2010 21:55:36 +0200
Received: by gya6 with SMTP id 6so365115gya.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Aug 2010 12:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=C94nRW1c9n8AACzdABt9VCOJo5+c/Ofdhys5aORyVzI=;
	b=mR9foP0WlL1p48kUkPcEA7L6k2VGPx4upFRHUZQPPdu35bSESUPde3NMMx3xUI+wky
	cetlgt3e2v46g0I+cXFiDpAqYdhIhkbgJQuOyU87Pm3LHww+htTHi1vgc049dF8Dxj/D
	gl+pEsXQ+yvynjOhLr+pl8NZ2TIBFhVi1P13Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=RSxPQ1pItLxM2XO8FoQXYk+9WRs+VdQrPf6ysL+IattP8VuWcSGXqE8ujDLDD8Qvs2
	l412L5WT+OLBimFv9AV5DcFR5RK6Ljko7siG2YGchBiGeb+fz0tEgv5QNNbAd4tLINxM
	XPOp4RGcuvikvQWRw7jKDiS7mYbnH3T5DqDwA=
MIME-Version: 1.0
Received: by 10.231.162.13 with SMTP id t13mr7895890ibx.160.1282074891903;
	Tue, 17 Aug 2010 12:54:51 -0700 (PDT)
Received: by 10.231.208.72 with HTTP; Tue, 17 Aug 2010 12:54:51 -0700 (PDT)
In-Reply-To: <1282072886-11562-2-git-send-email-jkridner@beagleboard.org>
References: <1282072886-11562-1-git-send-email-jkridner@beagleboard.org>
	<1282072886-11562-2-git-send-email-jkridner@beagleboard.org>
Date: Tue, 17 Aug 2010 21:54:51 +0200
Message-ID: <AANLkTik73cayAjmykmJvp8KqsJ_XrBfQTOkM8MJWydsP@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] beagleboard-olddemo-image: saved off beagleboard-demo-image
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
X-List-Received-Date: Tue, 17 Aug 2010 19:55:36 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/8/17 Jason Kridner <jkridner@beagleboard.org>:
> I want to use the name beagleboard-demo-image for what actually ships
> with the xM boards.
>
> Signed-off-by: Jason Kridner <jkridner@beagleboard.org>
> ---
> =A0recipes/images/beagleboard-olddemo-image.bb | =A0 30 +++++++++++++++++=
++++++++++
> =A01 files changed, 30 insertions(+), 0 deletions(-)
> =A0create mode 100644 recipes/images/beagleboard-olddemo-image.bb
>
> diff --git a/recipes/images/beagleboard-olddemo-image.bb b/recipes/images=
/beagleboard-olddemo-image.bb
> new file mode 100644
> index 0000000..d83281c
> --- /dev/null
> +++ b/recipes/images/beagleboard-olddemo-image.bb
> @@ -0,0 +1,30 @@
> +# Demo image for beagleboard
> +
> +IMAGE_LINGUAS =3D "de-de fr-fr en-gb en-us pt-br es-es kn-in ml-in ta-in=
"
> +
> +XSERVER ?=3D "xserver-xorg \
> + =A0 =A0 =A0 =A0 =A0 xf86-input-evdev \
> + =A0 =A0 =A0 =A0 =A0 xf86-input-mouse \
> + =A0 =A0 =A0 =A0 =A0 xf86-video-fbdev \
> + =A0 =A0 =A0 =A0 =A0 xf86-input-keyboard \
> +"
> +
> +ANGSTROM_EXTRA_INSTALL ?=3D ""
> +SPLASH =3D "exquisite exquisite-themes exquisite-theme-angstrom"
> +
> +export IMAGE_BASENAME =3D "Beagleboard-demo-image"
> +
> +DEPENDS =3D "task-base"
> +IMAGE_INSTALL =3D "\
> + =A0 =A0${XSERVER} \
> + =A0 =A0${ANGSTROM_EXTRA_INSTALL} \
> + =A0 =A0task-beagleboard-demo \
> + =A0 =A0${SPLASH} \
> + =A0 =A0"
> +
> +IMAGE_PREPROCESS_COMMAND =3D "create_etc_timestamp"
> +
> +#zap root password for release images
> +ROOTFS_POSTPROCESS_COMMAND +=3D 'install_linguas; ${@base_conditional("D=
ISTRO_TYPE", "release", "zap_root_password; ", "",d)}'
> +
> +inherit image
> --

What about a better name? E.g. XM-demo-iimage?

And to widen the question: do we want to maintain customer/supplier
specific images in the oe repo?
The company I work for also has some images, but for now we opted to
keep them in a private overlay.

Frans


