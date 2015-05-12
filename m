Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id 00A8A73D16
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 May 2015 16:51:02 +0000 (UTC)
Received: by pabsx10 with SMTP id sx10so18823940pab.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 May 2015 09:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=ERydG8i3ht4xNqgsYhsjKs8AvSBf48791LP5JTJ9CEg=;
	b=GYhZolR7H2VLq2j9bfzeVV43nWzsCxH2fDttjnLtGqBniZuuub4fozZlLvBkz263TO
	Alt5iKrcCK6AhfUv/Vm3nDxYqtzEeuE8j7ESqkQgrnGpfaGaalXX3FGzSChY0y0ywcgk
	1Rm5g00Ac30kA5b6Y3CQsHtKOhqC5KHTg1Am+MGzflBdxA+bd+Tb35gvTDwAFKm36HdQ
	WTwnop2w/ynC9FbJUddz4Fei4dCp8hT1btPcd9og/TBaxBlrQ6W2stHS/+P60rOFFpuS
	Ho1WW34jkZwzNpNytYMdNNLmSgq5/9gpcDfu/5Bo9di6lgzR6T2MWChjgxGUaX5jH6Ct
	xNEw==
X-Received: by 10.70.124.233 with SMTP id ml9mr29860807pdb.9.1431449463298;
	Tue, 12 May 2015 09:51:03 -0700 (PDT)
Received: from ?IPv6:2601:9:3580:84c:ccd0:4222:99ed:8bcf?
	([2601:9:3580:84c:ccd0:4222:99ed:8bcf])
	by mx.google.com with ESMTPSA id
	qa15sm16794895pab.12.2015.05.12.09.51.01
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 12 May 2015 09:51:02 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
X-Pgp-Agent: GPGMail 2.5b6
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <13256726.2GaiCtjn8S@peggleto-mobl.ger.corp.intel.com>
Date: Tue, 12 May 2015 09:50:57 -0700
Message-Id: <8EEF3904-3BF3-42E5-BF1D-D37CAFB5C324@gmail.com>
References: <1431070955-7100-1-git-send-email-yi.zhao@windriver.com>
	<2318833.dUhIBv86bq@peggleto-mobl.ger.corp.intel.com>
	<1DD47E4E-8968-44C6-BEEF-0A1704D9225A@gmail.com>
	<13256726.2GaiCtjn8S@peggleto-mobl.ger.corp.intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.2098)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 01/20] smstools: fix PN -> BPN for multilib
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 12 May 2015 16:51:03 -0000
X-Groupsio-MsgNum: 55472
Content-Type: multipart/signed;
	boundary="Apple-Mail=_A9BCF563-4EB5-43ED-9AFB-ED0A223398DE";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_A9BCF563-4EB5-43ED-9AFB-ED0A223398DE
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On May 12, 2015, at 9:15 AM, Paul Eggleton =
<paul.eggleton@linux.intel.com> wrote:
>=20
> On Tuesday 12 May 2015 09:09:13 Khem Raj wrote:
>>> On May 12, 2015, at 7:50 AM, Paul Eggleton =
<paul.eggleton@linux.intel.com>
>>> wrote:
>>>=20
>>> Ouch - if so that's news to me, and seems very much sub-optimal. It =
may
>>> explain why patches keep on going missing from time to time. =
Khem/Tom, can
>>> we switch to a local solution?
>>=20
>> we rely on google spam filter. Local solution would require higher
>> maintenance and spam you can never defeat on your own
>=20
> I'm not quite following - spam doesn't tend to be a problem on our =
mailing
> lists since you have to be subscribed to post. In any case patchwork =
only
> cares about messages that are patches or pull requests - anything else =
is
> ignored.
>=20

patchwork needs a mail agent delivering emails. its not listening on any =
mailing lists
automatically

> Cheers,
> Paul
>=20
> --
>=20
> Paul Eggleton
> Intel Open Source Technology Centre


--Apple-Mail=_A9BCF563-4EB5-43ED-9AFB-ED0A223398DE
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlVSL3QACgkQuwUzVZGdMxRJeQCgkQ9COvMOgrgHHBU9mSiZeCWI
jUIAn3i3f91ZcZXw2j/XIrSvchz0QdvH
=O4C3
-----END PGP SIGNATURE-----

--Apple-Mail=_A9BCF563-4EB5-43ED-9AFB-ED0A223398DE--
