Return-Path: <raj.khem@gmail.com>
Received: from mail-qe0-f54.google.com (mail-qe0-f54.google.com
	[209.85.128.54])
	by mail.openembedded.org (Postfix) with ESMTP id 4E382610FF
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Sep 2013 15:54:32 +0000 (UTC)
Received: by mail-qe0-f54.google.com with SMTP id cy11so2191738qeb.41
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Sep 2013 08:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=0bIZD8xPt/pjwPEC2aEbJd809JHlmxSeKkL1aWNecEY=;
	b=ytKskECOPvFvtMx75+7JJlNeD652ikwiQ+DpSVsd5PIXe/e3y2oR/PhU15yYO5UddD
	H8pbXhmieoQlwc9KqEXC7s2Ygvwm5oGhqIpvVaHyfyvtLc+8uY6n8h0tM6IgDrP6Ol5E
	iko/DkGsDoZYkUOa6Gl+65iqhZEj2l3cVOI+N8sMl/lpWowKaDnp75MqHw8Rrd13s9oR
	2GaB4LZNGES2STkceH28ohy6LxuJz6wVE/LS6lJ6yCpwP6+BRBcYhHALnWs8M3yuCcov
	TtW6dLsbl0oML8iGRmWiZOCRrlKMc0G46SkQjzLu+ZOKBdbgJfslAdG/8rZl3SKYRqvd
	gUWA==
MIME-Version: 1.0
X-Received: by 10.224.37.6 with SMTP id v6mr2298285qad.121.1379951673900; Mon,
	23 Sep 2013 08:54:33 -0700 (PDT)
Received: by 10.224.10.201 with HTTP; Mon, 23 Sep 2013 08:54:33 -0700 (PDT)
In-Reply-To: <1379928007-28803-1-git-send-email-b40290@freescale.com>
References: <1379928007-28803-1-git-send-email-b40290@freescale.com>
Date: Mon, 23 Sep 2013 08:54:33 -0700
Message-ID: <CAMKF1sr9M5FYEC0xPZMgHnBOCdBPEOxLFO9RghbvPAiGnZWK8A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-networking][PATCH 3/3] barnyard: add recipe
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
X-List-Received-Date: Mon, 23 Sep 2013 15:54:33 -0000
Content-Type: text/plain; charset=UTF-8

On Monday, September 23, 2013,  <b40290@freescale.com> wrote:
> From: Chunrong Guo <B40290@freescale.com>
>
>   *Barnyard is a output system for Snort
>
> Signed-off-by: Chunrong Guo <B40290@freescale.com>
> ---
>  .../barnyard/barnyard_0.2.0.bb                     |   19
+++++++++++++++++++
>  1 files changed, 19 insertions(+), 0 deletions(-)
>  create mode 100644 meta-networking/recipes-connectivity/barnyard/
barnyard_0.2.0.bb
>
> diff --git a/meta-networking/recipes-connectivity/barnyard/
barnyard_0.2.0.bb b/meta-networking/recipes-connectivity/barnyard/
barnyard_0.2.0.bb
> new file mode 100644
> index 0000000..c5e0e78
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/barnyard/barnyard_0.2.0.bb
> @@ -0,0 +1,19 @@
> +DESCRIPTION = "Barnyard is a output system for Snort."
> +HOMEPAGE = "http://www.snort.org/"
> +LICENSE = "QPL"
> +LIC_FILES_CHKSUM =
"file://LICENSE.QPL;md5=1b8ff8c0012b5a2d647357699bf44b41"
> +
> +DEPENDS = "libpcap"
> +
> +SRC_URI = " ${GENTOO_MIRROR}/${BP}.tar.gz;name=tarball \
> +          "
> +SRC_URI[tarball.md5sum] = "be3283028cf414b52b220308ceb411e9"
> +SRC_URI[tarball.sha256sum] =
"09e0f8e095e79cfe70ea069d13e7d02521a504a1f400a45556a634dccfd31a3a"
> +
> +inherit autotools pkgconfig
> +
> +do_configure_prepend () {
> +       #fix hardcoded include path
> +       sed -i -e 's:extra_incl=-I/usr/include/pcap::g' ${S}/configure.in
> +}

instead of wiping it out completely change it to =/usr/include/pcap

something like that could also be submitted upstream
> +
> --
> 1.7.5.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

