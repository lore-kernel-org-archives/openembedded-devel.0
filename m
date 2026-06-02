Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2880ECD6E57
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 20:15:52 +0000 (UTC)
Received: from outbound8.mail.transip.nl (outbound8.mail.transip.nl [136.144.136.8])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4485.1780431305650472310
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Jun 2026 13:15:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@myspectrum.nl header.s=transip-a header.b=ezhHlFri;
 spf=pass (domain: myspectrum.nl, ip: 136.144.136.8, mailfrom: jeroen@myspectrum.nl)
Received: from submission14.mail.transip.nl (unknown [10.103.8.165])
	by outbound8.mail.transip.nl (Postfix) with ESMTP id 4gVMWV5skhzY76Ww
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jun 2026 22:15:02 +0200 (CEST)
Received: from yellow.myspectrum.nl (yellow.myspectrum.nl [136.144.146.76])
	by submission14.mail.transip.nl (Postfix) with ESMTPSA id 4gVMWV0lx2z3RgQXp
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jun 2026 22:15:02 +0200 (CEST)
Received: from [192.168.178.17] (212-204-162-136.cable.dynamic.v4.ziggo.nl [212.204.162.136])
	(Authenticated sender: jeroen@myspectrum.nl)
	by yellow.myspectrum.nl (Postfix) with ESMTPSA id 6EA3F2014F
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jun 2026 20:15:01 +0000 (UTC)
Authentication-Results: yellow.myspectrum.nl;
	auth=pass smtp.auth=jeroen@myspectrum.nl smtp.mailfrom=jeroen@myspectrum.nl
Message-ID: <cdc55fbc-4ea9-452d-93cc-2eec2fd1a8c7@myspectrum.nl>
Date: Tue, 2 Jun 2026 22:15:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] gd: fix build with gcc 16
To: openembedded-devel@lists.openembedded.org
References: <20260530081837.2192126-1-f_l_k@t-online.de>
From: "Jeroen Hofstee" <jeroen@myspectrum.nl>
In-Reply-To: <20260530081837.2192126-1-f_l_k@t-online.de>
X-Scanned-By: ClueGetter at submission14.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=myspectrum.nl; t=1780431302; h=from:subject:to:
 references:in-reply-to:date:mime-version:content-type;
 bh=4GjHPgw49DbHqvPzXzL1nRZma/Lphi9KIKsBw1lwGhM=;
 b=ezhHlFriO+XhNfPJqGyq/mC5k+FmGoqfMWzgyD1NBREs+1IhVIbwXcV906iiQxGEipED/r
 zHoVz4Ga3JugLGt36aHP9U0vXXjbyrpgxkD8pZ1OOS1eJQVXJO5hfrb5QAbJeCaTUMXmck
 fGcVaXmdez7/Pjg85j91D5WjmKHmke/x6/nU30AHP7KwEUj3LIpNpboS8kWpJnx0pAilXW
 mMVw3ufGrC72Rk8bwvGZTqJN3gOiVIsFYax2zF7K/F3xENr/uJTHxkDgcaqr+jPDfTo+2+
 SfJupi/LRgbhkL2uFuyVQ9pkFYgElvyHo7eSRD+DWY7D6iOPbQIXSfW26yfnew==
X-Report-Abuse-To: abuse@transip.nl
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Jun 2026 20:15:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127370

Hi,

On 5/30/26 10:18, Markus Volk via lists.openembedded.org wrote:
> https://github.com/libgd/libgd/issues/990
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>   .../0001-gd.c-fix-maybe_uninitialized.patch   | 26 +++++++++++++++++++
>   meta-oe/recipes-support/gd/gd_2.3.3.bb        |  1 +
>   2 files changed, 27 insertions(+)
>   create mode 100644 meta-oe/recipes-support/gd/gd/0001-gd.c-fix-maybe_uninitialized.patch
>
> diff --git a/meta-oe/recipes-support/gd/gd/0001-gd.c-fix-maybe_uninitialized.patch b/meta-oe/recipes-support/gd/gd/0001-gd.c-fix-maybe_uninitialized.patch
> new file mode 100644
> index 0000000000..9fd51da68f
> --- /dev/null
> +++ b/meta-oe/recipes-support/gd/gd/0001-gd.c-fix-maybe_uninitialized.patch
> @@ -0,0 +1,26 @@
> +From 1bb2911c02193d32f1458b771c485980fd100010 Mon Sep 17 00:00:00 2001
> +From: Markus Volk <f_l_k@t-online.de>
> +Date: Sat, 30 May 2026 10:12:26 +0200
> +Subject: [PATCH] gd.c: fix maybe_uninitialized
> +
> +Upstream-Status: Pending [https://github.com/libgd/libgd/issues/990]
>
I really hate that warning, a guessing compiler :(
Anyway, the upstream status is not pending,
but not excepted / closed.

With kind regards,

Jeroen


