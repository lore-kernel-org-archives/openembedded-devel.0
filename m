Return-Path: <bevenson@melinkcorp.com>
Received: from pluto.melinkcorp.com (rrcs-98-100-91-244.central.biz.rr.com
	[98.100.91.244])
	by mail.openembedded.org (Postfix) with ESMTP id F1AC861883
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Aug 2013 12:27:33 +0000 (UTC)
Received: from pluto.melinkcorp.local ([10.0.2.4]) by pluto.melinkcorp.local
	([10.0.2.4]) with mapi; Thu, 1 Aug 2013 08:27:33 -0400
From: Bryan Evenson <bevenson@melinkcorp.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Thu, 1 Aug 2013 08:27:32 -0400
Thread-Topic: [oe] opkg: How to make package signal reboot required?
Thread-Index: Ac6OomnYa1PGPpp1TruvEo6f351b4wAC3o1g
Message-ID: <91586D499ADFD74FBCFB8425266A5DE40153ADA9D2BC@pluto.melinkcorp.local>
References: <91586D499ADFD74FBCFB8425266A5DE40153ADA9D291@pluto.melinkcorp.local>
	<20130801103252.GL3280@jama>
In-Reply-To: <20130801103252.GL3280@jama>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-vipre-scanned: 0023EEF0004E400023F03D
acceptlanguage: en-US
MIME-Version: 1.0
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: opkg: How to make package signal reboot required?
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
X-List-Received-Date: Thu, 01 Aug 2013 12:27:34 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Martin and Paul,

Thanks for the replies.  If there is nothing standard in place at the momen=
t, then I'm planning on setting things up on my end to follow the standard =
(from what I can tell) Debian practice.  In my pkg_postinst, I'm going to a=
dd the lines:

#!/bin/sh -e
if test "x$D" =3D "x"; then
    touch /var/run/reboot-required
    cat ${PN} >> /var/run/reboot-required.pkgs
fi

Then in my script that does the firmware upgrade, I'll check for the existe=
nce of /var/run/reboot-required to determine whether the system needs to be=
 rebooted.

If anything can be done to add the above (or something similar) to the pkg_=
postinst by setting a flag in the Bitbake recipe, I'm all for it.  I'm not =
quite sure which piece would be responsible for such action (oe-core?  Bitb=
ake? Something else?).  If someone could suggest the proper place, I'd happ=
ily submit a request on the proper bug tracker.

Regards,
Bryan

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Martin Jansa
> Sent: Thursday, August 01, 2013 6:33 AM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] opkg: How to make package signal reboot required?
>=20
> On Wed, Jul 31, 2013 at 09:28:50PM -0400, Bryan Evenson wrote:
> > All,
> >
> > I have a package that I created for my setup which, when upgraded,
> will require a system reboot.  Is there a general flag/setting that
> already exists to put in my Bitbake recipe to signal that the package
> requires a reboot?  If so, does it just set a flag that a reboot is
> required or does it force a reboot?
>=20
> I don't know about the feature to do the reboot, but we were using
> extra metadata flags for .ipk to mark packages which need the reboot
> (so that package manager can query updated packages and decide if it's
> needed).
>=20
> See
> http://patches.openembedded.org/patch/39181/
> http://patches.openembedded.org/patch/39183/
>=20
> I don't know why this wasn't ever merged in oe-core
> http://lists.linuxtogo.org/pipermail/openembedded-core/2012-
> November/031856.html
> doesn't have any negative review AFAIK.
>=20
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

