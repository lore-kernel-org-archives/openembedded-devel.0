Return-Path: <geoffhp@gmail.com>
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by mail.openembedded.org (Postfix) with ESMTP id C98A37E403
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 May 2019 16:34:02 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id y17so5549733lfe.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 May 2019 09:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=GiYMu+4Y44kIUEWb40UKaydXLH7pMqLWRdl4t4IbokU=;
	b=Xj8PVBz/btatB74KAHU0lOWnTv1oVQ0G7UtBzGDyCAMz+6tBV3pYpRhTAp9sdZrhr2
	W9ebnZ4CYmjhVqL/Rq5782B4pvfli3wWbG8pu90M/0eMzF85BErGk6K1LAI5Fby+vGxJ
	7fpnh9fB3gwiQDwujOk4rFFt7D664CWCfcOGgJzkYeYQPg9BCKOzh78bAV64LwdbUiG3
	Io7HOEnUy7X6BTkoOUyAAcoK364Ksgb/b+oXChi2wyXnR6zwRvILIw+94Ka8BVvpM6mO
	8V4i2QBRjh0FUvNwBY9y2H7snXO+VtV6ZOW9Sgf5vEYjXp6MouTIPSJfgfzG4+deaLf2
	CGTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=GiYMu+4Y44kIUEWb40UKaydXLH7pMqLWRdl4t4IbokU=;
	b=EagcjOm+G2C2wVNU8mT5OWhOksWYCPbhT1lvtypjj3QPpG16zz0MOjE81b0NCPDqd9
	HtYIJA1HdtpE2AR1WQr2vYQH6Odft2i0gsIiLgaMCGZkmsVQ/w3JgeM2UifZKwBSWRO0
	ULDXjbZrt/FPil/19fgv2KZd53iVqqdCFlaVhk3Ltp51MNTbXFPy+7ipXxmc7gGIbDKb
	YuC8pHS9vMBf9RBZv3s90K0Q35dLAntvOipQKWJITfZI+v4M9qmfBTB0F9MlgwHaOANQ
	pRnz+28jUv45t44MBpasYCsl7fK4cIsd6LQH2dgPoXwZ9zmawbOYBgY6CrURi166VmWY
	3b6w==
X-Gm-Message-State: APjAAAXxQGX7PxB1ZjQ9eE7pQw8RdGaVssBKTUx8GSAESTf4K5JyLbNu
	foYDZ8PSUjOUh9amXWI1AKi5fMMbtuCLnF1K8Iw=
X-Google-Smtp-Source: APXvYqw5ElU3kXI1B6RDuXUK21gvGeS7d2p/HVULN02lHNQ8UBPJPxCyiZ1cOLw/XQJNRnGGJSVJkQTUKcAf8tvHP18=
X-Received: by 2002:ac2:5383:: with SMTP id g3mr2674241lfh.107.1559234043009; 
	Thu, 30 May 2019 09:34:03 -0700 (PDT)
MIME-Version: 1.0
References: <CAHNuFGLy41mmeMnR2iRbJWYQSU9egnv9bNuF_hUoBhpUH7p+tQ@mail.gmail.com>
	<d8c5976a-9691-290d-fdec-4a8eedd90fb4@gmail.com>
In-Reply-To: <d8c5976a-9691-290d-fdec-4a8eedd90fb4@gmail.com>
From: Geoff Parker <geoffhp@gmail.com>
Date: Thu, 30 May 2019 09:33:51 -0700
Message-ID: <CAHNuFGKC2hd_14_s9J-JhPCX0__yYJAdD4bQrkdJwjHJAEa8EA@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-python][warrior] update python3-websockets from v4.0.1 to 5.0.1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 30 May 2019 16:34:03 -0000
Content-Type: text/plain; charset="UTF-8"

Thanks, I'm new to the patch process.  Do I just resubmit the same
patch, changing the e-mail subject header line from [warrior] to
[master] ?

On Thu, May 30, 2019 at 6:19 AM akuster808 <akuster808@gmail.com> wrote:
>
>
>
> On 5/29/19 11:13 AM, Geoff Parker wrote:
> > python3-websockets version 4.01 will throw this error
> > when used with Python 3.7.
> >
> >  File "/usr/lib/python3.7/site-packages/websockets/compatibility.py", line 15
> >    asyncio_ensure_future = asyncio.async           # Python < 3.5
> >                                        ^
> >    SyntaxError: invalid syntax
> >
> > This was fixed upstream in a commit applied 3 commits since the 4.0.1 tag.
>
> Fix needs to be in master first before any consideration for backport.
>
> - armin
> >
> >  https://github.com/aaugustin/websockets/commit/9f566c5d12eae1258aa6f1991fe8cf0a7d390f97
> >
> > Signed-off-by: Geoff Parker <geoffhp@gmail.com>
> > ---
> > ...ython3-websockets_4.0.1.bb => python3-websockets_5.0.1.bb} | 4 ++--
> > 1 file changed, 2 insertions(+), 2 deletions(-)
> > rename meta-python/recipes-devtools/python/{python3-websockets_4.0.1.bb
> > => python3-websockets_5.0.1.bb} (70%)
> >
> > diff --git a/meta-python/recipes-devtools/python/python3-websockets_4.0.1.bb
> > b/meta-python/recipes-devtools/python/python3-websockets_5.0.1.bb
> > similarity index 70%
> > rename from meta-python/recipes-devtools/python/python3-websockets_4.0.1.bb
> > rename to meta-python/recipes-devtools/python/python3-websockets_5.0.1.bb
> > index 414129c59..151dee2d5 100644
> > --- a/meta-python/recipes-devtools/python/python3-websockets_4.0.1.bb
> > +++ b/meta-python/recipes-devtools/python/python3-websockets_5.0.1.bb
> > @@ -6,8 +6,8 @@ LIC_FILES_CHKSUM =
> > "file://LICENSE;md5=5070256738c06d2e59adbec1f4057dac"
> >
> > inherit pypi setuptools3
> >
> > -SRC_URI[md5sum] = "9e8c6b3c70def4146d75fbb0f52bdfc7"
> > -SRC_URI[sha256sum] =
> > "da4d4fbe059b0453e726d6d993760065d69b823a27efc3040402a6fcfe6a1ed9"
> > +SRC_URI[md5sum] = "cd2f92f07bca588acd9238b18f6cfbcf"
> > +SRC_URI[sha256sum] =
> > "a49d315db5a7a19d55422e1678e8a1c3b9661d7296bef3179fa620cf80b12674"
> >
> > BBCLASSEXTEND = "native nativesdk"
> >
> > --
> > 2.20.1
>

