Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OGD6E-00016M-3I
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 May 2010 17:28:22 +0200
Received: by iwn2 with SMTP id 2so2523921iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 May 2010 08:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=WXhZdMTx4uzlPmp/dwf6Wys/5+AXp5tsrD0WgeP0+uM=;
	b=dfvGfRrQgLEw6LhGTawGwnGMwTc07g6WhdTi5W0ZSos0JBmu6KzVdB6b9zx6Vl1k9H
	iWjdZiqK56gv1ea/V4WFaBte434rvtdOJLQL4Stll+0C5qlKRVQ+q9DC3/mr86Fgae23
	1srcBhi0Hctf1WVK5vq8d3l13iuVoGrxwyuwg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=KIo1ZhMwipKGVWCcGZlvOyksuMip7RsmOrGYORPX3/DBhJhWhZYqTlce2D3W6rhI9A
	CNPElP9j1aq5mzwGaaQDf/GdZcLnAPYsNBWVv3/JNFnwnloOLbz6qK3R2ZJxfwvqD/f2
	ghGsKPJeR3AarZHGefuTLsaGbx2GntJ3U8B1s=
MIME-Version: 1.0
Received: by 10.231.176.72 with SMTP id bd8mr3483925ibb.0.1274628258307; Sun, 
	23 May 2010 08:24:18 -0700 (PDT)
Received: by 10.231.30.67 with HTTP; Sun, 23 May 2010 08:24:18 -0700 (PDT)
In-Reply-To: <20100523142538.GA27824@mi.fu-berlin.de>
References: <1274536328-31845-1-git-send-email-vzapolskiy@gmail.com>
	<20100523142538.GA27824@mi.fu-berlin.de>
Date: Sun, 23 May 2010 08:24:18 -0700
Message-ID: <AANLkTimd5UKKjhmNqm4_HFlOcLfkZ2cdlB2XX5tYIVOy@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
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
X-List-Received-Date: Sun, 23 May 2010 15:28:22 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sun, May 23, 2010 at 7:25 AM, Henning Heinold
<heinold@inf.fu-berlin.de> wrote:
> On Sat, May 22, 2010 at 05:52:08PM +0400, Vladimir Zapolskiy wrote:
>> This patch removes dependency on oabi toolchain, because eabi uclibc
>> toolchain anyway does not have tls support.
>>
>> Signed-off-by: Vladimir Zapolskiy <vzapolskiy@gmail.com>
>> Cc: woglinde <heinold@inf.fu-berlin.de>
>> ---
>> =A0recipes/e2fsprogs/e2fsprogs.inc | =A0 =A03 +--
>> =A01 files changed, 1 insertions(+), 2 deletions(-)
>>
>> diff --git a/recipes/e2fsprogs/e2fsprogs.inc b/recipes/e2fsprogs/e2fspro=
gs.inc
>> index 119efb0..0eeedcd 100644
>> --- a/recipes/e2fsprogs/e2fsprogs.inc
>> +++ b/recipes/e2fsprogs/e2fsprogs.inc
>> @@ -14,8 +14,7 @@ INC_PR =3D "r23"
>> =A0inherit autotools
>>
>> =A0#if uclibc ntpl is merged into trunk we can enable tls for armv4 agai=
n
>> -EXTRA_OECONF =3D "${@['','--disable-tls'][bb.data.getVar('ARM_ABI', d, =
1) =3D=3D 'oabi' and \
>> - =A0 =A0 =A0 =A0 =A0 =A0 bb.data.getVar('TARGET_OS', d, 1).find('uclibc=
') >=3D 0 ]} \
>> +EXTRA_OECONF =3D "${@['','--disable-tls'][bb.data.getVar('TARGET_OS', d=
, 1).find('uclibc') >=3D 0 ]} \
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 --enable-elf-shlibs \
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 --enable-dynamic-e2fsck --disable-nls --sbin=
dir=3D${base_sbindir} \
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 --disable-libuuid --disable-libblkid --disab=
le-fsck"
>
> Sorry,
>
> but you are wrong here the _git uclibc recipe and the hopefully soon comm=
ing out
> new uClibc will have tls support, but not for all archs. We will change t=
he .inc
> then.
>

it will support TLS/nptl on arm, mips, ppc32, x86, x86_64 , sparc and sh
thats mostly all actively uses architectures in OE.

Thx
-Khem

>
> Bye Henning
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


