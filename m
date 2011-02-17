Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Pq7v7-0001oD-F8
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Feb 2011 18:45:37 +0100
Received: by fxm17 with SMTP id 17so2699808fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Feb 2011 09:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=4GsDXSFTRVTe2CH5d4G6PmnazZ+qdcDIPzL0FJBfcs4=;
	b=aHXjrIXSv7VeKttyGSmFehbUpfkNTPRiJ+09/4QEdSluO0icQJFKdUTG3/CwLdI+nL
	q+xb4gvQQudv6zPrpwq6FV05L+E00MpUNEZ/dkDX/jYlmpuckL0Zv2JHLJrEYejxwQ8Q
	z8gudurlcFTkALo+U2WXK+tJQr4kbnymAQk9s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=cNpLuwgMWnj+9OOErL+Kb9zClQoSQlIHMqIWsnYd53P4pTyTao0C8VijilVPSD5zcF
	qMD+CyP/twBhQ5uFWPoE+hz4ldD63Ejxa8o8+eoKKiNDjOeKcdwWIaoCMmtBnN9E567P
	g+fv18Nm07SnxcgFuatMdjvZl2ojV/CtyqY1Q=
Received: by 10.223.86.2 with SMTP id q2mr2723121fal.139.1297964661306; Thu,
	17 Feb 2011 09:44:21 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.66.22 with HTTP; Thu, 17 Feb 2011 09:43:59 -0800 (PST)
In-Reply-To: <201102171808.51219.schnitzeltony@gmx.de>
References: <201102170226.53460.schnitzeltony@gmx.de>
	<AANLkTinefnq9o6Ygep829mGNOjeXqVMsn1hO_c8zXcRk@mail.gmail.com>
	<201102171342.16551.schnitzeltony@gmx.de>
	<201102171808.51219.schnitzeltony@gmx.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 17 Feb 2011 09:43:59 -0800
Message-ID: <AANLkTinnk3DuqiqUAQJoRKSsHa0HjzrN5n0VD6SxnqPE@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: QA RPATH error for c++ packages?
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
X-List-Received-Date: Thu, 17 Feb 2011 17:45:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 17, 2011 at 9:08 AM, Andreas Mueller <schnitzeltony@gmx.de> wro=
te:
> @Khem forget the last mail - sorry
>
> My guess is still that the QA RPATH error is caused by some generic probl=
em with
> c++ sources / libstdc++ - independent of clutter-box2d or other recipes
> meantioned before. Hints on this are

Yes it could be since gcc is not using libtool 2.4 and so libstdc++ la
files will not encode the
sysroot syntax and that could cause rpath to resolve to absolute sysroot di=
r

>
> 1. =C2=A0ALL packages which have sysroot path for 'libstdc++.la' in '.lib=
s/*.lai
> have a QA RPATH error!
>
> 2. In '/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/libstdc++.la' I fi=
nd
>
> | # Directory that this library needs to be installed in:
> | libdir=3D/home/Superandi/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr=
/lib
>
> 3. So (don't kill me) I modified =C2=A0'/sysroots/armv7a-angstrom-linux-
> gnueabi/usr/lib/libstdc++.la' to
>
> | # Directory that this library needs to be installed in:
> | libdir=3D/usr/lib
>
> And rebuild some of the QA RPATH candidates mentioned before
>
> clutter-box2d
> aspell
> enchant
>
> WITHOUT QA ERRORS!!
>
> To me it seems as matter of gcc ( in my case 4.3.3 )
>
> | TARGET_ARCH =C2=A0 =C2=A0 =C2=A0 =3D "arm"
> | TARGET_OS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "linux-gnueabi"
> | MACHINE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "overo"
> | DISTRO =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "angstrom"
> | DISTRO_VERSION =C2=A0 =C2=A0=3D "2010.7-test-20110217"
>
> What do you think?
>
> Andreas
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


