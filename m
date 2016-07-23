Return-Path: <martin.jansa@gmail.com>
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by mail.openembedded.org (Postfix) with ESMTP id 73E8560290
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Jul 2016 08:48:37 +0000 (UTC)
Received: by mail-lf0-f66.google.com with SMTP id 33so8671058lfw.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Jul 2016 01:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=eEGWrKUPSyUKwJvvTK/Svc1GdBZ6xQdL5/cuiVPH0Cg=;
	b=KT01+2JmR4e551f9WTKQ/fcGIntUHQYKe4FxmjgL1uY1u9TfcP5Pn79/dKuFRcJSJl
	4De2Lc7HnLCIJ/e14ylPY+p0Q5WE6/2/T8EA5njWIZ29T3jkwvcXoXAG2GDAE6wC79AV
	Vsm8pZ8Ji0XjT7E0PkKZ0vy+TQfbdkUDlyZrRpuqSm+00ewSZfeDzM5qNEw8xa8+yl3E
	9XVh8lD117pXrOH9D8F5U+x4BTOZeYk7scmp50pbJFmfIcb7GiTcKfxhxDBZqjkHd/XZ
	i/YodGDQDb4HRYs0WA1J+ldJXXxFdIPVf7fWBx/5+vszDzbhQbC/SA4V+eQstoHkRXup
	tu9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=eEGWrKUPSyUKwJvvTK/Svc1GdBZ6xQdL5/cuiVPH0Cg=;
	b=jMX9RECbrWeIlqQ1PQ8zgrf4+m50PnMXzVJIBfZK8goztLcZSmEuHhjQK5PhMy20v/
	Lr87oRozw8pJIeOAmgDzG9Szaib2hO2fOkAN/7pPyqVlOFRvAQGtE9dpWi6wBpvOkn5T
	P7q0eaZKtNQsnfT6b2AQZ7ZSUK0YUhIGx7EFnWAwDfiRmY6tf8SdtFOJhAwmI9MawxI7
	8HvexzwLNXPnKSDPDCRFp91RsFSd8W/Po+qmVgxQKCdxu9FetO44b660iiXOFMPn1DIH
	raV2gd3+c+tC9AKseT7yHNsWFLT1ZquAIa7xxaflM5F2flvdcifxsQbSUj1TZS/WZRRf
	K72w==
X-Gm-Message-State: AEkoousY5mV0N2QItnWwUSvxoo9NPx9CKEuWN5CBF9xDkSv7VDyrW92N1FycEPkkbtyVrs+p0GMXLyfFEXN71A==
X-Received: by 10.25.21.16 with SMTP id l16mr3748254lfi.229.1469263716833;
	Sat, 23 Jul 2016 01:48:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.87.12 with HTTP; Sat, 23 Jul 2016 01:48:36 -0700 (PDT)
In-Reply-To: <1468808893-5752-1-git-send-email-kai.kang@windriver.com>
References: <1468808893-5752-1-git-send-email-kai.kang@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 23 Jul 2016 10:48:36 +0200
Message-ID: <CA+chaQdaFXOOqCuoVXcUPPXmM4TbMEkk_n-a-r=v_t48snag3Q@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH 0/2] Add 2 ttf fonts
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
X-List-Received-Date: Sat, 23 Jul 2016 08:48:39 -0000
Content-Type: text/plain; charset=UTF-8

You forgot to update layer.conf, causing:

ERROR: ttf-vlgothic different signature for task
do_package_write_ipk.sigdata between qemux86 and qemux86copy
runtaskdeps changed from ['fontconfigfontconfig_2.12.0.bb.do_packagedata',
'opkg-utilsopkg-utils_git.bb.do_populate_sysroot:virtual:native',
'pseudopseudo_1.8.1.bb.do_populate_sysroot:virtual:native',
'ttf-fontsttf-vlgothic_20141206.bb.do_package',
'ttf-fontsttf-vlgothic_20141206.bb.do_packagedata'] to
['fontconfigfontconfig_2.12.0.bb.do_packagedata',
'opkg-utilsopkg-utils_git.bb.do_populate_sysroot:virtual:native',
'pseudopseudo_1.8.1.bb.do_populate_sysroot:virtual:native',
'ttf-fontsttf-vlgothic_20141206.bb.do_package',
'ttf-fontsttf-vlgothic_20141206.bb.do_packagedata']

I'll fix it this time, but next time I'll just reject this.

On Mon, Jul 18, 2016 at 4:28 AM, <kai.kang@windriver.com> wrote:

> From: Kai Kang <kai.kang@windriver.com>
>
>
> Kai Kang (2):
>   liberation-sans-narrow: add a ttf font
>   ttf-vlgothic: add a ttf font
>
>  .../30-0-liberation-sans-narrow.conf               | 18 ++++++++++++
>  .../ttf-fonts/ttf-liberation-sans-narrow_1.07.4.bb | 32
> ++++++++++++++++++++++
>  .../ttf-fonts/ttf-vlgothic_20141206.bb             | 28
> +++++++++++++++++++
>  3 files changed, 78 insertions(+)
>  create mode 100644
> meta-oe/recipes-graphics/ttf-fonts/ttf-liberation-sans-narrow/30-0-liberation-sans-narrow.conf
>  create mode 100644 meta-oe/recipes-graphics/ttf-fonts/
> ttf-liberation-sans-narrow_1.07.4.bb
>  create mode 100644 meta-oe/recipes-graphics/ttf-fonts/
> ttf-vlgothic_20141206.bb
>
> --
> 2.6.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

