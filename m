Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f49.google.com (mail-ee0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id 762B865E14
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Apr 2014 23:56:17 +0000 (UTC)
Received: by mail-ee0-f49.google.com with SMTP id c41so3163828eek.8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Apr 2014 16:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Jgz2vOQELRPqTw9h8rGDr2FDGcLvU/FV40bzHt/nCy8=;
	b=JbgwBnDOxLeuBAuxT7fMbwqllmdyKDDx9M1TDmeHCQjguesyiOZaOylKlpxA/NMXMt
	TM0Ol/bPim9+MvQohmSBIsjNa8cCNyJb7VaWE1hhI3EJcweyQUJmcMZ+rG4VYIwWY/Sq
	oH8/7kvRBBYZC5+c0UrHvscBZswHWQPdWSvJbnBuQveXKTpNwJ1pLwFNTWxMG6kkgHnC
	lC5BvfsN7iHxWZnujRJRk/VBlvF13O3iL10imAAc6riJo6yLqIlI73rNuU9WNBVQiCTQ
	9a4EXcABoOfKYwj6DaPmFwmVhrKB/2O2Rg9fuGrNvXbVBOq1Dy+OwVrNtYu5UGk/Efqo
	Dqdg==
X-Received: by 10.14.246.196 with SMTP id q44mr13464306eer.45.1398470178441;
	Fri, 25 Apr 2014 16:56:18 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	o5sm28678116eeg.8.2014.04.25.16.56.16
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Apr 2014 16:56:16 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 26 Apr 2014 01:56:27 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140425235627.GA2486@jama>
References: <CAN-NoH3n=jjiSUou_drXk1xSD8rrKymWXiERgoHEeyus2LCz+A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAN-NoH3n=jjiSUou_drXk1xSD8rrKymWXiERgoHEeyus2LCz+A@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: v4l-utils won't build
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
X-List-Received-Date: Fri, 25 Apr 2014 23:56:21 -0000
X-Groupsio-MsgNum: 49513
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bmO0DhbO8B5xO2aX"
Content-Disposition: inline

--bmO0DhbO8B5xO2aX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 25, 2014 at 12:56:26PM -0700, Richard Cagley wrote:
> After running bitbake core-image-minimal I'm trying to run bitbake opencv
> and I get the below. I've looking through the log files and the v4l-utils
> recipe. All I can see is that it's unhappy about something to do with the
> autotools configuration for the project. Any ideas?

See
http://git.openembedded.org/openembedded-core/commit/?id=3Dbaf5b230af919b6b=
0fd14ac5fc3e734bf7c464d5
and related discussion on ML

>=20
> NOTE: Preparing runqueue
> NOTE: Executing SetScene Tasks
> NOTE: Executing RunQueue Tasks
> ERROR: Function failed: do_configure (log file is located at
> /home/rcagley/oe-zed-track/build/tmp-eglibc/work/i586-oe-linux/v4l-utils/=
0.8.8-r2/temp/log.do_configure.3977)
> ERROR: Logfile of failure stored in:
> /home/rcagley/oe-zed-track/build/tmp-eglibc/work/i586-oe-linux/v4l-utils/=
0.8.8-r2/temp/log.do_configure.3977
> Log data follows:
> | DEBUG: Executing python function sysroot_cleansstate
> | DEBUG: Python function sysroot_cleansstate finished
> | DEBUG: SITE files ['endian-little', 'bit-32', 'ix86-common',
> 'common-linux', 'common-glibc', 'i586-linux', 'common']
> | DEBUG: Executing shell function autotools_preconfigure
> | DEBUG: Shell function autotools_preconfigure finished
> | DEBUG: Executing python function autotools_copy_aclocals
> | DEBUG: Python function autotools_copy_aclocals finished
> | DEBUG: Executing shell function do_configure
> | autoreconf: 'configure.ac' or 'configure.in' is required
> | WARNING:
> /home/rcagley/oe-zed-track/build/tmp-eglibc/work/i586-oe-linux/v4l-utils/=
0.8.8-r2/temp/run.do_configure.3977:1
> exit 1 from
> |   autoreconf -vfi
> | ERROR: Function failed: do_configure (log file is located at
> /home/rcagley/oe-zed-track/build/tmp-eglibc/work/i586-oe-linux/v4l-utils/=
0.8.8-r2/temp/log.do_configure.3977)
> ERROR: Task 385
> (/home/rcagley/oe-zed-track/meta-oe/meta-oe/recipes-multimedia/v4l2apps/
> v4l-utils_0.8.8.bb, do_configure) failed with exit code '1'
> NOTE: Tasks Summary: Attempted 1698 tasks of which 879 didn't need to be
> rerun and 1 failed.
> Waiting for 0 running tasks to finish:
>=20
> Summary: 1 task failed:
>   /home/rcagley/oe-zed-track/meta-oe/meta-oe/recipes-multimedia/v4l2apps/
> v4l-utils_0.8.8.bb, do_configure
> Summary: There was 1 ERROR message shown, returning a non-zero exit code.
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--bmO0DhbO8B5xO2aX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNa9isACgkQN1Ujt2V2gBxwAQCdE3E7j0epu7ZXCvriJHjCV8Ok
E3sAoJ2kAosvbKPlf40fhhw+2fmBPTjx
=hQ86
-----END PGP SIGNATURE-----

--bmO0DhbO8B5xO2aX--
