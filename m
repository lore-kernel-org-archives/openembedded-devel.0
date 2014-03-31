Return-Path: <ticotimo@gmail.com>
Received: from mail-lb0-f178.google.com (mail-lb0-f178.google.com
	[209.85.217.178])
	by mail.openembedded.org (Postfix) with ESMTP id 590A86F23F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Mar 2014 03:30:28 +0000 (UTC)
Received: by mail-lb0-f178.google.com with SMTP id s7so5309588lbd.37
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Mar 2014 20:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=oC6io9PDLHhqTRO98k3BPdZ0Y0ozIK2oIiQC387iFPI=;
	b=Tu0xlPkWAVvT+vMVhthKGdt7EaXb2O/G6n9VR54p0Uc6SzY++TiUK3kxymRkvqxIwD
	DDjch/+p4YTmFy8QzaPTTb3JjxgB7dPHU/plhH5s1a6MAN7NtAI3DuAW8H5opkOC5RHk
	sYo9rjjUU8eJJoyfgFdxlVAgfT3JcYS2Xg91lLxha6QgZY6HA8Fn5PtBanb20nGCB/cZ
	7XK7S8Q53Zqq9eYhig3N1K+DgrL1uenqtSIH4jDx7XAoMA5qg3eQEvqyy00y6TrhwGKA
	48qP1Hos0fs1oSfLRi2o1eM6MZxJQYE0a+qUus381vco9m+ft17tC8EDMBZT4EFpGXDm
	mRdA==
MIME-Version: 1.0
X-Received: by 10.112.52.225 with SMTP id w1mr16352048lbo.22.1396236628830;
	Sun, 30 Mar 2014 20:30:28 -0700 (PDT)
Received: by 10.114.191.202 with HTTP; Sun, 30 Mar 2014 20:30:28 -0700 (PDT)
In-Reply-To: <1391410275-31251-2-git-send-email-ticotimo@gmail.com>
References: <1391410275-31251-1-git-send-email-ticotimo@gmail.com>
	<1391410275-31251-2-git-send-email-ticotimo@gmail.com>
Date: Sun, 30 Mar 2014 20:30:28 -0700
Message-ID: <CANx9H-CJwYaWGe7y1kt7zLzgFTOumB=dy7BZMEf-5U=5L4=d1g@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-perl][PATCH v2 01/10] libmodule-metadata-perl: add 1.000019
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
X-List-Received-Date: Mon, 31 Mar 2014 03:30:32 -0000
Content-Type: text/plain; charset=ISO-8859-1

Yes. It updates the version built into perl. I will submit a patch with
insane skip.

--Tim


On Sun, Feb 2, 2014 at 10:51 PM, Tim Orling <ticotimo@gmail.com> wrote:

> [Description from CPAN]
> This module provides a standard way to gather metadata about a .pm file
> through (mostly) static analysis and (some) code execution. When
> determining the version of a module, the $VERSION assignment is "eval"ed,
> as is traditional in the CPAN toolchain.
>
> Signed-off-by: Tim Orling <ticotimo@gmail.com>
> ---
>  .../libmodule/libmodule-metadata-perl_1.000019.bb  |   33
> ++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 meta-perl/recipes-perl/libmodule/
> libmodule-metadata-perl_1.000019.bb
>
> diff --git a/meta-perl/recipes-perl/libmodule/
> libmodule-metadata-perl_1.000019.bb b/meta-perl/recipes-perl/libmodule/
> libmodule-metadata-perl_1.000019.bb
> new file mode 100644
> index 0000000..668f0c4
> --- /dev/null
> +++ b/meta-perl/recipes-perl/libmodule/libmodule-metadata-perl_1.000019.bb
> @@ -0,0 +1,33 @@
> +SUMMARY = "Module::Metadata - Gather package and POD information from
> perl module files"
> +DESCRIPTION = "This module provides a standard way to gather metadata
> about \
> +a .pm files through (mostly) static analysis and (some) code execution.
> When \
> +determining the version of a module, the $VERSION assignment is eval-ed,
> as \
> +is traditional in the CPAN toolchain."
> +SECTION = "libs"
> +
> +HOMEPAGE = "http://search.cpan.org/~ether/Module-Metadata/"
> +
> +LICENSE = "Artistic-1.0 | GPL-1.0+"
> +LIC_FILES_CHKSUM =
> "file://README;beginline=185;endline=190;md5=e1b24eebe5d819b40bb68ad06b72d3ee"
> +
> +SRC_URI = "
> http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/Module-Metadata-${PV}.tar.gz
> "
> +SRC_URI[md5sum] = "838ecf97f7daff79e0f81e104a6be823"
> +SRC_URI[sha256sum] =
> "5afca94dc0213608101ad519eb1b25133cdc9e44c2a053a45a5a59422c2ee554"
> +
> +S = "${WORKDIR}/Module-Metadata-${PV}"
> +
> +inherit cpan
> +
> +RDEPENDS_${PN} = " perl-module-io-file \
> +                   perl-module-data-dumper \
> +                   perl-module-extutils-makemaker \
> +                   perl-module-file-spec \
> +                   perl-module-version \
> +                   perl-module-exporter \
> +                   perl-module-carp \
> +                   perl-module-test-more \
> +                   perl-module-file-temp \
> +                   perl-module-file-path \
> +"
> +
> +BBCLASSEXTEND = "native"
> --
> 1.7.9.5
>
>

