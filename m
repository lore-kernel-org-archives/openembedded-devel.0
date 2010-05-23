Received: from mail-ww0-f47.google.com ([74.125.82.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <animist@gmail.com>) id 1OGEgG-0003NA-BH
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 May 2010 19:09:41 +0200
Received: by wwa36 with SMTP id 36so222129wwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 May 2010 10:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:sender:received
	:in-reply-to:references:date:x-google-sender-auth:message-id:subject
	:from:to:cc:content-type:content-transfer-encoding;
	bh=/jhBlsuX4tJKCDh8fSnnTWplYCGsZWp150SDWgypPL0=;
	b=B+DbD3UZ50YZFHgtPj3uQ54qG7lsnIWGV/I56QO2vgSZO8YpoKb3wIfgOqq0aLZS1V
	zQGYNEyhxxlr2vCRXj5oPBxI899jtLm8qikUSUVG1QLIVHpkbCLDbTN9p0AxYaM/CBLt
	Xrx+G3p39GksW6l7C65cQP0i1BkABZt7h8mSU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=C+qrkBhcyvnqKDwt9QDDCrqEWj4MprUA9MzE5mgE6fsLCt8Dc5ZW5bOlPsLo0FQKHF
	gHb4Y4pYrXJGzsYdMGv96qkqbo7tbbUvIk9kUoZu3I6Yr3fzyvF2KJz+j2OaqLFZ+m7M
	eO3Rrj5hGo349rtgLCQ2o1JcFLwm0EC044yJ8=
MIME-Version: 1.0
Received: by 10.216.88.65 with SMTP id z43mr2615223wee.167.1274634333987; Sun, 
	23 May 2010 10:05:33 -0700 (PDT)
Sender: animist@gmail.com
Received: by 10.216.155.209 with HTTP; Sun, 23 May 2010 10:05:33 -0700 (PDT)
In-Reply-To: <20100523142538.GA27824@mi.fu-berlin.de>
References: <1274536328-31845-1-git-send-email-vzapolskiy@gmail.com>
	<20100523142538.GA27824@mi.fu-berlin.de>
Date: Sun, 23 May 2010 21:05:33 +0400
X-Google-Sender-Auth: S3qF7kj7jF8teFRDcWzrknUpS4A
Message-ID: <AANLkTilcGN2j7b8vaFjSWT5dj32tRMllyEuBhYQG5NXg@mail.gmail.com>
From: Vladimir Zapolskiy <vzapolskiy@gmail.com>
To: Henning Heinold <heinold@inf.fu-berlin.de>
X-SA-Exim-Connect-IP: 74.125.82.47
X-SA-Exim-Mail-From: animist@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] e2fsprogs: disable tls build with uclibc toolchain
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
X-List-Received-Date: Sun, 23 May 2010 17:09:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, May 23, 2010 at 6:25 PM, Henning Heinold
<heinold@inf.fu-berlin.de> wrote:
> On Sat, May 22, 2010 at 05:52:08PM +0400, Vladimir Zapolskiy wrote:
>> This patch removes dependency on oabi toolchain, because eabi uclibc
>> toolchain anyway does not have tls support.
>>
>> Signed-off-by: Vladimir Zapolskiy <vzapolskiy@gmail.com>
>> Cc: woglinde <heinold@inf.fu-berlin.de>
>> ---
>> =C2=A0recipes/e2fsprogs/e2fsprogs.inc | =C2=A0 =C2=A03 +--
>> =C2=A01 files changed, 1 insertions(+), 2 deletions(-)
>>
>> diff --git a/recipes/e2fsprogs/e2fsprogs.inc b/recipes/e2fsprogs/e2fspro=
gs.inc
>> index 119efb0..0eeedcd 100644
>> --- a/recipes/e2fsprogs/e2fsprogs.inc
>> +++ b/recipes/e2fsprogs/e2fsprogs.inc
>> @@ -14,8 +14,7 @@ INC_PR =3D "r23"
>> =C2=A0inherit autotools
>>
>> =C2=A0#if uclibc ntpl is merged into trunk we can enable tls for armv4 a=
gain
>> -EXTRA_OECONF =3D "${@['','--disable-tls'][bb.data.getVar('ARM_ABI', d, =
1) =3D=3D 'oabi' and \
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.data.getVar('TARGET_OS', =
d, 1).find('uclibc') >=3D 0 ]} \
>> +EXTRA_OECONF =3D "${@['','--disable-tls'][bb.data.getVar('TARGET_OS', d=
, 1).find('uclibc') >=3D 0 ]} \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --enable-elf-shlibs \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --enable-dynamic-e2fsck=
 --disable-nls --sbindir=3D${base_sbindir} \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --disable-libuuid --dis=
able-libblkid --disable-fsck"
>
> Sorry,
>
> but you are wrong here the _git uclibc recipe and the hopefully soon comm=
ing out
> new uClibc will have tls support, but not for all archs. We will change t=
he .inc
> then.
>
Does _git uclibc go with nptl currently? I perform a test with
armv4t/gcc-4.4.2/uclibc-0.9.30.3
eabi version, and found the described compilation problem, that shows
that oabi check is not
so relevant.

Definitely the compilation problem cause is evaluated by invalid
configuration from the recipe
for eabi/uclibc platform.

With best wishes,
Vladimir


