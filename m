Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 5261360249
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Jan 2016 12:14:18 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id l65so20419965wmf.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Jan 2016 04:14:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=Ug7UJQX667DmmvYi7kvcQ6iv/TTH/7A/x/55/Epc+N4=;
	b=JuhsWdNgHTV2mrSCh4GibotWPvrHXXK6+/doIS9nECSqyRZtg8SxHuV6IIa2QLQhIC
	HZZFXLoFOSytQ2j0wMQ4ktRk/JLRLmeqAgGfTwWR/9nTIA5o2/n+tVzcD93Z2+H+op9b
	kvN5tKsxZBWwB7K9y8TOEBnBbbEanlziP4bQJ77h8gQY9AIS4x0SErS0cgE6cOOakMeW
	imsgEpiwQY6VOC6pgQh0DtO2gqU5MAGUZJhHTlKJpj2Wl9G5XQuupNTSP3gKzTCLYL9W
	YOyEeN6nVYydY8HOrhRGrBFzVBXgmg4OLXqooInslet4/6TreDG+bUFHbywMwGSP+X74
	eOLQ==
X-Received: by 10.28.73.135 with SMTP id w129mr4018930wma.55.1451996058146;
	Tue, 05 Jan 2016 04:14:18 -0800 (PST)
Received: from ernie.rdm.local (rademacherexchange.de. [46.245.221.222])
	by smtp.gmail.com with ESMTPSA id
	pn6sm90715471wjb.15.2016.01.05.04.14.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 05 Jan 2016 04:14:17 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Jens Rehsack <rehsack@gmail.com>
In-Reply-To: <568BA9C5.5070308@topic.nl>
Date: Tue, 5 Jan 2016 13:14:16 +0100
Message-Id: <D0BC6578-6F68-4F61-B705-E96DCE2EA072@gmail.com>
References: <8E273032-FCAF-4476-A017-50D6D2451F14@gmail.com>
	<568BA9C5.5070308@topic.nl>
To: Mike Looijmans <mike.looijmans@topic.nl>
X-Mailer: Apple Mail (2.3112)
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] samba: move RDEPENDS of perl from samba to samba-pidl
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
X-List-Received-Date: Tue, 05 Jan 2016 12:14:19 -0000
X-Groupsio-MsgNum: 59339
Content-Type: multipart/signed;
	boundary="Apple-Mail=_FAC751BB-9987-4F5F-93BF-8C0DEFDCC26F";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_FAC751BB-9987-4F5F-93BF-8C0DEFDCC26F
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> Am 05.01.2016 um 12:32 schrieb Mike Looijmans =
<mike.looijmans@topic.nl>:
>=20
> On 04-01-16 20:06, Jens Rehsack wrote:
>> samba-pidl is the package containing the perl-extension, so RDEPENDS
>> must include perl for samba-pidl, not for samba.
>>=20
>> Signed-off-by: Jens Rehsack <sno@netbsd.org>
>> ---
>>  meta-networking/recipes-connectivity/samba/samba_4.1.12.bb | 3 +++
>>  1 file changed, 3 insertions(+)
>>=20
>> diff --git =
a/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb =
b/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb
>> index 5b343f2..de1f033 100644
>> --- a/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb
>> +++ b/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb
>> @@ -39,6 +39,8 @@ SRC_URI[md5sum] =3D =
"232016d7581a1ba11e991ec2674553c4"
>>  SRC_URI[sha256sum] =3D =
"033604674936bf5c77d7df299b0626052b84a41505a6a6afe902f6274fc29898"
>>=20
>>  inherit systemd waf-samba cpan-base perlnative
>> +# remove default added RDEPENDS on perl
>> +RDEPENDS_${PN}_remove =3D "perl"
>=20
> This is a hack, not a solution.

Neither, nor.

> Better to fix this at its core: cpan-base.bbclass forces both =
DEPENDS_${PN} and RDEPENDS_${PN} to contain "perl".

That's an API / behavior change to cpan-base.bbclass.
Since other recipes rely on that, it's not an easy solution to remove =
the dependency injection from cpab-base.bbclass.

> All that the recipe really wants to have is the perl version. It does =
not need a perl for the target, regardless of whether you'd want to =
install samba-pidl.

Wrong. The recipe wants the perl paths, too.

> Fixing this at the proper level will considerably reduce compilation =
time for samba, which is already excessively long because of parallel =
build issues (the patch that fixes that isn't integrated).
>=20
>>=20
>>  DEPENDS +=3D "readline virtual/libiconv zlib popt libtalloc libtdb =
libtevent libldb krb5 ctdb libbsd"
>>=20
>> @@ -319,4 +321,5 @@ FILES_${PN}-python-dbg =3D =
"${libdir}/python${PYTHON_BASEVERSION}/site-packages/.d
>>                            =
${libdir}/python${PYTHON_BASEVERSION}/site-packages/samba/dcerpc/.debug/* =
\
>>  "
>>=20
>> +RDEPENDS_${PN}-pidl_append =3D " perl "
>>  FILES_${PN}-pidl =3D "${bindir}/pidl ${PERL_VERNDORLIB}/*"
>> --
>> 1.9.1
>>=20
>> --
>> Jens Rehsack - rehsack@gmail.com
>>=20

Best regards
--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_FAC751BB-9987-4F5F-93BF-8C0DEFDCC26F
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQIcBAEBCgAGBQJWi7OYAAoJEESZlq7c5QqdPggP/2W0DZYXlWZGjzMZh6gtqKW3
MUyOO/HvBPAc8c0MxCrJBS5sFOAjlVjnGL9DCOibII92Zw1TNiB/Nr8v/MBNJLCL
nMGn9g0k8RTsfwaxwSoL95oshdeqMBbJtoN0T0c3lX8U56E1HwzJ8W03XF4eLoku
5VFYA6KupZdrhkVZJQuF/ItBdbnR5/WtfOFUuob3aU3o32rRQ9TgZFW6VOK3fIeQ
3Xj4mqxzRjSPIaZwY4ybB+br+P6lgavHqD7PJd8SK7nw3rAbHHcd8OxuMwbFTFMn
0lL+gNZH+L26ipKvSpeewnMpQ6+7nJCLTQWHL6VzcYMkOw/M/6ExPrXsbr3a8Hma
mDc32xA4ZUKeXNoReOoCLzh3Rau8DNWBgHnBiqh9lJ4njFeiQG4vc+X1+BRa0TCH
ACA2mXvuaHqEY7ltt+wyHnunqUWfk0Q5HGJWFgRCM9IjItEElvmWgSbI64YBsdfd
cL3jG3/9KIZ6dHZlpCtyXMrel/+EHg5XQjoK+fxkyAWs2DIqHyvXPs1EU7HpBTUC
spjVhD0Xj6VA5aaCqPDCQQ5dLJKOC7eMjLk+SmJExmQl7+L90egNcujwXlj8KM0T
7jf5S5peHu4L+YPsV3PPCXU/sEFs9QbJsA1/NNpbSaXZ1iX4TfN0Y21NHokrSTt4
UVK0szUn/AXUpsuy/6J0
=Uvl1
-----END PGP SIGNATURE-----

--Apple-Mail=_FAC751BB-9987-4F5F-93BF-8C0DEFDCC26F--
