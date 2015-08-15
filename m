Return-Path: <ticotimo@gmail.com>
Received: from mail-la0-f49.google.com (mail-la0-f49.google.com
	[209.85.215.49])
	by mail.openembedded.org (Postfix) with ESMTP id 5A6BF72A78
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Aug 2015 17:35:09 +0000 (UTC)
Received: by lagz9 with SMTP id z9so58827400lag.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Aug 2015 10:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Wsky8O8mgR8RIcFqNdD+Ye2WVyCgDyOaQSGuyk1qY9s=;
	b=bQHMLw6qEphGJbyl36NgzH2yps6wkQErNmVRRB8kkb2oU3SNSpVhrn59Bndlc4PCJd
	WZGsnGnhisC/9FoL+oc+uOoKYxutubbjPEnQZyVXr6vw0n1+RbYYCgarciHeMOLlLLXJ
	CrZsic0pNpWM1TX1UPtTy7Lliq/6zE0SThEjrsqOHhv+RRorN4wrrh3alOmY8/OD5PDI
	vbzCy+oDWcSMLif4S3hSWA5EDyQtzlhd7z6vX/p04vjtl0UIaG6kywJm7CoggzRhL2ZD
	pl3QRL4KNaV0fJwhPDSOpr/4+X53hcorKsRgPOB+Ydim8GybnYsKNThwgZARgvj9jgXq
	9jQA==
MIME-Version: 1.0
X-Received: by 10.152.36.102 with SMTP id p6mr48627651laj.19.1439660108236;
	Sat, 15 Aug 2015 10:35:08 -0700 (PDT)
Received: by 10.25.15.38 with HTTP; Sat, 15 Aug 2015 10:35:08 -0700 (PDT)
In-Reply-To: <1439519143-5659-1-git-send-email-TicoTimo@gmail.com>
References: <1439519143-5659-1-git-send-email-TicoTimo@gmail.com>
Date: Sat, 15 Aug 2015 10:35:08 -0700
Message-ID: <CANx9H-AnkMifMUNCi80n4w_D2QAHXLTZ9qzaAdZB8sfr=6D3rw@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-perl][PATCH] libencode-perl: add 2.76 recipe
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
X-List-Received-Date: Sat, 15 Aug 2015 17:35:10 -0000
Content-Type: text/plain; charset=UTF-8

[DO NOT MERGE]

This module is present in oe-core stock perl.
This recipe is not needed.

On Thu, Aug 13, 2015 at 7:25 PM, Tim Orling <ticotimo@gmail.com> wrote:

> * Based on v2.52 recipe:
>   Paul Eggleton <paul.eggleton@linux.intel.com>
>   http://github.com/bluelightning/public_bb_recipes
>
> * which is forked from:
>   Emil Petersen <erp@movis.dk>
>   http://github.com/EmilRP/public_bb_recipes
>
> Signed-off-by: Tim Orling <TicoTimo@gmail.com>
> ---
>  .../recipes-perl/libencode/libencode-perl_2.76.bb  | 54
> ++++++++++++++++++++++
>  1 file changed, 54 insertions(+)
>  create mode 100644 meta-perl/recipes-perl/libencode/
> libencode-perl_2.76.bb
>
> diff --git a/meta-perl/recipes-perl/libencode/libencode-perl_2.76.bb
> b/meta-perl/recipes-perl/libencode/libencode-perl_2.76.bb
> new file mode 100644
> index 0000000..9939962
> --- /dev/null
> +++ b/meta-perl/recipes-perl/libencode/libencode-perl_2.76.bb
> @@ -0,0 +1,54 @@
> +SUMMARY = "Encode - character encodings"
> +DESCRIPTION = "The \"Encode\" module provides the interfaces between \
> +Perl's strings and the rest of the system.  Perl strings are sequences \
> +of characters."
> +
> +AUTHOR = "Dan Kogai <dankogai+cpan@gmail.com>"
> +HOMEPAGE = "https://metacpan.org/release/Encode"
> +SECTION = "lib"
> +LICENSE = "Artistic-1.0 | GPL-1.0+"
> +LIC_FILES_CHKSUM = "file://META.json;md5=bb6a09a95259f80fbf2855c8f9dc3e85"
> +
> +SRC_URI = "${CPAN_MIRROR}/authors/id/D/DA/DANKOGAI/Encode-${PV}.tar.gz"
> +SRC_URI[md5sum] = "90ee2160d40ade6cc4c4aa1b1ff4745e"
> +SRC_URI[sha256sum] =
> "0fa01359d34d1d129e9bcacb0b9bb821e36e9fb5f1404cfb557dfa680368f265"
> +
> +S = "${WORKDIR}/Encode-${PV}"
> +
> +inherit cpan
> +
> +RDEPENDS_${PN} += " perl-module-bytes \
> +                    perl-module-constant \
> +                    perl-module-xsloader \
> +"
> +
> +RPROVIDES_${PN} += "libencode-alias-perl \
> +                    libencode-byte-perl \
> +                    libencode-cjkconstants-perl \
> +                    libencode-cn-perl \
> +                    libencode-cn-hz-perl \
> +                    libencode-config-perl \
> +                    libencode-ebcdic-perl \
> +                    libencode-encoder-perl \
> +                    libencode-encoding-perl \
> +                    libencode-gsm0338-perl \
> +                    libencode-guess-perl \
> +                    libencode-jp-perl \
> +                    libencode-jp-h2z-perl \
> +                    libencode-jp-jis7-perl \
> +                    libencode-kr-perl \
> +                    libencode-kr-2022_kr-perl \
> +                    libencode-mime-header-perl \
> +                    libencode-mime-name-perl \
> +                    libencode-symbol-perl \
> +                    libencode-tw-perl \
> +                    libencode-unicode--perl \
> +                    libencode-unicode-utf7-perl \
> +                    libencoding-perl \
> +                    libencode-internal-perl \
> +                    libencode-mime-header-iso_2022_jp-perl \
> +                    libencode-utf8-perl \
> +                    libencode-utf_ebcdic-perl \
> +                    "
> +
> +BBCLASSEXTEND = "native"
> --
> 2.1.0
>
>

