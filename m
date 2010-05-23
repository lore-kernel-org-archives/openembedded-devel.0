Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OGCzS-0000vr-4g
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 May 2010 17:21:41 +0200
Received: by iwn2 with SMTP id 2so2521426iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 May 2010 08:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=V5P5nZ5SD026IQBsq6QFbjAFNmeSiAfqyS1nHf9CcJM=;
	b=DMLTZH/e6qJvwcz3DoxDqYFwuCR/b6uM3EEIBjriECyrH6bt5Z9pOPXN3aK9kMU388
	z9Kp4erhyIMG7LKDm4hfMIpQxBbN8i+ePxRG+rjmk4aq1Tqbyz0gMDveq+xm5Kj4VXTC
	F6wNUczk0Uf2L/VYQQkBrpwgRfKYDkipAnKKg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=MjYQhLx8GRCoBpVs8mLC6VrDru61o0jIF+IL3bjpGjVyogtppWWdHSF7dUjORE0heF
	3ywjCNFYClVwNbwkX2acRDsUz/H0nWAp6t89o3NpCN64jE9bAYbdVER5soX2UD0eFwxN
	RjsJRA0dVjG7eq0yajzGv1YWXODeqFGto7o0Y=
MIME-Version: 1.0
Received: by 10.231.120.210 with SMTP id e18mr3058227ibr.84.1274627838367; 
	Sun, 23 May 2010 08:17:18 -0700 (PDT)
Received: by 10.231.30.67 with HTTP; Sun, 23 May 2010 08:17:18 -0700 (PDT)
In-Reply-To: <htas5g$q1h$1@dough.gmane.org>
References: <4BF69D04.5060506@mlbassoc.com> <htas5g$q1h$1@dough.gmane.org>
Date: Sun, 23 May 2010 08:17:18 -0700
Message-ID: <AANLkTikD-rYl148gtkJZB859Q-hOdV0AXYxuyBdpodpY@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: staging problem
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
X-List-Received-Date: Sun, 23 May 2010 15:21:41 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sun, May 23, 2010 at 2:22 AM, Koen Kooi <k.kooi@student.utwente.nl> wrot=
e:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 21-05-10 16:47, Gary Thomas wrote:
>> Trying a clean build
>> =A0 MACHINE=3D"beagleboard"
>> =A0 DISTRO=3D"angstrom-2008.1"
>> =A0 org.openembedded.dev 2c153f33b8ebb807a622ad9ae92ed5341a356740
>>
>> I get failures like this (in many packages):
>
> I pushed a fix:
>
> http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D104b91c47=
1125482eb83893425fb031557e892b4
>
> That seems to solve the duplicate header problem for me and tk still
> builds. As the commit says, do a 'bitbake glibc' afterwards to have
> packaged-staging restore the headers.

hmm. Its deleting the libc header file isn't it. why cant they co-exist.?

Thx
-Khem

>
> regards,
>
> Koen
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFL+PPwMkyGM64RGpERApRkAJ9Ser46FAnSzOZOuESxKKmN2cxSogCgsNBc
> o5FZLIykJwVkhqkgXoGQLl0=3D
> =3DOznZ
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


