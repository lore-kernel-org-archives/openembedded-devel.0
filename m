Received: from [204.187.63.106] (helo=mail.evertz.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rlott@evertz.com>) id 1LiDdk-0001jL-WB
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Mar 2009 21:05:57 +0100
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Fri, 13 Mar 2009 16:05:34 -0400
Message-ID: <069B6B31F6201B4389D7EEB9AD827BCA05005FAC@otis.burlington.evertz.tv>
In-Reply-To: <19c1b8a90903131238q5c71c641n2f6a7eb40c911c4a@mail.gmail.com>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] SIP recipe can't find Qt4 package in x86 build
Thread-Index: AcmkFI7nhCtNIqVVQ3O9tgLuJiVGXgAAQ8aw
From: "Rodney Lott" <rlott@evertz.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: Re: SIP recipe can't find Qt4 package in x86 build
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
X-List-Received-Date: Fri, 13 Mar 2009 20:05:57 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi, Khem.

Thanks for replying so quickly.

So, if I am understanding you correctly, I would have to make a recipe =
that basically pointed to my natively installed version of Qt?  I =
couldn't find any qt-native or qt-devel recipes in the packages =
directory of the git OE repository (probably because Qt is a commercial =
product).

Okay, I'll give that a try then.

Thanks.

Rodney

-----Original Message-----
From: openembedded-devel-bounces@lists.openembedded.org
[mailto:openembedded-devel-bounces@lists.openembedded.org]On Behalf Of
Khem Raj
Sent: Friday, March 13, 2009 3:39 PM
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] SIP recipe can't find Qt4 package in x86 build


On Fri, Mar 13, 2009 at 12:11 PM, Rodney Lott <rlott@evertz.com> wrote:
> Hello.
>
> I am new to OE and I couldn't find anything in the devel mailing list =
archives for Feb and March, so I wanted to ask about the following =
issue.
>
> I am configured as follows:
>
> OE Build Configuration:
> BB_VERSION        =3D "1.8.13"
> METADATA_BRANCH   =3D "<unknown>"
> METADATA_REVISION =3D "<unknown>"
> TARGET_ARCH       =3D "i486"
> TARGET_OS         =3D "linux"
> MACHINE           =3D "x86"
> DISTRO            =3D "minimal"
> DISTRO_VERSION    =3D ".dev-snapshot-20090313"
> TARGET_FPU        =3D ""
>
> I am using the following git revision:
>
> commit 12b093a681c4e011062538e4f2c582630997855f
> Author: Bernhard Guillon <Bernhard.Guillon@opensimpad.org>
> Date:   Sun Feb 8 16:42:47 2009 +0100
>
> I am not using the latest because this was what I started with and I =
don't want to pull the latest yet unless it is necessary.
>
> Here's the problem I am having.  I have an image recipe that basically =
contains the following:
>
> require packages/images/minimal-image.bb
>
> IMAGE_INSTALL +=3D "cron"
> IMAGE_INSTALL +=3D "ntp"
>
> export IMAGE_BASENAME =3D "cp2210e"
>
> If I build with this, everything is peachy and I get my minimalist =
image with ntp and cron installed.  I then add more IMAGE_INSTALL lines =
after the ntp line:
>
> IMAGE_INSTALL +=3D "python"
> IMAGE_INSTALL +=3D "python-twisted"
> IMAGE_INSTALL +=3D "python-pyqt"
>
> The build goes on fine for a while and it stops at this:
>
> NOTE: Running task 765 of 1189 (ID: 532, =
/home/rlott/openembedded.git/packages/sip/sip-native_4.7.7.bb, =
do_configure)


You are building sip-native recipe so looking into host tool staging
is right here. So this file should either come from your host
installation of qt-devel  or from qt-native package(if there exists
one) which ever provides it. You might want to make  sip-native
DEPENDS on this package.

Thx

-Khem

_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


