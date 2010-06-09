Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OMLRS-0002xN-7B
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Jun 2010 15:35:39 +0200
Received: by pwj4 with SMTP id 4so2454851pwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Jun 2010 06:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=Z6M9N0RRxRtGgqYbBzIwev6+5Se4PO2z+aKSwsoUCOc=;
	b=xqQuIdHjMY64WrtdeQC080ws7KRiUoyPDFMuhAS9/Ju0mKP6AtY0ESkq4RWmSY5mel
	oN2WEq/1znpxamkVhh43lxazrY5wkeu9bVWyLu7TZIyyTvKI7X8KDYnD3U1si14DzBbc
	ooFEs+hRnpX9hQZKsiX1VkT2UfhnHy7BmUeLY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=R2/Dpoi6sZDtCwsJ31xSzcJth+5RCqgH4OsdxuC1qP871ijJsqHd7cnAtWAfw9CgIy
	yQffI5FRuFsNSiNdLoKogTaQM4yQrDK45qO3cc1CGQ23buTJCIH05MvQL+JLMSymfPAf
	93MtKGGI/e4yn3+K2Y0PlmGi9vunrqsIRmEGQ=
Received: by 10.115.81.15 with SMTP id i15mr14220874wal.112.1276090275204;
	Wed, 09 Jun 2010 06:31:15 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id d16sm64379057wam.12.2010.06.09.06.31.13
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 09 Jun 2010 06:31:14 -0700 (PDT)
Date: Wed, 9 Jun 2010 06:31:26 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100609133126.GB29724@gmail.com>
References: <1276068782-23257-1-git-send-email-mad_soft@inbox.ru>
	<1276068782-23257-3-git-send-email-mad_soft@inbox.ru>
MIME-Version: 1.0
In-Reply-To: <1276068782-23257-3-git-send-email-mad_soft@inbox.ru>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/3] jbig2dec-0.11: new recipe
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
X-List-Received-Date: Wed, 09 Jun 2010 13:35:40 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (09/06/10 11:33), Dmitry Artamonow wrote:
> jbig2dec is a decoder implementation of the JBIG2 image compression
> format. JBIG2 is designed for lossy or lossless encoding of monochrome
> images at moderately high resolution, in particular scanned paper documents.
> 
> Signed-off-by: Dmitry Artamonow <mad_soft@inbox.ru>
> ---
>  recipes/jpeg/jbig2dec_0.11.bb |   19 +++++++++++++++++++
>  1 files changed, 19 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/jpeg/jbig2dec_0.11.bb
> 
> diff --git a/recipes/jpeg/jbig2dec_0.11.bb b/recipes/jpeg/jbig2dec_0.11.bb
> new file mode 100644
> index 0000000..9bc7433
> --- /dev/null
> +++ b/recipes/jpeg/jbig2dec_0.11.bb
> @@ -0,0 +1,19 @@
> +DESCRIPTION = "Decoder implementation of the JBIG2 image compression format"
> +HOMEPAGE = "http://jbig2dec.sourceforge.net/"
> +SECTION = "libs"
> +LICENSE = "GPL"
> +PR = "r0"
> +
> +SRC_URI = "${SOURCEFORGE_MIRROR}/jbig2dec/${PN}-${PV}.tar.gz"
> +
> +inherit autotools
> +
> +do_stage() {
> +        autotools_stage_all
> +}

do_stage is not needed for new staging.


> +
> +PACKAGES =+ "jbig2dec-tools "
> +FILES_jbig2dec-tools = "${bindir}/*"
> +
> +SRC_URI[md5sum] = "1f61e144852c86563fee6e5ddced63f1"
> +SRC_URI[sha256sum] = "7e2d8330b36f2765da22043d174827bee0f30db8d78c330904f363275c7dd0b9"
> -- 
> 1.7.1
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


