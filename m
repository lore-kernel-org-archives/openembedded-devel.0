Return-Path: <jiaqing.zhao@linux.intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 595E9C433EF
	for <webhook@archiver.kernel.org>; Wed, 11 May 2022 15:17:08 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web09.666.1652282224897762460
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 May 2022 08:17:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=i03jbWwM;
 spf=none, err=permanent DNS error (domain: linux.intel.com,
 ip: 134.134.136.126, mailfrom: jiaqing.zhao@linux.intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652282224; x=1683818224;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=dPm4bfqciI2eh0yE6CaMF+8B5ZMoqmhV1wcmUmbrKkQ=;
  b=i03jbWwMhmsuQSdJ9wncVUt9wu/FmXiRPFJFwnqQlaz7Gg4rrR3ZoL56
   f7t40DUsj0WrRB2LbYfriMmAHXqaG6uun3b3Mw0n+RVrHujre4xy/XcaN
   jBdUWekkG3dGS6416cZzB4O4/xRtrHJ89qCSPihBSopUNS4M6qj/6OUKP
   2wW0x4U034GFlc9WNkf/jlSl66O5ALJQ63Vb+/LUqx27wIAaYi7x/HzyR
   0InDtdo7JaiWY0Wd+QboM79R2cnwiztLGTaMlRNgrxqA6xPhej8XdTFH/
   ymqILgZva9j15kPL4aD8VqoNKv17j5Mw+kTIVXxAbPJ6sPvenFu3leVHG
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10344"; a="251779242"
X-IronPort-AV: E=Sophos;i="5.91,217,1647327600";
   d="scan'208";a="251779242"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2022 08:17:04 -0700
X-IronPort-AV: E=Sophos;i="5.91,217,1647327600";
   d="scan'208";a="566222923"
Received: from jiaqingz-mobl.ccr.corp.intel.com (HELO [10.255.30.188])
 ([10.255.30.188])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2022 08:17:03 -0700
Message-ID: <4429f4ed-3b2c-20dd-4356-37c5fb0b6bf6@linux.intel.com>
Date: Wed, 11 May 2022 23:17:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [oe] [meta-multimedia][kirkstone][PATCH] libcamera: fix packaging
Content-Language: en-US
To: Julien STEPHAN <jstephan@baylibre.com>,
 openembedded-devel@lists.openembedded.org
References: <20220511081409.3437145-1-jstephan@baylibre.com>
From: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
In-Reply-To: <20220511081409.3437145-1-jstephan@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 May 2022 15:17:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97037

On 2022-05-11 16:14, Julien STEPHAN wrote:
> libcamera.so.0 and libcamera-base.so.0 are packaged in ${PN}-dev although
> they should be packaged in ${PN}. See poky/meta/conf/bitbake.conf.
> This trigger the following error when trying to run the `cam` utility
> (packaged inside ${PN}):
> 
> $ cam -l
> cam: error while loading shared libraries: libcamera.so.0: cannot open shared object file: No such file or directory
> 
> $ read-elf -d /usr/bin/cam
> Dynamic section at offset 0x2c740 contains 37 entries:
>   Tag        Type                         Name/Value
>  0x0000000000000001 (NEEDED)             Shared library: [libcamera.so.0]
>  0x0000000000000001 (NEEDED)             Shared library: [libcamera-base.so.0]
> [...]
> 
> So package libcamera is broken and need to be installed along with
> libcamera-dev to be functionnal. Fix it by packaging libcamera.so.0 and
> libcamera-base.so.0 into ${PN}
> 
> Signed-off-by: Julien STEPHAN <jstephan@baylibre.com>
> ---
>  meta-multimedia/recipes-multimedia/libcamera/libcamera.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb b/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
> index 713626069..0b9f3f7a5 100644
> --- a/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
> +++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
> @@ -64,10 +64,10 @@ do_recalculate_ipa_signatures_package() {
>  
>  FILES:${PN}-dev = "${includedir} ${libdir}/pkgconfig"
>  FILES:${PN}-dev += " ${libdir}/libcamera.so"

Maybe this should also be added to be packaged in ${PN}, this should be a link to libcamera.so.0.0.0

> -FILES:${PN}-dev += " ${libdir}/libcamera.so.0"
> +FILES:${PN} += " ${libdir}/libcamera.so.0"
>  FILES:${PN} += " ${libdir}/libcamera.so.0.0.0"
>  FILES:${PN}-dev += " ${libdir}/libcamera-base.so"

Also this one

> -FILES:${PN}-dev += " ${libdir}/libcamera-base.so.0"
> +FILES:${PN} += " ${libdir}/libcamera-base.so.0"
>  FILES:${PN} += " ${libdir}/libcamera-base.so.0.0.0"
>  FILES:${PN} += " ${libdir}/v4l2-compat.so"
>  FILES:${PN}-gst = "${libdir}/gstreamer-1.0/libgstlibcamera.so"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#97034): https://lists.openembedded.org/g/openembedded-devel/message/97034
> Mute This Topic: https://lists.openembedded.org/mt/91031240/6787970
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [jiaqing.zhao@linux.intel.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

