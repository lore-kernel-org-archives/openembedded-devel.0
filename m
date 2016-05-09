Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f170.google.com (mail-pf0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id D2C9E731B3
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 May 2016 22:00:40 +0000 (UTC)
Received: by mail-pf0-f170.google.com with SMTP id c189so82919354pfb.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 May 2016 15:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=2NDxWA5Q7xeJ3LRTMX3usaw6LW7lURQMhnQ1KrsoLEk=;
	b=gvfAen/0N+GVy4FRjEXUKZeHX3009cdinyr08pVFWUb4yRAKJl7VBFCKdwf1bybaT+
	1mQ4dkuXv/Yu60cKfVIXPmaqxh7CqfjNm4ih3I9P0DkVLzBH7UUYjFfEQx2GiyKCsepG
	wwhi3joKitzW8fioeo5x0xSBnR84DzttqTQtCv/NmQzTthzDnN2UwBYgzdEYRlzuLZ0b
	wPnM9KpyEmpSQ5rPINxtcyuZ3kvJ8v1gEWOUu5dfslCEXKDB4XnEK7A6T7TgjHn63cKB
	x6fBCxDq/mwQbgA/ROybJ4R7/FZyozQjImDmGBrbKYpUcftQWZs7//RujQd8q5xIiZ0k
	pprw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=2NDxWA5Q7xeJ3LRTMX3usaw6LW7lURQMhnQ1KrsoLEk=;
	b=Cf2N5M2Rl2I/hOzygVDPvjqs29NTIBhOzUq0BrLfj6bDPqfGRF7hNoMN8cATdscKQ8
	hlKNFXN1VrD/JORcYV+ePodiXXS/MuOomSKEj4f544emKf3Wa4NRK7yz8CdIXCc4gnLF
	K2lOxF8KTzlBDj2IYzyMekZtDBkZYz10Sgn/gSK243uvrI4Ytg8rhcRef6XIZN7DgoHs
	iRNkxVhiZNkCB588kWHxCov2Mkd9A/5lo15oAKrKXjaLBJJt2h4O+E/o/cPc9KtZ3MHN
	tkJt4coYO+P/dYanUC7YLt1MMWLyrURJPDGc4ePoxwWfOJuudsoItqOLHb7/sJvOmKWy
	NBPw==
X-Gm-Message-State: AOPr4FXWQbRFAWnNhpGT36GZyiPjPkc8jSfJw+HOvULFZ43bEcLX6YmIt/QQ2hfmGHIANQ==
X-Received: by 10.98.29.137 with SMTP id d131mr53599725pfd.2.1462831240788;
	Mon, 09 May 2016 15:00:40 -0700 (PDT)
Received: from [192.168.0.76] (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	l88sm7533819pfi.55.2016.05.09.15.00.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 09 May 2016 15:00:39 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAFSKS=P_CqdgrO_rcTpGQPNn7Vo1t9MAUmg2-D8RdANiFY9gGQ@mail.gmail.com>
Date: Mon, 9 May 2016 15:00:49 -0700
Message-Id: <20252BD2-C54A-402B-A8F1-A7D9C163BFF1@gmail.com>
References: <1462204748-3435-1-git-send-email-akuster808@gmail.com>
	<20160502161809.GD17714@mentor.com>
	<CAFSKS=P_CqdgrO_rcTpGQPNn7Vo1t9MAUmg2-D8RdANiFY9gGQ@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Tom King <ka6sox@gmail.com>
X-Mailer: Apple Mail (2.3124)
Cc: Armin Kuster <akuster@mvista.com>
Subject: Re: [meta-networking][master][krogoth][jethro][fido][PATCH] ntp: Security fixes via update to 4.2.8p7
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
X-List-Received-Date: Mon, 09 May 2016 22:00:42 -0000
X-Groupsio-MsgNum: 61443
Content-Type: multipart/signed;
	boundary="Apple-Mail=_9BCDF19B-15DF-40AE-9CDD-5D10BB40212B";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_9BCDF19B-15DF-40AE-9CDD-5D10BB40212B
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Please work with Tom to get it cached at sources.openembedded.org

> On May 9, 2016, at 12:19 PM, George McCollister =
<george.mccollister@gmail.com> wrote:
>=20
> 4.2.8p7 appears to have been removed from:
> https://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/
>=20
> Not sure if this is temporary...
>=20
> Regards,
> George McCollister
>=20
> On Mon, May 2, 2016 at 11:18 AM, Joe MacDonald =
<Joe_MacDonald@mentor.com> wrote:
>> [[meta-networking][master][krogoth][jethro][fido][PATCH] ntp: =
Security fixes via update to 4.2.8p7] On 16.05.02 (Mon 08:59) Armin =
Kuster wrote:
>>=20
>>> From: Armin Kuster <akuster@mvista.com>
>>>=20
>>> CVE-2016-1551
>>> CVE-2016-2516
>>> CVE-2016-2517
>>> CVE-2016-2518
>>> CVE-2016-2519
>>> CVE-2016-1547
>>> CVE-2015-7704
>>> CVE-2015-8138
>>> CVE-2016-1550
>>>=20
>>> for more info see:
>>> =
http://support.ntp.org/bin/view/Main/SecurityNotice#April_2016_NTP_4_2_8p7=
_Security
>>>=20
>>> Signed-off-by: Armin Kuster <akuster@mvista.com>
>>=20
>> Acked-by: Joe MacDonald <joe_macdonald@mentor.com>
>>=20
>>> ---
>>> .../recipes-support/ntp/{ntp_4.2.8p6.bb =3D> ntp_4.2.8p7.bb}         =
   | 4 ++--
>>> 1 file changed, 2 insertions(+), 2 deletions(-)
>>> rename meta-networking/recipes-support/ntp/{ntp_4.2.8p6.bb =3D> =
ntp_4.2.8p7.bb} (97%)
>>>=20
>>> diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.8p6.bb =
b/meta-networking/recipes-support/ntp/ntp_4.2.8p7.bb
>>> similarity index 97%
>>> rename from meta-networking/recipes-support/ntp/ntp_4.2.8p6.bb
>>> rename to meta-networking/recipes-support/ntp/ntp_4.2.8p7.bb
>>> index a7b998a..ff4ba64 100644
>>> --- a/meta-networking/recipes-support/ntp/ntp_4.2.8p6.bb
>>> +++ b/meta-networking/recipes-support/ntp/ntp_4.2.8p7.bb
>>> @@ -23,8 +23,8 @@ SRC_URI =3D =
"http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-${PV}.tar.g
>>>            file://ntpd.list \
>>> "
>>>=20
>>> -SRC_URI[md5sum] =3D "60049f51e9c8305afe30eb22b711c5c6"
>>> -SRC_URI[sha256sum] =3D =
"583d0e1c573ace30a9c6afbea0fc52cae9c8c916dbc15c026e485a0dda4ba048"
>>> +SRC_URI[md5sum] =3D "46dfba933c3e4bc924d8e55068797578"
>>> +SRC_URI[sha256sum] =3D =
"81d20c06a0b01abe3b84fac092185bf014252d38fe5e7b2758f604680a0220dc"
>>>=20
>>> inherit autotools update-rc.d useradd systemd pkgconfig
>>>=20
>> --
>> -Joe MacDonald.
>> :wq
>>=20
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_9BCDF19B-15DF-40AE-9CDD-5D10BB40212B
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlcxCJQACgkQuwUzVZGdMxQt/QCeJBbxIfGFxycsw6on1eFO4j5V
//YAn0tsmzs+c7pQendTfPKspOy3vm+j
=E1IX
-----END PGP SIGNATURE-----

--Apple-Mail=_9BCDF19B-15DF-40AE-9CDD-5D10BB40212B--
