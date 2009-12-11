Received: from mail-iw0-f194.google.com ([209.85.223.194])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NJ9Oy-0005Sc-AN
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Dec 2009 18:35:39 +0100
Received: by iwn32 with SMTP id 32so557491iwn.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Dec 2009 09:33:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=LBXMDX/ZWH8rnoibGABRyPV8unwyhE5yVihfIANtj9I=;
	b=BRIWLjG/ws6lSv9e3wR74ya3TlE0EgpSacbeoZrtxs6z8gBdplWA2I7PjiOkGV0UJ4
	aXaqNfnRQ7P8TRzmHA45dV0DsNUBjlbi82r0fNrq2MPEpfgJ+a829Vu9/hU7h2MCPN0i
	ZiNYhpHRHuPMXOFQRtDj/iIptC50kJWrZphUQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=vXBas/oW6mEkDYkB16g5uPDn8FWiR7BZZKfhJVogdIgl0rqYDTQ7jvKOVDGtKSn/ri
	wdK3pQGUvql7Jv4Mz0FormJLTSciRQRgajEeuApXDVtjMzsUccyuKV8QBrSurIp0nA9h
	+q3k0eXF0AtgbjhoQ7tfnFayXgxPl0Ft7LOEQ=
MIME-Version: 1.0
Received: by 10.231.190.83 with SMTP id g61mr355807iba.6.1260552832553; Fri, 
	11 Dec 2009 09:33:52 -0800 (PST)
In-Reply-To: <alpine.LNX.2.00.0912110857540.5053@asterix.crazy-teaparty.dyndns.org>
References: <alpine.LNX.2.00.0912110857540.5053@asterix.crazy-teaparty.dyndns.org>
Date: Fri, 11 Dec 2009 09:33:52 -0800
Message-ID: <19c1b8a90912110933n5b8878c3g8b850c50ff435310@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.194
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] linux_2.6.29.bb: update to kernel 2.6.29.6
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
X-List-Received-Date: Fri, 11 Dec 2009 17:35:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 10, 2009 at 11:59 PM, Vitus Jensen <vjensen@gmx.de> wrote:
>
> Version 2.6.29 fails on arch powerpc because of a syntax error. =C2=A0See
> http://lkml.indiana.edu/hypermail/linux/kernel/0906.1/00867.html
>
> Signed-off-by: Vitus Jensen <vjensen@gmx.de>
> ---
> =C2=A0recipes/linux/linux_2.6.29.bb | =C2=A0 =C2=A05 ++++-
> =C2=A01 files changed, 4 insertions(+), 1 deletions(-)
>
> diff --git a/recipes/linux/linux_2.6.29.bb b/recipes/linux/linux_2.6.29.b=
b
> index f78193d..87599d4 100644
> --- a/recipes/linux/linux_2.6.29.bb
> +++ b/recipes/linux/linux_2.6.29.bb
> @@ -1,6 +1,6 @@
> =C2=A0require linux.inc
>
> -PR =3D "r9"
> +PR =3D "r10"
>
> =C2=A0S =3D "${WORKDIR}/linux-2.6.29"
>
> @@ -21,6 +21,9 @@ DEFAULT_PREFERENCE_stamp9g20evb =3D "1"
> =C2=A0SRC_URI =3D "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-2.6.29=
.tar.bz2 \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://defconfig"
>
> +# Bug fixes on the 2.6.29.x stable branch
> +SRC_URI +=3D "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/patch-2.6.29.6.b=
z2;patch=3D1"
> +
> =C2=A0SRC_URI_append_boc01 =3D "\
> =C2=A0 =C2=A0 =C2=A0 =C2=A0file://boc01.dts \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0file://boc01.dts.v1 \
> --
> 1.6.4.4


Although your patch seems technically correct except missing
checksum.ini entry. There was concern amongst devs in the past about
handing minor releases
of kernel. Should it be added as a patch on top of base release or
should they be added as
separate recipes. There were opinions on both sides I am not sure what
the outcome was.

Thanks

-Khem

>
>
> --
> Vitus Jensen, Hannover, Germany, Universe (current)
> pgp public key available from keyservers
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


