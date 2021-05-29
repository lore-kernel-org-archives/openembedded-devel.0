Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web08.22800.1622307996726240337
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 29 May 2021 10:06:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gAcFl+u2;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id g24so4272493pji.4
        for <openembedded-devel@lists.openembedded.org>; Sat, 29 May 2021 10:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MMb+8zkghw5eV5zxFyMOe4LIKWpgRtRR9OUZWvPXxQo=;
        b=gAcFl+u2jPC176M0fXhLxy5FqAPGx5SlJpaA4bhl7BZVfOfw/0uJcDraLtKfNsfJUR
         l3rvyZjmtLxI1FPq3O6ulCPgGph0quIo7bbwkDh/e3UWZFJT9/3Hk68gVCbJZMUEDnvt
         tIpiltYfZb/mGH70ug3rq9otyi/9cj7jgCpYFcmkXMbvcPy8ZKPkKAKueixcftg9z5aO
         dqXQulOyLABU0goadUyrpBiy8APHWKZUfVxKaR0pXuL1VjqbAL8eTXu7JI4ghfYeap+g
         tywh6vz2ubnnR2B0IAMy5EhGcamDrdu7ydj7fbH2GS+AAvnZR9wSDzk+iMw6DgUmeank
         y75A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=MMb+8zkghw5eV5zxFyMOe4LIKWpgRtRR9OUZWvPXxQo=;
        b=ZjnywXrri8ldHuv9nbbA4KKiEgJdJ4b4p1pD/p0JpDljaRzyFuJR4w9RYn920neC7g
         wNBceicDD4B7s4JwEGR6C+a6BGCCWUAOYCe+kaJil8XE15XqwNgd957dmXZVhEXvwZZv
         lJ++5602gd+nyoEQ46nzPPluu0AcaS0qou0/p3U7VU2zlrquPeTAT+v6hAnfj5mjjYtY
         /BLpFeTJQfr0n5sr6P/g7e6BWjJjM9SrIZz27ejMLj0nmewHhRyJ134Wo6PcX32weBcU
         kJBOtUUtdLhg4sSRtdbIwsYmHpwQMU03Qk6+yKV7AphUXi591Z8PNlxFQWo1xAYVc43+
         VkbA==
X-Gm-Message-State: AOAM530GJ6FiedzufCLGhcTIJakjdslqo4LV9pvH9OibQamn5tDuojhL
	36nuruyRUfjlwgINDqay4aWqMuuZdgeaYQ==
X-Google-Smtp-Source: ABdhPJxlwpEJiw/Xcr1HZcEJ/M3sV0HmPZeNKCJRUOGnO2xZOjyYgrw7/K1S/z3/OrSatX8HegTq5g==
X-Received: by 2002:a17:902:c94e:b029:f5:6f10:6ea2 with SMTP id i14-20020a170902c94eb02900f56f106ea2mr13410672pla.75.1622307995859;
        Sat, 29 May 2021 10:06:35 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:69a6:1b71:6b06:2b49? ([2601:646:9200:a0f0:69a6:1b71:6b06:2b49])
        by smtp.gmail.com with ESMTPSA id p15sm6967722pjb.8.2021.05.29.10.06.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 May 2021 10:06:35 -0700 (PDT)
Subject: Re: [oe] [meta-oe][master][PATCH 1/2] p7zip: build and package lib7z.so needed for fastboot
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Nisha Parrakat <Nisha.Parrakat@kpit.com>,
 "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <20210526173229.553-1-Nisha.Parrakat@kpit.com>
 <57321835-c8d5-754f-b974-6ee35912f88d@gmail.com>
 <PN0PR01MB52838F54DAB2752439C8C9BEEE249@PN0PR01MB5283.INDPRD01.PROD.OUTLOOK.COM>
 <CAMKF1sqZ1B1CXha8DPVPZxz+JOjyLoqVCptuLfexJStnjroAhw@mail.gmail.com>
 <CA+chaQeQruUasefzSrxG1YuaFvNer85RwduAA=Om4HYYQFFFfA@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <9cb3d254-988e-ddbe-60e2-cdc61e45e822@gmail.com>
Date: Sat, 29 May 2021 10:06:33 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <CA+chaQeQruUasefzSrxG1YuaFvNer85RwduAA=Om4HYYQFFFfA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 5/29/21 1:55 AM, Martin Jansa wrote:
> The version merged in master with:
> https://git.openembedded.org/meta-openembedded/commit/?id=3c36a8efe2a964c3aa9bfcd836cee3f80a837fcd 
> <https://git.openembedded.org/meta-openembedded/commit/?id=3c36a8efe2a964c3aa9bfcd836cee3f80a837fcd>
> 
> still doesn't apply cleanly:
> 

yes infact and CI reported it too

http://jenkins.nas-admin.org/view/OE/job/oe_world_qemuarm/2665/console

and I missed loooking beyond the gensio issue there.

> WARNING: p7zip-16.02-r0 do_patch: Fuzz detected:
> 
> Applying patch change_numMethods_from_bool_to_unsigned.patch
> patching file CPP/7zip/Archive/Wim/WimHandler.cpp
> Hunk #1 succeeded at 298 with fuzz 1.
> 
> 
> The context lines in the patches can be updated with devtool:
> 
>      devtool modify p7zip
>      devtool finish --force-patch-refresh p7zip <layer_path>
> 
> Don't forget to review changes done by devtool!
> 
> WARNING: p7zip-16.02-r0 do_patch: QA Issue: Patch log indicates that 
> patches do not apply cleanly. [patch-fuzz]
> 
> Will send a fix for this.
> 

really appreacite that.

> On Wed, May 26, 2021 at 9:09 PM Khem Raj <raj.khem@gmail.com 
> <mailto:raj.khem@gmail.com>> wrote:
> 
>     they dont apply
> 
>     patching file
>     'meta-oe/recipes-extended/p7zip/files/change_numMethods_from_bool_to_u='
>     patch: **** malformed patch at line 178: tual LONG
>     NArchive::NWim::CHandler::GetArchiveProperty(PROPID, PROPVARIANT*=
> 
>     ensure that your MUA is not modifying these patches on the way,
>     simple output of
> 
>     git format-patch ...
>     git send-email .....
> 
>     usually works reliably
> 
>     On Wed, May 26, 2021 at 11:45 AM Nisha Parrakat
>     <Nisha.Parrakat@kpit.com <mailto:Nisha.Parrakat@kpit.com>> wrote:
>      >
>      > hi Khem,
>      > It is rebased to master already. do you want me to upstream to
>     master-next too ?
>      >
>      > Regards,
>      > Ms Nisha Parrakat
>      > KPIT Technologies GmbH
>      >
>      >
>      >
>      > ________________________________
>      > From: openembedded-devel@lists.openembedded.org
>     <mailto:openembedded-devel@lists.openembedded.org>
>     <openembedded-devel@lists.openembedded.org
>     <mailto:openembedded-devel@lists.openembedded.org>> on behalf of
>     Khem Raj via lists.openembedded.org <http://lists.openembedded.org>
>     <raj.khem=gmail.com@lists.openembedded.org
>     <mailto:gmail.com@lists.openembedded.org>>
>      > Sent: 26 May 2021 19:53
>      > To: Nisha Parrakat <Nisha.Parrakat@kpit.com
>     <mailto:Nisha.Parrakat@kpit.com>>;
>     openembedded-devel@lists.openembedded.org
>     <mailto:openembedded-devel@lists.openembedded.org>
>     <openembedded-devel@lists.openembedded.org
>     <mailto:openembedded-devel@lists.openembedded.org>>
>      > Subject: Re: [oe] [meta-oe][master][PATCH 1/2] p7zip: build and
>     package lib7z.so needed for fastboot
>      >
>      > please rebase these patches on top of master or master-next and
>     resend.
>      >
>      > On 5/26/21 10:32 AM, Nisha Parrakat wrote:
>      > > From: Nisha Parrakat <nisha.parrakat@kpit.com
>     <mailto:nisha.parrakat@kpit.com>>
>      > >
>      > > a) use option 7z to build the lib7z.so library
>      > > This is needed for android-tools for building fastboot
>      > > from android-tools
>      > >
>      > > b) Packaged the lib7z.so and codec libraries as a part of this
>     recipe
>      > > Fastboot RDepends on it lib7z.so
>      > >
>      > > c) Fixed a C++17 forbidden error when lib7z.so is built
>      > >
>      > > fixes the below error
>      > >
>      > > | ../../../../CPP/7zip/Archive/Wim/WimHandler.cpp: In member
>     function 'virtual LONG
>     NArchive::NWim::CHandler::GetArchiveProperty(PROPID, PROPVARIANT*)':
>      > > | ../../../../CPP/7zip/Archive/Wim/WimHandler.cpp:308:11:
>     error: use of an operand of type 'bool' in 'operator++' is forbidden
>     in C++17
>      > > |   308 |           numMethods++;
>      > > |       |           ^~~~~~~~~~
>      > > | ../../../../CPP/7zip/Archive/Wim/WimHandler.cpp:318:9: error:
>     use of an operand of type 'bool' in 'operator++' is forbidden in C++17
>      > > |   318 |         numMethods++;
>      > >
>      > > Signed-off-by: Nisha Parrakat <Nisha.Parrakat@kpit.com
>     <mailto:Nisha.Parrakat@kpit.com>>
>      > > ---
>      > >   ...nge_numMethods_from_bool_to_unsigned.patch | 25
>     +++++++++++++++++++
>      > >   meta-oe/recipes-extended/p7zip/p7zip_16.02.bb
>     <http://p7zip_16.02.bb> | 21 ++++++++++++++--
>      > >   2 files changed, 44 insertions(+), 2 deletions(-)
>      > >   create mode 100644
>     meta-oe/recipes-extended/p7zip/files/change_numMethods_from_bool_to_unsigned.patch
>      > >
>      > > diff --git
>     a/meta-oe/recipes-extended/p7zip/files/change_numMethods_from_bool_to_unsigned.patch
>     b/meta-oe/recipes-extended/p7zip/files/change_numMethods_from_bool_to_unsigned.patch
>      > > new file mode 100644
>      > > index 000000000..edde52593
>      > > --- /dev/null
>      > > +++
>     b/meta-oe/recipes-extended/p7zip/files/change_numMethods_from_bool_to_unsigned.patch
>      > > @@ -0,0 +1,25 @@
>      > > +fixes the below error
>      > > +
>      > > +| ../../../../CPP/7zip/Archive/Wim/WimHandler.cpp: In member
>     function 'virtual LONG
>     NArchive::NWim::CHandler::GetArchiveProperty(PROPID, PROPVARIANT*)':
>      > > +| ../../../../CPP/7zip/Archive/Wim/WimHandler.cpp:308:11:
>     error: use of an operand of type 'bool' in 'operator++' is forbidden
>     in C++17
>      > > +|   308 |           numMethods++;
>      > > +|       |           ^~~~~~~~~~
>      > > +| ../../../../CPP/7zip/Archive/Wim/WimHandler.cpp:318:9:
>     error: use of an operand of type 'bool' in 'operator++' is forbidden
>     in C++17
>      > > +|   318 |         numMethods++;
>      > > +
>      > > +
>      > > +use unsigned instead of bool
>      > > +Signed-off-by: Nisha Parrakat <Nisha.Parrakat@kpit.com
>     <mailto:Nisha.Parrakat@kpit.com>>
>      > > +
>      > > +Upstream-Status: Pending
>      > > +--- ./CPP/7zip/Archive/Wim/WimHandler.cpp       2021-05-20
>     10:51:56.997402701 +0000
>      > > ++++ ./CPP/7zip/Archive/Wim/WimHandler.cpp       2021-05-20
>     10:52:16.665604125 +0000
>      > > +@@ -298,7 +298,7 @@
>      > > +
>      > > +       AString res;
>      > > +
>      > > +-      bool numMethods = 0;
>      > > ++      unsigned numMethods = 0;
>      > > +       for (unsigned i = 0; i < ARRAY_SIZE(k_Methods); i++)
>      > > +       {
>      > > +         if (methodMask & ((UInt32)1 << i
>      > > diff --git a/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb
>     <http://p7zip_16.02.bb>
>     b/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb <http://p7zip_16.02.bb>
>      > > index 13479a90f..ada49114c 100644
>      > > --- a/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb
>     <http://p7zip_16.02.bb>
>      > > +++ b/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb
>     <http://p7zip_16.02.bb>
>      > > @@ -9,6 +9,7 @@ SRC_URI =
>     "https://apc01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fdownloads.sourceforge.net%2Fp7zip%2Fp7zip%2F%24&amp;data=04%7C01%7CNisha.Parrakat%40kpit.com%7C4007f511cd0b4b0d527b08d9206f3956%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637576484370502332%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=VGFDLma%2Bgwj5%2BsqrJlZRql2MDK4kKghHvq0FBP9pXP4%3D&amp;reserved=0{PV}/p7zip_${PV}_src_al
>     <https://apc01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fdownloads.sourceforge.net%2Fp7zip%2Fp7zip%2F%24&amp;data=04%7C01%7CNisha.Parrakat%40kpit.com%7C4007f511cd0b4b0d527b08d9206f3956%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637576484370502332%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=VGFDLma%2Bgwj5%2BsqrJlZRql2MDK4kKghHvq0FBP9pXP4%3D&amp;reserved=0%7BPV%7D/p7zip_$%7BPV%7D_src_al>
>      > >             
>     file://do_not_override_compiler_and_do_not_strip.patch \
>      > >              file://CVE-2017-17969.patch \
>      > >             
>     file://0001-Fix-narrowing-errors-Wc-11-narrowing.patch \
>      > > +           file://change_numMethods_from_bool_to_unsigned.patch \
>      > >              "
>      > >
>      > >   SRC_URI[md5sum] = "a0128d661cfe7cc8c121e73519c54fbf"
>      > > @@ -16,10 +17,26 @@ SRC_URI[sha256sum] =
>     "5eb20ac0e2944f6cb9c2d51dd6c4518941c185347d4089ea89087ffdd6
>      > >
>      > >   S = "${WORKDIR}/${BPN}_${PV}"
>      > >
>      > > +do_compile_append() {
>      > > +    oe_runmake 7z
>      > > +}
>      > > +FILES_${PN} += "${libdir}/* ${bindir}/7z"
>      > > +
>      > > +FILES_SOLIBSDEV = ""
>      > > +INSANE_SKIP_${PN} += "dev-so"
>      > > +
>      > >   do_install() {
>      > >          install -d ${D}${bindir}
>      > > -       install -m 0755 ${S}/bin/* ${D}${bindir}
>      > > +       install -d ${D}${bindir}/Codecs
>      > > +       install -d ${D}${libdir}
>      > > +       install -d ${D}${libdir}/Codecs
>      > > +       install -m 0755 ${S}/bin/7za ${D}${bindir}
>      > >          ln -s 7za ${D}${bindir}/7z
>      > > +       install -m 0755 ${S}/bin/Codecs/* ${D}${libdir}/Codecs/
>      > > +       install -m 0755 ${S}/bin/7z.so ${D}${libdir}/lib7z.so
>      > >   }
>      > >
>      > > -BBCLASSEXTEND = "native"
>      > > +RPROVIDES_${PN} += "lib7z.so()(64bit) 7z lib7z.so"
>      > > +RPROVIDES_${PN}-dev += "lib7z.so()(64bit) 7z lib7z.so"
>      > > +
>      > > +BBCLASSEXTEND = "native nativesdk"
>      > > --
>      > > 2.17.1
>      > >
>      > > This message contains information that may be privileged or
>     confidential and is the property of the KPIT Technologies Ltd. It is
>     intended only for the person to whom it is addressed. If you are not
>     the intended recipient, you are not authorized to read, print,
>     retain copy, disseminate, distribute, or use this message or any
>     part thereof. If you receive this message in error, please notify
>     the sender immediately and delete all copies of this message. KPIT
>     Technologies Ltd. does not accept any liability for virus infected
>     mails.
>      > >
>      > This message contains information that may be privileged or
>     confidential and is the property of the KPIT Technologies Ltd. It is
>     intended only for the person to whom it is addressed. If you are not
>     the intended recipient, you are not authorized to read, print,
>     retain copy, disseminate, distribute, or use this message or any
>     part thereof. If you receive this message in error, please notify
>     the sender immediately and delete all copies of this message. KPIT
>     Technologies Ltd. does not accept any liability for virus infected
>     mails.
> 
>     
> 
