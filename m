Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web10.7511.1628076031644245201
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Aug 2021 04:20:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gHc7ndsK;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id go31so3173994ejc.6
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Aug 2021 04:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HWWSa2350vxm8b99EWVf462YoWOI1sa+PqPMOuw9avU=;
        b=gHc7ndsKo1ADyXvYs0t2T2iOSENaRnIocPXP129LCneC2v2EXquS0Dr37CIwgBXkox
         VRlRJGMbJuxsBkhlOiJ9V0IvsU/XAJPJVNUZ+Rn6PFOVjyuZf91MeAeuQ78t9AF30HRz
         +UDKPJ4vSHf0yE7/16vPHCQsoo57AwpdlcmPU2Kn4bS2TVMqVqDLfNrvlfJztNmLUfUP
         o+VMglAUswZDoDW6LXpQKucYp/3mg2gilMCTZ7w0xibbhMYJ+BwExLUV1reVDXcJj4jd
         H4y8j33Xgvlv04XiVYkTK+yjy1LywhMv3gEv6S/PvT3NWkVIJDdW7aoOchnWA8R5OiBC
         zE9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HWWSa2350vxm8b99EWVf462YoWOI1sa+PqPMOuw9avU=;
        b=Mjq505mr0rGOwq7otsxgT04Sx47wMn163/QsZJj+jEs+aOgnnClVlII2sdhiElUQwx
         fvYBmsAU3FRnRHTa+FESZ1PALprwZQ3J/V+hP/oYAMgfFqDWa1ixU7qICyMHi85jvCzR
         zqQ32ZEfmKSnnO4upm/6MR7cxW3ipSd0q6YeIDX7E5v2EPiqfir330xrzOYMc86PgEP2
         +iidsJKidXdWQbEpLFRCceYQaoJGwgqUl4rz06dXIWHlkzpiVKb9FmXeU6RdpeKUCtUW
         ikDJup2UhHyBpOgF/20OZt+NXraoYPBDJPY+80RY3M0KoFV19yE2hKlGVyT0UuzN6VUB
         9QYQ==
X-Gm-Message-State: AOAM531hCar7tcB//ppvgAQQRmyMOs5PgAiUY9JYVtU1ntw4EnEP9Y45
	Bs851DoSvDVYik8cwIz4qOs8oOWN67mMdfLJIig=
X-Google-Smtp-Source: ABdhPJzMlQAqsdSsDT3GcAz9DwOj1L3zAY95O85K5nmGE2ry6Po3OvaBOfWaMh88HXW/IdoblHLjaYGogYkpWl3qKsE=
X-Received: by 2002:a17:907:990d:: with SMTP id ka13mr25626732ejc.392.1628076029851;
 Wed, 04 Aug 2021 04:20:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210802090220.10668-1-liuxiwei@inspur.com>
In-Reply-To: <20210802090220.10668-1-liuxiwei@inspur.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Wed, 4 Aug 2021 13:20:19 +0200
Message-ID: <CA+chaQcXRTcsY9wz1qgr9PAo=dZzHZQbnqVJFMtNJ+3JK1zwiA@mail.gmail.com>
Subject: Re: [oe][meta-security][PATCH] meta: Fix typos
To: George Liu <liuxiwei1013@gmail.com>
Cc: Yocto-mailing-list <yocto@lists.yoctoproject.org>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	akuster808 <akuster808@gmail.com>, sergio.prado@toradex.com, 
	George Liu <liuxiwei@inspur.com>
Content-Type: multipart/alternative; boundary="0000000000006d3f3b05c8b9fdeb"

--0000000000006d3f3b05c8b9fdeb
Content-Type: text/plain; charset="UTF-8"

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

On Mon, Aug 2, 2021 at 11:02 AM George Liu <liuxiwei1013@gmail.com> wrote:

> Fix the variable spelling errors
> s/SKIP_META_SECUIRTY_SANITY_CHECK/SKIP_META_SECURITY_SANITY_CHECK
>
> Signed-off-by: George Liu <liuxiwei@inspur.com>
> ---
>  classes/sanity-meta-security.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/classes/sanity-meta-security.bbclass
> b/classes/sanity-meta-security.bbclass
> index b6c6b9c..f9e2698 100644
> --- a/classes/sanity-meta-security.bbclass
> +++ b/classes/sanity-meta-security.bbclass
> @@ -1,7 +1,7 @@
>  addhandler security_bbappend_distrocheck
>  security_bbappend_distrocheck[eventmask] = "bb.event.SanityCheck"
>  python security_bbappend_distrocheck() {
> -    skip_check = e.data.getVar('SKIP_META_SECUIRTY_SANITY_CHECK') == "1"
> +    skip_check = e.data.getVar('SKIP_META_SECURITY_SANITY_CHECK') == "1"
>      if 'security' not in e.data.getVar('DISTRO_FEATURES').split() and not
> skip_check:
>          bb.warn("You have included the meta-security layer, but \
>  'security' has not been enabled in your DISTRO_FEATURES. Some bbappend
> files \
> --
> 2.30.2
>
>
> 
>
>

--0000000000006d3f3b05c8b9fdeb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Acked-by:=C2=A0Martin Jansa &lt;<a href=3D"mailto:Martin.J=
ansa@gmail.com">Martin.Jansa@gmail.com</a>&gt;</div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Aug 2, 2021 at 11:02 =
AM George Liu &lt;<a href=3D"mailto:liuxiwei1013@gmail.com">liuxiwei1013@gm=
ail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">Fix the variable spelling errors<br>
s/SKIP_META_SECUIRTY_SANITY_CHECK/SKIP_META_SECURITY_SANITY_CHECK<br>
<br>
Signed-off-by: George Liu &lt;<a href=3D"mailto:liuxiwei@inspur.com" targe=
t=3D"_blank">liuxiwei@inspur.com</a>&gt;<br>
---<br>
=C2=A0classes/sanity-meta-security.bbclass | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/classes/sanity-meta-security.bbclass b/classes/sanity-meta-se=
curity.bbclass<br>
index b6c6b9c..f9e2698 100644<br>
--- a/classes/sanity-meta-security.bbclass<br>
+++ b/classes/sanity-meta-security.bbclass<br>
@@ -1,7 +1,7 @@<br>
=C2=A0addhandler security_bbappend_distrocheck<br>
=C2=A0security_bbappend_distrocheck[eventmask] =3D &quot;bb.event.SanityCh=
eck&quot;<br>
=C2=A0python security_bbappend_distrocheck() {<br>
-=C2=A0 =C2=A0 skip_check =3D e.data.getVar(&#39;SKIP_META_SECUIRTY_SANITY=
_CHECK&#39;) =3D=3D &quot;1&quot;<br>
+=C2=A0 =C2=A0 skip_check =3D e.data.getVar(&#39;SKIP_META_SECURITY_SANITY=
_CHECK&#39;) =3D=3D &quot;1&quot;<br>
=C2=A0 =C2=A0 =C2=A0if &#39;security&#39; not in e.data.getVar(&#39;DISTRO=
_FEATURES&#39;).split() and not skip_check:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.warn(&quot;You have included the meta=
-security layer, but \<br>
=C2=A0&#39;security&#39; has not been enabled in your DISTRO_FEATURES. Som=
e bbappend files \<br>
-- <br>
2.30.2<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--0000000000006d3f3b05c8b9fdeb--
