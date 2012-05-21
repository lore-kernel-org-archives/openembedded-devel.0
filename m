Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1SWaOF-0007Qb-Th
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 May 2012 23:43:44 +0200
Received: by pbbrq2 with SMTP id rq2so6554095pbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 May 2012 14:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=md2EVMTJX27IjjUvLiuXEZaaxMNncCurkedkqcFFrpU=;
	b=gUyudWAtVtyrGKDxaT7ldRJQ2e7wAjkzFaudfDJjdsmIZOkjIBNA2GfJcg4SbEOmrU
	lhqqVfYR+EBNqXlt3As420Rg1vLQE5gD1UDziuEX09SUylPJvgpYW3vPhuIvgSDZ1X99
	b7rQwXoUY6zedvMABbMkkGMBlxY0e3enspf8MwgvbL11/c20076rEkJcGNHcnLh0VOif
	Ss/3emKL0d8hupaKTKB+MJoIdGCusJ5diig+tZ/iEiQBUwNra90kSbUeKBnxnt0u1lkC
	pE5KNyt2ZofWIRrfxOUSKX2j8AM5xP6eA1DNEC1xeTQhajSCpuRoRbL5rvmnth3Xku9J
	1yVQ==
MIME-Version: 1.0
Received: by 10.68.225.69 with SMTP id ri5mr9286853pbc.147.1337636015042; Mon,
	21 May 2012 14:33:35 -0700 (PDT)
Received: by 10.143.63.11 with HTTP; Mon, 21 May 2012 14:33:34 -0700 (PDT)
In-Reply-To: <CAMKF1so+__G_LDzj5DDZgQpae63EytLbaZNR5dnwTUAD+3r-3g@mail.gmail.com>
References: <1337549842-1438-1-git-send-email-andrea.adami@gmail.com>
	<CAMKF1so+__G_LDzj5DDZgQpae63EytLbaZNR5dnwTUAD+3r-3g@mail.gmail.com>
Date: Mon, 21 May 2012 23:33:34 +0200
Message-ID: <CAAQYJAuDLh1T6eqhWZG67ugrmBbTCBrdQq7T90Vydv-1XP-5OA@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][meta-initramfs][PATCH 1/3] klibc.bbclass: use klcc as CPP
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
X-List-Received-Date: Mon, 21 May 2012 21:43:44 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, May 21, 2012 at 5:17 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Sun, May 20, 2012 at 2:37 PM, Andrea Adami <andrea.adami@gmail.com> wr=
ote:
>> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
>> ---
>> =A0meta-initramfs/classes/klibc.bbclass | =A0 =A01 +
>> =A01 files changed, 1 insertions(+), 0 deletions(-)
>>
>> diff --git a/meta-initramfs/classes/klibc.bbclass b/meta-initramfs/class=
es/klibc.bbclass
>> index d553bd7..e8cdb6d 100644
>> --- a/meta-initramfs/classes/klibc.bbclass
>> +++ b/meta-initramfs/classes/klibc.bbclass
>> @@ -2,6 +2,7 @@
>> =A0DEPENDS =3D+ "klcc-cross"
>>
>> =A0export CC =3D "${TARGET_PREFIX}klcc"
>> +export CPP =3D "${CC} -E"
>
> I think you might also need to capture CPPFLAGS as well
>

This one seems already there (see full recipe below). Anything missing?

klibc.bbclass      [----]  0 L:[  1+10  11/ 11] *(233 / 233b) <EOF>
# klcc-cross depends on klibc
DEPENDS =3D+ "klcc-cross"

export CC =3D "${TARGET_PREFIX}klcc"
export CPP =3D "${CC} -E"

# klcc uses own optimizations by default. See klcc(1) man file.
export CFLAGS=3D""
export CPPFLAGS=3D""
export LDFLAGS=3D""

Thanks for reviewing

Andrea

>>
>> =A0# klcc uses own optimizations by default. See klcc(1) man file.
>> =A0export CFLAGS=3D""
>> --
>> 1.7.3.4
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


