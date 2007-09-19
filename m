Received: from [212.27.42.27] (helo=smtp1-g19.free.fr)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <alain2210@free.fr>) id 1IXx9j-0002a5-K4
	for openembedded-devel@openembedded.org; Wed, 19 Sep 2007 12:51:43 +0200
Received: from smtp1-g19.free.fr (localhost.localdomain [127.0.0.1])
	by smtp1-g19.free.fr (Postfix) with ESMTP id D2C291AB2F3;
	Wed, 19 Sep 2007 12:47:54 +0200 (CEST)
Received: from imp8-g19.free.fr (imp8-g19.free.fr [212.27.42.39])
	by smtp1-g19.free.fr (Postfix) with ESMTP id BCF5C1AB2AB;
	Wed, 19 Sep 2007 12:47:54 +0200 (CEST)
Received: by imp8-g19.free.fr (Postfix, from userid 33)
	id B28D81160F; Wed, 19 Sep 2007 12:47:54 +0200 (CEST)
Received: from AMontsouris-151-1-21-58.w82-123.abo.wanadoo.fr
	(AMontsouris-151-1-21-58.w82-123.abo.wanadoo.fr [82.123.18.58])
	by imp.free.fr (IMP) with HTTP 
	for <alain2210@212.27.42.70>; Wed, 19 Sep 2007 12:47:54 +0200
Message-ID: <1190198874.46f0fe5a827d9@imp.free.fr>
Date: Wed, 19 Sep 2007 12:47:54 +0200
From: Alain2210 <alain2210@free.fr>
To: openembedded-devel@lists.openembedded.org,
	Koen Kooi <k.kooi@student.utwente.nl>
References: <1190138099.46f010f33252b@imp.free.fr>
	<46F01466.4080000@dominion.kabel.utwente.nl>
	<46F01DC6.6000503@student.utwente.nl>
	<1190151259.46f0445be87d7@imp.free.fr>
	<1190192138.46f0e40ab7964@imp.free.fr>
	<46F0F884.2040805@student.utwente.nl>
In-Reply-To: <46F0F884.2040805@student.utwente.nl>
MIME-Version: 1.0
User-Agent: Internet Messaging Program (IMP) 3.2.5
X-Originating-IP: 82.123.18.58
Cc: openembedded-devel@openembedded.org
Subject: Re: fortran and octave
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Sep 2007 10:51:43 -0000
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable

Hello,

> > With this patch and FORTRAN =3D ",fortran" in gcc_4.1.2.bb,
> > Building of gcc-cross__4.1.2.bb works and gfortran is working.
>
> Thanks for testing it! I made 2 commits that enable building and packag=
ing
> for (lib)gfortran.

Thanks. I will try them.

>
> > Now, I'm building octave.
>
> you need to have my second commit to get octave working on the device,
> because it wasn't
> getting packaged.
>
Before using it, I need to build it. But octave_2.1.71.bb does not compil=
e for
gcc 4.1 (and
probably above) :
http://lists.alioth.debian.org/pipermail/pkg-octave-devel/2006-March/0012=
46.html
It should be upgrade to octave_2.1.73. I have not build it but copying
octave_2.1.71.bb
to octave_2.9.14.bb I have build octave_2.9.14 (with a small problem with
qa_staging
and now ipk is void...).

Thanks,

Alain


