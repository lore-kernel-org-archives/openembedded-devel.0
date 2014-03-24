Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f46.google.com (mail-ee0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id 7B8076F9F8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Mar 2014 15:08:41 +0000 (UTC)
Received: by mail-ee0-f46.google.com with SMTP id t10so4561145eei.33
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Mar 2014 08:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=jtfhCze1Y2PSS/fRiM4J2UC7LPbcEvuVmrB9Jf8rbPQ=;
	b=PsAlSqRjtg8EuB+NCNb7n2hJOalUTOqsLws5HPrc72p6D40RrNJk+L8OYXIA6VoZff
	1kHSYLUMz/QIP7K5cbrhtOH+9jccqhyylXPIyVW6V58QJ29ELEBM8ROmYuqp1RQLdpjs
	wbujoICCxHHGC7ony20dM+XeIKzszSBPkrTuzIJ8shKpZhC9GvefjmglzXhSgKDT7DaZ
	v1pqOllc98FDKVcrpLWjFnxaX+wuA4+D6Sny2ueChhbaai0s8euo1vdTwE504O4VugPr
	HnMYsJpz94E5QjLJvORJWGtxBqwTmsU7LhsCtpqzVyr/PHwI9c7IXKABedyAiTIScyVw
	6AFQ==
X-Received: by 10.14.194.133 with SMTP id m5mr64324924een.38.1395673721901;
	Mon, 24 Mar 2014 08:08:41 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	m8sm33747361eeg.11.2014.03.24.08.08.40
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Mar 2014 08:08:40 -0700 (PDT)
Date: Mon, 24 Mar 2014 16:08:48 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140324150848.GA29998@jama>
References: <1377858084-31009-1-git-send-email-b40290@freescale.com>
	<20130904124920.GE11500@jama>
MIME-Version: 1.0
In-Reply-To: <20130904124920.GE11500@jama>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-oe][PATCH V4 ] daq: add recipe
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
X-List-Received-Date: Mon, 24 Mar 2014 15:08:44 -0000
X-Groupsio-MsgNum: 48810
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dDRMvlgZJXvWKvBx"
Content-Disposition: inline

--dDRMvlgZJXvWKvBx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 04, 2013 at 02:49:20PM +0200, Martin Jansa wrote:
> On Fri, Aug 30, 2013 at 06:21:24PM +0800, b40290@freescale.com wrote:
> > From: Chunrong Guo <B40290@freescale.com>
> >=20
> >    *The dump DAQ test the various inline mode features
> >    *snort depends daq
> >=20
> > Signed-off-by: Chunrong Guo <B40290@freescale.com>
> > ---
> >  meta-oe/recipes-connectivity/daq/daq_2.0.1.bb      |   16 +++++++++++
> >  ...le-run-test-program-while-cross-compiling.patch |   29 ++++++++++++=
++++++++
> >  2 files changed, 45 insertions(+), 0 deletions(-)
> >  create mode 100644 meta-oe/recipes-connectivity/daq/daq_2.0.1.bb
> >  create mode 100644 meta-oe/recipes-connectivity/daq/files/disable-run-=
test-program-while-cross-compiling.patch
> >=20
> > diff --git a/meta-oe/recipes-connectivity/daq/daq_2.0.1.bb b/meta-oe/re=
cipes-connectivity/daq/daq_2.0.1.bb
> > new file mode 100644
> > index 0000000..4c1be44
> > --- /dev/null
> > +++ b/meta-oe/recipes-connectivity/daq/daq_2.0.1.bb
> > @@ -0,0 +1,16 @@
> > +DESCRIPTION =3D "The dump DAQ test the various inline mode features "
> > +HOMEPAGE =3D "http://www.snort.org"
> > +LICENSE =3D "GPLv2"
> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df9ce51a65dd738dc1ae631d8b21=
c40e0"
> > +
> > +PARALLEL_MAKE =3D ""
> > +
> > +DEPENDS =3D "libpcap libpcre "
> > +
> > +SRC_URI =3D "http://fossies.org/linux/misc/daq-${PV}.tar.gz \
> > +            file://disable-run-test-program-while-cross-compiling.patc=
h "
> > +
> > +SRC_URI[md5sum] =3D "044aa3663d44580d005293eeb8ccf175"
> > +SRC_URI[sha256sum] =3D "ebba87c2ec76ac65d2980934423b0597909caead3a86ce=
5d1ba1ea6ce518ec6d"
> > +
> > +inherit autotools
>=20
> I don't have more than build log because workspace is already gone, but
> qemuarm build fails:
>=20
> ERROR: Function failed: do_install (log file is located at
> /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-li=
nux-gnueabi/daq/2.0.1-r0/temp/log.do_install.4742)
> ERROR: Logfile of failure stored in:
> /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-li=
nux-gnueabi/daq/2.0.1-r0/temp/log.do_install.4742
> Log data follows:
> | DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common',
> 'common-linux', 'common-glibc', 'arm-linux', 'arm-linux-gnueabi',
> 'common']
> | DEBUG: Executing shell function do_install
> | NOTE: make
> DESTDIR=3D/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/arm=
v5te-oe-linux-gnueabi/daq/2.0.1-r0/image
> install
> | make: *** No rule to make target `install'.  Stop.
> | ERROR: oe_runmake failed
> | WARNING: exit code 1 from a shell command.
> | ERROR: Function failed: do_install (log file is located at
> /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-li=
nux-gnueabi/daq/2.0.1-r0/temp/log.do_install.4742)
> NOTE: recipe daq-2.0.1-r0: task do_install: Failed
> ERROR: Task 19484
> (/home/jenkins/oe/shr-core-branches/shr-core/meta-openembedded/meta-oe/re=
cipes-connectivity/daq/daq_2.0.1.bb,
> do_install) failed with exit code '1'

Can we fix this please?

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--dDRMvlgZJXvWKvBx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMwSoAACgkQN1Ujt2V2gBwcawCfb8N/yQ+Y0/LmKyHaYhocrCp3
GXIAn2vbDYri5fsUc6EJ0DEUqqTnrRlm
=LS/l
-----END PGP SIGNATURE-----

--dDRMvlgZJXvWKvBx--
