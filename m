Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1OZIlL-00030q-VG
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Jul 2010 09:21:45 +0200
Received: by iwn34 with SMTP id 34so717745iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Jul 2010 00:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=+C0W1+HBgaAmOYZYl1hAgp9b912tcHMc+SxHmlkWcgs=;
	b=SPOirP1deBKVykxZBYb3n7VZ+GAU/aVwwoHT3/arsim5PYpOfS9zrWHieEG6goH2oa
	ymZod2CIzl+kxUrLtnYc6Vd8YQhT3IKesIY0/sjauapVyM+H89+e+VjlCqzDbQncAInC
	WVdzJ6CF8bD5+QLVOlpjqdaK4d0cGsveKK9fM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=sX3OzxqreX4UJTPvTuCVaAU1ZutQgeR7Zb299yNjeNgtTUXfYZEZWJqbkUzYR5NuxJ
	CsgENLAUUV06On61Qi4XsF/PDJHWinOWrb3BKpWQI7eg/ACuZ6loZ26MwFX0ZHqcVDMe
	jMjBOgeSZOek3ZglGLZ7uNnOAtrZEMzvqZnnI=
MIME-Version: 1.0
Received: by 10.231.13.65 with SMTP id b1mr18726579iba.185.1279178501076; Thu, 
	15 Jul 2010 00:21:41 -0700 (PDT)
Received: by 10.231.157.196 with HTTP; Thu, 15 Jul 2010 00:21:41 -0700 (PDT)
In-Reply-To: <AANLkTikLt386MmRbOllffnFTi6DKPDU4lFep9FQ0_jCc@mail.gmail.com>
References: <1278458982-3362-1-git-send-email-raj.khem@gmail.com>
	<AANLkTikLt386MmRbOllffnFTi6DKPDU4lFep9FQ0_jCc@mail.gmail.com>
Date: Thu, 15 Jul 2010 16:51:41 +0930
Message-ID: <AANLkTikIjf68vywG3iF0HEMn8RNQpO2syCLdR5dzXxmx@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH][v2] base.bbclass: re-add backward compatibility with bitbake w.r.t decodeurl fix in bitbake
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
X-List-Received-Date: Thu, 15 Jul 2010 07:21:45 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 7 July 2010 19:08, Frans Meulenbroeks <fransmeulenbroeks@gmail.com> wrot=
e:
> 2010/7/7 Khem Raj <raj.khem@gmail.com>:
>> This patch seems to work with both bitbakes
>>
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>> =A0classes/base.bbclass | =A0 15 +++++++++++++--
>> =A01 files changed, 13 insertions(+), 2 deletions(-)
>>
>> diff --git a/classes/base.bbclass b/classes/base.bbclass
>> index 2da0b7a..b30310d 100644
>> --- a/classes/base.bbclass
>> +++ b/classes/base.bbclass
>> @@ -219,14 +219,25 @@ def oe_unpack_file(file, data, url =3D None):
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0# The "destdir" handling =
was specifically done for FILESPATH
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0# items. =A0So, only do s=
o for file:// entries.
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if type =3D=3D "file":
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dest =3D o=
s.path.dirname(path) or "."
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if not hos=
t:
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 dest =3D os.path.dirname(path) or "."
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 else:
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 # this cas=
e is for backward compatiblity with older version
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 # of bitba=
ke which do not have the fix
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 # http://c=
git.openembedded.org/cgit.cgi/bitbake/commit/?id=3Dca257adc587bb0937ea76d8b=
32b654fdbf4192b8
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 # this sho=
uld not be needed once all releases of bitbake has this fix
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 # applied/=
backported
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 dest =3D host + os.path.dirname(path) or "."
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0else:
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dest =3D =
"."
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0bb.mkdirhier("%s" % os.pa=
th.join(os.getcwd(),dest))
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0cmd =3D 'cp %s %s' % (fil=
e, os.path.join(os.getcwd(), dest))
>> =A0 =A0 =A0 =A0if not cmd:
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return True
>> - =A0 =A0 =A0 dest =3D os.path.join(os.getcwd(), path)
>> + =A0 =A0 =A0 if not host:
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dest =3D os.path.join(os.getcwd(), path)
>> + =A0 =A0 =A0 else:
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dest =3D os.path.join(os.getcwd(), os.path=
.join(host, path))
>> =A0 =A0 =A0 =A0if os.path.exists(dest):
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if os.path.samefile(file, dest):
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return True
>> --
>> 1.7.1
>>
>
> This fixes things for me so:
> Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
>

This change appears to have broken lsof_4.83.bb.

lsof has a weird tar within a tar, and thus a custom do_unpack(). The
result is that the inner tar is not extracted, and do_configure fails
to find a configure script.

-Graham


