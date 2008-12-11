Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <theBohemian@gmx.net>) id 1LAgXf-0008La-UJ
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Dec 2008 09:05:04 +0100
Received: (qmail invoked by alias); 11 Dec 2008 08:00:57 -0000
Received: from unknown (EHLO [192.168.4.110]) [78.52.66.83]
	by mail.gmx.net (mp069) with SMTP; 11 Dec 2008 09:00:57 +0100
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX1+O/0xdrO6Oh4od4WlZeba6sSIYKZK+2qK9i0MKRS
	WlhAKDoLF/8h4W
Message-ID: <4940C8EB.7080107@gmx.net>
Date: Thu, 11 Dec 2008 09:01:47 +0100
From: Robert Schuster <theBohemian@gmx.net>
User-Agent: Mozilla-Thunderbird 2.0.0.17 (X11/20081018)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <C41AF57F04424526AD798F542197E674@aeglos><493D1A83.1070500@balister.org><48239d390812080508p7585f22bo529c8a5ebf2f438e@mail.gmail.com><8162086526F74198823FA0003D5FA08D@aeglos>	<48239d390812080709l2051390en9ec07e495eff560e@mail.gmail.com>
	<4B4AD5DB834948B0A7AC3D8B722645A6@aeglos>
In-Reply-To: <4B4AD5DB834948B0A7AC3D8B722645A6@aeglos>
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.67
Subject: Re: Request for a personal git tree for AT91/AVR32
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
X-List-Received-Date: Thu, 11 Dec 2008 08:05:04 -0000
X-Groupsio-MsgNum: 6970
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enig9C12B69B4E6EEF4C3728D409"

--------------enig9C12B69B4E6EEF4C3728D409
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Ulf,

somehow nobody cared to answer this :$
Ulf Samuelsson schrieb:
> Is the "personal" git tree really personal, or can you have
> a git tree which is available to a group?
We normally give r/w access to individuals. With write access you have
the possibility to create user branches. After you fixed/added/whatever
a certain feature you can propose your changes on the list and if its
fine it can be merged.

> It makes sense for me to have an "atmel" group which I
> could share with other interested atmel employees.
I think the closest you can get with git is that one person commits on
behalf of someone else, e.g. git commit --author <the other person>

Of course it would also be possible to give write access to more people.

> Who is making decisions on access?
The OE team. Someone proposes you and then the rest of OE informally
votes. If no one has strong objections which needs to be discussed
write access will be granted.

I will write that proposal for you. :)

Regards
Robert

>=20
> Best Regards
> Ulf Samuelsson
>=20
>=20
>>>
>>> I then made the linux recipy depend on the u-boot native tools,
>>> and then u-boot.git was selected and oe tried
>>> to do git access to www.angstrom-distribution.org or something simila=
r.
>>> I do not know why, and could not figure out why it did so.
>>>
>>> That is why I wrote the new recipy.
>>>
>>>> so I don't see real point in using versioned approach.
>>>
>>> If you want to add patches they may or may not be broken by a later g=
it
>>> version.
>>> It is more important to have something which has been tested and
>>> validated
>>> than the latest stuff.
>>>
>>> I agree that it would have been better to use the 2008.10 though.
>> Wel, look at u-boot_git.bb, it has tags fixed for some machines, and
>> apply patches too. I never had problems with it. That could save you
>> lots of time.
>> you can fix versions by providing git commit hashes in SRC_URI. Look
>> at mentioned
>> u-boot_git on how this is done.
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel=

>>
>=20
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>=20



--------------enig9C12B69B4E6EEF4C3728D409
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iEYEAREIAAYFAklAyO4ACgkQG9cfwmwwEtom+QCdFMjdpzF9QyQlXuRhXHsjYgkD
RAcAnRsuI/EqjtINsmRc/rBpISWm+Vn0
=ped0
-----END PGP SIGNATURE-----

--------------enig9C12B69B4E6EEF4C3728D409--
