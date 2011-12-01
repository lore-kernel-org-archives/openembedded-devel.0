Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kristoffer.ericson@gmail.com>) id 1RW7Py-0000Iy-Ee
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Dec 2011 15:15:18 +0100
Received: by lagj5 with SMTP id j5so745473lag.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Dec 2011 06:08:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=jGJZeUt7Q7eOPDSZy5rBLE79ut2oMUpFPQReoQVkhvg=;
	b=olg5Hizq+yts3RP8rQo0ZeZnWxpTVRskNTgGQnep1KkIdk1JJwxYx32fInT7CpDI5B
	duGwkVT764j+M3EWiAQTqPF4kfs4Ar7532wfrdHKmofsAaGlEbMPwgDEBKGvJnt6RPxQ
	DyooildOpXZLZ323H73wdglcyVQi7LhjvuzTE=
Received: by 10.152.104.1 with SMTP id ga1mr4601811lab.40.1322748513741;
	Thu, 01 Dec 2011 06:08:33 -0800 (PST)
Received: from localhost (c-b9dde555.010-30-6c6b7012.cust.bredbandsbolaget.se.
	[85.229.221.185])
	by mx.google.com with ESMTPS id hh9sm5253667lab.1.2011.12.01.06.08.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Dec 2011 06:08:32 -0800 (PST)
Date: Thu, 1 Dec 2011 15:09:34 +0100
From: Kristoffer Ericson <kristoffer.ericson@gmail.com>
To: Rafael Ignacio Zurita <rafaelignacio.zurita@gmail.com>
Message-ID: <20111201140933.GE2695@Boggieman>
References: <1322748446-29453-1-git-send-email-rafaelignacio.zurita@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1322748446-29453-1-git-send-email-rafaelignacio.zurita@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] directvnc: Add initial recipe with version 0.7.7
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
X-List-Received-Date: Thu, 01 Dec 2011 14:15:18 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline


Acked-by: Kristoffer Ericson <kristoffer.ericson@gmail.com>

On Thu, Dec 01, 2011 at 11:07:26AM -0300, Rafael Ignacio Zurita wrote:
> DirectVNC provides a very thin VNC client for unix framebuffer systems.
> 
> Signed-off-by: Rafael Ignacio Zurita <rafaelignacio.zurita@gmail.com>
> ---
>  recipes/directvnc/directvnc_0.7.7.bb |   12 ++++++++++++
>  1 files changed, 12 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/directvnc/directvnc_0.7.7.bb
> 
> diff --git a/recipes/directvnc/directvnc_0.7.7.bb b/recipes/directvnc/directvnc_0.7.7.bb
> new file mode 100644
> index 0000000..9e9afa7
> --- /dev/null
> +++ b/recipes/directvnc/directvnc_0.7.7.bb
> @@ -0,0 +1,12 @@
> +DESCRIPTION = "DirectVNC provides a very thin VNC client for unix framebuffer systems."
> +HOMEPAGE = "http://drinkmilk.github.com/directvnc/"
> +SECTION = "utils"
> +LICENSE = "GPLv2"
> +DEPENDS_${PN} = "zlib libpng jpeg directfb"
> +
> +SRC_URI = "https://github.com/downloads/drinkmilk/directvnc/directvnc-${PV}.tar.gz"
> +
> +inherit autotools
> +
> +SRC_URI[md5sum] = "e30f1a0e45b440443c044148fb62ad6e"
> +SRC_URI[sha256sum] = "ac8c0a6b6aaf0702411e71dd3626c655287c903233b659389fc07113114c9de3"
> -- 
> 1.7.0.4


