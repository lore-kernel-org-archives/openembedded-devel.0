Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1NvHcW-0001oW-6e
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Mar 2010 23:03:12 +0100
Received: from p5b036e7d.dip.t-dialin.net ([91.3.110.125] helo=excalibur)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1NvHZM-0001ZR-Eh by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Mar 2010 23:00:02 +0100
Received: from stefan by excalibur with local (Exim 4.71)
	(envelope-from <stefan@excalibur.local>) id 1NvHZL-0005ZY-DG
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Mar 2010 22:59:55 +0100
Date: Fri, 26 Mar 2010 22:59:55 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100326215955.GF18337@excalibur.local>
References: <1252561144-5528-1-git-send-email-mike@compulab.co.il>
MIME-Version: 1.0
In-Reply-To: <1252561144-5528-1-git-send-email-mike@compulab.co.il>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 78.47.116.19
X-SA-Exim-Mail-From: stefan@datenfreihafen.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] omap3-sgx-modules: fix proc related build errors
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
X-List-Received-Date: Fri, 26 Mar 2010 22:03:12 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

Koen, omap3-sgx-modules is your area of expertise. Can you comment on this?

regards
Stefan Schmidt

On Thu, 2009-09-10 at 08:39, Mike Rapoport wrote:
> Signed-off-by: Mike Rapoport <mike@compulab.co.il>
> ---
>  .../fix-proc-compile-errors.patch                  |   36 ++++++++++++++++++++
>  .../omap3-sgx-modules_1.3.13.1607.bb               |    1 +
>  2 files changed, 37 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/powervr-drivers/omap3-sgx-modules/fix-proc-compile-errors.patch
> 
> diff --git a/recipes/powervr-drivers/omap3-sgx-modules/fix-proc-compile-errors.patch b/recipes/powervr-drivers/omap3-sgx-modules/fix-proc-compile-errors.patch
> new file mode 100644
> index 0000000..890dc67
> --- /dev/null
> +++ b/recipes/powervr-drivers/omap3-sgx-modules/fix-proc-compile-errors.patch
> @@ -0,0 +1,36 @@
> +From af0a5882ad56d484c94555940c7987ad1a50930f Mon Sep 17 00:00:00 2001
> +From: Mike Rapoport <mike@compulab.co.il>
> +Date: Wed, 9 Sep 2009 18:09:04 +0300
> +Subject: [PATCH] Fix proc compile errors
> +
> +---
> + services4/srvkm/env/linux/proc.c |    3 ---
> + 1 files changed, 0 insertions(+), 3 deletions(-)
> + mode change 100755 => 100644 services4/srvkm/env/linux/proc.c
> +
> +diff --git a/services4/srvkm/env/linux/proc.c b/services4/srvkm/env/linux/proc.c
> +old mode 100755
> +new mode 100644
> +index 274c35f..8470f5a
> +--- a/services4/srvkm/env/linux/proc.c
> ++++ b/services4/srvkm/env/linux/proc.c
> +@@ -134,7 +134,6 @@ int CreateProcEntry(const char * name, read_proc_t rhandler, write_proc_t whandl
> + 
> +     if (file)
> +     {
> +-        file->owner = THIS_MODULE;
> + 		file->read_proc = rhandler;
> + 		file->write_proc = whandler;
> + 		file->data = data;
> +@@ -165,8 +164,6 @@ int CreateProcReadEntry(const char * name, pvr_read_proc_t handler)
> + 
> +     if (file)
> +     {
> +-        file->owner = THIS_MODULE;
> +-
> +         return 0;
> +     }
> + 
> +-- 
> +1.6.0.6
> +
> diff --git a/recipes/powervr-drivers/omap3-sgx-modules_1.3.13.1607.bb b/recipes/powervr-drivers/omap3-sgx-modules_1.3.13.1607.bb
> index 8e4d2a2..527ef2c 100644
> --- a/recipes/powervr-drivers/omap3-sgx-modules_1.3.13.1607.bb
> +++ b/recipes/powervr-drivers/omap3-sgx-modules_1.3.13.1607.bb
> @@ -7,6 +7,7 @@ SRC_URI = "file://omap3-sgx-modules-${PV}.tar.bz2 \
>             file://0002-Compile-fixes-for-DSS2.patch;patch=1 \
>             file://rotation-dss2.patch;patch=1 \
>             file://build_es3.x_sgx.patch;patch=1 \
> +	   file://fix-proc-compile-errors.patch;patch=1 \
>  "
>  
>  PVRBUILD = "release"
> -- 
> 1.6.0.6
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


