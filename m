Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61902D10F4D
	for <webhook@archiver.kernel.org>; Wed, 26 Nov 2025 13:12:06 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12541.1764162723730802237
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Nov 2025 05:12:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ZIIN0Fb8;
 spf=pass (domain: smile.fr, ip: 209.85.221.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-42b32900c8bso3939770f8f.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 Nov 2025 05:12:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1764162722; x=1764767522; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=x8KgjQOz9lKU/pIOEYsNsBdDwhtX7fIk1HbPqfv6wwk=;
        b=ZIIN0Fb8q/jqVDeA14Q6nPPjH8SRMiOetgwdsLJsK3DK79aJHp455tuhOgkDxzKme0
         JPRQQyQqhFoX3KKAAEUnmqXrqAaAVt4l/MepoA82uyErp+wK1PJElijaovQL6kxtXqG4
         eHrgooRZAN1cRtPwOgj2tvUk9W0/hPGB02SZ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764162722; x=1764767522;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x8KgjQOz9lKU/pIOEYsNsBdDwhtX7fIk1HbPqfv6wwk=;
        b=R1EL6h/DRAKyVWg+MB4Xf+g+neX5IUAKh/HOOiQ/+uX8dXWm3pb3818P3ZikKSyRQv
         V55rIiXbNUEa7cpjKlJEfK/QJzk+Z2oIMmhVPRkEf4uVtuLKjdAFwkChuWtEx8qLODsz
         cmd775PM5Z/jyCCxlYF1bDzdeZ4mDVBbUD7b38pnrMBXUeB3+DbrQaThTjCy8Zr0NgYX
         6eDXeLAHFrg2RY/+qljyMDHNSslINpuFwIRlGNZyWq8Oy4DsP51qXjwsjn+pH7LllmS6
         1ZKdiuxO2YttBhjO4/7Iu72Z9Gths5vfSM0sC3i0pT1eK72I4eVPlNe1DmsxQQG+Dysk
         67EA==
X-Gm-Message-State: AOJu0YzBatKOfQHPNHvZJ2p20x9aUo1WbVxi9jln/GnvnnO/3Un3i3oi
	l7pvOA9vwdf3Wa+Wa5OvcqsGS24IvfOMl8HMP+Itp+s81dXuRdM+3tXVP8nVSO3h/GuFCP93+4j
	O3etKdQDMW4zlKj7aBAg4kExJkiWkmZBztdumt1V9Ig==
X-Gm-Gg: ASbGncvPifpGRLbCQbw/CGu4aUcSfY1MeJSGlk1YbvBlgMa2cP2BoRHji+4vsZr25S1
	KasEqOez9j8ODStgDVT1GGzZtMCxdc46tonsumbwRsTz6W2VPiMP2eslO7y4pQ0U/FIPm2kAFoZ
	7znPwRR2+8XI477TqqhWL//Q2fCKNqEzg6ccO7O1uBe3XFr+2qARVAH/cDkklrbcEYbs+XHm57K
	4RcrY/Rt4UMFnJxxOOb4AIBwcaXgAKSc5cJ403PYHA/UTOxW9RDDb8URxrJh5/40MaNgqPY0s0Z
	ehmpCHoL
X-Google-Smtp-Source: AGHT+IEoDca223iDWEfV+E7Hib5nANsWi0UOgqj9zNv8/6ov9v5w5BMk92RzWAnK0X8R115d/ZOSM1ZGBk8sKi/RMGs=
X-Received: by 2002:a05:6000:4203:b0:42b:3dbe:3a55 with SMTP id
 ffacd0b85a97d-42cc1cee3dbmr19250868f8f.14.1764162721966; Wed, 26 Nov 2025
 05:12:01 -0800 (PST)
MIME-Version: 1.0
References: <20251125225858.1361559-1-raj.khem@gmail.com> <CAMSfU+6kcE1uociWaV1s06rNw+a-1sRjL9q=DYGOq-t57Ms-VA@mail.gmail.com>
 <CAMKF1sqNG-XAAjx8U0kxdt1=oOPS1CDShM7ef50W6DM4Wg22vA@mail.gmail.com>
In-Reply-To: <CAMKF1sqNG-XAAjx8U0kxdt1=oOPS1CDShM7ef50W6DM4Wg22vA@mail.gmail.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Wed, 26 Nov 2025 14:11:36 +0100
X-Gm-Features: AWmQ_bkZhdtNwOK-UN4wFCYKVCw9A6kbrKcrabd18cd5sWDfg6krOaLHlbaJVW4
Message-ID: <CAMSfU+5RC8Hg_b2Xw5wwApaMMyCPv_PW2hQwUnJgnKXXEk4Uag@mail.gmail.com>
Subject: Re: [oe] [meta-filesystem][PATCH] e2tools: Fix buildpaths in ptests
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000005e819006447f2409"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Nov 2025 13:12:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122078

--0000000000005e819006447f2409
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 26 nov. 2025 =C3=A0 08:28, Khem Raj <raj.khem@gmail.com> a =C3=A9cr=
it :

>
>
> On Tue, Nov 25, 2025 at 3:55=E2=80=AFPM Yoann Congal <yoann.congal@smile.=
fr>
> wrote:
>
>> Le mar. 25 nov. 2025 =C3=A0 23:59, Khem Raj via lists.openembedded.org
>> <raj.khem=3Dgmail.com@lists.openembedded.org> a =C3=A9crit :
>>
>>> Currently the path checks are escaping QA check for buildpath detection
>>> but config.status
>>> still has paths which show up in reproduciblity failures, comparing
>>> build in path A and
>>> build in path B, content of config.status don't end up same.
>>
>>
>> FYI, last time we tried to fixed that, some of the lines in config.statu=
s
>> looked like this:
>> S["LDFLAGS"]=3D"-Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed
>>  -ffile-prefix-map=3D/srv/pokybuild/yocto-worker/reproducible-meta-oe/bu=
ild/build/build-st-meta-filesyste"\
>> "ms/build-st/reproducibleB-extended/tmp/work/x86-64-v3-poky-linux/e2tool=
s/0.1.2/sources/e2tools-0.1.2=3D/usr/src/debug/e2tools/0.1.2
>>  -ffile-prefix-map"\
>> "=3D/work/x86-64-v3-poky-linu"\
>> "x/e2tools/0.1.2/build=3D/usr/src/debug/e2tools/0.1.2
>>  -ffile-prefix-map=3D/srv/pokybuild/yocto-worker/reproducible-meta-oe/bu=
ild/build/build-st-meta-fil"\
>> "esystems/build-st/reproducibleB-extended/tmp/work/x86-64-v3-poky-linux/=
e2tools/0.1.2/recipe-sysroot=3D
>>  -ffile-prefix-map=3D/srv/pokybuild/yocto-worker/"\
>>
>> "reproducible-meta-oe/build/build/build-st-meta-filesystems/build-st/rep=
roducibleB-extended/tmp/work/x86-64-v3-poky-linux/e2tools/0.1.2/recipe-sysr=
oo"\
>> "t-native=3D  -Wl,-z,relro,-z,now"
>>
>> =3D> The non-reproducible paths split across line breaks.
>>
>> This is autoconf trying to generate a portable AWK script (meaning the
>> maximum line size for a literal is around 150). Since the "portable" her=
e
>> means supporting prehistoric UNIX version of awk we started working on
>> modifying this limit in autoconf (_AC_AWK_LITERAL_LIMIT) to something mo=
re
>> modern (1000). The goal was to avoid having non-reproducible paths split
>> across line breaks to let sed work correctly but we never quite finished
>> this patch.
>>
>
> Thanks for adding more context here. I guess we can fix OEs autoconf like
> [1]
> These variables are useless for running/building ptests on the target. So
> omitting them here
> gets us moving as well.
>
> you can test the autoconf patch and see if it is helpful in making things
> better in general we might be ok to maintain it in OE
> upstream will not accept the raised limits
>
> [1]
> https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dkraj/i=
-told-you&id=3Db7c107fc6f0142cf848393937f3d0ee09ea90228
>


with the autoconf patch but without this e2tools patch that look lilke:
S["LDFLAGS"]=3D"-Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed
-fcanon-prefix-map
 -ffile-prefix-map=3D/work/x86-64-v3-poky-linux/e2tools/0.1.2/sources/e2too=
ls-0.1.2=3D/usr/src/debug/e2tools/0.1.2
 -ffile-prefix-map=3D/work/x86-64-v3-poky-linux/e2tools/0.1.2/build=3D/usr/=
src/debug/e2tools/0.1.2
 -ffile-prefix-map=3D/work/x86-64-v3-poky-linux/e2tools/0.1.2/recipe-sysroo=
t=3D
 -ffile-prefix-map=3D/work/x86-64-v3-poky-linux/e2tools/0.1.2/recipe-sysroo=
t-native=3D
 -Wl,-z,relro,-z,now"
S["CFLAGS"]=3D" -O2 -g -fcanon-prefix-map
 -ffile-prefix-map=3D/work/x86-64-v3-poky-linux/e2tools/0.1.2/sources/e2too=
ls-0.1.2=3D/usr/src/debug/e2tools/0.1.2
 -ffile-prefix-map=3D/work/x86-64-v3-poky-linux/e2tools/0.1.2/build=3D/usr/=
src/debug/e2tools/0.1.2
 -ffile-prefix-map=3D/work/x86-64-v3-poky-linux/e2tools/0.1.2/recipe-sysroo=
t=3D
 -ffile-prefix-map=3D/work/x86-64-v3-poky-linux/e2tools/0.1.2/recipe-sysroo=
t-native=3D
 -pipe --std=3Dgnu99 -pedantic -Wall -Wextra -Wp,-D_FORTIFY_SOURCE=3D2
-fstack-clash-protection -fcf-protection"
S["CC"]=3D"ccache x86_64-poky-linux-gcc  -m64 -march=3Dx86-64-v3
-fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=3D2 -Wformat
-Wformat-security -Werror=3Dformat-security
--sysroot=3D/work/x86-64-v3-poky-linux/e2tools/0.1.2/recipe-sysroot"

No line break, the single
  sed -i -e 's;${TMPDIR};;g' ${D}${PTEST_PATH}/build/config.status
works enough to remove non-reproducible patches


>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> ---
>>>  .../recipes-utils/e2tools/e2tools_0.1.2.bb       | 16 +++++++++++++++-
>>>  1 file changed, 15 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/meta-filesystems/recipes-utils/e2tools/e2tools_0.1.2.bb
>>> b/meta-filesystems/recipes-utils/e2tools/e2tools_0.1.2.bb
>>> index 219735acd1..b7b925da0e 100644
>>> --- a/meta-filesystems/recipes-utils/e2tools/e2tools_0.1.2.bb
>>> +++ b/meta-filesystems/recipes-utils/e2tools/e2tools_0.1.2.bb
>>> @@ -39,7 +39,21 @@ do_install_ptest() {
>>>          ${D}${PTEST_PATH}/build/autom4te.cache \
>>>          ${D}${PTEST_PATH}/*/*/.git ${D}${PTEST_PATH}/*/*/.github \
>>>          ${D}${PTEST_PATH}/*/*/autom4te.cache
>>> -    sed -i -e 's;${TMPDIR};;g' ${D}${PTEST_PATH}/build/config.status
>>> +    sed -e 's@[^ ]*-ffile-prefix-map=3D[^ "]*@@g' \
>>> +        -e 's@[^ ]*-fdebug-prefix-map=3D[^ "]*@@g' \
>>> +        -e 's@[^ ]*-fmacro-prefix-map=3D[^ "]*@@g' \
>>> +        -e 's@[^ ]*--sysroot=3D[^ "]*@@g' \
>>> +        -e 's@[^ ]*--with-libtool-sysroot=3D[^ "]*@@g' \
>>> +        -e 's@[^ ]*--with-install-prefix=3D[^ "]*@@g' \
>>> +        -e '/EXT2FS_CFLAGS/d' \
>>> +        -e '/LDFLAGS/d' \
>>> +        -e '/PKG_CONFIG_PATH/d' \
>>> +        -e '/PKG_CONFIG_LIBDIR/d' \
>>> +        -e 's@${S}@${PTEST_PATH}@g' \
>>> +        -e 's@${B}@${PTEST_PATH}/build@g' \
>>> +        -e 's@${HOSTTOOLS_DIR}@@g' \
>>> +        -e 's@${RECIPE_SYSROOT}@@g' \
>>> +        -i ${D}${PTEST_PATH}/build/config.status
>>>  }
>>>
>>>  RDEPENDS:${PN}-ptest +=3D "bash coreutils e2fsprogs e2tools gawk make
>>> perl"
>>>
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#122065):
>>> https://lists.openembedded.org/g/openembedded-devel/message/122065
>>> Mute This Topic: https://lists.openembedded.org/mt/116477328/4316185
>>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[
>>> yoann.congal@smile.fr]
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>
>>>
>>
>> --
>> Yoann Congal
>> Smile ECS
>>
>

--=20
Yoann Congal
Smile ECS

--0000000000005e819006447f2409
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mer. 26 nov.=
 2025 =C3=A0=C2=A008:28, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com"=
 target=3D"_blank">raj.khem@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=
=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Tue, Nov 25, 2025 at 3:55=E2=80=AFPM Yoann=
 Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr" target=3D"_blank">yoan=
n.congal@smile.fr</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr">Le=C2=A0mar. 25 nov. 202=
5 =C3=A0=C2=A023:59, Khem Raj via <a href=3D"http://lists.openembedded.org"=
 target=3D"_blank">lists.openembedded.org</a> &lt;raj.khem=3D<a href=3D"mai=
lto:gmail.com@lists.openembedded.org" target=3D"_blank">gmail.com@lists.ope=
nembedded.org</a>&gt; a =C3=A9crit=C2=A0:</div><div class=3D"gmail_quote"><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">Currently the path checks =
are escaping QA check for buildpath detection but config.status<br>
still has paths which show up in reproduciblity failures, comparing build i=
n path A and<br>
build in path B, content of config.status don&#39;t end up same.</blockquot=
e><div>=C2=A0</div><div>FYI, last time we tried to fixed that, some of the =
lines in=C2=A0config.status looked like this:</div><div>S[&quot;LDFLAGS&quo=
t;]=3D&quot;-Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed =C2=A0-ffile-pre=
fix-map=3D/srv/pokybuild/yocto-worker/reproducible-meta-oe/build/build/buil=
d-st-meta-filesyste&quot;\<br>&quot;ms/build-st/reproducibleB-extended/tmp/=
work/x86-64-v3-poky-linux/e2tools/0.1.2/sources/e2tools-0.1.2=3D/usr/src/de=
bug/e2tools/0.1.2 =C2=A0-ffile-prefix-map&quot;\<br>&quot;=3D/work/x86-64-v=
3-poky-linu&quot;\<br>&quot;x/e2tools/0.1.2/build=3D/usr/src/debug/e2tools/=
0.1.2 =C2=A0-ffile-prefix-map=3D/srv/pokybuild/yocto-worker/reproducible-me=
ta-oe/build/build/build-st-meta-fil&quot;\<br>&quot;esystems/build-st/repro=
ducibleB-extended/tmp/work/x86-64-v3-poky-linux/e2tools/0.1.2/recipe-sysroo=
t=3D =C2=A0-ffile-prefix-map=3D/srv/pokybuild/yocto-worker/&quot;\<br>&quot=
;reproducible-meta-oe/build/build/build-st-meta-filesystems/build-st/reprod=
ucibleB-extended/tmp/work/x86-64-v3-poky-linux/e2tools/0.1.2/recipe-sysroo&=
quot;\<br>&quot;t-native=3D =C2=A0-Wl,-z,relro,-z,now&quot;<br><br></div><d=
iv>=3D&gt; The non-reproducible paths split across line breaks.</div><div><=
br></div><div>This is autoconf trying to generate a portable AWK script (me=
aning the maximum line size for a literal is around 150). Since the &quot;p=
ortable&quot; here means supporting prehistoric UNIX version of awk we star=
ted working on modifying this limit in autoconf (_AC_AWK_LITERAL_LIMIT) to =
something more modern (1000). The goal was to avoid having non-reproducible=
 paths split across=C2=A0line breaks to let sed work correctly but we never=
 quite finished this patch.</div></div></div></blockquote><div><br></div><d=
iv>Thanks for adding more context here. I guess we can fix OEs autoconf lik=
e [1]=C2=A0</div><div>These variables are useless for running/building ptes=
ts=C2=A0on the target. So omitting them here</div><div>gets us moving as we=
ll.=C2=A0</div><div><br></div><div>you can test the autoconf patch and see =
if it is helpful in making things better in general we might be ok to maint=
ain it in OE</div><div>upstream will not accept the raised limits</div><div=
><br></div><div>[1]=C2=A0<a href=3D"https://git.openembedded.org/openembedd=
ed-core-contrib/commit/?h=3Dkraj/i-told-you&amp;id=3Db7c107fc6f0142cf848393=
937f3d0ee09ea90228" target=3D"_blank">https://git.openembedded.org/openembe=
dded-core-contrib/commit/?h=3Dkraj/i-told-you&amp;id=3Db7c107fc6f0142cf8483=
93937f3d0ee09ea90228</a></div></div></div></div></blockquote><div><br></div=
><div><br></div><div>with the autoconf patch but without this e2tools patch=
 that look lilke:</div><div>S[&quot;LDFLAGS&quot;]=3D&quot;-Wl,-O1 -Wl,--ha=
sh-style=3Dgnu -Wl,--as-needed -fcanon-prefix-map =C2=A0-ffile-prefix-map=
=3D/work/x86-64-v3-poky-linux/e2tools/0.1.2/sources/e2tools-0.1.2=3D/usr/sr=
c/debug/e2tools/0.1.2 =C2=A0-ffile-prefix-map=3D/work/x86-64-v3-poky-linux/=
e2tools/0.1.2/build=3D/usr/src/debug/e2tools/0.1.2 =C2=A0-ffile-prefix-map=
=3D/work/x86-64-v3-poky-linux/e2tools/0.1.2/recipe-sysroot=3D =C2=A0-ffile-=
prefix-map=3D/work/x86-64-v3-poky-linux/e2tools/0.1.2/recipe-sysroot-native=
=3D =C2=A0-Wl,-z,relro,-z,now&quot;<br>S[&quot;CFLAGS&quot;]=3D&quot; -O2 -=
g -fcanon-prefix-map =C2=A0-ffile-prefix-map=3D/work/x86-64-v3-poky-linux/e=
2tools/0.1.2/sources/e2tools-0.1.2=3D/usr/src/debug/e2tools/0.1.2 =C2=A0-ff=
ile-prefix-map=3D/work/x86-64-v3-poky-linux/e2tools/0.1.2/build=3D/usr/src/=
debug/e2tools/0.1.2 =C2=A0-ffile-prefix-map=3D/work/x86-64-v3-poky-linux/e2=
tools/0.1.2/recipe-sysroot=3D =C2=A0-ffile-prefix-map=3D/work/x86-64-v3-pok=
y-linux/e2tools/0.1.2/recipe-sysroot-native=3D =C2=A0-pipe --std=3Dgnu99 -p=
edantic -Wall -Wextra -Wp,-D_FORTIFY_SOURCE=3D2 -fstack-clash-protection -f=
cf-protection&quot;<br>S[&quot;CC&quot;]=3D&quot;ccache x86_64-poky-linux-g=
cc =C2=A0-m64 -march=3Dx86-64-v3 -fstack-protector-strong =C2=A0-O2 -D_FORT=
IFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-security --sysro=
ot=3D/work/x86-64-v3-poky-linux/e2tools/0.1.2/recipe-sysroot&quot;</div><di=
v><br></div><div>No line break, the single<br>=C2=A0 sed -i -e &#39;s;${TMP=
DIR};;g&#39; ${D}${PTEST_PATH}/build/config.status</div><div>works enough t=
o remove non-reproducible patches=C2=A0</div><div>=C2=A0</div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><div=
 class=3D"gmail_quote"><div></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div><br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../recipes-utils/e2tools/<a href=3D"http://e2tools_0.1.2.bb" rel=3D"=
noreferrer" target=3D"_blank">e2tools_0.1.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 16 +++++++++++++++-<br>
=C2=A01 file changed, 15 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta-filesystems/recipes-utils/e2tools/<a href=3D"http://e2too=
ls_0.1.2.bb" rel=3D"noreferrer" target=3D"_blank">e2tools_0.1.2.bb</a> b/me=
ta-filesystems/recipes-utils/e2tools/<a href=3D"http://e2tools_0.1.2.bb" re=
l=3D"noreferrer" target=3D"_blank">e2tools_0.1.2.bb</a><br>
index 219735acd1..b7b925da0e 100644<br>
--- a/meta-filesystems/recipes-utils/e2tools/<a href=3D"http://e2tools_0.1.=
2.bb" rel=3D"noreferrer" target=3D"_blank">e2tools_0.1.2.bb</a><br>
+++ b/meta-filesystems/recipes-utils/e2tools/<a href=3D"http://e2tools_0.1.=
2.bb" rel=3D"noreferrer" target=3D"_blank">e2tools_0.1.2.bb</a><br>
@@ -39,7 +39,21 @@ do_install_ptest() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${D}${PTEST_PATH}/build/autom4te.cache \<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${D}${PTEST_PATH}/*/*/.git ${D}${PTEST_PA=
TH}/*/*/.github \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${D}${PTEST_PATH}/*/*/autom4te.cache<br>
-=C2=A0 =C2=A0 sed -i -e &#39;s;${TMPDIR};;g&#39; ${D}${PTEST_PATH}/build/c=
onfig.status<br>
+=C2=A0 =C2=A0 sed -e &#39;s@[^ ]*-ffile-prefix-map=3D[^ &quot;]*@@g&#39; \=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &#39;s@[^ ]*-fdebug-prefix-map=3D[^ &quot;]=
*@@g&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &#39;s@[^ ]*-fmacro-prefix-map=3D[^ &quot;]=
*@@g&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &#39;s@[^ ]*--sysroot=3D[^ &quot;]*@@g&#39;=
 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &#39;s@[^ ]*--with-libtool-sysroot=3D[^ &qu=
ot;]*@@g&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &#39;s@[^ ]*--with-install-prefix=3D[^ &quo=
t;]*@@g&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &#39;/EXT2FS_CFLAGS/d&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &#39;/LDFLAGS/d&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &#39;/PKG_CONFIG_PATH/d&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &#39;/PKG_CONFIG_LIBDIR/d&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &#39;s@${S}@${PTEST_PATH}@g&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &#39;s@${B}@${PTEST_PATH}/build@g&#39; \<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &#39;s@${HOSTTOOLS_DIR}@@g&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &#39;s@${RECIPE_SYSROOT}@@g&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -i ${D}${PTEST_PATH}/build/config.status<br>
=C2=A0}<br>
<br>
=C2=A0RDEPENDS:${PN}-ptest +=3D &quot;bash coreutils e2fsprogs e2tools gawk=
 make perl&quot;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#122065): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/122065" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/122065</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116477328/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/116477328/4316185</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:yoann.congal@smile.fr" t=
arget=3D"_blank">yoann.congal@smile.fr</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>
</blockquote></div></div>
</div>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>
</div>

--0000000000005e819006447f2409--

