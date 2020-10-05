Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com [209.85.167.65])
 by mx.groups.io with SMTP id smtpd.web11.33714.1601901714874888128
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Oct 2020 05:41:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=bVocS8Sm;
 spf=pass (domain: burtonini.com, ip: 209.85.167.65, mailfrom: ross@burtonini.com)
Received: by mail-lf1-f65.google.com with SMTP id r127so6128425lff.12
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 Oct 2020 05:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SPwnk6pXmAgLrJ/F1pWjro4mcwH/JSmVmco7aM8Uvg8=;
        b=bVocS8Smkb4MF4Bk5ZbUnlpvEN8ahLMIzzLh5mEevswUXEZQALfez2GRDssSaw20iB
         NUA8XHzVIu4nVmLnFDtUFqwjOt6aqf+WnRad0BObqwrmeOuuuwPn6qkEB6KdF0LE9NCS
         OsDGU9SEAmVf49Pr5C/e8m8o6vbDX+tXSmtsJERYgN1yy9OJ3oqwuV5g4IMUXi7o0Naa
         +XDXegehSLWqeXuZIIpTGPnzo/Mil+mrfgmRD24vGRLrJ59xO3NplBSW1uK1O21fTRgX
         5C5JhiGCTNCbQ1EnWfyfsnB18KisLUuUZskQY9MbBu3lF2MDcZf/GY8//N93yNCT8wVg
         GsSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SPwnk6pXmAgLrJ/F1pWjro4mcwH/JSmVmco7aM8Uvg8=;
        b=FXLkLODfOX/HB9TCYVe6A3lmu8e69DGopx9arvoojBJ2g/hnkTc5DGfNb9CCTOaYu8
         uk4cT7FZ95cFOQ6LAtxDvmNZWU1vWqdfWrDxstEzsQoU9Z7H52bdIctSF94nRyn1NS86
         asgHPABpTcz7P/r/IcC5nuLUOIl4S0rjjpV3TsfgOjb/qr4ork+B5RhSK4kmPN0XCo5+
         AKeXcbxo6z0RVVdxhl3yUnRGdNOLsaKx+BCR1Z7Um1PycB80DqkhJCygl4Ll2oETXuQs
         NZCJkG6IwBjqStJJvqvxTFnfY4VZRwE8i5RkVy5xMXI9leyuwq7ybOGtgIGAB1WYFtSZ
         kqZw==
X-Gm-Message-State: AOAM531dygNrjVSb942RMg6gwaX3mR45Qqcgvs0kU58WRLNIJ407OS8k
	nPez5wPUfWj01W1Aexlazf0Z5J7j8Vedy9fm9RGdkw==
X-Google-Smtp-Source: ABdhPJxcRZFdudTUyk/drc7xmUkwEa2S0FLvcUqfBTJod1iaOM9mue+eipwNfJOfVRMMDDl4I5qscW0EhFdOvaLIG8A=
X-Received: by 2002:a05:6512:304a:: with SMTP id b10mr5281218lfb.475.1601901712772;
 Mon, 05 Oct 2020 05:41:52 -0700 (PDT)
MIME-Version: 1.0
References: <20201005095019.30755-1-siew.hoon.lim@intel.com>
In-Reply-To: <20201005095019.30755-1-siew.hoon.lim@intel.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Mon, 5 Oct 2020 13:41:41 +0100
Message-ID: <CAAnfSTsCaiKiZDTLVRmt=OZwgxDW-n35M0g+EpDR3EhVmzHYvA@mail.gmail.com>
Subject: Re: [oe] [PATCH] Alliance for Open Media: new library
To: Lim Siew Hoon <siew.hoon.lim@intel.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 5 Oct 2020 at 10:53, Lim Siew Hoon <siew.hoon.lim@intel.com> wrote:
> +DEPENDS_append = " yasm-native"

No need to use _append, just do DEPENDS = "".

> +inherit pkgconfig cmake perlnative python3native

You only need perlnative and python3native if you need to use
libraries that you DEPEND on.  As you don't DEPEND on any these are
not needed.

> +EXTRA_OECMAKE_append = " -DBUILD_SHARED_LIBS=1"

No need for _append.

Ross
