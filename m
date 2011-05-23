Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QOVoZ-0008W4-GK
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 May 2011 16:08:59 +0200
Received: by fxm19 with SMTP id 19so4500943fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 May 2011 07:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=aMcAjKZT3KmEtk17tm1XSXyTNn0FlsUeRYa1EOjZk9o=;
	b=Pf4nkq6e310x7Uzb6Kd9cOZ3j2zB4huAAlFevOUn48LI7Xh0X6uraZ0KImcKE2nd7/
	mZe9+jiG0uVxNzGWMJ3WnEw7Yb1AQTTVWrgPNkkgJgw6r50O/69kYeGEeOQplpQf1WWs
	SGtpL8Bo++wf9IqUw5BGlNiT+YP+HAxhhsrkQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=vVsE2pEvy3vAfzY7GM4IRJqiuNvcNxLfgFZeje+sr0zMrT7pl5wr2pmurmjp6o3fH+
	7vM+gnDX4h0a6Fy+XRXkctCvndetEuXadLbgvsYWdz3F0rNcZqkOmxHtPSW/mpf2tiJC
	9wd/JbLMoxzsCeiclv9bka98D/sVd7er9L22Q=
Received: by 10.223.68.193 with SMTP id w1mr2514294fai.42.1306159559438;
	Mon, 23 May 2011 07:05:59 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id f14sm2363342fai.41.2011.05.23.07.05.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 23 May 2011 07:05:58 -0700 (PDT)
Date: Mon, 23 May 2011 16:05:50 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Peter Gsellmann <pgsellmann@portner-elektronik.at>
Message-ID: <20110523140549.GF3235@jama.jama.net>
References: <201105231555.38190.pgsellmann@portner-elektronik.at>
MIME-Version: 1.0
In-Reply-To: <201105231555.38190.pgsellmann@portner-elektronik.at>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Sorry, 4340f07345392b2c4c2017142cce40e407d219af
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
X-List-Received-Date: Mon, 23 May 2011 14:08:59 -0000
X-Groupsio-MsgNum: 32249
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6v9BRtpmy+umdQlo"
Content-Disposition: inline

--6v9BRtpmy+umdQlo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 23, 2011 at 03:55:37PM +0200, Peter Gsellmann wrote:
> Hi Martin!
>=20
> The above commit breaks my daily build.
> By reverting it, i can build again.
> Error occurs in recipe gnumail which obviously needs some 64bit javac
> Log is appended

In this whole *long* log I found only one line interesting:
| checking if /home/oe/build/tmp/sysroots/x86_64-linux/usr/bin/javac
works... configure: error: The Java compiler
/home/oe/build/tmp/sysroots/x86_64-linux/usr/bin/javac failed (see
config.log, check the CLASSPATH?)

but whithout this config.log I have no idea what could go wrong, maybe
java maintainers will enlighten us, but woglinde confirmed that cacao is
currently known to be broken and that openjdk is right replacement.

Try to clean all cacao related recipes and you will probably get the
same error as I did before 4340f07345392b2c4c2017142cce40e407d219af and
maybe it will succeed to build gnumail without cacao in sysroot and
proper build of openjdk... but this is all my crystal ball can show
without config.log..

Regards,

> <remaining 7835 lines of log stripped :)>

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--6v9BRtpmy+umdQlo
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk3aab0ACgkQN1Ujt2V2gBwPvACfX8WdJLUtoZNByJ6vW8qY46kI
7JUAn0ACTzvQGxx0Aw6W4Qg0K92fsO5C
=OdVv
-----END PGP SIGNATURE-----

--6v9BRtpmy+umdQlo--
