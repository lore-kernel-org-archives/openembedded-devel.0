Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id C568B78EC5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Aug 2018 16:43:13 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id r37-v6so18824148qtc.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Aug 2018 09:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=oCo0ACwNpYjdxraKFtdxK0Ka7yWUjLC4erjA/cbwysg=;
	b=ZHRafUzaCmOjDuI5/kp5SsERrfbQdyEZwx8s+H29ZuedowBI4qwhqQAEpxct8jsc/+
	MHxkHE8jguh1zH/huqUp7d62XQJzBzDrgFMiLrN50goWwZEloHeaelW8HRcv6YSr+vDN
	fcDbjitfVRvd3tymHQowQcAmIvjm4AQnXr+lX0a1oxsa2ACyOG6UOLpMUvouZ7RVteE6
	gSWPbGMv9zXX24zLb/KMh/D5BS4GMdZtqKDHoMzUf70OtRBapZTfiJwFTK94fMGJB1e6
	3uOmE5CI2iz1Jzgu06KZnScqiG4N7La6xktE/N76WdCsoXvIWMNMgK5sEGA6X80nQMoJ
	EGnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=oCo0ACwNpYjdxraKFtdxK0Ka7yWUjLC4erjA/cbwysg=;
	b=LfSARoYijJT6xY8gcLtss66ox6dvSna3lt3G05Rr0nfk+2y3hXwguHH6gokRVIHKJU
	/6zaCzAJeXN0cpvgo2LD9lFmaJTfrK0C7MDWlgNKMV5CJ6poko6hGWuea8llCuloAemA
	JJTMUj5H4WAVA5Bp+xoh8zHeEA3PEPxLCL69INrd5TpKZ9exyoIZA89sR9U7TkIip0uh
	oZhg+0sxVtaG0PQJkBaBiuu59eg+zB0Zd1gYOOUSmaSnpGhnarD62sYyXocuJ7RnWbYC
	5eVzng6ohKuseQcnXC6/DWd5mLmvRcIp5Iji6S7lcuXbRtPVZ+8n7FNcHyF1x3n1wTTW
	Bbgg==
X-Gm-Message-State: APzg51Csxken83P8xHJKWMuvLUcFg7TJelgH69BBt+qAzo20kykSjCEl
	ztI3X5KPTe0JevmDRnUjHRyiC0ukDf+SfQWjzVo=
X-Google-Smtp-Source: ANB0VdaHY3HchyjY90Bd7cs71wK7PPrGb3UFwGm1G7vv3n7chVlme/he76c5aqwEHeEG/gzz+7YpSqEojtOhpQZ9sJM=
X-Received: by 2002:aed:3848:: with SMTP id
	j66-v6mr14744514qte.218.1535388194440; 
	Mon, 27 Aug 2018 09:43:14 -0700 (PDT)
MIME-Version: 1.0
References: <20180827142738.18615-1-sno@netbsd.org>
	<20180827142738.18615-2-sno@netbsd.org>
In-Reply-To: <20180827142738.18615-2-sno@netbsd.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 27 Aug 2018 09:42:48 -0700
Message-ID: <CAMKF1srxejEKKqRiW5zsKcqRM_u5mhe8_sA0bS8DkKcaF2p3Og@mail.gmail.com>
To: sno@netbsd.org
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-perl][PATCH 2/2] libcrypt-openssl-rsa-perl: Update to 0.30
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
X-List-Received-Date: Mon, 27 Aug 2018 16:43:14 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 27, 2018 at 7:28 AM Jens Rehsack <sno@netbsd.org> wrote:
>
> Update recipe for CPAN hosted Perl5 module Crypt::OpenSSL::RSA
> from 0.28 to 0.30 to fix build issues when using openssl 1.1 and
> to express our love to the Perl Programming Language.
>
> Changes since 0.28: https://metacpan.org/changes/release/TODDR/Crypt-OpenSSL-RSA-0.30
>
> Signed-off-by: Jens Rehsack <sno@netbsd.org>
> ---
>  ...rsa-perl_0.28.bb => libcrypt-openssl-rsa-perl_0.30.bb} | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>  rename meta-perl/recipes-perl/libcrypt/{libcrypt-openssl-rsa-perl_0.28.bb => libcrypt-openssl-rsa-perl_0.30.bb} (64%)
>
> diff --git a/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.28.bb b/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.30.bb
> similarity index 64%
> rename from meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.28.bb
> rename to meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.30.bb
> index f0c610f3a..0a2ad8aa4 100644
> --- a/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.28.bb
> +++ b/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.30.bb
> @@ -1,14 +1,14 @@
>  SUMMARY = "Crypt Openssl RSA cpan module"
>  SECTION = "libs"
>  LICENSE = "Artistic-1.0 | GPL-1.0+"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=385c55653886acac3821999a3ccd17b3"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=a67ceecc5d9a91a5a0d003ba50c26346"
>

what changed to cause this ? may be mention it in
commit message

>  SRC_URI = "http://www.cpan.org/modules/by-module/Crypt/Crypt-OpenSSL-RSA-${PV}.tar.gz "
>
> -SRC_URI[md5sum] = "86217a5036fc63779c30420b5fd84129"
> -SRC_URI[sha256sum] = "5357f977464bb3a8184cf2d3341851a10d5515b4b2b0dfb88bf78995c0ded7be"
> +SRC_URI[md5sum] = "10bca2fc6d0ba1aa329f227424ae87d5"
> +SRC_URI[sha256sum] = "23e13531397af102db4fd24bcf70137add7c85c23cca697c43aa71c2959a29ac"
>
> -DEPENDS += "openssl"
> +DEPENDS += "libcrypt-openssl-guess-native openssl"
>
>  RDEPENDS_${PN}="libcrypt-openssl-random-perl"
>
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

