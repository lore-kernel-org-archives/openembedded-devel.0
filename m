Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
 by mx.groups.io with SMTP id smtpd.web11.3816.1585635487766426676
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Mar 2020 23:18:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jIzdez8b;
 spf=pass (domain: gmail.com, ip: 209.85.166.178, mailfrom: alex.kiernan@gmail.com)
Received: by mail-il1-f178.google.com with SMTP id a6so18327091ilr.4
        for <openembedded-devel@lists.openembedded.org>; Mon, 30 Mar 2020 23:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=uCBPOyKQJRZKoJx0OhfEjY4CfEVAUu6iQDLrSa2ZyEc=;
        b=jIzdez8b44o4dxRCoXIrqLK+DSZmurcEQ9a+Ph7HlaBJtgaetH4vQLXtulY23g7KTi
         Fzj90Ri2+kaFXyqxxUoXL7shry3IvrfUYHfgnD1hJha5dKX+TJ7CAjHzbayTqUvbbvZq
         xTpNFM36wdALGqV29hBXw/4pYlpMo7I2sBTGmgAN+yppvfE4J+POfhocxoZcb1k7WJuj
         y8OXIv0TS90HN2ITyGh0F4tSijJMBdSAsZagQVTCwaSotLmdqIsWh/e6AW0TGks0AGoM
         FeUmmVyDeDDU7KCZ8gLL97IarieD3WkyaoBBj+9sr8gDYgbG0NWUoxxII+nWpD6dIH5D
         XsjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=uCBPOyKQJRZKoJx0OhfEjY4CfEVAUu6iQDLrSa2ZyEc=;
        b=EOGRA3+iP9Vf29IGL5utqMrppv0dCmBKO+meA1PcRf/OWdGlvjNIEJYclFiVeaLJF/
         mi/AEKVDFlLwhZgVWtWKP9T52Z/auyw7IA6aUaMXA8q8nWXPKpz6nFcC9lq2/rWzZW7L
         5Y5qNwe2gqpHz4oCIRzccEONPRFZYQXM7lbIZ0cGdgQO9Yo6CCpqz9uqKooRR0scfCps
         HZlJdfBE0XxFASbAuM0whcv2KfUa7owo1tX6bDrifNrujtxrZbyjpcbo9f5XLrhla1yi
         h5MEjp7z5gANQjpw5vpvp0Yd1c0QVPzVdAh0+fIZ4GFj/SyQL8zhh7ZCvvtnUtqjWuz7
         Zb9A==
X-Gm-Message-State: ANhLgQ3gNc6X8aC6LL06gQSRLjv/d42zyxJ3rQnzICLK1bS4KRlUHenV
	eTuMKVCROMS+7hxFQsuQwoXKjcVLDxNHAi40H1A=
X-Google-Smtp-Source: ADFU+vtVo4SvECzvFLxrbNxc5E8e+DZoNyAf/W8nvypdGec+ttJXEtxAY0rMBX+u7Pfz1RvUZlCSyGT/2DPgHnTPcpg=
X-Received: by 2002:a92:ce06:: with SMTP id b6mr15913466ilo.102.1585635486806;
 Mon, 30 Mar 2020 23:18:06 -0700 (PDT)
MIME-Version: 1.0
References: <BY5PR11MB4307FAE9DC43F1587395B1FEE7C80@BY5PR11MB4307.namprd11.prod.outlook.com>
In-Reply-To: <BY5PR11MB4307FAE9DC43F1587395B1FEE7C80@BY5PR11MB4307.namprd11.prod.outlook.com>
From: "Alex Kiernan" <alex.kiernan@gmail.com>
Date: Tue, 31 Mar 2020 07:17:55 +0100
Message-ID: <CAO5Uq5S43bAyCv2Z58APL70xWEFXdHi8+UvsXy7PE0rrkt8LGA@mail.gmail.com>
Subject: Re: Request to Revert 'recipes: rename distro_features_check to features_check' comit on meta-java zeus branch
To: Geoff Parker <Geoffrey.Parker@arthrex.com>, 
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 31, 2020 at 5:46 AM Geoff Parker
<Geoffrey.Parker@arthrex.com> wrote:
>
> Hi Alex,
>
> We  moved one of our products to the zeus Yocto 3.0 meta layer branches. It recently stopped building due to this commit on the meta-java zeus branch:
>
> commit d2e962a795e8713e5443659669842298453d938f
> Author: Alex Kiernan <alex.kiernan@gmail.com>
> Date:   Sat Dec 7 18:07:38 2019 +0000
>
>    recipes: rename distro_features_check to features_check
>
>    Avoid warning due to the class rename in OE-Core.
>
>    Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
>    Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
>
> Although this change is appropriate for the Yocto 3.1 branches, it breaks our build on Yocto 3.0 zeus because the zeus branch of the openembedded-core layer does not have the features_check class.
>
> The following recipes fail to parse:
>
>   openjdk-7_99b00-2.6.5.bb
>   classpath_0.99.bb
>   cacao_2d6fc614daf9.bb
>
> With errors like:
>
> ERROR: ParseError at /home/geoff/yocto-ccu/poky/build/../meta-java/recipes-core/openjdk/openjdk-7_99b00-2.6.5.bb:7: Could not
> inherit file classes/features_check.bbclass
>
> Can this commit be reverted?
>

@OpenEmbedded Devel List this shouldn't have been pulled into zeus as
it relies on changes in master on oe-core

-- 
Alex Kiernan
