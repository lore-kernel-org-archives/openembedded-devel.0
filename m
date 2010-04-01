Received: from ns0.zlo.nu ([85.17.141.90] helo=mzh.zlo.nu)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcolz@zlo.nu>) id 1NxIbV-0004M2-QD
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Apr 2010 13:30:30 +0200
Received: by mzh.zlo.nu (Postfix, from userid 1000)
	id 98CC5140B0; Thu,  1 Apr 2010 13:27:13 +0200 (CEST)
Date: Thu, 1 Apr 2010 13:27:13 +0200
From: Marc Olzheim <zlo@zlo.nu>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100401112713.GA1223@zlo.nu>
References: <1269437120-21774-1-git-send-email-zlo@zlo.nu>
MIME-Version: 1.0
In-Reply-To: <1269437120-21774-1-git-send-email-zlo@zlo.nu>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 85.17.141.90
X-SA-Exim-Mail-From: marcolz@zlo.nu
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] package.bbclass: Make sure that when "file" fails, a forced strip will still strip.
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
X-List-Received-Date: Thu, 01 Apr 2010 11:30:30 -0000
X-Groupsio-MsgNum: 18327
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="J2SCkAp4GZ/dPZZf"
Content-Disposition: inline

--J2SCkAp4GZ/dPZZf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Of course this only matters when something else is wrong, but the
existing code that tries to check the output of a failed "file" command
is even more wrong. ;-)

Marc

--J2SCkAp4GZ/dPZZf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAku0gxEACgkQezjnobFOgrFRwACfflD/y7BxvvMjeQpfW2LCu85d
uAcAnj6SMULLsOzMkXj2v+1CowHb9+Eg
=dM5U
-----END PGP SIGNATURE-----

--J2SCkAp4GZ/dPZZf--
