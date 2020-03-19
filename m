Return-Path: <schnitzeltony@gmail.com>
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id 03458601B5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Mar 2020 08:17:03 +0000 (UTC)
Received: by mail-il1-f194.google.com with SMTP id k29so1437793ilg.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Mar 2020 01:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=ua/Ytr4YvmTcoJigR55VDD9XDC7N/RTiUq8MC5Gxnn8=;
	b=l3EX9KtDmLpixtbs8VqGkiz4/k2V2tZjJ0Jy+mCd95n+6FawmkO9vYsjudVaHPy5s9
	aI4R4B4xSzpD73ePnfFKrcS5JWPZL4vP8fgV0ZYFSNVT8kaTHOpb60C/x9XcoBBMwGl/
	5odTVRK4S/l4/aZdJdrRwx+9VwOXX6b+gaNcDgMK4lH4ryOsuTxhWowqblCl3xjpRZV0
	UV1mPg7H5v36VEwZyZszB/lW6Q11gnIim9HShd29qKIJK6v8WLKiRLZlGVrF5r5oqomv
	bR5F39fkIpr5BS1GftMAOwl1wPsbwar2G5bF247U5Epqx3M6sM9y/hGMRUYTP1m5hsc3
	gliA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=ua/Ytr4YvmTcoJigR55VDD9XDC7N/RTiUq8MC5Gxnn8=;
	b=dzoG5vOOm7wFzRR1UTSERwViztiMCVfHsG8DIUXQlOeY6ijbjwfduCVbLPWu9fbokD
	QN0SuFFnO1iW7e4kzkIaG7CuhmWE1g0gkUfX+sFXSdyYW3A7tfhPGnVIZUhzBpz8xzGy
	qS/A6v71mZNMV/v5SaOcuAfd4mdgDhJ76wkCUc1EH62tU9/WctlbfsPs5CXQ6tmALRvb
	CI4Kf5wli8qjgYQBYBLduVbxIoE6QzCTu7XVtPEgYrcx723wOt2AN38NTw9nCbhrTtTs
	n6QBKqoh4V0OJFPEkkuhIggvM0AWnp3Pf9a3bHrn7OwWqHSqTIS6NYo27snBVJAgjsyA
	8ejQ==
X-Gm-Message-State: ANhLgQ2cXhRwh5MQMz/Rkii3ogyEBRBnEbritLjeJhFsXCDnkvwZ9L1+
	RGhqj6AW7i8+2bM1G/hBzLfVkiKKJG8Tk+Wy94s=
X-Google-Smtp-Source: ADFU+vtE3RfbcogIeL62B/sPHArMPOrb6mx5h1WiYLw9CQmZTgK+KCTj77ndNKHUbOsm3if9T54SdOAhLXifwuAPWhA=
X-Received: by 2002:a92:cc8c:: with SMTP id x12mr2163746ilo.224.1584605824988; 
	Thu, 19 Mar 2020 01:17:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200318204411.12996-1-schnitzeltony@gmail.com>
	<20200318204411.12996-4-schnitzeltony@gmail.com>
	<CAMKF1sobKhs8spp7UY-dny3nZQtKLS3BMOTNR9q6updeaLSuLA@mail.gmail.com>
In-Reply-To: <CAMKF1sobKhs8spp7UY-dny3nZQtKLS3BMOTNR9q6updeaLSuLA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Thu, 19 Mar 2020 09:16:52 +0100
Message-ID: <CALbNGRRG+_-J9_ixPpA24AvkO3iAOKqrSM4kP9-gXwgHQpP7Gg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 4/5] networkmanager-openvpn: Make PACKAGECONFIG gnome work
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
X-List-Received-Date: Thu, 19 Mar 2020 08:17:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 19, 2020 at 5:14 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Wed, Mar 18, 2020 at 1:45 PM Andreas M=C3=BCller <schnitzeltony@gmail.=
com> wrote:
> >
> > Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> > ---
> >  .../networkmanager/networkmanager-openvpn_1.8.12.bb | 13 ++++++++++++-
> >  1 file changed, 12 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta-networking/recipes-connectivity/networkmanager/networ=
kmanager-openvpn_1.8.12.bb b/meta-networking/recipes-connectivity/networkma=
nager/networkmanager-openvpn_1.8.12.bb
> > index 5e246a85b..d455a0f06 100644
> > --- a/meta-networking/recipes-connectivity/networkmanager/networkmanage=
r-openvpn_1.8.12.bb
> > +++ b/meta-networking/recipes-connectivity/networkmanager/networkmanage=
r-openvpn_1.8.12.bb
> > @@ -15,7 +15,18 @@ SRC_URI[sha256sum] =3D "0efda8878aaf0e6eb5071a053aea=
5d7f9d42aac097b3ff89e7cbc9233f
> >
> >  S =3D "${WORKDIR}/NetworkManager-openvpn-${PV}"
> >
> > -PACKAGECONFIG[gnome] =3D "--with-gnome,--without-gnome"
> > +# meta-gnome in layers is required using gnome:
> > +PACKAGECONFIG[gnome] =3D "--with-gnome,--without-gnome,gtk+3 libnma li=
bsecret"
> > +
> > +do_configure_append() {
> > +    # network-manager-openvpn.metainfo.xml is created in source folder=
 but
> > +    # compile expects it in build folder. As long as nobody comes up w=
ith a
> > +    # better solution just support build:
> > +    if [ -e ${S}/appdata/network-manager-openvpn.metainfo.xml ]; then
> > +        mkdir -p ${B}/appdata
> > +        cp -f ${S}/appdata/network-manager-openvpn.metainfo.xml ${B}/a=
ppdata/
>
> perhaps use install -Dm 0644 here
In do_configure for a file required for buld-time only?

Andreas

