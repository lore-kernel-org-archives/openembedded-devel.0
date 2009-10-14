Received: from [209.85.219.210] (helo=mail-ew0-f210.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1My7Fy-0000G2-I6
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Oct 2009 19:03:25 +0200
Received: by ewy6 with SMTP id 6so2847308ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Oct 2009 10:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=Ou1AeNvRBHOO9mDfImrfRWat4EkSYXTNdfuE/6PzNhk=;
	b=lJKstz8WX7pliHw37kgcH0kXxy+wKlakQT+XPxDTGGCQQiFyLHo7kZVSy4F9/ODnwr
	xETtJs36neZ6oH0PFXsjXfR/NCFB1ZkFBfLMW7TOfh2hGu4VmtXSUrWC0/coqytSjs5s
	AoyWZNWTDoaVHIQr2+03496JcxJmNMedlkumE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=tI9KUaKszz5NNKL88n1UtaeKPVwBi4tM+Nn2swlAZdJKZavRvK8Tl/pw/r3HPmugDu
	aH61NaqxQR+n8sMGkHWXHkCvln1c4QJzKKj51IYGBMzk91jWuMV9ayTtQeNJglA9QZLg
	2HkEVGxX34Hyxml4Hk10NJ7IQii/1tL9zMXzw=
MIME-Version: 1.0
Received: by 10.211.131.12 with SMTP id i12mr7681036ebn.97.1255539747233; Wed, 
	14 Oct 2009 10:02:27 -0700 (PDT)
In-Reply-To: <200910141652.11828.holger+oe@freyther.de>
References: <200910141652.11828.holger+oe@freyther.de>
Date: Wed, 14 Oct 2009 10:02:27 -0700
Message-ID: <19c1b8a90910141002u4c4b8797h120c87965b4ef94c@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.219.210
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: What is the state of the gcc, binutils and libc6-dev 	packages?
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
X-List-Received-Date: Wed, 14 Oct 2009 17:03:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2009 at 7:52 AM, Holger Hans Peter Freyther
<holger+oe@freyther.de> wrote:
> Hey,
>
> one short question has anyone recently tried to build and install a
> "toolchain" on the device? I'm asking because even after installing gcc,
> bintuils, cpp, libc6-dev and the -symlinks packages I have problems like:
>
> gcc searching in /usr/lib/gcc/BUILD_SYSTEM/4.4.1/include for header files=
 and
> compile failing =C2=A0because stuf flike stddef, stdargs.h can not be fou=
nd.
>
> After cheating it fails that a simple program can not be linked because o=
f
> undefined references to __libc_csu_init and _fini.
>
>
> Is this because I'm on x86_64 and try to build for i686 or can you guys s=
ee
> that on ARM and other targets too?

I tried gcc 4.4.1 + binutils 2.19.51 + eglibc 2.10 + x86_64 build
machine couple of weeks back.
and it worked well for arm/uclibc

>
> z.
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


