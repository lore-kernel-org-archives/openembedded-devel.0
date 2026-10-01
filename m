Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A90C4CA5FCB
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 14:25:50 +0000 (UTC)
Received: from mail-yx2-f38.google.com (mail-yx2-f38.google.com [74.125.224.166])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12611.1790864744216151551
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Oct 2026 07:25:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=o0QXGub+;
 spf=pass (domain: gmail.com, ip: 74.125.224.166, mailfrom: raj.khem@gmail.com)
Received: by mail-yx2-f38.google.com with SMTP id 00721157ae682-8ab41af29caso31914787b3.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 01 Oct 2026 07:25:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790864743; cv=none;
        d=google.com; s=arc-20260327;
        b=hwEfuExBcvwgdGZnwSq+38SNKQSEbSUfa9PjS/7VimEGuJmvnOjpPePbL7khxYwp9c
         OBH+/5melFQGkOrgxE/rtWDpv0HIIQDzZkt/e5CSGV4XxNdLRaFwT1h5tzdLzBGOJ9S6
         89tPlNFgC4Llhq+akbpfKcwESz1Siw58YM7E081x+uXA0LikdWxV0SM/e5g31Lb/iKbo
         FGDAJbUL3cezAfUEg5+MR6Z1e+lTeDBybMMMj5chuGXOVVJKFyYS3r1Yz6BWBIr9loKS
         mDZ7lHuiLlQPmWbXqtzAWENjfjNgh/M7RkvPBCAEFpqlW1dHw8OKRy8EghWZ/yA2nua9
         3arQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6kWRATsltEXkNaW0ATlO2L5D4WfGkjGXXPEMTKxfAiI=;
        fh=n0ZnAkKOhGDmrf8RLpwnC7FQ6xmEY5rofL6wXnjsXjs=;
        b=pFVY9VnvgYEoMnrgg4ilo3eqFioTysZu6i6z63ZEARetQfFXkCtrmFVMEok6RHz4mx
         tpDKKNUOglU5aAloJU7norVfw+UG7ZVWKVKRWo/u5YseZmwIw+GwozoQNSg8wRpURB0w
         Z05RmjFNbYy3YUMSOgomZYSwo4HHXyJyZvuPh9QIpjzhmUMMpQH/SUh3OhCwi0gL1GP4
         yRL+jp7A7hW7H6XwHPf95XeIYZfXiRvCUDJExjcGFUNa77UzspRZLN9I8N4nvREG+XYe
         5NqmC+TejD3aWoO3fAw3Ld4R0leaJgQWrrBYNIsGb9r+YbQLkyyV3KUZXIvx7Bc8/KlL
         JbWA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790864743; x=1791469543; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6kWRATsltEXkNaW0ATlO2L5D4WfGkjGXXPEMTKxfAiI=;
        b=o0QXGub+J8eFZ2yj+zzXlICMJDPkjeFP4ZttGNvnp0/jOZM5IKJIAha5BhssF4a2cc
         ulYwIMXKGN9WdKFMWgryBVhV5jsn6mhDSakUE+9+XWXRfKcnVrEYC9j5Y8EugsLBTDJP
         nR8/NNLtSTljL5s4LtY4VBCmYn3I5NX4Yr4wihsT2eBjbBzvj4HhHkBox81iLowe7Z7l
         eChu7ZEd5avUaNqs/OWmKYoQcNVFpOqasoSwY36LD7kzWnXFrOuxYy+ZtZjWKxTkHz7b
         bny0qWV5fXf6OVWaATGz/OHHrmYlqOSmhmHO0XlxJU+YwhzQaKBx2flK6isYvObrWDh5
         3bsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790864743; x=1791469543;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6kWRATsltEXkNaW0ATlO2L5D4WfGkjGXXPEMTKxfAiI=;
        b=jM73+wyORbO3xtnjHGbJjVnbCDzHpr0KiEqSeUazKLYD/sb0xeaR3NWNxXhzeQtmFd
         JS+TDvhuAi04eF2dvGghYkw0uKmQFQw7yyPUxunefYLX7BsMwbpsOwnzGbtg2DuQZe6a
         8swlRNg7zXws/dEBtb763TSuqUt1xPBIDVFlp7/N9E26/DO+7zl87DM/306l1DoVp+jC
         w5KzWtYRN2f4kBBOiBzpL3mo5+AbQlvKiYg9aYjHqD6Tmy2Icfo51Nzmy7/nTVDisEEy
         BHGZm9YLgKMA2n3lV79lVrHLeWWbjkS/nfdsSlFYUsJgxxNHDoufXhviM6V3vlMC9L3V
         7VRA==
X-Gm-Message-State: AFq9FYLvrDh3syrFKmSN0k4jSu5SEgYCkCBuQiZmMamTl8geOSMwvS6M
	V+QW5JBfYg4DXL1SVbyp8mhZ7OdN1U03CMqCO8ecY16/GXgKd0NXHFSmveN9UBpcfLqoO3VWB1N
	m4JQPIFSBPCePR7TxN0XetIRBezs6ViI=
X-Gm-Gg: AYBFou0rThvOkDc3wOV1Fjx2phJzsgcYMYt0+73YuWBdFhP6HvBG67VCMUkT6gfBVGq
	tzc4/+eJ8PnBgFZWzFuYY92NQuWNsYlLM1xhvmKd5uFwumwQ4d6gQBe39TCeGTQbuH6Kagj3KeI
	SEAtaSBbYIbG6JS2Acu0Ppo0PT0PjjwIRRhe6E6M4KApXz6yGWf0Rt/v9/JCUY4/6tJ+D4d0r70
	bQhS6hJTzgyJqn9FOqMaKLSzH7DrabKxk3D19e4eBwvgqUXfEfBYTW9LoFpgI9mhWg6hJdVo0Tf
	tt8Gba41WEicm+R4v/dDo8mW6k6S5qX1lC18WJknhZwzv+givYNZYsc+E2I4LrnZpGfl4Yrx9PC
	NyDOKZbNPQ1zE6w6dFxPWVFc4iaXv/b1KZ9jjWLLnrtvvGbxZC96dVgypDiFAbIXd49UzEG8I+B
	Prioe95bReLPVJ81VXsOiidpGw0CYVyq3bho/2tp9CyhzGY0bwLYd2RgETqpmsUxBoRSu+FoqIi
	+3yusR43iSF+0c+uQS4DRCobptSZI+G7QPUOtKjc3URmnQ/AYwL1EaN6AGPkJhgFR59fxk6vUyy
	Havg2xSnYjkZ8IkoARGl0LrqWC8SDG0bK9QFDCo=
X-Received: by 2002:a05:690c:6e87:b0:8ab:415c:d715 with SMTP id
 00721157ae682-8ac92b35639mr24073727b3.30.1790864743072; Thu, 01 Oct 2026
 07:25:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260927105002.1832451-1-ankur.tyagi85@gmail.com> <20260927105002.1832451-31-ankur.tyagi85@gmail.com>
In-Reply-To: <20260927105002.1832451-31-ankur.tyagi85@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 1 Oct 2026 07:25:15 -0700
X-Gm-Features: AclHuK8B5uj2rE9KEjDYX3Kxq8oNNlWQojl6myH9faTRL0dIebCp6tPJhk7z87Q
Message-ID: <CAMKF1sqU2Uu=-YJKr6My-KOd4kdbkths23TMuGqq3g4-XQtM6Q@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH 31/35] librelp: upgrade 1.12.0 -> 1.13
To: ankur.tyagi85@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000da08db065cc830b5"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Oct 2026 14:25:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130593

--000000000000da08db065cc830b5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This is failing ptests  ( running meta-oe-image-ptest-librelp )

AssertionError:
Failed ptests:
{'librelp': ['tls-ossl-connect-failure-vg.sh']}

On Sun, Sep 27, 2026 at 3:51=E2=80=AFAM Ankur Tyagi via lists.openembedded.=
org
<ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:

> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
>
> Changelog:
> https://github.com/rsyslog/librelp/blob/v1.13/ChangeLog
>
> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ---
>  .../rsyslog/{librelp_1.12.0.bb =3D> librelp_1.13.bb}            | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-extended/rsyslog/{librelp_1.12.0.bb =3D>
> librelp_1.13.bb} (97%)
>
> diff --git a/meta-oe/recipes-extended/rsyslog/librelp_1.12.0.bb
> b/meta-oe/recipes-extended/rsyslog/librelp_1.13.bb
> similarity index 97%
> rename from meta-oe/recipes-extended/rsyslog/librelp_1.12.0.bb
> rename to meta-oe/recipes-extended/rsyslog/librelp_1.13.bb
> index 21ec9f25f7..479905f728 100644
> --- a/meta-oe/recipes-extended/rsyslog/librelp_1.12.0.bb
> +++ b/meta-oe/recipes-extended/rsyslog/librelp_1.13.bb
> @@ -6,11 +6,11 @@ LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3D1fb9c10ed9fd6826757615455ca893a9"
>
>  DEPENDS =3D "gmp libidn zlib"
>
> -SRC_URI =3D "git://
> github.com/rsyslog/librelp.git;protocol=3Dhttps;branch=3Dstable \
> +SRC_URI =3D "git://
> github.com/rsyslog/librelp.git;protocol=3Dhttps;branch=3Dmain;tag=3Dv${PV=
}
> <http://github.com/rsyslog/librelp.git;protocol=3Dhttps;branch=3Dmain;tag=
=3Dv$%7BPV%7D>
> \
>             file://run-ptest \
>  "
>
> -SRCREV =3D "dab30db5108ef4bb5b6f9135e0428b57be7c4085"
> +SRCREV =3D "bedc657e519568b25f611c8efc83eab6ac1068e9"
>
>  CVE_PRODUCT =3D "rsyslog:librelp"
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#130365):
> https://lists.openembedded.org/g/openembedded-devel/message/130365
> Mute This Topic: https://lists.openembedded.org/mt/121453686/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000da08db065cc830b5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This is failing ptests=C2=A0 ( running=C2=A0meta-oe-image-=
ptest-librelp )<br><br>AssertionError:<br>Failed ptests:<br>{&#39;librelp&#=
39;: [&#39;tls-ossl-connect-failure-vg.sh&#39;]}</div><br><div class=3D"gma=
il_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Su=
n, Sep 27, 2026 at 3:51=E2=80=AFAM Ankur Tyagi via <a href=3D"http://lists.=
openembedded.org">lists.openembedded.org</a> &lt;ankur.tyagi85=3D<a href=3D=
"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.openembedded.org<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">F=
rom: Ankur Tyagi &lt;<a href=3D"mailto:ankur.tyagi85@gmail.com" target=3D"_=
blank">ankur.tyagi85@gmail.com</a>&gt;<br>
<br>
Changelog:<br>
<a href=3D"https://github.com/rsyslog/librelp/blob/v1.13/ChangeLog" rel=3D"=
noreferrer" target=3D"_blank">https://github.com/rsyslog/librelp/blob/v1.13=
/ChangeLog</a><br>
<br>
Signed-off-by: Ankur Tyagi &lt;<a href=3D"mailto:ankur.tyagi85@gmail.com" t=
arget=3D"_blank">ankur.tyagi85@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../rsyslog/{<a href=3D"http://librelp_1.12.0.bb" rel=3D"noreferrer" =
target=3D"_blank">librelp_1.12.0.bb</a> =3D&gt; <a href=3D"http://librelp_1=
.13.bb" rel=3D"noreferrer" target=3D"_blank">librelp_1.13.bb</a>}=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta-oe/recipes-extended/rsyslog/{<a href=3D"http://librelp_1.=
12.0.bb" rel=3D"noreferrer" target=3D"_blank">librelp_1.12.0.bb</a> =3D&gt;=
 <a href=3D"http://librelp_1.13.bb" rel=3D"noreferrer" target=3D"_blank">li=
brelp_1.13.bb</a>} (97%)<br>
<br>
diff --git a/meta-oe/recipes-extended/rsyslog/<a href=3D"http://librelp_1.1=
2.0.bb" rel=3D"noreferrer" target=3D"_blank">librelp_1.12.0.bb</a> b/meta-o=
e/recipes-extended/rsyslog/<a href=3D"http://librelp_1.13.bb" rel=3D"norefe=
rrer" target=3D"_blank">librelp_1.13.bb</a><br>
similarity index 97%<br>
rename from meta-oe/recipes-extended/rsyslog/<a href=3D"http://librelp_1.12=
.0.bb" rel=3D"noreferrer" target=3D"_blank">librelp_1.12.0.bb</a><br>
rename to meta-oe/recipes-extended/rsyslog/<a href=3D"http://librelp_1.13.b=
b" rel=3D"noreferrer" target=3D"_blank">librelp_1.13.bb</a><br>
index 21ec9f25f7..479905f728 100644<br>
--- a/meta-oe/recipes-extended/rsyslog/<a href=3D"http://librelp_1.12.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">librelp_1.12.0.bb</a><br>
+++ b/meta-oe/recipes-extended/rsyslog/<a href=3D"http://librelp_1.13.bb" r=
el=3D"noreferrer" target=3D"_blank">librelp_1.13.bb</a><br>
@@ -6,11 +6,11 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D1fb9c10ed=
9fd6826757615455ca893a9&quot;<br>
<br>
=C2=A0DEPENDS =3D &quot;gmp libidn zlib&quot;<br>
<br>
-SRC_URI =3D &quot;git://<a href=3D"http://github.com/rsyslog/librelp.git;p=
rotocol=3Dhttps;branch=3Dstable" rel=3D"noreferrer" target=3D"_blank">githu=
b.com/rsyslog/librelp.git;protocol=3Dhttps;branch=3Dstable</a> \<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/rsyslog/librelp.git;p=
rotocol=3Dhttps;branch=3Dmain;tag=3Dv$%7BPV%7D" rel=3D"noreferrer" target=
=3D"_blank">github.com/rsyslog/librelp.git;protocol=3Dhttps;branch=3Dmain;t=
ag=3Dv${PV}</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \<br>
=C2=A0&quot;<br>
<br>
-SRCREV =3D &quot;dab30db5108ef4bb5b6f9135e0428b57be7c4085&quot;<br>
+SRCREV =3D &quot;bedc657e519568b25f611c8efc83eab6ac1068e9&quot;<br>
<br>
=C2=A0CVE_PRODUCT =3D &quot;rsyslog:librelp&quot;<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#130365): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/130365" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/130365</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/121453686/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/121453686/1997914</a><br>
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

--000000000000da08db065cc830b5--

