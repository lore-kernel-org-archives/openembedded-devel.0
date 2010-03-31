Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Nx4VL-00055h-8d
	for openembedded-devel@lists.openembedded.org;
	Wed, 31 Mar 2010 22:27:12 +0200
Received: by gwj21 with SMTP id 21so249238gwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Mar 2010 13:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=zPIhfZ2MpRnla+GYWIC9azOfeoVthbLCd+ecUWFjtlY=;
	b=QZpBQL/VsfrB940a7l/3wk23KjL+FlW4ffQpG7AvwM1O2StNvd3zezUZ5NRdXIPblt
	A5FIE1xGUdZ7t4chBaNQqWrShV7JYMzBgsU3IjLlMDAZQCyqqtCdvfKn1RPda51EBHgJ
	IDMe+OXSrZy/fKTAd4R3v09ORCujoozHfRgzU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=tveXHblyR1OPFZ7nwecomRndKWIg5lsITfd2L/zIG60haEJjb8mka7fZ4AavzuGN9c
	hBlCsNZT2j/Jw7s+qIXrLDJOwLpbNXuHMlmH9KuWIEDEZAAYLXRLdqKG8RfhWFfdM2l7
	kvO71HNGO1NS/XVA/Ic5Qo6IcWoKHs/UQea+g=
Received: by 10.151.29.8 with SMTP id g8mr451511ybj.8.1270067032918;
	Wed, 31 Mar 2010 13:23:52 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id 7sm1841934ywf.25.2010.03.31.13.23.51
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 31 Mar 2010 13:23:52 -0700 (PDT)
Date: Wed, 31 Mar 2010 13:24:38 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100331202438.GA21433@gmail.com>
References: <1270061972-5564-1-git-send-email-khimov@altell.ru>
MIME-Version: 1.0
In-Reply-To: <1270061972-5564-1-git-send-email-khimov@altell.ru>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS,
	UPPERCASE_50_75 autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/3] bitbake.conf: add STAGING_SBINDIR_NATIVE
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
X-List-Received-Date: Wed, 31 Mar 2010 20:27:12 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (31/03/10 22:59), Roman I Khimov wrote:
> Makes referencing it easier.
> 
> Signed-off-by: Roman I Khimov <khimov@altell.ru>

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
>  conf/bitbake.conf |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
> 
> diff --git a/conf/bitbake.conf b/conf/bitbake.conf
> index b941b90..2193553 100644
> --- a/conf/bitbake.conf
> +++ b/conf/bitbake.conf
> @@ -300,6 +300,7 @@ STAGING_DIR = "${TMPDIR}/staging"
>  STAGING_DIR_JAVA = "${STAGING_DIR}/java"
>  STAGING_DIR_NATIVE = "${STAGING_DIR}/${BUILD_SYS}"
>  STAGING_BINDIR_NATIVE = "${STAGING_DIR_NATIVE}${bindir_native}"
> +STAGING_SBINDIR_NATIVE = "${STAGING_DIR_NATIVE}${sbindir_native}"
>  STAGING_BINDIR_CROSS  = "${STAGING_DIR_NATIVE}${bindir_native}/${MULTIMACH_HOST_SYS}"
>  STAGING_BINDIR_CROSS_BASEPKG = "${STAGING_DIR_NATIVE}${bindir_native}/${BASEPKG_TARGET_SYS}"
>  STAGING_LIBDIR_NATIVE = "${STAGING_DIR_NATIVE}${libdir_native}"
> @@ -414,7 +415,7 @@ EXTRA_IMAGEDEPENDS = ""
>  
>  CROSS_DIR = "${TMPDIR}/cross/${BASE_PACKAGE_ARCH}"
>  CROSS_DATADIR = "${CROSS_DIR}/share"
> -PATH_prepend = "${STAGING_BINDIR_CROSS}:${STAGING_BINDIR_CROSS_BASEPKG}:${STAGING_DIR_NATIVE}${sbindir_native}:${STAGING_BINDIR_NATIVE}:${CROSS_DIR}/${bindir_cross}:${STAGING_DIR_NATIVE}${base_sbindir_native}:${STAGING_DIR_NATIVE}${base_bindir_native}:"
> +PATH_prepend = "${STAGING_BINDIR_CROSS}:${STAGING_BINDIR_CROSS_BASEPKG}:${STAGING_SBINDIR_NATIVE}:${STAGING_BINDIR_NATIVE}:${CROSS_DIR}/${bindir_cross}:${STAGING_DIR_NATIVE}${base_sbindir_native}:${STAGING_DIR_NATIVE}${base_bindir_native}:"
>  export PATH
>  
>  ##################################################################
> -- 
> 1.6.4.2
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


