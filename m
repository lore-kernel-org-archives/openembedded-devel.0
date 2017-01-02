Return-Path: <matti.kaasinen@gmail.com>
Received: from mail-ua0-f178.google.com (mail-ua0-f178.google.com
	[209.85.217.178])
	by mail.openembedded.org (Postfix) with ESMTP id 9842D60722
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Jan 2017 14:20:38 +0000 (UTC)
Received: by mail-ua0-f178.google.com with SMTP id 88so296602181uaq.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Jan 2017 06:20:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=VZNIWiZH37UdJTBDBUQsqq1tjVNAwsXZFPnT4k3rEAw=;
	b=Jk/xDey9Rb35N3cHrE4qiklNSMJm6t42cPhuAWEup8/0wmPfjB4zT2Y4fAhty/AK0J
	iNloN+FN/YT3rtPIq3qxBPuA+1KNsoaXVdvgPuFaXLmqveTTgJ5Wmb6lzXHP9yK+/NIc
	qnLicwFiknECk2tf/vnfydeYTNJNHU9z2NoKuX9JCsR4KDIzuDI1PgKZwLElz66OonU5
	X+7wOi2/ZelFghxVJaU6tWuTyXN4kvMegbapPkG8SHywG4h57VeFmR3EU2a8jizFHxMJ
	eSmhx/8OX4JWLAIBegUs5HjBZHZF/r83bMEgqV87p5S4t5vdTjN7/ADjXhcsxYhYHXs4
	0EGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=VZNIWiZH37UdJTBDBUQsqq1tjVNAwsXZFPnT4k3rEAw=;
	b=dsFjx5/C4T+xNnnhBsVzJE4mNTrCzYBqE2zGfS/Xun3hpQHU0dvXgGQYwnBEgI4nHA
	YLXeTTVL+YfIx1wCDaQi7ierL6W0ai17UgkTJ48kNCpWL1AtSpoyFHqPqJ1tIgisWCRj
	gmOwxyheZQSvaqS6eFn0eU+2eXb/vQ6KWrrBBg5wMYKJrbcauUS3y1qbiBqcMM238R5V
	tdXz2uqQCbH3Fb+1D6Oyj9FEaoK3uLljSyMYcUkaDkluBhhbkoN0Kkcv7Dt06ISMdNo/
	MYyaKGO7VMjkurICXWVUAGl7Pd6FCTuMhWfkfS3GKHeIY6Yk25UxiMv46brnFASJ4rv1
	rl8Q==
X-Gm-Message-State: AIkVDXJrmghn3+ay5Q9JsGkfuTc+hrXW82QXHlsSYHWxI4zdalKVU9QCgcKdYzjWqFAYgNpi4UqfJZCWHvO3Nw==
X-Received: by 10.176.81.97 with SMTP id f30mr44247567uaa.55.1483366837684;
	Mon, 02 Jan 2017 06:20:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.103.14.2 with HTTP; Mon, 2 Jan 2017 06:20:37 -0800 (PST)
In-Reply-To: <CAKuJqM9sse_hCpGQBbfQrcCThtichn=WLeuA2iEEU=NP9N_nMw@mail.gmail.com>
References: <CADnUhn2STGnqzDuYoAo8yLvDnPFcmm+4M+xq387oxdhwF_pFMQ@mail.gmail.com>
	<CAKuJqM9sse_hCpGQBbfQrcCThtichn=WLeuA2iEEU=NP9N_nMw@mail.gmail.com>
From: matti kaasinen <matti.kaasinen@gmail.com>
Date: Mon, 2 Jan 2017 16:20:37 +0200
Message-ID: <CADnUhn16Dyc2tnRgQtGMwy6xuBKchjWP3oCtnRdpg4GK1L0BcQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: apache2_2.4.23.bb fetcher crashes
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
X-List-Received-Date: Mon, 02 Jan 2017 14:20:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Olkesandr,
Actually it was regarding that jquery library that I patched today. That
really was pretty trivial fix if fix at all =C2=AD- just to make it more fo=
rmal.
However, I really do not know if it is just to update Apache version or is
there something else to do. Pure revision change would be trivial for me,
too, or actually a new recipe should be made. Other choice would be trying
to find that older version of Apache and fix source URL accordingly.
It seems that old version is in archive:
https://archive.apache.org/dist/httpd/
I'm fine making the patch to update SRC to point to apache archive.
However, recipe seems using several patches that I do not care creating for
the new release now. That should do someone more devoted to apache
functionality, I suppose.
-Matti


2017-01-02 15:46 GMT+02:00 Oleksandr Kravchuk <
oleksandr.kravchuk@pelagicore.com>:

> Matti -
>
> As I have previously suggested, you can make a patch and send it to
> this mailing list. Here is an instruction:
> http://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded
>
> Would you like to try to do it yourself or you actually want us to fix it=
?
>
> On 2 January 2017 at 14:15, matti kaasinen <matti.kaasinen@gmail.com>
> wrote:
> > Hi!
> >
> > http://www.apache.org/dist/httpd/httpd-2.4.23.tar.bz2 has been removed.
> > Latest/current version on http://www.apache.org/dist/httpd/ page is
> > httpd-2.4.25.tar.bz2. This crashes fetcher of
> > meta-openembedded/meta-webserver/recipes-httpd/apache2/apache2_2.4.23.b=
b
> > that is Krogoth recipe for apache2.
> >
> > Thanks,
> > Matti
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

