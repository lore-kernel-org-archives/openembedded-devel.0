Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PfcPV-0008JJ-4J
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Jan 2011 19:05:33 +0100
Received: by gxk20 with SMTP id 20so429193gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jan 2011 10:04:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=JQvEWWHbwa+Ix6yvE6DvI1ILwiZQXs0H98FphZbCHUw=;
	b=l5kYt7RniNIXfTSMkwIkRaLzTZ45fUKNmZ1izixPn/lPhTbY3Bxsewt4dgmVR9DNEe
	/QjFtm/Xy+Sxadz1jncTG+bAvFPy2K3THoW2qmA0KA2EMXpizBt4OJK2RqF6yWTRxLl5
	jmZkuPTa+d10nK/6E89tkZn16TRNcXpjLwsUg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=mP7nUeNHIooloDRNxEiGawQVfd/ZfJaNiW4fbnyMmMgit4BVwbjJhfTXzMe2iifSxx
	vD0+nrQfHm0nnsqvL+51OLuP/W3lSk/E3trtqKwHX2aOHC2BGrticY4NYWllgTMN8ve3
	7PeH9GbYKPTfUKDX1H/H+n1oN8mG45zif49tw=
Received: by 10.91.163.27 with SMTP id q27mr1285740ago.139.1295460288257; Wed,
	19 Jan 2011 10:04:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.55.10 with HTTP; Wed, 19 Jan 2011 10:04:28 -0800 (PST)
In-Reply-To: <1295452649-28081-1-git-send-email-eric@eukrea.com>
References: <1295452649-28081-1-git-send-email-eric@eukrea.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 19 Jan 2011 10:04:28 -0800
Message-ID: <AANLkTi=sg0AdyJQgmvim794R17JZ5zyM67mD-Xy43vaP@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/2] busybox: enable CONFIG_RUN_PARTS if default.script is to be installed
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
X-List-Received-Date: Wed, 19 Jan 2011 18:05:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 19, 2011 at 7:57 AM, Eric B=C3=A9nard <eric@eukrea.com> wrote:
> Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>

Looks ok.

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
> =C2=A0recipes/busybox/busybox_1.1x.inc | =C2=A0 =C2=A03 +++
> =C2=A01 files changed, 3 insertions(+), 0 deletions(-)
>
> diff --git a/recipes/busybox/busybox_1.1x.inc b/recipes/busybox/busybox_1=
.1x.inc
> index 4dbc3d9..1078aac 100644
> --- a/recipes/busybox/busybox_1.1x.inc
> +++ b/recipes/busybox/busybox_1.1x.inc
> @@ -34,6 +34,9 @@ do_configure_prepend () {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ "${TARGET_ARCH}" =3D "avr32" ] ; then
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i s:CONFIG_FE=
ATURE_OSF_LABEL=3Dy:CONFIG_FEATURE_OSF_LABEL=3Dn: ${WORKDIR}/defconfig
> =C2=A0 =C2=A0 =C2=A0 =C2=A0fi
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -e ${WORKDIR}/default.script ]; then
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo "CONFIG_RUN_PARTS=
=3Dy" =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
>> ${WORKDIR}/defconfig
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0fi
> =C2=A0}
>
> =C2=A0do_install_append() {
> --
> 1.6.3.3
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


