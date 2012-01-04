Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RiZdY-0001wj-7j
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Jan 2012 23:48:48 +0100
Received: by lami14 with SMTP id i14so6377253lam.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Jan 2012 14:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=91WLYQLU5tdH0b8v9enGifK6jx5BnkYw3gyTzS3KNFI=;
	b=ZEQPWeV2c78G75CLWUDnUlqHsj6qdyrCZwP6S6Pkv850pv/Dkw6oii5P0ga0cxQrR6
	IGisRCd+RHqEPYtyW0JhMtsrKE0x9cVFnvs/GFb+aKvnMK44A8Tb87cr7orr+LTfPbbB
	TEiZgUU1UY+RzJsnTm6avUZ7zs/dtu3c3H244=
Received: by 10.112.36.8 with SMTP id m8mr329348lbj.54.1325716886247; Wed, 04
	Jan 2012 14:41:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.115.1 with HTTP; Wed, 4 Jan 2012 14:40:55 -0800 (PST)
In-Reply-To: <CAObi9r_A=fv0Q4QQMxzXTLmsdS1yb4y+9EApxrCkGiX53L70=g@mail.gmail.com>
References: <CAObi9r-QdBpK9hzwQr1M1tjjKW1F+qLfr2CLbjyWCAuSuEUKAQ@mail.gmail.com>
	<20120104180932.GD32676@sakrah.homelinux.org>
	<CAObi9r_A=fv0Q4QQMxzXTLmsdS1yb4y+9EApxrCkGiX53L70=g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 4 Jan 2012 14:40:55 -0800
Message-ID: <CAMKF1spZGshc70t3e3dUjfckxEVFg0UX+Wtga7GJssFPuEugDg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: some ipk contents missed in rootfs - fuse_2.7.4
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
X-List-Received-Date: Wed, 04 Jan 2012 22:48:48 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jan 4, 2012 at 2:00 PM, mgundes <mgcse@hotmail.com> wrote:
> At that point, can I say this as a result: "IMAGE_INSTALL is checked by
> bitbake and just only ipks of in that variable are added to rootfs. In my
> case, I had added fuse to IMAGE_INSTALL and just fuse*.ipk was added to
> rootfs, so that I needed to adding fuse-utils to IMAGE_INSTALL to get
> contents of fuse-utils*.ipk in my rootfs."
>
> Is that conclusion true?
>

you have to understand the difference between recipe name and output
package name
one recipe may emit multiple packages. What goes into image is picked
from output package
names and not recipe names. By default bitbake translates recipe name
to be one of packages
name as well. e.g. if you have foo.bb then there will be a foo.ipk
generated but there might
be more like foo-utils.ipk etc. if you did that in the recipe.


