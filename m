Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web12.9275.1613252588874762193
 for <Openembedded-devel@lists.openembedded.org>;
 Sat, 13 Feb 2021 13:43:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KZmGkD9r;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: schnitzeltony@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id o38so1951507pgm.9
        for <Openembedded-devel@lists.openembedded.org>; Sat, 13 Feb 2021 13:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OXisChBcxbf6bSWW6attYVXLks8Tgh0eprmfPPoRqH0=;
        b=KZmGkD9rLQgE4gpC2Ikf/zvfCEFpF5wbBgaK/ql+uO5SXQhgbV2JnAenESKMDGoEBS
         XicQqUk+1jLqKFINPZw7SVM49kXx0BQcqKV5FdKCGd/zaSZr1O7FgBmOsmaN78x70dXU
         PT+lWGu48NfwkT+BznxVwuWzT1FKRofer7pkkproM4sPaBwT/uL5Po2P220XS2VAY7K7
         BRGmmCma4/fzGvQNNDCL9WlCwpoU0EdZN0tfyVOqGq/CesL3m9IW+ktP7ISoQmvHTJnh
         W3hFoOb6mrTo+GZ8MCapS3pAeWWpo4w6EujIJ1ZESP88SFs9O4J5QJgWFtsNn7QpUyR3
         A9MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OXisChBcxbf6bSWW6attYVXLks8Tgh0eprmfPPoRqH0=;
        b=TZerCC8+7PPuE7k4W7w8yhYGbc+nEoscmUys7tKQ995BMTTKX0S/KYOpGF2a/Y7Cgi
         XebU16Vec4rahVopHYoHXmsIkjOFTT73i+zDF6XagYy9cL86RURExctQrclnmYafl+oI
         L7TUf5SAUxV2tHIcGMLT+oSdMMMzDeSxE3+hw8ZwxqqQ+qAYLvwDEiRze7zSXbE5nfwn
         VHyTTlC3UftqluX7sVFroeBU3mkbDNmrgLKRnVSZ8uQF6F39EEzgzMc4KoiIYmIYyUA9
         1bCkTP2SuOU1KLCej827tuCLgcrcY10Wq2Qqf+Gz2AKq7NPhvAkwIpp2bPtwTF24U1M/
         /9Eg==
X-Gm-Message-State: AOAM532L+b9WSlQU0iJQ0ZZj469FOP0XsSKnXxaNa2VOAShYdJVpePDV
	fO1H57VeUO3dkg6FTgf3XsJ559/3KGXndfr7wRY=
X-Google-Smtp-Source: ABdhPJzkIjCr7184sGUmRC1fG9d3rb2jbL9ZhiGGVIAW9E8UrKZ6WPwsjj4lVBy9cLwyL1PemCXEHh5dk2P/DUBm85I=
X-Received: by 2002:a62:e515:0:b029:1b9:2dc3:a0da with SMTP id
 n21-20020a62e5150000b02901b92dc3a0damr8896534pff.9.1613252588392; Sat, 13 Feb
 2021 13:43:08 -0800 (PST)
MIME-Version: 1.0
References: <CAMKF1sroouPVRt9z-NnL6CQPGOcaYKNrAuTpaiZuYrFXmH69pw@mail.gmail.com>
In-Reply-To: <CAMKF1sroouPVRt9z-NnL6CQPGOcaYKNrAuTpaiZuYrFXmH69pw@mail.gmail.com>
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
Date: Sat, 13 Feb 2021 22:42:57 +0100
Message-ID: <CALbNGRTY=LUuOk3R-qFNDua7grq52iGDuCe2CrXq72Z93h40SA@mail.gmail.com>
Subject: Re: prepare_recipe_sysroot hashes change for yelp-xsl-native
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, Feb 13, 2021 at 12:51 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> Hi Andreas
>
> I am seeing this error
>
> http://jenkins.nas-admin.org/view/OE/job/oe_world_workspace-compare-signatures/1011/console
>
> like here
>
> % bitbake-diffsigs -t yelp-xsl-native do_populate_sysroot
> NOTE: Starting bitbake server...
> NOTE: Started PRServer with DBfile:
> /mnt/b/yoe/master/cache/prserv.sqlite3, IP: 127.0.0.1, PORT: 40561,
> PID: 1889403
> Hash for dependent task libxml/libxml2_2.9.10.bb:do_populate_sysroot
> changed from 63142a44ab89fba42814217d366391d8b06890bcc934c5e695795666e8d1a5e7
> to 4689a6ac4ad77ac5e7d0773f4096a7fa4d1d2c3c3e01475a471332c293bf8e51
> Unable to find matching sigdata for
> /mnt/b/yoe/master/sources/openembedded-core/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_populate_sysroot
> with hash 4689a6ac4ad77ac5e7d0773f4096a7fa4d1d2c3c3e01475a471332c293bf8e51
>
> it seems to be related to
>
> https://git.openembedded.org/meta-openembedded/commit/?id=94f61f7330d4d114660f1d5edc4080fe672306e6
>
> where I see
>
> RDEPENDS_${PN}_append_class-native = " libxml2"
>
> which adds a dependency on target package to native package is that intended ?
Hi Khem,

No I think it was a copy & paste bug. Saw your patch: Thanks

Andreas
