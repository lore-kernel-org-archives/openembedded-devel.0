Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web12.11828.1599886171634020570
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Sep 2020 21:49:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IHqfegzc;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id y1so1579676pgk.8
        for <openembedded-devel@lists.openembedded.org>; Fri, 11 Sep 2020 21:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language;
        bh=n+SSG1VQtrVCm1kK05/YmhBbwOzWSiwP4nLPNyE+LwE=;
        b=IHqfegzcoYD9hl2Q0G5voI9WRxZTzDweJxx0MtOyhrVBuA34OCO633B810BEXOEQn6
         SGT1K3aarvuO22Jn0qpRyRQa/b2HoE05xknyS28mgBJWIuyTryLTVjjyVESceFoEC8hU
         i0tMWOohCLlUt+JSaKwMzbFaZCSH5AEQQ1Cd1y5bYH3cwSN4QzJ3Gtg2jgXhh7m/CxYJ
         TniMtDAvczU1TzvkVrCyPX1nUWxu+6C/O5EcfZs3TYNs4pCDVrVYkYHrxMEMZ223IILN
         7lT1/CxTQlYSXNR6Zad/KB8lAhzyBt5MZCUomTQHj9YABrXNVs68PvzNHLnYBaV/VtPX
         M/Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language;
        bh=n+SSG1VQtrVCm1kK05/YmhBbwOzWSiwP4nLPNyE+LwE=;
        b=tk30XBkZx7BrhX8V9jSrYq4GcZsXTL1nODpHE3FuvywzcvjG+tArvGtiemLaHgcNy9
         CDQxIB3cx1sxiXIl6+5od3YFny2ZS9zfMoVnmgeXqvY8Z3r209C8N4o7GdYL9GiMxAlE
         IjznaMx47nqGEMrQAF96Eyrw5qU6oagOp7BHeD8h+cjK9Z4HM2Ge1IeDxAaGD+mt+qOp
         qw+ouw5MHd3w0IY6HSSDrWomXDpSjrTxxJWqjvR6jubUDYfwnz+mwU/1/tzGwbXv28ss
         qJsnWVgW/4khjZT6x5wNx+2KP3czpp3bFsD+MXw9OZiep2ExFLxRY69wtUm1We7bbrVo
         fq8w==
X-Gm-Message-State: AOAM532qAyDqR5fQT6DF2vVqAreDJzp85rOwrgL1NCJfWQsY2kzjHP2X
	MQCPFObIzPPfOq831MGi5EI=
X-Google-Smtp-Source: ABdhPJxetvbh9lhKA2pIT1GxM1a1MtD0rWTmqwNycEhlg2hGnXMjKv3mqy9iRG8lQhbUPO60EAo6zA==
X-Received: by 2002:a63:5966:: with SMTP id j38mr3911216pgm.187.1599886171007;
        Fri, 11 Sep 2020 21:49:31 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0::2dcb? ([2601:646:9200:4e0::2dcb])
        by smtp.gmail.com with ESMTPSA id q193sm3837652pfq.127.2020.09.11.21.49.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2020 21:49:30 -0700 (PDT)
Subject: Re: [oe] [meta-oe][PATCH 1/1] luajit: advance SRCREV to fix two CVE's
To: Joe Slater <joe.slater@windriver.com>,
 "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
Cc: "MacLeod, Randy" <Randy.MacLeod@windriver.com>
References: <16314ABFB8306B25.8972@lists.openembedded.org>
 <BY5PR11MB39926180521D6CA4F1A98A9D88240@BY5PR11MB3992.namprd11.prod.outlook.com>
From: "Khem Raj" <raj.khem@gmail.com>
X-Pep-Version: 2.0
Organization: HIMVIS LLC
Message-ID: <ac6084ed-0e65-3cd3-6f6f-c0dcc02dc677@gmail.com>
Date: Fri, 11 Sep 2020 21:49:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <BY5PR11MB39926180521D6CA4F1A98A9D88240@BY5PR11MB3992.namprd11.prod.outlook.com>
X-Groupsio-MsgNum: 87018
Content-Type: multipart/mixed;
 boundary="------------98B70DC85FA80CC9E4CBE8C7"
Content-Language: en-US

--------------98B70DC85FA80CC9E4CBE8C7
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable



On 9/11/20 3:06 PM, Joe Slater wrote:
> No comments on this?   I do not see it has been accepted.     Joe

Thanks for reminder, there was a comment I made

https://lists.openembedded.org/g/openembedded-devel/topic/76607300#86861

patchwork also noticed it.

https://patchwork.openembedded.org/patch/176016/

>=20
> -----Original Message-----
> From: openembedded-devel@lists.openembedded.org <openembedded-devel@list=
s.openembedded.org> On Behalf Of Joe Slater
> Sent: Thursday, September 3, 2020 6:58 AM
> To: openembedded-devel@lists.openembedded.org
> Cc: Slater, Joseph <joe.slater@windriver.com>; MacLeod, Randy <Randy.Mac=
Leod@windriver.com>
> Subject: [oe] [meta-oe][PATCH 1/1] luajit: advance SRCREV to fix two CVE=
's
>=20
> Fix CVE-2020-15890 and CVE-2020-24372.
>=20
> Also change PV format because the reference to 2.1.0-beta3 was already f=
ar behind the SRCREV.  Now, base PV on the branch name and date of SRCREV c=
ommit.
>=20
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---
>  meta-oe/recipes-devtools/luajit/luajit_git.bb | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-oe/recipes-devtools/luajit/luajit_git.bb b/meta-oe/rec=
ipes-devtools/luajit/luajit_git.bb
> index cc9039416..820722195 100644
> --- a/meta-oe/recipes-devtools/luajit/luajit_git.bb
> +++ b/meta-oe/recipes-devtools/luajit/luajit_git.bb
> @@ -3,13 +3,15 @@ LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3Dd739bb9250a55c124a545b588f=
d76771"
>  HOMEPAGE =3D "http://luajit.org"
>  
> -PV =3D "2.1.0~beta3"
> -SRCREV =3D "0ad60ccbc3768fa8e3e726858adf261950edbc22"
>  SRC_URI =3D "git://luajit.org/git/luajit-2.0.git;protocol=3Dhttp;branch=
=
=3Dv2.1 \
>             file://0001-Do-not-strip-automatically-this-leaves-the-strip=
ping.patch \
>             file://clang.patch \
>             "
>  
> +# Set PV to the branch and date associated with SRCREV.
> +PV =3D "v2.1-200809"
> +SRCREV =3D "94d4abcca966df2cc423e821bcacd04898f73117"
> +
>  S =3D "${WORKDIR}/git"
>  
>  inherit pkgconfig binconfig siteinfo
> --
> 2.17.1
>=20
>=20
>=20
>=20

--------------98B70DC85FA80CC9E4CBE8C7
Content-Type: application/pgp-keys;
 name="pEpkey.asc"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="pEpkey.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
=3Dsj8j
-----END PGP PUBLIC KEY BLOCK-----

--------------98B70DC85FA80CC9E4CBE8C7--
