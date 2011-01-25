Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Phk32-0006Sz-Ex
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 Jan 2011 15:39:08 +0100
Received: by bwz10 with SMTP id 10so381202bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jan 2011 06:38:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=WQUhcHkrQZk6gcJES4qaOFEE+R09SFXxIrWFVHJ/IWM=;
	b=Bv/8izD4LFLrpDGKo0BV2Iq288sZzhxr/ABjV82l7+PPL3the32V2nIqBOMMoZjPxn
	3kGGpLDpAYye4WTRoDsocTtFjqYq0yqTrzUFFdfrxLtTiw50xofDIP06DD9q5wLwqPV7
	nPwKZ9pta06NFoX64wZt8Qkjjt5DUxbc3NRWw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=r1EB/KJV+T4zq34sQKSQP4CJbG+9dNsA/pCA4Q47PBIW5+gHaM+uTGdJHoEwhlxzwF
	ll90q7EVi3lVjNCsI4hMdYhiuoekzL/DgAMIdh//PnDCH9tHhJPpgsidpQgRFxNyXy+f
	wnuu5WkxIACQAg6aiUQTwTDnTNAzvt+UuDIYc=
Received: by 10.204.64.139 with SMTP id e11mr5112634bki.97.1295966304090;
	Tue, 25 Jan 2011 06:38:24 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id b6sm6875178bkb.22.2011.01.25.06.38.15
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 25 Jan 2011 06:38:19 -0800 (PST)
Date: Tue, 25 Jan 2011 15:38:27 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110125143827.GF3616@jama>
References: <1295464913-2642-1-git-send-email-koen@openembedded.org>
	<4D373CFC.8010400@balister.org> <ihmjum$vdq$2@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <ihmjum$vdq$2@dough.gmane.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] insane bbclass: extend RPATH check to cover sysroots as well
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
X-List-Received-Date: Tue, 25 Jan 2011 14:39:08 -0000
X-Groupsio-MsgNum: 28419
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Y/WcH0a6A93yCHGr"
Content-Disposition: inline

--Y/WcH0a6A93yCHGr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 25, 2011 at 02:41:42PM +0100, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> On 20-01-11 08:10, Koen Kooi wrote:
> > On 19-01-11 20:35, Philip Balister wrote:
> >> On 01/19/2011 11:21 AM, Koen Kooi wrote:
> >>> * Having rpath to sysroot is just as bad as one to workdir
> >=20
> >> When you do a build with this, how many recipes have issues?
> >=20
> > Console-image is clean now :)
>=20
> And angstrom-gnome-image as well, so can I get some Acks or tested-bys
> please?

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

Regards,

--Y/WcH0a6A93yCHGr
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk0+4GIACgkQN1Ujt2V2gBw3aQCbBgLxXNnTvI8TUfSYoie0FnI5
oWQAniQPrGZVgxZDmSYj29eM+lgc2Q9p
=HQ+f
-----END PGP SIGNATURE-----

--Y/WcH0a6A93yCHGr--
