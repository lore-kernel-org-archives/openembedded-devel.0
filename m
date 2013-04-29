Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1UWiEh-0004Bk-Cv
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Apr 2013 09:10:57 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga101.ch.intel.com with ESMTP; 28 Apr 2013 23:52:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,571,1363158000"; d="scan'208";a="325820543"
Received: from lpalcu-linux.rb.intel.com (HELO [10.237.105.165])
	([10.237.105.165])
	by fmsmga001.fm.intel.com with ESMTP; 28 Apr 2013 23:51:59 -0700
Message-ID: <517E188E.6080309@intel.com>
Date: Mon, 29 Apr 2013 09:51:58 +0300
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130221 Thunderbird/17.0.3
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1364293926-32661-1-git-send-email-laurentiu.palcu@intel.com>
	<1364296289-23374-1-git-send-email-laurentiu.palcu@intel.com>
In-Reply-To: <1364296289-23374-1-git-send-email-laurentiu.palcu@intel.com>
Cc: otavio@ossystems.com.br
Subject: Re: [meta-browser][PATCH v2] nss: change shebang line for smime script
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
X-List-Received-Date: Mon, 29 Apr 2013 07:11:08 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Ping!

On 03/26/2013 01:11 PM, Laurentiu Palcu wrote:
> This patch fixes the shebang line of the smime script and also adds a
> 'perl' RDEPENDS for the main package since smime needs perl to run.
> 
> Also, this patch fixes some do_rootfs failures when using RPM backend
> because RPM automatically scans the files and, if perl scripts are
> found, adds dependency on the file found in the shebang line (i.e.
> /usr/local/bin/perl).
> 
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
> ---
> Changes in v2:
>  * moved the RDEPENDS line at the end to conform with the style guide;
> 
> Thanks,
> Laurentiu
> 
>  recipes-support/nss/nss_3.13.3.bb |    3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/recipes-support/nss/nss_3.13.3.bb b/recipes-support/nss/nss_3.13.3.bb
> index 59c16e8..fbab6ee 100644
> --- a/recipes-support/nss/nss_3.13.3.bb
> +++ b/recipes-support/nss/nss_3.13.3.bb
> @@ -105,7 +105,10 @@ do_install() {
>  	sed -i s:OELIBDIR:${libdir}:g ${D}${libdir}/pkgconfig/nss.pc
>  	sed -i s:OEINCDIR:${includedir}:g ${D}${libdir}/pkgconfig/nss.pc
>  	sed -i s:OEEXECPREFIX:${exec_prefix}:g ${D}${libdir}/pkgconfig/nss.pc
> +
> +	sed -i s:/usr/local/bin/perl:${bindir}/perl:g ${D}${bindir}/smime
>  }
>  
>  FILES_SOLIBSDEV := ""
>  FILES_${PN} += "${base_libdir}/lib*${SOLIBSDEV} ${libdir}/lib*${SOLIBSDEV}"
> +RDEPENDS_${PN} += "perl"
> 


