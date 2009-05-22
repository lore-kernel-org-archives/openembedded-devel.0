Received: from [198.47.26.153] (helo=devils.ext.ti.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin@ti.com>) id 1M7Zcy-0006Sa-Li
	for openembedded-devel@openembedded.org; Fri, 22 May 2009 20:37:56 +0200
Received: from dlep33.itg.ti.com ([157.170.170.112])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id n4MIU6m7005936
	for <openembedded-devel@openembedded.org>;
	Fri, 22 May 2009 13:30:12 -0500
Received: from dlep20.itg.ti.com (localhost [127.0.0.1])
	by dlep33.itg.ti.com (8.13.7/8.13.7) with ESMTP id n4MIU66P006395
	for <openembedded-devel@openembedded.org>;
	Fri, 22 May 2009 13:30:06 -0500 (CDT)
Received: from dsbe71.ent.ti.com (localhost [127.0.0.1])
	by dlep20.itg.ti.com (8.12.11/8.12.11) with ESMTP id n4MIU5r1006804
	for <openembedded-devel@openembedded.org>;
	Fri, 22 May 2009 13:30:05 -0500 (CDT)
Received: from dlee02.ent.ti.com ([157.170.170.17]) by dsbe71.ent.ti.com
	([156.117.232.23]) with mapi; Fri, 22 May 2009 13:30:05 -0500
From: "Ambrose, Martin" <martin@ti.com>
To: "openembedded-devel@openembedded.org" <openembedded-devel@openembedded.org>
Date: Fri, 22 May 2009 13:30:03 -0500
Thread-Topic: [oe] Force clean of dependencies
Thread-Index: Acna+kAps9s5KJ12QIKS1eieaMLozwAEMsKQ
Message-ID: <A24693684029E5489D1D202277BE8944404C850E@dlee02.ent.ti.com>
References: <A24693684029E5489D1D202277BE8944404C82BA@dlee02.ent.ti.com>
	<gv6j7v$hkq$2@ger.gmane.org>
In-Reply-To: <gv6j7v$hkq$2@ger.gmane.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: Force clean of dependencies
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
X-List-Received-Date: Fri, 22 May 2009 18:37:57 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

On Fri, May 22, 2009 at 11:18:07, Koen Kooi wrote:

> > I have searched this list and googled but can't find a way=20
> > to force a clean of
> > a package's dependencies.
>=20
> BB_STAMP_POLICY =3D "whitelist"?
=20
Thanks for the suggestion but it doesn't seem to work for me.
Looking at the mplayer recipe, e.g, the DEPENDS list includes freetype.
So my hope is that the latter 'ls' command in the following sequence
would be empty but it  is not.

$ ls work/armv5te-none-linux-gnueabi | grep freetype
freetype-2.3.6-r0

$ BB_STAMP_POLICY=3D"whitelist" bitbake mplayer -c clean

$ ls work/armv5te-none-linux-gnueabi | grep freetype
freetype-2.3.6-r0


Regards,=20
Martin


