Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
	[209.85.160.175])
	by mail.openembedded.org (Postfix) with ESMTP id F423260248
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  5 Jan 2019 20:41:05 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id t13so43975312qtn.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 05 Jan 2019 12:41:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=zRyS29nEc2KEcTlMbn9M2knnygerhp3xdFSQ+wGKt20=;
	b=TPF7TUBE19yliWBA1l5etwu5zo7oUqpFy9uK/LSPp4Bo1GpCw6BfflNHYGwbH4SsOX
	+bJpe8UBRHPgXip1PZCRad7cPlLNBUrWSGwdOkUkWYx3W6SZ6Vwr3BDbFZ/Jc0Oi/gUa
	6ix83K7L+a5fjeWA2B9bQhx+0snmYbsfDzP8jPgEHsKHbqXwGKpgaw6HLVUryLeUrPvh
	wiXrhrw76jA/D+8PMIfBfyPZ1kZ0tLpcC2MHR7iyzYnIx4M4Gz7qlfblI/h4Y7HmoMBJ
	mPEc0nzbrTRCtOZOOHp9AU3XxUdJuUVaTlZfIIbTP4NRn0QRpJFAArOclmy/5Jr5LoLO
	XstA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=zRyS29nEc2KEcTlMbn9M2knnygerhp3xdFSQ+wGKt20=;
	b=nzaFmul4/frl4gw/FvCVBuHRmnygaJOVX5siNCBUTg4CVW0Ik4Zx5WltBybLO4ku0a
	JRcJY8SNwEaR8ZdR58fABSs7+TXTJ5lzkAr2piHIqa1rIACOdzqyjxFSe84eaJdNlbNE
	JyQ2+pVMl7je0BN5AjjzMt7oOsOnlMAELutF8MTZPnvxQxiHyykzJhIQhsWV9pfaM5Ry
	Ndrzp+LNk4GLHQcCVXvbL7s19wxMwjlmLFUVL/+gHLbtbOMYgzz3xvRxsp0REBKmo0Ua
	RfXZpd+qemKwrm3aem9oAwNc6RYYpKVG7Pmk/zcXSTZE4qSNuM5zgq0GFjKInZme+In0
	59CA==
X-Gm-Message-State: AA+aEWYHcU1ucydOxed1uc06oS6673qxVACxkBI+wbNakFKmot+FlY5z
	jiYTnjLOPOOgZ/UVh8C85TKjZnk56PUF1iPwPHk=
X-Google-Smtp-Source: AFSGD/UPLCygIDcQJtTt28yy6EQ1pt9Z2Nbk842xsn9qa3lyGCUId0eVZne/t8MiBkb3QRrMzChkLE+Ye/7ODpjYoI0=
X-Received: by 2002:ac8:518d:: with SMTP id c13mr53198163qtn.254.1546720866496;
	Sat, 05 Jan 2019 12:41:06 -0800 (PST)
MIME-Version: 1.0
References: <1546597268-28446-1-git-send-email-athoik@gmail.com>
	<CAMKF1spPv3_R+0AEJqNhryyweBYS+_tEXDdGHALT8mWDsx_VMg@mail.gmail.com>
	<CANDbA3fiuUPbBB52C=yONOkFhJ_p6KFf7fbgkfaf6YG2sMDUPA@mail.gmail.com>
In-Reply-To: <CANDbA3fiuUPbBB52C=yONOkFhJ_p6KFf7fbgkfaf6YG2sMDUPA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 5 Jan 2019 12:40:40 -0800
Message-ID: <CAMKF1spe-wjwUFz7=hBS3hZWQ-AV7PVZ_rPx9vNcQ1dDD68PDA@mail.gmail.com>
To: =?UTF-8?B?zpHOuM6xzr3OrM+DzrnOv8+CIM6fzrnOus6/zr3PjM68zr/PhQ==?=
	<athoik@gmail.com>
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
X-List-Received-Date: Sat, 05 Jan 2019 20:41:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 4, 2019 at 11:52 PM =CE=91=CE=B8=CE=B1=CE=BD=CE=AC=CF=83=CE=B9=
=CE=BF=CF=82 =CE=9F=CE=B9=CE=BA=CE=BF=CE=BD=CF=8C=CE=BC=CE=BF=CF=85 <athoik=
@gmail.com> wrote:
>
> =CE=A3=CF=84=CE=B9=CF=82 =CE=A0=CE=B1=CF=81, 4 =CE=99=CE=B1=CE=BD 2019 =
=CF=83=CF=84=CE=B9=CF=82 7:53 =CE=BC.=CE=BC., =CE=BF/=CE=B7 Khem Raj <raj.k=
hem@gmail.com> =CE=AD=CE=B3=CF=81=CE=B1=CF=88=CE=B5:
> >
> > On Fri, Jan 4, 2019 at 2:25 AM Athanasios Oikonomou <athoik@gmail.com> =
wrote:
> > >
> > > Replace the PN with BPN to fix the multilib build.
> > > ---
> > >  meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.2.3.bb =
| 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exf=
at_1.2.3.bb b/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.=
2.3.bb
> > > index 99bf2be..ea00222 100644
> > > --- a/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.2.=
3.bb
> > > +++ b/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.2.=
3.bb
> > > @@ -17,5 +17,5 @@ inherit autotools pkgconfig
> > >  SRC_URI[md5sum] =3D "fca71e6598f79d037a3c7c969cb5710c"
> > >  SRC_URI[sha256sum] =3D "f2e06eba5a21c621aac1d6da21b12a5a324fdd1e20f9=
c8acd357dd463c2355d9"
> > >
> > > -S =3D "${WORKDIR}/${PN}-${PV}"
> > > +S =3D "${WORKDIR}/${BPN}-${PV}"
> >
> > Could you try using S =3D "${WORKDIR}/${BP}
> >
>
> Default S seems to work fine. Pushed a newer version that completely
> removes S in order to use the default one.

queued up for master-next

