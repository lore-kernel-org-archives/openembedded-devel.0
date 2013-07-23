Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 7B8B06A549
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Jul 2013 12:41:09 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 23 Jul 2013 05:41:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,727,1367996400"; d="scan'208";a="375074601"
Received: from unknown (HELO helios.localnet) ([10.252.122.115])
	by orsmga002.jf.intel.com with ESMTP; 23 Jul 2013 05:41:08 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Tue, 23 Jul 2013 13:41:07 +0100
Message-ID: <5249302.LRk1iTvfYM@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-26-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <CAP9ODKpz26sbQfot2mJJR8VDoLDQuMw=TzJg4Zmrut2imacpfg@mail.gmail.com>
References: <1373043676-5621-1-git-send-email-otavio@ossystems.com.br>
	<3799962.PMtSgBuqpH@helios>
	<CAP9ODKpz26sbQfot2mJJR8VDoLDQuMw=TzJg4Zmrut2imacpfg@mail.gmail.com>
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
X-List-Received-Date: Tue, 23 Jul 2013 12:41:09 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Tuesday 23 July 2013 09:09:37 Otavio Salvador wrote:
> On Tue, Jul 23, 2013 at 6:44 AM, Paul Eggleton
>=20
> <paul.eggleton@linux.intel.com> wrote:
> > On Monday 08 July 2013 13:35:21 Paul Eggleton wrote:
> >> On Friday 05 July 2013 19:45:25 Eric B=E9nard wrote:
> >> > Le Fri, 05 Jul 2013 18:29:04 +0100,
> >> >=20
> >> > Paul Eggleton <paul.eggleton@linux.intel.com> a =E9crit :
> >> > > Could someone *please* figure out what this bbappend is needed=
 for
> >> > > and
> >> > > get
> >> > > it into OE-Core if it is still needed so we can drop it here?
> >> >=20
> >> > it's only here to install /etc/default/busybox-syslog which cont=
ains
> >> > only one line : OPTIONS=3D"-C64" which sets the size of the logb=
uffer.
> >> > So obviously this could go into OE-Core.
> >>=20
> >> Yes but why is this needed? If we are to merge this into OE-Core w=
e'll
> >> need
> >> to say why this change is needed in the commit message.
> >=20
> > ping...
>=20
> I am working in something else so I cannot work on busybox now. Feel
> free to handle this.
>=20
> The syslog support would be good to be kept.

The problem is it's not clear to me what we should do here. Surely havi=
ng this=20
bbappend or not isn't the determining factor in whether we have syslog =
support=20
with systemd...?

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre

