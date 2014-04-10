Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id 55D7B65E8B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Apr 2014 18:25:41 +0000 (UTC)
Received: by mail-ig0-f175.google.com with SMTP id ur14so8138726igb.14
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Apr 2014 11:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=atVEqEXosjFipz2rAkeUKPbrXryZZk+/bZNGeiUoaCE=;
	b=XnPXsQ1yZWxIadH+lQlyHOD9BGa6xI8qZKyUUKTvAf+pZ0CYjXEGj1ZdDGSbPBZiOm
	JiM3Kxk7gFfE7j10yNOEzzZ7urhrWf6l8goR7I/ofCEr3PfhZJussON+UXFEeuU0abda
	n9gCnFzBdMjtsqOS8IkvfALlznNwJPUmRXehLK4LqRhUUVxlfS/bAF0bqynrbS5s7DPo
	YMek0h7/OongSFLXQfvjr5ATtl53JZrXYdC2y/OSwZv/4q4wzRrBl/jMp8LOMnHhxL3C
	nIC4vqjuNplW/l1kh5qooXQh5r/zPmw4VGR1jB83Ac+5i/ueVxTusONSSTjXnT9s9Jb7
	ztDQ==
X-Received: by 10.50.78.201 with SMTP id d9mr12467481igx.17.1397154342547;
	Thu, 10 Apr 2014 11:25:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.229.14 with HTTP; Thu, 10 Apr 2014 11:25:12 -0700 (PDT)
In-Reply-To: <8276133.bJdqlryXOd@koontz>
References: <8276133.bJdqlryXOd@koontz>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 10 Apr 2014 11:25:12 -0700
Message-ID: <CAMKF1soK2LzuAwC9ZetkDRruuSn7nc3SWz_WsTBTeaiJzRWXPw@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] wvstreams: Set optimization to -O0 to avoid breaking stack protection.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 10 Apr 2014 18:25:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 10, 2014 at 2:13 AM, S=C3=B8ren Holm <sgh@sgh.dk> wrote:
> A description of the bug is here :
> See https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D674006
> ---
>  meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb b/met=
a-
> oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
> index ce2b337..869402b 100644
> --- a/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
> +++ b/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
> @@ -19,6 +19,8 @@ SRC_URI[sha256sum] =3D
> "8403f5fbf83aa9ac0c6ce15d97fd85607488152aa84e007b7d0621b8eb
>  inherit autotools pkgconfig
>
>  PARALLEL_MAKE =3D ""
> +TARGET_CFLAGS_append =3D " -O0"
> +TARGET_CXXFLAGS_append =3D " -O0"
>

Disabling optimizations all the way is probably a bad idea. As
suggested in the bugs can you just disable
few of optimizations like

TARGET_CFLAGS +=3D "-fno-tree-dce -fno-optimize-sibling-calls"
TARGET_CXXFLAGS +=3D "-fno-tree-dce -fno-optimize-sibling-calls"

>  LDFLAGS_append =3D " -Wl,-rpath-link,${CROSS_DIR}/${TARGET_SYS}/lib"
>
> --
> 1.9.1
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

