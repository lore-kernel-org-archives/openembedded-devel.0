Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id 1A774770B3
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Oct 2015 02:27:18 +0000 (UTC)
Received: by igxx6 with SMTP id x6so8060881igx.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Oct 2015 19:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=3vJo0WX/HUPhPczAHFoQrDTxa40CsJJr79ztgazOJNA=;
	b=hSRRgNrJQGkPa2soZFhuzL++t3QSJ+L5UDayOH5uZW0hNbQL6WZTdjZrCN2KkMNALb
	+rI5oGgLsZrbr2Q4pa3PpFaV1OILuSQmk/ofT8QEeK8MWyHuUTsCngsVfAv8OO3PQfwd
	E0/12QikXVHZhXczPhvW8r5MdxwOciwVSDQflxfj/WIDSiOT35w0SeZg3CruoiDhSCtr
	5RozUCOdtPWihjBuq2iz5T0BdlskfM22Ofjy0tVaEl7xScpI6EHOLBBdP0Zih4y1bDcn
	hL4SoEhQwaKvS+Op92FjCKiEoLXCgzNxRTdozfgbbD7nE2uMI9EqQ6NpWZtrFAFkqB+k
	58pg==
X-Received: by 10.50.141.136 with SMTP id ro8mr2087154igb.11.1443752838410;
	Thu, 01 Oct 2015 19:27:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.142.130 with HTTP; Thu, 1 Oct 2015 19:26:49 -0700 (PDT)
In-Reply-To: <1443713428-8635-8-git-send-email-Martin.Jansa@gmail.com>
References: <20150918115458.GA11095@jama>
	<1443713428-8635-1-git-send-email-Martin.Jansa@gmail.com>
	<1443713428-8635-8-git-send-email-Martin.Jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 1 Oct 2015 19:26:49 -0700
Message-ID: <CAMKF1sojEbscxJ8hGQJ5vAES_QKd8C8TUhBtw_4_hdU+_Y6Qpw@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][meta-oe 08/10] elmdentica, azy: blacklist because they are old and fail to build with gcc-5
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 02 Oct 2015 02:27:21 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Oct 1, 2015 at 8:30 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> * they weren't migrated from E_SVN to git and updated in ages, I'm not interested
>   in maintaining them and nobody else volunteered to fix it
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-efl/recipes-efl/e17/elmdentica_svn.bb | 2 ++
>  meta-efl/recipes-efl/efl/azy_svn.bb        | 5 +++++
>  2 files changed, 7 insertions(+)
>
> diff --git a/meta-efl/recipes-efl/e17/elmdentica_svn.bb b/meta-efl/recipes-efl/e17/elmdentica_svn.bb
> index 20a4849..56a74c5 100644
> --- a/meta-efl/recipes-efl/e17/elmdentica_svn.bb
> +++ b/meta-efl/recipes-efl/e17/elmdentica_svn.bb
> @@ -19,3 +19,5 @@ SRCREV = "${EFL_SRCREV}"
>  RDEPENDS_${PN} = "${PN}-themes"
>
>  SRC_URI += "file://configure.patch"
> +
> +PNBLACKLIST[elmdentica] ?= "OLD and depends on broken azy"
> diff --git a/meta-efl/recipes-efl/efl/azy_svn.bb b/meta-efl/recipes-efl/efl/azy_svn.bb
> index 0c3c9d7..dec2475 100644
> --- a/meta-efl/recipes-efl/efl/azy_svn.bb
> +++ b/meta-efl/recipes-efl/efl/azy_svn.bb
> @@ -30,3 +30,8 @@ inherit efl
>  SRC_URI = "${E_SVN}/trunk/PROTO;module=${SRCNAME};protocol=http;scmdata=keep"
>  S = "${WORKDIR}/${SRCNAME}"
>
> +# azy/2_1.0.0+svnr82070-r2/azy/src/lib/extras/pugixml.cpp:33:
> +# sysroots/qemuarm/usr/include/c++/5.2.0/bits/basic_string.h:4780:5: error: reference to 'basic_string' is ambiguous

this is more serious problem. there seems to be two implementations of
string object. May be you should remove including string.h in
pugixml.cpp

> +#     basic_string<_CharT, _Traits, _Alloc>
> +#     ^
> +PNBLACKLIST[azy] ?= "OLD and doesn't build with gcc-5"
> --
> 2.6.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

