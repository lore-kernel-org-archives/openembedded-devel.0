Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id C80686A549
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Jul 2013 12:54:48 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 23 Jul 2013 05:54:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,727,1367996400"; d="scan'208";a="350146882"
Received: from unknown (HELO helios.localnet) ([10.252.122.115])
	by orsmga001.jf.intel.com with ESMTP; 23 Jul 2013 05:54:48 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Tue, 23 Jul 2013 13:54:47 +0100
Message-ID: <2813811.F5BqiUbT83@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-26-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <CAP9ODKoM6TGuwfAsJOJSZr+9xqGOMHmHF069ydmxX4a66L6CeA@mail.gmail.com>
References: <1373043676-5621-1-git-send-email-otavio@ossystems.com.br>
	<5249302.LRk1iTvfYM@helios>
	<CAP9ODKoM6TGuwfAsJOJSZr+9xqGOMHmHF069ydmxX4a66L6CeA@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org,
	Eric =?ISO-8859-1?Q?B=E9nard?= <eric@eukrea.com>
Subject: Re: [meta-oe PATCH] busybox: Follow OE-Core update to 1.12.1 version
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
X-List-Received-Date: Tue, 23 Jul 2013 12:54:48 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Tuesday 23 July 2013 09:46:36 Otavio Salvador wrote:
> On Tue, Jul 23, 2013 at 9:41 AM, Paul Eggleton
>=20
> <paul.eggleton@linux.intel.com> wrote:
> > On Tuesday 23 July 2013 09:09:37 Otavio Salvador wrote:
> >> On Tue, Jul 23, 2013 at 6:44 AM, Paul Eggleton
> >>=20
> >> <paul.eggleton@linux.intel.com> wrote:
> >> > On Monday 08 July 2013 13:35:21 Paul Eggleton wrote:
> >> >> On Friday 05 July 2013 19:45:25 Eric B=E9nard wrote:
> >> >> > Le Fri, 05 Jul 2013 18:29:04 +0100,
> >> >> >=20
> >> >> > Paul Eggleton <paul.eggleton@linux.intel.com> a =E9crit :
> >> >> > > Could someone *please* figure out what this bbappend is nee=
ded for
> >> >> > > and
> >> >> > > get
> >> >> > > it into OE-Core if it is still needed so we can drop it her=
e?
> >> >> >=20
> >> >> > it's only here to install /etc/default/busybox-syslog which c=
ontains
> >> >> > only one line : OPTIONS=3D"-C64" which sets the size of the l=
ogbuffer.
> >> >> > So obviously this could go into OE-Core.
> >> >>=20
> >> >> Yes but why is this needed? If we are to merge this into OE-Cor=
e we'll
> >> >> need
> >> >> to say why this change is needed in the commit message.
> >> >=20
> >> > ping...
> >>=20
> >> I am working in something else so I cannot work on busybox now. Fe=
el
> >> free to handle this.
> >>=20
> >> The syslog support would be good to be kept.
> >=20
> > The problem is it's not clear to me what we should do here. Surely =
having
> > this bbappend or not isn't the determining factor in whether we hav=
e
> > syslog support with systemd...?
>=20
> With systemd we shouldn't provide it but for sysv we should provide i=
t.

I still need to know what this is needed for. Surely it doesn't actuall=
y=20
enable syslog functionality, just adds one configuration value to it? I=
f that's=20
the case, why is this configuration change needed?

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre

