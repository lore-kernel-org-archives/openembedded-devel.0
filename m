Return-Path: <stefan@datenfreihafen.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BDAEC83034
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:12 +0000 (UTC)
Received: from proxima.lasnet.de (proxima.lasnet.de [78.47.171.185])
 by mx.groups.io with SMTP id smtpd.web11.19965.1650539674870520375
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Apr 2022 04:14:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@datenfreihafen.org header.s=2021 header.b=olx/4DBw;
 spf=pass (domain: datenfreihafen.org, ip: 78.47.171.185,
 mailfrom: stefan@datenfreihafen.org)
Received: from [IPV6:2003:e9:d729:f54f:8837:7fe7:f862:a69e]
 (p200300e9d729f54f88377fe7f862a69e.dip0.t-ipconnect.de
 [IPv6:2003:e9:d729:f54f:8837:7fe7:f862:a69e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: stefan@datenfreihafen.org)
	by proxima.lasnet.de (Postfix) with ESMTPSA id 4BF8DC04B4;
	Thu, 21 Apr 2022 13:14:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=datenfreihafen.org;
	s=2021; t=1650539671;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y0dMEyEILqPlGNy+pYzpH8hOMgZlIg1auE9LpZUvxtE=;
	b=olx/4DBwl+CjIDxHqFZIW6snJlbRJa24ocqBmiD/gbYH8Yx8ySs18Duw+G5jmOhhs5mSQk
	ZxQUn5h687E1gL+Hz7RHPBC3njXreFnTnZi7cEUBAHzUFygLbBUX/OOMgt4ZX75/+fHYUX
	pjmseAkuC9GrPOBoyKIVJWOuYh4NsvOWA2n6TYQbClQZKx/7YVvldA01TeNYb0ZTBGX3+S
	DLh+ZsAVh0lGdpto81LtWsjUY0XEfzy4XBwrKTTDzs+PetcX5HWYfon/CQDtSU96DypgMh
	yx9iSFhV5bFK+RspaFpTloHvnqCP7Ljl/ph2dqwIfbdE2rMUXlJhIOaU5B9BKw==
Message-ID: <2bfde747-5d33-70bc-f62c-0191691155ad@datenfreihafen.org>
Date: Thu, 21 Apr 2022 13:14:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [oe] [meta-networking][PATCH 2/2] wpantund: Add missing
 dependency on boost
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20220419152216.3810783-1-raj.khem@gmail.com>
 <20220419152216.3810783-2-raj.khem@gmail.com>
From: Stefan Schmidt <stefan@datenfreihafen.org>
In-Reply-To: <20220419152216.3810783-2-raj.khem@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96726

Hello Khem.

On 19.04.22 17:22, Khem Raj wrote:
> Fixes
> checking for boost/signals2/signal.hpp... no
> configure: error: Unable to find a usable implementation of boost::signals2 (not even our internal copy)
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   meta-networking/recipes-connectivity/openthread/wpantund_git.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-networking/recipes-connectivity/openthread/wpantund_git.bb b/meta-networking/recipes-connectivity/openthread/wpantund_git.bb
> index bb444d04f5..a7fcc202a4 100644
> --- a/meta-networking/recipes-connectivity/openthread/wpantund_git.bb
> +++ b/meta-networking/recipes-connectivity/openthread/wpantund_git.bb
> @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e7820bc7f7d1638a6b54fc2e8d7fb103 \
>                       file://third_party/openthread/LICENSE;md5=543b6fe90ec5901a683320a36390c65f \
>                       file://third_party/pt/LICENSE;md5=dcd598b69cad786beea33da7b1ae14b7 \
>                       "
> -DEPENDS = "autoconf-archive dbus readline"
> +DEPENDS = "autoconf-archive dbus readline boost"
>   SRCREV = "0fb1f57e4224e2df3e630e146702bfcf63fbf07a"
>   PV = "0.07.01+git${SRCPV}"

LGTM

JFYI the project does have an internal copy of boost in the 
third_party/boost sub-folder (can be enabled by --with-boost=internal), 
but given its age I agree that we should rely on newer boost versions 
coming through OE.

regards
Stefan Schmidt

