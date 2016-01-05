Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f169.google.com (mail-qk0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id 43D9B60796
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Jan 2016 21:05:25 +0000 (UTC)
Received: by mail-qk0-f169.google.com with SMTP id h11so4468774qke.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Jan 2016 13:05:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=mha7eXsF+N0uRHKU+U6Xwki53kylgv/B8HyA85ol+Vk=;
	b=FsfhVrngACVSwBQAKdlCQk2VypWKPxn09ITekLAHSlxr/CbC33gZlrzlmgQg3riXxI
	uUKFSnBJ6abkgDzFbkuOodcy438J62YjsOlP9BcYotC+X+WtBAq0evE0HJ+NuafPZmIY
	ZkZrG1/EhUTK1axnomoSjw9DsSJOu2Md2PxqjkVGJ2oi7EqnGIjHYtCCNSmyJDCx3uxf
	EtE85keLutbg5jaGsYLRtMPpSFZB80e2/XH16d+E0UJuCDrF2weBSHvjICwGodXIplM+
	rP/j6UAHfBTRz8nBE7RJMO/e5s+Lylp1XAInm3C5hNak7iWibGLtPxsXYHoTquIzi3Kh
	RqQw==
X-Received: by 10.55.79.207 with SMTP id d198mr121722070qkb.49.1452027925753; 
	Tue, 05 Jan 2016 13:05:25 -0800 (PST)
Received: from 10.25.253.215-ra01.westchester.pa.bo.comcast.net
	([68.87.42.115]) by smtp.gmail.com with ESMTPSA id
	v138sm43085307qka.6.2016.01.05.13.05.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 05 Jan 2016 13:05:24 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <145451D4E6785E4DA4DFA353A58CB7B2F7E4E724@OLAWPA-EXMB03.ad.garmin.com>
Date: Tue, 5 Jan 2016 13:05:19 -0800
Message-Id: <9EE300C1-F57A-461C-8B5C-011C6750DF64@gmail.com>
References: <1450954209-2353-1-git-send-email-nate.karstens@garmin.com>
	<CAMKF1sqp0gM9VgvE8M1-HAsAapDsNdNfs0S+AnaROfqFWXFYNg@mail.gmail.com>
	<145451D4E6785E4DA4DFA353A58CB7B2F7E4E724@OLAWPA-EXMB03.ad.garmin.com>
To: "Karstens, Nate" <Nate.Karstens@garmin.com>
X-Mailer: Apple Mail (2.3112)
Cc: "stephen.arnold@acm.org" <stephen.arnold@acm.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] dhcpcd: add recipe for dhcpcd
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
X-List-Received-Date: Tue, 05 Jan 2016 21:05:28 -0000
X-Groupsio-MsgNum: 59353
Content-Type: multipart/signed;
	boundary="Apple-Mail=_B3933ABE-A6B4-4E6E-95F9-899026D0100D";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_B3933ABE-A6B4-4E6E-95F9-899026D0100D
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Jan 5, 2016, at 5:37 AM, Karstens, Nate <Nate.Karstens@garmin.com> =
wrote:
>=20
> Sorry for the delay. I contacted the author and he pointed me to the =
following page:
>=20
> http://roy.marples.name/projects/dhcpcd/wiki?name=3Dhistory
>=20
> To summarize, this recipe is for a fork of the original project that =
has been entirely rewritten.
>=20
> Rather than removing the old recipe entirely, do you think it makes =
sense to move it to meta-networking and allow users to use =
PREFERRED_VERSION to choose which version of the program they want?
>=20
> I can submit a separate patch to move or delete the old recipe, =
depending on your preference. Do you want that done before proceeding =
with this patch?


having a single recipe is preferred. If Steve can confirm that what your =
recipe is doing is sufficient for his usecase then we should go with =
deletion
and moving this into meta-networking.

>=20
> Nate
>=20
> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org =
[mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of =
Khem Raj
> Sent: Thursday, December 24, 2015 12:43 PM
> To: openembeded-devel <openembedded-devel@lists.openembedded.org>
> Subject: Re: [oe] [meta-oe][PATCH] dhcpcd: add recipe for dhcpcd
>=20
> On Thu, Dec 24, 2015 at 2:50 AM, Nate Karstens =
<nate.karstens@garmin.com> wrote:
>> Adds a new recipe for dhcpcd. Modifies the configure script to keep
>> the host system header files from being used instead of the target =
system.
>>=20
>=20
> Can you also see how you differ with
> =
https://github.com/sarnold/meta-alt-desktop-extras/blob/master/recipes-con=
nectivity/dhcpcd/dhcpcd_1.3.22-pl4.bb
>=20
> and I would prefer you to send a removal patch to above layer and let =
it use it from meta-networking.
>=20
>> Signed-off-by: Nate Karstens <nate.karstens@garmin.com>
>> ---
>> .../dhcpcd/dhcpcd-6.9.4/configure.patch               | 12 =
++++++++++++
>> .../recipes-connectivity/dhcpcd/dhcpcd_6.9.4.bb       | 19 =
+++++++++++++++++++
>> 2 files changed, 31 insertions(+)
>> create mode 100644
>> =
meta-networking/recipes-connectivity/dhcpcd/dhcpcd-6.9.4/configure.pat
>> ch  create mode 100644
>> meta-networking/recipes-connectivity/dhcpcd/dhcpcd_6.9.4.bb
>>=20
>> diff --git
>> =
a/meta-networking/recipes-connectivity/dhcpcd/dhcpcd-6.9.4/configure.p
>> atch
>> =
b/meta-networking/recipes-connectivity/dhcpcd/dhcpcd-6.9.4/configure.p
>> atch
>> new file mode 100644
>> index 0000000..d61b05e
>> --- /dev/null
>> +++ =
b/meta-networking/recipes-connectivity/dhcpcd/dhcpcd-6.9.4/configu
>> +++ re.patch
>> @@ -0,0 +1,12 @@
>> +--- ./configure
>> ++++ ./configure
>> +@@ -316,9 +316,6 @@
>> + if [ "$STATIC" =3D yes ]; then
>> +       echo "LDFLAGS+=3D -static" >>$CONFIG_MK  fi -for x in
>> +$INCLUDEDIR; do
>> +-      echo "CPPFLAGS+=3D        -I$x" >>$CONFIG_MK
>> +-done
>> +
>> + if [ -z "$DEBUG" -a -f .fslckout ]; then
>> +       printf "Found fossil checkout ... "
>> diff --git
>> a/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_6.9.4.bb
>> b/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_6.9.4.bb
>> new file mode 100644
>> index 0000000..1c0aff4
>> --- /dev/null
>> +++ b/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_6.9.4.bb
>> @@ -0,0 +1,19 @@
>> +SECTION =3D "console/network"
>> +SUMMARY =3D "dhcpcd - a DHCP client"
>> +DESCRIPTION =3D "dhcpcd runs on your machine and silently configures =
your computer to work on the attached networks without trouble and =
mostly without configuration."
>> +
>> +HOMEPAGE =3D "http://roy.marples.name/projects/dhcpcd/"
>> +
>> +LICENSE =3D "BSD-2-Clause"
>> +LIC_FILES_CHKSUM =3D =
"file://dhcpcd.c;endline=3D26;md5=3D7daf225c91b8065ecc974fc594b2a7de"
>> +
>> +SRC_URI =3D =
"http://roy.marples.name/downloads/${BPN}/${BPN}-${PV}.tar.xz \
>> +           file://configure.patch"
>> +
>> +SRC_URI[md5sum] =3D "02f5043a415cd4b6d089631a0cd95f5b"
>> +SRC_URI[sha256sum] =3D =
"c3f3ff7473ef158a1e71db9aea7424df2c3477ad064e2b542f27948a5abc9ba0"
>> +
>> +inherit autotools
>> +
>> +B =3D "${S}"
>> +EXTRA_OECONF =3D "--enable-ipv4 --enable-ipv6"
>> --
>> 1.9.1
>>=20
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
> ________________________________
>=20
> CONFIDENTIALITY NOTICE: This email and any attachments are for the =
sole use of the intended recipient(s) and contain information that may =
be confidential and/or legally privileged. If you have received this =
email in error, please notify the sender by reply email and delete the =
message. Any disclosure, copying, distribution or use of this =
communication (including attachments) by someone other than the intended =
recipient is prohibited. Thank you.


--Apple-Mail=_B3933ABE-A6B4-4E6E-95F9-899026D0100D
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlaMMBQACgkQuwUzVZGdMxRrigCbBuogSkJknTOSqXwsAI8lCJuh
GlQAniYSAXJgZ4FQZOFw+PaGJkawNDiv
=AVI6
-----END PGP SIGNATURE-----

--Apple-Mail=_B3933ABE-A6B4-4E6E-95F9-899026D0100D--
