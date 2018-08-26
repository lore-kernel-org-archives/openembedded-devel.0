Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 50C6678E21
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 26 Aug 2018 12:16:05 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id f21-v6so5530633wmc.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 26 Aug 2018 05:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=p/UKy11AmjXp3K5EZKwYG0VOmrcYIItttEtp+5O8yGw=;
	b=FUoeFtR3MLKYRoRB0S3+FLraVKfFMkEWzbvZxqcRdCh/O3U69Hq7Y8GbZPUGFsTD/q
	GFfL/oG7rpFUVYyAgQIwVuOeODT4Phx0FB7QpAv18wjcsQQlMKSOjze9edhneJwYFLtX
	te86Zj4pZf1fnweTsrtJf9DQToSUT1twdnfgLHIXAGGJ+VgL4Llwx7dR041I29DF3ynO
	qixPhXg0MWYQYb+u1oQDupssNGWeIUTly4tB+0prXViPGFUQ6Ptd5UNiipax+NnlnEe/
	9F2bJK/j6CmX2O7ZrHBowaWilPEsJtzyAGzJe1f3WIi9ZW9TR8DOzcrK36N0ilad/mzr
	LyPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=p/UKy11AmjXp3K5EZKwYG0VOmrcYIItttEtp+5O8yGw=;
	b=Y6FyWm4HWpmhgWdWeZQVUrvTe4IPsIX19iS9wrnSZKP5clu4qMsDNaLAEFse7gulF+
	eUSYCh1L+tM6y9gySCGAi1jBfUqyVFCrKeQoTt8P+fbqb4NUBkrPqh5N2/13XcRZRIw7
	NWrscsPUCD4WjwFVGqRpTE9pk1yyKO28Bqw4nADj9UEjq2u8KD/Z3nOlpQW8V/asyGjg
	R09E5sJZYP1NYMdgYSlxLBHqNuqPJsSKP/AVISQclA7ZKxIM8nIp5arWAPC/Dab/X6rF
	kleI3dhBZCxa0qvGxnB0LJBUs3/FDBZT/ETmhgNoDQw+S9th4ttCBu22g5h6AUZB4LYw
	2qag==
X-Gm-Message-State: APzg51DF4XYcXj0+i9B7rjz8nwXp7kI6O6ZYpTwwxHRxhLiz1AZItlUP
	Hd5N1p2p2ZiSyME30EBMpmEj6C1b1YeB8rltSL8=
X-Google-Smtp-Source: ANB0Vdad9Yfc9T8M28bNVd8XZnOZHZj7/UeivvKzUDtpJXoj+15KdtRwY9tmCpmqTCNZV7SppQ4qGNx2BfdKoDmr8/o=
X-Received: by 2002:a1c:b441:: with SMTP id
	d62-v6mr3183841wmf.17.1535285765984; 
	Sun, 26 Aug 2018 05:16:05 -0700 (PDT)
MIME-Version: 1.0
References: <20180826045735.7732-1-yisooan@gmail.com>
	<CA+chaQeMuN4+wxyyA_jvJonCtSiLO614uWt7LqjvK3CwBeo2Lg@mail.gmail.com>
	<c25b4db3-f7c9-1de7-d5df-a9c6b9320168@gmail.com>
In-Reply-To: <c25b4db3-f7c9-1de7-d5df-a9c6b9320168@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 26 Aug 2018 14:15:54 +0200
Message-ID: <CA+chaQevzQwz6Yg2NDbRUeQh86P+6PUrMppzE1jCQis0_=J9uA@mail.gmail.com>
To: yisooan@gmail.com
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][morty][PATCH v2] libconfig: fix SRC_URI
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 26 Aug 2018 12:16:05 -0000
Content-Type: text/plain; charset="UTF-8"

Using git fetcher is fine, but don't use tag parameter nor tagname in
SRCREV, use git SHA which matches the tag in SRCREV.

Otherwise bitbake fetcher will still need to access then network every
single time to map tag name to git SHA used internally.

On Sun, Aug 26, 2018 at 1:34 PM Yi-Soo An <yisooan@gmail.com> wrote:

> Thank you for the email.
>
> I have a question.
>
> Since hyperrealm has moved to github and the library is maintained there.
> Is it better to replace the current SRC_URI with git? as below.
> SRC_URI = "git://github.com/hyperrealm/libconfig.git;tag=v1.5"
> archive seems to need extra information, like checksum.
>
> Best regards,
> Yi-Soo An
>
> On 08/26/2018 03:00 PM, Martin Jansa wrote:
> > Don't use github archives which are regenerated from time to time with
> > different checksum.
> >
> > To fix it in morty all newer release needs to be fixed as well and then
> > the fix backported to morty (or explained in commit message why the fix
> > is needed only for morty).
> >
> > On Sun, Aug 26, 2018 at 7:01 AM Yi-Soo An <yisooan@gmail.com
> > <mailto:yisooan@gmail.com>> wrote:
> >
> >     It causes a fetch error since hyperrealm has moved to github
> >     and the current SRC_URI is not available any longer.
> >
> >     To fix the error, use github repository.
> >
> >     Signed-off-by: Yi-Soo An <yisooan@gmail.com <mailto:
> yisooan@gmail.com>>
> >     ---
> >       meta-oe/recipes-extended/libconfig/libconfig_1.5.bb
> >     <http://libconfig_1.5.bb> | 8 ++++----
> >       1 file changed, 4 insertions(+), 4 deletions(-)
> >
> >     diff --git a/meta-oe/recipes-extended/libconfig/libconfig_1.5.bb
> >     <http://libconfig_1.5.bb>
> >     b/meta-oe/recipes-extended/libconfig/libconfig_1.5.bb
> >     <http://libconfig_1.5.bb>
> >     index fb6e50e51..a0b3a9471 100644
> >     --- a/meta-oe/recipes-extended/libconfig/libconfig_1.5.bb
> >     <http://libconfig_1.5.bb>
> >     +++ b/meta-oe/recipes-extended/libconfig/libconfig_1.5.bb
> >     <http://libconfig_1.5.bb>
> >     @@ -1,14 +1,14 @@
> >       SUMMARY = "C/C++ Configuration File Library"
> >       DESCRIPTION = "Library for manipulating structured configuration
> >     files"
> >     -HOMEPAGE = "http://www.hyperrealm.com/libconfig/"
> >     +HOMEPAGE = "https://hyperrealm.github.io/libconfig"
> >       SECTION = "libs"
> >
> >       LICENSE = "LGPLv2.1"
> >       LIC_FILES_CHKSUM =
> >     "file://COPYING.LIB;md5=fad9b3332be894bab9bc501572864b29"
> >
> >     -SRC_URI = "http://www.hyperrealm.com/${BPN}/${BP}.tar.gz
> >     <http://www.hyperrealm.com/$%7BBPN%7D/$%7BBP%7D.tar.gz>"
> >     +SRC_URI = "
> https://github.com/hyperrealm/libconfig/archive/v1.5.tar.gz"
> >
> >       inherit autotools-brokensep pkgconfig
> >
> >     -SRC_URI[md5sum] = "a939c4990d74e6fc1ee62be05716f633"
> >     -SRC_URI[sha256sum] =
> >     "e31daa390d8e4461c8830512fe2e13ba1a3d6a02a2305a02429eec61e68703f6"
> >     +SRC_URI[md5sum] = "e92a91c2ddf3bf77bea0f5ed7f09e492"
> >     +SRC_URI[sha256sum] =
> >     "cae5c02361d8a9b2bb26946c64f089d2e5e599972f386203fbc48975c0d885c8"
> >     --
> >     2.17.1
> >
> >     --
> >     _______________________________________________
> >     Openembedded-devel mailing list
> >     Openembedded-devel@lists.openembedded.org
> >     <mailto:Openembedded-devel@lists.openembedded.org>
> >     http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
>

