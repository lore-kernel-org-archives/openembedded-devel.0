Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web11.13097.1587062152175845700
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Apr 2020 11:35:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dHQyshAK;
 spf=pass (domain: gmail.com, ip: 209.85.222.193, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f193.google.com with SMTP id j4so22382192qkc.11
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Apr 2020 11:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=enh4o1+D41qXQE6v5UgSudenJxlJCiwzXcZJ7Vvi0gY=;
        b=dHQyshAKU0AWktGUVxYqZDmzSAppL6+u2uuWL1hVQU0Pg0nvbsVjC8lIgmxV/Q5iba
         xBMrucBM4JtQkdyAvlM8af+/+chVZ2oR3ZeuUiGZKEH4OmCFJQg5S6bZoArYIv5ufi48
         deugWTU92FqYHidV7NeXG5DyaDh2IJDeZOQBceKUbtgwIbKEpib0NKEbMisJyXFhP4YP
         WF5KhXzx+U2rinHFDoHvm+QmAptX4W7iahrYkhPO0OWaRytTMFFC6BgCYVeu1DDoWFCS
         yBoXNKAf+rNlqZP61t3Zaxj6n5SQktPzxbETOR+eHmbC6tY0ymsML4al3Gli8s6LtMPz
         xrTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=enh4o1+D41qXQE6v5UgSudenJxlJCiwzXcZJ7Vvi0gY=;
        b=um4obC9GOegV/5LSrFeKY55dd95OA2H0tCT6v9cQFSMK6mls2d9Luep/njsi/UeD+E
         YTOvxdooJTLtBcv4goLLJE1Twsj+Xia+SsZgUJSdHRzm/obVC+85heCxJiiq0XO2R+Zd
         41vtI0VQI+1cjTKA0zgYLABLZrFN0gh7KEpbOhF6GG8J4P8rzZ0MqxrgCPQBLKQA5WBF
         FGrWcOgO4/nzRHOOu/zVOQs5kbP10wBvbUxE1fuI9zchsE7teIFym6RS28FmpyNMC970
         1XQVvM+vf/HV7D2y97Iu4NfCxjLnFqs0ng8ZlJo6jtuaLkZhmm9l4aCicfGyHybnEKq8
         P2Fg==
X-Gm-Message-State: AGi0PuZluhAYngb1oGRa0PJY9JYM3aFLFWEIa76p2GMlHm9npqlwzuss
	T4uuAGeZJ8ZfDf7e7WOcVuquEOb5tu5xdmBqYOg=
X-Google-Smtp-Source: APiQypITiceu+eAzgJ2DHFrTKsifaVdfJ/z1B4D67B1NrEaUrnBcpRH06rfb2sh3eyr82GC9Srg5E2DJRCjJNHM3H34=
X-Received: by 2002:a05:620a:16aa:: with SMTP id s10mr8566901qkj.225.1587062150931;
 Thu, 16 Apr 2020 11:35:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200416102923.27122-1-Haseeb_Ashraf@mentor.com> <20200416102923.27122-2-Haseeb_Ashraf@mentor.com>
In-Reply-To: <20200416102923.27122-2-Haseeb_Ashraf@mentor.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 16 Apr 2020 11:35:24 -0700
Message-ID: <CAMKF1sq1nqJG54j0UMKpwQL_OGDQPNaRRao-9LyoVY+ok6Y0yQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 2/2] luaposix: add 33.4.0 version recipe which is compatible with lua5.3
To: Haseeb Ashraf <haseeb_ashraf@mentor.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

this is showing

QA Issue: luaposix: SRC_URI uses unstable GitHub archives [src-uri-bad]

so please use a release artifact or use git fetcher which is pinned to
particular release

On Thu, Apr 16, 2020 at 3:29 AM Haseeb Ashraf <haseeb_ashraf@mentor.com> wrote:
>
> Signed-off-by: Haseeb Ashraf <Haseeb_Ashraf@mentor.com>
> ---
>  .../luaposix/luaposix_33.4.0.bb               | 21 +++++++++++++++++++
>  1 file changed, 21 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/luaposix/luaposix_33.4.0.bb
>
> diff --git a/meta-oe/recipes-devtools/luaposix/luaposix_33.4.0.bb b/meta-oe/recipes-devtools/luaposix/luaposix_33.4.0.bb
> new file mode 100644
> index 000000000..869181848
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/luaposix/luaposix_33.4.0.bb
> @@ -0,0 +1,21 @@
> +DESCRIPTION = "luaposix is a POSIX binding for Lua."
> +LICENSE = "MIT"
> +HOMEPAGE = "https://github.com/luaposix/luaposix"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=7dd2aad04bb7ca212e69127ba8d58f9f"
> +
> +SRC_URI[md5sum] = "b36ff049095f28752caeb0b46144516c"
> +SRC_URI[sha256sum] = "e66262f5b7fe1c32c65f17a5ef5ffb31c4d1877019b4870a5d373e2ab6526a21"
> +
> +DEPENDS += "lua-native lua"
> +
> +SRC_URI = "https://github.com/luaposix/luaposix/archive/release-v${PV}.tar.gz"
> +S = "${WORKDIR}/luaposix-release-v${PV}"
> +LUA_VDIR = "5.3"
> +
> +inherit autotools pkgconfig
> +
> +do_install() {
> +    oe_runmake 'DESTDIR=${D}' 'luadir=${datadir}/lua/${LUA_VDIR}' 'luaexecdir=${libdir}/lua/${LUA_VDIR}' install
> +}
> +
> +FILES_${PN} = "${datadir}/lua/${LUA_VDIR} ${libdir}/lua/${LUA_VDIR}"
> --
> 2.17.1
>
> 
