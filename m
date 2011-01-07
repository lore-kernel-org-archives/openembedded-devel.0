Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PbB9D-0007ll-8f
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 Jan 2011 13:10:23 +0100
Received: by iyj18 with SMTP id 18so16506857iyj.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Jan 2011 04:09:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=9sqsVXL7djpjREZ17Y1ATagRUa0wsHkstyxoTY53XQA=;
	b=iKKNoYGFHUy0RpLn0RrFvHhK8CdDYofbahmd8Zfu7vFEtWedG4v5KrapoF/DRNlnGB
	DzBXMjN0XaOVxhdQqzUhaI4DXsA/UN0h2ZqpTgKDhgNH2JQICib7pA+rdiPBjxbzweVC
	Uy6a0Y24vAZmhU4yCfLHs/IAH0DsTg3Vx4jV0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Vmnb0IHIfYn43dE8vJvxVNpBraWE9uAdJcflapwlbsmrgsX5p0398r9gbmlLMynzWh
	Tnz9JoceusgBX/d/EN26LYXoyGJWQmWwoD2XH8Tfa74DEgyipP87oP2UGr0+AVO4vR0z
	NjW2vGX4EragRwGuPIo00Jb/2ZdyroH7UNYdE=
MIME-Version: 1.0
Received: by 10.231.14.74 with SMTP id f10mr25882468iba.119.1294402196147;
	Fri, 07 Jan 2011 04:09:56 -0800 (PST)
Received: by 10.231.38.11 with HTTP; Fri, 7 Jan 2011 04:09:56 -0800 (PST)
In-Reply-To: <AANLkTi=a1GNU=DmsOWGUUxTfGLEdQwDNrK5PERB7+8m9@mail.gmail.com>
References: <1294393157-25680-1-git-send-email-raj.khem@gmail.com>
	<AANLkTi=a1GNU=DmsOWGUUxTfGLEdQwDNrK5PERB7+8m9@mail.gmail.com>
Date: Fri, 7 Jan 2011 13:09:56 +0100
Message-ID: <AANLkTi=dLccmjWEWxCf79s8CXmHH0wGjZqOhgzzmpC1T@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] slugos: Dont install ldconfig
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
X-List-Received-Date: Fri, 07 Jan 2011 12:10:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2011/1/7 Leon Woestenberg <leon.woestenberg@gmail.com>:
> On Fri, Jan 7, 2011 at 10:39 AM, Khem Raj <raj.khem@gmail.com> wrote:
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>> =A0conf/distro/slugos.conf | =A0 =A03 ++-
>> =A01 files changed, 2 insertions(+), 1 deletions(-)
>>
>> diff --git a/conf/distro/slugos.conf b/conf/distro/slugos.conf
>> index 7fb6d1c..e2e7cc0 100644
>> --- a/conf/distro/slugos.conf
>> +++ b/conf/distro/slugos.conf
>> @@ -15,7 +15,8 @@ IPKG_VARIANT ?=3D "opkg-nogpg-nocurl-slugos"
>> =A0PREFERRED_PROVIDER_opkg ?=3D "opkg-nogpg-nocurl-slugos"
>> =A0PREFERRED_PROVIDER_virtual/update-alternatives ?=3D "opkg-nogpg-nocur=
l-slugos"
>> =A0IMAGE_INITSCRIPTS ?=3D "initscripts-slugos"
>> -
>> +# Disable installing ldconfig
>> +USE_LDCONFIG =3D "0"
>> =A0require conf/distro/include/slugos.inc
>> =A0require conf/distro/include/sane-toolchain.inc
>> =A0require conf/distro/include/arm-thumb.inc
>> --
>
> Acked-by: Leon Woestenberg <leon@sidebranch.com>

Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
>
>
> --
> Leon
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


