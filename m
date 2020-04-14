Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
 by mx.groups.io with SMTP id smtpd.web10.14544.1586881197467964468
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Apr 2020 09:19:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20150623.gappssmtp.com header.s=20150623 header.b=Z/fLqtVu;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.166.182, mailfrom: brgl@bgdev.pl)
Received: by mail-il1-f182.google.com with SMTP id z13so234810ilp.11
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2020 09:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=PvvTnbLLhPvM3GZge586piJh1LivTRFB9V6sRGhFCkg=;
        b=Z/fLqtVua2Nt8ttpn5iYq0SMQTvAxZMl1bSjtOsi7JDnTAh8FVOon9/WWHPw5yxGOi
         nR5ku6rLcBXOIQ2WgrmpgN4nJtukPQX81aNOcY4lP1EyvT8AVh3rWbbRZm4BiZw0JvLC
         pq00blegbXxUUem7Qeztc5uGU5g6fMpMEHed5DmnTzC2hZRuTi1ZXgfQSmBj3fyPudvk
         J6g+9YeZ9JIaI2FviEDHahgz3FwqwgMbxslt0oo0diARmGQrDaVAmvdLS/Tr0zg7fihn
         Nu3Uleud2u4z/9Y8IEQU2Q2XbewzkQqlYPmP68kWU7PqNkPrMfivnjRD/rDLWDPcfRE8
         seXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=PvvTnbLLhPvM3GZge586piJh1LivTRFB9V6sRGhFCkg=;
        b=UM4chocXe+V3gvNZ33CDnErl7hOs+ioo+uGoGBBYJjUhl6UFw4K3VojWGb0QM6h2Rv
         xCSISDMuCzBaG069kXFL6DXl/ier6QS7IPmOPVCRJ8ZiE6U8dvVk79I+4XH5VwOvoVYK
         Wet2REsotT8gMiPwJQlEUSYdBJWVaMI+fRZBv8n0rKYSREdhall0p98Q0UMD+giPTBMW
         JQUqVcaq8R1nXBJq3rFtpzFFw2ikq3p00CfU9J7XDMQyJlMxL0Kb6K8unRE3HJju8qBl
         KLvORUJy/o4ZhlzmL+Oh1/TGflzGspByxELymhWoX8Ht8O++P5IfZL5gAWJfXClqpxcO
         gpRg==
X-Gm-Message-State: AGi0Pub0REoejN3gEsBTGgVsiSEUfjPAuyw8SmpDMD5YUSC1nVyLOsX8
	7qTMouMrUo9YdgXKU2m1C5YOk7O4EgVApk/BxXOZQKiW98Q=
X-Google-Smtp-Source: APiQypI4xFvnV4NEhhKDc+raKRbHEpeqX01t5hakEiqRrnNUbnIbje6yzDD0ZrfwQZxe7iuQTgeBrN2kqjlC8dZTTOA=
X-Received: by 2002:a92:8f94:: with SMTP id r20mr1014710ilk.220.1586881196732;
 Tue, 14 Apr 2020 09:19:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200410124135.24217-1-brgl@bgdev.pl> <20200410124135.24217-2-brgl@bgdev.pl>
 <34f4335a-c9ed-a790-c683-3b6db93eceb7@embexus.com> <CAMRc=MeJOmwqPnZbgT-XugtQRU8okQMPGvgWx+cjnMw=1WyM=A@mail.gmail.com>
 <8896403c-4f12-5d3c-5722-5b9b0a000067@embexus.com>
In-Reply-To: <8896403c-4f12-5d3c-5722-5b9b0a000067@embexus.com>
From: "Bartosz Golaszewski" <brgl@bgdev.pl>
Date: Tue, 14 Apr 2020 18:19:46 +0200
Message-ID: <CAMRc=MdO=x4FCEE2MVtFBZxr0sbChjMjHwOrMAYx23dkxKCJiw@mail.gmail.com>
Subject: Re: [oe] [meta-security][RFC 1/2] classes: provide a class for generating dm-verity meta-data images
To: Ayoub Zaki <ayoub.zaki@embexus.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

wt., 14 kwi 2020 o 11:17 Ayoub Zaki <ayoub.zaki@embexus.com> napisa=C5=82(a=
):
>
> Hi,
>
> On 14.04.20 11:05, Bartosz Golaszewski wrote:
>
> pon., 13 kwi 2020 o 12:58 Ayoub Zaki <ayoub.zaki@embexus.com> napisa=C5=
=82(a):
>
> basically this class generate a dm-verity hash that needs to be injected
> inside the initramfs...it's a bit hacky.
>
> wouldn't be signing the hash, include the verifiication public key in
> initramfs more portable ?
>
> Sorry, but I don't see how this is a better solution. You then have to
> store two things somewhere: the hash and its signature. If the
> fitImage is already signed - there's no reason to have a second
> signature for the hash: it already comes from a trusted source.
>
> This would also inflate the size of the initramfs - not only would it
> need to include the cryptsetup tools but also additional tools for
> signature verification.
>
>
> The hash + signature doesn't need to be stored in initramfs in this case =
but appended to the rootfs image.
>
> yes you would need in this case a signature verification tool inside your=
 initramfs and the corresponding public key.
>

But how is this better? I know this is how Android does dm-verity, but
it's not any simpler - I'd argue the actual implementation is more
complicated.

> It is clearly much better than to poke around with circular dependencies.
>

No it's not clearly better. Circular dependencies result from bad
design and should be fixed. I proposed simple changes that fix them in
OE-core.

>
> From another point the veritysetup is not quite correct:
>
> veritysetup --data-block-size=3D1024 --hash-offset=3D$SIZE format $OUTPUT=
 $OUTPUT
>
>
> If the size of your image is not 1K multiple then you are excluding the l=
ast block!
>

Good catch! This is only an issue for ext2 but needs to be verified anyway.

Bart
