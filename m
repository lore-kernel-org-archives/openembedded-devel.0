Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PDAM9-0005uR-Oh
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Nov 2010 07:28:30 +0100
Received: by iwn42 with SMTP id 42so7638257iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Nov 2010 23:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=4z+uAwsAOoQDKYdXdSHw9mYkqeqwgKu/gc4J73BGLDk=;
	b=NZl29HPenAANb0RbXVODhuwrCAigyyd0CX+03k3iOsQIgpKrHXBYttZYQoHwc+xTUw
	wpXFWjSWFWMHxnOQ8RWLsCB8M0ILiSbVKnQ4kmTTKhVliLGsEO/BN606y1ACTOz+qaWH
	FbP58Sx3shZZ0JaEZ2u76w4NQZSLWa3DdYxXw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=hEbpRlje3pMYAz2B15q+qoM9jKg7IicGfDk0lE47KCsRrurD5pqLJcsx7+cNNDGY4q
	J9i+EjbPOU/V0zqJkBBYpNJLTFzbwa02/zzdNuC16nY6eOPt65Ajb3ZFCB3FDJQBoBcz
	bL+E127BCPckTUQWxep+R9KwDqQS7IhAWmgXE=
MIME-Version: 1.0
Received: by 10.42.157.199 with SMTP id e7mr376475icx.67.1288679261358; Mon,
	01 Nov 2010 23:27:41 -0700 (PDT)
Received: by 10.231.40.13 with HTTP; Mon, 1 Nov 2010 23:27:41 -0700 (PDT)
In-Reply-To: <AANLkTi=uGgpTQsmJeAYXTQoRv8z6fDzFcHSLKvWN21+y@mail.gmail.com>
References: <1288647332-20685-1-git-send-email-eric@eukrea.com>
	<1288647332-20685-2-git-send-email-eric@eukrea.com>
	<AANLkTi=uGgpTQsmJeAYXTQoRv8z6fDzFcHSLKvWN21+y@mail.gmail.com>
Date: Tue, 2 Nov 2010 07:27:41 +0100
Message-ID: <AANLkTinudQ+4gp9kZmONtyouEd-WNGoU2FF1NS=HZPkw@mail.gmail.com>
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
Subject: Re: [PATCH 2/3] busybox: 1.17.3 is stable and can be the default fallback version
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
X-List-Received-Date: Tue, 02 Nov 2010 06:28:30 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/11/2 Khem Raj <raj.khem@gmail.com>:
> On Mon, Nov 1, 2010 at 2:35 PM, Eric B=E9nard <eric@eukrea.com> wrote:
>> Signed-off-by: Eric B=E9nard <eric@eukrea.com>
>
> Acked-by: Khem Raj <raj.khem@gmail.com>
>
>> ---
>> =A0recipes/busybox/busybox_1.17.3.bb | =A0 =A04 +---
>> =A01 files changed, 1 insertions(+), 3 deletions(-)
>>
>> diff --git a/recipes/busybox/busybox_1.17.3.bb b/recipes/busybox/busybox=
_1.17.3.bb
>> index 6f23662..6956bde 100644
>> --- a/recipes/busybox/busybox_1.17.3.bb
>> +++ b/recipes/busybox/busybox_1.17.3.bb
>> @@ -1,7 +1,5 @@
>> =A0require busybox_1.1x.inc
>> -PR =3D "${INC_PR}.0"
>> -
>> -DEFAULT_PREFERENCE =3D "-1"
>> +PR =3D "${INC_PR}.1"

I doubt if this needs a PR bump.
If someone is compiling/using/pinning this already it does not change a thi=
ng.
And if someone is not using it, removing the DP -1 will cause it to be
considered anyway.

But anyway it does not harm so,

Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>


>>
>> =A0SRC_URI +=3D "\
>> =A0 file://busybox-1.17.3-sort.patch =A0\
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


