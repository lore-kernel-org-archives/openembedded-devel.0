Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B96E5C369C2
	for <webhook@archiver.kernel.org>; Sat,  3 May 2025 17:19:22 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web10.14908.1746292759725449449
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 03 May 2025 10:19:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FenlKR6O;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5f7ec0e4978so769784a12.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 03 May 2025 10:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746292758; x=1746897558; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tXLGlqKw7BTNVOH2ojQjGpOcfiSzoMO9cjn26L/KHKo=;
        b=FenlKR6OH+6Ap3Ro0OZ5UkmqJHY8Md8RLn2EVUU76C3ixVFqssX/bzm82EoqI0NZ8z
         K6ocLwFNeG0rkJU9BixA1SkLfkR91m+FpZ4R6O01ELOmrbpnA8KIzQmay7AQSZhFEGxM
         /Jvq6I8umraXJJ/SsZoDirAl+3lgMah5WWWqL2wmwrJRDqpDTQp3WEAiunFZhfIHBFow
         I/XUcnAYnmQl98jYCEl2DY7YW4YDoI/b8zfjpjnTO4EFnx+0UbdowMAC03bYCC+YYEvG
         bEMGTnzwDYRfNsZ1yNFXaMaQt+CdlFHTlY0fWnS5KOcxj8xiy86GttEJd6dsDPtXUxOU
         O1fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746292758; x=1746897558;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tXLGlqKw7BTNVOH2ojQjGpOcfiSzoMO9cjn26L/KHKo=;
        b=I3mBbTHzqCaEbJq3a1qaR/YLyrFB/RTpL07W32Owkv0SatTRibggK5mKI4AYcqgVxz
         nq+s6chDul9+2Dzs/LvwPJ1GmgebGoAAiT+L4bYjWzLdkGkViecSThaLq7PISOeB/5kv
         d7YR6P1gpXytIy812d61AW1Ghs1WdwyEAVGu+Bq+8cdQ+J6lfceLQvX8pEnbKE/0vt5Q
         KaAENgiUaf7VfDKBCten0RJAvDwQEWqGPM8kEbcBOhsl/7zGKp1EwjAuCpx98Q/+1GJD
         T1ZEYjDZ8bDVsITHuXXGNPbNVPiJ0kRTH1VI/uCyk2Ju9iVeGMI+ayLDVoyVdAwnXiLA
         ybBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrZ0dvM1icMvquYHnPQAKAVI2p2VcRZUZbgzUC3QEK94ZrG4/dfIjAiy8tjuNgLK/ku4OVjZRQyW8xQSuz5pefhZw=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxTil4maIqn77wlRqNGGzqm0YXCY9XvL2207DSQ3zA1t77ZMPql
	ptPmzM+xFxyOOyammnhaotHvOvqEDFiVZ0Md7b4DL4ChrDeWZ2g2
X-Gm-Gg: ASbGncsNpp88YgdOuGHwpqZ/0slZ6i+uo0J1oRq0IIVpf5xOIDDk/e0Ef6biNqOJTho
	lvbtvZPomCoxvFNBiHBtQdie2B0IwqVB7p81OQfWcxn6kVuereDkOx+2UTl76H18VPVarDTkD86
	YXDrTKbO6iReQqjdTMzNzDKtZ8HnphsNp2I8jTLOl7PXhY0fbHOMuGl/iSiB+WByrungSPjNdLa
	b4fkJ9EJPHKiwffWLOfWEDZmimd7Fm74Ryjpp9MpTDPGKlL3+6AQcpV1HZUx88oTNgbywPKuUmc
	J72YIlTkC52BBcskJ3OFIAZk8luQNd1zu6l/3i7tmTeXtO8vTF1g8d3GrWc=
X-Google-Smtp-Source: AGHT+IGzaA3K7FusaRZFNS4eKDuDhJFWSquRFD87xUXMUtRKlDTvXH9cZVQAg2WzcoF9K9Xz4gSEPQ==
X-Received: by 2002:a05:6402:2805:b0:5fa:8277:3d5c with SMTP id 4fb4d7f45d1cf-5faa8030b58mr2862998a12.30.1746292757626;
        Sat, 03 May 2025 10:19:17 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fa77756132sm2910980a12.7.2025.05.03.10.19.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 May 2025 10:19:17 -0700 (PDT)
Message-ID: <3ef9f010-d5ac-4556-b557-235922658e16@gmail.com>
Date: Sat, 3 May 2025 19:19:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] libsimplelog: Add a versatile C/C++ logger.
To: =?UTF-8?B?VGh14bqtbiBOZ3V54buFbi1UaMOhaQ==?=
 <nguyenthaithuanalg@gmail.com>,
 "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <20250503135343.2207393-1-nguyenthaithuanalg@gmail.com>
 <1e6f9b15-1cf3-489f-8c3d-a0b56d415336@gmail.com>
 <CANBtAgdj5OOhkxp=HEgge2GeOynmOGsfvtC239FDYMEjq6BBJg@mail.gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <CANBtAgdj5OOhkxp=HEgge2GeOynmOGsfvtC239FDYMEjq6BBJg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 03 May 2025 17:19:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117286

Please keep the discussion on the mailing list.

I meant the master branch of meta-openembedded repository. libsimplelog
recipe is already part of it - please submit your changes by modifying
the existing recipe instead of submitting a brand new one.

On 5/3/25 19:06, Thuận Nguyễn-Thái wrote:
> Hi Gyorgy,
> I submitted the latest  release ( tag v1.0.6), I'm sure that is my
> best version.
> Best regards,
> Thuan
>
> On Sun, May 4, 2025 at 12:03 AM Gyorgy Sarvari <skandigraun@gmail.com>
> wrote:
>
>     This recipe is already in the repository - make sure to make your
>     changes on top of the latest revision of the master branch of the
>     project.
>
>     On 5/3/25 15:53, Thuận Nguyễn-Thái via lists.openembedded.org
>     <http://lists.openembedded.org> wrote:
>     > - Simple, stable, powerful.
>     > - Apply for embedded devices to PC, server.
>     >
>     > Signed-off-by: Thuan Nguyen Thai <nguyenthaithuanalg@gmail.com>
>     > ---
>     >  .../libsimplelog/libsimplelog_1.0.6.bb
>     <http://libsimplelog_1.0.6.bb>        | 19 +++++++++++++++++++
>     >  1 file changed, 19 insertions(+)
>     >  create mode 100644
>     meta-oe/recipes-support/libsimplelog/libsimplelog_1.0.6.bb
>     <http://libsimplelog_1.0.6.bb>
>     >
>     > diff --git
>     a/meta-oe/recipes-support/libsimplelog/libsimplelog_1.0.6.bb
>     <http://libsimplelog_1.0.6.bb>
>     b/meta-oe/recipes-support/libsimplelog/libsimplelog_1.0.6.bb
>     <http://libsimplelog_1.0.6.bb>
>     > new file mode 100644
>     > index 000000000..c159492aa
>     > --- /dev/null
>     > +++ b/meta-oe/recipes-support/libsimplelog/libsimplelog_1.0.6.bb
>     <http://libsimplelog_1.0.6.bb>
>     > @@ -0,0 +1,19 @@
>     > +
>     > +SUMMARY = "simplelog-topc - Simple, STABLE, powerful of logging
>     library in ANSI C/C++. Ready for billion records."
>     > +DESCRIPTION = "Async and Fast C/C++ multi-thread logger with
>     topics. No external dependencies."
>     > +HOMEPAGE = "https://github.com/thuanalg/simplelog-topic"
>     > +LICENSE = "MIT"
>     > +LIC_FILES_CHKSUM =
>     "file://LICENSE.txt;md5=22cdd382a6275cb4c2e75c517952ac7c"
>     > +
>     > +SRC_URI =
>     "git://github.com/thuanalg/simplelog-topic.git;branch=main;protocol=https;tag=v1.0.6
>     <http://github.com/thuanalg/simplelog-topic.git;branch=main;protocol=https;tag=v1.0.6>"
>     > +
>     > +SRCREV = "7676b9cf871bedd8648d2cf68ebf43dc2c79b94d"
>     > +
>     > +S = "${WORKDIR}/git"
>     > +
>     > +inherit cmake
>     > +
>     > +# Specify any options you want to pass to cmake using
>     EXTRA_OECMAKE:
>     > +EXTRA_OECMAKE += "-DUNIX_LINUX=1"
>     > +
>     > +
>     >
>     > -=-=-=-=-=-=-=-=-=-=-=-
>     > Links: You receive all messages sent to this group.
>     > View/Reply Online (#117284):
>     https://lists.openembedded.org/g/openembedded-devel/message/117284
>     > Mute This Topic: https://lists.openembedded.org/mt/112598333/6084445
>     > Group Owner: openembedded-devel+owner@lists.openembedded.org
>     <mailto:openembedded-devel%2Bowner@lists.openembedded.org>
>     > Unsubscribe:
>     https://lists.openembedded.org/g/openembedded-devel/unsub
>     [skandigraun@gmail.com]
>     > -=-=-=-=-=-=-=-=-=-=-=-
>     >
>


