Return-Path: <B40290@freescale.com>
Received: from co9outboundpool.messaging.microsoft.com
	(co9ehsobe005.messaging.microsoft.com [207.46.163.28])
	by mail.openembedded.org (Postfix) with ESMTP id 4E7D86AE18
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Jul 2013 07:45:11 +0000 (UTC)
Received: from mail162-co9-R.bigfish.com (10.236.132.230) by
	CO9EHSOBE008.bigfish.com (10.236.130.71) with Microsoft SMTP Server id
	14.1.225.22; Fri, 5 Jul 2013 07:45:12 +0000
Received: from mail162-co9 (localhost [127.0.0.1])	by
	mail162-co9-R.bigfish.com (Postfix) with ESMTP id ECAF73E01BC;
	Fri,  5 Jul 2013 07:45:11 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(z37d4lz98dI9371I542I1432I4015Izz1f42h1ee6h1de0h1fdah2073h1202h1e76h1d1ah1d2ah1fc6hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3h944hd25hf0ah1220h1288h12a5h12a9h12bdh137ah13b6h1441h1504h1537h153bh15d0h162dh1631h1758h18e1h1946h19b5h1ad9h1b0ah1d0ch1d2eh1d3fh1dfeh1dffh1e1dhbe9i1155h)
Received: from mail162-co9 (localhost.localdomain [127.0.0.1]) by mail162-co9
	(MessageSwitch) id 1373010309985392_23684;
	Fri,  5 Jul 2013 07:45:09 +0000 (UTC)
Received: from CO9EHSMHS004.bigfish.com (unknown [10.236.132.230])	by
	mail162-co9.bigfish.com (Postfix) with ESMTP id D02012E027E;
	Fri,  5 Jul 2013 07:45:09 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO9EHSMHS004.bigfish.com
	(10.236.130.14) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 5 Jul 2013 07:45:06 +0000
Received: from 039-SN2MPN1-021.039d.mgd.msft.net ([169.254.1.130]) by
	039-SN1MMR1-005.039d.mgd.msft.net ([::1]) with mapi id 14.02.0328.011;
	Fri, 5 Jul 2013 07:45:05 +0000
From: Guo Chunrong-B40290 <B40290@freescale.com>
To: Joe MacDonald <Joe.MacDonald@windriver.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-networking][PATCH] dnsmasq: install .service only
	with systemd in DISTRO_FEATURES
Thread-Index: AQHOeJiRhkXsuyyy8U6mLWlRX7JI1ZlUV2EAgAAHwYCAAUETAA==
Date: Fri, 5 Jul 2013 07:45:04 +0000
Message-ID: <B21730BB6DA1D24B83348D9301EA417E1040BD1A@039-SN2MPN1-021.039d.mgd.msft.net>
References: <1372929983-1410-1-git-send-email-B40290@freescale.com>
	<2942656.3ozBKLWcr5@helios> <20130704111809.GA3831@windriver.com>
In-Reply-To: <20130704111809.GA3831@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.192.208.206]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: Yu Zongchun-B40527 <B40527@freescale.com>
Subject: Re: [meta-networking][PATCH] dnsmasq: install .service only with systemd in DISTRO_FEATURES
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
X-List-Received-Date: Fri, 05 Jul 2013 07:45:11 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello, Joe MacDonald
New  patch was submitted.
I do not modify (atftp/tracker/gateone)  recips and slim recipes do not wor=
k.
SO the code in these recipes  add  ${systemd_unitdir} to FILES and these re=
cipes work well.=20

Thanks,
chunrong

-----Original Message-----
From: Joe MacDonald [mailto:Joe.MacDonald@windriver.com]=20
Sent: Thursday, July 04, 2013 7:18 PM
To: openembedded-devel@lists.openembedded.org
Cc: Guo Chunrong-B40290; Yu Zongchun-B40527
Subject: Re: [oe] [meta-networking][PATCH] dnsmasq: install .service only w=
ith systemd in DISTRO_FEATURES

[Re: [oe] [meta-networking][PATCH] dnsmasq: install .service only with syst=
emd in DISTRO_FEATURES] On 13.07.04 (Thu 11:50) Paul Eggleton wrote:

> On Thursday 04 July 2013 17:26:23 Chunrong Guo wrote:
> > Signed-off-by: Chunrong Guo <B40290@freescale.com>
> > ---
> >  .../recipes-support/dnsmasq/dnsmasq.inc            |    8 +++++---
> >  1 files changed, 5 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
> > b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc index
> > 0f5b273..0710893 100644
> > --- a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
> > +++ b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
> > @@ -30,9 +30,11 @@ do_install () {
> >      install -d ${D}${sysconfdir}/ ${D}${sysconfdir}/init.d=20
> > ${D}${sysconfdir}/dnsmasq.d install -m 644 ${WORKDIR}/dnsmasq.conf=20
> > ${D}${sysconfdir}/
> >      install -m 755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/dnsmasq
> > -
> > -    install -d ${D}${systemd_unitdir}/system
> > -    install -m 0644 ${WORKDIR}/dnsmasq.service
> > ${D}${systemd_unitdir}/system +
> > +    if=20
> > + ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)};
> > then +        install -d ${D}${systemd_unitdir}/system
> > +        install -m 0644 ${WORKDIR}/dnsmasq.service
> > ${D}${systemd_unitdir}/system +    fi
> >=20
> >      if [ "${@base_contains('PACKAGECONFIG', 'dbus', 'dbus', '', d)}" !=
=3D ""
> > ]; then install -d ${D}${sysconfdir}/dbus-1/system.d
>=20
> I think we should really have a global fix for this issue rather than=20
> hacking up every recipe:
>=20
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D4309

I'm inclined to agree, but looking at the bug it looks like the potential s=
olution was discussed in February and it's on the schedule for Yocto 1.5, b=
ut that's October.

So I did a quick survey, here's the meta-networking recipes that'll be impa=
cted, if we adopt the workaround approach:

   - net-snmp
   - dnsmasq (obviously)
   - ypbind-mt
   - yp-tools
   - ntp
   - atftp

I decided I'd have a look at meta-oe for contrast (and guidance) and this i=
s what I found there:

   - slim
   - tracker
   - cloud9
   - zram
   - gpsd
   - gateone

On the other hand, xinput-calibrator and xserver-nodm-init,  already have t=
he same fix in it Chunrong is proposing.  So the impact of doing either isn=
't huge, but it's not small either.

Chunrong:  Would you be willing to retest and resubmit your patch with the =
above listed meta-networking recipes as a set?  I don't see a lot of sense =
in doing this piecemeal, I'm okay with taking a workaround until
#4309 gets fixed, but I'd rather tear the band-aid off all at once, so to s=
peak.

--
-Joe MacDonald.
:wq


