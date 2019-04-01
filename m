Return-Path: <vincent.prince.fr@gmail.com>
Received: from mail-it1-f193.google.com (mail-it1-f193.google.com
	[209.85.166.193])
	by mail.openembedded.org (Postfix) with ESMTP id 4E0177D003
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Apr 2019 11:04:40 +0000 (UTC)
Received: by mail-it1-f193.google.com with SMTP id y10so12555215itc.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Apr 2019 04:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=C7Z1S/aZpFYhpLkQjhSg6vV7DpZ4sI1YVgIWpKJ1txA=;
	b=DyaAg+4Sb7sOidtw2PuKad8im4Juq4gnaGTqTE94s2dIYEUAsCYaLcufC4WKXtZ/rV
	ZIZegKvreLmSDeZCakgryL6XbWTxafDEISJkSoQ3ubVDsBdtWqcwFmlLKjKwG5VI87rr
	F5sOIifiOBwZvUNoOb8reYkk4tZ6o0MESjrXS7jaEIvk7moZCFeQiM+T8iQk04IfjpG0
	3FbNQLg1rkTIvJIbJu4Qpywd411fujSztyl/xGYQodsZe1l3jUgdS6pBnd7wsQHHZW+c
	px7KFdtgzUgz07o6RIFUv3LzTtzx1KPXPWm5felSFxLIQI4Vrd+FMZQKTS66qmv2IynK
	SVSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=C7Z1S/aZpFYhpLkQjhSg6vV7DpZ4sI1YVgIWpKJ1txA=;
	b=YxuLtjNFI5fPMIWbuKQKHyVWEDAlok/OGJ7l4kJkYASxPnSzYgsoCrb4X+xs6J1hxG
	V7rdUV4wLApVqX8xDdQP22CPam6KJzIfQmVDiZn5iyWJ8iJ6l4lCEk1LltqWGgAwyLNK
	hoBa65cboXqTtxkf8QqswzGAMBa/FceddIIqTJnrG59ZGLb1C2UvgxKIBsGnAyeJrOvq
	bGxF7kzIQuh3Nmog0eotJIT52DC3f9BQb2oeM4fCffdwVGiu4xfWP5ycKQvHcCn3THTC
	ESG1/CG4wLjv9BLwivxsh6I8LhC7vKZxWMwODsWY8CqJ8ygtTBM6HOQKxgv8kkq4d3Mf
	h/wQ==
X-Gm-Message-State: APjAAAWfczbgnTm8q+svwcHilcxT+Cd4mNouweCO1jXeZsMCn0xEbsOY
	mnn3z6S/CQgRyVhOBwfj+E/CFQrekiRbUh4H7e0=
X-Google-Smtp-Source: APXvYqyHxhUuuwfhQdjq4iXOv++Eih7opPmrH1qwFJ/DlXa7nGVuspqQNRygi6GOLisosm3EBmlarBXOvY8/csajOEo=
X-Received: by 2002:a24:1394:: with SMTP id 142mr16011851itz.54.1554116681685; 
	Mon, 01 Apr 2019 04:04:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190401093917.28952-1-costamagnagianfranco@yahoo.it>
In-Reply-To: <20190401093917.28952-1-costamagnagianfranco@yahoo.it>
From: Vincent Prince <vincent.prince.fr@gmail.com>
Date: Mon, 1 Apr 2019 13:04:30 +0200
Message-ID: <CAB2nKc_+S3dJBMtCtF080vkcms0j=PgOpDJMn3OYV_GDXzCa=g@mail.gmail.com>
To: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] libmodbus: start to prefer version 3.1.4, now that even Debian updated testing to it. Upstream declares this version as "very stable", so maybe it is really time to switch to it
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
X-List-Received-Date: Mon, 01 Apr 2019 11:04:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Gianfranco,

This commit subject seems a bit long ?
Otherwise, I use 3.1.4 for a while now without any problems, so I agree
with your patch.

Regards,
Vincent

Le lun. 1 avr. 2019 =C3=A0 11:39, Gianfranco Costamagna <
costamagna.gianfranco@gmail.com> a =C3=A9crit :

> ---
>  meta-oe/recipes-extended/libmodbus/libmodbus_3.1.4.bb | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/meta-oe/recipes-extended/libmodbus/libmodbus_3.1.4.bb
> b/meta-oe/recipes-extended/libmodbus/libmodbus_3.1.4.bb
> index d438a0abc..cc45fa7e2 100644
> --- a/meta-oe/recipes-extended/libmodbus/libmodbus_3.1.4.bb
> +++ b/meta-oe/recipes-extended/libmodbus/libmodbus_3.1.4.bb
> @@ -1,7 +1,4 @@
>  require libmodbus.inc
>
> -# Use the stable branch by default
> -DEFAULT_PREFERENCE =3D "-1"
> -
>  SRC_URI[md5sum] =3D "b1a8fd3a40d2db4de51fb0cbcb201806"
>  SRC_URI[sha256sum] =3D
> "c8c862b0e9a7ba699a49bc98f62bdffdfafd53a5716c0e162696b4bf108d3637"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

