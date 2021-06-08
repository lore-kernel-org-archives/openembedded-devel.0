Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web12.9040.1623134847859685459
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Jun 2021 23:47:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bkWBSxQi;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id k25so25276548eja.9
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Jun 2021 23:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YDlfieAUgPsWGi/3Rswe2QYE/Xi9w9PiLqjoi4ab+Jw=;
        b=bkWBSxQixzerpt4PlaykN2A7W7tuSIrmJDY/PcbRKX6EPA8wbxMq1atHdHWJFHPxlJ
         IXuHaHQLnfAvcsayyx2tO/Efhyiaxfd9kJUN8mV1BPjG47zqz0JUza1h2fFwq1yMoAUd
         g9IDkqA5lpNntTmQY7LzvqlXFBBYsLFMNFPzwaql+Fwsl5f9RK7HFanOFTqeCX9Hrg8m
         dj4etSb/7CUV1WOPCkm/itBxblH8mSbB7maHlvDsLm7a//nIMtyEDcTZrri2lKPx9pvz
         947k5PtsoTGegzy8Pf7MWd/gJ9Oz6WynXHldwAQ1SKrp+/09s80FvE7XZoN6PmTdTDxy
         +95g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YDlfieAUgPsWGi/3Rswe2QYE/Xi9w9PiLqjoi4ab+Jw=;
        b=QdqHZ+m4wsH+t0ldVzHY74ZN6HRaXrS3FQk50GZtucGaFX3OWJoLxZjIa3VxuGsk2E
         m78pwvPWHt38NRXK+tHGCWY9u9DgQru365iDmaZTmsl7+RfFiTbSZDd1158EUQ9GgMpD
         2WF6c2n1Jatqpx6JLbYw/jOWDvhN7MbJ+OOSh+IDYYiM10oboq7sOji+XlJ8Q6YfMa7f
         rpGdNWvLwtsPU7JmpMk1zAIemcUXdJb4KQlmXemIMI5+xsNhYXopGFx3yPUVRkiidhal
         kmqQV/HjnRHQRcSTYz5mB5I+ckcBVm+6tam1rzObNePUNycifB1dY9s1Wbpabivnt/+K
         WMsw==
X-Gm-Message-State: AOAM533cFauWRh3n535NhqPXAM4fUUP2Gx1CxU+26P8vYjKDGsVmq7S/
	3ahg9dZObHqvE04sNGmx//bZ0EBRAuYesxlkAGE=
X-Google-Smtp-Source: ABdhPJynzVr5vzwv8Rgp7uw+aUxexrnOrtJ7zdy85cst2GUC2rqLttQ3w1vmaCGGnprfHr3XdLjD/ExVaTp/QZN4cbg=
X-Received: by 2002:a17:906:d97:: with SMTP id m23mr21761882eji.392.1623134846103;
 Mon, 07 Jun 2021 23:47:26 -0700 (PDT)
MIME-Version: 1.0
References: <1623128523-11804-1-git-send-email-akash.hadke@kpit.com>
In-Reply-To: <1623128523-11804-1-git-send-email-akash.hadke@kpit.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Tue, 8 Jun 2021 08:47:15 +0200
Message-ID: <CA+chaQfoc-hp_kvh=8FzGHW5Sgxk1mG7E-=hAbD_HML4NzsLPQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][dunfell][PATCH] meta-oe/conf/layer.conf: depend on meta-python
To: akash hadke <akash.hadke@kpit.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	Nisha Parrakat <nisha.parrakat@kpit.com>, 
	Harpritkaur Bhandari <harpritkaur.bhandari@kpit.com>, Mikko Rapeli <mikko.rapeli@bmw.de>
Content-Type: multipart/alternative; boundary="000000000000ecb27705c43b875a"

--000000000000ecb27705c43b875a
Content-Type: text/plain; charset="UTF-8"

NAK meta-oe cannot depend on meta-python, fix your ostree change to respect
both PTEST_ENABLED and BBFILES_COLLECTIONS.

And more importantly make sure that all these changes you're proposing for
dunfell are already merged in master and if you believe that they are
specific only for dunfell, then you will need to explain it in the commit
message.

On Tue, Jun 8, 2021 at 7:04 AM akash hadke <akash.hadke@kpit.com> wrote:

> From: Mikko Rapeli <mikko.rapeli@bmw.de>
>
> Fixes yocto-layers-check error:
>
> ERROR: Nothing RPROVIDES 'python3-pyyaml' (but
> /home/builder/src/base/meta-openembedded/meta-oe/recipes-extended/ostree/
> ostree_2020.3.bb
>  RDEPENDS on or otherwise requires it)
> NOTE: Runtime target 'python3-pyyaml' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['python3-pyyaml']
> ERROR: Required build target 'meta-world-pkgdata' has no buildable
> providers.
> Missing or unbuildable dependency chain was: ['meta-world-pkgdata',
> 'ostree', 'python3-pyyaml']
>
> Summary: There were 2 ERROR messages shown, returning a non-zero exit code.
>
> Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
> Signed-off-by: akash hadke <akash.hadke@kpit.com>
> ---
>  meta-oe/conf/layer.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
> index adcec83..efdd04a 100644
> --- a/meta-oe/conf/layer.conf
> +++ b/meta-oe/conf/layer.conf
> @@ -34,7 +34,7 @@
> perl-layer:${LAYERDIR}/dynamic-layers/perl-layer/recipes-*/*/*.bb \
>  # cause compatibility issues with other layers
>  LAYERVERSION_openembedded-layer = "1"
>
> -LAYERDEPENDS_openembedded-layer = "core"
> +LAYERDEPENDS_openembedded-layer = "core meta-python"
>
>  LAYERSERIES_COMPAT_openembedded-layer = "thud warrior zeus dunfell"
>
> --
> 2.7.4
>
>
> 
>
>

--000000000000ecb27705c43b875a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">NAK meta-oe cannot depend on meta-python, fix your ostree =
change to respect both PTEST_ENABLED and BBFILES_COLLECTIONS.<div><br></div=
><div>And more importantly make sure that all these changes you&#39;re prop=
osing for dunfell are already merged in master and if you believe that they=
 are specific only for dunfell, then you will need to explain it in the com=
mit message.</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Tue, Jun 8, 2021 at 7:04 AM akash hadke &lt;<a href=3D=
"mailto:akash.hadke@kpit.com">akash.hadke@kpit.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">From: Mikko Rapeli &lt;<a=
 href=3D"mailto:mikko.rapeli@bmw.de" target=3D"_blank">mikko.rapeli@bmw.de<=
/a>&gt;<br>
<br>
Fixes yocto-layers-check error:<br>
<br>
ERROR: Nothing RPROVIDES &#39;python3-pyyaml&#39; (but /home/builder/src/b=
ase/meta-openembedded/meta-oe/recipes-extended/ostree/<a href=3D"http://ost=
ree_2020.3.bb" rel=3D"noreferrer" target=3D"_blank">ostree_2020.3.bb</a><br=
>
=C2=A0RDEPENDS on or otherwise requires it)<br>
NOTE: Runtime target &#39;python3-pyyaml&#39; is unbuildable, removing...<=
br>
Missing or unbuildable dependency chain was: [&#39;python3-pyyaml&#39;]<br=
>
ERROR: Required build target &#39;meta-world-pkgdata&#39; has no buildable=
 providers.<br>
Missing or unbuildable dependency chain was: [&#39;meta-world-pkgdata&#39;=
, &#39;ostree&#39;, &#39;python3-pyyaml&#39;]<br>
<br>
Summary: There were 2 ERROR messages shown, returning a non-zero exit code=
.<br>
<br>
Signed-off-by: Mikko Rapeli &lt;<a href=3D"mailto:mikko.rapeli@bmw.de" tar=
get=3D"_blank">mikko.rapeli@bmw.de</a>&gt;<br>
Signed-off-by: akash hadke &lt;<a href=3D"mailto:akash.hadke@kpit.com" tar=
get=3D"_blank">akash.hadke@kpit.com</a>&gt;<br>
---<br>
=C2=A0meta-oe/conf/layer.conf | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf<br>
index adcec83..efdd04a 100644<br>
--- a/meta-oe/conf/layer.conf<br>
+++ b/meta-oe/conf/layer.conf<br>
@@ -34,7 +34,7 @@ perl-layer:${LAYERDIR}/dynamic-layers/perl-layer/recipes=
-*/*/*.bb \<br>
=C2=A0# cause compatibility issues with other layers<br>
=C2=A0LAYERVERSION_openembedded-layer =3D &quot;1&quot;<br>
<br>
-LAYERDEPENDS_openembedded-layer =3D &quot;core&quot;<br>
+LAYERDEPENDS_openembedded-layer =3D &quot;core meta-python&quot;<br>
<br>
=C2=A0LAYERSERIES_COMPAT_openembedded-layer =3D &quot;thud warrior zeus du=
nfell&quot;<br>
<br>
-- <br>
2.7.4<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000ecb27705c43b875a--
