Received: from mail-lpp01m020-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RsgGw-0002pr-Lh
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Feb 2012 20:55:14 +0100
Received: by lbol12 with SMTP id l12so237647lbo.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Feb 2012 11:47:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=LEH/vNtucuEhuw6a+ZzK30bdbmsY3/QtIygGvkl/AmM=;
	b=B1co6aGh08y7DNvdr8zCZ+i4sSkwo1I8P1dBGA6PddI/iOSM/N+VqdSVxKOVyy11tM
	M1YqTwTjqHuvwYcwWMeIcR2IbyDBU4I9adRt6TGcny+LLY6D8GzJohj6SW6XjZ84OHsi
	0ckuL5ST/UVDqltDNAqC4cV7p3kTeBJr0CkCg=
Received: by 10.112.86.67 with SMTP id n3mr6994288lbz.29.1328125639292; Wed,
	01 Feb 2012 11:47:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.5.201 with HTTP; Wed, 1 Feb 2012 11:46:49 -0800 (PST)
In-Reply-To: <CANLRtZyE_ctYhoJmZd5KUJt70SG=ZU7T1TJCF12viQQgSM063Q@mail.gmail.com>
References: <4F291A06.4000406@gmail.com>
	<CAMKF1so7cMo0qiOPLuJrpk7kNuyk3dYEEZpM8nSGFKXMuUdoGQ@mail.gmail.com>
	<CANLRtZyE_ctYhoJmZd5KUJt70SG=ZU7T1TJCF12viQQgSM063Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 1 Feb 2012 11:46:49 -0800
Message-ID: <CAMKF1spUMxnuVGb8zw8LM3m5bdUq1tTV74SwjUD8yL0FXysGdg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Can't build openembedded: fail in picosam9_git.bb
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
X-List-Received-Date: Wed, 01 Feb 2012 19:55:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2012/2/1 Leonid Titov <leonid.titov@gmail.com>:
> I do have a conf/machine/picosam9.conf. It and recipe are exact as in
> repo (http://cgit.openembedded.org/openembedded/tree/conf/machine/picosam=
9.conf
> and http://cgit.openembedded.org/openembedded/tree/recipes/linux/picosam9=
_git.bb).
>

in picosam9_git.bb you have


COMPATIBLE_HOST =3D "arm.*-linux"

make it

COMPATIBLE_HOST =3D "arm.*-linux*"

that said your problem is with fetching and I have seen
problems with fetching from gitorious using bitbake
It happens for efikamx kernel which was also hosted on
gitorious. Is there any other place this repo is mirrored ?
if yes use that.

> 2012/2/1, Khem Raj <raj.khem@gmail.com>:
>> 2012/2/1 Leonid Titov <leonid.titov@gmail.com>:
>>> I've got a problem with building console-image for MACHINE=3Dpicosam9. =
It
>>> fails while processing picosam9_git.bb with these messages:
>>
>> do you have machine conf file for picosam9 ?
>> recipes and machine confs =C2=A0are different files.
>> you have to show us both files here. That said
>> your error is a fetching error which means something
>> is wrong with either your SRC_URI or the remote server
>> which is feeding the sources of this recipe
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
>
> --
> =D0=A1 =D1=83=D0=B2=D0=B0=D0=B6=D0=B5=D0=BD=D0=B8=D0=B5=D0=BC,
> =C2=A0=D0=9B=D0=B5=D0=BE=D0=BD=D0=B8=D0=B4.
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


