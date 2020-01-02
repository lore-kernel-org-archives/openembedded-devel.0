Return-Path: <rehsack@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id CEDAB7F9A7
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Jan 2020 21:27:35 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id c14so40615091wrn.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Jan 2020 13:27:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:message-id:mime-version:subject:date:in-reply-to:cc:to
	:references; bh=g0hZB+nXi2mL5fYSruPAxGNe2de7bnsBIO5cwWs+6GY=;
	b=Q6ifLNodLw7W5zpEdI63XdCLltTn0RE/ccMDEZqZjwyddWNBRnR8mX2tCySz4x8GT4
	Rlfrj8OqXHH35O8uxVLwXbBToS4DbuJ5kRUdiNtvqag52UntkV9CbbCAtLcBQXFoCbqE
	6mpXB/lSFkQPCBLnGzVYdhTZNA6+ilQqOzZBg7KQLQ7sExlajv7bbKt//rYS0+VEYfOj
	rzTPKvTtaHKdLKi+zpRO4vgHSJ22NaoOYOCLtB0TYEtkSAqzb1JFnxsBc+yBPY4XQR0N
	VNPtfNfAiLgcUplk/VIh0k1rVovXre2HlBb6wx59/EMIzXJGhpr/FcSZWR7Kd/K69riU
	jIyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:message-id:mime-version:subject:date
	:in-reply-to:cc:to:references;
	bh=g0hZB+nXi2mL5fYSruPAxGNe2de7bnsBIO5cwWs+6GY=;
	b=qJBZ8e/GLg3UqqElC0OT3/uixyxNBuzhHX5CMMVTJ2SiOsB5tpYSn2jLSUQO71zcQ6
	PebcZJrnUVxCusHdrlaMVa8jNKTVadvs9q41g0iCvP01R1Ww8EgmdL8BTT/fqYoioCt0
	ysJId/MSHhcKAc98PAhhaPmMJemCM6G1eJs7iB1O6cQV2G36ZUj1SB4Z6+vKSO9sf+m2
	oDJ+NRt339hT2eZeNuTY7JlmDH3ppkWnO58S71h0Dyoo5H49dIhLFkDke+VtPvM5hyNa
	LnM824o3KfRtO7FBI0qj29XRgMyIe4EIml1N9ZyoZPDIHVf9DVh5WvoJI5xqzAuErXVW
	5YZg==
X-Gm-Message-State: APjAAAX3InHrbI0hMGpoXXlS6D7dIhAv+xMQaXXBYCWZZfXKbcVcpfcC
	LY7+Ff0z1LqT7rCUAKErwZk=
X-Google-Smtp-Source: APXvYqw6e04fqQWHhLkJ7g+ysR8/zuYQP7Rsu0NrRpSB+ZwS1axsY+G4duVukcV+vN7dwfNLEo3UVA==
X-Received: by 2002:a5d:458d:: with SMTP id p13mr37200790wrq.314.1578000456695;
	Thu, 02 Jan 2020 13:27:36 -0800 (PST)
Received: from ernie.muppets.liwing.de (p5B25B970.dip0.t-ipconnect.de.
	[91.37.185.112]) by smtp.gmail.com with ESMTPSA id
	w13sm58079950wru.38.2020.01.02.13.27.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 02 Jan 2020 13:27:35 -0800 (PST)
Sender: Jens Rehsack <rehsack@gmail.com>
From: Jens Rehsack <sno@netbsd.org>
Message-Id: <867024C9-4645-4B2F-86C4-75E250A894E7@netbsd.org>
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.40.2.2.4\))
Date: Thu, 2 Jan 2020 22:27:34 +0100
In-Reply-To: <CAMKF1srjDzrfhWgdnV2i0M=xxFFjKxbjgeFxrGu3r4pFB+F94A@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
References: <20200102133915.1516-1-sno@netbsd.org>
	<CAMKF1srjDzrfhWgdnV2i0M=xxFFjKxbjgeFxrGu3r4pFB+F94A@mail.gmail.com>
X-Mailer: Apple Mail (2.3608.40.2.2.4)
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-perl][PATCH] libunix-statgrab: add recipe
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
X-List-Received-Date: Thu, 02 Jan 2020 21:27:37 -0000
X-Groupsio-MsgNum: 81876
Content-Type: multipart/signed;
	boundary="Apple-Mail=_0EDF4A45-2CB5-4ABA-AC1F-AFA5F63E1251";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_0EDF4A45-2CB5-4ABA-AC1F-AFA5F63E1251
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



> Am 02.01.2020 um 19:30 schrieb Khem Raj <raj.khem@gmail.com>:
>=20
> This seems to fail
> https://errors.yoctoproject.org/Errors/Details/301385/
> https://errors.yoctoproject.org/Errors/Details/301387/

Weird. pkg_config_prog should be provided by

DEPENDS +=3D "libconfig-autoconf-perl-native"

Can you find the "config.log" of one of those builds?
Maybe pkg-config itself is missing and I have to add this dependency =
somehow ...

> On Thu, Jan 2, 2020 at 5:39 AM Jens Rehsack <sno@netbsd.org> wrote:
>>=20
>> Add recipe for Unix::Statgrab perl module, a sane language binding =
for
>> libstatgrab.
>>=20
>> Signed-off-by: Jens Rehsack <sno@netbsd.org>
>> ---
>> .../libstatgrab/libunix-statgrab_0.112.bb     | 38 =
+++++++++++++++++++
>> 1 file changed, 38 insertions(+)
>> create mode 100644 =
meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb
>>=20
>> diff --git =
a/meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb =
b/meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb
>> new file mode 100644
>> index 000000000..7402eb879
>> --- /dev/null
>> +++ b/meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb
>> @@ -0,0 +1,38 @@
>> +SUMMARY =3D "Perl interface to the libstatgrab library"
>> +DESCRIPTION =3D "Unix::Statgrab is a wrapper for libstatgrab as =
available from \
>> +<http://www.i-scream.org/libstatgrab/>. It is a reasonably portable =
attempt \
>> +to query interesting stats about your computer. It covers =
information on \
>> +the operating system, CPU, memory usage, network interfaces, =
hard-disks \
>> +etc."
>> +
>> +HOMEPAGE =3D "https://metacpan.org/release/Unix-Statgrab"
>> +SECTION =3D "libs"
>> +LICENSE =3D "Artistic-1.0 | GPL-1.0+ | LGPL-2.1+"
>> +DEPENDS +=3D "libcapture-tiny-perl-native"
>> +DEPENDS +=3D "libconfig-autoconf-perl-native"
>> +DEPENDS +=3D "libstatgrab"
>> +RDEPENDS_${PN} +=3D "\
>> +    libstatgrab \
>> +    perl-module-autoloader \
>> +    perl-module-carp \
>> +    perl-module-dynaloader \
>> +    perl-module-exporter \
>> +    perl-module-strict \
>> +    perl-module-vars \
>> +    perl-module-warnings \
>> +"
>> +
>> +SRC_URI =3D =
"${CPAN_MIRROR}/authors/id/R/RE/REHSACK/Unix-Statgrab-${PV}.tar.gz"
>> +LIC_FILES_CHKSUM =3D =
"file://${COMMON_LICENSE_DIR}/Artistic-1.0;md5=3Dcda03bbdc3c1951996392b872=
397b798 \
>> +    =
file://${COMMON_LICENSE_DIR}/GPL-1.0;md5=3De9e36a9de734199567a4d769498f743=
d \
>> +    =
file://${COMMON_LICENSE_DIR}/LGPL-2.1;md5=3D1a6d268fd218675ffea8be556788b7=
80 \
>> +"
>> +
>> +SRC_URI[md5sum] =3D "a6bc06b3f7749f7d77a2b1bd13402821"
>> +SRC_URI[sha256sum] =3D =
"16a29f7acaeec081bf0e7303ba5ee24fda1d21a1104669b837745f3ea61d6afa"
>> +
>> +S =3D "${WORKDIR}/Unix-Statgrab-${PV}"
>> +
>> +inherit cpan ptest-perl
>> +
>> +BBCLASSEXTEND =3D "native"
>> --
>> 2.17.1
>>=20
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_0EDF4A45-2CB5-4ABA-AC1F-AFA5F63E1251
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEGutaqWUYV+tvC/mCRJmWrtzlCp0FAl4OYEYACgkQRJmWrtzl
Cp2a0g/6AzjozyK4MQoS6LWjEMcCRjvM6f9OKiZzdtlvxdK3eMgRR5dqU+t4gB5h
ptPl5BVLr0hrH1IdbV3Vm8fVmmGC2FL3SzuREo0s1kZLSTF0hAXbIxkwrv4mNOuB
XrJmp1YiYeesgZAP789Y7KqFDxIKyUQAED55ZwLME2kNEEHAuiteFgcybWgvOh2o
F7Xxupis1n3ftuaQ0Tzc4/Y48eS6muqRV6bt2vvTiaMhEm2BBgrNJeg26s1s5/Zd
1ALh5QBadSsQbJ1BOzIL/8MpHx91KQL/eawSo++VBzltqFTgjOiTxiqa1I8S5nUs
6y0q29TpuoRe+frmyAceEO3V0CdG5Hq38xfIE2fWhsRE2kylw9+4oM4Pc95VlEKu
wj86HrrAzc7spVNKVMnO32hJ7ao/NpDOpFvTCbS1Rr4AtpvZ+0T38iwbBQfMgiWQ
mNVtwfwuMgNUpJ36CUkmB3u9vHJk6cYPu5a6WNlCMgpA+XlU1nQQLukXfl560C4i
oKs6pm9xiJ/1yHGPoIGJpaMzSXd8PC6+3hfCnO7DSrIhHRsdhMKct5mh68aYM15u
FCn5ckduxpFRQ+kOhs5fjGk3LjozTTVUemofU+W7EAmFUZNYXwckWTGoquHhB81H
kY3xFnGcz0LwjVPVksfYjfxbS9sLktpgu/++rmKmISs5DvRSW/c=
=6m87
-----END PGP SIGNATURE-----

--Apple-Mail=_0EDF4A45-2CB5-4ABA-AC1F-AFA5F63E1251--
