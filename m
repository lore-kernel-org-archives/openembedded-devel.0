Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web09.3673.1624331155582440043
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Jun 2021 20:05:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hX3JXR71;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id p9so1565398pgb.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 21 Jun 2021 20:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=gXtalScjKsFpXhoUQSSY3rx2z7cvzxvExAyi9Vx2kgs=;
        b=hX3JXR71H+UMecZ51qzqbYR1jhUDFqWKlRNTHvQeVQXt6ioems+tYzqppfXhXXjnDv
         f+eOsHzxzDIr/Ey5GM8oqdK2TE11XEVC+6CALJsatkgL32g7YS1lLG0Kw49zILuEOUhG
         9oTYnY6ceDR3zgbZ/d4N8SXfjaIY49HizKj72BvVZnbyzbQ8K0nXr9UhJi/eKHa6rd+E
         dD/Ihtc/xtGyWj+xYMySEd0pprjfWgM6ST3Q9QqmXFYv9ZhJUJI34jYbTVoHXQ9l4POV
         UBwLqkt5T6y2wUblz1hUNieiQEPogLZidwOFUGgT+OXve2Otic8g1ddi1ioevzPhO21y
         xS4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=gXtalScjKsFpXhoUQSSY3rx2z7cvzxvExAyi9Vx2kgs=;
        b=sw6PstLXmxkHMzsCv5wpfHjriObyzcVGZPclTaMt1p2I13G5uwEAnXII49/1OZKbdk
         PkFnj2xGKrIcPFdP+NVZiLsaMlMeciM8qqgIxLIrwP4Rk4r4n/z8C8IyAuNAEh4cpVzj
         qnQbS/6DUFmoOP+PgDUgz9xduwGlni10z1+VlUHYnsO0s4K2I3mdTdsvoDkruoWlC30v
         e1fcgh1RYlji/v5XEnP+G6Pq55ayiWiEvbrFoZ0x9qz9/pZ/+WhipGFoeEzsJ58wAuBs
         LEhIXCUPSqW76U+Vd2mFWVYMR4k149eobFGYvX13MMJqTUG0vr0kXUyQ4ddIo2Cv/AH5
         FzKA==
X-Gm-Message-State: AOAM533I+5zO/5Z7gpxGacgxmWY8jd7Nvd5tGFOHSg//hPvr1dzZ4GoZ
	aTBR+vpAHqjjHG2tHHbDfD4m7k56QbdERQ==
X-Google-Smtp-Source: ABdhPJy8aFKupRaRxV356ZlRjjjT0gN3WJrkqNyvnO3ZcmS4Be8zV56Pr37NGg+3Scp5WLwi2AnFuA==
X-Received: by 2002:a63:a80b:: with SMTP id o11mr1614138pgf.53.1624331154501;
        Mon, 21 Jun 2021 20:05:54 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:d102:fdcb:61de:2062? ([2601:646:9200:a0f0:d102:fdcb:61de:2062])
        by smtp.gmail.com with ESMTPSA id gd5sm537580pjb.45.2021.06.21.20.05.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jun 2021 20:05:54 -0700 (PDT)
Subject: Re: [oe] [meta-oe] [PATCH] samba: Solve the dependency problem when installing Samba
To: wangmy <wangmy@fujitsu.com>, openembedded-devel@lists.openembedded.org
References: <1624329198-77666-1-git-send-email-wangmy@fujitsu.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <496328be-0939-7a02-42c6-f23ea2a3849d@gmail.com>
Date: Mon, 21 Jun 2021 20:05:52 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1624329198-77666-1-git-send-email-wangmy@fujitsu.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 6/21/21 7:33 PM, wangmy wrote:
> Error Message:
>   Problem: conflicting requests
>    - nothing provides samba-pidl needed by samba-client-4.14.5-r0.aarch64
> 
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>   .../samba/samba_4.14.5.bb                     | 24 +++++++++++++++++--
>   1 file changed, 22 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-networking/recipes-connectivity/samba/samba_4.14.5.bb b/meta-networking/recipes-connectivity/samba/samba_4.14.5.bb
> index efaf4f2a15..e0a4f0a8c7 100644
> --- a/meta-networking/recipes-connectivity/samba/samba_4.14.5.bb
> +++ b/meta-networking/recipes-connectivity/samba/samba_4.14.5.bb
> @@ -39,7 +39,7 @@ SRC_URI[sha256sum] = "bb6ef5d2f16b85288d823578abc453d9a80514c42e5a2ea2c4e3c60dc4
>   
>   UPSTREAM_CHECK_REGEX = "samba\-(?P<pver>4\.14(\.\d+)+).tar.gz"
>   
> -inherit systemd waf-samba cpan-base perlnative update-rc.d
> +inherit systemd waf-samba cpan-base perlnative update-rc.d perl-version
>   
>   # CVE-2011-2411 is valnerble only on HP NonStop Servers.
>   CVE_CHECK_WHITELIST += "CVE-2011-2411"
> @@ -130,6 +130,19 @@ EXTRA_OECONF += "--enable-fhs \
>   
>   LDFLAGS += "-Wl,-z,relro,-z,now ${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
>   
> +do_configure_append () {
> +    cd ${S}/pidl/
> +    perl Makefile.PL PREFIX=${prefix}
> +    sed -e 's,VENDORPREFIX)/lib/perl,VENDORPREFIX)/${baselib}/perl,g' \
> +        -e 's,PERLPREFIX)/lib/perl,PERLPREFIX)/${baselib}/perl,g' -i Makefile
> +
> +}
> +
> +do_compile_append () {
> +    cd ${S}/pidl/
> +    make

can we call oe_runame -C ${S}/pidl perhaps not build it in source tree.

> +}
> +
>   do_install_append() {
>       for section in 1 5 7; do
>           install -d ${D}${mandir}/man$section
> @@ -195,6 +208,11 @@ do_install_append() {
>       if [ -f "${D}${bindir}/samba-tool" ]; then
>           sed -i -e 's,${PYTHON},/usr/bin/env python3,g' ${D}${bindir}/samba-tool
>       fi
> +
> +    cd ${S}/pidl/
> +    make DESTDIR=${D} install_vendor

same here call oe_runmake and perhaps no need to cd if above step works.

> +    rm -rf ${D}${libdir}/perl5/${PERLVERSION}/${BUILD_SYS}/perllocal.pod
> +    rm -rf ${D}${libdir}/perl5/vendor_perl/${PERLVERSION}/${BUILD_SYS}/auto/Parse/Pidl/.packlist
>       
>   }
>   
> @@ -301,7 +319,9 @@ FILES_smbclient = "${bindir}/cifsdd \
>                      ${libdir}/samba/smbspool_krb5_wrapper"
>   
>   RDEPENDS_${PN}-pidl_append = " perl"
> -FILES_${PN}-pidl = "${bindir}/pidl ${datadir}/perl5/Parse"
> +FILES_${PN}-pidl = "${bindir}/pidl \
> +                    ${libdir}/perl5 \
> +                   "
>   
>   RDEPENDS_${PN}-client = "\
>       smbclient \
> 
> 
> 
> 
> 
