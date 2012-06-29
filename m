Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SkOxm-0002NZ-As
	for openembedded-devel@lists.openembedded.org;
	Fri, 29 Jun 2012 02:21:30 +0200
Received: by wgbdr1 with SMTP id dr1so2508489wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Jun 2012 17:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=Omnqjrqhn+OzR3kea20yFYsNr7RWDv3XV9DF2Yg3BvQ=;
	b=D+rETpBARj2r4w0qaDGqaQuZJ6QwjA4y4oPJV9os+82JKfo0a38NXLV0PgS9JXOrPc
	NTx8ITz/xIGFD1FHorEsuzQ1WifSqy0w1EwYQbtVrZq/Rt8RE2i3LkDfbtAFUTv7XS13
	bM7ob5Z1qtdqfSyBN4y3Q9taXlmqsnDfWTclG9qLmMKIbCjEuV17ExJjZCIPZu9c9jS5
	YLloKt9UODwt9zorh3HV31PhveVLMi3uDSrEIX/DK0zNKKqkntkchUbLdm7iKb4jvRKl
	mqry6d9m13pDVMJDpxm/2B1suz8QYXWiOk21FXUqGthpJy5te0ZfNDRSoarULzhsdhSK
	iV3g==
Received: by 10.216.226.140 with SMTP id b12mr2036964weq.216.1340928633026;
	Thu, 28 Jun 2012 17:10:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.30.34 with HTTP; Thu, 28 Jun 2012 17:10:02 -0700 (PDT)
In-Reply-To: <1340907500-14243-2-git-send-email-kergoth@gmail.com>
References: <1340907500-14243-1-git-send-email-kergoth@gmail.com>
	<1340907500-14243-2-git-send-email-kergoth@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 28 Jun 2012 17:10:02 -0700
Message-ID: <CAMKF1sq-XoYkSVU6KNd+nF-B4AYNVqmA+sDkBiwd_MGrLNzT1A@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe] [PATCH 2/2] nano: rreplaces/rconflicts nano-tiny
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
X-List-Received-Date: Fri, 29 Jun 2012 00:21:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 28, 2012 at 11:18 AM, Christopher Larson <kergoth@gmail.com> wr=
ote:
> Signed-off-by: Christopher Larson <kergoth@gmail.com>
> ---
> =C2=A0meta-oe/recipes-support/nano/nano.inc | 4 +++-
> =C2=A01 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-support/nano/nano.inc b/meta-oe/recipes-supp=
ort/nano/nano.inc
> index 2d52cab..9e9cc62 100644
> --- a/meta-oe/recipes-support/nano/nano.inc
> +++ b/meta-oe/recipes-support/nano/nano.inc
> @@ -7,8 +7,10 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df27defe1e96c2=
e1ecd4e0c9be8967949"
> =C2=A0SECTION =3D "console/utils"
> =C2=A0DEPENDS =3D "ncurses"
> =C2=A0RDEPENDS_${PN} =3D "ncurses-terminfo"
> +RREPLACES_${PN} +=3D "nano-tiny"
> +RCONFLICTS_${PN} +=3D "nano-tiny"
>
> -INC_PR =3D "r2"
> +INC_PR =3D "r3"

I was wondering if tinyness of nano can be turned into a PACKAGECONFIG ?

>
> =C2=A0PV_MAJOR =3D "${@bb.data.getVar('PV',d,1).split('.')[0]}.${@bb.data=
.getVar('PV',d,1).split('.')[1]}"
>
> --
> 1.7.11
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


