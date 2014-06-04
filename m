Return-Path: <joe@deserted.net>
Received: from mail-ie0-f176.google.com (mail-ie0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 89CDA6FAFA
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Jun 2014 01:43:42 +0000 (UTC)
Received: by mail-ie0-f176.google.com with SMTP id rl12so6642890iec.21
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Jun 2014 18:43:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=UQlhT5MGK2cqdywzFIowvYey9Jeor0CpWBRriLiQF5E=;
	b=DaAwU7jm5PMM7Odv08SxGmdLskDKH9Ma6mdfiVblv2JUjoJR0UHGNAUX0i9vUkbf3P
	yMirAjqDwgXyVR7DG3a4Lpgx9ojrWsudZLtiT8wcsLjvD0JxWhzNyjNoj2FovTx8NRI4
	icPYnIj0g8bmfLOJncAtidR55UGkcLndfTPTvRRmgljzMbK9BZSm08P3GIkai7wuGnsP
	llTisdZBUF0cpKcx3yKkGMO/w23BksVidVK0PUjXhuLRDKjgGGQeYhBXUp2Jrz7qUPYe
	1zHHonP3pjqWN5SQ4xU/JHdmRDnskUGuoNqC4GRnweKt7O6uFNLGgsh3NZovxEFUz+gB
	A5/A==
X-Gm-Message-State: ALoCoQm3C/Vgxa2ph+E5DN98gT9TjsTAVDRe5PDB8u0E7wGrX4fKttWLFeU9Dg8shB3eN7xW36Mv
MIME-Version: 1.0
X-Received: by 10.50.176.167 with SMTP id cj7mr838295igc.44.1401846223525;
	Tue, 03 Jun 2014 18:43:43 -0700 (PDT)
Received: by 10.42.81.130 with HTTP; Tue, 3 Jun 2014 18:43:43 -0700 (PDT)
In-Reply-To: <1399997660-12190-2-git-send-email-mihaela.sendrea@enea.com>
References: <1399997660-12190-1-git-send-email-mihaela.sendrea@enea.com>
	<1399997660-12190-2-git-send-email-mihaela.sendrea@enea.com>
Date: Tue, 3 Jun 2014 21:43:43 -0400
Message-ID: <CANBf+V1SKH4ncV2JdVaxkOQONGBeCoXuP0rCjkU4QxTVXaSCHw@mail.gmail.com>
From: Joe MacDonald <joe@deserted.net>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH v5 2/2] netperf: enable SCTP support
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
X-List-Received-Date: Wed, 04 Jun 2014 01:43:45 -0000
Content-Type: text/plain; charset=UTF-8

Merged, sorry for the excessive delay on this.

-J.

On Tue, May 13, 2014 at 12:14 PM, Mihaela Sendrea
<mihaela.sendrea@enea.com> wrote:
> Signed-off-by: Mihaela Sendrea <mihaela.sendrea@enea.com>
> ---
>  meta-networking/recipes-support/netperf/netperf_2.6.0.bb | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/meta-networking/recipes-support/netperf/netperf_2.6.0.bb b/meta-networking/recipes-support/netperf/netperf_2.6.0.bb
> index 7124b02..ffa77d7 100644
> --- a/meta-networking/recipes-support/netperf/netperf_2.6.0.bb
> +++ b/meta-networking/recipes-support/netperf/netperf_2.6.0.bb
> @@ -27,6 +27,9 @@ CFLAGS_append = " -DDO_UNIX -DDO_IPV6 -D_GNU_SOURCE"
>  CFLAGS_append = "${@base_contains('DISTRO_FEATURES', 'largefile', \
>      ' -D_FILE_OFFSET_BITS=64', '', d)}"
>
> +PACKAGECONFIG ??= ""
> +PACKAGECONFIG[sctp] = "--enable-sctp,--disable-sctp,lksctp-tools,"
> +
>  # autotools.bbclass attends to include m4 files with path depth <= 2 by
>  # "find ${S} -maxdepth 2 -name \*.m4", so move m4 files from m4/m4.
>  do_configure_prepend() {
> @@ -57,5 +60,7 @@ do_install() {
>      install -m 0644 ${S}/doc/netperf_old.ps ${D}${docdir}/netperf
>  }
>
> +RRECOMMENDS_${PN} += "${@base_contains('PACKAGECONFIG', 'sctp', 'kernel-module-sctp', '', d)}"
> +
>  INITSCRIPT_NAME="netperf"
>  INITSCRIPT_PARAMS="defaults"
> --
> 1.8.5.3
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel



-- 
Joe MacDonald
:wq

