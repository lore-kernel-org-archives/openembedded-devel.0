Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id BF5916FF60
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 May 2016 07:29:39 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u497TdVe002102; Mon, 9 May 2016 02:29:39 -0500
Received: from adi-pc-linux.emea.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016050902285483-831339 ;
	Mon, 9 May 2016 02:28:54 -0500 
Date: Mon, 9 May 2016 10:28:44 +0300
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <20160509102844.252626dd@adi-pc-linux.emea.corp.natinst.com>
In-Reply-To: <572BFB96.1090006@windriver.com>
References: <1461761346-22151-1-git-send-email-adrian.ratiu@ni.com>
	<572BFB96.1090006@windriver.com>
Organization: National Instruments
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 05/09/2016 02:28:55 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 05/09/2016 02:28:55 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-05-09_03:, , signatures=0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] openconnect: add missing dependencies
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
X-List-Received-Date: Mon, 09 May 2016 07:29:42 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Robert

On Fri, 6 May 2016 10:04:06 +0800
Robert Yang <liezhi.yang@windriver.com> wrote:

> Hi Ioan,
>=20
> Is it possible to use PACKAGECONFIG to add these dependencies conditional=
ly ?

Sure. I'll make some time to write & send another patch to make deps condit=
ional
on PACKAGECONFIG.

Thanks,
Ioan-Adrian

>=20
> On 04/27/2016 08:49 PM, Ioan-Adrian Ratiu wrote:
> > They were autodetected and triggered QA warnings
> >
> > Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> > ---
> >   meta-networking/recipes-connectivity/openconnect/openconnect=5Fgit.bb=
 | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta-networking/recipes-connectivity/openconnect/openconne=
ct=5Fgit.bb b/meta-networking/recipes-connectivity/openconnect/openconnect=
=5Fgit.bb
> > index 0a8b875..6d3c252 100644
> > --- a/meta-networking/recipes-connectivity/openconnect/openconnect=5Fgi=
t.bb
> > +++ b/meta-networking/recipes-connectivity/openconnect/openconnect=5Fgi=
t.bb
> > @@ -2,7 +2,7 @@ SUMMARY =3D "Open client for Cisco AnyConnect VPN"
> >   LICENSE =3D "LGPLv2.1"
> >   LIC=5FFILES=5FCHKSUM =3D "file://COPYING.LGPL;md5=3D243b725d71bb5df4a=
1e5920b344b86ad"
> >
> > -DEPENDS =3D "vpnc libxml2 gnutls"
> > +DEPENDS =3D "vpnc libxml2 gnutls lz4 krb5 libproxy pcsc-lite"
> >   RDEPENDS=5F${PN} =3D "vpnc"
> >
> >   PV =3D "7.06"
> > =20


