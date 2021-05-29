Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web08.18970.1622278528899477853
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 29 May 2021 01:55:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=beCs3wb8;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id l1so8842050ejb.6
        for <openembedded-devel@lists.openembedded.org>; Sat, 29 May 2021 01:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JMm9R44n3DOpX/+n2c+iPOu5MWTEvfuG0HbFFqrsb/s=;
        b=beCs3wb8QbjuWh/B3UGsnwteO878G8yzgOVLlTSmF/o+LcgiHP20rI+p+OHHpPHPEg
         HODrtzndITxLlL07nA9szBQ/kRoshsn/Row5wAJdHMWV2QF3TyKjE4ZzLulaicIxdm/o
         X5tuRXGrg4Mlh1tj9+i71NwGzXs132+4TVshF7bpweRKqmhm+lPOpFxm+JsqhVRM9/Nc
         jTG6c6m+8F6GmBtsPELeGYajoSkMCNO6k60DiBKm9udUFubiOb7EngTjs17Ouyvgs+I+
         oAMVzwCGGB9zbF4Akh7A5roR7zLXeQeu+yv52kxFO7k6UUSPNP9EHZYy9GIY6mH0J/JX
         xBVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JMm9R44n3DOpX/+n2c+iPOu5MWTEvfuG0HbFFqrsb/s=;
        b=aCceAt/NWnkEF6Mzg/VohtbcOW/zRGzrYRmX9a7xB7fe9QAyP1hpFNjfS8AuoE5B+z
         aUsmIRhEfO/hxgO6VWZ2vIGWF1or9XtJX7LqCcRikYKcw159NQrOUMpFYAzW3e8xc3t0
         w9i8xWgc69J9TzxHc4hngORIm1BFkoagelPKmMsZ/ITINvGARABgNDSj/jth1PI2TyHt
         ISQ2716Oi+1gkgSNfwpxSjitSjWG9jssPdC9eOEGZKPt5zB6UKQGbCNcXgv14ijD+oJ6
         ielnl3CzYQeyVgAhyXEhjqNWgiFeJBFlu1X7Lvg62QJSlV2t5kJOijjpMJGTtia3dNHl
         /AUg==
X-Gm-Message-State: AOAM532jhiIsqHYbpnnLNeUVvlrsbIE1wDqBpp3spio/hdBIWKtezvKJ
	YuIPXw/QOxGfxNbhxX1h311jAaXTSgTY8Ncvfak=
X-Google-Smtp-Source: ABdhPJwwJk1HFl8P9ZgFre3AyrNa5VgghZmgiyzyKkvx4mOYNIYKsbDBMRr9y1HWQoOIg2KgaFPVkxFLQ2kjHwfJCNE=
X-Received: by 2002:a17:906:d0d4:: with SMTP id bq20mr13366900ejb.541.1622278527029;
 Sat, 29 May 2021 01:55:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210526173229.553-1-Nisha.Parrakat@kpit.com> <57321835-c8d5-754f-b974-6ee35912f88d@gmail.com>
 <PN0PR01MB52838F54DAB2752439C8C9BEEE249@PN0PR01MB5283.INDPRD01.PROD.OUTLOOK.COM>
 <CAMKF1sqZ1B1CXha8DPVPZxz+JOjyLoqVCptuLfexJStnjroAhw@mail.gmail.com>
In-Reply-To: <CAMKF1sqZ1B1CXha8DPVPZxz+JOjyLoqVCptuLfexJStnjroAhw@mail.gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Sat, 29 May 2021 10:55:16 +0200
Message-ID: <CA+chaQeQruUasefzSrxG1YuaFvNer85RwduAA=Om4HYYQFFFfA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][master][PATCH 1/2] p7zip: build and package lib7z.so needed for fastboot
To: Khem Raj <raj.khem@gmail.com>
Cc: Nisha Parrakat <Nisha.Parrakat@kpit.com>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000054957705c37427ff"

--00000000000054957705c37427ff
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The version merged in master with:
https://git.openembedded.org/meta-openembedded/commit/?id=3D3c36a8efe2a964=
c3aa9bfcd836cee3f80a837fcd

still doesn't apply cleanly:

WARNING: p7zip-16.02-r0 do_patch: Fuzz detected:

Applying patch change_numMethods_from_bool_to_unsigned.patch
patching file CPP/7zip/Archive/Wim/WimHandler.cpp
Hunk #1 succeeded at 298 with fuzz 1.


The context lines in the patches can be updated with devtool:

    devtool modify p7zip
    devtool finish --force-patch-refresh p7zip <layer_path>

Don't forget to review changes done by devtool!

WARNING: p7zip-16.02-r0 do_patch: QA Issue: Patch log indicates that
patches do not apply cleanly. [patch-fuzz]

Will send a fix for this.

On Wed, May 26, 2021 at 9:09 PM Khem Raj <raj.khem@gmail.com> wrote:

> they dont apply
>
> patching file
> 'meta-oe/recipes-extended/p7zip/files/change_numMethods_from_bool_to_u=
=3D'
> patch: **** malformed patch at line 178: tual LONG
> NArchive::NWim::CHandler::GetArchiveProperty(PROPID, PROPVARIANT*=3D
>
> ensure that your MUA is not modifying these patches on the way, simple
> output of
>
> git format-patch ...
> git send-email .....
>
> usually works reliably
>
> On Wed, May 26, 2021 at 11:45 AM Nisha Parrakat <Nisha.Parrakat@kpit.com=
>
> wrote:
> >
> > hi Khem,
> > It is rebased to master already. do you want me to upstream to
> master-next too ?
> >
> > Regards,
> > Ms Nisha Parrakat
> > KPIT Technologies GmbH
> >
> >
> >
> > ________________________________
> > From: openembedded-devel@lists.openembedded.org <
> openembedded-devel@lists.openembedded.org> on behalf of Khem Raj via
> lists.openembedded.org <raj.khem=3Dgmail.com@lists.openembedded.org>
> > Sent: 26 May 2021 19:53
> > To: Nisha Parrakat <Nisha.Parrakat@kpit.com>;
> openembedded-devel@lists.openembedded.org <
> openembedded-devel@lists.openembedded.org>
> > Subject: Re: [oe] [meta-oe][master][PATCH 1/2] p7zip: build and packag=
e
> lib7z.so needed for fastboot
> >
> > please rebase these patches on top of master or master-next and resend=
.
> >
> > On 5/26/21 10:32 AM, Nisha Parrakat wrote:
> > > From: Nisha Parrakat <nisha.parrakat@kpit.com>
> > >
> > > a) use option 7z to build the lib7z.so library
> > > This is needed for android-tools for building fastboot
> > > from android-tools
> > >
> > > b) Packaged the lib7z.so and codec libraries as a part of this recip=
e
> > > Fastboot RDepends on it lib7z.so
> > >
> > > c) Fixed a C++17 forbidden error when lib7z.so is built
> > >
> > > fixes the below error
> > >
> > > | ../../../../CPP/7zip/Archive/Wim/WimHandler.cpp: In member functio=
n
> 'virtual LONG NArchive::NWim::CHandler::GetArchiveProperty(PROPID,
> PROPVARIANT*)':
> > > | ../../../../CPP/7zip/Archive/Wim/WimHandler.cpp:308:11: error: use
> of an operand of type 'bool' in 'operator++' is forbidden in C++17
> > > |   308 |           numMethods++;
> > > |       |           ^~~~~~~~~~
> > > | ../../../../CPP/7zip/Archive/Wim/WimHandler.cpp:318:9: error: use =
of
> an operand of type 'bool' in 'operator++' is forbidden in C++17
> > > |   318 |         numMethods++;
> > >
> > > Signed-off-by: Nisha Parrakat <Nisha.Parrakat@kpit.com>
> > > ---
> > >   ...nge_numMethods_from_bool_to_unsigned.patch | 25
> +++++++++++++++++++
> > >   meta-oe/recipes-extended/p7zip/p7zip_16.02.bb | 21 ++++++++++++++-=
-
> > >   2 files changed, 44 insertions(+), 2 deletions(-)
> > >   create mode 100644
> meta-oe/recipes-extended/p7zip/files/change_numMethods_from_bool_to_unsi=
gned.patch
> > >
> > > diff --git
> a/meta-oe/recipes-extended/p7zip/files/change_numMethods_from_bool_to_un=
signed.patch
> b/meta-oe/recipes-extended/p7zip/files/change_numMethods_from_bool_to_un=
signed.patch
> > > new file mode 100644
> > > index 000000000..edde52593
> > > --- /dev/null
> > > +++
> b/meta-oe/recipes-extended/p7zip/files/change_numMethods_from_bool_to_un=
signed.patch
> > > @@ -0,0 +1,25 @@
> > > +fixes the below error
> > > +
> > > +| ../../../../CPP/7zip/Archive/Wim/WimHandler.cpp: In member functi=
on
> 'virtual LONG NArchive::NWim::CHandler::GetArchiveProperty(PROPID,
> PROPVARIANT*)':
> > > +| ../../../../CPP/7zip/Archive/Wim/WimHandler.cpp:308:11: error: us=
e
> of an operand of type 'bool' in 'operator++' is forbidden in C++17
> > > +|   308 |           numMethods++;
> > > +|       |           ^~~~~~~~~~
> > > +| ../../../../CPP/7zip/Archive/Wim/WimHandler.cpp:318:9: error: use
> of an operand of type 'bool' in 'operator++' is forbidden in C++17
> > > +|   318 |         numMethods++;
> > > +
> > > +
> > > +use unsigned instead of bool
> > > +Signed-off-by: Nisha Parrakat <Nisha.Parrakat@kpit.com>
> > > +
> > > +Upstream-Status: Pending
> > > +--- ./CPP/7zip/Archive/Wim/WimHandler.cpp       2021-05-20
> 10:51:56.997402701 +0000
> > > ++++ ./CPP/7zip/Archive/Wim/WimHandler.cpp       2021-05-20
> 10:52:16.665604125 +0000
> > > +@@ -298,7 +298,7 @@
> > > +
> > > +       AString res;
> > > +
> > > +-      bool numMethods =3D 0;
> > > ++      unsigned numMethods =3D 0;
> > > +       for (unsigned i =3D 0; i < ARRAY_SIZE(k_Methods); i++)
> > > +       {
> > > +         if (methodMask & ((UInt32)1 << i
> > > diff --git a/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb
> b/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb
> > > index 13479a90f..ada49114c 100644
> > > --- a/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb
> > > +++ b/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb
> > > @@ -9,6 +9,7 @@ SRC_URI =3D "
> https://apc01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fdownl=
oads.sourceforge.net%2Fp7zip%2Fp7zip%2F%24&amp;data=3D04%7C01%7CNisha.Parra=
kat%40kpit.com%7C4007f511cd0b4b0d527b08d9206f3956%7C3539451eb46e4a26a242ff6=
1502855c7%7C0%7C0%7C637576484370502332%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4w=
LjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DV=
GFDLma%2Bgwj5%2BsqrJlZRql2MDK4kKghHvq0FBP9pXP4%3D&amp;reserved=3D0{PV}/p7zi=
p_${PV}_src_al
> <https://apc01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fdown=
loads.sourceforge.net%2Fp7zip%2Fp7zip%2F%24&amp;data=3D04%7C01%7CNisha.Parr=
akat%40kpit.com%7C4007f511cd0b4b0d527b08d9206f3956%7C3539451eb46e4a26a242ff=
61502855c7%7C0%7C0%7C637576484370502332%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4=
wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3D=
VGFDLma%2Bgwj5%2BsqrJlZRql2MDK4kKghHvq0FBP9pXP4%3D&amp;reserved=3D0%7BPV%7D=
/p7zip_$%7BPV%7D_src_al>
> > >              file://do_not_override_compiler_and_do_not_strip.patch =
\
> > >              file://CVE-2017-17969.patch \
> > >              file://0001-Fix-narrowing-errors-Wc-11-narrowing.patch =
\
> > > +           file://change_numMethods_from_bool_to_unsigned.patch \
> > >              "
> > >
> > >   SRC_URI[md5sum] =3D "a0128d661cfe7cc8c121e73519c54fbf"
> > > @@ -16,10 +17,26 @@ SRC_URI[sha256sum] =3D
> "5eb20ac0e2944f6cb9c2d51dd6c4518941c185347d4089ea89087ffdd6
> > >
> > >   S =3D "${WORKDIR}/${BPN}_${PV}"
> > >
> > > +do_compile_append() {
> > > +    oe_runmake 7z
> > > +}
> > > +FILES_${PN} +=3D "${libdir}/* ${bindir}/7z"
> > > +
> > > +FILES_SOLIBSDEV =3D ""
> > > +INSANE_SKIP_${PN} +=3D "dev-so"
> > > +
> > >   do_install() {
> > >          install -d ${D}${bindir}
> > > -       install -m 0755 ${S}/bin/* ${D}${bindir}
> > > +       install -d ${D}${bindir}/Codecs
> > > +       install -d ${D}${libdir}
> > > +       install -d ${D}${libdir}/Codecs
> > > +       install -m 0755 ${S}/bin/7za ${D}${bindir}
> > >          ln -s 7za ${D}${bindir}/7z
> > > +       install -m 0755 ${S}/bin/Codecs/* ${D}${libdir}/Codecs/
> > > +       install -m 0755 ${S}/bin/7z.so ${D}${libdir}/lib7z.so
> > >   }
> > >
> > > -BBCLASSEXTEND =3D "native"
> > > +RPROVIDES_${PN} +=3D "lib7z.so()(64bit) 7z lib7z.so"
> > > +RPROVIDES_${PN}-dev +=3D "lib7z.so()(64bit) 7z lib7z.so"
> > > +
> > > +BBCLASSEXTEND =3D "native nativesdk"
> > > --
> > > 2.17.1
> > >
> > > This message contains information that may be privileged or
> confidential and is the property of the KPIT Technologies Ltd. It is
> intended only for the person to whom it is addressed. If you are not the
> intended recipient, you are not authorized to read, print, retain copy,
> disseminate, distribute, or use this message or any part thereof. If you
> receive this message in error, please notify the sender immediately and
> delete all copies of this message. KPIT Technologies Ltd. does not accep=
t
> any liability for virus infected mails.
> > >
> > This message contains information that may be privileged or confidenti=
al
> and is the property of the KPIT Technologies Ltd. It is intended only fo=
r
> the person to whom it is addressed. If you are not the intended recipien=
t,
> you are not authorized to read, print, retain copy, disseminate,
> distribute, or use this message or any part thereof. If you receive this
> message in error, please notify the sender immediately and delete all
> copies of this message. KPIT Technologies Ltd. does not accept any
> liability for virus infected mails.
>
>=20
>
>

--00000000000054957705c37427ff
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>The version merged in master with:</div><div><a href=
=3D"https://git.openembedded.org/meta-openembedded/commit/?id=3D3c36a8efe2=
a964c3aa9bfcd836cee3f80a837fcd">https://git.openembedded.org/meta-openembed=
ded/commit/?id=3D3c36a8efe2a964c3aa9bfcd836cee3f80a837fcd</a><br></div><div=
><br></div><div>still doesn&#39;t apply cleanly:</div><div><br></div><div>W=
ARNING: p7zip-16.02-r0 do_patch: Fuzz detected:<br><br>Applying patch chang=
e_numMethods_from_bool_to_unsigned.patch<br>patching file CPP/7zip/Archive/=
Wim/WimHandler.cpp<br>Hunk #1 succeeded at 298 with fuzz 1.<br><br><br>The =
context lines in the patches can be updated with devtool:<br><br>=C2=A0 =C2=
=
=A0 devtool modify p7zip<br>=C2=A0 =C2=A0 devtool finish --force-patch-ref=
resh p7zip &lt;layer_path&gt;<br><br>Don&#39;t forget to review changes don=
e by devtool!<br><br>WARNING: p7zip-16.02-r0 do_patch: QA Issue: Patch log =
indicates that patches do not apply cleanly. [patch-fuzz]<br></div><div><br=
></div><div>Will send a fix for this.</div></div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, May 26, 2021 at 9:09 PM =
Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">they d=
ont apply<br>
<br>
patching file &#39;meta-oe/recipes-extended/p7zip/files/change_numMethods_=
from_bool_to_u=3D&#39;<br>
patch: **** malformed patch at line 178: tual LONG<br>
NArchive::NWim::CHandler::GetArchiveProperty(PROPID, PROPVARIANT*=3D<br>
<br>
ensure that your MUA is not modifying these patches on the way, simple out=
put of<br>
<br>
git format-patch ...<br>
git send-email .....<br>
<br>
usually works reliably<br>
<br>
On Wed, May 26, 2021 at 11:45 AM Nisha Parrakat &lt;<a href=3D"mailto:Nish=
a.Parrakat@kpit.com" target=3D"_blank">Nisha.Parrakat@kpit.com</a>&gt; wrot=
e:<br>
&gt;<br>
&gt; hi Khem,<br>
&gt; It is rebased to master already. do you want me to upstream to master=
-next too ?<br>
&gt;<br>
&gt; Regards,<br>
&gt; Ms Nisha Parrakat<br>
&gt; KPIT Technologies GmbH<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; ________________________________<br>
&gt; From: <a href=3D"mailto:openembedded-devel@lists.openembedded.org" ta=
rget=3D"_blank">openembedded-devel@lists.openembedded.org</a> &lt;<a href=
=3D"mailto:openembedded-devel@lists.openembedded.org" target=3D"_blank">op=
enembedded-devel@lists.openembedded.org</a>&gt; on behalf of Khem Raj via <=
a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blan=
k">lists.openembedded.org</a> &lt;raj.khem=3D<a href=3D"mailto:gmail.com@li=
sts.openembedded.org" target=3D"_blank">gmail.com@lists.openembedded.org</a=
>&gt;<br>
&gt; Sent: 26 May 2021 19:53<br>
&gt; To: Nisha Parrakat &lt;<a href=3D"mailto:Nisha.Parrakat@kpit.com" tar=
get=3D"_blank">Nisha.Parrakat@kpit.com</a>&gt;; <a href=3D"mailto:openembed=
ded-devel@lists.openembedded.org" target=3D"_blank">openembedded-devel@list=
s.openembedded.org</a> &lt;<a href=3D"mailto:openembedded-devel@lists.opene=
mbedded.org" target=3D"_blank">openembedded-devel@lists.openembedded.org</a=
>&gt;<br>
&gt; Subject: Re: [oe] [meta-oe][master][PATCH 1/2] p7zip: build and packa=
ge lib7z.so needed for fastboot<br>
&gt;<br>
&gt; please rebase these patches on top of master or master-next and resen=
d.<br>
&gt;<br>
&gt; On 5/26/21 10:32 AM, Nisha Parrakat wrote:<br>
&gt; &gt; From: Nisha Parrakat &lt;<a href=3D"mailto:nisha.parrakat@kpit.c=
om" target=3D"_blank">nisha.parrakat@kpit.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; a) use option 7z to build the lib7z.so library<br>
&gt; &gt; This is needed for android-tools for building fastboot<br>
&gt; &gt; from android-tools<br>
&gt; &gt;<br>
&gt; &gt; b) Packaged the lib7z.so and codec libraries as a part of this r=
ecipe<br>
&gt; &gt; Fastboot RDepends on it lib7z.so<br>
&gt; &gt;<br>
&gt; &gt; c) Fixed a C++17 forbidden error when lib7z.so is built<br>
&gt; &gt;<br>
&gt; &gt; fixes the below error<br>
&gt; &gt;<br>
&gt; &gt; | ../../../../CPP/7zip/Archive/Wim/WimHandler.cpp: In member fun=
ction &#39;virtual LONG NArchive::NWim::CHandler::GetArchiveProperty(PROPID=
, PROPVARIANT*)&#39;:<br>
&gt; &gt; | ../../../../CPP/7zip/Archive/Wim/WimHandler.cpp:308:11: error:=
 use of an operand of type &#39;bool&#39; in &#39;operator++&#39; is forbid=
den in C++17<br>
&gt; &gt; |=C2=A0 =C2=A0308 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0numM=
ethods++;<br>
&gt; &gt; |=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0^~~~~~~~~~<br>
&gt; &gt; | ../../../../CPP/7zip/Archive/Wim/WimHandler.cpp:318:9: error: =
use of an operand of type &#39;bool&#39; in &#39;operator++&#39; is forbidd=
en in C++17<br>
&gt; &gt; |=C2=A0 =C2=A0318 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0numMethods+=
+;<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Nisha Parrakat &lt;<a href=3D"mailto:Nisha.Parrak=
at@kpit.com" target=3D"_blank">Nisha.Parrakat@kpit.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 =C2=A0...nge_numMethods_from_bool_to_unsigned.patch | 25 +=
++++++++++++++++++<br>
&gt; &gt;=C2=A0 =C2=A0meta-oe/recipes-extended/p7zip/<a href=3D"http://p7z=
ip_16.02.bb" rel=3D"noreferrer" target=3D"_blank">p7zip_16.02.bb</a> | 21 +=
+++++++++++++--<br>
&gt; &gt;=C2=A0 =C2=A02 files changed, 44 insertions(+), 2 deletions(-)<br=
>
&gt; &gt;=C2=A0 =C2=A0create mode 100644 meta-oe/recipes-extended/p7zip/fi=
les/change_numMethods_from_bool_to_unsigned.patch<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta-oe/recipes-extended/p7zip/files/change_numMeth=
ods_from_bool_to_unsigned.patch b/meta-oe/recipes-extended/p7zip/files/chan=
ge_numMethods_from_bool_to_unsigned.patch<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 000000000..edde52593<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/meta-oe/recipes-extended/p7zip/files/change_numMethods_fro=
m_bool_to_unsigned.patch<br>
&gt; &gt; @@ -0,0 +1,25 @@<br>
&gt; &gt; +fixes the below error<br>
&gt; &gt; +<br>
&gt; &gt; +| ../../../../CPP/7zip/Archive/Wim/WimHandler.cpp: In member fu=
nction &#39;virtual LONG NArchive::NWim::CHandler::GetArchiveProperty(PROPI=
D, PROPVARIANT*)&#39;:<br>
&gt; &gt; +| ../../../../CPP/7zip/Archive/Wim/WimHandler.cpp:308:11: error=
: use of an operand of type &#39;bool&#39; in &#39;operator++&#39; is forbi=
dden in C++17<br>
&gt; &gt; +|=C2=A0 =C2=A0308 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0num=
Methods++;<br>
&gt; &gt; +|=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0^~~~~~~~~~<br>
&gt; &gt; +| ../../../../CPP/7zip/Archive/Wim/WimHandler.cpp:318:9: error:=
 use of an operand of type &#39;bool&#39; in &#39;operator++&#39; is forbid=
den in C++17<br>
&gt; &gt; +|=C2=A0 =C2=A0318 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0numMethods=
++;<br>
&gt; &gt; +<br>
&gt; &gt; +<br>
&gt; &gt; +use unsigned instead of bool<br>
&gt; &gt; +Signed-off-by: Nisha Parrakat &lt;<a href=3D"mailto:Nisha.Parra=
kat@kpit.com" target=3D"_blank">Nisha.Parrakat@kpit.com</a>&gt;<br>
&gt; &gt; +<br>
&gt; &gt; +Upstream-Status: Pending<br>
&gt; &gt; +--- ./CPP/7zip/Archive/Wim/WimHandler.cpp=C2=A0 =C2=A0 =C2=A0 =
=C2=A02021-05-20 10:51:56.997402701 +0000<br>
&gt; &gt; ++++ ./CPP/7zip/Archive/Wim/WimHandler.cpp=C2=A0 =C2=A0 =C2=A0 =
=C2=A02021-05-20 10:52:16.665604125 +0000<br>
&gt; &gt; +@@ -298,7 +298,7 @@<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0AString res;<br>
&gt; &gt; +<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 bool numMethods =3D 0;<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 unsigned numMethods =3D 0;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0for (unsigned i =3D 0; i &lt; ARRAY_=
SIZE(k_Methods); i++)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (methodMask &amp; ((UInt32=
)1 &lt;&lt; i<br>
&gt; &gt; diff --git a/meta-oe/recipes-extended/p7zip/<a href=3D"http://p7=
zip_16.02.bb" rel=3D"noreferrer" target=3D"_blank">p7zip_16.02.bb</a> b/met=
a-oe/recipes-extended/p7zip/<a href=3D"http://p7zip_16.02.bb" rel=3D"norefe=
rrer" target=3D"_blank">p7zip_16.02.bb</a><br>
&gt; &gt; index 13479a90f..ada49114c 100644<br>
&gt; &gt; --- a/meta-oe/recipes-extended/p7zip/<a href=3D"http://p7zip_16.=
02.bb" rel=3D"noreferrer" target=3D"_blank">p7zip_16.02.bb</a><br>
&gt; &gt; +++ b/meta-oe/recipes-extended/p7zip/<a href=3D"http://p7zip_16.=
02.bb" rel=3D"noreferrer" target=3D"_blank">p7zip_16.02.bb</a><br>
&gt; &gt; @@ -9,6 +9,7 @@ SRC_URI =3D &quot;<a href=3D"https://apc01.safel=
inks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fdownloads.sourceforge.net%2=
Fp7zip%2Fp7zip%2F%24&amp;amp;data=3D04%7C01%7CNisha.Parrakat%40kpit.com%7C4=
007f511cd0b4b0d527b08d9206f3956%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%=
7C637576484370502332%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2=
luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3DVGFDLma%2Bgwj5%=
2BsqrJlZRql2MDK4kKghHvq0FBP9pXP4%3D&amp;amp;reserved=3D0%7BPV%7D/p7zip_$%7B=
PV%7D_src_al" rel=3D"noreferrer" target=3D"_blank">https://apc01.safelinks.=
protection.outlook.com/?url=3Dhttp%3A%2F%2Fdownloads.sourceforge.net%2Fp7zi=
p%2Fp7zip%2F%24&amp;amp;data=3D04%7C01%7CNisha.Parrakat%40kpit.com%7C4007f5=
11cd0b4b0d527b08d9206f3956%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637=
576484370502332%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzI=
iLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3DVGFDLma%2Bgwj5%2Bsqr=
JlZRql2MDK4kKghHvq0FBP9pXP4%3D&amp;amp;reserved=3D0{PV}/p7zip_${PV}_src_al<=
/a><br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://do_not_ov=
erride_compiler_and_do_not_strip.patch \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2017-=
17969.patch \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Fix-=
narrowing-errors-Wc-11-narrowing.patch \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://change_numMetho=
ds_from_bool_to_unsigned.patch \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0SRC_URI[md5sum] =3D &quot;a0128d661cfe7cc8c121e73519=
c54fbf&quot;<br>
&gt; &gt; @@ -16,10 +17,26 @@ SRC_URI[sha256sum] =3D &quot;5eb20ac0e2944f6=
cb9c2d51dd6c4518941c185347d4089ea89087ffdd6<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0S =3D &quot;${WORKDIR}/${BPN}_${PV}&quot;<br>
&gt; &gt;<br>
&gt; &gt; +do_compile_append() {<br>
&gt; &gt; +=C2=A0 =C2=A0 oe_runmake 7z<br>
&gt; &gt; +}<br>
&gt; &gt; +FILES_${PN} +=3D &quot;${libdir}/* ${bindir}/7z&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +FILES_SOLIBSDEV =3D &quot;&quot;<br>
&gt; &gt; +INSANE_SKIP_${PN} +=3D &quot;dev-so&quot;<br>
&gt; &gt; +<br>
&gt; &gt;=C2=A0 =C2=A0do_install() {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${bindir}<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0755 ${S}/bin/* ${D}${bin=
dir}<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${bindir}/Codecs<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${libdir}<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${libdir}/Codecs<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0755 ${S}/bin/7za ${D}${b=
indir}<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ln -s 7za ${D}${bindir}/7z<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0755 ${S}/bin/Codecs/* ${=
D}${libdir}/Codecs/<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0755 ${S}/bin/7z.so ${D}$=
{libdir}/lib7z.so<br>
&gt; &gt;=C2=A0 =C2=A0}<br>
&gt; &gt;<br>
&gt; &gt; -BBCLASSEXTEND =3D &quot;native&quot;<br>
&gt; &gt; +RPROVIDES_${PN} +=3D &quot;lib7z.so()(64bit) 7z lib7z.so&quot;<=
br>
&gt; &gt; +RPROVIDES_${PN}-dev +=3D &quot;lib7z.so()(64bit) 7z lib7z.so&qu=
ot;<br>
&gt; &gt; +<br>
&gt; &gt; +BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
&gt; &gt; --<br>
&gt; &gt; 2.17.1<br>
&gt; &gt;<br>
&gt; &gt; This message contains information that may be privileged or conf=
idential and is the property of the KPIT Technologies Ltd. It is intended o=
nly for the person to whom it is addressed. If you are not the intended rec=
ipient, you are not authorized to read, print, retain copy, disseminate, di=
stribute, or use this message or any part thereof. If you receive this mess=
age in error, please notify the sender immediately and delete all copies of=
 this message. KPIT Technologies Ltd. does not accept any liability for vir=
us infected mails.<br>
&gt; &gt;<br>
&gt; This message contains information that may be privileged or confident=
ial and is the property of the KPIT Technologies Ltd. It is intended only f=
or the person to whom it is addressed. If you are not the intended recipien=
t, you are not authorized to read, print, retain copy, disseminate, distrib=
ute, or use this message or any part thereof. If you receive this message i=
n error, please notify the sender immediately and delete all copies of this=
 message. KPIT Technologies Ltd. does not accept any liability for virus in=
fected mails.<br>
<br>
<br>
<br>
</blockquote></div>

--00000000000054957705c37427ff--
