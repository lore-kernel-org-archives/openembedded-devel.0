Received: from mail-iw0-f203.google.com ([209.85.223.203])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NY5H2-00087r-LW
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Jan 2010 23:13:11 +0100
Received: by iwn41 with SMTP id 41so428375iwn.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jan 2010 14:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=j4m4Oj6N5fhJRbM79Xe5lkmA1bjxvUyKkMpWNLRNK48=;
	b=LbzU8+BbVQwvw/W6ZB3+Tj1TdDFnWhVXpwqbZdVB2X069+USFY5Z3yJ1JKa4Y7YY61
	nVk58ZqMctyVHn8wjWDmNpl2f3yT05cubt0O7WuNoHJ/YL1Sk8LAkFDPb9hEl2uDI4gs
	DoE+hREtcZOoboCpxpq0qfI9oFXxJNHW1ADyc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=SdGTRBfZ4NsIQUnlZC74gJSIZzTJiyUhSgUZGEPIcYlYL3TIWHVdJt1iCdeN19M2ZE
	VeFU7tPuTZkSGrblkTJO555dr1YGruvZTkB0k+yzrmPvl/99inI1U3iakNAoMnPYT5Jd
	AEsYj4fMgTG7ZdVlL19ysXeg3eW4udCKmBJw8=
MIME-Version: 1.0
Received: by 10.231.146.196 with SMTP id i4mr3296545ibv.68.1264111850907; Thu, 
	21 Jan 2010 14:10:50 -0800 (PST)
In-Reply-To: <op.u6vw72i1mn1qzu@guohr-laptop-ubuntu>
References: <op.u6vw72i1mn1qzu@guohr-laptop-ubuntu>
Date: Thu, 21 Jan 2010 14:10:50 -0800
Message-ID: <19c1b8a91001211410y19908564h7fe9aca3f81317ab@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.203
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: I realy think we should upgrade PREFERRED_VERSION_glibc to 2.9 in conf/distro/include/sane-toolchain.inc
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
X-List-Received-Date: Thu, 21 Jan 2010 22:13:12 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 21, 2010 at 5:32 AM, Guo Hongruan <camelguo@gmail.com> wrote:
> Hi guys,
> =A0I think we should upgrade PREFERRED_VERSION_glibc from 2.6 to 2.9 in
> conf/distro/include/sane-toolchain.inc. The reasons are:
>
> 1. Most of distributions have upgraded their preferred glibc to 2.9 long
> time ago.
> conf/distro/angstrom-2008.1.conf:PREFERRED_VERSION_glibc =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0?=3D
> "2.9"
> conf/distro/angstrom-2008.1.conf:PREFERRED_VERSION_glibc-initial =A0 =A0 =
=A0 =A0?=3D
> "2.9"
> conf/distro/jlime-2009.1.conf:PREFERRED_VERSION_glibc-initial =3D "2.9"
> conf/distro/jlime-2009.1.conf:PREFERRED_VERSION_glibc =3D "2.9"
> conf/distro/kaeilos.conf:PREFERRED_VERSION_glibc =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0?=3D "2.9"
> conf/distro/kaeilos.conf:PREFERRED_VERSION_glibc-initial =A0 =A0 =A0 =A0?=
=3D "2.9"
>
> from the above, you can get to know that most distributions have upgraded
> their preferred glibc to 2.9 from 2008 ago.
>
> Of course, there are still some distributions which uses old glibc. The o=
nly
> reason I guess is that we have not updated them for a long time. (for fro=
m
> tinderbox, you can get to know that these distributions have not been bui=
lt
> for a long time)
>
>
> 2. from tinderbox, you can see that the glibc-2.9 is well-tested, no
> glibc-2.6
> http://tinderbox.openembedded.net/packages/?name=3Dglibc&page=3D1
>
> from the above link, you can get to know that the glibc-2.9 not glibc-2.6=
.1
> has had most testing.
>
> 3. the last reason is that I have built some projects with glibc-2.6, unl=
ess
> with the old binutils, the glibc-2.6 always failed to build.
>
> So, I think it is the time to upgrade PREFERRED_VERSION_glibc to 2.9 in
> sane-toolchian.inc

Yes I am ok with this. Infact you could even use 2.10.1 now you are at it
and micro already did the change.

>
> --
> Guo Hongruan, Embedded Linux Consultant
> Skype: camelguo
> Twitter: camelguo
> http://www.gulessoft.com
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


