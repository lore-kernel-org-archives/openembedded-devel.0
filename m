Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2BB8D10389
	for <webhook@archiver.kernel.org>; Wed, 26 Nov 2025 07:29:03 +0000 (UTC)
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8395.1764142135014510168
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Nov 2025 23:28:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=W+1W8TpJ;
 spf=pass (domain: gmail.com, ip: 74.125.224.50, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-6420c08f886so7129485d50.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 23:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764142134; x=1764746934; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aoaY9KamTcBrQavEqKubcEeSlRDt0NYYbjCT7gWoTUo=;
        b=W+1W8TpJZZm8UL2wy1f4au+9u4xkE/p0SH2Aqiytf78v//myXeOqxMLlzhY34UZ19/
         dQ3VVXAl9VhaE/ErGesHwNggqiHlH5opqQKr4QPFlgwldntIfQa0HQP+cydAZ+ZqgQbc
         0SN7dX48e/pDNWJBmDQm+0LTxsjpvb4TGViQhmq1HBl0wCEKoCE3B3K/sF6puwKHSdvy
         bYh27JJ9SYnrQLxtWtNvAF9jTZfZNi3EXYynDPSS2If1Z5PzLPlNN9lCUgT/+ixbyZ8z
         y1z8YIDsFw7br/UH/M/ZHn+gwx5DUpaddCLjRubZSoPdfMEu4fJVbXnZBmX7CKb7l29B
         UOzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764142134; x=1764746934;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aoaY9KamTcBrQavEqKubcEeSlRDt0NYYbjCT7gWoTUo=;
        b=t746CvDAlRxO0jonYswB7kH7r2F7UKPQkDUQdhNytPmO4eNu3w3kIXFtj7qmrrtgX/
         OwMq4HYxb2rudm6KXgQ2nFtXh7DCl9Sea64VBHZyMYwcBclNXeLPGniPDmYFSNx5ZmHs
         y47jkvCryfxntAqtVeAPc8qCmrct3H5dlhSlX9xLvZwUCFpf6+Xavvi8N4NaGIyDdPhY
         uAf/NmCg0cNomNB1GuM4pskJhjzSYe1QAnv1SZuIm8LTKyn48htq+dY4pvyE6q9/yjhc
         bSfrnFGjR2bRnxnl2AAXVE/iKKMh56uuDo+PC278CWLvsFUy3pRqtTOmwa2XFgX8MhJY
         moBQ==
X-Gm-Message-State: AOJu0Yyi5vW5Rnckqlx3dDN7WlE9HChWFCzGeG8uZkI5Ku0DFfDqK3MN
	Gp2aiBN/s5f5gpV6MOnUQLDLrVbFiC2GI4TFDEjaGQut3WK8cXYxAzQCj4qJdQZZJjM1lKrwFTa
	umDnQI6GuadJaAOUCu9SF8X6LyyLDFVM=
X-Gm-Gg: ASbGncvJbVUmeDB8MEz57ULkSG/219AHkyp3ZCaIKr4XRkmh+KhSPf4zcXXZymJWY25
	BE9B1+tjO4mc2lksiHPyhpdKC2p0cYsBSwJ3bC60YMK0VGUTiTvKYKzF7x5bD/UX9lDzloOPEBA
	rUzn5z/GqF23orXMqNqawRMejrrx0z29sZCMhKBK5fGokNXAftVMMbAcxontbMJn7pCpXyMEKzo
	dyC6iqurlwTGoEWRYGM6xPV4glPkf5OOEDD5I9CGll+j1Y1PTN2cDn+q8wC2VTB3pCCp8rsV+P0
	csh0YhQ2kiLYRGr9SHH7bQfgvtbHXf17Ch/Qjv6ZyIXi8n3MdmOhgkxha/dWHSL5Dm9h53tJzuj
	VP6p8qDQHxgxsgk1WzhgrnHzB6vqKzTPnRS9FNLI1IvCrbg==
X-Google-Smtp-Source: AGHT+IEgzolCzgGIN62F5wc3aW4UCu+En5nhVxCFmp6pgPBX0WXZ5wt5zbVdtGK+ll81iIX2/rylIb7PDKKY4v0v278=
X-Received: by 2002:a53:a00c:0:b0:641:f5bc:68db with SMTP id
 956f58d0204a3-64302aee860mr9381451d50.72.1764142133981; Tue, 25 Nov 2025
 23:28:53 -0800 (PST)
MIME-Version: 1.0
References: <20251125225858.1361559-1-raj.khem@gmail.com> <CAMSfU+6kcE1uociWaV1s06rNw+a-1sRjL9q=DYGOq-t57Ms-VA@mail.gmail.com>
In-Reply-To: <CAMSfU+6kcE1uociWaV1s06rNw+a-1sRjL9q=DYGOq-t57Ms-VA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 25 Nov 2025 23:28:27 -0800
X-Gm-Features: AWmQ_bkzBEoIAdKjnWCYd2GlHMuY8AgTgDSBXQbqhuYYm5LLFdhM2f8a8YywYZY
Message-ID: <CAMKF1sqNG-XAAjx8U0kxdt1=oOPS1CDShM7ef50W6DM4Wg22vA@mail.gmail.com>
Subject: Re: [oe] [meta-filesystem][PATCH] e2tools: Fix buildpaths in ptests
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000003ab71c06447a59b8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Nov 2025 07:29:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122073

--0000000000003ab71c06447a59b8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 25, 2025 at 3:55=E2=80=AFPM Yoann Congal <yoann.congal@smile.fr=
> wrote:

> Le mar. 25 nov. 2025 =C3=A0 23:59, Khem Raj via lists.openembedded.org
> <raj.khem=3Dgmail.com@lists.openembedded.org> a =C3=A9crit :
>
>> Currently the path checks are escaping QA check for buildpath detection
>> but config.status
>> still has paths which show up in reproduciblity failures, comparing buil=
d
>> in path A and
>> build in path B, content of config.status don't end up same.
>
>
> FYI, last time we tried to fixed that, some of the lines in config.status
> looked like this:
> S["LDFLAGS"]=3D"-Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed
>  -ffile-prefix-map=3D/srv/pokybuild/yocto-worker/reproducible-meta-oe/bui=
ld/build/build-st-meta-filesyste"\
> "ms/build-st/reproducibleB-extended/tmp/work/x86-64-v3-poky-linux/e2tools=
/0.1.2/sources/e2tools-0.1.2=3D/usr/src/debug/e2tools/0.1.2
>  -ffile-prefix-map"\
> "=3D/work/x86-64-v3-poky-linu"\
> "x/e2tools/0.1.2/build=3D/usr/src/debug/e2tools/0.1.2
>  -ffile-prefix-map=3D/srv/pokybuild/yocto-worker/reproducible-meta-oe/bui=
ld/build/build-st-meta-fil"\
> "esystems/build-st/reproducibleB-extended/tmp/work/x86-64-v3-poky-linux/e=
2tools/0.1.2/recipe-sysroot=3D
>  -ffile-prefix-map=3D/srv/pokybuild/yocto-worker/"\
>
> "reproducible-meta-oe/build/build/build-st-meta-filesystems/build-st/repr=
oducibleB-extended/tmp/work/x86-64-v3-poky-linux/e2tools/0.1.2/recipe-sysro=
o"\
> "t-native=3D  -Wl,-z,relro,-z,now"
>
> =3D> The non-reproducible paths split across line breaks.
>
> This is autoconf trying to generate a portable AWK script (meaning the
> maximum line size for a literal is around 150). Since the "portable" here
> means supporting prehistoric UNIX version of awk we started working on
> modifying this limit in autoconf (_AC_AWK_LITERAL_LIMIT) to something mor=
e
> modern (1000). The goal was to avoid having non-reproducible paths split
> across line breaks to let sed work correctly but we never quite finished
> this patch.
>

Thanks for adding more context here. I guess we can fix OEs autoconf like
[1]
These variables are useless for running/building ptests on the target. So
omitting them here
gets us moving as well.

you can test the autoconf patch and see if it is helpful in making things
better in general we might be ok to maintain it in OE
upstream will not accept the raised limits

[1]
https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dkraj/i-t=
old-you&id=3Db7c107fc6f0142cf848393937f3d0ee09ea90228


>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  .../recipes-utils/e2tools/e2tools_0.1.2.bb       | 16 +++++++++++++++-
>>  1 file changed, 15 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta-filesystems/recipes-utils/e2tools/e2tools_0.1.2.bb
>> b/meta-filesystems/recipes-utils/e2tools/e2tools_0.1.2.bb
>> index 219735acd1..b7b925da0e 100644
>> --- a/meta-filesystems/recipes-utils/e2tools/e2tools_0.1.2.bb
>> +++ b/meta-filesystems/recipes-utils/e2tools/e2tools_0.1.2.bb
>> @@ -39,7 +39,21 @@ do_install_ptest() {
>>          ${D}${PTEST_PATH}/build/autom4te.cache \
>>          ${D}${PTEST_PATH}/*/*/.git ${D}${PTEST_PATH}/*/*/.github \
>>          ${D}${PTEST_PATH}/*/*/autom4te.cache
>> -    sed -i -e 's;${TMPDIR};;g' ${D}${PTEST_PATH}/build/config.status
>> +    sed -e 's@[^ ]*-ffile-prefix-map=3D[^ "]*@@g' \
>> +        -e 's@[^ ]*-fdebug-prefix-map=3D[^ "]*@@g' \
>> +        -e 's@[^ ]*-fmacro-prefix-map=3D[^ "]*@@g' \
>> +        -e 's@[^ ]*--sysroot=3D[^ "]*@@g' \
>> +        -e 's@[^ ]*--with-libtool-sysroot=3D[^ "]*@@g' \
>> +        -e 's@[^ ]*--with-install-prefix=3D[^ "]*@@g' \
>> +        -e '/EXT2FS_CFLAGS/d' \
>> +        -e '/LDFLAGS/d' \
>> +        -e '/PKG_CONFIG_PATH/d' \
>> +        -e '/PKG_CONFIG_LIBDIR/d' \
>> +        -e 's@${S}@${PTEST_PATH}@g' \
>> +        -e 's@${B}@${PTEST_PATH}/build@g' \
>> +        -e 's@${HOSTTOOLS_DIR}@@g' \
>> +        -e 's@${RECIPE_SYSROOT}@@g' \
>> +        -i ${D}${PTEST_PATH}/build/config.status
>>  }
>>
>>  RDEPENDS:${PN}-ptest +=3D "bash coreutils e2fsprogs e2tools gawk make p=
erl"
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#122065):
>> https://lists.openembedded.org/g/openembedded-devel/message/122065
>> Mute This Topic: https://lists.openembedded.org/mt/116477328/4316185
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
>> yoann.congal@smile.fr]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>
>
> --
> Yoann Congal
> Smile ECS
>

--0000000000003ab71c06447a59b8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 25, 2025=
 at 3:55=E2=80=AFPM Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.f=
r" target=3D"_blank">yoann.congal@smile.fr</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"=
>Le=C2=A0mar. 25 nov. 2025 =C3=A0=C2=A023:59, Khem Raj via <a href=3D"http:=
//lists.openembedded.org" target=3D"_blank">lists.openembedded.org</a> &lt;=
raj.khem=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" target=3D"_b=
lank">gmail.com@lists.openembedded.org</a>&gt; a =C3=A9crit=C2=A0:</div><di=
v class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">C=
urrently the path checks are escaping QA check for buildpath detection but =
config.status<br>
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
937f3d0ee09ea90228">https://git.openembedded.org/openembedded-core-contrib/=
commit/?h=3Dkraj/i-told-you&amp;id=3Db7c107fc6f0142cf848393937f3d0ee09ea902=
28</a></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div><br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">
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

--0000000000003ab71c06447a59b8--

