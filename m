Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB9B510A88F7
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 17:50:20 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.53859.1774547410250207714
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 10:50:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=GOfalmGb;
 spf=pass (domain: snapchat.com, ip: 209.85.221.53, mailfrom: ecordonnier@snapchat.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-43b88b7ca76so980472f8f.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 10:50:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774547409; cv=none;
        d=google.com; s=arc-20240605;
        b=hc/xXyS5tEqT53j9Srjvxc3Rpr5WrHAdQXN+gOXDdG64dZge7xamP+9l6Pb5u/mKmn
         wqG7BUtOpWWmk4SGqoV+C4EZgziy1bk1tq/o2WYJQSDtDTf6b/JYskaYcLVcsEp6TlMr
         +SYxnDcuFudYdUUoLUznKghEmF7JQEQfJrjtqy1L/tMDHTxPJRZEyO1+uarxCs5wPnip
         J7wdcYDx9eSuMNE51GQUaQh85BZHPbT7FdBgzfg+tyemV1EGrQGdUp7B6YnOf9NE12zP
         hHQ7LdvXGMyJOj58TAkwUFVIWzJqI5m3K4UqN9hvNZracIPJ2mNYwTV1yokNEZ791pGy
         ezgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=XIJdz9r6+ZRT+Tnvv3AIAEvzRb2bVqqPc60/SRPtu98=;
        fh=NMrIXR6RLEg4rYPQ8nUsrl7hKeJf/zrqC1DYBwuLxdk=;
        b=eGZhYeP7W3zC4th9x5+9HLEe9x8IFJ9J2fspXeaweck6fUJqB6I+AVi2F/3dm7uJff
         cjNOAoqvYVcTLc90o8xsJmQ8n+5r/W1foLC60OcdrFIBpy7mKKQDMH3q58AHdznzm350
         Haq47+HQX7xR/+A1ABDipPBFPUC0WAGrvraqBI2EAQalstHcfNLmpW9wOJVXCtWSSTqS
         YcMJoSIDQMpYz7hGOpbWOOFHY1L9z2AnBkXx7a3Mj4j6LA9oDqWSr/vpPAxRJ5DC4B9Y
         RLHR3e7o7F7NMjZBjxuMevRrhJe8B7cL5oLYP3dgIdd900AVXoC1W5LgNQ/x91cDwmz8
         AkkQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1774547409; x=1775152209; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XIJdz9r6+ZRT+Tnvv3AIAEvzRb2bVqqPc60/SRPtu98=;
        b=GOfalmGbsAUA2nlNMoyvboEG8+PMdZ+UnTdiQkMtUCwleX7GBfZ4Hv5jRHJdYJ4R/k
         jcFqO1ntkoo3njWDAYKeAP2MDYEvJGULId2+XJjDRuk3w7WZ9AB3M0kDzL7bG+dds25c
         sEvTFDl6ESd1ui004OR7NItDyuM3H4A6WiDQw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774547409; x=1775152209;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XIJdz9r6+ZRT+Tnvv3AIAEvzRb2bVqqPc60/SRPtu98=;
        b=bvW9yMy4M6b7Vgdb6U7C1Fb7lOvfgVSBuoBL7z0MBQ/RqzReA+Elpl84JwvEEVIZbo
         21mmDVecKz/3HDpa8rmIBU1pqfkGTFMzUTFaelRWmiFbMvG3+Syz+O/+Dkt20N/fJdQn
         qy7886A2mzuFDEsjnvpOgSPDFW+AjWOOH8lQl5bbPwa5FDpWRv0dvIAbam3MaGPbstJ5
         0VLSP2j5SDdPpr1Ts0IjaNYZudvRTTCdl/JFwu64J/YguDijpmR1/dwbullMbZe+zEBf
         J3USGS/H88gACdvzEZ5BvCfBryD5J60J9eTZcIhcxR2HMtsdTWq20XcYu/PZNLyuv3dk
         LzdQ==
X-Forwarded-Encrypted: i=1; AJvYcCWArV7eZRcVZ1zmxlXJ60K4vnVUdHMm/KVCVH68Xxd6vI1/MHO0F0a9SeTjlTMMXk6X0cUbwQjOHpoSzR5KvGH7XIU=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxDaBpt0ZD6hxnUCtFUMLhFfUtlzsLXrGilbdSYSEeBilp2vZXh
	kzkCF8iFWqwrAHjxj31UXCIe/YGDtyKdUYbYo2WZjL37Lzd/7D+kcKE6PatzOi0vV0gL/CCg5lm
	kghhir1zRnBze4UTS4oxG0YrFKkX3zHJSeIrOv6WPIA==
X-Gm-Gg: ATEYQzydJnpYVDG/EOXdnoXBx3haTFgvBvabwXanenbmEy55GYNlMyIm0FnJQ9qPlxL
	aR3DRUCZQbhSKUn5s6naQJitzD2vuWVfJMj8bGPHD2AAPon8/oUI8Vg5aDsifzjjRkcHeq5vlFb
	9XuIbUftRQG0744b36b8/cinOvqHRFbQ8Wxzd/bQwvD24q9CXtYjDzZbcsoshwFS5Yz+ht8MaR4
	UzSXvTf2Ie/Sh+6l6ef6iduUBPM+LRAl4VM5nUAajTwJSltfaXb1235e0Xpa5DBJZHIC+oKn3g2
	U/tSQ76gCd1n9mL/3SlGHxL75xkPonnpFOnCaWol
X-Received: by 2002:a05:6000:40ce:b0:43b:49a1:8ace with SMTP id
 ffacd0b85a97d-43b88a0cff0mr13713772f8f.51.1774547408426; Thu, 26 Mar 2026
 10:50:08 -0700 (PDT)
MIME-Version: 1.0
References: <293a5ad3-bf5c-4cec-85d5-4121e01b76b6@gmail.com>
In-Reply-To: <293a5ad3-bf5c-4cec-85d5-4121e01b76b6@gmail.com>
From: Etienne Cordonnier <ecordonnier@snap.com>
Date: Thu, 26 Mar 2026 18:49:57 +0100
X-Gm-Features: AQROBzAnt6eq6yVUqce61KeIHLByrg_8TBxT857zypo0X6XNHMBjbZCILAWtZvk
Message-ID: <CAHUKmYaS-EM=71vO+JMM6GD7joy8WjWQtjcdXXP0+gUOrub=ig@mail.gmail.com>
Subject: Re: [meta-oe][scarthgap][PATCH] uutils-coreutils: drop (filtered)
 "selinux" from PACKAGECONFIG ?=
To: Clayton Casciato <majortomtosourcecontrol@gmail.com>
Cc: anuj.mittal@oss.qualcomm.com, openembedded-devel@lists.openembedded.org, 
	Yi Zhao <yi.zhao@windriver.com>, joe.macdonald@siemens.com, 
	Vincent Davis Jr <vince@underview.tech>, raj.khem@gmail.com
Content-Type: multipart/alternative; boundary="000000000000eabe3f064df1038e"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 17:50:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125766

--000000000000eabe3f064df1038e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Clayton,

I agree to merge this patch.

=C3=89tienne

On Thu, Mar 26, 2026 at 6:25=E2=80=AFPM Clayton Casciato <
majortomtosourcecontrol@gmail.com> wrote:

> "selinux" adds a dependency on clang-native.
>
> clang-native is provided by meta-clang.
>
> If meta-clang is not included, this surfaces parse-time errors such as:
> ERROR: Nothing PROVIDES 'clang-native' (but
> [...]/uutils-coreutils_0.0.28.bb DEPENDS on or otherwise requires it)
>
> This is an issue in the default case - where uutils-coreutils is not
> enabled.
>
> Suggested-by: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Clayton Casciato <majortomtosourcecontrol@gmail.com>
> ---
> Sponsor: 21SoftWare LLC
>
> OE-C whinlatter and master include clang-native:
>
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__git.openembedded.o=
rg_openembedded-2Dcore_commit_meta_recipes-2Ddevtools_clang-3Fh-3Dwhinlatte=
r-26id-3Dd77e398095228b34851762858a76640e3c2cb0ab&d=3DDwICaQ&c=3DncDTmphkJT=
vjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa=
66m67E&m=3D4qaMdrtGvkWreWnK7doGMkiFb-BtHVU_UOlvQ23LpOTa-jYEEQoeNRs0MiX43C0B=
&s=3DTJh5AjJaNJ4637qYkkSev7d0Jfdmsnw4EdVbI7lfbZA&e=3D
>
> Discussion:
>
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Ddevel_topic_103440861&d=3DDwICaQ&c=3DncDTmphkJTvjIDPh=
0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E=
&m=3D4qaMdrtGvkWreWnK7doGMkiFb-BtHVU_UOlvQ23LpOTa-jYEEQoeNRs0MiX43C0B&s=3DT=
zTRDBWSUS36fXqwJJT-NpSGXwehEtgi7MHzNUcEjec&e=3D
>
>  .../recipes-core/uutils-coreutils/uutils-coreutils_0.0.28.bb    | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-core/uutils-coreutils/
> uutils-coreutils_0.0.28.bb b/meta-oe/recipes-core/uutils-coreutils/
> uutils-coreutils_0.0.28.bb
> index 76cecac5a6..41e4f1d831 100644
> --- a/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.0.28.bb
> +++ b/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.0.28.bb
> @@ -22,7 +22,7 @@ require ${BPN}-crates.inc
>  PROVIDES =3D "coreutils"
>  RPROVIDES:${PN} =3D "coreutils"
>
> -PACKAGECONFIG ?=3D "${@bb.utils.filter('DISTRO_FEATURES', 'selinux', d)}=
"
> +PACKAGECONFIG ?=3D ""
>
>  PACKAGECONFIG[selinux] =3D "--with-selinux,--without-selinux,libselinux"
>
>

--000000000000eabe3f064df1038e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Clayton,<br><br>I agree to merge this patch.<br><br>=C3=
=89tienne</div><br><div class=3D"gmail_quote gmail_quote_container"><div di=
r=3D"ltr" class=3D"gmail_attr">On Thu, Mar 26, 2026 at 6:25=E2=80=AFPM Clay=
ton Casciato &lt;<a href=3D"mailto:majortomtosourcecontrol@gmail.com">major=
tomtosourcecontrol@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">&quot;selinux&quot; adds a dependency on clang-=
native.<br>
<br>
clang-native is provided by meta-clang.<br>
<br>
If meta-clang is not included, this surfaces parse-time errors such as:<br>
ERROR: Nothing PROVIDES &#39;clang-native&#39; (but<br>
[...]/<a href=3D"http://uutils-coreutils_0.0.28.bb" rel=3D"noreferrer" targ=
et=3D"_blank">uutils-coreutils_0.0.28.bb</a> DEPENDS on or otherwise requir=
es it)<br>
<br>
This is an issue in the default case - where uutils-coreutils is not<br>
enabled.<br>
<br>
Suggested-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"=
_blank">raj.khem@gmail.com</a>&gt;<br>
Signed-off-by: Clayton Casciato &lt;<a href=3D"mailto:majortomtosourcecontr=
ol@gmail.com" target=3D"_blank">majortomtosourcecontrol@gmail.com</a>&gt;<b=
r>
---<br>
Sponsor: 21SoftWare LLC<br>
<br>
OE-C whinlatter and master include clang-native:<br>
<a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__git.opene=
mbedded.org_openembedded-2Dcore_commit_meta_recipes-2Ddevtools_clang-3Fh-3D=
whinlatter-26id-3Dd77e398095228b34851762858a76640e3c2cb0ab&amp;d=3DDwICaQ&a=
mp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx=
_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3D4qaMdrtGvkWreWnK7doGMkiFb-BtHVU_UOlvQ23=
LpOTa-jYEEQoeNRs0MiX43C0B&amp;s=3DTJh5AjJaNJ4637qYkkSev7d0Jfdmsnw4EdVbI7lfb=
ZA&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofp=
oint.com/v2/url?u=3Dhttps-3A__git.openembedded.org_openembedded-2Dcore_comm=
it_meta_recipes-2Ddevtools_clang-3Fh-3Dwhinlatter-26id-3Dd77e398095228b3485=
1762858a76640e3c2cb0ab&amp;d=3DDwICaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabg=
GkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3D=
4qaMdrtGvkWreWnK7doGMkiFb-BtHVU_UOlvQ23LpOTa-jYEEQoeNRs0MiX43C0B&amp;s=3DTJ=
h5AjJaNJ4637qYkkSev7d0Jfdmsnw4EdVbI7lfbZA&amp;e=3D</a> <br>
<br>
Discussion:<br>
<a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.ope=
nembedded.org_g_openembedded-2Ddevel_topic_103440861&amp;d=3DDwICaQ&amp;c=
=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9=
TsRih1DULJTKUkSGa66m67E&amp;m=3D4qaMdrtGvkWreWnK7doGMkiFb-BtHVU_UOlvQ23LpOT=
a-jYEEQoeNRs0MiX43C0B&amp;s=3DTzTRDBWSUS36fXqwJJT-NpSGXwehEtgi7MHzNUcEjec&a=
mp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoint=
.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Ddevel_top=
ic_103440861&amp;d=3DDwICaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epck=
fdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3D4qaMdrtGvk=
WreWnK7doGMkiFb-BtHVU_UOlvQ23LpOTa-jYEEQoeNRs0MiX43C0B&amp;s=3DTzTRDBWSUS36=
fXqwJJT-NpSGXwehEtgi7MHzNUcEjec&amp;e=3D</a> <br>
<br>
=C2=A0.../recipes-core/uutils-coreutils/<a href=3D"http://uutils-coreutils_=
0.0.28.bb" rel=3D"noreferrer" target=3D"_blank">uutils-coreutils_0.0.28.bb<=
/a>=C2=A0 =C2=A0 | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta-oe/recipes-core/uutils-coreutils/<a href=3D"http://uutils=
-coreutils_0.0.28.bb" rel=3D"noreferrer" target=3D"_blank">uutils-coreutils=
_0.0.28.bb</a> b/meta-oe/recipes-core/uutils-coreutils/<a href=3D"http://uu=
tils-coreutils_0.0.28.bb" rel=3D"noreferrer" target=3D"_blank">uutils-coreu=
tils_0.0.28.bb</a><br>
index 76cecac5a6..41e4f1d831 100644<br>
--- a/meta-oe/recipes-core/uutils-coreutils/<a href=3D"http://uutils-coreut=
ils_0.0.28.bb" rel=3D"noreferrer" target=3D"_blank">uutils-coreutils_0.0.28=
.bb</a><br>
+++ b/meta-oe/recipes-core/uutils-coreutils/<a href=3D"http://uutils-coreut=
ils_0.0.28.bb" rel=3D"noreferrer" target=3D"_blank">uutils-coreutils_0.0.28=
.bb</a><br>
@@ -22,7 +22,7 @@ require ${BPN}-crates.inc<br>
=C2=A0PROVIDES =3D &quot;coreutils&quot;<br>
=C2=A0RPROVIDES:${PN} =3D &quot;coreutils&quot;<br>
<br>
-PACKAGECONFIG ?=3D &quot;${@bb.utils.filter(&#39;DISTRO_FEATURES&#39;, &#3=
9;selinux&#39;, d)}&quot;<br>
+PACKAGECONFIG ?=3D &quot;&quot;<br>
<br>
=C2=A0PACKAGECONFIG[selinux] =3D &quot;--with-selinux,--without-selinux,lib=
selinux&quot;<br>
<br>
</blockquote></div>

--000000000000eabe3f064df1038e--

