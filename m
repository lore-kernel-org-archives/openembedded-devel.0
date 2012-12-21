Received: from mail-pb0-f49.google.com ([209.85.160.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tm6Vz-0007RN-OL
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Dec 2012 18:36:08 +0100
Received: by mail-pb0-f49.google.com with SMTP id un15so2834232pbc.22
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Dec 2012 09:21:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:mime-version
	:content-type:content-disposition:user-agent;
	bh=DZc9CpLtuFBJJZX8G+BsOk+Zofj5PrMr7KpZ+cF5c5Q=;
	b=WFbmp69TxxpL0p07U0PBR0JPyjtlpjC6I0V9CMheU0UPghgDP+3OvfXo9D4YFWbVKP
	dt5dq6f1MhGKGgz664APvfje7sz7rnAvkGlZzcRCOshnXi/pmEcRtzf8uAZNhvYmH35P
	eZwB1/pen9QoSTAifMB5TTcuSftUaXBrlMKEim8MVEphUV+tPZMjO24Dl6/R9EMtyFw+
	H9dT3uIWzO+HrNlQjhZK7WxZCy+THKAEYmAzUIEeXi0jnr3oNbeQh6NtWPd1RJjrWODV
	sF7Va+GYZm1wwDgUyB/ho8mxuskNE1U5vN+gHZQ6oN8UlOFuCz3GFf3p/D8x4MEdmXvv
	gALg==
X-Received: by 10.68.137.234 with SMTP id ql10mr41268265pbb.158.1356110480850; 
	Fri, 21 Dec 2012 09:21:20 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id pj1sm7289030pbb.71.2012.12.21.09.21.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 21 Dec 2012 09:21:19 -0800 (PST)
Date: Fri, 21 Dec 2012 18:21:19 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20121221172119.GA8847@jama.palm1.palmone.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: traceroute: Add from OE-Classic, uprev and update
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
X-List-Received-Date: Fri, 21 Dec 2012 17:36:09 -0000
X-Groupsio-MsgNum: 42306
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="C7zPtVaVf+AK4Oqc"
Content-Disposition: inline

--C7zPtVaVf+AK4Oqc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

traceroute_2.0.18.bb added by you in=20
commit 79811942660877cedf366c542d2ee4025bf54b77
Author: Morgan Little <morgan.little@windriver.com>
Date:   Tue Oct 23 18:04:50 2012 +0000

    traceroute: Add from OE-Classic, uprev and update

Is using bashisms in do_install:
    pushd ${D}${mandir}
    ln -s ${PN}.8 ${PN}6.8
    ln -s ${PN}.8 tcptraceroute.8
    popd

Can you fix that?

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--C7zPtVaVf+AK4Oqc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDUmo8ACgkQN1Ujt2V2gBxH1ACfRP1mcQ6WyWkRPHQk3qbXtGNm
p5EAoLlRFpk243EdDa6TYLxPBtfNCb0Z
=4TUr
-----END PGP SIGNATURE-----

--C7zPtVaVf+AK4Oqc--
