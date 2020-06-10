Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
 by mx.groups.io with SMTP id smtpd.web12.6734.1591780235126378494
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Jun 2020 02:10:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@skidata.com header.s=selector1 header.b=Wj1ZC0be;
 spf=pass (domain: skidata.com, ip: 91.230.2.91, mailfrom: prvs=4237cd248=richard.leitner@skidata.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
  t=1591780234; x=1623316234;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ag2PjgOLYldpkCBdTieaRhDv9QSbfLh/9nCp4RyxgbU=;
  b=Wj1ZC0bexgsnlBsTsGqwHaVXqtTKeZqM7LkRQ52hXkLJ7ghjklODOHtE
   9KXbYwtfQdgu9nZk/RrmcDlFhKcpLN+zd37yOo04+2DmuvAdnHM5NR5py
   6Pu+7witAeRFgPm/zuafIzFsmkzzMCp3IxlOeI5qNGQDUD/itsBO2PA0R
   D9ARyuNxLlVgbazzm+5ydaQcC9XG/uydV7Ml+AYMByL4y00FUSCGgcwhU
   kFlCikiUm+55OOQgLwXiYdzNLe6k+6lznFIN+tnR5VcLqAQzbqKE/iv/S
   yc0JTBbhX783qDSm27x7FOMmzct2YadhjRJZnSoy4LEhEPjqTL/Y0Tt1r
   w==;
IronPort-SDR: iGaQzDedU4drDvb8XZ55DU/HwjgUYMefpDq83x9CwgWqtYbWnq03FN5OEejFZWdFP5EkzMs5TK
 1OjSYMV2rW6BKVn9KxavVklPhd/mdJCikqq5EEZ5vkTeFl2gHBTq5Y4pf5X9ShQ1G57HNkIOH1
 l5YfgMf2x8doG2gvf85MuxVCJArk+kcDtV13jf1TlItYE/BZ9nQQIcyZBsGHyZpxK2JG3RKwMb
 TaxaD/pQvWqbR9/BGKsROiCG+OinjIvCi0e2ElyKBzLlE/MrEkSEqNNDPXnak18KfgJZiPX2fY
 Bng=
X-IronPort-AV: E=Sophos;i="5.73,495,1583190000"; 
   d="scan'208";a="2594983"
Date: Wed, 10 Jun 2020 11:10:33 +0200
From: "Richard Leitner" <richard.leitner@skidata.com>
To: <oecore.mailinglist@gmail.com>
CC: <openembedded-devel@lists.openembedded.org>, Robert Berger
	<robert.berger@reliableembeddedsystems.com>
Subject: Re: [meta-java][PATCH v3] WORKDIR and ARCHIVER_WORKDIR support
Message-ID: <20200610091033.GC144887@pcleri>
References: <20200509095010.25808-1-robert.berger@ReliableEmbeddedSystems.com>
MIME-Version: 1.0
In-Reply-To: <20200509095010.25808-1-robert.berger@ReliableEmbeddedSystems.com>
Return-Path: richard.leitner@skidata.com
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex3srv.skidata.net (192.168.111.81) To
 sdex5srv.skidata.net (192.168.111.83)
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Hi,
thank you for your patch!

This is a note to let you know that I've just added this patch to the
master-next branch of the meta-java repository at
	git://git.yoctoproject.org/meta-java

As soon as it has gone through some more testing it will likely be
merged to the master branch.

If you have any questions, please let me know.

regards;rl

On Sat, May 09, 2020 at 12:50:10PM +0300, oecore.mailinglist@gmail.com wrote:
> From: Robert Berger <robert.berger@ReliableEmbeddedSystems.com>
> 
> do_unpack_extract_submodules was called via postfuncs[do_unpack].
> This breaks the build when the archiver.bbclass is used in a way
> where do_unpack_and_patch is called by it. In this mode the archiver
> class modifies WORKDIR, S, B,... and those modifications are lost 
> via postfuncs.
> 
> In order to pick up WORKDIR, S, B,... (potentially modified by 
> archiver.bbclass) do_patch_prepend is used instead of pre/postfuncs 
> and calls do_unpack_extract_submodules now.
> 
> Without this patch the build will break when you add this to local.conf:
> 
> INHERIT += "archiver"
> ARCHIVER_MODE[src] = "original"
> ARCHIVER_MODE[diff] = "1"
> ARCHIVER_MODE[dumpdata] = "1"
> ARCHIVER_MODE[recipe] = "1"
> COPYLEFT_LICENSE_INCLUDE = "GPL* LGPL*"
> 
> Signed-off-by: Robert Berger <robert.berger@ReliableEmbeddedSystems.com>
> ---
>  recipes-core/openjdk/openjdk-8-common.inc | 19 +++++++++++++++++--
>  1 file changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-core/openjdk/openjdk-8-common.inc b/recipes-core/openjdk/openjdk-8-common.inc
> index c78bb2a..04acc59 100644
> --- a/recipes-core/openjdk/openjdk-8-common.inc
> +++ b/recipes-core/openjdk/openjdk-8-common.inc
> @@ -42,6 +42,21 @@ do_unpack_extract_submodules () {
>      tar xjf ${WORKDIR}/${NASHORN_FILE_LOCAL} --transform "s,-${NASHORN_CHANGESET},,g"
>  }
>  
> +do_patch_prepend() {
> +    # use do_patch_prepend syntax and not pre/postfuncs to
> +    # call do_unpack_extract_submodules
> +    # *) the archiver.bbclass modifies WORKDIR, S, B,...
> +    #    and those modifications are lost otherwise,
> +    #    which leads to build failures in do_unpack_and_patch -> do_patch
> +    func = 'do_unpack_extract_submodules'
> +    bb.build.exec_func(func, d)
> +
> +    # delete X11 wrappers if x11 is not part of PACKAGECONFIG
> +    if bb.utils.contains('PACKAGECONFIG', 'x11', False, True, d):
> +       func_delete = 'do_unpack_delete_X11_wrappers'
> +       bb.build.exec_func(func_delete, d)
> +}
> +
>  do_unpack_delete_X11_wrappers() {
>      find ${S}/jdk/src/solaris/classes/sun/awt/X11 -maxdepth 1 -name '*.java' -delete
>  }
> @@ -155,8 +170,8 @@ def jdk_configure_options(d):
>      options = package_config_option_cleanup(d)
>      return options[3]
>  
> -do_unpack[postfuncs] += "do_unpack_extract_submodules"
> -do_unpack[postfuncs] += "${@bb.utils.contains('PACKAGECONFIG', 'x11', '', 'do_unpack_delete_X11_wrappers', d)}"
> +#do_unpack[postfuncs] += "do_unpack_extract_submodules"
> +#do_unpack[postfuncs] += "${@bb.utils.contains('PACKAGECONFIG', 'x11', '', 'do_unpack_delete_X11_wrappers', d)}"
>  
>  export DEBUG_BINARIES = "true"
>  
> -- 
> 2.17.1
> 
