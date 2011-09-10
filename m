Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R2Iyx-0006e3-GJ
	for openembedded-devel@lists.openembedded.org;
	Sat, 10 Sep 2011 10:32:11 +0200
Received: by fxi1 with SMTP id 1so817059fxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 10 Sep 2011 01:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=xTc/Rras6SXmfHycjOvFCcq5fO2eUgHexD49vznLWYk=;
	b=xF97jigOSVqxLlgDpyeRrto7oY5bbN5n9zg0tfN05IQ00004DjfL2rQgepSzTqFV2N
	1G9UQzgqHZLSuf5T6B+c15iVTbnzYu7NqANwkJ8vEO/EQsGAC19eX6Ed9xioPFQ+8kS0
	3FwmkZ0nnNSMvEBx1Z7QVPKv6IPwpHYXoqz8E=
Received: by 10.223.34.143 with SMTP id l15mr914237fad.46.1315643225989;
	Sat, 10 Sep 2011 01:27:05 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id q23sm4098707fae.1.2011.09.10.01.27.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 10 Sep 2011 01:27:04 -0700 (PDT)
Date: Sat, 10 Sep 2011 10:26:58 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Message-ID: <20110910082657.GB5456@jama.jama.net>
References: <CAP9ODKr25u3yPbnAsS8Suc2wngTtJhDbn9egMXZZpUtLQqbZTg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKr25u3yPbnAsS8Suc2wngTtJhDbn9egMXZZpUtLQqbZTg@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe] X randr-support.patch breaks geode
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
X-List-Received-Date: Sat, 10 Sep 2011 08:32:11 -0000
X-Groupsio-MsgNum: 34184
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="QKdGvSO+nmPlgiQ/"
Content-Disposition: inline

--QKdGvSO+nmPlgiQ/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 09, 2011 at 05:45:51PM -0300, Otavio Salvador wrote:
> Hello,
>=20
> I've been trying to figure out what XRandR stopped to work when we
> updated our OpenEmbedded. After talking to Martin Jansa, on #oe, I
> could find that reverting 'randr-support.patch' from X fixes this
> issue.
>=20
> Basically, when we change the resolution it swaps the pointer axis.
> This is wrong, as you all can bet ;-P
>=20
> Do someone has any clue WHY this patch breaks it and if we can drop
> this from meta-oe repository? It seems to not be used on
> OpenEmbedded-Core so seems to be quite specific to something related
> from previous machine support. Maybe move it to the specific layer?

As I said on IRC, it's needed for xinput-calibrator to work properly.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--QKdGvSO+nmPlgiQ/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk5rH1EACgkQN1Ujt2V2gBwjPACeOLSZ7bnubHzZ2B7iupI1ylzs
YRIAnRY06cYol8uwttmzzRxQh0/rFGOi
=SK2F
-----END PGP SIGNATURE-----

--QKdGvSO+nmPlgiQ/--
