Received: from [74.125.44.154] (helo=yx-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Lqwk9-0005Rc-EI
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Apr 2009 23:52:39 +0200
Received: by yx-out-1718.google.com with SMTP id 3so1643145yxi.42
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Apr 2009 14:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=Rfgt6o8vQmTq/3duF+NEIpuoIVYKG4Lh4twaVaKKspY=;
	b=pfh1H8NHEf5SE/Cup9tdg8HflPyoRDh5012QJTAkGnrsg0hDmaPMD1tFBcvEZPEcvO
	CAf27Pf6B+tcFmZ1BLJzM8Ru0syVI80FBY8J1BsAEem9bmmvXg811rt5f7SJMR15afmv
	gdh5PlmUO4twz//c9kFLEJcu9HObQ4bMvoatA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=pof7hgsSnwON+YCZY7OOxORWWpDTRo4EvL36k1+27jpLxtULxSdUCns4rZ4Tk8trg5
	gpdYwew747dO6BdS9uyN4UBdFNwGQMOMNKUHgD1qxrT3+Wzi8JS9Kc2SU4eYyTHqpL5J
	+o9GH6TBV/zOtD6sh2+RFVLwh35CiGctvZwq0=
MIME-Version: 1.0
Received: by 10.100.205.15 with SMTP id c15mr7325030ang.20.1239054584793; Mon, 
	06 Apr 2009 14:49:44 -0700 (PDT)
In-Reply-To: <49DA2F2C.60008@bolloretelecom.eu>
References: <49DA2F2C.60008@bolloretelecom.eu>
Date: Mon, 6 Apr 2009 14:49:44 -0700
Message-ID: <19c1b8a90904061449s1cc1c4e6pb1c04f2c71cc6beb@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.44.154
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=AWL,BAYES_00,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] make "LDFLAGS ignored" QA errors fatal
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
X-List-Received-Date: Mon, 06 Apr 2009 21:52:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 4/6/09, Jeremy Lain=C3=A9 <jeremy.laine@bolloretelecom.eu> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> I have spent quite some time cleaning up a bunch of recipes which were
> triggering "LDFLAGS ignored" QA errors, and I don't really want to
> have to do this again in the future. I suggest we stop whitelisting
> this kind of QA error, using the attached patch.
>
> To track down the faulty packages I have made use of oestats output
> (note that not all QA errors are "LDFLAGS ignored"):
>
> http://tinderbox.openembedded.net/packages/?qalog=3D1
>
> In most cases, the problem is that recipes simply pass
> - -L${STAGING_LIBDIR} as LDFLAGS instead of using the full ${LDFLAGS}
> variable. The result is that flags such as --hash-style=3Dgnu are
> getting ignored.

I think we should configure toolchain to pass this flags by gcc driver
while linking instead of making it a part of LDFLAGS it should help in
recipes which use gcc to link.

>
> What are your thoughts?
>
> - --
> Jeremy LAINE
> Bollor=C3=A9 telecom | 11bis, rue Scribe | F-75009 Paris
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.9 (GNU/Linux)
> Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org
>
> iEYEARECAAYFAknaLysACgkQCL1n3lVB9EZgbQCgoQpUwdae7elUHWag8wqAROY7
> D0sAmQGjH0zrO8OxgI5MPfSAshQz9Fuu
> =3Dto11
> -----END PGP SIGNATURE-----
>
>


