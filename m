Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QUlt8-000419-Q4 for openembedded-devel@lists.openembedded.org;
	Thu, 09 Jun 2011 22:31:34 +0200
Received: from f053037162.adsl.alicedsl.de ([78.53.37.162]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QUlqo-0002Zt-Lo for openembedded-devel@lists.openembedded.org;
	Thu, 09 Jun 2011 20:29:11 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <840A81C1B782724A8EB52725BD519EFF02E876@MBX20.4emm.local>
References: <840A81C1B782724A8EB52725BD519EFF02E876@MBX20.4emm.local>
Date: Thu, 09 Jun 2011 22:28:15 +0200
Message-ID: <1307651295.4152.7.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [PATCH v2] initscripts: Modify 'populate-volatile.sh' to atomically update 'volatile.cache'
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
X-List-Received-Date: Thu, 09 Jun 2011 20:31:34 -0000
X-Groupsio-MsgNum: 32605
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-99bCiuPLREgjN4zES/1M"

--=-99bCiuPLREgjN4zES/1M
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear James,


Am Mittwoch, den 08.06.2011, 01:19 +0000 schrieb James Limbouris:
> > Date: Tue, 07 Jun 2011 12:13:14 +0200
> > From: Paul Menzel <paulepanter@users.sourceforge.net>

[=E2=80=A6]

> > Am Dienstag, den 07.06.2011, 17:35 +0800 schrieb James Limbouris:
> > > When power is lost before a new volatile.cache has been flushed to di=
sk,
> > > it can be corrupted, leaving the volatiles uncreated and causing soft=
ware
> > failure.
> >=20
> > So the device is still booting up although the power is lost? I am stil=
l
> > confused how this patch can fix this. I am sorry for my ignorance.

> The problem is that the volatile.cache script becomes corrupt.
> On my system it became empty after power loss. When the system
> reboots, it runs the empty script instead of recreating the volatiles, an=
d
> so some of the /var/xxx directories become broken symlinks. System softwa=
re
> then refuses to start up. If we make sure that it is never corrupted, the
> problem should go away.

thank you again for the clarification. I was confused not knowing how
`populate-volatile.sh` worked. It just checks for the existence of
`volatile.cache` and not the build file. I thought the build file would
be used then too.

I committed your patch [1]. Please update the state in the patch queue
[2].

One more question. Is `rm -rf volatile.cache` actually a noop since it
does not exist due to the prior check?


Thanks,

Paul


[1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D9a799fb=
3464b61df51f5e772c693cd76ad948f28
[2] http://openembedded.org/index.php/Patchwork

--=-99bCiuPLREgjN4zES/1M
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk3xLN8ACgkQPX1aK2wOHVgczACbBYdlhwlNpqqLV9FYxurU2t1n
TqYAmwZhIrLyj4SV5/vUswPtyEvW81r+
=0KVx
-----END PGP SIGNATURE-----

--=-99bCiuPLREgjN4zES/1M--
