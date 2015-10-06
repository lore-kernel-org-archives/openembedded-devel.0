Return-Path: <yugeraj.ramajayam@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 5DD5476BE7
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Oct 2015 08:56:47 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 06 Oct 2015 01:56:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,643,1437462000"; d="scan'208";a="820386324"
Received: from pgsmsx102.gar.corp.intel.com ([10.221.44.80])
	by fmsmga002.fm.intel.com with ESMTP; 06 Oct 2015 01:56:45 -0700
Received: from pgsmsx101.gar.corp.intel.com ([169.254.1.172]) by
	PGSMSX102.gar.corp.intel.com ([169.254.6.195]) with mapi id
	14.03.0248.002; Tue, 6 Oct 2015 16:55:29 +0800
From: "Ramajayam, Yugeraj" <yugeraj.ramajayam@intel.com>
To: Richard Leitner <richard.leitner@skidata.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-java] openjdk: openjdk.tar.bz2 download time out due to
	sha256sum mismatch.
Thread-Index: AdD3c9wnx4yvlXkqSBK6sRsk2GSHJwC9KCWAAWrt40A=
Date: Tue, 6 Oct 2015 08:55:29 +0000
Message-ID: <D4F319EC2C6BBA46B2FB63E54D8E81C3C05B08@PGSMSX101.gar.corp.intel.com>
References: <D4F319EC2C6BBA46B2FB63E54D8E81C3C03392@PGSMSX101.gar.corp.intel.com>
	<560A7883.5010200@skidata.com>
In-Reply-To: <560A7883.5010200@skidata.com>
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
X-List-Received-Date: Tue, 06 Oct 2015 08:56:49 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Richard Leitner [mailto:richard.leitner@skidata.com]
> Sent: Tuesday, September 29, 2015 7:40 PM
> To: openembedded-devel@lists.openembedded.org
> Cc: Ramajayam, Yugeraj <yugeraj.ramajayam@intel.com>; Sven Ebenfeld
> <sven.ebenfeld@gmail.com>
> Subject: Re: [meta-java] openjdk: openjdk.tar.bz2 download time out due t=
o
> sha256sum mismatch.
>=20
> On 09/25/2015 11:25 AM, Ramajayam, Yugeraj wrote:
> > Hi all,
> >
> > I am trying to include java support for valleyisland-64 bsp.
> >
> > I have followed all the Usage Instructions as mentioned in the
> > meta-java About page.
> >
> Your configuration looks fine!
>=20
> >
> > When I execute $ bitbake core-image-sato , I am having following error
> > due to openjdk.tar.bz2 time out issue.
> >
> > When I try to wget manually, the tar ball was downloaded fine and the
> > md5sum and sha256sum matches accordingly.
> >
> > The error message appears as below :
> ...
> >
> > *openjdk.tar.bz2: FAILED*
> > */usr/bin/sha256sum: WARNING: 1 computed checksum did NOT match*
> > * *
> > *--2015-09-25 17:00:34--
> > http://icedtea.classpath.org/download/drops/icedtea7/2.6.1/openjdk.tar
> > .bz2*
> > * *
> > *Resolving icedtea.classpath.org (icedtea.classpath.org)...*
> > *208.78.240.231*
> > * *
> > *Connecting to icedtea.classpath.org
> > (icedtea.classpath.org)|208.78.240.231|:80...*
> > *failed: Connection timed out.*
> > * *
> > *Retrying.*
>=20
> IMHO it looks like the wget falls into a timeout. How long does the "manu=
al"
> wget download take?
>=20
> You could try to increase the wget timeout in bitbake/lib/bb/fetch2/wget.=
py
> and meta/conf/bitbake.conf to for example
> 100sec:
>=20
> diff --git a/bitbake/lib/bb/fetch2/wget.py b/bitbake/lib/bb/fetch2/wget.p=
y
> --- a/bitbake/lib/bb/fetch2/wget.py
> +++ b/bitbake/lib/bb/fetch2/wget.py
> @@ -58,7 +58,7 @@ class Wget(FetchMethod):
>=20
>          ud.localfile =3D data.expand(urllib.unquote(ud.basename), d)
>=20
> -        self.basecmd =3D d.getVar("FETCHCMD_wget", True) or "/usr/bin/en=
v
> wget -t 2 -T 30 -nv --passive-ftp --no-check-certificate"
> +        self.basecmd =3D d.getVar("FETCHCMD_wget", True) or "/usr/bin/en=
v
> wget -t 2 -T 100 -nv --passive-ftp --no-check-certificate"
>=20
>      def _runwget(self, ud, d, command, quiet):
>=20
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -575,7 +575,7 @@ XORG_MIRROR =3D
> "http://xorg.freedesktop.org/releases"
>=20
>  FETCHCMD_svn =3D "/usr/bin/env svn --non-interactive --trust-server-cert=
"
>  FETCHCMD_cvs =3D "/usr/bin/env cvs"
> -FETCHCMD_wget =3D "/usr/bin/env wget -t 2 -T 30 -nv --passive-ftp --no-
> check-certificate"
> +FETCHCMD_wget =3D "/usr/bin/env wget -t 2 -T 100 -nv --passive-ftp
> --no-check-certificate"
>  FETCHCMD_bzr =3D "/usr/bin/env bzr"
>  FETCHCMD_hg =3D "/usr/bin/env hg"
>=20
>=20
> hope that helps!
>=20
> best regards,
> Richard L

Hi Richard,

I tried increasing the wget duration from 30 seconds to 100 seconds as you =
suggested. I'm still facing the timeout issue.=20
This is what I get when I execute $ bitbake -v openjdk-7-jre :=20


ln -sf /home/ilab/dev/build/poky/build/tmp/work/core2-32-poky-linux/openjdk=
-7-jre/85b01-2.6.1-r6.1/39b2c4354d0a.tar.bz2 openjdk.tar.bz2

if ! echo "0168a0174ee47407139ee32458c4d2a298ba4f44260343b209250156e4da463f=
  openjdk.tar.bz2" \
          | /usr/bin/sha256sum --check ; \
        then \
          if test "xyes" =3D "xyes"; then \
            if [ -e openjdk.tar.bz2 ] ; then \
              mv openjdk.tar.bz2 openjdk.tar.bz2.old ; \
            fi ; \
            /usr/bin/wget http://icedtea.classpath.org/download/drops/icedt=
ea7/2.6.1/openjdk.tar.bz2; \
            if ! echo "0168a0174ee47407139ee32458c4d2a298ba4f44260343b20925=
0156e4da463f  openjdk.tar.bz2" \
              | /usr/bin/sha256sum --check ; then \
              echo "ERROR: Bad download of OpenJDK root zip"; false; \
            fi; \
          else \
            echo "ERROR: No up-to-date OpenJDK root zip available"; exit -1=
; \
          fi ; \
        fi ;

openjdk.tar.bz2: FAILED
/usr/bin/sha256sum: WARNING: 1 computed checksum did NOT match

--2015-10-06 16:48:07--  http://icedtea.classpath.org/download/drops/icedte=
a7/2.6.1/openjdk.tar.bz2

Resolving icedtea.classpath.org (icedtea.classpath.org)...
208.78.240.231

Connecting to icedtea.classpath.org (icedtea.classpath.org)|208.78.240.231|=
:80...
failed: Connection timed out.

Regards,
RAJ

