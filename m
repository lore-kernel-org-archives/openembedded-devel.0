Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1RvC7B-0005RO-6o
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Feb 2012 19:19:33 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id C1EB03158A44
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Feb 2012 19:11:31 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id utB89eBXAt0y
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Feb 2012 19:11:22 +0100 (CET)
Received: from [172.22.22.61] (drms-590c4e0c.pool.mediaWays.net [89.12.78.12])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id E306B31588D2
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Feb 2012 19:11:21 +0100 (CET)
Message-ID: <4F32BAC8.2000807@opendreambox.org>
Date: Wed, 08 Feb 2012 19:11:20 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0) Gecko/20120129 Thunderbird/10.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4F2A97B7.2080709@opendreambox.org>
In-Reply-To: <4F2A97B7.2080709@opendreambox.org>
Subject: Re: [meta-oe][PATCH] giflib: don't depend on libsm if x11 is unavailable
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 08 Feb 2012 18:19:33 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Ping.

Patchwork URL: http://patches.openembedded.org/patch/20561/

On 02.02.2012 15:03, Andreas Oberritter wrote:
> If DISTRO_FEATURES doesn't contain x11, libsm is not available.
> As libsm is optional, the dependency is changed to be conditional.
> There's no need to alter configure flags, because without x11,
> libsm cannot be picked up accidentially. Because this just fixes
> a missing dependency failure without x11, no PR bump is required
> either.
> 
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> ---
>  meta-oe/recipes-devtools/giflib/giflib_4.1.6.bb |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/meta-oe/recipes-devtools/giflib/giflib_4.1.6.bb b/meta-oe/recipes-devtools/giflib/giflib_4.1.6.bb
> index bd7b495..4e782e2 100644
> --- a/meta-oe/recipes-devtools/giflib/giflib_4.1.6.bb
> +++ b/meta-oe/recipes-devtools/giflib/giflib_4.1.6.bb
> @@ -8,7 +8,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/giflib/${BP}.tar.bz2"
>  
>  inherit autotools
>  
> -DEPENDS = "libsm"
> +DEPENDS = "${@base_contains('DISTRO_FEATURES', 'x11', 'libsm', '', d)}"
>  
>  PACKAGES += "${PN}-utils"
>  FILES_${PN} = "${libdir}/libgif.so.*"



