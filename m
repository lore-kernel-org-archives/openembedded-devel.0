Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1PsUrx-0008KJ-0X
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Feb 2011 07:40:09 +0100
Received: by fxm8 with SMTP id 8so220430fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Feb 2011 22:38:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=6CZ2ksI+u5ecfr4viuAKfOibca/sXGP6VYpxU64KtS4=;
	b=k6UKNncy0IaPHWmC1QYGsPqqS8sj/cd/JLkRgKQhA6SubPr8UgK4NNnNH7AWJodcJx
	9QlNDatEaUNiICpGKFeH7ytLrmgj/SWsHz7fMTP4F0p1ao+NI5ii32ahxJ2NZtwnb378
	SZRXjkKrWdr5VF5+uiJoEyrRXrVPqe92lBAlA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=rWP95loNXE2lxeFQbRLOQMexBo82g5KCI52ztW+yxZNBXCBZPSJ6NmU0XbOijRg6wO
	x8iymQUPsKGFgMjyg5vQrb63KPHYrp/gY1IebQP6sMho3qI4K2VFfvSIiSkWZAkRFLRy
	zZXLNS+Sy++Bl1yoStKAcIyTP6UivbI2S5MAo=
Received: by 10.223.83.7 with SMTP id d7mr509483fal.82.1298529527077;
	Wed, 23 Feb 2011 22:38:47 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id z1sm383331fau.21.2011.02.23.22.38.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 23 Feb 2011 22:38:46 -0800 (PST)
Date: Thu, 24 Feb 2011 07:38:40 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110224063839.GG3478@jama.jama.net>
References: <1298512974-1229-1-git-send-email-obi@opendreambox.org>
MIME-Version: 1.0
In-Reply-To: <1298512974-1229-1-git-send-email-obi@opendreambox.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] python-2.6: python-xml depends on python-elementtree
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
X-List-Received-Date: Thu, 24 Feb 2011 06:40:09 -0000
X-Groupsio-MsgNum: 29648
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3607uds81ZQvwCD0"
Content-Disposition: inline

--3607uds81ZQvwCD0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 24, 2011 at 02:02:54AM +0000, Andreas Oberritter wrote:
> * Fixes the following error:
>=20
>   import xml.etree.cElementTree
>   File "/usr/lib/python2.6/xml/etree/cElementTree.py", line 3, in <module>
>   from _elementtree import *
>   ImportError: No module named _elementtree
>=20
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> ---
>  contrib/python/generate-manifest-2.6.py |    4 ++--
>  recipes/python/python-2.6-manifest.inc  |    4 ++--
>  recipes/python/python_2.6.6.bb          |    2 +-
>  3 files changed, 5 insertions(+), 5 deletions(-)

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

--3607uds81ZQvwCD0
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk1l/O8ACgkQN1Ujt2V2gBxnCwCfVGVE6ytSsaYSDOYLFAsUXsSb
1E8An15Mc176raSWXxQDp+0I2s5MbFOE
=JbkP
-----END PGP SIGNATURE-----

--3607uds81ZQvwCD0--
