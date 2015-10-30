Return-Path: <yugeraj.ramajayam@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 893E076E3F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Oct 2015 07:04:39 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 30 Oct 2015 00:04:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,217,1444719600"; d="scan'208";a="590841699"
Received: from kmsmsx151.gar.corp.intel.com ([172.21.73.86])
	by FMSMGA003.fm.intel.com with ESMTP; 30 Oct 2015 00:04:30 -0700
Received: from pgsmsx101.gar.corp.intel.com ([169.254.1.236]) by
	KMSMSX151.gar.corp.intel.com ([169.254.10.110]) with mapi id
	14.03.0248.002; Fri, 30 Oct 2015 15:04:28 +0800
From: "Ramajayam, Yugeraj" <yugeraj.ramajayam@intel.com>
To: 'Richard Leitner' <richard.leitner@skidata.com>,
	"'openembedded-devel@lists.openembedded.org'"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-java] openjdk: openjdk.tar.bz2 download time out due to
	sha256sum mismatch.
Thread-Index: AdD3c9wnx4yvlXkqSBK6sRsk2GSHJwC9KCWAAWrt40AEso3ekA==
Date: Fri, 30 Oct 2015 07:04:27 +0000
Message-ID: <D4F319EC2C6BBA46B2FB63E54D8E81C3C1ADC1@PGSMSX101.gar.corp.intel.com>
References: <D4F319EC2C6BBA46B2FB63E54D8E81C3C03392@PGSMSX101.gar.corp.intel.com>
	<560A7883.5010200@skidata.com>
	<D4F319EC2C6BBA46B2FB63E54D8E81C3C05B08@PGSMSX101.gar.corp.intel.com>
In-Reply-To: <D4F319EC2C6BBA46B2FB63E54D8E81C3C05B08@PGSMSX101.gar.corp.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.30.20.205]
MIME-Version: 1.0
Subject: Re: [meta-java] openjdk: openjdk.tar.bz2 download time out due to sha256sum mismatch.
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
X-List-Received-Date: Fri, 30 Oct 2015 07:04:39 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Ramajayam, Yugeraj
> Sent: Tuesday, October 6, 2015 4:55 PM
> To: Richard Leitner <richard.leitner@skidata.com>; openembedded-
> devel@lists.openembedded.org
> Cc: Sven Ebenfeld <sven.ebenfeld@gmail.com>
> Subject: RE: [meta-java] openjdk: openjdk.tar.bz2 download time out due t=
o
> sha256sum mismatch.
>=20
> > -----Original Message-----
> > From: Richard Leitner [mailto:richard.leitner@skidata.com]
> > Sent: Tuesday, September 29, 2015 7:40 PM
> > To: openembedded-devel@lists.openembedded.org
> > Cc: Ramajayam, Yugeraj <yugeraj.ramajayam@intel.com>; Sven Ebenfeld
> > <sven.ebenfeld@gmail.com>
> > Subject: Re: [meta-java] openjdk: openjdk.tar.bz2 download time out
> > due to sha256sum mismatch.
> >
> > On 09/25/2015 11:25 AM, Ramajayam, Yugeraj wrote:
> > > Hi all,
> > >
> > > I am trying to include java support for valleyisland-64 bsp.
> > >
> > > I have followed all the Usage Instructions as mentioned in the
> > > meta-java About page.
> > >
> > Your configuration looks fine!
> >
> > >
> > > When I execute $ bitbake core-image-sato , I am having following
> > > error due to openjdk.tar.bz2 time out issue.
> > >
> > > When I try to wget manually, the tar ball was downloaded fine and
> > > the md5sum and sha256sum matches accordingly.
> > >
> > > The error message appears as below :
> > ...
> > >
> > > *openjdk.tar.bz2: FAILED*
> > > */usr/bin/sha256sum: WARNING: 1 computed checksum did NOT match*
> > > * *
> > > *--2015-09-25 17:00:34--
> > > http://icedtea.classpath.org/download/drops/icedtea7/2.6.1/openjdk.t
> > > ar
> > > .bz2*
> > > * *
> > > *Resolving icedtea.classpath.org (icedtea.classpath.org)...*
> > > *208.78.240.231*
> > > * *
> > > *Connecting to icedtea.classpath.org
> > > (icedtea.classpath.org)|208.78.240.231|:80...*
> > > *failed: Connection timed out.*
> > > * *
> > > *Retrying.*
> >
> > IMHO it looks like the wget falls into a timeout. How long does the
> "manual"
> > wget download take?
> >
> > You could try to increase the wget timeout in
> > bitbake/lib/bb/fetch2/wget.py and meta/conf/bitbake.conf to for
> > example
> > 100sec:
> >
> > diff --git a/bitbake/lib/bb/fetch2/wget.py
> > b/bitbake/lib/bb/fetch2/wget.py
> > --- a/bitbake/lib/bb/fetch2/wget.py
> > +++ b/bitbake/lib/bb/fetch2/wget.py
> > @@ -58,7 +58,7 @@ class Wget(FetchMethod):
> >
> >          ud.localfile =3D data.expand(urllib.unquote(ud.basename), d)
> >
> > -        self.basecmd =3D d.getVar("FETCHCMD_wget", True) or "/usr/bin/=
env
> > wget -t 2 -T 30 -nv --passive-ftp --no-check-certificate"
> > +        self.basecmd =3D d.getVar("FETCHCMD_wget", True) or
> > + "/usr/bin/env
> > wget -t 2 -T 100 -nv --passive-ftp --no-check-certificate"
> >
> >      def _runwget(self, ud, d, command, quiet):
> >
> > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > --- a/meta/conf/bitbake.conf
> > +++ b/meta/conf/bitbake.conf
> > @@ -575,7 +575,7 @@ XORG_MIRROR =3D
> > "http://xorg.freedesktop.org/releases"
> >
> >  FETCHCMD_svn =3D "/usr/bin/env svn --non-interactive --trust-server-ce=
rt"
> >  FETCHCMD_cvs =3D "/usr/bin/env cvs"
> > -FETCHCMD_wget =3D "/usr/bin/env wget -t 2 -T 30 -nv --passive-ftp --no=
-
> > check-certificate"
> > +FETCHCMD_wget =3D "/usr/bin/env wget -t 2 -T 100 -nv --passive-ftp
> > --no-check-certificate"
> >  FETCHCMD_bzr =3D "/usr/bin/env bzr"
> >  FETCHCMD_hg =3D "/usr/bin/env hg"
> >
> >
> > hope that helps!
> >
> > best regards,
> > Richard L
>=20
> Hi Richard,
>=20
> I tried increasing the wget duration from 30 seconds to 100 seconds as yo=
u
> suggested. I'm still facing the timeout issue.
> This is what I get when I execute $ bitbake -v openjdk-7-jre :
>=20
>=20
> ln -sf /home/ilab/dev/build/poky/build/tmp/work/core2-32-poky-
> linux/openjdk-7-jre/85b01-2.6.1-r6.1/39b2c4354d0a.tar.bz2 openjdk.tar.bz2
>=20
> if ! echo
> "0168a0174ee47407139ee32458c4d2a298ba4f44260343b209250156e4da463
> f  openjdk.tar.bz2" \
>           | /usr/bin/sha256sum --check ; \
>         then \
>           if test "xyes" =3D "xyes"; then \
>             if [ -e openjdk.tar.bz2 ] ; then \
>               mv openjdk.tar.bz2 openjdk.tar.bz2.old ; \
>             fi ; \
>             /usr/bin/wget
> http://icedtea.classpath.org/download/drops/icedtea7/2.6.1/openjdk.tar.bz
> 2; \
>             if ! echo
> "0168a0174ee47407139ee32458c4d2a298ba4f44260343b209250156e4da463
> f  openjdk.tar.bz2" \
>               | /usr/bin/sha256sum --check ; then \
>               echo "ERROR: Bad download of OpenJDK root zip"; false; \
>             fi; \
>           else \
>             echo "ERROR: No up-to-date OpenJDK root zip available"; exit =
-1; \
>           fi ; \
>         fi ;
>=20
> openjdk.tar.bz2: FAILED
> /usr/bin/sha256sum: WARNING: 1 computed checksum did NOT match
>=20
> --2015-10-06 16:48:07--
> http://icedtea.classpath.org/download/drops/icedtea7/2.6.1/openjdk.tar.bz
> 2
>=20
> Resolving icedtea.classpath.org (icedtea.classpath.org)...
> 208.78.240.231
>=20
> Connecting to icedtea.classpath.org
> (icedtea.classpath.org)|208.78.240.231|:80...
> failed: Connection timed out.
>=20
> Regards,
> RAJ

Hi Richard,

An update to my attempt to build the latest java,=20
although I attempt to build from the latest version from meta-java, I am fa=
cing the timeout issue.
I followed your advice to increase the bitbake time from 30 to 100 seconds,=
 still no success.
Below are the ERROR message that I received. Please suggest me if there is =
anything else I can do.

 --2015-10-30 13:16:43--  (try:20)  http://icedtea.classpath.org/download/d=
rops/icedtea7/2.6.2/openjdk.tar.bz2
 Connecting to icedtea.classpath.org (icedtea.classpath.org)|208.78.240.231=
|:80... failed: Connection timed out.
 Giving up.

 /usr/bin/sha256sum: openjdk.tar.bz2: No such file or directory
 openjdk.tar.bz2: FAILED open or read
 /usr/bin/sha256sum: WARNING: 1 listed file could not be read
 ERROR: Bad download of OpenJDK root zip
 make: *** [stamps/download-openjdk.stamp] Error 1
 ERROR: oe_runmake failed
=20


