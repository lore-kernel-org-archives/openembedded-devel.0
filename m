Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Pdq1W-0003tZ-2B
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Jan 2011 21:13:26 +0100
Received: by yxd5 with SMTP id 5so1291420yxd.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Jan 2011 12:12:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=WNucTAS9R5COBj/tb1qwKi1t7NJgVH+4uRiK3FHgSFM=;
	b=QeQ7zprdZhgO4a/01K8FOJgsm7oQ0EImVFX49NbpP6LY7VcBk2SBju9V4QcG4ACZ00
	8V5VkZE6lQOBEyazqCTCr6lRF5/3SAs3WgCIaJSNJCda68i1brE2s0I/X6hKyKQLhWBr
	JOvvYKWdTZj1Ew4oD9aW/VczkU8bYISsDv4F8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=Pqzob1fLrmLcci/9Zl3ctTHKe+iD3L9xeB1wZd7ncISY88c+lf+DYf7H9NNubo01mt
	YZv2dXG7kvvjlQj1YUOtsy+4EvRRT9+JoYtFNSq05Il596cN/dxhCHOKP/6S6LBZBXOY
	UwwJUi8RVMUuyABo0xMUWKRznRbhsTJ/vzjd0=
Received: by 10.90.1.2 with SMTP id 2mr1688714aga.58.1295035960949; Fri, 14
	Jan 2011 12:12:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.55.10 with HTTP; Fri, 14 Jan 2011 12:12:20 -0800 (PST)
In-Reply-To: <1295019241-5145-1-git-send-email-tom_rini@mentor.com>
References: <1295019241-5145-1-git-send-email-tom_rini@mentor.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 14 Jan 2011 12:12:20 -0800
Message-ID: <AANLkTi=JKOCJ7nv0y-vddYhtK0wWAMBz4mHmoUhc=3et@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] busybox-static: Look in ${P}:${BPN} before the main busybox
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
X-List-Received-Date: Fri, 14 Jan 2011 20:13:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 14, 2011 at 7:34 AM, Tom Rini <tom_rini@mentor.com> wrote:
> Update FILESPATHPKG so that busybox-static could have its own
> starting defconfig.

OK looks fine
>
> Signed-off-by: Tom Rini <tom_rini@mentor.com>
> ---
> =C2=A0recipes/busybox/busybox-static_1.18.1.bb | =C2=A0 =C2=A02 +-
> =C2=A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/recipes/busybox/busybox-static_1.18.1.bb b/recipes/busybox/b=
usybox-static_1.18.1.bb
> index 58aca93..27d4121 100644
> --- a/recipes/busybox/busybox-static_1.18.1.bb
> +++ b/recipes/busybox/busybox-static_1.18.1.bb
> @@ -1,6 +1,6 @@
> =C2=A0require busybox_${PV}.bb
>
> -FILESPATHPKG =3D. "busybox-${PV}:"
> +FILESPATHPKG =3D. "${P}:${BPN}:busybox-${PV}:"
> =C2=A0S =3D "${WORKDIR}/busybox-${PV}"
>
> =C2=A0do_configure_append() {
> --
> 1.7.0.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


