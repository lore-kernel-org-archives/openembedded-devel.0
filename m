Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web11.1862.1622056192167204522
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 May 2021 12:09:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vCqf9kVp;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id ez19so1336611qvb.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 May 2021 12:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Y1EdQqhIDFm4w3rBWidh8aGPosBIkPZDrqBskCd0lwM=;
        b=vCqf9kVphbEwA5u9l8F7UGlEIr4na7vX58cxetjVmluMkDo1ksdSc2p/LiM1k7WGSw
         0lHYQAbyu3O77gqoncsinufWjJVadoJznMhqqj9uLfDzajLsibqWp8aAyEYbnkbHrMpn
         d9Kg65S6G2OxxIdKPsau64bY4LAdvGeGaQ/mX5/9YjihH2+4qIdprN76HsvHKxwAViFu
         wNaOACph8wuw/E/J+sythd3ub8JkLdbUfvFDHra7aYBIpPZDigQm7vsioo1+tEoO1is9
         hGkUIBshj2UqU87GRMzbPzAnwHfRBkJ5qbB2tDvWGv1DHxTGFLoZwIDQPyaBWV6ORvBe
         S42A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Y1EdQqhIDFm4w3rBWidh8aGPosBIkPZDrqBskCd0lwM=;
        b=JNU+/a4bVwfWCiWWA9+usy5tNw9cRhQ11tFklq/SqVPwR6rbEb9I5kkkNyD/MTIp07
         a6bNAIYZspaosaGW9bvzTeC0JCqSrczcE+OJly4Kckru9diRMNBN2vfXQO/nAPEMFsZ3
         T0hpQezgKbe2CKdXHJyFUQo9V7pBhuv6BsuVWPKv0Lq2od1EkKBqO5A++r+e8RiPdEp4
         8qp4IZWUmdzGCMElY+A2/eUmd3uy1OYIx+V+UFfcqiiHo6YVuw8MRIx8IBzZg1biTvUM
         N7DM2wuhzwHYWw/oRLKO9WZk6uEYGww8HT0HI2apY1DnH2s9osjxvcz4Di6AbJPF/lVf
         NRAg==
X-Gm-Message-State: AOAM531/GLAoqcM7wjNhuZuIgd37KrbIDky789x91gv0xFo8mTn3F0g/
	QtLDPuaPhPhQS4dtEdgawrlAveQyugt1iEE12TU=
X-Google-Smtp-Source: ABdhPJy405iCfVyetao8o2xzwuMcG7fHOGKJQj+jn4T4H3wOHSf6UNsG8Pki+qmz0EGILjDTIQlXvj0jw5mejTQDK4o=
X-Received: by 2002:ad4:4e91:: with SMTP id dy17mr44552392qvb.55.1622056191287;
 Wed, 26 May 2021 12:09:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210526173229.553-1-Nisha.Parrakat@kpit.com> <57321835-c8d5-754f-b974-6ee35912f88d@gmail.com>
 <PN0PR01MB52838F54DAB2752439C8C9BEEE249@PN0PR01MB5283.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <PN0PR01MB52838F54DAB2752439C8C9BEEE249@PN0PR01MB5283.INDPRD01.PROD.OUTLOOK.COM>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 26 May 2021 12:09:24 -0700
Message-ID: <CAMKF1sqZ1B1CXha8DPVPZxz+JOjyLoqVCptuLfexJStnjroAhw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][master][PATCH 1/2] p7zip: build and package lib7z.so needed for fastboot
To: Nisha Parrakat <Nisha.Parrakat@kpit.com>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

they dont apply

patching file 'meta-oe/recipes-extended/p7zip/files/change_numMethods_from_=
bool_to_u=3D'
patch: **** malformed patch at line 178: tual LONG
NArchive::NWim::CHandler::GetArchiveProperty(PROPID, PROPVARIANT*=3D

ensure that your MUA is not modifying these patches on the way, simple outp=
ut of

git format-patch ...
git send-email .....

usually works reliably

On Wed, May 26, 2021 at 11:45 AM Nisha Parrakat <Nisha.Parrakat@kpit.com> w=
rote:
>
> hi Khem,
> It is rebased to master already. do you want me to upstream to master-nex=
t too ?
>
> Regards,
> Ms Nisha Parrakat
> KPIT Technologies GmbH
>
>
>
> ________________________________
> From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists=
.openembedded.org> on behalf of Khem Raj via lists.openembedded.org <raj.kh=
em=3Dgmail.com@lists.openembedded.org>
> Sent: 26 May 2021 19:53
> To: Nisha Parrakat <Nisha.Parrakat@kpit.com>; openembedded-devel@lists.op=
enembedded.org <openembedded-devel@lists.openembedded.org>
> Subject: Re: [oe] [meta-oe][master][PATCH 1/2] p7zip: build and package l=
ib7z.so needed for fastboot
>
> please rebase these patches on top of master or master-next and resend.
>
> On 5/26/21 10:32 AM, Nisha Parrakat wrote:
> > From: Nisha Parrakat <nisha.parrakat@kpit.com>
> >
> > a) use option 7z to build the lib7z.so library
> > This is needed for android-tools for building fastboot
> > from android-tools
> >
> > b) Packaged the lib7z.so and codec libraries as a part of this recipe
> > Fastboot RDepends on it lib7z.so
> >
> > c) Fixed a C++17 forbidden error when lib7z.so is built
> >
> > fixes the below error
> >
> > | ../../../../CPP/7zip/Archive/Wim/WimHandler.cpp: In member function '=
virtual LONG NArchive::NWim::CHandler::GetArchiveProperty(PROPID, PROPVARIA=
NT*)':
> > | ../../../../CPP/7zip/Archive/Wim/WimHandler.cpp:308:11: error: use of=
 an operand of type 'bool' in 'operator++' is forbidden in C++17
> > |   308 |           numMethods++;
> > |       |           ^~~~~~~~~~
> > | ../../../../CPP/7zip/Archive/Wim/WimHandler.cpp:318:9: error: use of =
an operand of type 'bool' in 'operator++' is forbidden in C++17
> > |   318 |         numMethods++;
> >
> > Signed-off-by: Nisha Parrakat <Nisha.Parrakat@kpit.com>
> > ---
> >   ...nge_numMethods_from_bool_to_unsigned.patch | 25 ++++++++++++++++++=
+
> >   meta-oe/recipes-extended/p7zip/p7zip_16.02.bb | 21 ++++++++++++++--
> >   2 files changed, 44 insertions(+), 2 deletions(-)
> >   create mode 100644 meta-oe/recipes-extended/p7zip/files/change_numMet=
hods_from_bool_to_unsigned.patch
> >
> > diff --git a/meta-oe/recipes-extended/p7zip/files/change_numMethods_fro=
m_bool_to_unsigned.patch b/meta-oe/recipes-extended/p7zip/files/change_numM=
ethods_from_bool_to_unsigned.patch
> > new file mode 100644
> > index 000000000..edde52593
> > --- /dev/null
> > +++ b/meta-oe/recipes-extended/p7zip/files/change_numMethods_from_bool_=
to_unsigned.patch
> > @@ -0,0 +1,25 @@
> > +fixes the below error
> > +
> > +| ../../../../CPP/7zip/Archive/Wim/WimHandler.cpp: In member function =
'virtual LONG NArchive::NWim::CHandler::GetArchiveProperty(PROPID, PROPVARI=
ANT*)':
> > +| ../../../../CPP/7zip/Archive/Wim/WimHandler.cpp:308:11: error: use o=
f an operand of type 'bool' in 'operator++' is forbidden in C++17
> > +|   308 |           numMethods++;
> > +|       |           ^~~~~~~~~~
> > +| ../../../../CPP/7zip/Archive/Wim/WimHandler.cpp:318:9: error: use of=
 an operand of type 'bool' in 'operator++' is forbidden in C++17
> > +|   318 |         numMethods++;
> > +
> > +
> > +use unsigned instead of bool
> > +Signed-off-by: Nisha Parrakat <Nisha.Parrakat@kpit.com>
> > +
> > +Upstream-Status: Pending
> > +--- ./CPP/7zip/Archive/Wim/WimHandler.cpp       2021-05-20 10:51:56.99=
7402701 +0000
> > ++++ ./CPP/7zip/Archive/Wim/WimHandler.cpp       2021-05-20 10:52:16.66=
5604125 +0000
> > +@@ -298,7 +298,7 @@
> > +
> > +       AString res;
> > +
> > +-      bool numMethods =3D 0;
> > ++      unsigned numMethods =3D 0;
> > +       for (unsigned i =3D 0; i < ARRAY_SIZE(k_Methods); i++)
> > +       {
> > +         if (methodMask & ((UInt32)1 << i
> > diff --git a/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb b/meta-oe/re=
cipes-extended/p7zip/p7zip_16.02.bb
> > index 13479a90f..ada49114c 100644
> > --- a/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb
> > +++ b/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb
> > @@ -9,6 +9,7 @@ SRC_URI =3D "https://apc01.safelinks.protection.outlook=
.com/?url=3Dhttp%3A%2F%2Fdownloads.sourceforge.net%2Fp7zip%2Fp7zip%2F%24&am=
p;data=3D04%7C01%7CNisha.Parrakat%40kpit.com%7C4007f511cd0b4b0d527b08d9206f=
3956%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637576484370502332%7CUnkn=
own%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXV=
CI6Mn0%3D%7C1000&amp;sdata=3DVGFDLma%2Bgwj5%2BsqrJlZRql2MDK4kKghHvq0FBP9pXP=
4%3D&amp;reserved=3D0{PV}/p7zip_${PV}_src_al
> >              file://do_not_override_compiler_and_do_not_strip.patch \
> >              file://CVE-2017-17969.patch \
> >              file://0001-Fix-narrowing-errors-Wc-11-narrowing.patch \
> > +           file://change_numMethods_from_bool_to_unsigned.patch \
> >              "
> >
> >   SRC_URI[md5sum] =3D "a0128d661cfe7cc8c121e73519c54fbf"
> > @@ -16,10 +17,26 @@ SRC_URI[sha256sum] =3D "5eb20ac0e2944f6cb9c2d51dd6c=
4518941c185347d4089ea89087ffdd6
> >
> >   S =3D "${WORKDIR}/${BPN}_${PV}"
> >
> > +do_compile_append() {
> > +    oe_runmake 7z
> > +}
> > +FILES_${PN} +=3D "${libdir}/* ${bindir}/7z"
> > +
> > +FILES_SOLIBSDEV =3D ""
> > +INSANE_SKIP_${PN} +=3D "dev-so"
> > +
> >   do_install() {
> >          install -d ${D}${bindir}
> > -       install -m 0755 ${S}/bin/* ${D}${bindir}
> > +       install -d ${D}${bindir}/Codecs
> > +       install -d ${D}${libdir}
> > +       install -d ${D}${libdir}/Codecs
> > +       install -m 0755 ${S}/bin/7za ${D}${bindir}
> >          ln -s 7za ${D}${bindir}/7z
> > +       install -m 0755 ${S}/bin/Codecs/* ${D}${libdir}/Codecs/
> > +       install -m 0755 ${S}/bin/7z.so ${D}${libdir}/lib7z.so
> >   }
> >
> > -BBCLASSEXTEND =3D "native"
> > +RPROVIDES_${PN} +=3D "lib7z.so()(64bit) 7z lib7z.so"
> > +RPROVIDES_${PN}-dev +=3D "lib7z.so()(64bit) 7z lib7z.so"
> > +
> > +BBCLASSEXTEND =3D "native nativesdk"
> > --
> > 2.17.1
> >
> > This message contains information that may be privileged or confidentia=
l and is the property of the KPIT Technologies Ltd. It is intended only for=
 the person to whom it is addressed. If you are not the intended recipient,=
 you are not authorized to read, print, retain copy, disseminate, distribut=
e, or use this message or any part thereof. If you receive this message in =
error, please notify the sender immediately and delete all copies of this m=
essage. KPIT Technologies Ltd. does not accept any liability for virus infe=
cted mails.
> >
> This message contains information that may be privileged or confidential =
and is the property of the KPIT Technologies Ltd. It is intended only for t=
he person to whom it is addressed. If you are not the intended recipient, y=
ou are not authorized to read, print, retain copy, disseminate, distribute,=
 or use this message or any part thereof. If you receive this message in er=
ror, please notify the sender immediately and delete all copies of this mes=
sage. KPIT Technologies Ltd. does not accept any liability for virus infect=
ed mails.
