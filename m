Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OtOgF-0000dD-N4
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Sep 2010 19:43:33 +0200
Received: by iwn2 with SMTP id 2so195893iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Sep 2010 10:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=gRha5+EOmi0w1oS0LRYayS0PQBfgOPmk2vIgd+jfZOk=;
	b=EGDUJfYhTLl9FpNt1Zls/NlUsTxNjjnGtFG7YbA4FaBIrlaKDxx36zBdPDT7H+ZTrn
	0lt6sKw9lTgWINwpnU7SIIZQ9CldXisWHD774hNhEHWIBe+lBd8wqYndstguE/RDl4T0
	PvV2dD04CZFa58GogVO3u3dszE4IwNzs4f7PI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=r/a2d5uNk5BVVgjNnykl6qEEjEOiVv3V3qxxjZxJRyxuUYceleunlorHR4Inq8FirX
	wLpz9ueYKDxGIIHAzSJCybBE8Ebx680Sy7SJ29cMLrvIhmqyxbxkBXxsMftxDknL66Qm
	CzFNZpYGLEuPpQRbS19IkGVXBbIwC2bf2uaww=
MIME-Version: 1.0
Received: by 10.231.11.9 with SMTP id r9mr8871784ibr.47.1283967770602; Wed, 08
	Sep 2010 10:42:50 -0700 (PDT)
Received: by 10.231.208.17 with HTTP; Wed, 8 Sep 2010 10:42:50 -0700 (PDT)
In-Reply-To: <AANLkTik4yZ+mNwa=dg4vxphMFnc=rRYOkLP58DNsh7Bx@mail.gmail.com>
References: <AANLkTinfxZO07kTjsaFWWZfXzwAdPgKNZAaWEKV-ZTVg@mail.gmail.com>
	<1283959092-6481-1-git-send-email-eric@eukrea.com>
	<1283959092-6481-2-git-send-email-eric@eukrea.com>
	<AANLkTik4yZ+mNwa=dg4vxphMFnc=rRYOkLP58DNsh7Bx@mail.gmail.com>
Date: Wed, 8 Sep 2010 19:42:50 +0200
Message-ID: <AANLkTimBH18xejbfe=P1NpikHiWsxpzF_x9U50899YHY@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v2 2/2] rlpr: upgrade to version 2.06
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
X-List-Received-Date: Wed, 08 Sep 2010 17:43:33 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/9/8 Khem Raj <raj.khem@gmail.com>:
> On Wed, Sep 8, 2010 at 8:18 AM, Eric B=E9nard <eric@eukrea.com> wrote:
>> Signed-off-by: Eric B=E9nard <eric@eukrea.com>
>
> Acked-by: Khem Raj <raj.khem@gmail.com>
Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
>
>> ---
>> =A0recipes/rlpr/{rlpr_2.05.bb =3D> rlpr_2.06.bb} | =A0 =A08 ++++----
>> =A01 files changed, 4 insertions(+), 4 deletions(-)
>> =A0rename recipes/rlpr/{rlpr_2.05.bb =3D> rlpr_2.06.bb} (60%)
>>
>> diff --git a/recipes/rlpr/rlpr_2.05.bb b/recipes/rlpr/rlpr_2.06.bb
>> similarity index 60%
>> rename from recipes/rlpr/rlpr_2.05.bb
>> rename to recipes/rlpr/rlpr_2.06.bb
>> index 2751b9f..64220ce 100644
>> --- a/recipes/rlpr/rlpr_2.05.bb
>> +++ b/recipes/rlpr/rlpr_2.06.bb
>> @@ -2,11 +2,11 @@ DESCRIPTION =3D "rlpr makes it possible to print files=
 on remote sites to your net
>> =A0HOMEPAGE =3D "http://freshmeat.net/projects/rlpr/"
>> =A0SECTION =3D "console/network"
>> =A0LICENSE =3D "GPL"
>> -PR =3D "r1"
>> +PR =3D "r0"
>>
>> -SRC_URI =3D "${DEBIAN_MIRROR}/main/r/rlpr/rlpr_2.05.orig.tar.gz"
>> -SRC_URI[md5sum] =3D "64ee8ccd94aabc90b9f40d0b2ad79e79"
>> -SRC_URI[sha256sum] =3D "6b1261c8a23a58c8e174d8ee1ad53c138ed0b9211f7ea3f=
3efe22d16af14ba9a"
>> +SRC_URI =3D "http://linuxfocus.org/~guido/rlpr-2.06.tar.gz"
>> +SRC_URI[md5sum] =3D "c3192d0e84ccae432e754640f6003478"
>> +SRC_URI[sha256sum] =3D "32ae5893f4b9250b7a02c98a41b5929cfdd5731b6efbd7e=
dfc77c2c5314388f7"
>>
>> =A0inherit autotools
>>
>> --
>> 1.6.3.3
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


