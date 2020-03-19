Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id A94CB60592
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Mar 2020 08:30:24 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id j2so1907140qkl.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Mar 2020 01:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=613vekRUbHJ4EdKjKbEBqoKfHzYZ4ZoGeNDWuBXSeyI=;
	b=a+FmtlOZ/QaF7u+6SaPivenQ/+PfmPKYPxJklCYaFINIhWmjXPEeWacr5wO/GO+K2L
	nLBfXjxn8yY6qJpbNPoxJWQ3t3PHiNSxNblp8eIoH2zo9vRnxK3DCBOeewrwpmekFSfo
	GTvRzsiGl3W2C8mIHVZkCEPOxoLTT1czMSN6AicJUXspjL9Yff4sNrtCcgXezoG9++XL
	3Fcl6zL+c/pQhPGaf7MTuaRSkCidpRkgqPnEmPT8U6kVViN5MG0JpTpnofwxLEdHIRZf
	V3ZbCjNuCK/8bbQNj6F1mUujw1pE5/xsBFuhW6ad/LfeP2w+W8Xv9r/lD+DagggqqJ74
	fB0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=613vekRUbHJ4EdKjKbEBqoKfHzYZ4ZoGeNDWuBXSeyI=;
	b=CLpUIJS7RYEb1tRNrkNbPAIEggVNyto5Yt+jLp+V58QKzR0KyBPUTiEVjshrVryUAg
	Rnc7O1+U18jXUrHh0Pnrs+hXueZw8DB++uvV5eo75KNQ3khOREVHZlnfzO8MIoZOF1Vo
	9vwXjm0A4phnZ8vWS3vwuaVDzUd3kPwzy3gWNkY+Fd7jPkU5Xj6JwdvqygBQZ/7tu2CN
	l7vsRkh1qjlCYL4MNyAAQ6YTPpSYnNoRfrIK/qOXkE6yNv0qUaEiniAxbK3kvpH+5HAS
	baUTt/NnfiX8oKyBREEpFOB/2Bl5x7TH6rUVs71esUtDfnW6M23RZkG7I/ImUzcDQcQM
	v4NQ==
X-Gm-Message-State: ANhLgQ1vdcVGgMiAKEfd0O+rsd6el8xEKYeH7/V1e9aGvGAmVjQwab02
	0hJaONy5RnLyCjeNb7Z8DEVLbet/o0RjthN7h6I=
X-Google-Smtp-Source: ADFU+vv9SRnHYZHwK8r7NVlfKNcOKPsi/xQWQOen8mIxkHejSPfEds+x7H0m/sbH/y0Gh1RbZpl+wXEkRGvmMiGOct8=
X-Received: by 2002:a37:b003:: with SMTP id z3mr1735797qke.431.1584606625067; 
	Thu, 19 Mar 2020 01:30:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200318204411.12996-1-schnitzeltony@gmail.com>
	<20200318204411.12996-4-schnitzeltony@gmail.com>
	<CAMKF1sobKhs8spp7UY-dny3nZQtKLS3BMOTNR9q6updeaLSuLA@mail.gmail.com>
	<CALbNGRRG+_-J9_ixPpA24AvkO3iAOKqrSM4kP9-gXwgHQpP7Gg@mail.gmail.com>
In-Reply-To: <CALbNGRRG+_-J9_ixPpA24AvkO3iAOKqrSM4kP9-gXwgHQpP7Gg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 19 Mar 2020 01:29:58 -0700
Message-ID: <CAMKF1sqgk6pMmeAG8r7QQAqAeneXY4PSFM1LBAf=ebP__1g0Sw@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
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
X-List-Received-Date: Thu, 19 Mar 2020 08:30:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 19, 2020 at 1:17 AM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
>
> On Thu, Mar 19, 2020 at 5:14 AM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Wed, Mar 18, 2020 at 1:45 PM Andreas M=C3=BCller <schnitzeltony@gmai=
l.com> wrote:
> > >
> > > Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> > > ---
> > >  .../networkmanager/networkmanager-openvpn_1.8.12.bb | 13 +++++++++++=
+-
> > >  1 file changed, 12 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/meta-networking/recipes-connectivity/networkmanager/netw=
orkmanager-openvpn_1.8.12.bb b/meta-networking/recipes-connectivity/network=
manager/networkmanager-openvpn_1.8.12.bb
> > > index 5e246a85b..d455a0f06 100644
> > > --- a/meta-networking/recipes-connectivity/networkmanager/networkmana=
ger-openvpn_1.8.12.bb
> > > +++ b/meta-networking/recipes-connectivity/networkmanager/networkmana=
ger-openvpn_1.8.12.bb
> > > @@ -15,7 +15,18 @@ SRC_URI[sha256sum] =3D "0efda8878aaf0e6eb5071a053a=
ea5d7f9d42aac097b3ff89e7cbc9233f
> > >
> > >  S =3D "${WORKDIR}/NetworkManager-openvpn-${PV}"
> > >
> > > -PACKAGECONFIG[gnome] =3D "--with-gnome,--without-gnome"
> > > +# meta-gnome in layers is required using gnome:
> > > +PACKAGECONFIG[gnome] =3D "--with-gnome,--without-gnome,gtk+3 libnma =
libsecret"
> > > +
> > > +do_configure_append() {
> > > +    # network-manager-openvpn.metainfo.xml is created in source fold=
er but
> > > +    # compile expects it in build folder. As long as nobody comes up=
 with a
> > > +    # better solution just support build:
> > > +    if [ -e ${S}/appdata/network-manager-openvpn.metainfo.xml ]; the=
n
> > > +        mkdir -p ${B}/appdata
> > > +        cp -f ${S}/appdata/network-manager-openvpn.metainfo.xml ${B}=
/appdata/
> >
> > perhaps use install -Dm 0644 here
> In do_configure for a file required for buld-time only?
>

ah nevermind.

> Andreas

