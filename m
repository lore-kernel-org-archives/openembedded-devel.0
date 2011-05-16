Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1QLwCg-0000Tf-O3
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 May 2011 13:43:14 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 755EF3150F12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 May 2011 13:40:24 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id gCzdQ+wXbQKo
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 May 2011 13:40:18 +0200 (CEST)
Received: from [172.22.22.61] (drms-590c46b9.pool.mediaWays.net [89.12.70.185])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 1A6D43150E26
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 May 2011 13:40:18 +0200 (CEST)
Message-ID: <4DD10D20.6080005@opendreambox.org>
Date: Mon, 16 May 2011 13:40:16 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1302825782-17120-1-git-send-email-obi@opendreambox.org>
In-Reply-To: <1302825782-17120-1-git-send-email-obi@opendreambox.org>
Subject: Re: [PATCH 1/2] kernel.bbclass: pass KERNEL_VERSION through legitimize_package_name
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
X-List-Received-Date: Mon, 16 May 2011 11:43:14 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Ping

On 04/15/2011 02:03 AM, Andreas Oberritter wrote:
> - KERNEL_VERSION may contain characters unsuitable for package
>   names, e.g. underscores. Use legitimize_package_name to replace
>   those characters.
> 
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> ---
>  classes/kernel.bbclass |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
> index 0187fb3..bded15d 100644
> --- a/classes/kernel.bbclass
> +++ b/classes/kernel.bbclass
> @@ -245,8 +245,8 @@ RDEPENDS_kernel = "kernel-base"
>  # Allow machines to override this dependency if kernel image files are 
>  # not wanted in images as standard
>  RDEPENDS_kernel-base ?= "kernel-image"
> -PKG_kernel-image = "kernel-image-${KERNEL_VERSION}"
> -PKG_kernel-base = "kernel-${KERNEL_VERSION}"
> +PKG_kernel-image = "kernel-image-${@legitimize_package_name('${KERNEL_VERSION}')}"
> +PKG_kernel-base = "kernel-${@legitimize_package_name('${KERNEL_VERSION}')}"
>  ALLOW_EMPTY_kernel = "1"
>  ALLOW_EMPTY_kernel-base = "1"
>  ALLOW_EMPTY_kernel-image = "1"



