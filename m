Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PuBYm-0008TC-5A
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Feb 2011 23:27:20 +0100
Received: by fxm8 with SMTP id 8so4037687fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Feb 2011 14:25:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=j3O/KodsAK2oydYYxydJ5EODSK548A1EVpqBgBHLvoc=;
	b=CmM5/nF0pb7RDjVLupngRByoG3XI/r0LeHPVtw05lqjYdl9GmRuiSJrldHJ0SYIMwD
	JqjRsJzKYdXV4wI0drUp4v9tWoQRcUF4KOjdGA0OGe+JlzPYtYPKRHUbIfhza/ZQpoC2
	V3lv5BeR9/OBuUwwTSxxId7oQbeN2qAylptQA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=Jd5TS6N0JlNBKUmJjMbp6KnoL585XOoVUIJNk4WuD52qSf2p1ntcF6UiZDyIdHN4HX
	at5cuwamv0xMXm+2kz+CB+uUVCtXPomr1CO0JBjcgxWJcWxep1NwEJ6LoUBHDRbqZFPW
	hvX6Cy5myXDED/W8KsRUHJrSyvjYCRZPw3lqU=
Received: by 10.223.52.90 with SMTP id h26mr3375693fag.58.1298931955054; Mon,
	28 Feb 2011 14:25:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.30.151 with HTTP; Mon, 28 Feb 2011 14:25:35 -0800 (PST)
In-Reply-To: <1298877390-18656-1-git-send-email-stefan@buglabs.net>
References: <1298877390-18656-1-git-send-email-stefan@buglabs.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 28 Feb 2011 14:25:35 -0800
Message-ID: <AANLkTi=42GYs5SMsw=PGZXTcPBL3yV_u_deKK7MaDZNs@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Stefan Schmidt <stefan@buglabs.net>
Subject: Re: [PATCH] llvm.inc: Empty TOOLCHAIN_OPTIONS to fix the build.
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
X-List-Received-Date: Mon, 28 Feb 2011 22:27:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 27, 2011 at 11:16 PM, Stefan Schmidt <stefan@buglabs.net> wrote=
:
> This fixes a problem introduced by ebd905685a339814c36bf658a8e58bf8f457f1=
4e
>
> Signed-off-by: Stefan Schmidt <stefan@buglabs.net>

Acked-by: Khem Raj <raj.khem@gmail.com>

>
> ---
> =C2=A0recipes/llvm/llvm.inc | =C2=A0 =C2=A02 ++
> =C2=A01 files changed, 2 insertions(+), 0 deletions(-)
>
> diff --git a/recipes/llvm/llvm.inc b/recipes/llvm/llvm.inc
> index 03ff61d..b53af6e 100644
> --- a/recipes/llvm/llvm.inc
> +++ b/recipes/llvm/llvm.inc
> @@ -60,6 +60,8 @@ EXTRA_OECMAKE =3D "\
> =C2=A0 -DCMAKE_BUILD_TYPE:STRING=3DRelWithDebInfo \
> =C2=A0 -DBUILD_SHARED_LIBS:BOOL=3DON \
> =C2=A0"
> +# We need to reset this to avoid breakage as we build out of tree
> +TOOLCHAIN_OPTIONS =3D ""
>
> =C2=A0PACKAGES =3D "${PN} ${PN}-dev ${PN}-dbg ${PN}-doc"
>
> --
> 1.7.4.1
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


