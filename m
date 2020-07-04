Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
 by mx.groups.io with SMTP id smtpd.web12.20512.1593875052471763855
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Jul 2020 08:04:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Gt/o/Ohc;
 spf=pass (domain: gmail.com, ip: 209.85.160.195, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f195.google.com with SMTP id w27so2849026qtb.7
        for <openembedded-devel@lists.openembedded.org>; Sat, 04 Jul 2020 08:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=a9BmjZEAm3DYhfXgbzuzA57oA+n7H8cJd15kfC2878Q=;
        b=Gt/o/Ohc/yRQNpCVoqBuYyHqoHadS6RHie1tgEz/1lvmVObpA88uN4aVYXiojdahoE
         9ILt339gLeo3Np3/ZxLoiLOFDgpPxo088f7y/l8G7O2vxNTmpFymee7IQKhxyT7hvQ8V
         0SOtZvdOprBNX61rh8DfpZwHr7XK/47i8YYQiF+ZXZ6czDuoMVEyvXPVIfYs2A4MqMGc
         Hlmm9HQp2PpN3XdFeU7KvnT9hSFO40ic4GtQFLd7aSU/DosTONTMdX4u8K+gjn7mfHj8
         J9+WsPwsxOJeQ+LknvlQcKBILYvJK/8mPFdFvysGwM0e0LXWq/5gIZFHhhJmnPVjrWXZ
         qhAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=a9BmjZEAm3DYhfXgbzuzA57oA+n7H8cJd15kfC2878Q=;
        b=kNE+qIBL4hz+9XDq/Q08crbzNE6oM7IDmlX7kgPqvPfjWDXB6vhm/N2PhoZuahUnSN
         YwtbXHv1cebE1fjwaKpP971wlepRfVl6s2bshF6wht+Ut8OHDMQWsTSpF3hMdbo78UZK
         i4TQuf+lFumcIyAPrR6otB6UkH9wk01E4wpY2Q24NJrN+PJ1Peg8ttjL3bV5JZ6KQhlc
         7HzQ5xRHi5CNm6xapkNIxftopTbMpxlEvawpMLWj5+HokfsstqQFpNvofcOVGeDi/I9k
         W/VJxjOB2vUo43KitjmkeIVPrv6RAxhRuyPHoSP8FBqN4CN4aHVoCKWqMBFsNrHL9hqR
         MeQA==
X-Gm-Message-State: AOAM5327IvRys9r+xIMEus05Tnq6vr8ba/6erHXSHa55qv8S31d7QXBi
	/DkSYuc33iweGh7Xktij9NUOqlfmlvsLqeNeZy0=
X-Google-Smtp-Source: ABdhPJydx1sdBtF4MdCXUGdoTCh6x9rmy4JPT0yigo/UhZ+4/0xsmMhH1m+I1pSj6Cws1FJWRMDGhpgOKHXHx/llNRM=
X-Received: by 2002:aed:3621:: with SMTP id e30mr41696944qtb.190.1593875051445;
 Sat, 04 Jul 2020 08:04:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200703183115.45146-1-paulohefagundes@gmail.com>
In-Reply-To: <20200703183115.45146-1-paulohefagundes@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sat, 4 Jul 2020 08:03:45 -0700
Message-ID: <CAMKF1sqRhZ=hpQHYB6bbkny=p9w5JFzUkX3az7RR6SM2BRmDSg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] redis-plus-plus: add recipe
To: "Fagundes, Paulo" <paulohefagundes@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Hi Paulo

On Fri, Jul 3, 2020 at 11:31 AM Fagundes, Paulo
<paulohefagundes@gmail.com> wrote:
>
> redis-plus-plus is a redis client written in C++ and based on hiredis
>
> Signed-off-by: Paulo Fagundes <paulohefagundes@gmail.com>
> ---
>  .../redis-plus-plus/redis-plus-plus_1.1.2.bb       | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.1.2.bb
>
> diff --git a/meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.1.2.bb b/meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.1.2.bb
> new file mode 100644
> index 0000000000..c6b64af432
> --- /dev/null
> +++ b/meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.1.2.bb
> @@ -0,0 +1,14 @@
> +DESCRIPTION = "C++ client for Redis based on hiredis"
> +LICENSE = "Apache-2.0"

this recipe needs to define LIC_FILES_CHKSUM as well. Please fix it
and resend it.

> +HOMEPAGE = "https://github.com/sewenew/redis-plus-plus"
> +
> +SRC_URI = "https://github.com/sewenew/redis-plus-plus/archive/1.1.2.tar.gz"

see if you can use a release artifact instead of the archive since
they might change checksums randomly. If there is no release artifact
then
use SRCREV to pin to the release tag with git fetcher instead.

> +SRC_URI[sha256sum] = "9ff6050a948907ed7a7670296e6926f2bcc413555fc514adfb3b78ea11faa332"
> +
> +DEPENDS += "hiredis"
> +RDEPENDS_${PN} += "hiredis"
> +
> +FILES_SOLIBSDEV = ""
> +FILES_${PN} += " ${libdir}/libredis++.so"
> +
> +inherit cmake
> --
> 2.27.0
>
> 
