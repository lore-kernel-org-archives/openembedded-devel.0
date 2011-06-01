Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QRdcC-0002I7-7i
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Jun 2011 07:05:08 +0200
Received: by fxm19 with SMTP id 19so4088079fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 May 2011 22:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=43lM1wZA0jVQkA4F4+uQuNZH9oAlEnaVRB/l/cNUTpc=;
	b=aXJKMtmIGzRXMW+fgpr491tLilT2ivVVWo7JulT+XdPcuRknTgvXT9njM7QWiOk4V/
	2hl3q0WVjnlxUmq8NydlK4+9qVDn7k3jq+s1ixwriMusAJAr+bqNOT+wKYIwMQI/oJBL
	EwyJ0r66x3pSAN1hoO2MoJ9WS92yQwc9egWv0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=pankjSnYN6BHa/KET6VkRg+mc3Emjzk0G5ZBA9kgGKnLLbagGDbOhil9UhRFUUx7D9
	M4Ks64b699qsA4swd9m7oqmOfdb2cgfkKWBXEUzMUk01xvzSomVXyoqYQvs5O7jWmLTt
	SwsNkHdUivKBhobmEVZpC/RmZ+a5mZG1uxiLs=
Received: by 10.223.16.136 with SMTP id o8mr1996279faa.21.1306904518042;
	Tue, 31 May 2011 22:01:58 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id 11sm236686fax.12.2011.05.31.22.01.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 31 May 2011 22:01:57 -0700 (PDT)
Date: Wed, 1 Jun 2011 07:01:51 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110601050151.GE23647@jama.jama.net>
References: <20110531114917.33186l97l89fv3oc@webmail.htc-linux.org>
	<20110531115612.15355h3xwavjtjyo@webmail.htc-linux.org>
	<20110531232513.19296umd0ei7gu0w@webmail.htc-linux.org>
	<4DE5A3A0.1070508@gmail.com>
MIME-Version: 1.0
In-Reply-To: <4DE5A3A0.1070508@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: oebb.sh oe-core with non-angstrom distro
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
X-List-Received-Date: Wed, 01 Jun 2011 05:05:08 -0000
X-Groupsio-MsgNum: 32442
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5oH/S/bF6lOfqCQb"
Content-Disposition: inline

--5oH/S/bF6lOfqCQb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 31, 2011 at 07:27:44PM -0700, Khem Raj wrote:
> I guess SHR needs a master projects on similar lines. Using angstrom=20
> scripts may not be the correct thing to do. Martin might already have=20
> something. But similar to angstrom scripts there is slugos master=20
> repository for layer management and configuration.
>=20
> git://github.com/kraj/slugos-setup.git
>=20
> I think distro's should have such a repo so they do not have conflict of=
=20
> interest and can do things without pinching others toes.

Yes we have..
http://git.shr-project.org/git/?p=3Dshr-makefile.git;a=3Dsummary
with shr-core (shr based on oe-core and other layers) support since
2011-03-02 :). But Lukas doesn't like Makefile for some reason..

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--5oH/S/bF6lOfqCQb
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk3lx78ACgkQN1Ujt2V2gBy04QCcDKNe8A7HrxewBcvZOtPxD+UQ
zrIAoKnPDBsE5JAywlfWdWCEnPIwY7AN
=A+Hw
-----END PGP SIGNATURE-----

--5oH/S/bF6lOfqCQb--
