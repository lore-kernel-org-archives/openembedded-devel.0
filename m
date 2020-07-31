Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web12.12668.1596175079521585298
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jul 2020 22:57:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TCAC2ddg;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id x6so7824769qvr.8
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Jul 2020 22:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=e6pJb1oKplscErxdntghZ5sJwJuOl2tBVMnyKA4OolU=;
        b=TCAC2ddgn3nOG/2vLNo/xpaSIwJKTGt8sZm2C9N43kmlgCrw9MqyZGbNBfJ2iglUjK
         iytO2hcD4XdZHLnNlPRfu60OBLpKQUU8WSgnD8ISIt4vEVSfU90QcYwTRAw8SwiLBSdi
         867NbWMi5MhxCZR8d992mmMuh9ucQU9D6zEvC+3HYwUqqCIn6O+pyz1IIRFDWOoxTnb3
         A9W1KHir0yjDT4pu9e3SIrSIkzV3vrNFOcnO+CIUB4Midh6qGCZ7kMqhzBwEzfyKMRvB
         qy5ibYU3hRxunk+s6ddqYiZ4/nvtN9sVF9kmd0UbkH9NwEi9ueOthOIv9FYCY/27hnx8
         egjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=e6pJb1oKplscErxdntghZ5sJwJuOl2tBVMnyKA4OolU=;
        b=bebITYL9GomDgamz9LiBP/7wjHHJwEDKn7NUXqCaCLKGZe0w29EhA42O1O6X2djObl
         S7OYzqQU1AAt3OUF0TJMPpDzDiWR749qeoGCIfnarCFmjG/kpzylWEszzbtoHfDP9Wxr
         h8QorOcTjAc7Gk79EMoQZXrChicT5yEqxsjy4xsjgWpNGqE2jtngwMKuDDDyHTBPRhQs
         5k9g/6npYaqkFUvouYjGM7f+dqPxzV6eIQMVf/TW9J09UTG7AIoaDy94K0OcnjcSPBsC
         XEMNLBj4WYz/rxQWSmkIx1D7XF7kGcmDt75hrBFSfutUjwlPwS3QM/HWgrQ+D8adBqqv
         Ej2g==
X-Gm-Message-State: AOAM533wJxFTv9eCM+23NfrL7v/f0ErqzJRIAeN99Ecdyk5xfJeaNfSB
	KWt2KkLRHGfgp9ooAb1UER0DCuY8TRUW5Nq2EJ0QLLq6pLQ=
X-Google-Smtp-Source: ABdhPJzePpFcOllLKmQ7F9YL9pmXrE+f9JhS3A3LVUZB+j3WIKroAvmNXDaQcnTqLvfNUqkpAfFzJrLtapasbJ10gfU=
X-Received: by 2002:a0c:b488:: with SMTP id c8mr2530300qve.130.1596175078469;
 Thu, 30 Jul 2020 22:57:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200729093513.6782-1-yi.zhao@windriver.com> <20200729093513.6782-2-yi.zhao@windriver.com>
In-Reply-To: <20200729093513.6782-2-yi.zhao@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 30 Jul 2020 22:57:32 -0700
Message-ID: <CAMKF1sp3j++PvdP-3CnOkG7h7F3m3KSUQ-7ikeTqvP-JCkH1Kg@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH 2/2] samba: upgrade 4.10.15 -> 4.10.17
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

this fails to build on musl see
https://errors.yoctoproject.org/Errors/Details/426320/ perhaps we need
patches from https://bugzilla.samba.org/show_bug.cgi?id=14415

On Wed, Jul 29, 2020 at 2:35 AM Yi Zhao <yi.zhao@windriver.com> wrote:
>
> This is a security release in order to address the following defects:
>
> CVE-2020-10730: NULL pointer de-reference and use-after-free in Samba AD
>                 DC LDAP Server with ASQ, VLV and paged_results.
> CVE-2020-10745: Parsing and packing of NBT and DNS packets can consume
>                 excessive CPU
> CVE-2020-10760: LDAP Use-after-free in Samba AD DC Global Catalog with
>                 paged_results and VLV.
> CVE-2020-14303: Empty UDP packet DoS in Samba AD DC nbtd.
>
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>  .../samba/{samba_4.10.15.bb => samba_4.10.17.bb}              | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-networking/recipes-connectivity/samba/{samba_4.10.15.bb => samba_4.10.17.bb} (99%)
>
> diff --git a/meta-networking/recipes-connectivity/samba/samba_4.10.15.bb b/meta-networking/recipes-connectivity/samba/samba_4.10.17.bb
> similarity index 99%
> rename from meta-networking/recipes-connectivity/samba/samba_4.10.15.bb
> rename to meta-networking/recipes-connectivity/samba/samba_4.10.17.bb
> index 01250cb43..6b1e5a042 100644
> --- a/meta-networking/recipes-connectivity/samba/samba_4.10.15.bb
> +++ b/meta-networking/recipes-connectivity/samba/samba_4.10.17.bb
> @@ -36,8 +36,8 @@ SRC_URI_append_libc-musl = " \
>             file://0001-samba-fix-musl-lib-without-innetgr.patch \
>            "
>
> -SRC_URI[md5sum] = "67e9f6b8c5140475641bf5121c93b3d4"
> -SRC_URI[sha256sum] = "0b8b62558b62fbb121015f28f40fae0f07522710b6bef77c508b51bb6914ced9"
> +SRC_URI[md5sum] = "f69cac9ba5035ee60257520a209a0a83"
> +SRC_URI[sha256sum] = "03dc9758e7bfa2faf7cdeb45b4d40997e2ee16a41e71996aa666bc069e70ba3e"
>
>  UPSTREAM_CHECK_REGEX = "samba\-(?P<pver>4\.10(\.\d+)+).tar.gz"
>
> --
> 2.17.1
>
> 
