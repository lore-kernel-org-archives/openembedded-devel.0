Received: from [209.85.221.178] (helo=mail-qy0-f178.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Mt6Yk-0000HX-7i
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Sep 2009 23:18:05 +0200
Received: by qyk8 with SMTP id 8so6262369qyk.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Sep 2009 14:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=wZC5M5DtyfD2Ln6FX1RgEQnU669KYq7cF44mTdvhl4o=;
	b=nf57dtlC8nO/lUMBDCEBEgUFdOAnZHV3n2UOon+EAUdGffnvOPb8L4qZ1mVeLrB6XR
	bFNmB6Jo0j7tnn4gRmj2sgunNPTwdKWR9KU8zfHLvsrq7l5pslm8/E93AWnYMU8obbie
	7Zlg1WxhCbTGV0+N21E+swoxo/Id9wFSCk/7A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=NIrQG2GYLz/SZgbtOr59g1WVt381tlPXHg3DhuNuMy98+P/wBFh1i1I89oz0DEtznU
	a+l6FwO394GyMotnyA6QF6rLYDKxBzE09w5rHHmwGSFudWYGhnjwNqFsh2obRzXTEwPA
	MOnnWzlCc25AVf9SeF2vOzerLvSJr5vr3e3vo=
MIME-Version: 1.0
Received: by 10.229.77.229 with SMTP id h37mr217777qck.58.1254345437850; Wed, 
	30 Sep 2009 14:17:17 -0700 (PDT)
In-Reply-To: <1254297499-3508-2-git-send-email-dp@xora.org.uk>
References: <1254297499-3508-1-git-send-email-dp@xora.org.uk>
	<1254297499-3508-2-git-send-email-dp@xora.org.uk>
Date: Wed, 30 Sep 2009 14:17:17 -0700
Message-ID: <19c1b8a90909301417j16f78541s2239cf2e22c8bcf3@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.221.178
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] glibc_2.9.bb : add already existing OE patch arm-lowlevellock-include-tls.patch
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
X-List-Received-Date: Wed, 30 Sep 2009 21:18:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2009 at 12:58 AM, Graeme Gregory <dp@xora.org.uk> wrote:
> This is required to get glibc 2.9 to build on arm oabi. eglibc already
> includes this patch and the patch is already in OE
>
> Signed-off-by: Graeme Gregory <dp@xora.org.uk>
> ---
> =C2=A0recipes/glibc/glibc_2.9.bb | =C2=A0 =C2=A01 +
> =C2=A01 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/recipes/glibc/glibc_2.9.bb b/recipes/glibc/glibc_2.9.bb
> index c3ebc16..56a6ff8 100644
> --- a/recipes/glibc/glibc_2.9.bb
> +++ b/recipes/glibc/glibc_2.9.bb
> @@ -64,6 +64,7 @@ SRC_URI =3D "ftp://ftp.gnu.org/pub/gnu/glibc/glibc-${PV=
}.tar.bz2 \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://march-i686.patch;patch=3D=
1;pnum=3D0 \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://tls_i486.patch;patch=3D1 \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://glibc-2.9-use-_begin.patch;patc=
h=3D1 \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://arm-lowlevellock-include-tls.=
patch;patch=3D1 \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"
>
> =C2=A0# Build fails on sh3 and sh4 without additional patches
> --
> 1.6.2.5
>

you need to bump PR otherwise ok

Acked-by: Khem Raj <raj.khem@gmail.com>

>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


