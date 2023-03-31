Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32F00C77B60
	for <webhook@archiver.kernel.org>; Fri, 31 Mar 2023 18:54:53 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.4016.1680288887048220880
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Mar 2023 11:54:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20210112 header.b=Qs8Y1uUL;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id u11-20020a05600c19cb00b003edcc414997so14521486wmq.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 31 Mar 2023 11:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680288885; x=1682880885;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7J1Mq9SSY68Rrzy2fBYMy/iL0+9cxbJAQs/qplEPvSI=;
        b=Qs8Y1uULNdHTD6Nqjs6+VoTX3SUV48xCmxiGheY8dP3g/Ba8H7zDAxJQ49cyZOzXKC
         nEK6c65xVqWKsVfvsddb3ZGRlP7be0UAU88e11cWq2cqDoj4CkOoXme8Qf1GAMDS7C6s
         cjDfkDvYJHiuQI46KfMFuM3woDC7JQBhD0FETvGNeCOTyGkD575l5UDVkxhjXTizqVMV
         NGC32Na14ZAUrDgUfs08+SkIsc5Y2n3BhewQrm6l631K1eubM9COsuAshyzs82UeJkJM
         BbZf90IWTcYdMsbgI1WEcIsipuSaim+kYsqSZK7/i53YhwPL21tV8t85izg+EaL1v6Zw
         pCOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680288885; x=1682880885;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7J1Mq9SSY68Rrzy2fBYMy/iL0+9cxbJAQs/qplEPvSI=;
        b=f1bIYfM9oTIc1/GpumKBz+rE/SzMs+NTczABpmG8iSu4qGLT8SRwlWAGwOmJZ4c9E5
         IQWC5gKOhori1UJder7I4IbSohySOUtAYW3MISHymXabMBVtqjlYuB5hOhi82bI6N2gb
         e/PsznrjKCF1kdNB8byjrPPHCY4sqtvZ5BaJAMp+rRAOtlXMCVLY1EpSVMYhgFk33Oun
         ssPlOHL+Zqr+rYbXz1un/zX+yy4ydIrMa4MJFw/Wtiw/xWI4JNevX6/gZIIcJumxiYNv
         KUnonkQ1Rc7Pm3LcS5fkKfTRmhDL3XoIETC2jaeKNlOAUPhqBEAzSXgMVHfueBkEmpjZ
         PkOA==
X-Gm-Message-State: AAQBX9cXTUglgSzcslw2BHAaE9EOWrpSNxGXmOo5Btnus44NmuIiaE26
	x0MZ9XtkGVwIAEnhD2VEHUQ2ptjDzFRhkdYYgiQ=
X-Google-Smtp-Source: AKy350apMZtYOEQgUs10Zffh9GqbUAKM1X7J8TALvE+RcjccB4k5y1HNvPP/sR5KBME2fYOpfcTAP6UXNd8gGEbC2JQ=
X-Received: by 2002:a05:600c:1d17:b0:3eb:3998:8bed with SMTP id
 l23-20020a05600c1d1700b003eb39988bedmr4136472wms.1.1680288885123; Fri, 31 Mar
 2023 11:54:45 -0700 (PDT)
MIME-Version: 1.0
References: <MW4PR11MB582294CA64F65F30BD08496984229@MW4PR11MB5822.namprd11.prod.outlook.com>
 <CAMKF1srMzGA-y8+6mdV1gtYWfsJYvafhKkwvUu_HN-M=NwBfAA@mail.gmail.com>
 <MW4PR11MB5822CE51AA941EF0BE37115284259@MW4PR11MB5822.namprd11.prod.outlook.com>
 <CAMKF1sqHdrf1mK=c7CHVpKF7htPYbGztaG77FXReLMPczgoD4Q@mail.gmail.com>
 <3c7d0ac3-642d-8bc6-87b4-cd0d0b6a704b@windriver.com> <00ad165c-cf3e-e3f5-e0c9-46c9df882757@windriver.com>
 <FF2F4A07-1C8D-40DF-AA1A-B0E0CC82B8AA@arm.com> <25f3bfc0-3a56-998f-83b8-713eda3f3282@windriver.com>
In-Reply-To: <25f3bfc0-3a56-998f-83b8-713eda3f3282@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 31 Mar 2023 20:54:30 +0200
Message-ID: <CA+chaQd8UFkHwWAQOag485cgksMGVzCiLeYUyMn+wxKPCGBxvw@mail.gmail.com>
Subject: Re: [oe] Security Advisory - yasm - CVE-2021-33461: Propose mv
 yasm_git.bb yasm-native_git.bb
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: Ross Burton <Ross.Burton@arm.com>, Khem Raj <raj.khem@gmail.com>, 
	"Polampalli, Archana" <Archana.Polampalli@windriver.com>, "Mittal, Anuj" <anuj.mittal@intel.com>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000001e2cc605f836be9b"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 31 Mar 2023 18:54:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101864

--0000000000001e2cc605f836be9b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 31, 2023 at 8:43=E2=80=AFPM Randy MacLeod <randy.macleod@windri=
ver.com>
wrote:

> On 2023-03-31 05:51, Ross Burton wrote:
>
> On 30 Mar 2023, at 22:56, Randy MacLeod via lists.openembedded.org <randy=
.macleod=3Dwindriver.com@lists.openembedded.org> <randy.macleod=3Dwindriver=
.com@lists.openembedded.org> wrote:
>
> The yasm CVEs have come up again. Sigh.
> Upstream seems not to be interested in fixing CVEs:https://github.com/yas=
m/yasm/commits/master
>
> We only need yasm-native (1) so does anyone object to
> moving this recipe to yasm-native_git.bb ? This small change
> would make it clear that images/tagets/machines are not _directly_ vulner=
able
> due to the fuzzing errors people are generating which result in CVEs.
>
> It seems like a better alternative would be to reduce the number of assem=
blers that are effectively unmaintained from two (nasm and yasm) to one (ju=
st nasm, as that=E2=80=99s in oe-core).  Also marking all yasm/nasm depende=
ncies as being x86-specific for obvious reasons.
>
> I=E2=80=99m a firm believer that we should be able to rebuild all package=
s on target, so native-specific tools should be a special case.  The moment=
 you make it native only is the moment you discover that someone was using =
nativesdk-yasm or on-target yasm to develop.
>
> Few assembler recipes: good idea!
> Yes, it's best to keep the recipe working for both -native and target.
>
> Looking at your search, I think we might be able to just remove yasm enti=
rely:
>
>
> meta-multimedia/recipes-multimedia/aom/aom_3.4.0.bb
> 18:DEPENDS =3D " yasm-native"
>
> According to the AOM readme:
>
> "For x86 targets, yasm, which is preferred, or a recent version of nasm.=
=E2=80=9D
>
> So that dependency should be specific to x86 targets, and could be nasm.
>
>
> meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> 310:    yasm \
>
> This is just the meta packagegroup that pulls in all of the recipes, for =
testing.
>
>
> ../meta-browser.git/meta-firefox/recipes-browser/firefox/firefox_68.9.0es=
r.bb
> 8:            yasm-native nasm-native unzip-native \
>
> Of course firefox wants yasm *and* nasm.  Those should most likely be x86=
-specific to start with, and I=E2=80=99m guessing that=E2=80=99s related to=
:
>
>
> ../meta-browser.git/meta-firefox/recipes-browser/firefox/firefox/fixes/pr=
e-generated-old-configure.patch
> 8213:+                { echo "configure: error: Building ICU requires eit=
her yasm or a GNU assembler. If you do not have either of those available f=
or this platform you must use --without-intl-api" 1>&2; echo "configure: er=
ror: Building ICU requires either yasm or a GNU assembler. If you do not ha=
ve either of those available for this platform you must use --without-intl-=
api" 1>&5; exit 1;
>
> So that patch adds a huge configure script with no explanation and is at =
least five years old.
>
> We happily build ICU in core without yaml as we have GNU as.  I expect th=
at can be removed.
>
> Let's hope so and Archana and I can take a look.
>
>
> It would be nice to update firefox ( 68->110 !!) but we're (WR) in the:
> 'everybody expects the blink rendering engine'  camp.
>
> If Martin doesn't have any plans to update firefox, it might become a
> weekend project.
>
I'm in the "I wish I didn't include it in my OE build-time benchmark" camp
:).

I've never used OE built firefox and don't plan to use it in future. And I
don't plan to update it, in worst case I'll have to spent bare-minimal time
to make it build-able again just to measure how much slower it builds with
newer rust.

>

--0000000000001e2cc605f836be9b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, Mar 31, 2023 at 8:43=E2=80=AFPM R=
andy MacLeod &lt;<a href=3D"mailto:randy.macleod@windriver.com">randy.macle=
od@windriver.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">

 =20
  <div>
    <div>On 2023-03-31 05:51, Ross Burton wrote:<br>
    </div>
    <blockquote type=3D"cite">
      <pre>On 30 Mar 2023, at 22:56, Randy MacLeod via <a href=3D"http://li=
sts.openembedded.org" target=3D"_blank">lists.openembedded.org</a> <a href=
=3D"mailto:randy.macleod=3Dwindriver.com@lists.openembedded.org" target=3D"=
_blank">&lt;randy.macleod=3Dwindriver.com@lists.openembedded.org&gt;</a> wr=
ote:
</pre>
      <blockquote type=3D"cite">
        <pre>The yasm CVEs have come up again. Sigh.
Upstream seems not to be interested in fixing CVEs:
<a href=3D"https://github.com/yasm/yasm/commits/master" target=3D"_blank">h=
ttps://github.com/yasm/yasm/commits/master</a>

We only need yasm-native (1) so does anyone object to=20
moving this recipe to <a href=3D"http://yasm-native_git.bb" target=3D"_blan=
k">yasm-native_git.bb</a> ? This small change
would make it clear that images/tagets/machines are not _directly_ vulnerab=
le
due to the fuzzing errors people are generating which result in CVEs.
</pre>
      </blockquote>
      <pre>It seems like a better alternative would be to reduce the number=
 of assemblers that are effectively unmaintained from two (nasm and yasm) t=
o one (just nasm, as that=E2=80=99s in oe-core).  Also marking all yasm/nas=
m dependencies as being x86-specific for obvious reasons.

I=E2=80=99m a firm believer that we should be able to rebuild all packages =
on target, so native-specific tools should be a special case.  The moment y=
ou make it native only is the moment you discover that someone was using na=
tivesdk-yasm or on-target yasm to develop.</pre>
    </blockquote>
    Few assembler recipes: good idea!<br>
    Yes, it&#39;s best to keep the recipe working for both -native and
    target.<br>
    <blockquote type=3D"cite">
      <pre>Looking at your search, I think we might be able to just remove =
yasm entirely:

</pre>
      <blockquote type=3D"cite">
        <pre>meta-multimedia/recipes-multimedia/aom/<a href=3D"http://aom_3=
.4.0.bb" target=3D"_blank">aom_3.4.0.bb</a>
18:DEPENDS =3D &quot; yasm-native&quot;
</pre>
      </blockquote>
      <pre>According to the AOM readme:

&quot;For x86 targets, yasm, which is preferred, or a recent version of nas=
m.=E2=80=9D

So that dependency should be specific to x86 targets, and could be nasm.

</pre>
      <blockquote type=3D"cite">
        <pre>meta-oe/recipes-core/packagegroups/<a href=3D"http://packagegr=
oup-meta-oe.bb" target=3D"_blank">packagegroup-meta-oe.bb</a>
310:    yasm \
</pre>
      </blockquote>
      <pre>This is just the meta packagegroup that pulls in all of the reci=
pes, for testing.

</pre>
      <blockquote type=3D"cite">
        <pre>../meta-browser.git/meta-firefox/recipes-browser/firefox/<a hr=
ef=3D"http://firefox_68.9.0esr.bb" target=3D"_blank">firefox_68.9.0esr.bb</=
a>
8:            yasm-native nasm-native unzip-native \
</pre>
      </blockquote>
      <pre>Of course firefox wants yasm *and* nasm.  Those should most like=
ly be x86-specific to start with, and I=E2=80=99m guessing that=E2=80=99s r=
elated to:

</pre>
      <blockquote type=3D"cite">
        <pre>../meta-browser.git/meta-firefox/recipes-browser/firefox/firef=
ox/fixes/pre-generated-old-configure.patch
8213:+                { echo &quot;configure: error: Building ICU requires =
either yasm or a GNU assembler. If you do not have either of those availabl=
e for this platform you must use --without-intl-api&quot; 1&gt;&amp;2; echo=
 &quot;configure: error: Building ICU requires either yasm or a GNU assembl=
er. If you do not have either of those available for this platform you must=
 use --without-intl-api&quot; 1&gt;&amp;5; exit 1;=20
</pre>
      </blockquote>
      <pre>So that patch adds a huge configure script with no explanation a=
nd is at least five years old.

We happily build ICU in core without yaml as we have GNU as.  I expect that=
 can be removed.</pre>
    </blockquote>
    <p>Let&#39;s hope so and Archana and I can take a look.</p>
    <p><br>
    </p>
    It would be nice to update firefox ( 68-&gt;110 !!) but we&#39;re (WR)
    in the:<br>
    &#39;everybody expects the blink rendering engine&#39;=C2=A0 camp. <br>
    <p>If Martin doesn&#39;t have any plans to update firefox, it might
      become a weekend project.</p></div></blockquote><div>I&#39;m in the &=
quot;I wish I didn&#39;t include it in my OE build-time benchmark&quot; cam=
p :).</div><div><br></div><div>I&#39;ve never used OE built firefox and don=
&#39;t plan to use it in future. And I don&#39;t plan to update it, in wors=
t case I&#39;ll have to spent bare-minimal time to make it build-able again=
 just to measure how much slower it builds with newer rust.</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex"><div>
  </div>

</blockquote></div></div>

--0000000000001e2cc605f836be9b--

