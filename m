Return-Path: <dimitris@siganos.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2DB4C3ABC9
	for <webhook@archiver.kernel.org>; Mon, 19 May 2025 00:59:59 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.41188.1747616396173247233
 for <Openembedded-devel@lists.openembedded.org>;
 Sun, 18 May 2025 17:59:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siganos-org.20230601.gappssmtp.com header.s=20230601 header.b=zUVj0b9k;
 spf=none, err=permanent DNS error (domain: siganos.org, ip: 209.85.216.47, mailfrom: dimitris@siganos.org)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-30ea8b7c5c2so1172342a91.3
        for <Openembedded-devel@lists.openembedded.org>; Sun, 18 May 2025 17:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=siganos-org.20230601.gappssmtp.com; s=20230601; t=1747616395; x=1748221195; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tbgXManak2pRuTe0y83H/dovGqVbG9Vbv6Yz35GvieE=;
        b=zUVj0b9kI26TKRyDHqEk5tzY7Kuh3PUIOqLk1/WJjV4x2dth/uL7lHADhX+WZfS2wX
         sIWW1kz1u02NijP4gRmTPQxdUsntdkFCqsdjFdpMvz8aNrSldyAGk2y0Hy8oVbzBtZoZ
         2vBhIkCFQc8+gV55FmehLRLe+D8wwouu/kXY5oLh3DGA2cGAocAzDRyUUg9DFGP0pJUJ
         TKZyiNoZ2YBlS27HzwYqFi4rOZAeUJ8Nrt0I8N5HamABeNgjS7mhSMoB1J5sVSgpDwML
         +9SfmCtfF+f7iYII+f3ZsqAtCNioPGA2WszEGs7DZpiI3DM1Ah/xU3JAAtar2Yivaxh5
         tWkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747616395; x=1748221195;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tbgXManak2pRuTe0y83H/dovGqVbG9Vbv6Yz35GvieE=;
        b=SYpikLDlF1KwEyhR+Ft9ZshHhuGrgEZeRq7lwndhI8SmvoIs7+e/tKUvLwBKnnD7IV
         /q8SR9/4XEADa0dAHiaRnBL+eE+FKjbpMClWTV81RW+8QqrtGVrgLcpbYULDBL+i4tim
         NXNxDlp54SEn/EwYBmwMIPQ8QzxH5jeLn25tlzMgAMEw7Yc2NXAgwRZCVQdsEiUg5APd
         ynaj0d4nPk4cMewkKrEmzI+pPX015aNZO+hIA1zIMBPC2YZpGXN0SUF7LoRYBjCNcBwX
         WLkTUEllgoX9OpjBvVY3goE36JI0yo17VaHEKBk+JVeZrJYkGgNpGn5yhwfCuDG/PfnF
         EAgA==
X-Gm-Message-State: AOJu0Yykn2x5kBQ2GlSLm2TvTQxbnFBLChnGdOnXXj+6QP2sl+XNeCR+
	8+DIUdhNuqw2RpXlVUtUdyHJxlMx0MwaMqmYTUakExW31PAHiyHevI4zueEc1usNBU1q6bt/tTa
	0EY85ZvjlK/clyXaqtv3DN0eHSuN25LWYg5Hwo4Rsqw==
X-Gm-Gg: ASbGncumxZSgMRuLxAte/TObaM23j5LPM3ESqEJowlBTAIK0A4pVFGsN4XTJt0eYhKr
	Ty4BTGEqW5N+iNFi0xvyBGMIUwqD7VliPV4aIAeQjhASJdcgY55zAQavceKSVWMVeN/9P7lBLr1
	s4OOix40Ow5pStSiamFaffNRsCdsMa0Z8=
X-Google-Smtp-Source: AGHT+IEPWE21VGvJD5GD7sUrDDwY61Pu4sr8ABVBqMEpOHfInQeOkVq5ZJMjzLnYT1Y1q0J4TsdOS018O5XxBrD8bW8=
X-Received: by 2002:a17:90b:3846:b0:2ff:6788:cc67 with SMTP id
 98e67ed59e1d1-30e7d5ceeb4mr14013865a91.34.1747616395241; Sun, 18 May 2025
 17:59:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250518192835.229015-1-dimitris@siganos.org> <20250518192835.229015-2-dimitris@siganos.org>
 <CAMSfU+5gCDDrw0ksTueG6DrQDqhWMMhwYZda1rRjev+J=tbqog@mail.gmail.com>
In-Reply-To: <CAMSfU+5gCDDrw0ksTueG6DrQDqhWMMhwYZda1rRjev+J=tbqog@mail.gmail.com>
From: Dimitrios Siganos <dimitris@siganos.org>
Date: Mon, 19 May 2025 01:59:44 +0100
X-Gm-Features: AX0GCFsHOXoiEBCnA-HHgTl1B8-hSxghvAm11me6Au0fMf2q69BobxZiqKpOifU
Message-ID: <CADGVJSJi8AxahjPcv=yO5n+Ocr-QO-e28N6ho4Fz_hKR1LWy=A@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] bvi: add new package
To: Yoann Congal <yoann.congal@smile.fr>
Cc: Openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000713f81063572a67f"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 May 2025 00:59:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117466

--000000000000713f81063572a67f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yoann,

Thank you for the feedback. Thank you for suggesting autotools-brokensep. I
did not know about that. I will use it in the next iteration.

The project uses pre-ANSI C function prototypes that seem to be
incompatible with C23. I plan to specify compilation with C17, which seems
to work.

I will try to get in touch with Gerhard Buergmann and see what the status
of the project is. The project started in 1996, approx 30 years ago, and he
still released a version 2 years ago and it is only 3 months since his last
post, so it is not clear to me if it is a completely unmaintained project.
I will try to find out.

Regards,
Dimitris

On Sun, 18 May 2025 at 21:36, Yoann Congal <yoann.congal@smile.fr> wrote:

> Hello,
>
> Le dim. 18 mai 2025 =C3=A0 21:29, Dimitrios Siganos via lists.openembedde=
d.org
> <dimitris=3Dsiganos.org@lists.openembedded.org> a =C3=A9crit :
>
>> bvi is a visual editor for binary files
>>
>> Signed-off-by: Dimitrios Siganos <dimitris@siganos.org>
>> ---
>>  meta-oe/recipes-support/bvi/bvi_1.4.2.bb | 21 +++++++++++++++++++++
>>  1 file changed, 21 insertions(+)
>>  create mode 100644 meta-oe/recipes-support/bvi/bvi_1.4.2.bb
>>
>> diff --git a/meta-oe/recipes-support/bvi/bvi_1.4.2.bb
>> b/meta-oe/recipes-support/bvi/bvi_1.4.2.bb
>> new file mode 100644
>> index 0000000000..e6da1efd41
>> --- /dev/null
>> +++ b/meta-oe/recipes-support/bvi/bvi_1.4.2.bb
>> @@ -0,0 +1,21 @@
>> +SUMMARY =3D "Binary VI editor"
>> +DESCRIPTION =3D "bvi is a visual editor for binary files."
>> +HOMEPAGE =3D "https://sourceforge.net/projects/bvi"
>> +SECTION =3D "console/utils"
>> +LICENSE =3D "GPL-3.0-only"
>> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da36207309d382da27cd66fdaae92=
2e3c"
>> +
>> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/bvi/bvi-${PV}.src.tar.gz"
>> +SRC_URI[sha256sum] =3D
>> "4bba16c2b496963a9b939336c0abcc8d488664492080ae43a86da18cf4ce94f2"
>> +
>> +DEPENDS +=3D "ncurses"
>> +
>> +inherit pkgconfig autotools
>> +
>> +# build inside the source tree, bvi does not support out of tree buildi=
ng
>> +B =3D "${S}"
>
>
> FYI, there is the autotools-brokensep class just for that.
>
> Also, that does not build on my system on master. Looks related to the
> gcc-15 incompatibilities mentioned here:
> https://sourceforge.net/p/bvi/bugs/16/
> My logs: https://pastebin.com/SH6uNHDi
>
> Finally, the last activity of the author was 2 years ago :
> https://sourceforge.net/p/bvi/activity/?page=3D0&limit=3D100#67ba1727be81=
08c555c9b214
> It does not look maintained anymore :( (gcc15 ticket was 3 months ago, no
> activity)
>
> Regards,
>
>
>> +
>> +EXTRA_OECONF +=3D "\
>> +    --build=3D${BUILD_SYS} \
>> +    --host=3D${TARGET_SYS} \
>> +"
>> --
>> 2.34.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#117462):
>> https://lists.openembedded.org/g/openembedded-devel/message/117462
>> Mute This Topic: https://lists.openembedded.org/mt/113180865/4316185
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

--000000000000713f81063572a67f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Yoann,</div><div><br></div><div>Thank you for the =
feedback. Thank you for suggesting autotools-brokensep. I did not know abou=
t that. I will use it in the next iteration.</div><div><br></div><div>The p=
roject uses pre-ANSI C function prototypes that seem to be incompatible wit=
h C23. I plan to specify compilation with C17, which seems to work.</div><b=
r><div>I will try to get in touch with Gerhard Buergmann and see what the s=
tatus of the project is. The project started in 1996, approx 30 years ago, =
and he still released a version 2 years ago and it is only 3 months since h=
is last post, so it is not clear to me if it is a completely unmaintained p=
roject. I will try to find out.</div><div><br></div><div>Regards,</div><div=
>Dimitris</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sun, 18 May 2025 at 21:36, Yoann Congal &lt;<a href=3D"m=
ailto:yoann.congal@smile.fr" target=3D"_blank">yoann.congal@smile.fr</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div di=
r=3D"ltr"><div dir=3D"ltr"><div>Hello,</div><br></div><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0dim. 18 mai 2025 =C3=A0=
=C2=A021:29, Dimitrios Siganos via <a href=3D"http://lists.openembedded.org=
" target=3D"_blank">lists.openembedded.org</a> &lt;dimitris=3D<a href=3D"ma=
ilto:siganos.org@lists.openembedded.org" target=3D"_blank">siganos.org@list=
s.openembedded.org</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">bvi is a visual editor for binary files<br=
>
<br>
Signed-off-by: Dimitrios Siganos &lt;<a href=3D"mailto:dimitris@siganos.org=
" target=3D"_blank">dimitris@siganos.org</a>&gt;<br>
---<br>
=C2=A0meta-oe/recipes-support/bvi/<a href=3D"http://bvi_1.4.2.bb" rel=3D"no=
referrer" target=3D"_blank">bvi_1.4.2.bb</a> | 21 +++++++++++++++++++++<br>
=C2=A01 file changed, 21 insertions(+)<br>
=C2=A0create mode 100644 meta-oe/recipes-support/bvi/<a href=3D"http://bvi_=
1.4.2.bb" rel=3D"noreferrer" target=3D"_blank">bvi_1.4.2.bb</a><br>
<br>
diff --git a/meta-oe/recipes-support/bvi/<a href=3D"http://bvi_1.4.2.bb" re=
l=3D"noreferrer" target=3D"_blank">bvi_1.4.2.bb</a> b/meta-oe/recipes-suppo=
rt/bvi/<a href=3D"http://bvi_1.4.2.bb" rel=3D"noreferrer" target=3D"_blank"=
>bvi_1.4.2.bb</a><br>
new file mode 100644<br>
index 0000000000..e6da1efd41<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-support/bvi/<a href=3D"http://bvi_1.4.2.bb" rel=3D"no=
referrer" target=3D"_blank">bvi_1.4.2.bb</a><br>
@@ -0,0 +1,21 @@<br>
+SUMMARY =3D &quot;Binary VI editor&quot;<br>
+DESCRIPTION =3D &quot;bvi is a visual editor for binary files.&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://sourceforge.net/projects/bvi" rel=3D=
"noreferrer" target=3D"_blank">https://sourceforge.net/projects/bvi</a>&quo=
t;<br>
+SECTION =3D &quot;console/utils&quot;<br>
+LICENSE =3D &quot;GPL-3.0-only&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Da36207309d382da27cd66fdaae=
922e3c&quot;<br>
+<br>
+SRC_URI =3D &quot;${SOURCEFORGE_MIRROR}/bvi/bvi-${PV}.src.tar.gz&quot;<br>
+SRC_URI[sha256sum] =3D &quot;4bba16c2b496963a9b939336c0abcc8d488664492080a=
e43a86da18cf4ce94f2&quot;<br>
+<br>
+DEPENDS +=3D &quot;ncurses&quot;<br>
+<br>
+inherit pkgconfig autotools<br>
+<br>
+# build inside the source tree, bvi does not support out of tree building<=
br>
+B =3D &quot;${S}&quot;</blockquote><div><br></div><div>FYI, there is the a=
utotools-brokensep class just for that.</div><div><br></div><div>Also, that=
 does not build on my system on master. Looks related to the gcc-15 incompa=
tibilities mentioned here: <a href=3D"https://sourceforge.net/p/bvi/bugs/16=
/" target=3D"_blank">https://sourceforge.net/p/bvi/bugs/16/</a></div><div>M=
y logs: <a href=3D"https://pastebin.com/SH6uNHDi" target=3D"_blank">https:/=
/pastebin.com/SH6uNHDi</a></div><div><br></div><div>Finally, the last activ=
ity of the author was 2 years ago : <a href=3D"https://sourceforge.net/p/bv=
i/activity/?page=3D0&amp;limit=3D100#67ba1727be8108c555c9b214" target=3D"_b=
lank">https://sourceforge.net/p/bvi/activity/?page=3D0&amp;limit=3D100#67ba=
1727be8108c555c9b214</a></div><div>It does not look maintained anymore :( (=
gcc15 ticket was 3 months ago, no activity)</div><div><br></div><div>Regard=
s,</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+<br>
+EXTRA_OECONF +=3D &quot;\<br>
+=C2=A0 =C2=A0 --build=3D${BUILD_SYS} \<br>
+=C2=A0 =C2=A0 --host=3D${TARGET_SYS} \<br>
+&quot;<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#117462): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/117462" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/117462</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/113180865/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/113180865/4316185</a><br>
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
</blockquote></div>

--000000000000713f81063572a67f--

