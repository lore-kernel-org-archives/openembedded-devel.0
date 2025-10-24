Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77239CCD1A5
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 04:35:47 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.2177.1761280540520625883
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Oct 2025 21:35:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SHzowz1M;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47117e75258so12049245e9.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Oct 2025 21:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761280539; x=1761885339; darn=lists.openembedded.org;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BYLXuahZgJLCCWObAEh3GwDHYu4DjacCKexcnG+iCXQ=;
        b=SHzowz1Mo3aUiwezzNmbyJxNYV/pMMAihb4wJ97xOoiWO5U4EbKxAuA505B9+ePwGJ
         w1uAvt9RaJyD4iPTPO1A3oShfSXDKn7pgZ5INRDD3BHG2tRl3mzPnY0JhbrJr1lSg+KT
         k0nkUag7nx+PYUdTZPWR4BfN3H4+5UrkQ/HEVHmpgikdH5R7WYltB/7QHm1fxTo8NRFn
         zPjR9BpUB+iS8gmOeOLLMTEk1mR2tRWDrcOaUzvLFXo/jytZKt9TbdlBVRaOTxJ0PzrH
         wbH4jzT45nl7FZn6DyBY8Fhp7IXDgwqlxbcgkXTTyS7wdbiW8IZEaN08AFm4o9mwVs+U
         XVFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761280539; x=1761885339;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BYLXuahZgJLCCWObAEh3GwDHYu4DjacCKexcnG+iCXQ=;
        b=klGXWacn6yD9hozy/RH7rXf/kdulvEMmpR47wQDwQj4He2N+5wkpWAYVY1t7IlAR4+
         nobxmVCPzJWK44I1NXqBu05AjrgvqXW0vGiFnGwWYrVys3f9GGDApovGJoqoMo5C0Woc
         XbcGgWF4DbqC+9bz+9hH/uBC1wQh3vIPJ4H10eMmD3W8+vokKmumxsMpGZMXmjY4VU2d
         3fMoFYht+qf/OOMto6vcPxcGW3uydzVYfFH8yQ2qXqxbLu0WwuL+c7Wl31BxgdhyEWIO
         VYK34c0UFS8Cn4XIO0MCsqLL5CYGtrp3IhhB7PsSd4XGuWclwz57XfFarwQb6wuoc0Fw
         g2TA==
X-Gm-Message-State: AOJu0YxI5saZFyWtcqCwYp0/r0pP9ug1hsOUp4KYr20mNgPx/LX3v7yD
	lEZVbdvZRYU8tdFJ37CJKD8XcET2rT3SUV4bGWvFjqHS8P7dUEEa73WI
X-Gm-Gg: ASbGncsSFiJaim9sE2hK8OsZdGfx3kq1XBPpov6jJ/QYbgtFHWiIMekj3vQ5iFN2jKB
	SXlnzn9LcQKZgdi2uNEWEIoz/21mVgcCP8KAsZmRUYMHMEiakihZFXlsy2qRs7RWZXGOa7dhgov
	Ik0tF0Wdpj0ux45FnAAdyVtGkk0IEL4JO0S1gqoQUe2CgiDQncVX4UxeT/p8/D9yPed/1LsjRpo
	UJLgYFbXmHhVrUgiHgFCfwQ8vlzyvupKCrLDJwdYVw4k2sGj1fCX3umGjqo7ia/Z3dnBMrlPN3x
	PW8Bjc6MetyzgFK47nHpxJ+iS9Qe7cy0DZa3aXgrQYesIgaAgzIhfDXCry1D+zH219OjD5LT322
	TWAKx2Zame/sg2yDgxtakM7HJxIrWhXQ9UDTiAwy4817JsNmTz6u/eseftrPrTAy3pJuwWQiUo9
	EyX0a7djVBrqWwABKAMOZWTmRdAwN71fQAYDE=
X-Google-Smtp-Source: AGHT+IHp2Ufqi+BD+64B8A7hy9VA7QIb6Z9sT6dtD8/YQqg5m/waAXxns2Ek4+CirS3ymyXep1DgtQ==
X-Received: by 2002:a05:600c:1f96:b0:46e:37af:f90e with SMTP id 5b1f17b1804b1-475caf933dfmr30631745e9.6.1761280538670;
        Thu, 23 Oct 2025 21:35:38 -0700 (PDT)
Received: from smtpclient.apple ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475cae9f571sm71302475e9.7.2025.10.23.21.35.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 21:35:38 -0700 (PDT)
Content-Type: multipart/alternative; boundary=Apple-Mail-7587FF7C-26CC-409B-A4E9-9C2E889B3604
Content-Transfer-Encoding: 7bit
From: skandigraun <skandigraun@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [oe] [meta-python][kirkstone][PATCH] python3-pint: fix ptests
Date: Fri, 24 Oct 2025 06:35:27 +0200
Message-Id: <14514A5C-CAD7-4D2C-8A10-79C2A43830A0@gmail.com>
References: <CAMKF1sr-6ed+3o-SnapvsoW7oHv8B5EzQxwrYzEOgtYyuUjWFQ@mail.gmail.com>
Cc: openembedded-devel@lists.openembedded.org
In-Reply-To: <CAMKF1sr-6ed+3o-SnapvsoW7oHv8B5EzQxwrYzEOgtYyuUjWFQ@mail.gmail.com>
To: Raj Khem <raj.khem@gmail.com>
X-Mailer: iPad Mail (22F76)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Oct 2025 04:35:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120944


--Apple-Mail-7587FF7C-26CC-409B-A4E9-9C2E889B3604
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><div dir=3D"ltr"></div><div dir=3D"ltr"><br=
></div><div dir=3D"ltr"><br><blockquote type=3D"cite">On 24 Oct 2025, at 02:=
12, Khem Raj &lt;raj.khem@gmail.com&gt; wrote:<br><br></blockquote></div><bl=
ockquote type=3D"cite"><div dir=3D"ltr">=EF=BB=BF<div dir=3D"auto">Do we nee=
d this on master&nbsp;</div></div></blockquote><div><br></div><div>Nope, mas=
ter switched ptest-pytest class (which doesn't exist in master), so it works=
 there.</div><br><blockquote type=3D"cite"><div dir=3D"ltr"><div><br><div cl=
ass=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Thu, Oct 23, 2025 at 2:29=E2=80=AFPM Gyorgy Sarvari via <a href=3D"ht=
tp://lists.openembedded.org">lists.openembedded.org</a> &lt;skandigraun=3D<a=
 href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.openembedd=
ed.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">1. Add missing p=
test dependency (pytest-subtest)<br>
<br>
2. The testsuite is installed in both the site-packages and ${PTEST_PATH}<br=
>
folders, however some dependencies are only available in the site-packages<b=
r>
folder, so many test cases fail.<br>
At this point of the branch lifecycle I decided not to refactor the recipe, b=
ut<br>
rather to just use the installation in the site-packages dir to run the<br>
tests (switch to that folder in the run-ptest script)<br>
<br>
3. Fix the run-ptest script to output PASS/FAIL status.<br>
<br>
Signed-off-by: Gyorgy Sarvari &lt;<a href=3D"mailto:skandigraun@gmail.com" t=
arget=3D"_blank">skandigraun@gmail.com</a>&gt;<br>
---<br>
&nbsp;meta-python/recipes-devtools/python/python3-pint/run-ptest | 3 ++-<br>=

&nbsp;meta-python/recipes-devtools/python/<a href=3D"http://python3-pint_0.1=
9.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-pint_0.19.1.bb</a> | 6 +=
-----<br>
&nbsp;2 files changed, 3 insertions(+), 6 deletions(-)<br>
<br>
diff --git a/meta-python/recipes-devtools/python/python3-pint/run-ptest b/me=
ta-python/recipes-devtools/python/python3-pint/run-ptest<br>
index 5cec711696..6abbb5de73 100644<br>
--- a/meta-python/recipes-devtools/python/python3-pint/run-ptest<br>
+++ b/meta-python/recipes-devtools/python/python3-pint/run-ptest<br>
@@ -1,3 +1,4 @@<br>
&nbsp;#!/bin/sh<br>
<br>
-pytest<br>
+cd /usr/lib/python3*/site-packages/pint<br>
+pytest -o log_cli=3Dtrue -o log_cli_level=3DINFO | sed -e 's/\[...%\]//g'| s=
ed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'|=
 awk '{if ($NF=3D=3D"PASS" || $NF=3D=3D"FAIL" || $NF=3D=3D"SKIP" || $NF=3D=3D=
"XFAIL" || $NF=3D=3D"XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '=
{if ($NF=3D=3D"PASS" || $NF=3D=3D"FAIL" || $NF=3D=3D"SKIP" || $NF=3D=3D"XFAI=
L" || $NF=3D=3D"XPASS") {$NF=3D"";print $0}else{print}}'<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-p=
int_0.19.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-pint_0.19.1.bb</=
a> b/meta-python/recipes-devtools/python/<a href=3D"http://python3-pint_0.19=
.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-pint_0.19.1.bb</a><br>
index e1c471e064..4402908a35 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-pint_0.1=
9.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-pint_0.19.1.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-pint_0.1=
9.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-pint_0.19.1.bb</a><br>
@@ -27,9 +27,5 @@ RDEPENDS:${PN} +=3D " \<br>
<br>
&nbsp;RDEPENDS:${PN}-ptest +=3D " \<br>
&nbsp; &nbsp; &nbsp; &nbsp; ${PYTHON_PN}-pytest \<br>
+&nbsp; &nbsp; &nbsp; &nbsp; ${PYTHON_PN}-pytest-subtests \<br>
&nbsp;"<br>
-<br>
-do_install_ptest() {<br>
-&nbsp; &nbsp; &nbsp; &nbsp;install -d ${D}${PTEST_PATH}/testsuite<br>
-&nbsp; &nbsp; &nbsp; &nbsp;cp -rf ${S}/pint/testsuite/* ${D}${PTEST_PATH}/t=
estsuite/<br>
-}<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#120940): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/120940" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/120940</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/115918828/1997=
914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt/=
115918828/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/g=
/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>
</div></blockquote></body></html>=

--Apple-Mail-7587FF7C-26CC-409B-A4E9-9C2E889B3604--

