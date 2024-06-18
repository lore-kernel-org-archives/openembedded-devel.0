Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDBBCC27C79
	for <webhook@archiver.kernel.org>; Tue, 18 Jun 2024 01:42:09 +0000 (UTC)
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
 by mx.groups.io with SMTP id smtpd.web10.76413.1718674929544590295
 for <Openembedded-devel@lists.openembedded.org>;
 Mon, 17 Jun 2024 18:42:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lmyfzi/q;
 spf=pass (domain: gmail.com, ip: 209.85.161.43, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-5b9706c84e5so2849934eaf.1
        for <Openembedded-devel@lists.openembedded.org>; Mon, 17 Jun 2024 18:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718674929; x=1719279729; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JW6y8E1GHAAdLBRsGZpUsY/Pjci6HvRiivOQBYOrypA=;
        b=lmyfzi/qgYjlNU8VgZpo6ctn0TRrZLSlX+nmcszQsfIr+wu7C0bFCg5Py6N5bQOlxY
         TjNCHTZWr1WA/vLKQjC9zAZPd1+IpknL9qPWuXpqJZ+8auQVV8lNyc0nq2rdY6irPAaP
         Ke5vOH0kx6/rEKA8SKDVznaAwP1R8lFzF0s8WfQdGFIFjW4mqk78uCSSxbGm2xxlomOz
         3Q10R35VfXw7YplSu6XTDCsV+kZ+TKCsr1hrBHJrlNVsOcsSS76y6QWaC8MGGws77Ymg
         8EIdsJYUBIVNLvx1ODDz0+QW0eLguUfQVI7oZ5OWIO5xqgl2/dBdxDGkaYCXu8bd+EmY
         y61g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718674929; x=1719279729;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JW6y8E1GHAAdLBRsGZpUsY/Pjci6HvRiivOQBYOrypA=;
        b=ZBPtV2WQ6a/oKJKGlz9d2ZBPW4u0lcrozIsoc5hdxyZ/DEm6UPOHd7FdnP+uq5vjrU
         KXd1Jnh3zlej4nj9VNo1L+gSBXE8aCI8twa8QL2QdSYdGr1+PzO/NtK9pu3kCOlCN8CV
         BlOLkt7O0bquqKOCWEs+TtGfR71XDSo3QmvbACNBHH1yengUqQdvrXbd79jOqHpl3Ngt
         Kz8PKNXZdIg8kezB6Rg69x9rJh1ngDtPZm4vyk10PEdlRtuew91f62uUozLJtDwqjki3
         AN0726pV9poOdg6OPY2SAQ62az+5W2pyTospDlS9DcbNymXT/gBy47hCyeAPF8gV40QX
         i6Pw==
X-Gm-Message-State: AOJu0YzF5fCkx7GT75v+q2kYy99w3Z3caYkACQqhr/yjVtC7uH9q8G4G
	S0bsdosIRDSFpCdrQnunWB/u3sIR5pqCPCTkgi17bRREK82Q992TG67QSFxOECwWZJlxawbE5YD
	YP1iTVxLqP2al9LOuieS+Mj6swpk=
X-Google-Smtp-Source: AGHT+IFdXC/z/pIyHAkGPWgQESyYK3nGDdnMnq59kbotQu5vTv3Ife2nAR0E7cctzCLA5b+0HCO8jv6NUuJi5LP6/o4=
X-Received: by 2002:a05:6870:2187:b0:254:b24e:e351 with SMTP id
 586e51a60fabf-25842b8356cmr12181065fac.59.1718674928692; Mon, 17 Jun 2024
 18:42:08 -0700 (PDT)
MIME-Version: 1.0
References: <20240618005203.2022725-1-rs@ti.com>
In-Reply-To: <20240618005203.2022725-1-rs@ti.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 17 Jun 2024 18:41:57 -0700
Message-ID: <CAMKF1spyT0tUjE8=ojmWNV+5Gz-QYrUUepoTKSRwoa2YNkqTtw@mail.gmail.com>
Subject: Re: [meta-oe][master][PATCH] vulkan-cts: add workaround for createMeshShaderMiscTestsEXT
To: rs@ti.com
Cc: Openembedded-devel@lists.openembedded.org, afd@ti.com, denis@denix.org, 
	detheridge@ti.com, reatmon@ti.com
Content-Type: multipart/alternative; boundary="0000000000009bf461061b20307f"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Jun 2024 01:42:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110949

--0000000000009bf461061b20307f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 17, 2024 at 5:52=E2=80=AFPM <rs@ti.com> wrote:

> From: Randolph Sapp <rs@ti.com>
>
> Remove the CXX flag "-O2" for GCC 13 and 14. There's a bug with ARM GCC
> that breaks the iteration of "types" in the createMeshShaderMiscTestsEXT
> function. This issue is not present for clang or x86_64 GCC 14.
>
> It seems that the array is not initialized before the first iteration.
> In testing this can result in a random value being used. This can
> manifest in LINES type being processed twice, resulting in the following
> error:
>
> FATAL ERROR: Failed to initialize dEQP: Test case with non-unique name
> 'no_lines' added to group 'misc'.
>
> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
>  meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.7.3.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.7.3.bb
> b/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.7.3.bb
> index 1008a5fd4..7492fe9aa 100644
> --- a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.7.3.bb
> +++ b/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.7.3.bb
> @@ -23,6 +23,9 @@ SRC_URI +=3D
> "file://0001-cmake-Define-WAYLAND_SCANNER-and-WAYLAND_PROTOCOLS_D.pat
>
>  TOOLCHAIN =3D "gcc"
>
> +# Workaround an optimization bug that breaks createMeshShaderMiscTestsEX=
T
> +OECMAKE_CXX_FLAGS:remove:toolchain-gcc =3D "-O2"


Let=E2=80=99s limit it to arm
And gcc using the needed overrides

>
> +
>  S =3D "${WORKDIR}/git"
>
>  REQUIRED_DISTRO_FEATURES =3D "vulkan"
> --
> 2.45.1
>
>

--0000000000009bf461061b20307f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Jun 17, 2024 at 5:52=E2=80=AFPM &lt;<a href=3D"mail=
to:rs@ti.com">rs@ti.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex">From: Randolph Sapp &lt;<a href=3D"mailto:rs@ti.com" target=3D"_blank">=
rs@ti.com</a>&gt;<br>
<br>
Remove the CXX flag &quot;-O2&quot; for GCC 13 and 14. There&#39;s a bug wi=
th ARM GCC<br>
that breaks the iteration of &quot;types&quot; in the createMeshShaderMiscT=
estsEXT<br>
function. This issue is not present for clang or x86_64 GCC 14.<br>
<br>
It seems that the array is not initialized before the first iteration.<br>
In testing this can result in a random value being used. This can<br>
manifest in LINES type being processed twice, resulting in the following<br=
>
error:<br>
<br>
FATAL ERROR: Failed to initialize dEQP: Test case with non-unique name<br>
&#39;no_lines&#39; added to group &#39;misc&#39;.<br>
<br>
Signed-off-by: Randolph Sapp &lt;<a href=3D"mailto:rs@ti.com" target=3D"_bl=
ank">rs@ti.com</a>&gt;<br>
---<br>
=C2=A0meta-oe/recipes-graphics/vk-gl-cts/<a href=3D"http://vulkan-cts_1.3.7=
.3.bb" rel=3D"noreferrer" target=3D"_blank">vulkan-cts_1.3.7.3.bb</a> | 3 +=
++<br>
=C2=A01 file changed, 3 insertions(+)<br>
<br>
diff --git a/meta-oe/recipes-graphics/vk-gl-cts/<a href=3D"http://vulkan-ct=
s_1.3.7.3.bb" rel=3D"noreferrer" target=3D"_blank">vulkan-cts_1.3.7.3.bb</a=
> b/meta-oe/recipes-graphics/vk-gl-cts/<a href=3D"http://vulkan-cts_1.3.7.3=
.bb" rel=3D"noreferrer" target=3D"_blank">vulkan-cts_1.3.7.3.bb</a><br>
index 1008a5fd4..7492fe9aa 100644<br>
--- a/meta-oe/recipes-graphics/vk-gl-cts/<a href=3D"http://vulkan-cts_1.3.7=
.3.bb" rel=3D"noreferrer" target=3D"_blank">vulkan-cts_1.3.7.3.bb</a><br>
+++ b/meta-oe/recipes-graphics/vk-gl-cts/<a href=3D"http://vulkan-cts_1.3.7=
.3.bb" rel=3D"noreferrer" target=3D"_blank">vulkan-cts_1.3.7.3.bb</a><br>
@@ -23,6 +23,9 @@ SRC_URI +=3D &quot;file://0001-cmake-Define-WAYLAND_SCANN=
ER-and-WAYLAND_PROTOCOLS_D.pat<br>
<br>
=C2=A0TOOLCHAIN =3D &quot;gcc&quot;<br>
<br>
+# Workaround an optimization bug that breaks createMeshShaderMiscTestsEXT<=
br>
+OECMAKE_CXX_FLAGS:remove:toolchain-gcc =3D &quot;-O2&quot;</blockquote><di=
v dir=3D"auto"><br></div><div dir=3D"auto">Let=E2=80=99s limit it to arm</d=
iv><div dir=3D"auto">And gcc using the needed overrides=C2=A0</div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex" dir=3D"auto"><br>
+<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
=C2=A0REQUIRED_DISTRO_FEATURES =3D &quot;vulkan&quot;<br>
-- <br>
2.45.1<br>
<br>
</blockquote></div></div>

--0000000000009bf461061b20307f--

