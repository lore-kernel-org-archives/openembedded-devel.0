Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f52.google.com (mail-wg0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id A62B66E268
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Apr 2015 16:11:59 +0000 (UTC)
Received: by wgso17 with SMTP id o17so55880388wgs.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Apr 2015 09:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=bvlGMk+Yed82ytQ9J97/8hTUlk6a48mgKJOAXxXOkxg=;
	b=qdbhvabV+SMRcyUlXSH/w8uenoy8AokLnuGyJkkUY4rS4RgMh7wnt1tbKXlI9XwlDv
	Ct6AkAo/a2Cv6Yw1fJm3G42nwbhw4jNMz0x5CR2rQ4wlBjNaEAu/eF6wsLj49XYccAPb
	OivCdX/+wuF4IHXCFUdMla7lo/Q4A70bklaRK9wQ0VTvmVnIUpkdDenF9FR6QAxx+6q/
	S38b5bWMHNzLzyGVbsLzMbJaPuRXiWNs6RBwEJtMo58ZRrbakfehrGHRtKXeeIXV1xry
	Y4dQmXqYX+IPGAkSnw9IQ5hBYKhytgHrpxk/pRcLbcLfI15jnCzepVaqOsDeYhHNYrAo
	ls1g==
X-Received: by 10.194.103.67 with SMTP id fu3mr17646174wjb.69.1429891920670;
	Fri, 24 Apr 2015 09:12:00 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id i13sm4194347wic.13.2015.04.24.09.11.59
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 24 Apr 2015 09:11:59 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 24 Apr 2015 18:12:33 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150424161233.GC2353@jama>
References: <1429878122-23715-1-git-send-email-cristian.iorga@intel.com>
	<20150424123743.GA2353@jama>
	<969F26A8BAB325438E7EB80D3C3134FB2F4B5777@irsmsx105.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <969F26A8BAB325438E7EB80D3C3134FB2F4B5777@irsmsx105.ger.corp.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-systemd][PATCH V2] bluez4_4.101.bbappend: update according to bluez4
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 24 Apr 2015 16:12:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 24, 2015 at 02:22:59PM +0000, Iorga, Cristian wrote:
> Will do, thanks for the guidance. Otherwise, the bbappend is now correct,=
 right?

Can you explain why it doesn't belong into the recipe?

> Thanks,
> Cristian
>=20
> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembed=
ded-devel-bounces@lists.openembedded.org] On Behalf Of Martin Jansa
> Sent: Friday, April 24, 2015 3:38 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [meta-systemd][PATCH V2] bluez4_4.101.bbappend: update =
according to bluez4
>=20
> On Fri, Apr 24, 2015 at 03:22:02PM +0300, Cristian Iorga wrote:
> > bluez4 recipe has been updated with proper systemd support, so update=
=20
> > meta-systemd append accordingly.
> > Also update to the right directory structure.
>=20
> You need to update BBFILES in layer.conf, see:
> commit 8b465f791a5ef3d9ef138a206c6fb9c3bbcb55b1
> Author: Martin Jansa <Martin.Jansa@gmail.com>
> Date:   Sat Apr 13 14:16:51 2013 +0200
>=20
>     layer.conf: remove detection of other layers, now there are only oe-c=
ore bbappends
>=20
> > Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
> > ---
> >  .../recipes-connectivity/bluez/bluez4_4.101.bbappend                 |=
 5 -----
> >  1 file changed, 5 deletions(-)
> >  rename meta-systemd/{oe-core =3D>=20
> > meta-oe}/recipes-connectivity/bluez/bluez4_4.101.bbappend (51%)
> >=20
> > diff --git=20
> > a/meta-systemd/oe-core/recipes-connectivity/bluez/bluez4_4.101.bbappen
> > d=20
> > b/meta-systemd/meta-oe/recipes-connectivity/bluez/bluez4_4.101.bbappen
> > d
> > similarity index 51%
> > rename from=20
> > meta-systemd/oe-core/recipes-connectivity/bluez/bluez4_4.101.bbappend
> > rename to=20
> > meta-systemd/meta-oe/recipes-connectivity/bluez/bluez4_4.101.bbappend
> > index da01b05..260c02e 100644
> > ---=20
> > a/meta-systemd/oe-core/recipes-connectivity/bluez/bluez4_4.101.bbappen
> > d
> > +++ b/meta-systemd/meta-oe/recipes-connectivity/bluez/bluez4_4.101.bba
> > +++ ppend
> > @@ -1,9 +1,4 @@
> > -inherit systemd
> > -
> > -EXTRA_OECONF +=3D "--with-systemdunitdir=3D${systemd_unitdir}/system/"
> > -
> >  RPROVIDES_${PN} +=3D "${PN}-systemd"
> >  RREPLACES_${PN} +=3D "${PN}-systemd"
> >  RCONFLICTS_${PN} +=3D "${PN}-systemd"
> > -SYSTEMD_SERVICE_${PN} =3D "bluetooth.service"
> >  SYSTEMD_AUTO_ENABLE =3D "disable"
> > --
> > 2.1.0
> >=20
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

