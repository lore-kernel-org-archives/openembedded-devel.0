Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web08.9357.1631718938451506612
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Sep 2021 08:15:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=k1oNxaZy;
 spf=pass (domain: gmail.com, ip: 209.85.222.174, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id t4so3757449qkb.9
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Sep 2021 08:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jgnPgs6NZ7mwZe+F7HyppBnp9krv9vVUDmlb8tEIiFw=;
        b=k1oNxaZy1UruLYIe+FnBDSdRRNWv52O1ORsdCcKjv+wUNVpARn9WLzTZSo4UFpybGX
         VanlaKj/4+TTOxNxwsRuW9s1jlP2pkbvmIvUYtwGwgd7clHboDSAc7VCPP1u+FqjT4qv
         ZqDOG0flG4GNMsVEGnolc/Ze3l0tUQpkkiFxbSr9BernoBPROHDBtf2cMoNCM+VZxKgL
         80iCUc1BP/AB8rtg1DrqOtTRmDk679FsHDe/Ft15JfMGkr3WzE1Zo2mqDVLKE0s/jWbP
         C4WVbPqEcNUftJ0TT9kjOXE+vyND+DEZaYQEBmouK/4k9h6KXPKXFFBmngDXkVbu6Ip9
         y87g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jgnPgs6NZ7mwZe+F7HyppBnp9krv9vVUDmlb8tEIiFw=;
        b=jXGJ1W1QQyqI5tPbL1WdCTx7srqqKaUQtoAW0j+3cVLwA5Z1965wdCaWyAhxWQszbu
         MBXofbCbJQ8Sz6oQeeejjlPPJP2M5Lca1SW/Hsn2FKBgIsAJJdi3jFva/IVHgDInVwtE
         hULqjA9WjLI73XLWylwNyW3AfWH4n6g3olLYYpWjymw//FK+bMVt55vI6qRPy/3D7ZF+
         PW38CNvMs73cXISsDugkzAOGDsWUId+CVjE9JHk1ShdJBUVz0euj1xlaaFRPNstOuvC4
         DblT16WnLj1VouOcfvH22TKw+Pzi+KLYYTCo9GaLxC9/DeZN0i4bMQ3ouYm/xYl+jdAk
         0CWQ==
X-Gm-Message-State: AOAM532AwRh5dYqK9zgt9aBm0GPoK/QxAjnloHWM1tFS73YKQnormBwi
	5/GGqUCYm0WvrDGIILxMlj5/0mrk9Go2CZpyaNc=
X-Google-Smtp-Source: ABdhPJyt0IIxMLryiw5myhPI4wX+q6pVFzgFZnpYzZl4lGod9jwCX/3RJBOOS5P+UeW2DJtgp8/LHGh5aRgsrj7MKsU=
X-Received: by 2002:a05:620a:1086:: with SMTP id g6mr423292qkk.105.1631718937482;
 Wed, 15 Sep 2021 08:15:37 -0700 (PDT)
MIME-Version: 1.0
References: <9a4e3e32-8e32-c956-45eb-7c5e8cc11f42@gmail.com>
In-Reply-To: <9a4e3e32-8e32-c956-45eb-7c5e8cc11f42@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 15 Sep 2021 08:15:11 -0700
Message-ID: <CAMKF1spSb+O3x527k4H66Pj1QUDuPhYPOQJKbr6L_Y1VaAkH_Q@mail.gmail.com>
Subject: Re: Dunfell merge request: Sept 15th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

merged thanks.

On Wed, Sep 15, 2021 at 7:29 AM akuster808 <akuster808@gmail.com> wrote:
>
> he following changes since commit 5c347d8ce425dcb4896e6f873810b8bfff5e4e92:
>
>   nss: Two Security fixes CVE-2020-6829 and 12400 (2021-09-05 11:54:45
> -0700)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/meta-openembedded dunfell-next
>
> for you to fetch changes up to 2e7e98cd0cb82db214b13224c71134b9335a719b:
>
>   dnsmasq: Security fix CVE-2021-3448 (2021-09-10 15:16:48 -0700)
>
> ----------------------------------------------------------------
> Armin Kuster (1):
>       dnsmasq: Security fix CVE-2021-3448
>
> Pierre-Jean Texier (1):
>       stunnel: upgrade 5.56 -> 5.57
>
> Yi Zhao (1):
>       krb5: fix CVE-2021-36222
>
>  .../recipes-support/dnsmasq/dnsmasq/CVE-2021-3448.patch         | 1040
> +++++++++++++++++++++++++++
>  meta-networking/recipes-support/dnsmasq/dnsmasq_2.81.bb         |    1 +
>  .../stunnel/{stunnel_5.56.bb => stunnel_5.57.bb}                |    5 +-
>  meta-oe/recipes-connectivity/krb5/krb5/CVE-2021-36222.patch     |  121 ++++
>  meta-oe/recipes-connectivity/krb5/krb5_1.17.1.bb                |    1 +
>  5 files changed, 1165 insertions(+), 3 deletions(-)
>  create mode 100644
> meta-networking/recipes-support/dnsmasq/dnsmasq/CVE-2021-3448.patch
>  rename meta-networking/recipes-support/stunnel/{stunnel_5.56.bb =>
> stunnel_5.57.bb} (86%)
>  create mode 100644
> meta-oe/recipes-connectivity/krb5/krb5/CVE-2021-36222.patch
>
