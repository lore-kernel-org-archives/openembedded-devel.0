Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QIE3O-0004K1-RM
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 May 2011 07:58:19 +0200
Received: by pzk36 with SMTP id 36so1344529pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 May 2011 22:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:references:in-reply-to:mime-version
	:content-transfer-encoding:content-type:message-id:cc:x-mailer:from
	:subject:date:to;
	bh=ARrK3jBbtvaXYicluK0u8eW9mwvkKiMilzGz1VtKB6w=;
	b=iUyAhzHjbsZoR0QmOCHV90pv5IrRImLqtKBL+GxOBR8r2WPkfVrL++HjH042FarkOP
	2kaPEar1z1rONXsldr6Lt37jLMI5IzYydUBApEI/Hsd+C1wixzlT86uvuVdQhha5BKVR
	yn6qcwuBpQ5qLTXK6CJhvyXEDt+tb6qXiK30M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=references:in-reply-to:mime-version:content-transfer-encoding
	:content-type:message-id:cc:x-mailer:from:subject:date:to;
	b=PWFmk2ay/SDrvSgw0Hvgv2dO0zIxlblOWB+ni0IasTucNHd+3ANMxKsnzgB5BP8vn3
	ShK36ZvMKF6igCbMcslVIvE3X6kTZ0t7e2VHaa2phPUhDFvoJkdrU7+N9SOjBJPb3aQ1
	pPyJWmmbnAkyw6Qa2p5d/CWB8yX6MgGHIgG2c=
Received: by 10.68.52.202 with SMTP id v10mr4599307pbo.7.1304661335848;
	Thu, 05 May 2011 22:55:35 -0700 (PDT)
Received: from [192.168.1.81] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id f5sm1554891pbt.92.2011.05.05.22.55.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 05 May 2011 22:55:34 -0700 (PDT)
References: <1304653677-2982-1-git-send-email-raj.khem@gmail.com>
	<iq01ip$n8v$1@dough.gmane.org>
In-Reply-To: <iq01ip$n8v$1@dough.gmane.org>
Mime-Version: 1.0 (iPad Mail 8H7)
Message-Id: <24D4CC37-BBEC-4725-9EB4-007831040D17@gmail.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Mailer: iPad Mail (8H7)
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 5 May 2011 22:55:35 -0700
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] conf/layer.conf: Use .= for BBPATH and += for BBFILES
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
X-List-Received-Date: Fri, 06 May 2011 05:58:19 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



-Khem

On May 5, 2011, at 10:39 PM, Koen Kooi <koen@dominion.thruhere.net> wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> On 06-05-11 05:47, raj.khem@gmail.com wrote:
>> From: Khem Raj <raj.khem@gmail.com>
>=20
>=20
>> # We have a conf and classes directory, prepend to BBPATH to prefer our v=
ersions
>> -BBPATH :=3D "${LAYERDIR}:${BBPATH}"
>> +BBPATH .=3D ":${LAYERDIR}"
>=20
> I haven't had my morning coffee yet, but that either doesn't prepend
> LAYERDIR to BBPATH or the colons are in the wrong place.
>=20

Hmm I have sent similar patch for oe-core, git am that too and for other lay=
ers as well
Now bit bake should arrange BBPATH per priority
>=20
> regards,
>=20
> Koen
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>=20
> iD8DBQFNw4mZMkyGM64RGpERAsNyAJ9UJ4GJ6blWQaYpCRO6s2v9N55jDQCdHeoR
> gGUq5MZHntHS6d42OzHwjCM=3D
> =3DG4SQ
> -----END PGP SIGNATURE-----
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


