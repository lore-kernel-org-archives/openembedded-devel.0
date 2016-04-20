Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 6A52D70022
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Apr 2016 09:23:23 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id n3so71086372wmn.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Apr 2016 02:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=BGHiN/BAMLf5q2k6zHrWgynrUsIYW8WqWvgyEEz4W2Y=;
	b=prYTIlYZA/8T/AptW4xpYr6SsAf0v7NXZL8kX9OxwMMM0GkkOABx5dZzfIae0NUVjE
	DNzSTLBPHxv9KwQ0/ZUZE89QWoHQ/YwQ//irYDW2u1/T50tosrcfoBZomLtbZGfb64Su
	O3Le0g8CPREDEEKpjPSX4yNO5aPBzYkXTHgQYwXI4a5g3GrMiQfWiDwO8TTExnxnR60z
	fS5i8YSjRYN2eSL5dzu69sNZUAOlVsZxqLA1sgRLxitCJAhttzzRcOS8SEBNtX9dZn1T
	AHwyo6beal+7SWWTd0OAevzvv7xE8L0DkXU330SbwLfuEimpNzJWDHLMJUISSaoqk+YX
	Z6/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=BGHiN/BAMLf5q2k6zHrWgynrUsIYW8WqWvgyEEz4W2Y=;
	b=ktEWp9ttmPshFgvBhK46aUkz3tiJk7+MU9GWH5z62bfhkqmN1uEmCL3BxALBRfJ05D
	wBRzXQzHrgaCtqWPrcw23uJrjBajQAItbV5ZIPeVadfPlFG6AETHaqIopg7Z46xseEl2
	/S/FEO158b4TSEySfGIW3H5VQFideSpHQrrHOcg1wbp0Zi1OqJiitN9Qw3gKOxIISEEs
	W6Gj2VsDldfuIY0y+fwa9weu+9nIels5OcPAmRoHTOMWCTyYILorcaMkTlujsOFQa/xH
	POk8Xt95QVzmyxiXXbW3ufsxqf6N2iFkjmaZ3xUN1eq7f8Ya/yq2ym6eX1duLhoEw+v/
	+QOA==
X-Gm-Message-State: AOPr4FUv7IxmGqo0/mh6GNL6UfxbqdE/nsZAeAW/EeyTIgTwwjRFiCeoMTrTKxkr8hEg4A==
X-Received: by 10.28.128.88 with SMTP id b85mr30814661wmd.46.1461144204518;
	Wed, 20 Apr 2016 02:23:24 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	h124sm8602263wmf.7.2016.04.20.02.23.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Apr 2016 02:23:23 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 20 Apr 2016 11:25:23 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160420092523.GB2561@jama>
References: <1459750358-12047-1-git-send-email-eduardo@monkey.io>
	<5704E88E.2070402@felipetonello.com>
	<CAEaCVQjOC2sp3MWAntW4LU6mdDyb-T-CxJCBuXw1ivz3tiaHhA@mail.gmail.com>
	<CAEaCVQgOCvFJzTBmDjYqVPSnvxOf43hX6b5bGRcX4Lmo6H1YJA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAEaCVQgOCvFJzTBmDjYqVPSnvxOf43hX6b5bGRcX4Lmo6H1YJA@mail.gmail.com>
User-Agent: Mutt/1.6.0 (2016-04-01)
Subject: Re: [meta-oe][PATCH v2] fluentbit: add new recipe
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
X-List-Received-Date: Wed, 20 Apr 2016 09:23:24 -0000
X-Groupsio-MsgNum: 61072
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2B/JsCI69OhZNC5r"
Content-Disposition: inline

--2B/JsCI69OhZNC5r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 15, 2016 at 08:12:54AM -0600, Eduardo Silva wrote:
> is the patch OK ?

No, fails here:

NOTE: recipe fluentbit-0.7.2-r0: task do_package_qa: Started
ERROR: fluentbit-0.7.2-r0 do_package_qa: QA Issue: -dev package contains no=
n-symlink .so: fluentbit-dev path 'work/armv5te-oe-linux-gnueabi/fluentbit/=
0.7.2-r0/packages-split/fluentbit-dev/usr/lib/libfluent-bit.so' [dev-elf]
ERROR: fluentbit-0.7.2-r0 do_package_qa: QA run found fatal errors. Please =
consider fixing them.
ERROR: fluentbit-0.7.2-r0 do_package_qa: Function failed: do_package_qa
ERROR: Logfile of failure stored in: /home/jenkins/oe/world/shr-core/tmp-gl=
ibc/work/armv5te-oe-linux-gnueabi/fluentbit/0.7.2-r0/temp/log.do_package_qa=
=2E28998
NOTE: recipe fluentbit-0.7.2-r0: task do_package_qa: Failed
ERROR: Task 11612 (/home/jenkins/oe/world/shr-core/meta-openembedded/meta-o=
e/recipes-extended/fluentbit/fluentbit_0.7.2.bb, do_package_qa) failed with=
 exit code '1'

> On Wed, Apr 6, 2016 at 10:38 AM, Eduardo Silva <eduardo@monkey.io> wrote:
>=20
> >
> >
> > On Wed, Apr 6, 2016 at 4:44 AM, Felipe Ferreri Tonello <
> > eu@felipetonello.com> wrote:
> >
> >> Hi Eduardo,
> >>
> >> On 04/04/16 07:12, Eduardo Silva wrote:
> >> > Fluent Bit is an open source data collector for Embedded Linux, this
> >> > patch adds the recipe for version 0.7.2.
> >> >
> >> >   Project web site: http://fluentbit.io
> >> >   Documentation   : http://fluentbit.io/documentation/
> >> >
> >> > Signed-off-by: Eduardo Silva <eduardo@monkey.io>
> >> > ---
> >> >  meta-oe/recipes-extended/fluentbit/fluentbit_0.7.2.bb | 15
> >> +++++++++++++++
> >> >  1 file changed, 15 insertions(+)
> >> >  create mode 100644 meta-oe/recipes-extended/fluentbit/
> >> fluentbit_0.7.2.bb
> >>
> >> If the project package is called fluent-bit, why did you name the reci=
pe
> >> fluentbit?
> >>
> >
> > just to follow the convention of RPM and DEB packages.
> >
> > regards,
> >
>=20
>=20
>=20
> --=20
> Eduardo Silva
> Monkey Software
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--2B/JsCI69OhZNC5r
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlcXSwIACgkQN1Ujt2V2gBxBKgCeJIayWZzx3q54lMnFvnDdJU55
VsAAn0RJ/gfCGEK+k3Jpf0TnzdjyPH53
=7NWw
-----END PGP SIGNATURE-----

--2B/JsCI69OhZNC5r--
