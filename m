Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QbIAN-0002jS-4o
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Jun 2011 22:12:19 +0200
Received: by pwi1 with SMTP id 1so3374596pwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jun 2011 13:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=fnTH5ZpwLGF3U/UVujxTLcaH47hbBk6dttF/l2kagPI=;
	b=huH+dHAGStVg6Hu1ZCcVUBm8tUtZO3G05uAUDcue0lc/Yy1SAzf+9YUp9AoOr9hzVn
	HthMzrPsQ9l2n5R9Ni9G3V5lCCT3FwXnTyex4G7zbEC+x6h5U1QSn5uXtmo0aVlITQ8s
	4opyMqrl8naAUVbJeApY5hNu+BpNYvWO7+wik=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=Ej15g/AN+9xcSVE5Tj4TWsMvFwNFzDCBEGI1Z3elaJ/KwB+VIKbPATcgGANRC5pA3z
	8bKbRyqYIAYXkfnjAHQOcWKmIpoXZQFcikdRcYGHqNUB5dE3pbi8qXTFFqU+BjbUZvmT
	FjGzSp4J2TzkgGUcDPRuheDh1aTCVwW5T/MSc=
Received: by 10.68.36.234 with SMTP id t10mr3381596pbj.361.1309205317979; Mon,
	27 Jun 2011 13:08:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.48.105 with HTTP; Mon, 27 Jun 2011 13:08:07 -0700 (PDT)
In-Reply-To: <1309204888.21379.143.camel@mattotaupa>
References: <1309203161-25143-1-git-send-email-raj.khem@gmail.com>
	<1309204888.21379.143.camel@mattotaupa>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 27 Jun 2011 13:08:07 -0700
Message-ID: <BANLkTikgZ_ewsXgOj3Q20v8xwONTxSZM3A@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] gcc-common-4.6.inc: Set ARM_INSTRUCTION_SET to arm
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
X-List-Received-Date: Mon, 27 Jun 2011 20:12:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 27, 2011 at 1:01 PM, Paul Menzel
<paulepanter@users.sourceforge.net> wrote:
> Am Montag, den 27.06.2011, 12:32 -0700 schrieb Khem Raj:
>> Otherwise it will compile libgcc in thumb mode when thumb
>> mode is selected and libgcc in thumb mode does not work
>> well.
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>> =C2=A0meta-oe/recipes-devtools/gcc/gcc-common-4.6.inc | =C2=A0 =C2=A03 +=
+-
>> =C2=A01 files changed, 2 insertions(+), 1 deletions(-)
>>
>> diff --git a/meta-oe/recipes-devtools/gcc/gcc-common-4.6.inc b/meta-oe/r=
ecipes-devtools/gcc/gcc-common-4.6.inc
>> index 059f441..e5a1fba 100644
>> --- a/meta-oe/recipes-devtools/gcc/gcc-common-4.6.inc
>> +++ b/meta-oe/recipes-devtools/gcc/gcc-common-4.6.inc
>> @@ -1,3 +1,4 @@
>> =C2=A0# this will prepend this layer to FILESPATH
>> =C2=A0FILESEXTRAPATHS :=3D "${THISDIR}/gcc-4.6"
>> -PRINC =3D "0"
>> +PRINC =3D "1"
>
> Is that by intention or why is `INC_PR` not used?

yes. PRINC is special in oe-core. Where the real pr will run ahead by
this amount
so say original pr in oe-core is r4 then with the bbappend this will become=
 r5
>
>> +ARM_INSTRUCTION_SET =3D "arm"
>
>
> Thanks,
>
> Paul
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


