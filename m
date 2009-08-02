Received: from [209.85.221.197] (helo=mail-qy0-f197.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1MXgHC-0006Gx-AG
	for openembedded-devel@lists.openembedded.org;
	Sun, 02 Aug 2009 20:59:22 +0200
Received: by qyk35 with SMTP id 35so3709119qyk.24
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 02 Aug 2009 11:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:from:date:x-google-sender-auth:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=FUuCWG6PKu1xiQMl0da5zChNjiaziLTi6sQDJO6EVyE=;
	b=qvJeGv0ugahNBmdQCIF8EclZz3ladT3kk6xyQeOCl44xEm3Yjy8CK1Nomx91bpTq9Q
	aoNIxPRfd3pz6VcESYXNsH04pZ2FGhYqieO2Ibvo2CGWqDobXy1AVWoQ2BHm9+VG47l4
	Ox69ubHHiSJ/mJFPz46OoqqripLTgD3t7GiJk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	b=a5GgAEScoShpCKmKmcIXvebKUwlJ8By7NBzLV8Hi4oWlEen/uDA2c1fe73pizhbsTn
	qTxO65t712jQ1M5U1oJMPBfrxNrJFxpefpGhFM4M8Y8I7Fb0+OdHNbQVFQwNmhyN0RYa
	ByDKsXc6gs3FZ3Zc/QwLvCrXvdM79zWD5p3zI=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.96.15 with SMTP id f15mr906117qcn.91.1249238639089; Sun, 
	02 Aug 2009 11:43:59 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.00.0908021414100.8299@localhost>
References: <alpine.LFD.2.00.0908021414100.8299@localhost>
From: Chris Larson <clarson@kergoth.com>
Date: Sun, 2 Aug 2009 11:43:39 -0700
X-Google-Sender-Auth: 573496ee0bab657d
Message-ID: <b6ebd0a50908021143o515821eaoa78f065043e6a2bf@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: "bitbake -c fetch" and bluez4 warnings?
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
X-List-Received-Date: Sun, 02 Aug 2009 18:59:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

-c fetch does the fetch on the providers you request it be run on, and
only those.  base-image has no sources to fetch, so it does nothing.
If you want to fetch for not just what you're requesting, but its
dependencies as well, then you want to use -c fetchall.

On Sun, Aug 2, 2009 at 11:18 AM, Robert P. J. Day<rpjday@crashcourse.ca> wr=
ote:
>
> =C2=A0probably simple answers to these questions, but ...
>
> 1) after setting up for angstrom for beagleboard, i wanted to
> pre-fetch all necessary packages so i ran
>
> =C2=A0$ bitbake -c fetch base-image
>
> didn't notice anything downloaded, but when i ran
>
> =C2=A0$ bitbake base-image
>
> the build was interrupted several times by a package download. =C2=A0isn'=
t
> "-c fetch" the command option to do pre-fetching of all necessary
> packages?
>
>
> 2)
>
> Parsing .bb files, please wait...NOTE: Angstrom DOES NOT support
> bluez-libs because bluez-libs 3.x has been replaced by bluez4
> NOTE: Angstrom DOES NOT support bluez-libs because bluez-libs 3.x has
> been replaced by bluez4
> NOTE: Angstrom DOES NOT support bluez-libs because bluez-libs 3.x has
> been replaced by bluez4
> NOTE: Angstrom DOES NOT support bluez-utils because bluez-utils 3.x
> has been replaced by bluez4
> NOTE: Angstrom DOES NOT support bluez-utils because bluez-utils 3.x
> has been replaced by bluez4
> done.
>
> =C2=A0i'm not sure what i'm supposed to take away from the above. =C2=A0i
> *have* the bluez4 tarballs in my downloads directory. =C2=A0is that just =
a
> FYI warning? =C2=A0a sign of a problem? =C2=A0what? =C2=A0it doesn't seem=
 like i need
> to do anything about it. =C2=A0or do i?
>
> =C2=A0thanks.
>
> rday
> --
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Robert P. J. Day =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Waterloo, Ontario, CANADA
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0Linux Consulting, Training and Annoying Kernel=
 Pedantry.
>
> Web page: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0http://crashcourse.ca
> Twitter: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 http:=
//twitter.com/rpjday
> "Kernel Newbie Corner" column @ linux.com: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0http://cli.gs/WG6WYX
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



--=20
Chris Larson
clarson at kergoth dot com
clarson at mvista dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Software Engineer
MontaVista Software, Inc.


