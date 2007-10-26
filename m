Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <k.kooi@student.utwente.nl>) id 1IlGxg-0002uf-NI
	for openembedded-devel@openembedded.org; Fri, 26 Oct 2007 06:38:23 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l9Q4UhUx027922 for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Oct 2007 06:30:46 +0200
Message-ID: <47216D7B.2060406@student.utwente.nl>
Date: Fri, 26 Oct 2007 06:30:51 +0200
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.6 (Macintosh/20070728)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
References: <E1Il7zj-0002lu-Uj@linuxtogo.org>
	<200710252144.30914.openembedded@haerwu.biz>
In-Reply-To: <200710252144.30914.openembedded@haerwu.biz>
X-Enigmail-Version: 0.95.4
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
X-MIME-Autoconverted: from 8bit to quoted-printable by smtp.utwente.nl id
	l9Q4UhUx027922
Subject: Re: [oe-commits] org.oe.dev linux.inc: build mkimage	unconditionally
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 26 Oct 2007 04:38:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Marcin Juszkiewicz schreef:
> Dnia czwartek, 25 pa=C5=BAdziernika 2007, koen commit napisa=C5=82:
>> linux.inc: build mkimage unconditionally
>> * see comment inside the file
>=20
>> Author: koen@openembedded.org
>> Branch: org.openembedded.dev
>> Revision: cc0f788a513b8c6fcf2e55f8c9e0fb35c6f5c016
>=20
>> packages/linux/linux.inc
>=20
>> @@ -47,7 +35,7 @@ do_configure_prepend() {
>>          #
>>          if [ "${TARGET_OS}" =3D "linux-gnueabi" -o  "${TARGET_OS}" =3D=
 "linux-uclibcgnueabi" ]; then=20
>>                  echo "CONFIG_AEABI=3Dy"  >> ${S}/.config=20
>> -                echo "CONFIG_OABI_COMPAT=3Dy"    >> ${S}/.config=20
>> +                echo "# CONFIG_OABI_COMPAT is not set"             >>=
 ${S}/.config else
>>                  echo "# CONFIG_AEABI is not set"        >> ${S}/.conf=
ig=20
>>                  echo "# CONFIG_OABI_COMPAT is not set"  >> ${S}/.conf=
ig=20
>=20
> Please revert this part - we want OABI support in EABI kernels.

Right, I'll fix that when I get back from work this evening.

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHIW17MkyGM64RGpERAl7IAKCqCDvhXfpJVrsD5J/T96SW4fpdnACdEpM1
uW6MxWwJmyL9M1aKGM5B9Uw=3D
=3DutWO
-----END PGP SIGNATURE-----


