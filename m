Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 2CCDF77E1B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Apr 2017 11:44:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 82ED231E5720;
	Thu, 13 Apr 2017 13:44:34 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id jrE-lI1Wex-j; Thu, 13 Apr 2017 13:44:31 +0200 (CEST)
Received: from t510.zcs.saftware.de (p57A6179E.dip0.t-ipconnect.de
	[87.166.23.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 3FBE331E55A2;
	Thu, 13 Apr 2017 13:44:31 +0200 (CEST)
Date: Thu, 13 Apr 2017 13:44:30 +0200
From: Andreas Oberritter <obi@opendreambox.org>
To: Dengke Du <dengke.du@windriver.com>
Message-ID: <20170413134430.5c24f049@t510.zcs.saftware.de>
In-Reply-To: <1492069306-165991-1-git-send-email-dengke.du@windriver.com>
References: <1492069306-165991-1-git-send-email-dengke.du@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH V2] php: fix install error for libphp*.so
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
X-List-Received-Date: Thu, 13 Apr 2017 11:44:34 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 13 Apr 2017 03:41:46 -0400
Dengke Du <dengke.du@windriver.com> wrote:

> diff --git a/meta-oe/recipes-devtools/php/php.inc b/meta-oe/recipes-devtools/php/php.inc
> index d3ec9de..7f37daa 100644
> --- a/meta-oe/recipes-devtools/php/php.inc
> +++ b/meta-oe/recipes-devtools/php/php.inc
> @@ -176,7 +176,11 @@ do_install_append_class-target() {
>          install -d ${D}${libdir}/apache2/modules
>          install -d ${D}${sysconfdir}/apache2/modules.d
>          install -d ${D}${sysconfdir}/php/apache2-php5
> -        install -m 755  libs/libphp5.so ${D}${libdir}/apache2/modules
> +        if [[ ${PV} == 7* ]]; then
> +            install -m 755  libs/libphp7.so ${D}${libdir}/apache2/modules
> +        elif [[ ${PV} == 5* ]]; then
> +            install -m 755  libs/libphp5.so ${D}${libdir}/apache2/modules
> +        fi

This is bash syntax. Please use case ... esac.

Regards,
Andreas

