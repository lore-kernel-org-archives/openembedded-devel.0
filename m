Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f169.google.com (mail-ea0-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id 311696007C;
	Mon,  8 Jul 2013 12:10:40 +0000 (UTC)
Received: by mail-ea0-f169.google.com with SMTP id h15so2870522eak.14
	for <multiple recipients>; Mon, 08 Jul 2013 05:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=lqmfpzp1vkFrNKSrJZmaX2nCpb1c+MubtL+SadARDwc=;
	b=IBXibLRpE9Ciey+sTzL0QF6+Kha6aWnn0y8wE7fzgjvDxPyomB4sDFsot6Q6CejAxw
	qsjWku0xqLvhrxIckjkPJyAy2qg2Iyq/rv32Z8SO834ZpxsrV8MvAzWvEl+fOmHDnS/N
	rY6a0RvTJ+bjX8wRzvNN7R87H1RWz+AL3gsNJdEzgYhxwB39cqYo+KhvdZ7jp/eDmW5x
	uXXY5qpscLqMUeixFIGN/sa7SW7ac7AtDFi2mh3n9Roiq8JrFY2XtosnpkfSXoSpxu5C
	0dlsEBusZlmgiuYSVCskQBaRuH5fV1FabUhRoPIAel1QSyStmMkNF6zDt3hvNry8rJQV
	X0eQ==
X-Received: by 10.14.3.73 with SMTP id 49mr24764649eeg.72.1373285440820;
	Mon, 08 Jul 2013 05:10:40 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	n45sm41784898eew.1.2013.07.08.05.10.39 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 08 Jul 2013 05:10:40 -0700 (PDT)
Date: Mon, 8 Jul 2013 14:10:48 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130708121048.GK3288@jama>
References: <20130705143917.C20B35040C@opal>
MIME-Version: 1.0
In-Reply-To: <20130705143917.C20B35040C@opal>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Khem Raj : eglibc: Add 2.18 recipes
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
X-List-Received-Date: Mon, 08 Jul 2013 12:10:41 -0000
X-Groupsio-MsgNum: 45340
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Rex5+51txc1ort/q"
Content-Disposition: inline

--Rex5+51txc1ort/q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 05, 2013 at 02:39:17PM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: 59ae9fc07a6a89492c001de0b3322ecd6d3956be
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D59ae9fc07a6a89492c001de0b3322ecd6d3956be
>=20
> Author: Khem Raj <raj.khem@gmail.com>
> Date:   Wed Jun 26 13:59:01 2013 -0700
>=20
> eglibc: Add 2.18 recipes
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>

boost is now failing on all architectures

=2E/boost/atomic/atomic.hpp: At global scope:
=2E/boost/atomic/atomic.hpp:202:16: error: 'uintptr_t' was not declared in =
this scope
 typedef atomic<uintptr_t> atomic_uintptr_t;
                ^
=2E/boost/atomic/atomic.hpp:202:25: error: template argument 1 is invalid
 typedef atomic<uintptr_t> atomic_uintptr_t;
                         ^
=2E/boost/atomic/atomic.hpp:202:43: error: invalid type in declaration befo=
re ';' token
 typedef atomic<uintptr_t> atomic_uintptr_t;
                                           ^
Adding
#include <stdint.h> in boost/atomic/atomic.hpp solves that, but
#include <cstdint> doesn't, is it right fix?

--Rex5+51txc1ort/q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlHarEgACgkQN1Ujt2V2gBwuJACfWy2Irec4VFZkyKCY7xJDMUk3
oigAn1/HQxHlGXb0vPBpozISfw21zMge
=A2A1
-----END PGP SIGNATURE-----

--Rex5+51txc1ort/q--
