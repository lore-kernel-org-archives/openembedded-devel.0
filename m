Received: from mail-io1-f67.google.com (mail-io1-f67.google.com [209.85.166.67])
 by mx.groups.io with SMTP id smtpd.web12.7961.1586522275115830402
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Apr 2020 05:37:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20150623.gappssmtp.com header.s=20150623 header.b=L7JWA4WV;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.166.67, mailfrom: brgl@bgdev.pl)
Received: by mail-io1-f67.google.com with SMTP id u2so1585423iop.10
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Apr 2020 05:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=uwI5VFIyB1oaUQu6Hj5w4hKOqZTwM0UB2FE7smBtiXM=;
        b=L7JWA4WV2v6qfsJ+KGPtHH4+4k724pwTpKfR/vfBFL0jQaCGgxpQlRbLjCL2/vkgWM
         WASL8EtK3bXknu/BkxFaF6NH0rF7oHNPw5yiq/MBl4VRmP/ExrpKRqNJujiEnjgqwLZQ
         4hyqWg6835iCeax/+fd+YBSSalQYYVxh4LweAnDSLKVv7Aw5nF+8tCcXbgmEukzfxy7v
         5L/6nnsOJsFoRoMDTMR/bOEE4KMXzZg3hzn8PHPTUzOypdz5aS47EDbg9e2d3fKEeqhH
         Hktfh2xg5pO7lLeIGZk55xR4P0WWvCeJ7O+py+p6ETMYIu7rAIwja6XVNURLxb9noJtD
         16ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=uwI5VFIyB1oaUQu6Hj5w4hKOqZTwM0UB2FE7smBtiXM=;
        b=pAjoapLQ4HUrmjpEWr8IumbwgvECbHKfxYct53KNWvNVZ041fGLGoJlxhpN5yYK+eR
         LI+qldTLhjK+0sK6SuPuWa7AHLAKgEZ/sGEFWIhREiogvo8qgnykAqDu3NHIiMhv1ZD7
         0CrsNzsVWNvYkcEc1uyTbgYeu6TJruSsy+SSMf5aBQy7GjZNdIXcL6M3q72jRAnj8Fmk
         l1Hjda8b+06GekxjcnTxy/N6ux6EfcFp4AW2k82TXrm/G+UIAGW57kSxMqhc2+p3LjrS
         DsyW/Yq/a8dtnVl0TSHKPVntsHgm5BgsytL7xojO2eC0UQVIuiXVC2kW8hOAA3iO+MSs
         CGog==
X-Gm-Message-State: AGi0PuYY88xbm5Zn6L+nldhgWvM5UnHXr5zBtNaA9zn5JimklD35RZP8
	red7xvA12I0ArkkPYfJ2HFiC7SLkQBVeLAdSbYnvqg==
X-Google-Smtp-Source: APiQypLTfutHJn2sEHD9uVPzu7D/kq2XpBqVJzXpxjSbBGLj0lUbm6T3GU8LQr9VOZO1j344FHlWiaw/EPvSikCFiGk=
X-Received: by 2002:a5e:890c:: with SMTP id k12mr4158075ioj.131.1586522274543;
 Fri, 10 Apr 2020 05:37:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200410123449.9624-1-brgl@bgdev.pl>
In-Reply-To: <20200410123449.9624-1-brgl@bgdev.pl>
From: "Bartosz Golaszewski" <brgl@bgdev.pl>
Date: Fri, 10 Apr 2020 14:37:43 +0200
Message-ID: <CAMRc=MenjNvshDicMscKmhaOJRc-q2F9t0bJFN_Gr93OksY_OA@mail.gmail.com>
Subject: Re: [OE-core][PATCH v2 0/2] generic dm-verity support + BBB example
To: Khem Raj <raj.khem@gmail.com>, Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Armin Kuster <akuster808@gmail.com>, Jerome Neanne <jneanne@baylibre.com>, 
	Quentin Schulz <quentin.schulz@streamunlimited.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>, yocto@lists.yoctoproject.org, 
	Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

pt., 10 kwi 2020 o 14:34 Bartosz Golaszewski <brgl@bgdev.pl> napisa=C5=82(a=
):
>
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> This series attempts to introduce support for dm-verity in meta-security.
> It depends on a series[1] I submitted for OE-core that introduces multi-s=
tage
> image deployment that's currently pending review (although the general id=
ea
> was accepted by Richard). This new way of deploying image artifacts is ai=
med
> at solving a circular dependency problem[2] which turned out to be imposs=
ible
> to resolve if all artifacts are deployed at once by the do_image_complete=
 task.
>
> The first patch in this series introduces a generic bbclass that allows t=
o
> generate and append dm-verity hash data at the end of the partition image=
.
>
> The second patch adds support for an example verified boot image for Beag=
le
> Bone Black where the root dm-verity hash is stored inside the signed fitI=
mage
> in an initramfs which takes care of mouting the protected rootfs.
>
> Patch 2/2 - while made sure to work on BBB - should be generic enough to =
be
> reusable across many platforms.
>
> [1] https://www.mail-archive.com/openembedded-core@lists.openembedded.org=
/msg135694.html
> [2] https://www.mail-archive.com/openembedded-core@lists.openembedded.org=
/msg134825.html
>
> Bartosz Golaszewski (2):
>   classes: provide a class for generating dm-verity meta-data images
>   dm-verity: add a working example for BeagleBone Black
>
>  classes/dm-verity-img.bbclass                 | 88 +++++++++++++++++++
>  .../images/dm-verity-image-initramfs.bb       | 26 ++++++
>  .../initrdscripts/initramfs-dm-verity.bb      | 13 +++
>  .../initramfs-dm-verity/init-dm-verity.sh     | 46 ++++++++++
>  wic/beaglebone-yocto-verity.wks.in            | 15 ++++
>  5 files changed, 188 insertions(+)
>  create mode 100644 classes/dm-verity-img.bbclass
>  create mode 100644 recipes-core/images/dm-verity-image-initramfs.bb
>  create mode 100644 recipes-core/initrdscripts/initramfs-dm-verity.bb
>  create mode 100644 recipes-core/initrdscripts/initramfs-dm-verity/init-d=
m-verity.sh
>  create mode 100644 wic/beaglebone-yocto-verity.wks.in
>
> --
> 2.25.0
>

Eek, this was supposed to be tagged [meta-security]. But since I'm
posting it as an RFC I won't be resending for now.

Bart
