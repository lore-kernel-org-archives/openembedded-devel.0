Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (unknown [82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id BEAB465DA3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 May 2014 16:36:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 32439314C2D1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 May 2014 18:36:44 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 3-BL_xLZyfyA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 May 2014 18:36:29 +0200 (CEST)
Received: from [172.22.22.61] (55d458e0.access.ecotel.net [85.212.88.224])
	(using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id BA656314C2CC
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 May 2014 18:36:29 +0200 (CEST)
Message-ID: <537CD60D.7020602@opendreambox.org>
Date: Wed, 21 May 2014 18:36:29 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <CAMKF1sqfoiANL7jcnVA3Q7sWz8mzjcUfkCNE5FxQFweWd905Rw@mail.gmail.com>
	<1400657458-32231-1-git-send-email-Matthieu.Crapet@ingenico.com>
In-Reply-To: <1400657458-32231-1-git-send-email-Matthieu.Crapet@ingenico.com>
Subject: Re: [meta-oe][PATCH v2] faac: fix S!=B failure
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
X-List-Received-Date: Wed, 21 May 2014 16:36:53 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello Matthieu,

On 21.05.2014 09:30, Matthieu Crapet wrote:
> Also use ${BP} and ${BPN}.

What problem does this solve?

> 
> Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
> ---
>  meta-multimedia/recipes-multimedia/faac/faac_1.28.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/meta-multimedia/recipes-multimedia/faac/faac_1.28.bb b/meta-multimedia/recipes-multimedia/faac/faac_1.28.bb
> index c7dcdb9..d96c1a4 100644
> --- a/meta-multimedia/recipes-multimedia/faac/faac_1.28.bb
> +++ b/meta-multimedia/recipes-multimedia/faac/faac_1.28.bb
> @@ -4,15 +4,15 @@ LICENSE = "LGPLv2+"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
>                      file://libfaac/coder.h;beginline=5;endline=17;md5=fa1fd6a5fa8cdc877d63a12530d273e0"
>  
> -inherit autotools
> +inherit autotools-brokensep
>  
> -SRC_URI = "${SOURCEFORGE_MIRROR}/faac/${BPN}-${PV}.tar.gz \
> +SRC_URI = "${SOURCEFORGE_MIRROR}/faac/${BP}.tar.gz \
>             file://build-fix.patch"
>  
>  SRC_URI[md5sum] = "80763728d392c7d789cde25614c878f6"
>  SRC_URI[sha256sum] = "c5141199f4cfb17d749c36ba8cfe4b25f838da67c22f0fec40228b6b9c3d19df"
>  
> -PACKAGES =+ "lib${PN} lib${PN}-dev"
> +PACKAGES =+ "lib${BPN} lib${BPN}-dev"
>  
>  FILES_${PN} = " ${bindir}/faac "
>  FILES_lib${PN} = " ${libdir}/libfaac.so.*"
              ^
This differs from PACKAGES now.

Regards,
Andreas

