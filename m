Received: from mail-fx0-f42.google.com ([209.85.161.42])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1PQwdY-0005J8-F0
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Dec 2010 07:39:25 +0100
Received: by fxm11 with SMTP id 11so3003000fxm.29
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Dec 2010 22:37:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=60RyWGxMAUsIMs5wZe2oxVY+sOYaolklN4qE3hDcZhg=;
	b=ITJ0dgWhEYxggt56m2dsqb4UPXiKSc8t2Wiof+4Sy67Kd632FM8kJVKwdu1zPI4Khf
	4KrSGTtb6tUxH2oT/uxI9r3ZpalY10gCv4HEvl0FncmLDVmEAJnqgg73qYLozDMhZfJo
	bJatG1An/ul+I39ce6Cb/OGbKqIIv98Rx/E+M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=kD86yYfvBtn1tGmcy3iQllQcnAxo7mpa21HeRU2L4ycSWKPBswsViO7UkYSbkIDcgY
	a7AiNEyLd/o87kr5cT8OhrcL98470fKYdnjB5i/BMMjhB8nJD5gIN0tBelS4V6tyo/GK
	DqwopEppaKrcPhHNLiVjXKxS7xlKYA9X1surI=
Received: by 10.223.103.12 with SMTP id i12mr446438fao.43.1291963071226;
	Thu, 09 Dec 2010 22:37:51 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id w12sm788621fah.18.2010.12.09.22.37.49
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 09 Dec 2010 22:37:50 -0800 (PST)
Date: Fri, 10 Dec 2010 07:37:28 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101210063728.GQ3186@jama>
References: <1291942482-24901-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1291942482-24901-1-git-send-email-raj.khem@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-SA-Exim-Connect-IP: 209.85.161.42
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] sane-toolchain.inc: Prefer libtool version 2.4 with sysroot.
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
X-List-Received-Date: Fri, 10 Dec 2010 06:39:25 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 09, 2010 at 04:54:42PM -0800, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  conf/distro/include/sane-toolchain.inc |    7 +++++++
>  1 files changed, 7 insertions(+), 0 deletions(-)

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

> 
> diff --git a/conf/distro/include/sane-toolchain.inc b/conf/distro/include/sane-toolchain.inc
> index 6653f73..c0a4021 100644
> --- a/conf/distro/include/sane-toolchain.inc
> +++ b/conf/distro/include/sane-toolchain.inc
> @@ -10,6 +10,8 @@ PREFERRED_BINUTILS_VERSION           ?= "2.20.1"
>  PREFERRED_UCLIBC_VERSION             ?= "git"
>  PREFERRED_EGLIBC_VERSION             ?= "2.12"
>  PREFERRED_GLIBC_VERSION              ?= "2.10.1"
> +PREFERRED_LIBTOOL_VERSION            ?= "2.4"
> +LIBTOOL_HAS_SYSROOT                  ?= "yes"
>  
>  # Prefer glibc 2.6 and uclibc 0.9.30, these have had the most testing.
>  PREFERRED_VERSION_glibc              ?= "${PREFERRED_GLIBC_VERSION}"
> @@ -57,6 +59,11 @@ PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}g++              = "gcc-cross"
>  
>  # Others
>  PREFERRED_PROVIDER_linux-libc-headers = "linux-libc-headers"
> +PREFERRED_VERSION_libtool = "${PREFERRED_LIBTOOL_VERSION}"
> +PREFERRED_VERSION_libtool-cross = "${PREFERRED_LIBTOOL_VERSION}"
> +PREFERRED_VERSION_libtool-native = "${PREFERRED_LIBTOOL_VERSION}"
> +PREFERRED_VERSION_libtool-sdk = "${PREFERRED_LIBTOOL_VERSION}"
> +PREFERRED_VERSION_libtool-nativesdk = "${PREFERRED_LIBTOOL_VERSION}"
>  
>  #############################################################################
>  # TOOLCHAIN CUSTOMIZATION
> -- 
> 1.7.0.4
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


