Received: from [64.22.125.45] (helo=wiki.koala.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koansoftware@gmail.com>) id 1M0Jp5-0007X1-8F
	for openembedded-devel@openembedded.org; Sat, 02 May 2009 20:20:27 +0200
Received: from localhost (localhost [127.0.0.1])
	by wiki.koala.it (Postfix) with ESMTP id ED6372C807;
	Sat,  2 May 2009 18:14:44 +0000 (UTC)
Received: from wiki.koala.it ([127.0.0.1])
	by localhost (wiki.koala.it [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FJpDDHw6LmPy; Sat,  2 May 2009 18:14:42 +0000 (UTC)
Received: from [10.1.10.2] (host61-87-static.14-79-b.business.telecomitalia.it
	[79.14.87.61]) by wiki.koala.it (Postfix) with ESMTP id 5E9AF2C7FE;
	Sat,  2 May 2009 18:14:42 +0000 (UTC)
Message-ID: <49FC8D88.3050608@gmail.com>
Date: Sat, 02 May 2009 20:14:32 +0200
From: Marco Cavallini <koansoftware@gmail.com>
Organization: KOAN sas - Bergamo - Italia
User-Agent: Thunderbird 2.0.0.21 (X11/20090318)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <49FAE94F.2090101@doredevelopment.dk>
In-Reply-To: <49FAE94F.2090101@doredevelopment.dk>
Cc: openembedded-devel@openembedded.org
Subject: =?UTF-8?B?UmU6IFB1bGwgcmVxdWVzdCBmcm9tIERvcsOpRGV2ZWxvcG1lbnQgLSBOZXc6IE1pY3JvIGRpc3Ryby9pbWFnZQ==?=
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
X-List-Received-Date: Sat, 02 May 2009 18:20:27 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Martin Lund ha scritto:
> Hello OE dev,
>=20
> Please pull the changes from the following repository:
>=20
> git pull git://dev.doredevelopment.dk/oe-micro.git master
>=20
> This oe-micro repository adds the following files to current dev:
>=20
> conf/distro/micro-uclibc.conf |   43 +++++++++++++++++
> conf/distro/micro.conf        |  100
> +++++++++++++++++++++++++++++++++++++++++
> recipes/images/micro-image.bb |   34 ++++++++++++++
> 3 files changed, 177 insertions(+), 0 deletions(-)
>=20
> There should be no conflicts with the current OE dev branch.
>=20
> These files constitute a new distribution named "Micro" and a
> corresponding buildable image target: micro-image
>=20
>=20
>=20
> The "Micro" distribution/image is created because we feel that there is
> a need for a truly tiny and clean distro and image definition in OE for
> those users out there that needs a _very_ tiny Linux rootfs with
> virtually nothing installed except busybox, libc, udev, and a few init
> scripts. On arm the jffs2 image size is only 1 MB (uclibc based). No
> bloat allowed.
>=20
> The micro-image is ideal for users who wants this type of tiny Linux
> rootfs system with only a few custom applications added.
>=20
> It has been tested to build and run on the following machine types:
>=20
>    * at91sam9263ek [glibc, uclibc]
>    * x86 [glibc]
>=20
> As everything else OE it should build for most other machine types as
> well (no guarantee of course).
>=20
> The micro distribution/image is inspired by the "minimal" distro and
> image configuration - but it takes that one step further as contents ar=
e
> heavily stripped down and non needed definitions removed. Thanks to
> those who contributed to minimal distro - good work.
>=20
> More details on micro can be found in the following wiki:
> http://dev.doredevelopment.dk/wiki/OpenEmbeddedMicro
>=20
> Note: It is still work in progress and there are things to improve on
> the todo list (see wiki).

It's a pleasure to see someone pursuing our ideas of having a *really*
tiny image as we drawed when we joined OE :-)
http://thread.gmane.org/gmane.comp.handhelds.openembedded/21188
+1 from me and I'll be glad to contribute with you to this effort.

Cordiali Saluti / Kindest Regards / mit freundlichen Gr=FCssen
--
Marco Cavallini | KOAN sas | Bergamo - Italia
 embedded and real-time software engineering
Phone:+39-035-255.235 - Fax:+39-178-22.39.748
      http://www.KoanSoftware.com



