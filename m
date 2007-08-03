Received: from [82.119.242.94] (helo=mail.suse.cz)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <utx@penguin.cz>) id 1IGtNs-0005yx-Rz
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Aug 2007 11:23:48 +0200
Received: from [10.20.1.86] (hammer.suse.cz [10.20.1.86])
	by mail.suse.cz (Postfix) with ESMTP id 09D056280C1
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Aug 2007 11:21:42 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1186093013.6626.57.camel@localhost.localdomain>
References: <46B1753D.1090507@dominion.kabel.utwente.nl>
	<46B1B6DB.6020603@klever.net>	<1186053831.5972.222.camel@hammer.suse.cz>
	<46B1C71F.2090608@klever.net>	<1186058282.5972.232.camel@hammer.suse.cz>
	<46B1D0DA.5030905@balister.org>	<1186061255.5972.243.camel@hammer.suse.cz>
	<46B1E063.7010407@dominion.kabel.utwente.nl>
	<1186064138.5972.259.camel@hammer.suse.cz>
	<46B1E812.8020706@dominion.kabel.utwente.nl>
	<1186066059.5972.269.camel@hammer.suse.cz>	<46B1F78F.4040700@klever.net>
	<46B1FC60.6030908@dominion.kabel.utwente.nl>
	<46B1FDD8.8000404@klever.net>
	<46B20D9F.70704@dominion.kabel.utwente.nl>
	<1186093013.6626.57.camel@localhost.localdomain>
Date: Fri, 03 Aug 2007 11:21:41 +0200
Message-Id: <1186132901.5972.314.camel@hammer.suse.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
Subject: Re: Gstreamer and rpath
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 03 Aug 2007 09:23:49 -0000
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable

Richard Purdie wrote:

> I'm actually semi against forcing staging to look like an image. The
> fact gcc requires this for its sysroot option is a sign that they
> haven't got this right yet.
>=20
> With packaged staging we need to decide which way we go, separate
> staging packages or use the same ones as we use for images.
>=20
> My personal gut feeling is that separate ones will work better. They
> also mean we can handle the extra staging files like pkgmaps and perhap=
s
> handle multi machine easier.

Well, the point of gcc --sysroot is a simplification of cross
compilation for those using complete sysroot environment.

Maybe we have a good reason to not use sysroot, but then we have to
invent a different solution.

Manual enabling/disabling rpath is a bad solution. Better solutions is a
compiler wrapper knowing our rewrite rules.

For example:
arm-angstrom-gueabi-gcc -I/usr/include/ssl -L/usr/lib/purple-2 -loscar -l=
m
may be rewritten for example to:
arm-angstrom-gueabi-gcc -nostdinc -nostdlib -L/path/to/staging/platform/l=
ib -L/path/to/staging/model/lib -I/path/to/staging/noarch/include -I/path=
/to/staging/platform/include -L/path/to/staging/model/include -I/path/to/=
staging/platform/include/ssl -I/path/to/staging/model/include/ssl -L/path=
/to/staging/platform/lib/purple-2 -L/path/to/staging/model/lib/purple-2 -=
loscar -lm

Such wrapper must not modify rpath, -D and other arguments with paths.

But for example AC_CHECK_FILE modification to work with such structure
would be complicated.

But maybe there is possible to invent better method than the sysroot
design is.


A random idea:

Define TARGET_ROOT_MAP, which may use similar syntax like overlay
filesystems have. It will allow to construct sysroot by these
filesystems on fly as well, e. g. for use with emulators.

--=20
Best Regards / S pozdravem,

Stanislav Brabec
software developer
---------------------------------------------------------------------
SUSE LINUX, s. r. o.                          e-mail: sbrabec@suse.cz
Lihovarsk=E1 1060/12                            tel: +420 284 028 966
190 00 Praha 9                                fax: +420 284 028 951
Czech Republic                                http://www.suse.cz/



