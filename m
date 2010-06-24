Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1ORoEF-0000bS-9q
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Jun 2010 17:23:11 +0200
Received: by pwj2 with SMTP id 2so177281pwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Jun 2010 08:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=6QgmqYW/va1DYeqTOfq+csudrtydpXgGpr/9BPmonBo=;
	b=SQ7Ja9ZUj1kzWIZIKJudcaGYU2rUt1tACVUuT/IpQhSEC1gko2Wp7+4fnkmOLdP8oi
	LizNWE5xCM/n32gbwjUPySEBV3m/xrOQA6+UR98y0partMuqNSnhQVn+SwX1XOxrguYJ
	JE6q552GmrOALgUuxWt3UTkSeBEP4+qHla2Ic=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=MJGKx/FIwqW1G5ge+rIccew6U+qD9R1dSFH9GXlo7egRy5Aip2cXndX45N+AfcuoxI
	lV4b1roBcwEJvWi6ksFRrKN8avitrI0DPgC5Rry4mkE/2QX5seJEo2LX/getTX8VtBsK
	bC6MUomTPi/zaSYtdHSvQGgu6qmFbj33vQm88=
Received: by 10.142.66.11 with SMTP id o11mr9314208wfa.121.1277392531968;
	Thu, 24 Jun 2010 08:15:31 -0700 (PDT)
Received: from gmail.com ([99.57.141.118])
	by mx.google.com with ESMTPS id s21sm4221410wff.12.2010.06.24.08.15.30
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 24 Jun 2010 08:15:31 -0700 (PDT)
Date: Thu, 24 Jun 2010 08:16:38 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100624151638.GC28292@gmail.com>
References: <alpine.LNX.2.00.1006240651040.4844@asterix.crazy-teaparty.dyndns.org>
	<1277383917-23599-1-git-send-email-vjensen@gmx.de>
MIME-Version: 1.0
In-Reply-To: <1277383917-23599-1-git-send-email-vjensen@gmx.de>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Vitus Jensen <vjensen@gmx.de>
Subject: Re: [PATCH] libusb1_1.0.8: new recipe
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
X-List-Received-Date: Thu, 24 Jun 2010 15:27:59 -0000
X-List-Received-Date: Thu, 24 Jun 2010 15:27:59 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (24/06/10 14:51), Vitus Jensen wrote:
> 
> Signed-off-by: Vitus Jensen <vjensen@gmx.de>

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
>  recipes/libusb/libusb1_1.0.8.bb |   18 ++++++++++++++++++
>  1 files changed, 18 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/libusb/libusb1_1.0.8.bb
> 
> diff --git a/recipes/libusb/libusb1_1.0.8.bb b/recipes/libusb/libusb1_1.0.8.bb
> new file mode 100644
> index 0000000..360dce5
> --- /dev/null
> +++ b/recipes/libusb/libusb1_1.0.8.bb
> @@ -0,0 +1,18 @@
> +DESCRIPTION = "library to provide userspace access to USB devices"
> +HOMEPAGE = "http://libusb.sf.net"
> +SECTION = "libs"
> +LICENSE = "LGPLv2.1"
> +
> +PR = "r0"
> +
> +SRC_URI = " \
> +	${SOURCEFORGE_MIRROR}/libusb/libusb-${PV}.tar.bz2;name=tar \
> +	"
> +S = "${WORKDIR}/libusb-${PV}"
> +
> +inherit autotools
> +
> +EXTRA_OECONF = "--disable-build-docs"
> +
> +SRC_URI[tar.md5sum] = "37d34e6eaa69a4b645a19ff4ca63ceef"
> +SRC_URI[tar.sha256sum] = "21d0d3a5710f7f4211c595102c6b9eccb42435a17a4f5bd2c3f4166ab1badba9"
> -- 
> 1.5.6.5
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


