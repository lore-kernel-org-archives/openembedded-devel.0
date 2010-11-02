Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PD8m8-0004So-KS
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Nov 2010 05:47:21 +0100
Received: by gwaa11 with SMTP id a11so3932000gwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Nov 2010 21:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=jovqgXdrxdsnwmKFYY1Ztty52SF15Yr3rxxhnda9nCM=;
	b=sEQXN65Qx4mJI1Up/EVlAM6hPBlKYZ1zAX4YVPd8rHYfeLNY44fXNRtEKnrFWo1xH9
	KHlkpaNN41U3C2Gl1+6p6HYIl3mGjxgMBNRjN5UGAP/H7xP3scjXJZZ5Gxj7yaEkq8dm
	Itu93fMmV3vITy0ZFIZwPDhcEq5Oeof4/ikhQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=coOKwCCTKTfjB6o7xPpi3EYEf9FfUrj75n6uobospp3IXGVMUURQytp1pQ2W1XpxGk
	THHyA3+W3RlWOgfEKR7VFf36dOg798dnA3Ou9mc7s0s0CeaCMaP7mkcwmw6Nza5G2j5j
	qsLPtSmvbceHkWSGzn8AQsItHVjUNtOP1WruA=
Received: by 10.91.44.12 with SMTP id w12mr829348agj.64.1288673181358; Mon, 01
	Nov 2010 21:46:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.91.135.18 with HTTP; Mon, 1 Nov 2010 21:46:01 -0700 (PDT)
In-Reply-To: <1288647332-20685-1-git-send-email-eric@eukrea.com>
References: <1288647332-20685-1-git-send-email-eric@eukrea.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 1 Nov 2010 21:46:01 -0700
Message-ID: <AANLkTim+Cn4ivUT7Hfgers1EUNP-0HzyE9Mi9uz=cirf@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/3] busybox-static: add the latest version
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
X-List-Received-Date: Tue, 02 Nov 2010 04:47:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 1, 2010 at 2:35 PM, Eric B=C3=A9nard <eric@eukrea.com> wrote:
> tested using initramfs-image
>
> Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
> =C2=A0recipes/busybox/busybox-static_1.17.3.bb | =C2=A0 11 +++++++++++
> =C2=A01 files changed, 11 insertions(+), 0 deletions(-)
> =C2=A0create mode 100644 recipes/busybox/busybox-static_1.17.3.bb
>
> diff --git a/recipes/busybox/busybox-static_1.17.3.bb b/recipes/busybox/b=
usybox-static_1.17.3.bb
> new file mode 100644
> index 0000000..325752a
> --- /dev/null
> +++ b/recipes/busybox/busybox-static_1.17.3.bb
> @@ -0,0 +1,11 @@
> +require busybox_${PV}.bb
> +PR =3D "${INC_PR}.0"
> +
> +FILESPATHPKG =3D. "busybox-${PV}:"
> +S =3D "${WORKDIR}/busybox-${PV}"
> +
> +do_configure_append() {
> + =C2=A0 =C2=A0 =C2=A0 sed -i -e '/CONFIG_STATIC/d' .config
> + =C2=A0 =C2=A0 =C2=A0 echo "CONFIG_STATIC=3Dy" >>.config
> +}
> +
> --
> 1.6.3.3
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


