Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74310C7115A
	for <webhook@archiver.kernel.org>; Sun, 22 Jun 2025 13:01:01 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.25551.1750597258856859092
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Jun 2025 06:00:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=a9GzNpEn;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a5123c1533so1628679f8f.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Jun 2025 06:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1750597257; x=1751202057; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=G3mR8/fnYNtYJ4dAYTDWPaKC/Odv4zbZFVxYLhXJCGU=;
        b=a9GzNpEnCIJUNJJXzskGdUtBOPw7RQpsjPLWWbl7WAhBaqq4Rb7v4Gl+a3tzmMJRxA
         PVnHKtnqwq4NmxGMMBXZmmQAUJc0SjWNPNx9s8Dzg4rr1LVRDstoQHBQavpItpny4fS+
         dfyR+SkUSh7m0Wmz5CY9xBurZMsGxJ67BODS0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750597257; x=1751202057;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G3mR8/fnYNtYJ4dAYTDWPaKC/Odv4zbZFVxYLhXJCGU=;
        b=j1RIj0ILXLAEOO/a7FQVILotA2KXbwqPxYp+boaMFLTlhvduzn6Ybcx3oCMNObnn5+
         aew+C6dSd7UfCrWUKZRxWfKAL2CIIhZoSR9J8SHXUcU0gqKDAJaZm/TgtEtxl3LYbDai
         tY+Bs0B0hRGXyj6KD2ulL3var0QWNlF7xdmq5b8gdBC49ZdmkoqXAwHN1Q+myFfjBEoF
         P/+tIlrsxdqNmSCT5d9/Fxv+b84ERwJI74CKXJFWqLDjmw10ioJ2tnYVYYng/P44sZmH
         TLzmQEYjR74gKAEhNsPFOkALuuK2MYajd7fAJZZ76XN48TkgoVs8DU9OKg6yRaY1B8jy
         a7Fg==
X-Gm-Message-State: AOJu0YwUPY6PeVnCHGLvmKrF1reHs2AQn/MiZk0iaV5SS67myWS323t4
	AZ1M0zRgIM2o+y/X2khZ3DyYSLY1eIyiEJuKYM1B8fCblcUvckKXoEvJr334Wzm5su6mOBd/r0V
	puurcju6S3lJq/k+IatFLlSXOANYCZelIAC9j3Y95TA==
X-Gm-Gg: ASbGncsAy5Z5c4+bm698jAO4Qm/0uo1ikFOFZ8aZQmOHaIDjnXjfLuDSFdpfAqzlkOj
	FZOSLfOToDXbRcGP1ozeLEI9p2SGdA8lpgcuQoQ4ou4kG+NPUNkxDZhQcEVgU6BLXZ/r3GrBK4b
	XlUWS4L3R6e4LgwPDvRbDI1AC1VO+EsOMupbnh/bE3rg==
X-Google-Smtp-Source: AGHT+IGl2MW1qfFgfbkGMoG8gPNfvMuO09QDgekAe2kVpmOPdwBuFNjZbH8NRHE83qAwDIGcYNaxjyT5hfKIvfhYdbc=
X-Received: by 2002:a05:6000:178f:b0:3a3:7987:945f with SMTP id
 ffacd0b85a97d-3a6d12eb327mr7321725f8f.57.1750597256879; Sun, 22 Jun 2025
 06:00:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6000:2b11:b0:3a4:e49a:a388 with HTTP; Sun, 22 Jun 2025
 06:00:55 -0700 (PDT)
In-Reply-To: <CAGpma=61wNNLVtKYC_okEvvU-31f2xP69=VtUKqHCJZC05Dy2g@mail.gmail.com>
References: <20250621102550.1523918-1-alperyasinak1@gmail.com>
 <CAMSfU+5ymAa0RFBaSkfuke3H_Bimui5sJn8_BNZ+yKE1hCvYSA@mail.gmail.com> <CAGpma=61wNNLVtKYC_okEvvU-31f2xP69=VtUKqHCJZC05Dy2g@mail.gmail.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Sun, 22 Jun 2025 15:00:55 +0200
X-Gm-Features: Ac12FXwUOxcnQclw9W65wmdiw1mkyMNcqjhnd2VhzFz8pXlOclubBtj7xG9PuFo
Message-ID: <CAMSfU+43AVGcV+6KEmgpUDX51J3OnQD5x5SvS-TxQEfOhhOG8Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] ace: Fix contains reference to TMPDIR
 [buildpaths] error
To: Alper Ak <alperyasinak1@gmail.com>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000a43a7c063828afd0"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 22 Jun 2025 13:01:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118020

--000000000000a43a7c063828afd0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le dimanche 22 juin 2025, Alper Ak <alperyasinak1@gmail.com> a =C3=A9crit :
>> Hello,
>> ${DEBUG_PREFIX_MAP} is usually in CXXFLAGS (set in
poky/meta/conf/bitbake.conf)
>> Do you know why it is not the case here? or why does it not work?
>> Thanks!
>
> Although Yocto/BitBake sets variables like CXXFLAGS and passes them to
> the build environment, if i'm not wrong, these flags will only affect
> the final compiler invocation if the project's own build system
> actually uses those variables in its Makefiles or build scripts.
>
> Looks like ACE doesn't use CXXFLAGS in its main Makefiles or compiler
> calls.  Instead of it, it often uses variables like CCFLAGS, CPPFLAGS
> or directly invokes the compiler using the CXX, without including
> CXXFLAGS. As a result, any flags added to CXXFLAGS, such as
> ${DEBUG_PREFIX_MAP}, don't reach the compiler and the QA buildpaths
> issue remains unresolved.
>
> Appending the flag directly to CXX works because ACE always calls the
> compiler as "$(CXX) ...", so anything added to CXX is included in
> every compiler invocation regardless of how the build system is
> structured.  As I said, I was found that ACE's Makefiles do include
> CPPFLAGS in the compiler calls. So, adding ${DEBUG_PREFIX_MAP} to
> CPPFLAGS allows the flag to be properly propagated to the compiler and
> resolves the QA issue.
>
> My thought before you asked the question was just "the problem is
> caused by the project.". Now we have detailed it and figured out why.
>
> It seems that our solution here should be CPPFLAGS:append =3D "
> ${DEBUG_PREFIX_MAP}". Let me know if I'm wrong or if there is a better
> way.

CPPFLAGS should be C PreProcessor options.
DEBUG_PREFIX_MAP options are not C PreProcessor options.

The theoretical solution would be to patch the ace build system to make it
pass CXXFLAGS to CXX-based compilation (as well as CPPFLAGS). That patch
most likely deserves to be upstreamed.

Since you looked at ace's makefiles, does it sound doable?

>
>
> Yoann Congal <yoann.congal@smile.fr>, 21 Haz 2025 Cmt, 16:00 tarihinde
> =C5=9Funu yazd=C4=B1:
>>
>>
>>
>> Le sam. 21 juin 2025 =C3=A0 12:26, Alper Ak via lists.openembedded.org
<alperyasinak1=3Dgmail.com@lists.openembedded.org> a =C3=A9crit :
>>>
>>> ERROR: ace-8.0.2-r0 do_package_qa: QA Issue: File
/usr/lib/.debug/libACE_Compression.so.8.0.2 in package ace-dbg contains
reference to TMPDIR [buildpaths]
>>> ERROR: ace-8.0.2-r0 do_package_qa: QA Issue: File
/usr/lib/.debug/libACE_ETCL_Parser.so.8.0.2 in package ace-dbg contains
reference to TMPDIR [buildpaths]
>>> ERROR: ace-8.0.2-r0 do_package_qa: QA Issue: File
/usr/lib/.debug/libACE_ETCL.so.8.0.2 in package ace-dbg contains reference
to TMPDIR [buildpaths]
>>> ERROR: ace-8.0.2-r0 do_package_qa: QA Issue: File
/usr/lib/.debug/libACE.so.8.0.2 in package ace-dbg contains reference to
TMPDIR [buildpaths]
>>> ERROR: ace-8.0.2-r0 do_package_qa: QA Issue: File
/usr/lib/.debug/libACE_Monitor_Control.so.8.0.2 in package ace-dbg contains
reference to TMPDIR [buildpaths]
>>> ERROR: ace-8.0.2-r0 do_package_qa: QA Issue: File
/usr/lib/.debug/libACE_RLECompression.so.8.0.2 in package ace-dbg contains
reference to TMPDIR [buildpaths]
>>> ERROR: ace-8.0.2-r0 do_package_qa: Fatal QA errors were found, failing
task.
>>>
>>> Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
>>> ---
>>>  meta-oe/recipes-connectivity/ace/ace_8.0.2.bb | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/meta-oe/recipes-connectivity/ace/ace_8.0.2.bb
b/meta-oe/recipes-connectivity/ace/ace_8.0.2.bb
>>> index b730b0a86c..e62ed39d0b 100644
>>> --- a/meta-oe/recipes-connectivity/ace/ace_8.0.2.bb
>>> +++ b/meta-oe/recipes-connectivity/ace/ace_8.0.2.bb
>>> @@ -27,7 +27,7 @@ export ACE_ROOT =3D "${UNPACKDIR}/ACE_wrappers"
>>>  inherit pkgconfig
>>>
>>>  CXXFLAGS:append =3D " -fpermissive -Wnodeprecated-declarations"
>>> -CXX:append =3D " -ffile-prefix-map=3D${UNPACKDIR}=3D "
>>> +CXX:append =3D " ${DEBUG_PREFIX_MAP} -ffile-prefix-map=3D${UNPACKDIR}=
=3D "
>>
>>
>> Hello,
>>
>> ${DEBUG_PREFIX_MAP} is usually in CXXFLAGS (set in
poky/meta/conf/bitbake.conf)
>>
>> Do you know why it is not the case here? or why does it not work?
>>
>> Thanks!
>>
>>>
>>>  EXTRA_OEMAKE +=3D "INSTALL_LIB=3D${baselib} install_rpath=3D0"
>>>
>>>  do_install() {
>>> --
>>> 2.43.0
>>>
>>>
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#117996):
https://lists.openembedded.org/g/openembedded-devel/message/117996
>>> Mute This Topic: https://lists.openembedded.org/mt/113755735/4316185
>>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[
yoann.congal@smile.fr]
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>
>>
>>
>> --
>> Yoann Congal
>> Smile ECS
>

--=20
Yoann Congal
Smile ECS

--000000000000a43a7c063828afd0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br>Le dimanche 22 juin 2025, Alper Ak &lt;<a href=3D"mailto:alperyasin=
ak1@gmail.com">alperyasinak1@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br>&gt;&=
gt; Hello,<br>&gt;&gt; ${DEBUG_PREFIX_MAP} is usually in CXXFLAGS (set in p=
oky/meta/conf/bitbake.conf)<br>&gt;&gt; Do you know why it is not the case =
here? or why does it not work?<br>&gt;&gt; Thanks!<br>&gt;<br>&gt; Although=
 Yocto/BitBake sets variables like CXXFLAGS and passes them to<br>&gt; the =
build environment, if i&#39;m not wrong, these flags will only affect<br>&g=
t; the final compiler invocation if the project&#39;s own build system<br>&=
gt; actually uses those variables in its Makefiles or build scripts.<br>&gt=
;<br>&gt; Looks like ACE doesn&#39;t use CXXFLAGS in its main Makefiles or =
compiler<br>&gt; calls.=C2=A0 Instead of it, it often uses variables like C=
CFLAGS, CPPFLAGS<br>&gt; or directly invokes the compiler using the CXX, wi=
thout including<br>&gt; CXXFLAGS. As a result, any flags added to CXXFLAGS,=
 such as<br>&gt; ${DEBUG_PREFIX_MAP}, don&#39;t reach the compiler and the =
QA buildpaths<br>&gt; issue remains unresolved.<br>&gt;<br>&gt; Appending t=
he flag directly to CXX works because ACE always calls the<br>&gt; compiler=
 as &quot;$(CXX) ...&quot;, so anything added to CXX is included in<br>&gt;=
 every compiler invocation regardless of how the build system is<br>&gt; st=
ructured.=C2=A0 As I said, I was found that ACE&#39;s Makefiles do include<=
br>&gt; CPPFLAGS in the compiler calls. So, adding ${DEBUG_PREFIX_MAP} to<b=
r>&gt; CPPFLAGS allows the flag to be properly propagated to the compiler a=
nd<br>&gt; resolves the QA issue.<br>&gt;<br>&gt; My thought before you ask=
ed the question was just &quot;the problem is<br>&gt; caused by the project=
.&quot;. Now we have detailed it and figured out why.<br>&gt;<br>&gt; It se=
ems that our solution here should be CPPFLAGS:append =3D &quot;<br>&gt; ${D=
EBUG_PREFIX_MAP}&quot;. Let me know if I&#39;m wrong or if there is a bette=
r<br>&gt; way.<br><br>CPPFLAGS should be C PreProcessor options. <br>DEBUG_=
PREFIX_MAP options are not C PreProcessor options.<br><br>The theoretical s=
olution would be to patch the ace build system to make it pass CXXFLAGS to =
CXX-based compilation (as well as CPPFLAGS). That patch most likely deserve=
s to be upstreamed.<br><br>Since you looked at ace&#39;s makefiles, does it=
 sound doable?<br><br>&gt;<br>&gt;<br>&gt; Yoann Congal &lt;<a href=3D"mail=
to:yoann.congal@smile.fr">yoann.congal@smile.fr</a>&gt;, 21 Haz 2025 Cmt, 1=
6:00 tarihinde<br>&gt; =C5=9Funu yazd=C4=B1:<br>&gt;&gt;<br>&gt;&gt;<br>&gt=
;&gt;<br>&gt;&gt; Le sam. 21 juin 2025 =C3=A0 12:26, Alper Ak via <a href=
=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;alperyasi=
nak1=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.=
openembedded.org</a>&gt; a =C3=A9crit :<br>&gt;&gt;&gt;<br>&gt;&gt;&gt; ERR=
OR: ace-8.0.2-r0 do_package_qa: QA Issue: File /usr/lib/.debug/libACE_Compr=
ession.so.8.0.2 in package ace-dbg contains reference to TMPDIR [buildpaths=
]<br>&gt;&gt;&gt; ERROR: ace-8.0.2-r0 do_package_qa: QA Issue: File /usr/li=
b/.debug/libACE_ETCL_Parser.so.8.0.2 in package ace-dbg contains reference =
to TMPDIR [buildpaths]<br>&gt;&gt;&gt; ERROR: ace-8.0.2-r0 do_package_qa: Q=
A Issue: File /usr/lib/.debug/libACE_ETCL.so.8.0.2 in package ace-dbg conta=
ins reference to TMPDIR [buildpaths]<br>&gt;&gt;&gt; ERROR: ace-8.0.2-r0 do=
_package_qa: QA Issue: File /usr/lib/.debug/libACE.so.8.0.2 in package ace-=
dbg contains reference to TMPDIR [buildpaths]<br>&gt;&gt;&gt; ERROR: ace-8.=
0.2-r0 do_package_qa: QA Issue: File /usr/lib/.debug/libACE_Monitor_Control=
.so.8.0.2 in package ace-dbg contains reference to TMPDIR [buildpaths]<br>&=
gt;&gt;&gt; ERROR: ace-8.0.2-r0 do_package_qa: QA Issue: File /usr/lib/.deb=
ug/libACE_RLECompression.so.8.0.2 in package ace-dbg contains reference to =
TMPDIR [buildpaths]<br>&gt;&gt;&gt; ERROR: ace-8.0.2-r0 do_package_qa: Fata=
l QA errors were found, failing task.<br>&gt;&gt;&gt;<br>&gt;&gt;&gt; Signe=
d-off-by: Alper Ak &lt;<a href=3D"mailto:alperyasinak1@gmail.com">alperyasi=
nak1@gmail.com</a>&gt;<br>&gt;&gt;&gt; ---<br>&gt;&gt;&gt;=C2=A0 meta-oe/re=
cipes-connectivity/ace/<a href=3D"http://ace_8.0.2.bb">ace_8.0.2.bb</a> | 2=
 +-<br>&gt;&gt;&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>=
&gt;&gt;&gt;<br>&gt;&gt;&gt; diff --git a/meta-oe/recipes-connectivity/ace/=
<a href=3D"http://ace_8.0.2.bb">ace_8.0.2.bb</a> b/meta-oe/recipes-connecti=
vity/ace/<a href=3D"http://ace_8.0.2.bb">ace_8.0.2.bb</a><br>&gt;&gt;&gt; i=
ndex b730b0a86c..e62ed39d0b 100644<br>&gt;&gt;&gt; --- a/meta-oe/recipes-co=
nnectivity/ace/<a href=3D"http://ace_8.0.2.bb">ace_8.0.2.bb</a><br>&gt;&gt;=
&gt; +++ b/meta-oe/recipes-connectivity/ace/<a href=3D"http://ace_8.0.2.bb"=
>ace_8.0.2.bb</a><br>&gt;&gt;&gt; @@ -27,7 +27,7 @@ export ACE_ROOT =3D &qu=
ot;${UNPACKDIR}/ACE_wrappers&quot;<br>&gt;&gt;&gt;=C2=A0 inherit pkgconfig<=
br>&gt;&gt;&gt;<br>&gt;&gt;&gt;=C2=A0 CXXFLAGS:append =3D &quot; -fpermissi=
ve -Wnodeprecated-declarations&quot;<br>&gt;&gt;&gt; -CXX:append =3D &quot;=
 -ffile-prefix-map=3D${UNPACKDIR}=3D &quot;<br>&gt;&gt;&gt; +CXX:append =3D=
 &quot; ${DEBUG_PREFIX_MAP} -ffile-prefix-map=3D${UNPACKDIR}=3D &quot;<br>&=
gt;&gt;<br>&gt;&gt;<br>&gt;&gt; Hello,<br>&gt;&gt;<br>&gt;&gt; ${DEBUG_PREF=
IX_MAP} is usually in CXXFLAGS (set in poky/meta/conf/bitbake.conf)<br>&gt;=
&gt;<br>&gt;&gt; Do you know why it is not the case here? or why does it no=
t work?<br>&gt;&gt;<br>&gt;&gt; Thanks!<br>&gt;&gt;<br>&gt;&gt;&gt;<br>&gt;=
&gt;&gt;=C2=A0 EXTRA_OEMAKE +=3D &quot;INSTALL_LIB=3D${baselib} install_rpa=
th=3D0&quot;<br>&gt;&gt;&gt;<br>&gt;&gt;&gt;=C2=A0 do_install() {<br>&gt;&g=
t;&gt; --<br>&gt;&gt;&gt; 2.43.0<br>&gt;&gt;&gt;<br>&gt;&gt;&gt;<br>&gt;&gt=
;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>&gt;&gt;&gt; Links: =
You receive all messages sent to this group.<br>&gt;&gt;&gt; View/Reply Onl=
ine (#117996): <a href=3D"https://lists.openembedded.org/g/openembedded-dev=
el/message/117996">https://lists.openembedded.org/g/openembedded-devel/mess=
age/117996</a><br>&gt;&gt;&gt; Mute This Topic: <a href=3D"https://lists.op=
enembedded.org/mt/113755735/4316185">https://lists.openembedded.org/mt/1137=
55735/4316185</a><br>&gt;&gt;&gt; Group Owner: <a href=3D"mailto:openembedd=
ed-devel%2Bowner@lists.openembedded.org">openembedded-devel+owner@lists.ope=
nembedded.org</a><br>&gt;&gt;&gt; Unsubscribe: <a href=3D"https://lists.ope=
nembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/=
openembedded-devel/unsub</a> [<a href=3D"mailto:yoann.congal@smile.fr">yoan=
n.congal@smile.fr</a>]<br>&gt;&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-<br>&gt;&gt;&gt;<br>&gt;&gt;<br>&gt;&gt;<br>&gt;&gt; --<br>&gt;&gt=
; Yoann Congal<br>&gt;&gt; Smile ECS<br>&gt;<br><br>-- <br><div dir=3D"ltr"=
><font face=3D"Raleway, regular">Yoann Congal</font><div><font face=3D"Rale=
way, regular">Smile ECS</font></div></div><br>

--000000000000a43a7c063828afd0--

