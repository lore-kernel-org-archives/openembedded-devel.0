Return-Path: <athoik@gmail.com>
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com
	[209.85.210.47])
	by mail.openembedded.org (Postfix) with ESMTP id E52D47BFC4
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  5 Jan 2019 07:52:10 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id t5so34038675otk.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Jan 2019 23:52:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=XB4SmRW3QvxanV72oMTVIYZEGlBG0R5HbpGxDxE2FFw=;
	b=MCYH9Hune7/AzyEWyufG8YUgawXqdbx420SUr+Yzuz43Xs8a0Nkz0uZuc5m/11B+wE
	QaFCGmV9BAjlbWxBQzuu2Rfxjyq93ybp0h/+4hdlwPfT9OG1Yk8yQaG4BeKq9y1NBCDl
	fkFO6h+jOTIMqJPhaWs+wyw5pTxlSg+MasekmShJT0PH61Ks6VCK3gzRFfkHLEkVNlPy
	zPHPgnREFgj2ITPg/R/tqZnJyMhUTMe3GKH0x4CRHxnw0L4ycrZQspYUeX0cbe+C5R6H
	nuzd+HhrrGcLD148M3w8RdQ7LMibk8sRUrcelqvv7NfrAXrA8hoO6rxbMDsXukL+6fP0
	rTPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=XB4SmRW3QvxanV72oMTVIYZEGlBG0R5HbpGxDxE2FFw=;
	b=o21PkcPJuh5Ev1cFCmUcxCiojvj/g3oEDzVA06MfkkRNFt1EA6L66jq68aR8YZIVls
	PdQD4URdPHMabKLOrBS6h/8/YkVInvvov1z0s7KhU/eZSrBRLG0CuOX8j75bfHPf9zTR
	Wkh3VkYJkxSJFMukc60g+R70LyCXMlQffz+bapshKMvs6CcuP1yZzL5HcxlBlv/8Jpc3
	BxzlIHXFoUZmUFx7uMkZXMvWoDlSfSyAESyU4/pkMLpbRSFF3a40dalPGUzO7EDCuVJ3
	QNR+pOGOKGHo/sBua5BdgFp9bVRZwgfCgnY3upgL9cnkOjPzDnKkpBtLllBrII1FSC1L
	IQFA==
X-Gm-Message-State: AJcUukdIEXx1KvCdHvtGIJ6qZHS69hK5SMB2pwPZw/On8f4JkpuxoNkZ
	VIcmOM2KNY6a3AXMs0/Orzrl0VzQCV3NEH9oVQ==
X-Google-Smtp-Source: ALg8bN4oVmT/PFs1Wa+nVI1RHHn/7WCDi5gbI1uD3zmOMPZLGKzUzcevrnQ/LD+m8BUnoG8w/eLhs5tmtoIdnMoVuLQ=
X-Received: by 2002:a9d:aa9:: with SMTP id 38mr39465200otq.255.1546674732009; 
	Fri, 04 Jan 2019 23:52:12 -0800 (PST)
MIME-Version: 1.0
References: <1546597268-28446-1-git-send-email-athoik@gmail.com>
	<CAMKF1spPv3_R+0AEJqNhryyweBYS+_tEXDdGHALT8mWDsx_VMg@mail.gmail.com>
In-Reply-To: <CAMKF1spPv3_R+0AEJqNhryyweBYS+_tEXDdGHALT8mWDsx_VMg@mail.gmail.com>
From: =?UTF-8?B?zpHOuM6xzr3OrM+DzrnOv8+CIM6fzrnOus6/zr3PjM68zr/PhQ==?=
	<athoik@gmail.com>
Date: Sat, 5 Jan 2019 09:52:00 +0200
Message-ID: <CANDbA3fiuUPbBB52C=yONOkFhJ_p6KFf7fbgkfaf6YG2sMDUPA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-filesystems][PATCH] fuse-exfat: fix multilib build
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 05 Jan 2019 07:52:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=CE=A3=CF=84=CE=B9=CF=82 =CE=A0=CE=B1=CF=81, 4 =CE=99=CE=B1=CE=BD 2019 =CF=
=83=CF=84=CE=B9=CF=82 7:53 =CE=BC.=CE=BC., =CE=BF/=CE=B7 Khem Raj <raj.khem=
@gmail.com> =CE=AD=CE=B3=CF=81=CE=B1=CF=88=CE=B5:
>
> On Fri, Jan 4, 2019 at 2:25 AM Athanasios Oikonomou <athoik@gmail.com> wr=
ote:
> >
> > Replace the PN with BPN to fix the multilib build.
> > ---
> >  meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.2.3.bb | =
2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat=
_1.2.3.bb b/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.2.=
3.bb
> > index 99bf2be..ea00222 100644
> > --- a/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.2.3.=
bb
> > +++ b/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.2.3.=
bb
> > @@ -17,5 +17,5 @@ inherit autotools pkgconfig
> >  SRC_URI[md5sum] =3D "fca71e6598f79d037a3c7c969cb5710c"
> >  SRC_URI[sha256sum] =3D "f2e06eba5a21c621aac1d6da21b12a5a324fdd1e20f9c8=
acd357dd463c2355d9"
> >
> > -S =3D "${WORKDIR}/${PN}-${PV}"
> > +S =3D "${WORKDIR}/${BPN}-${PV}"
>
> Could you try using S =3D "${WORKDIR}/${BP}
>

Default S seems to work fine. Pushed a newer version that completely
removes S in order to use the default one.
Thanks!

> >  EXTRA_OECONF +=3D "sbindir=3D${base_sbindir}"
> > --
> > 2.1.4
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel

