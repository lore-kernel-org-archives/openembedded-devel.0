Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1E36FD461B
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 04:32:37 +0000 (UTC)
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.63949.1772080350182126152
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Feb 2026 20:32:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OgrxCC32;
 spf=pass (domain: gmail.com, ip: 74.125.224.41, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-64c9a398bc7so332157d50.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 20:32:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772080349; cv=none;
        d=google.com; s=arc-20240605;
        b=bfzAIkviDuK8MXqob8dSyGMP3aXktsBzMoxMHSLrTwAT4XLezQZpPkvNpeZ8dnd2v+
         5wI+8+RVkR9YJMUdBqF5I2+vfVAkDXkCrGob7jIgDrSC671JpdjtCkeUeFHZMVlxUCii
         eWuXAC14pMQLSdzqYK/fRu846qtuw7RX6MnS2i+K7alMB+WwtwWK8ED/UrwnvOnXt/cK
         T4BKvEaYnqm+pFFbnVvv+vgvxzmRR274jHcga4txNOqW4o4AVjSMt6g5T03EBjVfG9HT
         Ypa6e57d2W0grcPCU5vAcsSo2DS9KGjXcQHHTt05uJ2/ZDcgdC5X9zZQHxMe2FRAJA7p
         udOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=tM4VRajNN2nef4069Llw8dzA61cNjKK2IozmCzO4zd4=;
        fh=xc7Pw1C2r64/D3IAczFTr6Vs+3vKL6I7LfJKgO2Lfwc=;
        b=caEbTa2rHZUglht6I8dTzmyVlMCTB1jkyAVbpQX3weJXgKohOvhdSUO5s5OZrhZFCr
         dqMi9TcqttA7Kq0s/QepHvCluV3152GvgEJVHygMDLeGWt5zf6Umcs1Cj8aBD/hJlf1l
         dCYGKb4LIffD8QkpqWUrWFMz46rcbE0Lb6NKxAOEd5dZfzydp4I9ZdFOrL4DRJYThOBP
         QncYLtzK4mSnVFk0NSr9Aqg8DpvhA9E2LLqEBgjszQwuvzie4ustsPo2SJlJGtjfjMFC
         8sK4gpDfEkwrC5d5hECkF7Qmk4g0oQB4KTo5IkCfyvT/w9NO7cwkF8TlV2hE1cWmu7aH
         hUWQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772080349; x=1772685149; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tM4VRajNN2nef4069Llw8dzA61cNjKK2IozmCzO4zd4=;
        b=OgrxCC32itjljH9w284ohbL5ZwnHftF3tU055u91Jnfi5g3Tmb988yp5CTUHKf6esY
         +c6jERbjIzm6DTQbPz9hn4hWEJv0QLwOvOvug1fyNblovfKVDz29mgf9n8vOQJ8CFEjU
         9AjgjzEADCkRNlVFSq32Hpss0P089Nm1rHSMKKfnbHedTmib9yDT/Ya8grzenZDbEH0V
         gAvtAtIUOx4dIYQqfA4ptXXwxVuXO3+oGyBAgzkjK4rKY503cV0tNTjonVqw9/G1Q6J7
         EVJXZc4wAlmViuX7mTGLTnbm3NPOCc+eozOb8HVZqIrbp5c70EFamtIYrnCvkQs4mcL+
         /2TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772080349; x=1772685149;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tM4VRajNN2nef4069Llw8dzA61cNjKK2IozmCzO4zd4=;
        b=kTJ8l0lgmSc0aQTHwYgqdveu40HG2CgjFdpwkP0GqNjiUkNhJwxb9G1scXCLuti5r/
         FiRbpBzKdSArCMtfiLtxG0muFRDIMP1F+kBPcRtHF6lOW8YeeZX8TT3qp5lw+S6UiLH8
         XeZEq+WCiaFAGYThyiFaU2ecLoobufIwBx2TcEbmRARZRM8XUDkIhBwjNB0iq0dq9nEA
         9JDshGIUeyX5rrUxceNk37VohDfXjbv2CjR/FrRjeqsSXtoT4DK0GNkRB6mrUbPx3b/N
         R5XjnXXNI9GxRSsicVktiDIPSEBM5TryqVolC7u31FoEuhgT07qcmX/2Si9fpBMIq9tT
         0rOw==
X-Gm-Message-State: AOJu0YxGpV+RNgRTK7zExBPfXaV+ZYvZbL2q/O53yfy+b4wm+UULolH3
	916WZejUg2QBBal8n1aWqp+zVbyMR9NDnZcCFE5SQDUupeQzP1C0DXVea3yNBHQFNt1pIg7taON
	OgVMbpV40wMsCIk9JzmGI7KGmpMkuLz672zxvpH57WA==
X-Gm-Gg: ATEYQzzeZR4m6hSHZIW+YJPjaTNckQ243+0KOZaC96gIpjAElsFpYk53LuT3lAd2avo
	RyDreCjW/QQSxYFFKTK66HtdTsBXm9bSAwdsnPPUpExxoHhC/qC+1bcqBrhpyg6LJBkHwAmsmOe
	St1REijvcp1Qpi/DXsHfnHtaByxiNw07rzI2j/pFTweRmOjArjeloAAlsYj8wtmUAfpVGheY6g0
	tYBo5sIyj5GenaJ/OvK+26xQexQehEVOAoQeMPcQyAmkTedLsQOImHAWFWFU2Ano54OjPTB7kR9
	ijou6xldmBvArU0Dwr8lMndH+P6D7rlu8BwrfHE7arTL0n6H+WudlgUF+LtNRsfPP+08oy0tlqK
	RFke4DcUBoMh3RK3FYIylOFE=
X-Received: by 2002:a05:690e:d0a:b0:64c:975b:eca9 with SMTP id
 956f58d0204a3-64c975becf7mr8674706d50.64.1772080349124; Wed, 25 Feb 2026
 20:32:29 -0800 (PST)
MIME-Version: 1.0
References: <20260225093727.1284-1-wangmy@fujitsu.com> <20260225093727.1284-19-wangmy@fujitsu.com>
In-Reply-To: <20260225093727.1284-19-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 25 Feb 2026 20:32:02 -0800
X-Gm-Features: AaiRm50tSnaimhDRc8k9caDtMzdCiSA1C71vH5iypZNUQIewqqqvrDDPOgZXNrk
Message-ID: <CAMKF1srCSTZacfw3pWE9W_C+7QaJudncFXTNW8W2Lri2+6ncYw@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH 19/33] libyang: upgrade 3.13.6 -> 4.2.2
To: wangmy@fujitsu.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000b91db8064bb29baf"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Feb 2026 04:32:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124663

--000000000000b91db8064bb29baf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

this breaks frr. Seems frr is still needing v2 APIs but with this version
it has either changed or removed these APIs. Please take a look

| lib/northbound.c: In function 'nb_config_diff':
| lib/northbound.c:641:36: error: 'LYD_PRINT_WITHSIBLINGS' undeclared
(first use in this function); did you mean 'LYD_PRINT_SIBLINGS'?
|   641 |                                    LYD_PRINT_WITHSIBLINGS |
LYD_PRINT_WD_ALL)) {
|       |                                    ^~~~~~~~~~~~~~~~~~~~~~
|       |                                    LYD_PRINT_SIBLINGS
| lib/northbound.c:641:36: note: each undeclared identifier is reported
only once for each function it appears in
| lib/northbound.c: In function 'nb_cb_operation_is_valid':
| lib/northbound.c:2302:29: error: invalid operands to binary || (have
'int' and 'struct lysc_value')
|  2302 |                             || sleaf->dflt)
|       |                             ^~ ~~~~~~~~~~~
|       |                                     |
|       |                                     struct lysc_value



On Wed, Feb 25, 2026 at 1:38=E2=80=AFAM wangmy via lists.openembedded.org <=
wangmy=3D
fujitsu.com@lists.openembedded.org> wrote:

> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Changelog:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> - new SO version 4
>   all the important changes mentioned in the transition manual
> - major LYB binary format optimizations
> - user-ordered lists diff fixes
> - validation optimizations
> - lots of other bugfixes and improvements
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../libyang/{libyang_3.13.6.bb =3D> libyang_4.2.2.bb}             | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-oe/recipes-extended/libyang/{libyang_3.13.6.bb =3D>
> libyang_4.2.2.bb} (96%)
>
> diff --git a/meta-oe/recipes-extended/libyang/libyang_3.13.6.bb
> b/meta-oe/recipes-extended/libyang/libyang_4.2.2.bb
> similarity index 96%
> rename from meta-oe/recipes-extended/libyang/libyang_3.13.6.bb
> rename to meta-oe/recipes-extended/libyang/libyang_4.2.2.bb
> index 822c30ba24..4b2ceaaa17 100644
> --- a/meta-oe/recipes-extended/libyang/libyang_3.13.6.bb
> +++ b/meta-oe/recipes-extended/libyang/libyang_4.2.2.bb
> @@ -6,7 +6,7 @@ LICENSE =3D "BSD-3-Clause"
>
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Db69fd3b2815bbf1cef5c97f0eee25=
19a"
>
> -SRCREV =3D "c2ddd01b9b810a30d6a7d6749a3bc9adeb7b01fb"
> +SRCREV =3D "3d07c3a71534a580c3960907da17568eff7e5c64"
>
>  SRC_URI =3D "git://
> github.com/CESNET/libyang.git;branch=3Dmaster;protocol=3Dhttps;tag=3Dv${P=
V}
> <http://github.com/CESNET/libyang.git;branch=3Dmaster;protocol=3Dhttps;ta=
g=3Dv$%7BPV%7D>
> \
>             file://0001-test_context-skip-test-case-test_searchdirs.patch=
 \
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#124631):
> https://lists.openembedded.org/g/openembedded-devel/message/124631
> Mute This Topic: https://lists.openembedded.org/mt/117991961/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000b91db8064bb29baf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">this breaks frr. Seems frr is still needing v2 APIs but wi=
th this version it has either changed or removed these APIs. Please take a =
look<div><br></div><div>| lib/northbound.c: In function &#39;nb_config_diff=
&#39;:<br>| lib/northbound.c:641:36: error: &#39;LYD_PRINT_WITHSIBLINGS&#39=
; undeclared (first use in this function); did you mean &#39;LYD_PRINT_SIBL=
INGS&#39;?<br>| =C2=A0 641 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0LYD_PRINT_WITHSIBLINGS | LYD_PRINT_WD_ALL)) {<br>| =C2=A0 =C2=A0 =C2=
=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~~~~~~~~~~~~=
~~~<br>| =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0LYD_PRINT_SIBLINGS<br>| lib/northbound.c:641:36: note: each undec=
lared identifier is reported only once for each function it appears in<br>|=
 lib/northbound.c: In function &#39;nb_cb_operation_is_valid&#39;:<br>| lib=
/northbound.c:2302:29: error: invalid operands to binary || (have &#39;int&=
#39; and &#39;struct lysc_value&#39;)<br>| =C2=A02302 | =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 || sleaf-&gt;dflt)<br>| =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ^~ ~~~~~~~~~~~<br>| =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |<br>| =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct lysc_value</div><div><br></div><div>=
<br></div></div><br><div class=3D"gmail_quote gmail_quote_container"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Wed, Feb 25, 2026 at 1:38=E2=80=AFAM wan=
gmy via <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a=
> &lt;wangmy=3D<a href=3D"mailto:fujitsu.com@lists.openembedded.org">fujits=
u.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">From: Wang Mingyu &lt;<a href=3D"mailto:wangmy@=
fujitsu.com" target=3D"_blank">wangmy@fujitsu.com</a>&gt;<br>
<br>
Changelog:<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
- new SO version 4<br>
=C2=A0 all the important changes mentioned in the transition manual<br>
- major LYB binary format optimizations<br>
- user-ordered lists diff fixes<br>
- validation optimizations<br>
- lots of other bugfixes and improvements<br>
<br>
Signed-off-by: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.com" target=
=3D"_blank">wangmy@fujitsu.com</a>&gt;<br>
---<br>
=C2=A0.../libyang/{<a href=3D"http://libyang_3.13.6.bb" rel=3D"noreferrer" =
target=3D"_blank">libyang_3.13.6.bb</a> =3D&gt; <a href=3D"http://libyang_4=
.2.2.bb" rel=3D"noreferrer" target=3D"_blank">libyang_4.2.2.bb</a>}=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
=C2=A0rename meta-oe/recipes-extended/libyang/{<a href=3D"http://libyang_3.=
13.6.bb" rel=3D"noreferrer" target=3D"_blank">libyang_3.13.6.bb</a> =3D&gt;=
 <a href=3D"http://libyang_4.2.2.bb" rel=3D"noreferrer" target=3D"_blank">l=
ibyang_4.2.2.bb</a>} (96%)<br>
<br>
diff --git a/meta-oe/recipes-extended/libyang/<a href=3D"http://libyang_3.1=
3.6.bb" rel=3D"noreferrer" target=3D"_blank">libyang_3.13.6.bb</a> b/meta-o=
e/recipes-extended/libyang/<a href=3D"http://libyang_4.2.2.bb" rel=3D"noref=
errer" target=3D"_blank">libyang_4.2.2.bb</a><br>
similarity index 96%<br>
rename from meta-oe/recipes-extended/libyang/<a href=3D"http://libyang_3.13=
.6.bb" rel=3D"noreferrer" target=3D"_blank">libyang_3.13.6.bb</a><br>
rename to meta-oe/recipes-extended/libyang/<a href=3D"http://libyang_4.2.2.=
bb" rel=3D"noreferrer" target=3D"_blank">libyang_4.2.2.bb</a><br>
index 822c30ba24..4b2ceaaa17 100644<br>
--- a/meta-oe/recipes-extended/libyang/<a href=3D"http://libyang_3.13.6.bb"=
 rel=3D"noreferrer" target=3D"_blank">libyang_3.13.6.bb</a><br>
+++ b/meta-oe/recipes-extended/libyang/<a href=3D"http://libyang_4.2.2.bb" =
rel=3D"noreferrer" target=3D"_blank">libyang_4.2.2.bb</a><br>
@@ -6,7 +6,7 @@ LICENSE =3D &quot;BSD-3-Clause&quot;<br>
<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Db69fd3b2815bbf1cef5c9=
7f0eee2519a&quot;<br>
<br>
-SRCREV =3D &quot;c2ddd01b9b810a30d6a7d6749a3bc9adeb7b01fb&quot;<br>
+SRCREV =3D &quot;3d07c3a71534a580c3960907da17568eff7e5c64&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/CESNET/libyang.g=
it;branch=3Dmaster;protocol=3Dhttps;tag=3Dv$%7BPV%7D" rel=3D"noreferrer" ta=
rget=3D"_blank">github.com/CESNET/libyang.git;branch=3Dmaster;protocol=3Dht=
tps;tag=3Dv${PV}</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-test_context-skip-tes=
t-case-test_searchdirs.patch \<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#124631): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/124631" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/124631</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117991961/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/117991961/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000b91db8064bb29baf--

