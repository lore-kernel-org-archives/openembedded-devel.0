Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web08.6814.1603254454904991211
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Oct 2020 21:27:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=TzBNIoBU;
 spf=pass (domain: ossystems.com.br, ip: 209.85.222.196, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qk1-f196.google.com with SMTP id f21so1149783qko.5
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Oct 2020 21:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=FVAMn3Z9wouQ/dT7poIFCcmR2ZVnZA81JyfR03Bvuz4=;
        b=TzBNIoBUhypUED/AxW9V03GPSEo1Wzvb/ARYxh8B36C6/Mde+j44QKnCJjLzhmQMy6
         RlsNXHSmRkEHtKqplbCuLs/ptWhcUNlTAYD13JTBi5XCyCTBgbABQg2TRGg4XZwdzhmf
         PzTuWEHE59fXwlfIh4EGUvlyIDI9HSzU7wtjMK2P+8GTNBAh3CTizuB9LWakzFCxGP0A
         NApZHYoO1H4tM8/b4aS+1oat0S971qO84Qv/SiSEe0F5eAMBDLkCGf4TfnbHR1PkOxhA
         Fv3yCgCz5vxqh8d8PeWDVDX+Yij0jbEoy83scWl4trFnOKuRy/wZSnhX9O/LMKujt59o
         Rx7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=FVAMn3Z9wouQ/dT7poIFCcmR2ZVnZA81JyfR03Bvuz4=;
        b=NrJhoc72vzUuKxBuyzY7sYrKujPXbSIs6HGrXpMEWKbLHvG2xqMwZGG2PXFypG/ZG5
         4eIhdbeJP4A8gVRzDNrL/Zq/ap2kPuDHxlrL23vXJFpIS4oVf9I3RTj8oFf7qPiKdipt
         5mbxJStDWRPmofYgwpSue8bI+1KgDXLoTc7RIfAbQDGHLY+RWiK2RqqilcVIVlh9uEzs
         6rY2l6gHGdeLSpWmMvIxQ+SHFFUgkXbViMFGo1d3ifYJF9mijUqB2lzPPAUC80Heh+ev
         71wTP692dUGhusAjC8lM3AlET31pyNt2ZiWUrcUDssaM/RZ54e7/Tk0RomIejToOVIpv
         r+1g==
X-Gm-Message-State: AOAM532kNJHydz61+bez5Vbk58K0yoVxLXI31HnWW+3Ga/1QZ1cH1qAh
	Iz/he8jHuzZESSTeKe2cDCUP/iGWTRvkO/L3
X-Google-Smtp-Source: ABdhPJx9iEGvtREuCwqEDSF2e6OryRrFtY1XjTCPBKbI4JPxk1Jevan5fCrxu37Kg06+z0jEfXRiEA==
X-Received: by 2002:a37:886:: with SMTP id 128mr1439169qki.484.1603254453705;
        Tue, 20 Oct 2020 21:27:33 -0700 (PDT)
Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com. [209.85.219.42])
        by smtp.gmail.com with ESMTPSA id 22sm675063qkg.15.2020.10.20.21.27.32
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2020 21:27:33 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qv1-f42.google.com with SMTP id t6so462133qvz.4
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Oct 2020 21:27:32 -0700 (PDT)
X-Received: by 2002:ad4:58e2:: with SMTP id di2mr1276080qvb.32.1603254452570;
 Tue, 20 Oct 2020 21:27:32 -0700 (PDT)
MIME-Version: 1.0
References: <20201021040049.933690-1-alistair@alistair23.me>
In-Reply-To: <20201021040049.933690-1-alistair@alistair23.me>
Date: Wed, 21 Oct 2020 01:27:20 -0300
X-Gmail-Original-Message-ID: <CAP9ODKpmAPYKKU1YxWsinMncrCA6Fwx4B-OOcu=Br7jp39Ohfg@mail.gmail.com>
Message-ID: <CAP9ODKpmAPYKKU1YxWsinMncrCA6Fwx4B-OOcu=Br7jp39Ohfg@mail.gmail.com>
Subject: Re: [oe] [PATCH] wayland-init: Allow setting idle time to 0
To: Alistair <alistair@alistair23.me>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em qua., 21 de out. de 2020 =C3=A0s 01:00, Alistair
<alistair@alistair23.me> escreveu:
>
> Add a PACKAGECONFIG that can be used to set the idle-time to 0. This is
> useful for always on machine (such as kiosks) and for debugging.
>
> Signed-off-by: Alistair Francis <alistair@alistair23.me>

Please use the proper recipe name, it is weston-init.


--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
