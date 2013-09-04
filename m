Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f49.google.com (mail-ee0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id 847EC6BD85
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Sep 2013 12:48:01 +0000 (UTC)
Received: by mail-ee0-f49.google.com with SMTP id d41so147852eek.36
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Sep 2013 05:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=qUR6f2BPe1JPxDgYGrKB4z/Rmc5BIVu/Ho8e03zsBxE=;
	b=QuC8Suy4U8uo+8fXbqBLoZjy1bFaRYQE0C0453cTLwatOEi7WIfwnxyJLoYK91/amq
	dw9x+wVnijRSzunRbuqk8ZenZlPoK+w814+pExe/zJPwmtIrz/j/vDMx6alIk9P2gN64
	Y6THc9FpOCNcy8acCrtHX9WhB8vuzN2CLK+204oyAJ8Uee9QWoTfBgm138Q+yzH7Tbfd
	gRO4MxrCKBpIEc0yG9NLUZ3bOu/xf+SbESBEgjbhsIktOalmGSVDAqhjE+OkagPvT2st
	/zhhopAWWK69yJLpBvtOkT81MQ95Y3nNfqINy6Pwhs9iatb52vEUss+7tONfDXY28y3Q
	tjxg==
X-Received: by 10.14.178.66 with SMTP id e42mr2510409eem.67.1378298882268;
	Wed, 04 Sep 2013 05:48:02 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	x47sm39758388eea.16.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 04 Sep 2013 05:48:01 -0700 (PDT)
Date: Wed, 4 Sep 2013 14:49:20 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130904124920.GE11500@jama>
References: <1377858084-31009-1-git-send-email-b40290@freescale.com>
MIME-Version: 1.0
In-Reply-To: <1377858084-31009-1-git-send-email-b40290@freescale.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
X-List-Received-Date: Wed, 04 Sep 2013 12:48:02 -0000
X-Groupsio-MsgNum: 46061
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Rgf3q3z9SdmXC6oT"
Content-Disposition: inline

--Rgf3q3z9SdmXC6oT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 30, 2013 at 06:21:24PM +0800, b40290@freescale.com wrote:
> From: Chunrong Guo <B40290@freescale.com>
>=20
>    *The dump DAQ test the various inline mode features
>    *snort depends daq
>=20
> Signed-off-by: Chunrong Guo <B40290@freescale.com>
> ---
>  meta-oe/recipes-connectivity/daq/daq_2.0.1.bb      |   16 +++++++++++
>  ...le-run-test-program-while-cross-compiling.patch |   29 ++++++++++++++=
++++++
>  2 files changed, 45 insertions(+), 0 deletions(-)
>  create mode 100644 meta-oe/recipes-connectivity/daq/daq_2.0.1.bb
>  create mode 100644 meta-oe/recipes-connectivity/daq/files/disable-run-te=
st-program-while-cross-compiling.patch
>=20
> diff --git a/meta-oe/recipes-connectivity/daq/daq_2.0.1.bb b/meta-oe/reci=
pes-connectivity/daq/daq_2.0.1.bb
> new file mode 100644
> index 0000000..4c1be44
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/daq/daq_2.0.1.bb
> @@ -0,0 +1,16 @@
> +DESCRIPTION =3D "The dump DAQ test the various inline mode features "
> +HOMEPAGE =3D "http://www.snort.org"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df9ce51a65dd738dc1ae631d8b21c4=
0e0"
> +
> +PARALLEL_MAKE =3D ""
> +
> +DEPENDS =3D "libpcap libpcre "
> +
> +SRC_URI =3D "http://fossies.org/linux/misc/daq-${PV}.tar.gz \
> +            file://disable-run-test-program-while-cross-compiling.patch "
> +
> +SRC_URI[md5sum] =3D "044aa3663d44580d005293eeb8ccf175"
> +SRC_URI[sha256sum] =3D "ebba87c2ec76ac65d2980934423b0597909caead3a86ce5d=
1ba1ea6ce518ec6d"
> +
> +inherit autotools

I don't have more than build log because workspace is already gone, but
qemuarm build fails:

ERROR: Function failed: do_install (log file is located at
/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-linu=
x-gnueabi/daq/2.0.1-r0/temp/log.do_install.4742)
ERROR: Logfile of failure stored in:
/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-linu=
x-gnueabi/daq/2.0.1-r0/temp/log.do_install.4742
Log data follows:
| DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common',
'common-linux', 'common-glibc', 'arm-linux', 'arm-linux-gnueabi',
'common']
| DEBUG: Executing shell function do_install
| NOTE: make
DESTDIR=3D/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5=
te-oe-linux-gnueabi/daq/2.0.1-r0/image
install
| make: *** No rule to make target `install'.  Stop.
| ERROR: oe_runmake failed
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_install (log file is located at
/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-linu=
x-gnueabi/daq/2.0.1-r0/temp/log.do_install.4742)
NOTE: recipe daq-2.0.1-r0: task do_install: Failed
ERROR: Task 19484
(/home/jenkins/oe/shr-core-branches/shr-core/meta-openembedded/meta-oe/reci=
pes-connectivity/daq/daq_2.0.1.bb,
do_install) failed with exit code '1'

--Rgf3q3z9SdmXC6oT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlInLFAACgkQN1Ujt2V2gBwDnQCglrGGGfFFRkAba+OQz7BL35xN
xkQAnjdQdN6T8KIwg4L4CPUixz1whsWm
=BNxa
-----END PGP SIGNATURE-----

--Rgf3q3z9SdmXC6oT--
