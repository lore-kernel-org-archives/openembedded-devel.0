Received: from esa2.hc324-48.eu.iphmx.com (esa2.hc324-48.eu.iphmx.com [207.54.68.120])
 by mx.groups.io with SMTP id smtpd.web11.48228.1598857783072796890
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Aug 2020 00:09:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=kGuUGmNu;
 spf=pass (domain: bmw.de, ip: 207.54.68.120, mailfrom: prvs=505975d9f=mikko.rapeli@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1598857783; x=1630393783;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=UAHUfS/VBJPCo8381Vb2nZj0nrsoJAC0rZ0uQ0cmBwg=;
  b=kGuUGmNuENyvRWZfRmVRmY3wO9Qiwca0dTf+gAP18URR4hsBZUQv2/WI
   V7QhYl53S59bpIn2OuD/eypgQfGF6LRJ8NxxqVe2JWRF1vjCODRBu+V9q
   mlfhZ/ERS3tw3Kw5N0YI90GhOvJrazGGLoFvHe63Ftxxrw1zB8gD1lp9V
   c=;
Received: from esagw3.bmwgroup.com (HELO esagw3.muc) ([160.46.252.35]) by
 esa2.hc324-48.eu.iphmx.com with ESMTP/TLS; 31 Aug 2020 09:09:39 +0200
Received: from esabb5.muc ([160.50.100.47])  by esagw3.muc with ESMTP/TLS;
 31 Aug 2020 09:09:39 +0200
Received: from smucm10l.bmwgroup.net (HELO smucm10l.europe.bmw.corp) ([160.48.96.48])
 by esabb5.muc with ESMTP/TLS; 31 Aug 2020 09:09:39 +0200
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by smucm10l.europe.bmw.corp
 (160.48.96.48) with Microsoft SMTP Server (TLS;
 Mon, 31 Aug 2020 09:09:39 +0200
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
 smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1497.006; Mon,
 31 Aug 2020 09:09:39 +0200
From: "Mikko Rapeli" <mikko.rapeli@bmw.de>
To: <martin.jansa@gmail.com>
CC: <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][PATCH] nss: fix postinst script for nativesdk build
Thread-Topic: [oe] [meta-oe][PATCH] nss: fix postinst script for nativesdk
 build
Thread-Index: AQHWe4lxkiEJgJqxS0iTbQja6uPPjalNhPQAgAQt0gA=
Date: Mon, 31 Aug 2020 07:09:39 +0000
Message-ID: <20200831070938.GB2162@korppu>
References: <20200826091503.35364-1-mikko.rapeli@bmw.de>
 <CA+chaQfSstmfrfDc6wQ2PcWrLt5y5BrLDSihEuYEDJf+PUXD1Q@mail.gmail.com>
In-Reply-To: <CA+chaQfSstmfrfDc6wQ2PcWrLt5y5BrLDSihEuYEDJf+PUXD1Q@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <607AC56CBFA62947BA1569846C431F40@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2020 at 05:20:36PM +0200, Martin Jansa wrote:
> This breaks running postinst in do_rootfs, it tries to run
> /usr/bin/shlibsign from host which fails when doesn't exist and then it
> complains about exit 1 called after that:
>=20
> WARNING: nss.postinst returned 127, marking as unpacked only, configurat=
ion
> required on target.
> ERROR: Postinstall scriptlets of ['nss'] have failed. If the intention i=
s
> to defer them to first boot,
> then please place them into pkg_postinst_ontarget_${PN} ().
> Deferring to first boot via 'exit 1' is no longer supported.

Sorry, checking the failure now.

-Mikko

> On Wed, Aug 26, 2020 at 11:15 AM Mikko Rapeli <mikko.rapeli@bmw.de> wrot=
e:
>=20
> > It's better to refer to binaries in postinst script with
> > full path which also works on SDK when
> > /opt/nativesysroot/usr/bin is not in PATH.
> >
> > Fixes install of nativesdk-nss:
> >
> > Configuring nativesdk-nss.
> > /var/lib/opkg/info/nativesdk-nss.postinst: line 14: signlibs.sh: not f=
ound
> >
> > Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
> > ---
> >  meta-oe/recipes-support/nss/nss_3.54.bb | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta-oe/recipes-support/nss/nss_3.54.bb
> > b/meta-oe/recipes-support/nss/nss_3.54.bb
> > index 4923f6868..dc5cafbf1 100644
> > --- a/meta-oe/recipes-support/nss/nss_3.54.bb
> > +++ b/meta-oe/recipes-support/nss/nss_3.54.bb
> > @@ -244,13 +244,13 @@ pkg_postinst_${PN} () {
> >              DN=3D`dirname $I`
> >              BN=3D`basename $I .chk`
> >              FN=3D$DN/$BN.so
> > -            shlibsign -i $FN
> > +            ${bindir}/shlibsign -i $FN
> >              if [ $? -ne 0 ]; then
> >                  exit 1
> >              fi
> >          done
> >      else
> > -        signlibs.sh
> > +        ${bindir}/signlibs.sh
> >      fi
> >  }
> >
> > --
> > 2.20.1
> >
> >=20
> >
