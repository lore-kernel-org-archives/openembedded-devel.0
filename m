Received: from am1ehsobe003.messaging.microsoft.com ([213.199.154.206]
	helo=am1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B28495@freescale.com>) id 1TCThb-00025R-F6
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Sep 2012 13:04:51 +0200
Received: from mail8-am1-R.bigfish.com (10.3.201.243) by
	AM1EHSOBE009.bigfish.com (10.3.204.29) with Microsoft SMTP Server id
	14.1.225.23; Fri, 14 Sep 2012 10:22:09 +0000
Received: from mail8-am1 (localhost [127.0.0.1])	by mail8-am1-R.bigfish.com
	(Postfix) with ESMTP id 09D151C00CD	for
	<openembedded-devel@lists.openembedded.org>;
	Fri, 14 Sep 2012 10:22:09 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -8
X-BigFish: VS-8(zz98dI9371I542M1432I62a3Izz1202h1d1ah1d2ahzz17326ah8275bh8275dhz2dh2a8h668h839h8e2h8e3h944hd25hf0ah107ah1220h1288h12a5h12a9h12bdh1315hbe9i1155h)
Received: from mail8-am1 (localhost.localdomain [127.0.0.1]) by mail8-am1
	(MessageSwitch) id 1347618126138818_16230;
	Fri, 14 Sep 2012 10:22:06 +0000 (UTC)
Received: from AM1EHSMHS007.bigfish.com (unknown [10.3.201.232])	by
	mail8-am1.bigfish.com (Postfix) with ESMTP id 15A962C0105	for
	<openembedded-devel@lists.openembedded.org>;
	Fri, 14 Sep 2012 10:22:06 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by AM1EHSMHS007.bigfish.com
	(10.3.207.107) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 14 Sep 2012 10:22:05 +0000
Received: from 039-SN2MPN1-021.039d.mgd.msft.net ([169.254.1.100]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.02.0309.003; Fri, 14 Sep 2012 05:22:03 -0500
From: Liu Ting-B28495 <B28495@freescale.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][for-denzil][PATCH] systemd.bbclass: use system
	variables instead of hardcoded paths
Thread-Index: AQHNkYKkAG26oiqZBkyP925AWNkyvZeIkUwAgACja4A=
Date: Fri, 14 Sep 2012 10:22:03 +0000
Message-ID: <AF604684617F454390621992F367F169011FE018@039-SN2MPN1-021.039d.mgd.msft.net>
References: <1347521638-3093-1-git-send-email-b28495@freescale.com>
	<CAP9ODKoByUb=F+8O60w7juvDJ4tVcU2BG=m3kFbGBgASCJrbvA@mail.gmail.com>
In-Reply-To: <CAP9ODKoByUb=F+8O60w7juvDJ4tVcU2BG=m3kFbGBgASCJrbvA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.192.208.106]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: McClintock Matthew-B29882 <B29882@freescale.com>
Subject: Re: [meta-oe][for-denzil][PATCH] systemd.bbclass: use system variables instead of hardcoded paths
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
X-List-Received-Date: Fri, 14 Sep 2012 11:04:51 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Otavio Salvador
> Sent: Thursday, September 13, 2012 9:04 PM
> To: openembedded-devel@lists.openembedded.org
> Cc: McClintock Matthew-B29882
> Subject: Re: [oe] [meta-oe][for-denzil][PATCH] systemd.bbclass: use
> system variables instead of hardcoded paths
>=20
> On Thu, Sep 13, 2012 at 4:33 AM,  <b28495@freescale.com> wrote:
> > diff --git a/meta-oe/classes/systemd.bbclass
> > b/meta-oe/classes/systemd.bbclass index a2c8ddf..9690c18 100644
> > --- a/meta-oe/classes/systemd.bbclass
> > +++ b/meta-oe/classes/systemd.bbclass
> > @@ -154,7 +154,10 @@ python populate_packages_prepend () {
> >
> >         # check service-files and call systemd_add_files_and_parse for
> each entry
> >         def systemd_check_services():
> > -               searchpaths =3D '/etc/systemd/system/
> /lib/systemd/system/ /usr/lib/systemd/system/'
> > +               searchpaths =3D []
> > +               searchpaths.append(d.getVar('sysconfdir', True))
> > +               searchpaths.append(d.getVar('libdir', True))
> > +               searchpaths.append(d.getVar('base_libdir', True))
> >                 systemd_packages =3D d.getVar('SYSTEMD_PACKAGES', 1)
> >                 has_exactly_one_service =3D len(systemd_packages.split(=
))
> =3D=3D 1
> >                 if has_exactly_one_service:
> > @@ -168,9 +171,9 @@ python populate_packages_prepend () {
> >                 for pkg_systemd in systemd_packages.split():
> >                         for service in get_package_var(d,
> 'SYSTEMD_SERVICE', pkg_systemd).split():
> >                                 path_found =3D ''
> > -                               for path in searchpaths.split():
> > -                                       if os.path.exists('${D}' + path
> + service):
> > -                                               path_found =3D path
> > +                               for path in searchpaths:
> > +                                       if os.path.exists('${D}' + path
> + '/systemd/system/' + service):
> > +                                               path_found =3D path +
> '/systemd/system/'
> >                                 if path_found !=3D '':
> >
> systemd_add_files_and_parse(pkg_systemd, path_found, service, keys)
> >                                 else:
>=20
> Please check if a similar change is need on master (inside meta-systemd).
>=20

[Liu Ting-B28495] the issue was fixed in master.
commit 980b338fb5100ff4c779335a86f3d9450ea8c54a
systemd: Upgrade to 187 tag

a new path has been sent out for denzil.

> --
> Otavio Salvador                             O.S. Systems
> E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
> Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel




