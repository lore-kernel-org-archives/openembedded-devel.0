Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9E61C433F5
	for <webhook@archiver.kernel.org>; Mon, 16 May 2022 17:59:09 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com
 [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web10.851.1652723945809683967
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 May 2022 10:59:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YjeeSHHG;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id kl21so12684557qvb.9
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 May 2022 10:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ogBAI3ahQZt8cQO4HOiti7luBnz90xGbpQ3xPly4/XE=;
        b=YjeeSHHG6eJmJXFcP6t79L7HG/d2+Qx4Co8wjJFWY+uQ5s35PeJQacaKL32zglHb5r
         RhsotP1YPqbSbNrW5hl/Rk7Ri02Xvzxqcv6iojmlFQloHAGNxqhksvUSFpnpEsrAvNzR
         /FvGbQCd5aeRogxhMt7L19lLNWjATG3WxJgnUPeDYoZRGuFoxu9r6zhAi46uLj191V/a
         dL9aVYZCu0WOIVBpadJrZ2uh3CBErQtsgduWlDr4sjSJNB9Lfu6eyScjftff9dMsaObD
         sENpoQIKdoR12hr4XXdzLiJqm3l8hWd9a7hqBpNyC/AQCWN+aMocvK8uTX2c8gNwo56D
         X7Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ogBAI3ahQZt8cQO4HOiti7luBnz90xGbpQ3xPly4/XE=;
        b=I4+HbaE4Gi10eMDRLeGzCdiKDe+qUCz2/EEc4/53C46deVRv4nJ3PIqc3qLWwClQbM
         pjdMtixsmGYhK/3LqhMOC+HKinNzd+c3uOCoxt2JG0bq/uKfCv7YdQ4w4mQoflFq8m/T
         GpTde2qiN4ZvwfQnQE91dAHAjrlUqYl2rPYGDuiOn+eHjG2eJS8G7Sw8cGJ5+coNpzka
         EtppGewLMYDCipNV4HL6keLm2BcKB37LrEtj8Kdq9VIhUWpvPWFCLFOVdWvECvp51+CV
         Vc4MmVM/r1JGz07DDyYxg6sDfBAOgm5xW1nu0M31LDVEFhGkXJN1ivd3r8Gp2cC6LsAi
         jHZQ==
X-Gm-Message-State: AOAM532tux611+/HBJf27k64jh0u9vqunInlH6x1M9/Lcif/YKx0UKY6
	OHx89xNvVGHgCIlWKK2G5GA4G7c5t3H2orbFOCw=
X-Google-Smtp-Source: 
 ABdhPJz3l+vXok6gtPiUROb3Q76h+ATB850HNB54djJzJ0miVZYQEghVaZY3z4fdODk4ViAi1XzwzjHh2qe9lejxj1Q=
X-Received: by 2002:a05:6214:21aa:b0:461:b0d9:b265 with SMTP id
 t10-20020a05621421aa00b00461b0d9b265mr13352148qvc.110.1652723944789; Mon, 16
 May 2022 10:59:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220510092824.2033312-1-nicolas.dechesne@linaro.org>
 <796b97a3-27d8-7c87-19fb-0ad96540028b@pr.hu>
 <a9997892-f4e1-cfcd-1a68-df3312d9a1d7@gmail.com>
 <CAP71WjxRyDy4kOVydX7rfLxrw63jKOp+DEg1KF+VegrogOCX=g@mail.gmail.com>
In-Reply-To: 
 <CAP71WjxRyDy4kOVydX7rfLxrw63jKOp+DEg1KF+VegrogOCX=g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 16 May 2022 10:58:54 -0700
Message-ID: 
 <CAMKF1sqD3n-Wf4WiBjbRBaF65Tc7v_yox6s06Fi7mXRAHchwCg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] imlib2: update SRC_URI
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: openembedded-devel@lists.openembedded.org, zboszor@pr.hu
Content-Type: multipart/alternative; boundary="000000000000a41b2705df24c7bd"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 May 2022 17:59:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97141

--000000000000a41b2705df24c7bd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 16, 2022 at 10:45 AM Nicolas Dechesne <
nicolas.dechesne@linaro.org> wrote:

>
>
> On Mon, May 16, 2022 at 6:09 PM Khem Raj <raj.khem@gmail.com> wrote:
>
>>
>>
>> On 5/16/22 8:28 AM, Zoltan Boszormenyi via lists.openembedded.org wrote:
>> > 2022. 05. 10. 11:28 keltez=C3=A9ssel, Nicolas Dechesne =C3=ADrta:
>> >> The upstream repo location has changed, it's now
>> >> https://git.enlightenment.org/old/legacy-imlib2
>> >
>> > This hits every branch in meta-openembedded, not only master.
>> >
>>
>> A different patch fixing same thing is already in master.
>>
>
> This is the merged patch, e.g.
> 62becef1091d (imlib2: update SRC_URI)
>
> Not sure what you meant.
>


I had the thread broken I should have said this patch is upstream in master
already if needed send backport request for respective release branches

> And yes, it's needed in all branches. Do you want/need a patch for this,
> or can you backport/apply directly?
>
>>
>> >>
>> >> It's not clear when or why it happened, but the the commit hash we us=
e
>> >> in SRCREV exists in the 'new' location, so let's at least update the
>> >> SRC_URI for now, and fix this warning:
>> >>
>> >> WARNING: imlib2-1.7.1-r0 do_fetch: Failed to fetch URL
>> >> git://
>> git.enlightenment.org/legacy/imlib2.git;protocol=3Dhttps;branch=3Dmaster=
,
>> >> attempting MIRRORS if available
>> >>
>> >> Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
>> >> ---
>> >>   meta-oe/recipes-graphics/imlib2/imlib2_git.bb | 2 +-
>> >>   1 file changed, 1 insertion(+), 1 deletion(-)
>> >>
>> >> diff --git a/meta-oe/recipes-graphics/imlib2/imlib2_git.bb
>> >> b/meta-oe/recipes-graphics/imlib2/imlib2_git.bb
>> >> index 56d41cd39..869f8123d 100644
>> >> --- a/meta-oe/recipes-graphics/imlib2/imlib2_git.bb
>> >> +++ b/meta-oe/recipes-graphics/imlib2/imlib2_git.bb
>> >> @@ -14,7 +14,7 @@ inherit autotools pkgconfig lib_package
>> >>   AUTO_LIBNAME_PKGS =3D ""
>> >> -SRC_URI =3D
>> >> "git://
>> git.enlightenment.org/legacy/${BPN}.git;protocol=3Dhttps;branch=3Dmaster
>> <http://git.enlightenment.org/legacy/$%7BBPN%7D.git;protocol=3Dhttps;bra=
nch=3Dmaster>"
>>
>> >>
>> >> +SRC_URI =3D
>> >> "git://
>> git.enlightenment.org/old/legacy-${BPN}.git;protocol=3Dhttps;branch=3Dma=
ster
>> <http://git.enlightenment.org/old/legacy-$%7BBPN%7D.git;protocol=3Dhttps=
;branch=3Dmaster>"
>>
>> >>
>> >>   S =3D "${WORKDIR}/git"
>> >>   PACKAGECONFIG ??=3D "jpeg png zlib
>> >> ${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
>> >>
>> >>
>> >>
>> >>
>> >>
>> >
>> >
>> >
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> > Links: You receive all messages sent to this group.
>> > View/Reply Online (#97134):
>> https://lists.openembedded.org/g/openembedded-devel/message/97134
>> > Mute This Topic: https://lists.openembedded.org/mt/91008939/1997914
>> > Group Owner: openembedded-devel+owner@lists.openembedded.org
>> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub
>> [raj.khem@gmail.com]
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >
>>
>

--000000000000a41b2705df24c7bd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, May 16, 2022 at 10:45 AM Nicolas Dechesne &lt;<a hr=
ef=3D"mailto:nicolas.dechesne@linaro.org">nicolas.dechesne@linaro.org</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div dir=
=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Mon, May 16, 2022 at 6:09 PM Khem Raj &lt;<a href=3D"mailto=
:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
On 5/16/22 8:28 AM, Zoltan Boszormenyi via <a href=3D"http://lists.openembe=
dded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> w=
rote:<br>
&gt; 2022. 05. 10. 11:28 keltez=C3=A9ssel, Nicolas Dechesne =C3=ADrta:<br>
&gt;&gt; The upstream repo location has changed, it&#39;s now<br>
&gt;&gt; <a href=3D"https://git.enlightenment.org/old/legacy-imlib2" rel=3D=
"noreferrer" target=3D"_blank">https://git.enlightenment.org/old/legacy-iml=
ib2</a><br>
&gt; <br>
&gt; This hits every branch in meta-openembedded, not only master.<br>
&gt; <br>
<br>
A different patch fixing same thing is already in master.<br></blockquote><=
div><br></div><div class=3D"gmail_quote">This is the merged patch, e.g.=C2=
=A0</div>62becef1091d (imlib2: update SRC_URI)<br><div>=C2=A0</div><div>Not=
 sure what you meant. </div></div></div></blockquote><div dir=3D"auto"><br>=
</div><div dir=3D"auto"><br></div><div dir=3D"auto">I had the thread broken=
 I should have said this patch is upstream in master already if needed send=
 backport request for respective release branches=C2=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"au=
to">And yes, it&#39;s needed in all branches. Do you want/need a patch for=
=C2=A0this, or can you backport/apply directly?</div></div></div><div dir=
=3D"ltr"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
&gt;&gt;<br>
&gt;&gt; It&#39;s not clear when or why it happened, but the the commit has=
h we use<br>
&gt;&gt; in SRCREV exists in the &#39;new&#39; location, so let&#39;s at le=
ast update the<br>
&gt;&gt; SRC_URI for now, and fix this warning:<br>
&gt;&gt;<br>
&gt;&gt; WARNING: imlib2-1.7.1-r0 do_fetch: Failed to fetch URL <br>
&gt;&gt; git://<a href=3D"http://git.enlightenment.org/legacy/imlib2.git;pr=
otocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" target=3D"_blank">git.en=
lightenment.org/legacy/imlib2.git;protocol=3Dhttps;branch=3Dmaster</a>, <br=
>
&gt;&gt; attempting MIRRORS if available<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Nicolas Dechesne &lt;<a href=3D"mailto:nicolas.dech=
esne@linaro.org" target=3D"_blank">nicolas.dechesne@linaro.org</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt; =C2=A0 meta-oe/recipes-graphics/imlib2/<a href=3D"http://imlib2_gi=
t.bb" rel=3D"noreferrer" target=3D"_blank">imlib2_git.bb</a> | 2 +-<br>
&gt;&gt; =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta-oe/recipes-graphics/imlib2/<a href=3D"http://iml=
ib2_git.bb" rel=3D"noreferrer" target=3D"_blank">imlib2_git.bb</a> <br>
&gt;&gt; b/meta-oe/recipes-graphics/imlib2/<a href=3D"http://imlib2_git.bb"=
 rel=3D"noreferrer" target=3D"_blank">imlib2_git.bb</a><br>
&gt;&gt; index 56d41cd39..869f8123d 100644<br>
&gt;&gt; --- a/meta-oe/recipes-graphics/imlib2/<a href=3D"http://imlib2_git=
.bb" rel=3D"noreferrer" target=3D"_blank">imlib2_git.bb</a><br>
&gt;&gt; +++ b/meta-oe/recipes-graphics/imlib2/<a href=3D"http://imlib2_git=
.bb" rel=3D"noreferrer" target=3D"_blank">imlib2_git.bb</a><br>
&gt;&gt; @@ -14,7 +14,7 @@ inherit autotools pkgconfig lib_package<br>
&gt;&gt; =C2=A0 AUTO_LIBNAME_PKGS =3D &quot;&quot;<br>
&gt;&gt; -SRC_URI =3D <br>
&gt;&gt; &quot;git://<a href=3D"http://git.enlightenment.org/legacy/$%7BBPN=
%7D.git;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" target=3D"_bla=
nk">git.enlightenment.org/legacy/${BPN}.git;protocol=3Dhttps;branch=3Dmaste=
r</a>&quot; <br>
&gt;&gt;<br>
&gt;&gt; +SRC_URI =3D <br>
&gt;&gt; &quot;git://<a href=3D"http://git.enlightenment.org/old/legacy-$%7=
BBPN%7D.git;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" target=3D"=
_blank">git.enlightenment.org/old/legacy-${BPN}.git;protocol=3Dhttps;branch=
=3Dmaster</a>&quot; <br>
&gt;&gt;<br>
&gt;&gt; =C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;&gt; =C2=A0 PACKAGECONFIG ??=3D &quot;jpeg png zlib <br>
&gt;&gt; ${@bb.utils.filter(&#39;DISTRO_FEATURES&#39;, &#39;x11&#39;, d)}&q=
uot;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#97134): <a href=3D"https://lists.openembedded.org/=
g/openembedded-devel/message/97134" rel=3D"noreferrer" target=3D"_blank">ht=
tps://lists.openembedded.org/g/openembedded-devel/message/97134</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/91008939=
/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/91008939/1997914</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openem=
bedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.o=
rg</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com"=
 target=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
</blockquote></div></div>
</blockquote></div></div>

--000000000000a41b2705df24c7bd--

