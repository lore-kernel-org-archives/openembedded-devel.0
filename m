Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PmZhO-0005fi-Ao
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Feb 2011 23:36:47 +0100
Received: by gwaa12 with SMTP id a12so1967095gwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Feb 2011 14:35:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=5zrm0+zuNMMnIEO52Aq1YZ6xTskFeQLC2Zc+0DiWvrw=;
	b=wN5G/2T/ctW5QLFZRVlKam7f1HKnBMBz89jIRgNeRH5d8gqiE8TkNn5kZU4Lj5u1gc
	aREw99+/YfcyVIa4kQbL0DDZq85pC39/W8DAtNoEYP1VoDUlKnFihainP7QjNd8TtA0n
	fA6wofvLXGr0byccKH7furIaf3s3tKfqdAArk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=xIq+QVbzL/cngJYNQTI8jvNguBgV2yJbHJG6jg/aAk2h5ADJC/5Aln+o5zW+rkaxPm
	ur0ioZOUrX7E4RzkFORtbtbEE5A0bXOMH3bOVjZjH90QQMfa7d3Rs+5Ybu56Hvsx47gH
	6CxgvlXyYWz3lDSClOb4azIy6OOcGn7fMLsqY=
Received: by 10.90.29.18 with SMTP id c18mr4650916agc.142.1297118143743; Mon,
	07 Feb 2011 14:35:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.32.12 with HTTP; Mon, 7 Feb 2011 14:35:23 -0800 (PST)
In-Reply-To: <lyzkq7h44l.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <1297093986-24331-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
	<AANLkTinsSoak9h=B+TQEzoUvWSP+MVELZQkTFRu3PTOQ@mail.gmail.com>
	<ly39nzk1bs.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<AANLkTinM02m9A04F+UrNY_E_HauTHD=SgS6=CeSkH_8V@mail.gmail.com>
	<lyzkq7h44l.fsf@ensc-virt.intern.sigma-chemnitz.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 7 Feb 2011 14:35:23 -0800
Message-ID: <AANLkTimt=N0B+fHYF=U2y6hWr=zPPBFMMfs1r4t7R+Rk@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] cortex-m3: adjusted target cflags
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
X-List-Received-Date: Mon, 07 Feb 2011 22:36:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 7, 2011 at 2:27 PM, Enrico Scholz
<enrico.scholz@sigma-chemnitz.de> wrote:
> Khem Raj <raj.khem@gmail.com> writes:
>
>> Can you check what does gcc emits in an assembly file when using
>> -mcpu=3Dcortex-m3 in your case. If it emits sdiv instruction or not
>>
>> int foo (long a, long b)
>> {
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 return a/b;
>> }
>
> $ arm-linux-uclibceabi-gcc -mthumb -mcpu=3Dcortex-m3 -mfpu=3Dvfp -mfloat-=
abi=3Dsoftfp -O1 -c x.c
> $ arm-linux-uclibceabi-objdump -d x.o
> 00000000 <foo>:
> =C2=A0 0: =C2=A0 fb90 f0f1 =C2=A0 =C2=A0 =C2=A0 sdiv =C2=A0 =C2=A0r0, r0,=
 r1
> =C2=A0 4: =C2=A0 4770 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bx =C2=A0 =
=C2=A0 =C2=A0lr
> =C2=A0 6: =C2=A0 bf00 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nop
>
>

thx

>
> Enrico
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


