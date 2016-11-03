Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 0EDD3719FA
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Nov 2016 19:17:10 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id y68so5629606pfb.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Nov 2016 12:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:subject:from:in-reply-to:date:message-id:references:to; 
	bh=O2oe9nVubFY5Ajz0S/VraWu6Mzjr2QbG27Fqe+zY3MY=;
	b=glItolxB97bseoAvKev6nXXmSgCS4sDSFPxWNiP18IXKqTnruPx8HWaKRhpS2bnpM0
	XMIPjQOmngx5nQKBKtug7AKEyNnyzUrFNb0Rxs6xiVNWaPhgGrQBVWPsW4TyPzzOHysr
	pwU0ea867Ra1r2K9qvoUGBbmW6AWQcpHxojqv+ibs3JsQ5Mxdx9AKlganSwnJOuSz15S
	4S0pnSlhWPUOPNPR+p6QoHp573oiCUh4jUQh9SbsmqfKcgaRS+uD/L4Au41zA2ZGFoJ1
	SbESvXVclwVILzchbmGS0G3o3/pq7J5lTDGBPdf3pUzEr9MDxXq6XagKQp9O/k1AMIny
	wOfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date
	:message-id:references:to;
	bh=O2oe9nVubFY5Ajz0S/VraWu6Mzjr2QbG27Fqe+zY3MY=;
	b=KvmNL4DiavLPmdNV/zYAjVl1t1+MlzSO8IEiDeYcyaZ3FfJDdos3MnltC7UjCnWtNL
	2diidb2os8KQZAmUg0MRGqSeq/MlhHPnFDu88JWj/Wr6lmPH5yD+fVJ5Xpynohh5SWiF
	tkBP385OE/8F3/VYI0giUyJxKcclXIykJPswkTKJYVCTbTW79zVD0oPVLRliFah1K4sH
	QP5Ylc3uPktifHnO8FJodN5FmafVzCjoTLB0JfkVHlydqkoPH3FFNlFsoQssguZOK+xp
	U5xVb25Jgohd0zTVnFarOM/FmRAoxNY4dUbpjhIYNSMk58F/TZq/BBpPqy6L2BLKzYYd
	mBiQ==
X-Gm-Message-State: ABUngvfbmRo6jPu15Fdipiw5YoJI8lXJOseeGl9GW1rW/UQchLs/AKkFo4Yd5a1knAP/4g==
X-Received: by 10.99.251.69 with SMTP id w5mr16169828pgj.108.1478200631822;
	Thu, 03 Nov 2016 12:17:11 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:a08a:c533:b969:820?
	([2601:646:8882:b8c:a08a:c533:b969:820])
	by smtp.gmail.com with ESMTPSA id
	z6sm14559042pay.31.2016.11.03.12.17.11
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 03 Nov 2016 12:17:11 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJTo0LZQQD8NGVYuO10ceBfvTW4hTiBbtHLwVcZNGjqZ+QMi8A@mail.gmail.com>
Date: Thu, 3 Nov 2016 12:17:10 -0700
Message-Id: <7852C550-ECFB-4223-8F96-C3E342FF019F@gmail.com>
References: <1735731.JWP8iUgCxd@elrond>
	<CAJTo0LZQQD8NGVYuO10ceBfvTW4hTiBbtHLwVcZNGjqZ+QMi8A@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.3124)
Subject: Re: [meta-oe] p7zip recipe broken with rm_work
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 03 Nov 2016 19:17:11 -0000
X-Groupsio-MsgNum: 63722
Content-Type: multipart/signed;
	boundary="Apple-Mail=_ADECB961-D646-4759-A0E8-E1F0F4DFBDEE";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_ADECB961-D646-4759-A0E8-E1F0F4DFBDEE
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Nov 3, 2016, at 7:41 AM, Burton, Ross <ross.burton@intel.com> =
wrote:
>=20
> On 3 November 2016 at 11:03, Jan-Simon M=C3=B6ller <dl9pf@gmx.de> =
wrote:
>=20
>>    # Create a shell script wrapper to execute next to 7z.so
>>    mv ${D}${bindir}/7z ${D}${bindir}/7z.bin
>>    echo "#! /bin/sh" > ${D}${bindir}/7z
>>    echo "exec ${D}${bindir}/7z.bin \"\$@\"" >> ${D}${bindir}/7z
>>    chmod 0755 ${D}${bindir}/7z
>> }
>>=20
>> This wrapper breaks with "rm_work". Shouldn't it use the sysroot ?
>>=20
>=20
> Yeah the script should just use ${bindir}, but why is there even a =
wrapper
> script?

While agreeing on converting the script into a patch, I fail to =
understand
how it it different then some of other install calls in the same =
function

>=20
> Ross
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_ADECB961-D646-4759-A0E8-E1F0F4DFBDEE
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlgbjTYACgkQuwUzVZGdMxTs1QCggalvpTtEVqQWdFOTXqiH/yXZ
384AoIyjy4Mwr57PhwrNaz2PSb4IViXL
=Vi5y
-----END PGP SIGNATURE-----

--Apple-Mail=_ADECB961-D646-4759-A0E8-E1F0F4DFBDEE--
