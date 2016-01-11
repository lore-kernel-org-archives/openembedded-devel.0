Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id 43293731D3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jan 2016 18:11:44 +0000 (UTC)
Received: by mail-pa0-f45.google.com with SMTP id uo6so308049038pac.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jan 2016 10:11:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=Y5zghucyPJfALSHNw6pn5ediRl7AT3Oj6XvWBfxqwxQ=;
	b=yA9MkTmZ9OcRThkaEtbYVdHBJ//4VQa7FElGebC/KRmJwrZegddEkVDA8Hl/O0wexs
	4b/SUjm1NEbyUTRhwZHdC+kPT76FpdeOvlQH28K5faNWAQww1oGedvPVdEbDAisu/Fgf
	7rDK1y9AYB2SR+frrmgZFCs7hEaARaJVhmZQ1PtY+B9tTzFq/c3kHcWlrEpKF/duSQoK
	8BM1pOzJGnRSHXpJunwKob9Id2bAfwcw6M8sjebesR7q6bf8AQwVrnyRLcAVt4Ok3SQV
	AWHf4CcnVugQjdsJeN6Ly2SGtYfyQrVtnRxHhzBmMQT7erSbjZdnqahAnMKF6Mt+U+NO
	b8Bw==
X-Received: by 10.66.100.228 with SMTP id fb4mr179281999pab.84.1452535905739; 
	Mon, 11 Jan 2016 10:11:45 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:d5b:ee56:59f:5eeb?
	([2601:646:8802:5d5c:d5b:ee56:59f:5eeb])
	by smtp.gmail.com with ESMTPSA id
	p70sm24800284pfi.96.2016.01.11.10.11.44
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 11 Jan 2016 10:11:45 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <5693EF1C.5090500@topic.nl>
Date: Mon, 11 Jan 2016 10:11:39 -0800
Message-Id: <B0874E89-F998-4786-B284-E02D7A86A9B4@gmail.com>
References: <1452534832-3203-1-git-send-email-mike.looijmans@topic.nl>
	<1D770D53-86F4-45AA-9515-0A2F9538575F@gmail.com>
	<5693EF1C.5090500@topic.nl>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.3112)
Subject: Re: [meta-networking][PATCH] recipes-connectivity/samba: Only rmdir directories that exist
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
X-List-Received-Date: Mon, 11 Jan 2016 18:11:45 -0000
X-Groupsio-MsgNum: 59465
Content-Type: multipart/signed;
	boundary="Apple-Mail=_57710312-DE34-4987-B509-0C9E5780332A";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_57710312-DE34-4987-B509-0C9E5780332A
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=windows-1252


> On Jan 11, 2016, at 10:06 AM, Mike Looijmans <mike.looijmans@topic.nl> =
wrote:
>=20
> On 11-01-16 19:00, Khem Raj wrote:
>>=20
>>> On Jan 11, 2016, at 9:53 AM, Mike Looijmans =
<mike.looijmans@topic.nl> wrote:
>>>=20
>>> Depending on PACKAGECONFIG selection, the /run/samba directory may =
not
>>> have been created. Make the do_install_append handle both situations
>>> by checking whether these directories exist before attempting to =
remove
>>> them.
>>>=20
>>> This fixes do_install failing with an error like this:
>>> rmdir: failed to remove '/.../samba/4.1.12-r0/image/run/samba': No =
such file or directory
>>>=20
>>> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
>>> ---
>>> meta-networking/recipes-connectivity/samba/samba_4.1.12.bb | 8 =
++++++--
>>> 1 file changed, 6 insertions(+), 2 deletions(-)
>>>=20
>>> diff --git =
a/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb =
b/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb
>>> index a51d31f..8e89e49 100644
>>> --- a/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb
>>> +++ b/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb
>>> @@ -104,8 +104,12 @@ EXTRA_OECONF +=3D "--enable-fhs \
>>> LDFLAGS +=3D "-Wl,-z,relro,-z,now"
>>>=20
>>> do_install_append() {
>>> -    rmdir --ignore-fail-on-non-empty "${D}/run/samba"
>>> -    rmdir --ignore-fail-on-non-empty "${D}/run"
>>> +    if [ -d "${D}/run" ]; then
>>> +        if [ -d "${D}/run/samba" ]; then
>>> +            rmdir --ignore-fail-on-non-empty "${D}/run/samba"
>>> +        fi
>>> +        rmdir --ignore-fail-on-non-empty "${D}/run"
>>> +    fi
>>=20
>> why don=92t we delete /run completely ? it won=92t work if package =
contents are in there anyway
>>=20
>=20
> That's what I do in a bbappend, just "rm -rf ${D}/run" (and also =
replace the non-functional startup script, but that's distro specific), =
but I thought that it might serve some purpose for the one who wrote the =
recipe.
>=20
> /run is usually volatile, so putting files in there is pointless, =
right?

yes although, you should add code to generate those files during =
post_inst

> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_57710312-DE34-4987-B509-0C9E5780332A
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlaT8F8ACgkQuwUzVZGdMxSjIgCgiCETyDy4bVbFYh6PdT/qMZyk
lDsAnjljb84eayV38mgE99YBrjxEBorh
=J2Vd
-----END PGP SIGNATURE-----

--Apple-Mail=_57710312-DE34-4987-B509-0C9E5780332A--
