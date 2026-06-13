Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02294CD98C5
	for <webhook@archiver.kernel.org>; Sat, 13 Jun 2026 18:57:25 +0000 (UTC)
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.96048.1781377041956297786
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Jun 2026 11:57:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=W6MA6ub9;
 spf=pass (domain: gmail.com, ip: 74.125.224.49, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-66061993294so2145794d50.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 13 Jun 2026 11:57:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781377041; cv=none;
        d=google.com; s=arc-20240605;
        b=Drr1OMfLgeS8+aWputs++fUMLvP8I2AUQqV+PgmK5+na2l3vjTchNA+Ws8Nq0eFJBg
         4Uw6o0/TrKAn7B5jY3hkiAV25P6kcunBsr8OCTXjN46/R0plT56eAbro3epXmvm7eRxY
         P2qHqLrH8yFwiOUFiWZrAGhmd0iFEffIFVLGu7S7XAxev1XqNlhxPV8DAHjne/PKfVrc
         XA89aLQdyxxyEl+/YeaZqlJLpP8u/nDhiK6ha0SThx0f/ZxBl/ewxSO9O34NLcPoS49a
         LosqfmCpA814a5Pq4Ntb9CHrLitwJ9w9DPP65RRyeC9YrnkEkAkjN7Do4Amz1DUSucCg
         QUwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=DaDAKaYa40oiJbHWcOMBFdXDNpkTU1WeSe72V/yH3kk=;
        fh=io7qMF+8jaKGrdo3QwpsjsfBoVI5kRqmyW738p/dcBU=;
        b=lazJhCKwPuENtSTH4Hi9vMrZ1MdfwGtSzmuaw1TucUbwIKtZ1Aix55SydbGhRrAqwG
         FGlGs3cCKLXzEbHU1tDdBi3ktAb0+ykpsKMLH65usGu2pkVt7wVzPf+mZPWcwdIpcOvY
         wKKUa8TH49Lzv/u6MhzazISGdOu/NGpcwqFy4Md/4NA6KJGjfUvHgyp3dAAMAjFQDMLr
         mXfCwU88D6FyMZmRJEHxYLSHRPr68dDf26jq5is8SR5l4dd7kyNtEdoRnD7+dieGraWw
         5xqY56/vnFPdHYOkWpYN3xhSjaGE1u9hsOgso5tnyxrPdGNXGZbIgmTnRdCODhJsJEhY
         T+hw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781377041; x=1781981841; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DaDAKaYa40oiJbHWcOMBFdXDNpkTU1WeSe72V/yH3kk=;
        b=W6MA6ub9HQJactAoa+R/NBNRFyHeTr549I0rFOr/K4DS+BDAWFNTGxp0HcYzY6pCF3
         XP363sPxMwQBQ1dKNo/A8a01CXaL94HHxRw8YU4Oao56bYGB4w37bwNbKYVRGMOw5kBs
         fwkLANZBAj2hLQVy212SrY/4JAn52VsOGBCa299EG7MmhOz032sncOJeUL622Cb136+9
         o0e6jZAxiP+Wh1u3d0BJo93r/qr93aO4/s7Bevf0S0xcugEjvNNokHqu+PAxlaeTmmn0
         Nf9qYrAvZim40xLMKAGXcMiFdEjYAxbvzi/w5o+5n8PKzWZFy9XoukTf2/yxClEQHX/L
         pwvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781377041; x=1781981841;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DaDAKaYa40oiJbHWcOMBFdXDNpkTU1WeSe72V/yH3kk=;
        b=kSEMSK7Rnp7cASS55MKhCEv6nCFgQJU+lUbviV1usFQdd/clk05KM/hZ4v5IqY2wmb
         hmnQXMqfOT7nhE5+tqujQT6ROwuXqzl/rlUfKsqtstllG0oVtPCxz79PPQox3r300lIS
         cBbs0f58Vp65xiJMj+QGF8yCAReqAozUXB1b9A7TA5i7VVv3OpGt3lII0QPHl61kK7Hz
         g7n2nkJSkWpJU4qYAzh462Ukrbr9pcclrcJNCeW6rGc+AJSwyuiZ1XCZ9v10K8gvxdEB
         ke6LRNdbLYl+Ka4/F07ZXi1u138WSy6BDYv62+dt1ZEUWPWW7bU0iJx5cZqFsIArg+UK
         Yopw==
X-Gm-Message-State: AOJu0YwO/I5xTga45eUQn4/+2oGI3vY8PAMDS3+d7xm0t1r7Gzu4bp7M
	xVBn37jNPrnk5nLmVTK0kwDulMHiumbuHjOKDAa8tVj4Ho2/XuCjezKp99ZxDxE6UoM1zA1TJae
	WYcaLFcXmLnKSt8Ti1TBCAHfbyYZnKs/gag==
X-Gm-Gg: Acq92OFXqMiTBB2SnhZsWJFuxOP9Sd0ZIw48DocqtldVzUgI7hbvIHUGkLQTReePAmt
	weL1rD6QlvBdtyyLyLIVawi0+AGFhYsSWxaGuBP1/JYRr5IVGzts7H011AakcmvxYEwvZEeE7+T
	BO0W83uU89i6CUTT2hCOVDfObJDstA3ZPaAVFfu1M4DPcTcmwwxU4q85uvCEzpTaEX5ADVJZ+ul
	Y7pgJbnIRlqGTz0xBiq7eUpGfb4GOCh8wzsK/AbLAB7We8pnrUX4Jxu7HtqYGOTWHy+pPMGdTke
	4nQVWL50en1YaU3l+HEl9sCb9o51Y80Nw9U8dGvEPNK0DYWEYuE0cr1HDFs+Yl2UIZg9nlkD/AC
	6vCZcTqvhMtiCGPOOpED3lPuU5CRApx0xcFJmWWaQNagGnKtVHEB+q53pfx1wq1XN+AE5L3V3OQ
	NcsLJqkByN7zVzX79fQO2IRQQG6TWfDe/YOypwlSU=
X-Received: by 2002:a05:690e:124a:b0:660:5df1:f243 with SMTP id
 956f58d0204a3-66278346bd2mr6838080d50.50.1781377040977; Sat, 13 Jun 2026
 11:57:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260613171301.155306-1-danwalkes@trellis-logic.com>
In-Reply-To: <20260613171301.155306-1-danwalkes@trellis-logic.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 13 Jun 2026 11:57:09 -0700
X-Gm-Features: AVVi8CekeZYodWIvX1ZvM9Z65N8YNTlPSXAM3pU_gzEARNZMdGeeRcRRWbSR_0A
Message-ID: <CAMKF1sq4KuccYRARqPgeTTuG2QRt-bv5CXV4s83OFfB6GMsmEw@mail.gmail.com>
Subject: Re: [PATCH] python3-scapy: replace all_distro_features() with
 DISTRO_FEATURES check
To: Dan Walkes <danwalkes@trellis-logic.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>, 
	Joe MacDonald <joe@deserted.net>
Content-Type: multipart/alternative; boundary="000000000000bd1255065427296b"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 13 Jun 2026 18:57:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127574

--000000000000bd1255065427296b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Dan I am already carrying a similar patch in master-next

On Sat, Jun 13, 2026, 10:13=E2=80=AFAM Dan Walkes <danwalkes@trellis-logic.=
com>
wrote:

> python3-scapy uses oe.utils.all_distro_features() in do_install_ptest().
>
> After oe-core commit 28d32a940ff4 ("utils: Remove
> any/all_distro_features"),
> building against current oe-core master fails with:
>
> AttributeError: module 'oe.utils' has no attribute 'all_distro_features'
>
> Replace the call with an equivalent DISTRO_FEATURES check.
>
> This appears to be the only remaining use of all_distro_features() or
> any_distro_features() within meta-openembedded.
>
> Signed-off-by: Dan Walkes <danwalkes@trellis-logic.com>
> ---
>  meta-networking/recipes-devtools/python/python3-scapy_2.6.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-networking/recipes-devtools/python/
> python3-scapy_2.6.1.bb b/meta-networking/recipes-devtools/python/
> python3-scapy_2.6.1.bb
> index 678aec0135..f6087b9b87 100644
> --- a/meta-networking/recipes-devtools/python/python3-scapy_2.6.1.bb
> +++ b/meta-networking/recipes-devtools/python/python3-scapy_2.6.1.bb
> @@ -42,7 +42,7 @@ do_install_ptest() {
>      # note1: if ipv6 isn't enabled, skip the related test (add '-K ipv6'
> argument)
>      # note2: to make this test work, your ISP also must support ipv6 -
> the test is trying
>      #        to ping google.com through ipv6.
> -    if [ "${@oe.utils.all_distro_features(d, 'ipv6', 'true', 'false')}" =
=3D
> "false" ]; then
> +    if [ "${@bb.utils.contains("DISTRO_FEATURES", 'ipv6', 'true',
> 'false', d)}" =3D "false" ]; then
>          sed -i 's/UTscapy.py/UTscapy.py -K ipv6/g'
> ${D}${PTEST_PATH}/run-ptest
>      fi
>  }
> --
> 2.43.0
>
>

--000000000000bd1255065427296b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Thanks=C2=A0Dan I am already carrying a similar patch in =
master-next=C2=A0</div><br><div class=3D"gmail_quote gmail_quote_container"=
><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Jun 13, 2026, 10:13=E2=80=AF=
AM Dan Walkes &lt;<a href=3D"mailto:danwalkes@trellis-logic.com">danwalkes@=
trellis-logic.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">python3-scapy uses oe.utils.all_distro_features() in do_in=
stall_ptest().<br>
<br>
After oe-core commit 28d32a940ff4 (&quot;utils: Remove any/all_distro_featu=
res&quot;),<br>
building against current oe-core master fails with:<br>
<br>
AttributeError: module &#39;oe.utils&#39; has no attribute &#39;all_distro_=
features&#39;<br>
<br>
Replace the call with an equivalent DISTRO_FEATURES check.<br>
<br>
This appears to be the only remaining use of all_distro_features() or<br>
any_distro_features() within meta-openembedded.<br>
<br>
Signed-off-by: Dan Walkes &lt;<a href=3D"mailto:danwalkes@trellis-logic.com=
" target=3D"_blank" rel=3D"noreferrer">danwalkes@trellis-logic.com</a>&gt;<=
br>
---<br>
=C2=A0meta-networking/recipes-devtools/python/<a href=3D"http://python3-sca=
py_2.6.1.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">python3-scapy_=
2.6.1.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta-networking/recipes-devtools/python/<a href=3D"http://pyth=
on3-scapy_2.6.1.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">python3=
-scapy_2.6.1.bb</a> b/meta-networking/recipes-devtools/python/<a href=3D"ht=
tp://python3-scapy_2.6.1.bb" rel=3D"noreferrer noreferrer" target=3D"_blank=
">python3-scapy_2.6.1.bb</a><br>
index 678aec0135..f6087b9b87 100644<br>
--- a/meta-networking/recipes-devtools/python/<a href=3D"http://python3-sca=
py_2.6.1.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">python3-scapy_=
2.6.1.bb</a><br>
+++ b/meta-networking/recipes-devtools/python/<a href=3D"http://python3-sca=
py_2.6.1.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">python3-scapy_=
2.6.1.bb</a><br>
@@ -42,7 +42,7 @@ do_install_ptest() {<br>
=C2=A0 =C2=A0 =C2=A0# note1: if ipv6 isn&#39;t enabled, skip the related te=
st (add &#39;-K ipv6&#39; argument)<br>
=C2=A0 =C2=A0 =C2=A0# note2: to make this test work, your ISP also must sup=
port ipv6 - the test is trying<br>
=C2=A0 =C2=A0 =C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0 to ping <a href=3D"http://=
google.com" rel=3D"noreferrer noreferrer" target=3D"_blank">google.com</a> =
through ipv6.<br>
-=C2=A0 =C2=A0 if [ &quot;${@oe.utils.all_distro_features(d, &#39;ipv6&#39;=
, &#39;true&#39;, &#39;false&#39;)}&quot; =3D &quot;false&quot; ]; then<br>
+=C2=A0 =C2=A0 if [ &quot;${@bb.utils.contains(&quot;DISTRO_FEATURES&quot;,=
 &#39;ipv6&#39;, &#39;true&#39;, &#39;false&#39;, d)}&quot; =3D &quot;false=
&quot; ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i &#39;s/UTscapy.py/UTscapy.py -K ip=
v6/g&#39; ${D}${PTEST_PATH}/run-ptest<br>
=C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0}<br>
-- <br>
2.43.0<br>
<br>
</blockquote></div>

--000000000000bd1255065427296b--

