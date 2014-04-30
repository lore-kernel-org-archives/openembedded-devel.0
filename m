Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f43.google.com (mail-yh0-f43.google.com
	[209.85.213.43])
	by mail.openembedded.org (Postfix) with ESMTP id 2821365D9C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Apr 2014 15:28:53 +0000 (UTC)
Received: by mail-yh0-f43.google.com with SMTP id f10so1774540yha.30
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Apr 2014 08:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=VBCk1x74SU5+c/DcF0b9AzeQz4Zqz1poK4oBntD5QGw=;
	b=hRAZt1yJHNYbDUN2WfcF18o2vdBkQpra4TgLN6LjAVJ0jzR3amOYd/KAnhNG2kjSmz
	gxebTshWHu1r111PDDXVbpr3O7Y8bfbkrUeRAsoF8Sf7o0fXRYQijik6WjBFB7Mo461u
	LR8wyvCl2PVrRENQ75ZpZnTygxg0tsyz3/gyv2ENhCOdZ9v2kb7dZBlxIzJPvw7ibC49
	0CyITq4vO+D8m5NLpXMX1UzE6J6f+cMcnOz08VsHQx6tY0midABogbHMHMV72W+iu3oV
	pd1h6/GMRCyYelHXn/Hclw3QSXcXNTvDk3WvWcrVFeF4Nd4H4K8aohXj6EjFK17slxh9
	7nfw==
MIME-Version: 1.0
X-Received: by 10.236.198.243 with SMTP id v79mr6544785yhn.87.1398871734544;
	Wed, 30 Apr 2014 08:28:54 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.124.72 with HTTP; Wed, 30 Apr 2014 08:28:54 -0700 (PDT)
In-Reply-To: <1398870272-18014-2-git-send-email-mihaela.sendrea@enea.com>
References: <1398870272-18014-1-git-send-email-mihaela.sendrea@enea.com>
	<1398870272-18014-2-git-send-email-mihaela.sendrea@enea.com>
Date: Wed, 30 Apr 2014 12:28:54 -0300
X-Google-Sender-Auth: z-1alc9eAeGVNmrBz-8VY3oKWmY
Message-ID: <CAP9ODKrL4T-MLicvGmRxMVbC3fnWA0EUbEhonRZ+R7hAu-KDxg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH v2 2/2] netperf: enable SCTP support
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
X-List-Received-Date: Wed, 30 Apr 2014 15:28:57 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Apr 30, 2014 at 12:04 PM, Mihaela Sendrea
<mihaela.sendrea@enea.com> wrote:
> Signed-off-by: Mihaela Sendrea <mihaela.sendrea@enea.com>
> ---
>  meta-networking/recipes-support/netperf/netperf_2.6.0.bb |    5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/meta-networking/recipes-support/netperf/netperf_2.6.0.bb b/meta-networking/recipes-support/netperf/netperf_2.6.0.bb
> index 45760ad..73a819c 100644
> --- a/meta-networking/recipes-support/netperf/netperf_2.6.0.bb
> +++ b/meta-networking/recipes-support/netperf/netperf_2.6.0.bb
> @@ -27,6 +27,11 @@ CFLAGS_append = " -DDO_UNIX -DDO_IPV6 -D_GNU_SOURCE"
>  CFLAGS_append = "${@base_contains('DISTRO_FEATURES', 'largefile', \
>      ' -D_FILE_OFFSET_BITS=64', '', d)}"
>
> +PACKAGECONFIG += "sctp"
> +PACKAGECONFIG[sctp] = "--enable-sctp"

--disable too?

> +DEPENDS += "lksctp-tools"
> +RDEPENDS_${PN} += "kernel-module-sctp"

Add this in the PACKACONFIG setting.

>  # autotools.bbclass attends to include m4 files with path depth <= 2 by
>  # "find ${S} -maxdepth 2 -name \*.m4", so move m4 files from m4/m4.
>  do_configure_prepend() {
> --
> 1.7.10.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel



-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

