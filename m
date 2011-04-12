Received: from mail-px0-f178.google.com ([209.85.212.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1Q9mm1-0002EM-7G
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Apr 2011 01:13:32 +0200
Received: by pxi1 with SMTP id 1so41748pxi.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Apr 2011 16:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=VGj22f5Kl6KKINBJbvBaT68fSfqu1Qnt9mtcsbNeheY=;
	b=UwbcjCpimTUwK1rBCpWsq5NJcAIVmxhxCL7mIwV3jeXs+Zq7NT8Hl36HpVyxEnrG9s
	Q6jqEScYvTEjBBkbC4g00M38HkcvbeIUV49KGg7wriR2tKYRrULqeDAC3an5cqLJKbWC
	i5ge/BZ3kNVUqYpLcuHhzBqYRVB0Bn+gl8nUw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=gSRDN/e8qj7fjBDPAWYTp85SHCY9uxujxJk1iH1aCBNopSGu4IahB2vwd5Vex8jR1L
	m12CV+g/SGYJFjfF3xz0xM2gBbHEQqfO8fnMndnkH7Zjme8TkU2CoDE3to2b9uLm+DoR
	Ba4NpsUZFhEQv3ktPg3UJ1b7PxQeTgVe/kN9U=
MIME-Version: 1.0
Received: by 10.142.166.13 with SMTP id o13mr2778586wfe.171.1302649869783;
	Tue, 12 Apr 2011 16:11:09 -0700 (PDT)
Received: by 10.142.237.11 with HTTP; Tue, 12 Apr 2011 16:11:09 -0700 (PDT)
In-Reply-To: <1301955176-14829-1-git-send-email-ynezz@true.cz>
References: <1301955176-14829-1-git-send-email-ynezz@true.cz>
Date: Wed, 13 Apr 2011 01:11:09 +0200
Message-ID: <BANLkTim3y5mBwn6Qhfy754Oreioz93xQBw@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH RFC] modutils-initscripts: fix wrong order of module loading happening in udev
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
X-List-Received-Date: Tue, 12 Apr 2011 23:13:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

> Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
> ---
> =C2=A0recipes/modutils/modutils-initscripts.bb | =C2=A0 =C2=A04 ++--
> =C2=A01 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes/modutils/modutils-initscripts.bb b/recipes/modutils/=
modutils-initscripts.bb
> index 07f4810..797acb3 100644
> --- a/recipes/modutils/modutils-initscripts.bb
> +++ b/recipes/modutils/modutils-initscripts.bb
> @@ -2,10 +2,10 @@ SECTION =3D "base"
> =C2=A0DESCRIPTION =3D "modutils configuration files"
> =C2=A0LICENSE =3D "PD"
> =C2=A0SRC_URI =3D "file://modutils.sh"
> -PR =3D "r3"
> +PR =3D "r4"
>
> =C2=A0INITSCRIPT_NAME =3D "modutils.sh"
> -INITSCRIPT_PARAMS =3D "start 20 S ."
> +INITSCRIPT_PARAMS =3D "start 2 S ."
>
> =C2=A0inherit update-rc.d
>
> --
> 1.7.1

I tested that on minimal-image and on my c7x0 machine it helps.
Just to be sure, I moved udev to 04 after 03 sysfs.

I'll do further tests on current images.

Regards

Andrea


