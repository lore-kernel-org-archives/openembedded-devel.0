Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q5f5i-0006Ij-Ux
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Apr 2011 16:12:47 +0200
Received: by fxm19 with SMTP id 19so2992856fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Apr 2011 07:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=sCnkFq6YxddS+r3Em1sg5jRihzVyR8JTDfMd3c/jK34=;
	b=iQ8Mq0FOjep3I5uEfm4Ofpq2IbYIPuPIUHLoDSc62UPyDW8BIHDw1cLWax2JDx6mMn
	G/x/CjrOeiWqCa0Rbf3CDHc6YxDB2rI1zktfhOj3yG79zbkxuvgyT6HwFZYN3S+PjMKF
	Vo460Jn7k9Ybm+3ClUHbC33U1SytAAP9fq8LU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=ZVWQIKFg5JKFPPtr6gYLPLdRjzZqu1TPOeML6yLTxbbAgyrFKj7sZ0Qi/vKPhESy/k
	EKTyKQEqtf6hS8i+mqvYkCq7F7ZRwtrLDy0b+hWL6XFb24RD0HU/UIIr8GTHUWY5oi2G
	DU7G9Npj4yZSRWhYU8Yo+NxveKDvBsl57FKSo=
Received: by 10.223.6.11 with SMTP id 11mr1001748fax.103.1301667040159; Fri,
	01 Apr 2011 07:10:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.23.136 with HTTP; Fri, 1 Apr 2011 07:10:10 -0700 (PDT)
In-Reply-To: <in41dc$a8h$1@dough.gmane.org>
References: <1301637327-26825-1-git-send-email-raj.khem@gmail.com>
	<1301637327-26825-2-git-send-email-raj.khem@gmail.com>
	<in41dc$a8h$1@dough.gmane.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 1 Apr 2011 07:10:10 -0700
Message-ID: <AANLkTin7=nLnqzwDrnfvPO5sdWJcuhYYqbJXWRV5BhwK@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH 2/7] siteinfo.bbclass: Use linux-uclibceabi instead of uclibcgnueabi
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
X-List-Received-Date: Fri, 01 Apr 2011 14:12:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 1, 2011 at 1:12 AM, Koen Kooi <koen@dominion.thruhere.net> wrot=
e:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 01-04-11 07:55, Khem Raj wrote:
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
> Could you explain why this was changed?

IIRC there were some packages where gnueabi was being captured for glibc li=
ke
features. This may no longer be true. However we use uclibceabi in OE so th=
is
was to maintain consistency

>
> As for the complete set: could you make it a pull request so it can be
> pulled in with git merge? And use [meta-oe] as subject prefix?
>

OK. I will publish it thru contrib tree.

> regards,
>
> Koen
>
>
>> ---
>> =C2=A0meta-oe/classes/siteinfo.bbclass | =C2=A0 =C2=A04 ++--
>> =C2=A01 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta-oe/classes/siteinfo.bbclass b/meta-oe/classes/siteinfo=
.bbclass
>> index c0db539..f1db913 100644
>> --- a/meta-oe/classes/siteinfo.bbclass
>> +++ b/meta-oe/classes/siteinfo.bbclass
>> @@ -109,13 +109,13 @@ def get_siteinfo_list(d):
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "armeb-linux": =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "endian-big bit-32 common-glibc a=
rm-common",\
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "armeb-linux-gnu=
eabi": =C2=A0 =C2=A0 "endian-big bit-32 common-glibc arm-common armeb-linux=
",\
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "armeb-linux-ucl=
ibc": =C2=A0 =C2=A0 =C2=A0"endian-big bit-32 common-uclibc arm-common",\
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "armeb-linux-uclibcgn=
ueabi": "endian-big bit-32 common-uclibc arm-common armeb-linux-uclibc",\
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "armeb-linux-uclibcea=
bi": "endian-big bit-32 common-uclibc arm-common armeb-linux-uclibc",\
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "arm-darwin": =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"endian-little bit-32 commo=
n-darwin",\
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "arm-darwin8": =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"endian-little bit-32 commo=
n-darwin",\
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "arm-linux": =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "endian-little bit-32 common-=
glibc arm-common",\
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "arm-linux-gnuea=
bi": =C2=A0 =C2=A0 =C2=A0 "endian-little bit-32 common-glibc arm-common arm=
-linux",\
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "arm-linux-uclib=
c": =C2=A0 =C2=A0 =C2=A0 =C2=A0"endian-little bit-32 common-uclibc arm-comm=
on",\
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "arm-linux-uclibcgnue=
abi": "endian-little bit-32 common-uclibc arm-common arm-linux-uclibc",\
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "arm-linux-uclibceabi=
": "endian-little bit-32 common-uclibc arm-common arm-linux-uclibc",\
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "avr32-linux": =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "endian-big bit-32 common-glibc a=
vr32-common",\
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "avr32-linux-ucl=
ibc": =C2=A0 =C2=A0 =C2=A0"endian-big bit-32 common-uclibc avr32-common",\
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "bfin-uclinux-uc=
libc": =C2=A0 =C2=A0 =C2=A0 "endian-little bit-32 common-uclibc bfin-common=
",\
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFNlYjsMkyGM64RGpERAo6rAKCTF1LNMYS/qSOf/bacYeJBOquASgCeO4nA
> 6+fmbv3RfnguZYazTZatXJU=3D
> =3DuGZa
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


