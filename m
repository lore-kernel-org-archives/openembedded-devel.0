Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE6C4C77B7A
	for <webhook@archiver.kernel.org>; Thu,  1 Jun 2023 23:55:48 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.web11.207.1685663740218330955
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Jun 2023 16:55:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=G+dcEd8P;
 spf=pass (domain: gmail.com, ip: 209.85.128.172, mailfrom: ticotimo@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-5664b14966bso15887757b3.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 01 Jun 2023 16:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685663739; x=1688255739;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EgKuDA5eYztdNLMTmGkYX08mhJR598tHunYtEws0klw=;
        b=G+dcEd8Pqctt8NiFhmueYnlt/TIzuKb+ClrNuqTRIIKhI6nnBdsDZq/CNT2p0rU30t
         ta6/rY5fytd4HmfEzVJK1lRCEGJvuNs5uMmI70HBGUQ5KxmmHg8Ph0Y/5F8Jptn4Is4A
         rnlQxaeVn53lFEEetvSeOMZCmojjKIHj0pVjo9IysCmgXtJ8zLtFuuNUnZ4quJ7CMv8r
         y1LKItfyvfWr6PYRFeskAPnUeNfOLt2Qnim6uYRheIUI4OI7tQFgH989SGJ27iODvbxR
         s32AfapeuJbM/jBoA54wlQQldSVLP2XLQyhxvej/34U1UefTRtLoSXl5BSW4qOXXr5IF
         A2NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685663739; x=1688255739;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EgKuDA5eYztdNLMTmGkYX08mhJR598tHunYtEws0klw=;
        b=K/2Nko1P4obYwyeVFrvqsLpl9kbxBm8eByPUKcsqIh4uku9iviL1MtDMWWUTk04ZQq
         M8jfiQYSHCXOwfDtYqmpd5WG8cnu2W9n1a0Imi7oguRDAA75PcnTOegFfCARTS+H9PFm
         2Cne3GZ3XzIEaN/IxD0J2xu5AgIj3kVwz0NuqSBi3ppGvtc4I2dOfTFlthKwag2Vj5pC
         iGF58lwRUwkxxOQJUewLPmo4LHYOEcnx8xV7FSR4mzQiThyiqeVgetMWcdgzme3qQqNp
         LIbonFi1MZfAF83GPMKsQ/EG3WAALe90SSG9LLwfIbtjod0CMjI/uTZalhnEPjXR57gA
         vaVg==
X-Gm-Message-State: AC+VfDy/fDunbnrkmpfdXOKrvY6N6CF/rSyg3+zo0vaCra6KXSDpjjH0
	Xj7QobR+gWvC537cUhqLU1+Np788uQFrUGQGBeA=
X-Google-Smtp-Source: ACHHUZ6h/I3cdwr5uIFklo/dYpD88XIFfAgw670K/iwUvfpuSH5zHUc4v1ZxSR3qIRG9vP4rpcs0iVZZFeQFmEUcQRg=
X-Received: by 2002:a0d:dd48:0:b0:569:2c16:2596 with SMTP id
 g69-20020a0ddd48000000b005692c162596mr3014267ywe.23.1685663739000; Thu, 01
 Jun 2023 16:55:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230531100257.3467702-1-narpat.mali@windriver.com> <20054ea6-97a5-c28f-efbc-ffd862b82032@windriver.com>
In-Reply-To: <20054ea6-97a5-c28f-efbc-ffd862b82032@windriver.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Thu, 1 Jun 2023 16:55:28 -0700
Message-ID: <CANx9H-Cx=P1hMNezmaH8EUvwx753egb-1Edn0FBHSb9t3G=yWA@mail.gmail.com>
Subject: Re: [oe] [meta-python][kirkstone][PATCH 1/1] python3-django: upgrade
 4.0.2 -> 4.2.1
To: randy.macleod@windriver.com
Cc: Armin Kuster <akuster808@gmail.com>, "Reyna, David" <david.reyna@windriver.com>, 
	hari.gpillai@windriver.com, narpat.mali@windriver.com, 
	openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000005fb8e905fd1a2ccc"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Jun 2023 23:55:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103090

--0000000000005fb8e905fd1a2ccc
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 1, 2023 at 8:52 AM Randy MacLeod via lists.openembedded.org
<randy.macleod=windriver.com@lists.openembedded.org> wrote:

> On 2023-05-31 06:02, Narpat Mali via lists.openembedded.org wrote:
>
> From: Narpat Mali <narpat.mali@windriver.com> <narpat.mali@windriver.com>
>
> Django 4.2* is designated as a long-term support release. It will receive
> security updates for at least three years after its release.
>
> The delta between 4.0.2 and 4.2.1 contain numerous CVEs and other
> bugfixes.
>
>
Please send a v2 with a link to the changelog. We really need to make it
easier for reviewers and stable maintainers.

Please also include the date range that 4.2 will be supported.

You can look in the git history for commits from myself and Trevor Gamblin
for what is expected.

Thanks Narpat.
>
> Also I spoke with David Reyna about this and he suggested that
> the 4.x version was added mainly for Toaster support. David
> agreed that updating to 4.2 LTS would work for me.
>
> Right David?
>
> ../Randy
>
>
> Release Notes: https://docs.djangoproject.com/en/dev/releases/
>
> Signed-off-by: Narpat Mali <narpat.mali@windriver.com> <narpat.mali@windriver.com>
> ---
>  .../python/{python3-django_4.0.2.bb => python3-django_4.2.1.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-python/recipes-devtools/python/{python3-django_4.0.2.bb => python3-django_4.2.1.bb} (77%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-django_4.0.2.bb b/meta-python/recipes-devtools/python/python3-django_4.2.1.bb
> similarity index 77%
> rename from meta-python/recipes-devtools/python/python3-django_4.0.2.bb
> rename to meta-python/recipes-devtools/python/python3-django_4.2.1.bb
> index 690b9809dc..4daca65eb5 100644
> --- a/meta-python/recipes-devtools/python/python3-django_4.0.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-django_4.2.1.bb
> @@ -1,7 +1,7 @@
>  require python-django.inc
>  inherit setuptools3
>
> -SRC_URI[sha256sum] = "110fb58fb12eca59e072ad59fc42d771cd642dd7a2f2416582aa9da7a8ef954a"
> +SRC_URI[sha256sum] = "7efa6b1f781a6119a10ac94b4794ded90db8accbe7802281cd26f8664ffed59c"
>
>  RDEPENDS:${PN} += "\
>      ${PYTHON_PN}-sqlparse \
>
>
>
> --
> # Randy MacLeod
> # Wind River Linux
>
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#103080):
> https://lists.openembedded.org/g/openembedded-devel/message/103080
> Mute This Topic: https://lists.openembedded.org/mt/99238868/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000005fb8e905fd1a2ccc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Jun 1, 2023 at 8:52 AM Randy MacLeod via <a href=3D=
"http://lists.openembedded.org">lists.openembedded.org</a> &lt;randy.macleo=
d=3D<a href=3D"mailto:windriver.com@lists.openembedded.org">windriver.com@l=
ists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
">

 =20
  <div>
    <div>On 2023-05-31 06:02, Narpat Mali via
      <a href=3D"http://lists.openembedded.org" target=3D"_blank">lists.ope=
nembedded.org</a> wrote:<br>
    </div>
    <blockquote type=3D"cite">
      <pre>From: Narpat Mali <a href=3D"mailto:narpat.mali@windriver.com" t=
arget=3D"_blank">&lt;narpat.mali@windriver.com&gt;</a>

Django 4.2* is designated as a long-term support release. It will receive
security updates for at least three years after its release.

The delta between 4.0.2 and 4.2.1 contain numerous CVEs and other
bugfixes.</pre>
    </blockquote>
    <p></p></div></blockquote><div dir=3D"auto"><br></div><div dir=3D"auto"=
>Please send a v2 with a link to the changelog. We really need to make it e=
asier for reviewers and stable maintainers.</div><div dir=3D"auto"><br></di=
v><div dir=3D"auto">Please also include the date range that 4.2 will be sup=
ported.</div><div dir=3D"auto"><br></div><div dir=3D"auto">You can look in =
the git history for commits from myself and Trevor Gamblin for what is expe=
cted.</div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div>=
<p dir=3D"auto">Thanks Narpat.<br>
    </p>
    <p>Also I spoke with David Reyna about this and he suggested that<br>
      the 4.x version was added mainly for Toaster support. David<br>
      agreed that updating to 4.2 LTS would work for me.<br>
    </p>
    <p>Right David?</p>
    <p>../Randy<br>
    </p>
    <blockquote type=3D"cite">
      <pre>
Release Notes: <a href=3D"https://docs.djangoproject.com/en/dev/releases/" =
target=3D"_blank">https://docs.djangoproject.com/en/dev/releases/</a>

Signed-off-by: Narpat Mali <a href=3D"mailto:narpat.mali@windriver.com" tar=
get=3D"_blank">&lt;narpat.mali@windriver.com&gt;</a>
---
 .../python/{<a href=3D"http://python3-django_4.0.2.bb" target=3D"_blank">p=
ython3-django_4.0.2.bb</a> =3D&gt; <a href=3D"http://python3-django_4.2.1.b=
b" target=3D"_blank">python3-django_4.2.1.bb</a>} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{<a href=3D"http://python3-djan=
go_4.0.2.bb" target=3D"_blank">python3-django_4.0.2.bb</a> =3D&gt; <a href=
=3D"http://python3-django_4.2.1.bb" target=3D"_blank">python3-django_4.2.1.=
bb</a>} (77%)

diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
django_4.0.2.bb" target=3D"_blank">python3-django_4.0.2.bb</a> b/meta-pytho=
n/recipes-devtools/python/<a href=3D"http://python3-django_4.2.1.bb" target=
=3D"_blank">python3-django_4.2.1.bb</a>
similarity index 77%
rename from meta-python/recipes-devtools/python/<a href=3D"http://python3-d=
jango_4.0.2.bb" target=3D"_blank">python3-django_4.0.2.bb</a>
rename to meta-python/recipes-devtools/python/<a href=3D"http://python3-dja=
ngo_4.2.1.bb" target=3D"_blank">python3-django_4.2.1.bb</a>
index 690b9809dc..4daca65eb5 100644
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-django_=
4.0.2.bb" target=3D"_blank">python3-django_4.0.2.bb</a>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-django_=
4.2.1.bb" target=3D"_blank">python3-django_4.2.1.bb</a>
@@ -1,7 +1,7 @@
 require python-django.inc
 inherit setuptools3
=20
-SRC_URI[sha256sum] =3D &quot;110fb58fb12eca59e072ad59fc42d771cd642dd7a2f24=
16582aa9da7a8ef954a&quot;
+SRC_URI[sha256sum] =3D &quot;7efa6b1f781a6119a10ac94b4794ded90db8accbe7802=
281cd26f8664ffed59c&quot;
=20
 RDEPENDS:${PN} +=3D &quot;\
     ${PYTHON_PN}-sqlparse \
</pre>
      <br>
      <fieldset></fieldset>
      <pre>
</pre>
    </blockquote>
    <p><br>
    </p>
    <pre cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </div>

<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#103080): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/103080" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/103080</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/99238868/9247=
29" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt/=
99238868/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" targ=
et=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000005fb8e905fd1a2ccc--

