Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id D457B771C6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Jan 2016 14:18:08 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u0SEI8TN003610; Thu, 28 Jan 2016 08:18:08 -0600
Received: from adi-pc-linux.emea.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016012808180900-393164 ;
	Thu, 28 Jan 2016 08:18:09 -0600 
Date: Thu, 28 Jan 2016 16:17:51 +0200
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: Andreas =?ISO-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>
Message-ID: <20160128161751.670e9508@adi-pc-linux.emea.corp.natinst.com>
In-Reply-To: <CALbNGRQroKeu+Sap64Mz3HYJkbchN8GNWvfHeASHRwZ=eA_FdA@mail.gmail.com>
References: <1453978491-8849-1-git-send-email-adrian.ratiu@ni.com>
	<CALbNGRRTKH2BsXQbB7di3geApmPLz-A_gGaEnGzyLEJzPkX7-Q@mail.gmail.com>
	<20160128152959.55a9a747@adi-pc-linux.emea.corp.natinst.com>
	<CALbNGRQroKeu+Sap64Mz3HYJkbchN8GNWvfHeASHRwZ=eA_FdA@mail.gmail.com>
Organization: National Instruments
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 01/28/2016 08:18:09 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 01/28/2016 08:18:09 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-01-28_06:, , signatures=0
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-xfce][PATCH 1/1] xfwm4: add patch to fix touch event handling
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
X-List-Received-Date: Thu, 28 Jan 2016 14:18:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 28 Jan 2016 15:01:04 +0100
Andreas M=C3=BCller <schnitzeltony@googlemail.com> wrote:

> On Thu, Jan 28, 2016 at 2:29 PM, Ioan-Adrian Ratiu <adrian.ratiu@ni.com> =
wrote:
> >> I've checked the thread you point to: I am using xfce for touch
> >> screens and can resize windows, maximize them, move around and close
> >> them all with touch. What kind of error is fixed? =20
> >
> > Thank you for challenging this, it helped bring more light on the issue.
> > It is a workaround the bug [1] in xserver which was fixed. More details=
 here [2]
> > I did not knew this untill I asked on the xfwm bugzilla.
> >
> > So instead of "fixing" it here, we should try to backport that fix to O=
E or verify
> > if it's not contained in OE's xserver already since it's working for yo=
u :)
> >
> > [1] http://cgit.freedesktop.org/xorg/xserver/commit/?id=3D24b943132f =20
> This is the correct fix and - I checked in source - is included in
> xserver-xorg 1.17.2. That version is shipped with jethro I am working
> with currently. Don't know when it came in (for elder oe-core
> releases) but master and jethro don't need to fix.
>=20
> Andreas

By the way I just realized you're probably the same person to whom I've sen=
t a pull request on github this morning *nod* *nod* (your email name and hi=
s github username are the same)

How small is this world :)

