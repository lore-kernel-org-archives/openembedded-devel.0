Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PD8jQ-0002Df-K9
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Nov 2010 05:44:36 +0100
Received: by gyf3 with SMTP id 3so3928213gyf.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Nov 2010 21:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=MJ8N2MgusXvUih6PX/mLCCNtb0NKTwDjYhQnwL1p2Lc=;
	b=SA0B239sYLLMSa13/cwYY5UIMQQUQFAUOG1O9j6dz97soXbVsT95v6iECLx886Tioj
	3sOngygJZ+DDcBN/EZccd3fYHzrJG8CDXoxIW/xvhHXE6XDf8pegywbZ/lrjiqpVJHnf
	7r00R+TR0FU4QzUxrUUfr7b47SM8byjLwNt0s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=t0WLP6LKkdwJuv5AcvanzKcih8zx0lUhXBYUeWmLhvuYJLp1Q5vAYeXWVWSavFlkcw
	lyN0hMCQ8oY0DCZO0oelebJicYOXFmGdkuul52WsyBpVewtKDohA0/PLNLmUs0yvpVcr
	THkRjtNfz/8L1jF0pjtrNS5pPQTaZHf+z2BwU=
Received: by 10.91.27.32 with SMTP id e32mr823472agj.37.1288673010889; Mon, 01
	Nov 2010 21:43:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.91.135.18 with HTTP; Mon, 1 Nov 2010 21:43:10 -0700 (PDT)
In-Reply-To: <4CCF64BD.4090500@gmail.com>
References: <4CCF64BD.4090500@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 1 Nov 2010 21:43:10 -0700
Message-ID: <AANLkTi=s_Y6MVx9cVtqHyp5hfgJz9i=UdpoVb-4OhtyN@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] python-cython_0.13.bb: Add python-native to DEPENDS.
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
X-List-Received-Date: Tue, 02 Nov 2010 04:44:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 1, 2010 at 6:09 PM, Graham Gower <graham.gower@gmail.com> wrote=
:
>
> /mnt/oe/tmp/work/x86_64-linux/python-cython-native-0.13-r0/temp/run.do_co=
mpile.28826: line 927: /mnt/oe/tmp/sysroots/x86_64-linux/usr/bin/python: No=
 such file or directory
> FATAL: python setup.py build_ext execution failed.

hmmm what happens if you just add python to DEPENDS instead of python-nativ=
e ?

>
> Signed-off-by: Graham Gower <graham.gower@gmail.com>
> ---
> =C2=A0recipes/python/python-cython_0.13.bb | =C2=A0 =C2=A01 +
> =C2=A01 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/recipes/python/python-cython_0.13.bb b/recipes/python/python=
-cython_0.13.bb
> index 61ad718..4e0411d 100644
> --- a/recipes/python/python-cython_0.13.bb
> +++ b/recipes/python/python-cython_0.13.bb
> @@ -7,6 +7,7 @@ LICENSE =3D "GPL"
> =C2=A0SRCNAME =3D "Cython"
> =C2=A0BBCLASSEXTEND =3D "native"
> =C2=A0NATIVE_INSTALL_WORKS =3D "1"
> +DEPENDS =3D "python-native"
>
> =C2=A0SRC_URI =3D "http://www.cython.org/release/${SRCNAME}-${PV}.tar.gz"
> =C2=A0S =3D "${WORKDIR}/${SRCNAME}-${PV}"
> --
> 1.7.1
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


