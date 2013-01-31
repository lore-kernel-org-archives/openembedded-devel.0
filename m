Received: from mail-pb0-f43.google.com ([209.85.160.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U0stc-0001CU-S4
	for openembedded-devel@lists.openembedded.org;
	Thu, 31 Jan 2013 13:05:37 +0100
Received: by mail-pb0-f43.google.com with SMTP id jt11so1578131pbb.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Jan 2013 03:49:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=W4qBYe1hsBZNr9VvG2GkfzGbTUN5qtLlBNpKKfkvDvU=;
	b=RnlJt5Pa0szVwhDuXcFtf8ghINXjeWU10/+yWjxdOGHRsMlCYXPxYfJJE/epX7oTUB
	4eUlRs5C+4syje898hclo3CVqUA+BSC/007x07tG4whx0lnVF+0ZrbRL/8ltLxPxInEO
	tRKHtaI2USvWjFbm7hX+kF9/hNbpAuCDLSDrf1NzQs8mKcE9WqZuXeCSMMyOiBQfUnZW
	BoiJuKGgvYjDNNS19DBAaUXOW044QLdAng76/qwlEUWbWL4BV9qhGraVO2MtOIf/vnWh
	01+6RBLXpKgJ6dlFiytUrkPxYIahNQXzG/i3+yfGUWPH0PT8lZWAhEOGrPDrJUFJvlD5
	cysw==
X-Received: by 10.68.234.6 with SMTP id ua6mr21381919pbc.62.1359632993551;
	Thu, 31 Jan 2013 03:49:53 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id qh4sm4826475pbb.9.2013.01.31.03.49.50
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 31 Jan 2013 03:49:52 -0800 (PST)
Date: Thu, 31 Jan 2013 12:49:49 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130131114949.GB2102@jama.dyndns-home.com>
References: <B57A220D1EE1644685BA9AD5C790D20526BE045E71@SOUTHSIDE.devonintlgroup.com>
MIME-Version: 1.0
In-Reply-To: <B57A220D1EE1644685BA9AD5C790D20526BE045E71@SOUTHSIDE.devonintlgroup.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: MACHINE_KERNEL_PR vs recipe PR
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
X-List-Received-Date: Thu, 31 Jan 2013 12:05:37 -0000
X-Groupsio-MsgNum: 42933
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gatW/ieO32f1wygP"
Content-Disposition: inline

--gatW/ieO32f1wygP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 31, 2013 at 06:20:25AM -0500, Ian Geiser wrote:
> I am curious about the machine_kerne_pr class.  What is the advantage/dif=
ference between using MACHINE_KERNEL_PR to change the kernel recipe revisio=
n vs using PR in the recipe?  Shouldn't anything that DEPENDS on virtual/ke=
rnel get rebuilt if PR changes in the kernel recipe?  From what I can tell =
all it does anyway is set the PR value of whatever inherits it to MACHINE_K=
ERNEL_PR. Or is there a use for this beyond just making sure a package gets=
 rebuilt?

OEBasicHash was only rebuilding external modules, but that does not
upgrade them on target device.=20

Now with PR service it's not so important, but still useful because it's
more reliable.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--gatW/ieO32f1wygP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEKWl0ACgkQN1Ujt2V2gBzKNQCeIbAbVvmutxBK+pTD0XPPF6Pq
lfsAniZvhghJHGDWRswC4PKh3pNbnLyU
=LVX7
-----END PGP SIGNATURE-----

--gatW/ieO32f1wygP--
