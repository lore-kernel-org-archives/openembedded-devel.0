Received: from mail-vk1-f196.google.com (mail-vk1-f196.google.com [209.85.221.196])
 by mx.groups.io with SMTP id smtpd.web10.5934.1592864224527753265
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Jun 2020 15:17:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ji6btz+e;
 spf=pass (domain: gmail.com, ip: 209.85.221.196, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f196.google.com with SMTP id d5so4338655vkb.12
        for <openembedded-devel@lists.openembedded.org>; Mon, 22 Jun 2020 15:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=whaTXgbn8OL3oNTqbuwy1BMJRySvCm9rC2plhGX4DE0=;
        b=Ji6btz+e9qYLlWjdc7uWTfQzbHRUodQDUI3sZnwMZ9y6kQUHM3Pls3zIJBTQkyjGaF
         ICnNEGcMFCpXkpbdcPlkQcGVLzxw70+AAViVhESa0tbkxxaztJ39SK+DHodhfSvFGK8T
         arBzXuCTA9Orh03L2RMb0IKhThrMniWe2jN5vLK0gHGZS8ZxL1uB30PHVsMyD2/WLTsN
         zdLNhU/aJa08lSpQHXMSWDbLk0GKNkApk5QfJ3V9uMpzwvoXNyC4qNCYdlTXvCm/WRwn
         x+RZrbRJjW0uT4Cs8pgoqJ9kEcSn2ON2pAeamOPrX7egAw0HPEmqVcsiOduWbekMagUk
         Ri5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=whaTXgbn8OL3oNTqbuwy1BMJRySvCm9rC2plhGX4DE0=;
        b=EZOcDOGHnhuVKn2nUiThN6e2ZekUWfiVr0MVHEvLqUW+nY9ayBi5u4uPovpYX7PmAQ
         fvlmdXLFnU6yKy3CweZIM5ln1Vgs+h5LqHWy+Em5iRmwxPSCKIcg9efKCtWtF2kKeFAM
         AHXgwAUtFGK55wW0M6WLgWNDSK4eqoU+42QQXolN6UCmV8+noBnnswj2s/GYLPXNdAIB
         G4ZnVPl9+tCyw+xmDV+Oa119752MOld7/52943YfmBanwpsycBfdGJd38Y8FFq0QV/pN
         8HV3RRs3yYZmiX3sk6NzaNJH42Ve9Zh00FNXATvdxzePGeb0kMzXCffQmKmc9r7G3Eq2
         PS3w==
X-Gm-Message-State: AOAM530nxQ16bETEzsX2h96gpJ0SA9xA7trp/u49xlXAdD5877Gt88Yx
	Yu9BU0gkC715b96x5hrtiiyyhQTxodC94x0SbcY=
X-Google-Smtp-Source: ABdhPJzJYaVf2EuDTE0IgYAekqI03p2he3/h3xn6VkhXJY3rodYkBnY3LxBoasJr7uVXgMc96GPAUDnDJz27EIDw/Ww=
X-Received: by 2002:a1f:19cd:: with SMTP id 196mr17495827vkz.0.1592864223612;
 Mon, 22 Jun 2020 15:17:03 -0700 (PDT)
MIME-Version: 1.0
References: <1592863740-4473-1-git-send-email-chandana.kalluri@xilinx.com>
In-Reply-To: <1592863740-4473-1-git-send-email-chandana.kalluri@xilinx.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 23 Jun 2020 00:16:51 +0200
Message-ID: <CANNYZj-irMbwZptvXfiT047fNwzzgK98z04kLoDRAO=aPM1xKA@mail.gmail.com>
Subject: Re: [oe] [meta-browser][PATCH] chromium.inc: Use python3native.bbclass instead of pythonnative.bbclass
To: Chandana kalluri <ckalluri@xilinx.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>, 
	Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
Content-Type: multipart/alternative; boundary="00000000000039523b05a8b39a02"

--00000000000039523b05a8b39a02
Content-Type: text/plain; charset="UTF-8"

Wait, did you actually test this? Chromium is not yet ready for python3,
and builds will fail.

Alex

On Tue, 23 Jun 2020 at 00:09, Chandana kalluri <ckalluri@xilinx.com> wrote:

> From dunfell onwards, python2 recipes and classes are not supported.
> Inherit
> python3native.bbclass for chromium instead of pythonnative.bbclass
>
> Signed-off-by: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
> ---
>  recipes-browser/chromium/chromium.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-browser/chromium/chromium.inc
> b/recipes-browser/chromium/chromium.inc
> index 14d762f..a483ec4 100644
> --- a/recipes-browser/chromium/chromium.inc
> +++ b/recipes-browser/chromium/chromium.inc
> @@ -18,7 +18,7 @@ TOOLCHAIN = "clang"
>  # to build the native recipes (e.g. GN) with clang too.
>  TOOLCHAIN_class-native = "clang"
>
> -inherit pythonnative setuptools
> +inherit python3native setuptools
>
>  # Chromium itself is licensed under the 3-clause BSD license. However, it
>  # depends upon several other projects whose copyright files are listed in
> --
> 2.7.4
>
> 
>

--00000000000039523b05a8b39a02
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Wait, did you actually test this? Chromium is not yet=
 ready for python3, and builds will fail.</div><div><br></div><div>Alex<br>=
</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_=
attr">On Tue, 23 Jun 2020 at 00:09, Chandana kalluri &lt;<a href=3D"mailto:=
ckalluri@xilinx.com" target=3D"_blank">ckalluri@xilinx.com</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">From dunfell onwa=
rds, python2 recipes and classes are not supported. Inherit<br>
python3native.bbclass for chromium instead of pythonnative.bbclass<br>
<br>
Signed-off-by: Sai Hari Chandana Kalluri &lt;<a href=3D"mailto:chandana.ka=
lluri@xilinx.com" target=3D"_blank">chandana.kalluri@xilinx.com</a>&gt;<br>
---<br>
=C2=A0recipes-browser/chromium/chromium.inc | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/recipes-browser/chromium/chromium.inc b/recipes-browser/chrom=
ium/chromium.inc<br>
index 14d762f..a483ec4 100644<br>
--- a/recipes-browser/chromium/chromium.inc<br>
+++ b/recipes-browser/chromium/chromium.inc<br>
@@ -18,7 +18,7 @@ TOOLCHAIN =3D &quot;clang&quot;<br>
=C2=A0# to build the native recipes (e.g. GN) with clang too.<br>
=C2=A0TOOLCHAIN_class-native =3D &quot;clang&quot;<br>
<br>
-inherit pythonnative setuptools<br>
+inherit python3native setuptools<br>
<br>
=C2=A0# Chromium itself is licensed under the 3-clause BSD license. Howeve=
r, it<br>
=C2=A0# depends upon several other projects whose copyright files are list=
ed in<br>
-- <br>
2.7.4<br>
<br>
<br>
</blockquote></div>

--00000000000039523b05a8b39a02--
