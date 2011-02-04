Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PlQ51-0003ic-3Z
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Feb 2011 19:08:23 +0100
Received: by gyd8 with SMTP id 8so1053759gyd.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Feb 2011 10:07:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=ktwyjosgK8QxnYy01PZxksdF29Aiyn1k2Jj8ny8y1RM=;
	b=d9BrFHl3zc1eVNWi1/96XDxI36++HU2uOBc0n3VLJvcURRtfgng6YkxdjIvpmr9Wgc
	Ed6xVrEn5pOqRzyHx9gqwvA1UVwmX/mfc1VhGi6a8q6zStdnH6/xzXOuoD6c3N3wlewp
	XmAnKWOMWR3rR/+8XS6y5si6gkpTmXpdTeNc4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=cUY2WuXWiOOQqV2twEz3ABxXIWAzteeKI3+I33XFN3b92UZwb5fqPzl1rwpd913xcT
	NuV0ukHK+2c71BvKFdamv1xU3xu+PbotHgdciqBYFZ9m7IbFTy5pc06iCdBhhpKW8VWm
	jdyEVhr2nxURS9BArSCkpdPqB15zJ0q8K0pA8=
Received: by 10.90.84.2 with SMTP id h2mr5678384agb.7.1296842844536; Fri, 04
	Feb 2011 10:07:24 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.32.12 with HTTP; Fri, 4 Feb 2011 10:07:04 -0800 (PST)
In-Reply-To: <4D4C1986.8090908@dresearch.de>
References: <AANLkTi=QkexH5odXt9-6a9SFe=hhyv=tsiBXOhHt-u9p@mail.gmail.com>
	<4D4C1986.8090908@dresearch.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 4 Feb 2011 10:07:04 -0800
Message-ID: <AANLkTim9GhtKZHMbi_vdfcbM=PqSGuwVGf68i03DDKfE@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: testing branch 2011-02-03
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
X-List-Received-Date: Fri, 04 Feb 2011 18:08:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 4, 2011 at 7:21 AM, Steffen Sledz <sledz@dresearch.de> wrote:
> On 02/04/2011 02:08 PM, Cliff Brake wrote:
>> master has been merged to testing-next and is ready for clean builds.
>
> My first try with the new branch and minimal-image failed configuring lib=
tool-native-2.2.6b-r28.1 with a perl version mismatch error (see attached l=
og). :(
>
> Build Configuration:
> BB_VERSION =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "1.10.2"
> METADATA_BRANCH =C2=A0 =3D "testing-next"
> METADATA_REVISION =3D "f06b04c"
> TARGET_ARCH =C2=A0 =C2=A0 =C2=A0 =3D "arm"
> TARGET_OS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "linux-gnueabi"
> MACHINE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "hipox"
> DISTRO =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "angstrom"
> DISTRO_VERSION =C2=A0 =C2=A0=3D "2010.7-test-20110204"
> TARGET_FPU =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "soft"
>
> openSUSE 11.3 32-bit

I wonder for angstrom-2010 we use libtool 2.4 how come you end up with 2.2 =
?

>
> Steffen
>
> PS: Unfortunately oe-stats did not mentioned the problem and stayed in st=
atus "Started".
>

its down.

>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


