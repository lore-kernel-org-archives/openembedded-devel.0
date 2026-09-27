Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA36EC98338
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 19:52:30 +0000 (UTC)
Received: from mail-yx2-f22.google.com (mail-yx2-f22.google.com [74.125.224.150])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43713.1790538745065804050
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Sep 2026 12:52:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=q/72LBmv;
 spf=pass (domain: gmail.com, ip: 74.125.224.150, mailfrom: raj.khem@gmail.com)
Received: by mail-yx2-f22.google.com with SMTP id 956f58d0204a3-673ba589d0dso2003308d50.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 12:52:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790538744; cv=none;
        d=google.com; s=arc-20260327;
        b=DTSz2aHSlfdVGLdIxsN+MwX9wpTsbZlPR8IayXnbtTxJytgYMIW+jlra9VqJCTs0rC
         166E7zT+pLneAM7my/upgYfocoql5GaZktq5ekALvoDof5rLP0DVSGeJ/zeqSU/I9q+Q
         iiAUoNierLQetEAnBXdDX4+kdiOFF+L7QYMdhv5QeLIzNQiImaBENB1d77fMtaE5VIjn
         oTkYJbxz35qGp+XnE9bRI3URI9NIzGz9lNzOkCoO/i0sNn15H+m4oGMhBzI535MixLTR
         OLr53rAVGRdN4AOSTaUASCVrlCRpms2GmiDS4UewJ6s+s3Cgb4vr9sw7SlCTN3t7XWoW
         tQqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ElsFrfHlBP+met2HkPKqhFlaRLYFgmSLNvI+9hg1aVc=;
        fh=n0ZnAkKOhGDmrf8RLpwnC7FQ6xmEY5rofL6wXnjsXjs=;
        b=KsiC3Mjb4+n3TmgJkHaO5z3h8uZ0P/6h69h0uXSKCmoY8VijVjY8hPY5FYUnMXgj6/
         7POjRsyrnWoPg6JXxBhuBscfE7IS8OaqyrfIJU4sc7v2xeSrFNHOjQEdvcpQZgqd7ZY6
         2y4qYVAzhLTDRrXa94AwMQTuljQSUnmmgX1ixtlk7ETntMBsrOtzO4F91OnSQWgseNDt
         vl4ToXG9c3LH/OreG8I2k5zZlVa/xMpvbIPd0uzCtOMGNMj5kLVz2ej0uHS3CvUdWhCK
         Bz0g3sDhPu4ddrhiIcbb9l6dZxNKIwl2TAz8FoR8dDKbgz4EKcf6VlFiaMyl04oNhFpx
         UmmQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790538744; x=1791143544; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ElsFrfHlBP+met2HkPKqhFlaRLYFgmSLNvI+9hg1aVc=;
        b=q/72LBmvhKYhpzbUJ4wyAxEeBzSOjiovQN/gWZnp9GNNB2OBhPSlHAYjPBDi3mHSv4
         2YYOUGDuUm88XZQkK/VU7mvotJjsW3RJqvbYnJjlP6YBkqreNqc8r9YUOX0eBjGFNtyw
         JBryfg4lKCO6yhvT36PAL8U84PtA+ZXOOT0/fOtKXNMMXXLA7ql18omWm7klNQWhF7kb
         zVWFKqMsIMWXXgV3GCOqfCmB4xHyKF8WxdInZencF3wMjlEaW7hChD8tma2DDYncsucD
         W4Fklu473dBRfbjkof5tGAhdwqEG0UOG0fstemash6TRnFX6daxFVihGP996ZVowDnOG
         JZOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790538744; x=1791143544;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ElsFrfHlBP+met2HkPKqhFlaRLYFgmSLNvI+9hg1aVc=;
        b=V+CMLOuqfzKvle5jIhasWgxIf00SPWrEnEvAn/kgpQoDwes//1/dOs7qWpmPq2Q55J
         bHFy9rplQpVe9B+7uBgHAt9oKxRNLv+Rtw9A8kQ+eDxForh1ZDd+/wwBYDn9ZNQQ0t1K
         RaqIJvTMUYsPuGuw0C4Fjv+wBc8H0iJceW+2MNoKvgvFx2REpW3I2bZij1h80NMFCe3g
         3vt0BvaYe/NgI2zv3o55gIMImphmz+mcJtpqolytyv8S8oobIjgMrmpKbBTq3Uz2sHhW
         w9ahkK/sWRTprwYUfcVbUYXrnPIH4TQ51eTjRb49Q3Ajdkao1eyW+4CHEMnLTQiMAUN2
         QQHg==
X-Gm-Message-State: AFq9FYIUg6TXFea2+Q9vPpX4IK163w2caidNKbCMap43bRcvFnC3+Ts2
	KTj6AdyMG7FPl5IH+/0B/2fHsVNJRd9bW5/Ik5h8I1wkQKclVdvgb53p4S/T4IMjtUBVsNBjZbF
	BmJWtoNawDrMRvHLovRdVQHxJ4rOF0JE=
X-Gm-Gg: AYBFou3D7rgQQUCXqmg8IbcjoQOC6NYV/liVaZ6kysUWYuwjr2c5CFO40sQ9UKUTRmS
	EiMG0hjsAsROV7bOCMiFhf3gNTdEUfxAjds0Ct4zJDgRfoVyHnxHOR/TCRdw6ztRqgBBO2rep7/
	YqplPyLJfgRmxoFVA7XmfUHbfSAJLf+n/rHrH+Q44/DbkkFX04KH5nuCb3ryZB/Vo76Q4L7TSlG
	w3TzQqg0zqBuyBqU5J35a0HrymqzudnMViXANtDoMEt4IxqwSbQOrUg/TGEdUNHT31Pbyvo5Ihw
	PJSTMxmhXmoKQCB8NFaogyyPF81R/sWGg7AyfYBHNUduu3NZltrBAUhz9EZsmHrlfZP/QlG/dwN
	5+QePqmrV3mYj9UBOzo3/5cKbqkrSnFke2VEGlD36tQr4v8KJRvswKT0rZgW11xbQYUw9dVHw+j
	I2drb626BmgTAkm3ENtjQdn9Io3qKEQfSIdzpVMWvcJ9kpCeCQGdAI7OrCA1w8FOzZxf/bnJNDV
	371qTm+tiKmHjMlyGSlFJ4YHwSpM7IMCsI2SjQDLXdvGQXP51TfNYmuvKgH13GgsYAE6m7OY7vI
	rH6Z991EshekXM/Zxa3ZMuO62m3ln9mu94up8Pdu
X-Received: by 2002:a05:690e:1348:b0:671:70d1:d6cc with SMTP id
 956f58d0204a3-672ed8e2de5mr5219936d50.62.1790538744005; Sun, 27 Sep 2026
 12:52:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260927105002.1832451-1-ankur.tyagi85@gmail.com> <20260927105002.1832451-27-ankur.tyagi85@gmail.com>
In-Reply-To: <20260927105002.1832451-27-ankur.tyagi85@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 27 Sep 2026 12:51:57 -0700
X-Gm-Features: AclHuK_UBjOM-g_htbf4Pi5kkbix9WkmW78yCtOnAA-G3DvaLdjHLGOOREeArX4
Message-ID: <CAMKF1spx5aSzcn3+CGTQuqO-xRhB9QYemo_v_o5+i9xy_2GhUA@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH 27/35] pocketpy: upgrade 2.1.8 -> 2.2.0
To: ankur.tyagi85@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000cb08d2065c7c4955"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 19:52:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130377

--000000000000cb08d2065c7c4955
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This fails to build on AB

|
/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-lin=
ux/pocketpy/2.2.0/sources/pocketpy-2.2.0/src/modules/time.c:
In function 'time_sleep':
|
/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-lin=
ux/pocketpy/2.2.0/sources/pocketpy-2.2.0/src/modules/time.c:112:9:
error: implicit declaration of function 'c11_thrd__yield'
[-Wimplicit-function-declaration]
|   112 |         c11_thrd__yield();
|       |         ^~~~~~~~~~~~~~~


For details see -
https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1822/ste=
ps/17/logs/stdio

On Sun, Sep 27, 2026 at 3:51=E2=80=AFAM Ankur Tyagi via lists.openembedded.=
org
<ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:

> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
>
> Changelog:
> https://github.com/pocketpy/pocketpy/releases/tag/v2.2.0
>
> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ---
>  .../pocketpy/{pocketpy_2.1.8.bb =3D> pocketpy_2.2.0.bb}           | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-oe/recipes-devtools/pocketpy/{pocketpy_2.1.8.bb =3D>
> pocketpy_2.2.0.bb} (95%)
>
> diff --git a/meta-oe/recipes-devtools/pocketpy/pocketpy_2.1.8.bb
> b/meta-oe/recipes-devtools/pocketpy/pocketpy_2.2.0.bb
> similarity index 95%
> rename from meta-oe/recipes-devtools/pocketpy/pocketpy_2.1.8.bb
> rename to meta-oe/recipes-devtools/pocketpy/pocketpy_2.2.0.bb
> index 910deba386..e4aca45ae8 100644
> --- a/meta-oe/recipes-devtools/pocketpy/pocketpy_2.1.8.bb
> +++ b/meta-oe/recipes-devtools/pocketpy/pocketpy_2.2.0.bb
> @@ -14,7 +14,7 @@ LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D224889df377610675315e194ac592=
76c"
>
>  SRC_URI =3D "git://
> github.com/pocketpy/pocketpy.git;protocol=3Dhttps;branch=3Dmain;tag=3Dv${=
PV}
> <http://github.com/pocketpy/pocketpy.git;protocol=3Dhttps;branch=3Dmain;t=
ag=3Dv$%7BPV%7D>
> "
> -SRCREV =3D "a2f16e5f1f5fcc3b3d2cc1bdacfc3a027dfe2d76"
> +SRCREV =3D "6cbece9ebc98c19fa2c189dc6963b421c22c40ae"
>
>
>  inherit cmake
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#130361):
> https://lists.openembedded.org/g/openembedded-devel/message/130361
> Mute This Topic: https://lists.openembedded.org/mt/121453680/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000cb08d2065c7c4955
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This fails to build on AB<div><br></div><div>| /srv/pokybu=
ild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-linux/pocketpy=
/2.2.0/sources/pocketpy-2.2.0/src/modules/time.c: In function &#39;time_sle=
ep&#39;:<br>| /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-=
64-v3-poky-linux/pocketpy/2.2.0/sources/pocketpy-2.2.0/src/modules/time.c:1=
12:9: error: implicit declaration of function &#39;c11_thrd__yield&#39; [-W=
implicit-function-declaration]<br>| =C2=A0 112 | =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 c11_thrd__yield();<br>| =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ^~~~~~~~~~~~~~~<br><br></div><div><br></div><div>For details see -=C2=
=A0<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/b=
uilds/1822/steps/17/logs/stdio">https://autobuilder.yoctoproject.org/valkyr=
ie/#/builders/81/builds/1822/steps/17/logs/stdio</a></div></div><br><div cl=
ass=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Sun, Sep 27, 2026 at 3:51=E2=80=AFAM Ankur Tyagi via <a href=3D"htt=
p://lists.openembedded.org">lists.openembedded.org</a> &lt;ankur.tyagi85=3D=
<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.openemb=
edded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">From: Ankur Tyagi &lt;<a href=3D"mailto:ankur.tyagi85@gmail.com"=
 target=3D"_blank">ankur.tyagi85@gmail.com</a>&gt;<br>
<br>
Changelog:<br>
<a href=3D"https://github.com/pocketpy/pocketpy/releases/tag/v2.2.0" rel=3D=
"noreferrer" target=3D"_blank">https://github.com/pocketpy/pocketpy/release=
s/tag/v2.2.0</a><br>
<br>
Signed-off-by: Ankur Tyagi &lt;<a href=3D"mailto:ankur.tyagi85@gmail.com" t=
arget=3D"_blank">ankur.tyagi85@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../pocketpy/{<a href=3D"http://pocketpy_2.1.8.bb" rel=3D"noreferrer"=
 target=3D"_blank">pocketpy_2.1.8.bb</a> =3D&gt; <a href=3D"http://pocketpy=
_2.2.0.bb" rel=3D"noreferrer" target=3D"_blank">pocketpy_2.2.0.bb</a>}=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
=C2=A0rename meta-oe/recipes-devtools/pocketpy/{<a href=3D"http://pocketpy_=
2.1.8.bb" rel=3D"noreferrer" target=3D"_blank">pocketpy_2.1.8.bb</a> =3D&gt=
; <a href=3D"http://pocketpy_2.2.0.bb" rel=3D"noreferrer" target=3D"_blank"=
>pocketpy_2.2.0.bb</a>} (95%)<br>
<br>
diff --git a/meta-oe/recipes-devtools/pocketpy/<a href=3D"http://pocketpy_2=
.1.8.bb" rel=3D"noreferrer" target=3D"_blank">pocketpy_2.1.8.bb</a> b/meta-=
oe/recipes-devtools/pocketpy/<a href=3D"http://pocketpy_2.2.0.bb" rel=3D"no=
referrer" target=3D"_blank">pocketpy_2.2.0.bb</a><br>
similarity index 95%<br>
rename from meta-oe/recipes-devtools/pocketpy/<a href=3D"http://pocketpy_2.=
1.8.bb" rel=3D"noreferrer" target=3D"_blank">pocketpy_2.1.8.bb</a><br>
rename to meta-oe/recipes-devtools/pocketpy/<a href=3D"http://pocketpy_2.2.=
0.bb" rel=3D"noreferrer" target=3D"_blank">pocketpy_2.2.0.bb</a><br>
index 910deba386..e4aca45ae8 100644<br>
--- a/meta-oe/recipes-devtools/pocketpy/<a href=3D"http://pocketpy_2.1.8.bb=
" rel=3D"noreferrer" target=3D"_blank">pocketpy_2.1.8.bb</a><br>
+++ b/meta-oe/recipes-devtools/pocketpy/<a href=3D"http://pocketpy_2.2.0.bb=
" rel=3D"noreferrer" target=3D"_blank">pocketpy_2.2.0.bb</a><br>
@@ -14,7 +14,7 @@ LICENSE =3D &quot;MIT&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D224889df377610675315e=
194ac59276c&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/pocketpy/pocketp=
y.git;protocol=3Dhttps;branch=3Dmain;tag=3Dv$%7BPV%7D" rel=3D"noreferrer" t=
arget=3D"_blank">github.com/pocketpy/pocketpy.git;protocol=3Dhttps;branch=
=3Dmain;tag=3Dv${PV}</a>&quot;<br>
-SRCREV =3D &quot;a2f16e5f1f5fcc3b3d2cc1bdacfc3a027dfe2d76&quot;<br>
+SRCREV =3D &quot;6cbece9ebc98c19fa2c189dc6963b421c22c40ae&quot;<br>
<br>
<br>
=C2=A0inherit cmake<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#130361): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/130361" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/130361</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/121453680/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/121453680/1997914</a><br>
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

--000000000000cb08d2065c7c4955--

