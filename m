Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SZogK-0005SW-RB
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 May 2012 21:35:45 +0200
Received: by dalh21 with SMTP id h21so211274dal.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 May 2012 12:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=GBmn158OQcp4n79+tWVR1l0JTyuhMKFUUcWh/+6i98I=;
	b=PKO+y1H0RA13Dtmd9kEoKd2/se8RTHIZPJU7qIN0vQR1wnrFetuI6NlH9gYP52HPzo
	IpMiIdQJ4cLE1csPVYufYGQmLNrSm1rmLFIRy6OyrsvvtiDEOWBP0+y/dBP0npXJFUXE
	RNx1ZalkG4FyHJLemAHntVacEQkj64b++y6384JhOEVk3rqE0lTVgmvx7m4s/zK7VpTA
	MmYU8x40dsfJ2zcYKPqO1cDxD+m2FfPxPdSaOSaDcSqW0HHIJTpj+gi6ahsuPAhrZJLA
	2L+EtxBqZDO3LpD4WpYmJEyjmVlTDiHZI/Ddf/52+Ibp55mzO9qOtuGhPgwNWUOpjOiI
	/QRw==
Received: by 10.68.226.193 with SMTP id ru1mr52685773pbc.79.1338405925139;
	Wed, 30 May 2012 12:25:25 -0700 (PDT)
Received: from sakrah.homelinux.org
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id vi10sm1409107pbc.4.2012.05.30.12.25.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 30 May 2012 12:25:23 -0700 (PDT)
Date: Wed, 30 May 2012 12:24:52 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120530192452.GA8099@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org,
	Elvis Dowson <elvis.dowson@gmail.com>
References: <1338404160-6968-1-git-send-email-elvis.dowson@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1338404160-6968-1-git-send-email-elvis.dowson@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-xilinx] tune-ppc440.inc: Add support for PowerPC 440 processor for Xilinx Virtex-5 FXT FPGA.
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
X-List-Received-Date: Wed, 30 May 2012 19:35:45 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (30/05/12 20:55), Elvis Dowson wrote:
> This commit adds support for the PowerPC 440 processor for the Xilinx
> Virtex-5 FXT FPGA.
> 


this looks ok to me


> Signed-off-by: Elvis Dowson <elvis.dowson@gmail.com>
> ---
>  meta/conf/machine/include/tune-ppc440.inc |   14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>  create mode 100644 meta/conf/machine/include/tune-ppc440.inc
> 
> diff --git a/meta/conf/machine/include/tune-ppc440.inc b/meta/conf/machine/include/tune-ppc440.inc
> new file mode 100644
> index 0000000..394364d
> --- /dev/null
> +++ b/meta/conf/machine/include/tune-ppc440.inc
> @@ -0,0 +1,14 @@
> +DEFAULTTUNE ?= "ppc440"
> +
> +require conf/machine/include/powerpc/arch-powerpc.inc
> +
> +TUNEVALID[ppc440] = "Enable ppc440 specific processor optimizations"
> +TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppc440", "-mcpu=440", "", d)}"
> +
> +AVAILTUNES += "ppc440"
> +TUNE_FEATURES_tune-ppc440 = "m32 fpu-soft ppc440"
> +TUNE_PKGARCH_tune-ppc440 = "ppc440"
> +PACKAGE_EXTRA_ARCHS_tune-ppc440 = "${PACKAGE_EXTRA_ARCHS_tune-powerpc-nf} ppc440"
> +
> +# glibc configure options to get 440 specific library (for sqrt)
> +GLIBC_EXTRA_OECONF += "${@bb.utils.contains("TUNE_FEATURES", "ppc440", "-with-cpu=440", "", d)}"
> -- 
> 1.7.9.5
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-- 
-Khem


