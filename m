Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Otcp9-0003N7-Bq for openembedded-devel@lists.openembedded.org;
	Thu, 09 Sep 2010 10:49:47 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OtcoU-0005a1-Af for openembedded-devel@lists.openembedded.org;
	Thu, 09 Sep 2010 10:48:58 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Sep 2010 10:48:58 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Sep 2010 10:48:58 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 09 Sep 2010 10:48:50 +0200
Message-ID: <i6a71i$2tv$1@dough.gmane.org>
References: <1284010137-15488-1-git-send-email-raj.khem@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.11) Gecko/20100729 Shredder/3.0.7pre
In-Reply-To: <1284010137-15488-1-git-send-email-raj.khem@gmail.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] libgles-omap3_3.01.00.07.bb: Add recipe
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
X-List-Received-Date: Thu, 09 Sep 2010 08:49:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 09-09-10 07:28, Khem Raj wrote:
> * Fix omap3-sgx-modules_1.4.14.2616.bb to use new SDK

Khem, the .07 release was made to get the license and distribution
changes through, it can now be downloaded with wget without filling in a
form.
Could you please amend this patch so that the recipes fetch it directly?


regards,

Koen


> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../powervr-drivers/libgles-omap3_3.01.00.07.bb    |   19 +++++++++++++++++++
>  .../omap3-sgx-modules_1.4.14.2616.bb               |    8 +++-----
>  2 files changed, 22 insertions(+), 5 deletions(-)
>  create mode 100644 recipes/powervr-drivers/libgles-omap3_3.01.00.07.bb
> 
> diff --git a/recipes/powervr-drivers/libgles-omap3_3.01.00.07.bb b/recipes/powervr-drivers/libgles-omap3_3.01.00.07.bb
> new file mode 100644
> index 0000000..30a65b3
> --- /dev/null
> +++ b/recipes/powervr-drivers/libgles-omap3_3.01.00.07.bb
> @@ -0,0 +1,19 @@
> +BINLOCATION = "${S}/gfx_rel_es3.x"
> +
> +ES2LOCATION = "${S}/gfx_rel_es2.x"
> +ES3LOCATION = "${S}/gfx_rel_es3.x"
> +ES5LOCATION = "${S}/gfx_rel_es5.x"
> +
> +require libgles-omap3.inc
> +
> +# download required binary distribution from:
> +# http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/latest/index_FDS.html
> +# see libgles-omap3.inc for detailed installation instructions
> +
> +SGXPV = "3_01_00_07"
> +IMGPV = "1.4.14.2616"
> +BINFILE := "OMAP35x_Graphics_SDK_setuplinux_${SGXPV}.bin"
> +
> +SRC_URI[md5sum] = "b33a82d393ed0a6c26ad0d952542d762"
> +SRC_URI[sha256sum] = "6f1720c2a8c2ce84b0020e144c2d77b56106a1fff45b44f8fcfd74d0f2559d8e"
> +
> diff --git a/recipes/powervr-drivers/omap3-sgx-modules_1.4.14.2616.bb b/recipes/powervr-drivers/omap3-sgx-modules_1.4.14.2616.bb
> index 0d2818b..fc98b7b 100644
> --- a/recipes/powervr-drivers/omap3-sgx-modules_1.4.14.2616.bb
> +++ b/recipes/powervr-drivers/omap3-sgx-modules_1.4.14.2616.bb
> @@ -10,12 +10,11 @@ PR_append = "c"
>  TI_BIN_UNPK_CMDS="Y: qY:workdir:Y"
>  require ../ti/ti-eula-unpack.inc
>  
> -SGXPV = "3_01_00_06"
> +SGXPV = "3_01_00_07"
>  IMGPV = "1.4.14.2616"
>  BINFILE := "OMAP35x_Graphics_SDK_setuplinux_${SGXPV}.bin"
>  
>  SRC_URI = "http://install.source.dir.local/OMAP35x_Graphics_SDK_setuplinux_${SGXPV}.bin \
> -           file://texture-width.patch;striplevel=2 \
>  "
>  
>  S = "${WORKDIR}/OMAP35x_Graphics_SDK_${SGXPV}/GFX_Linux_KM"
> @@ -35,6 +34,5 @@ do_install() {
>  	   ${S}/services4/3rdparty/bufferclass_ti/bufferclass_ti.ko \
>  	   ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/gpu/pvr
>  }
> -
> -SRC_URI[md5sum] = "7aa37ca72f34011d353e72cc67f8aac1"
> -SRC_URI[sha256sum] = "02276bc728699c36b0d2411c60f23030aa066ca6b8ed5adb7a40204563a227fb"
> +SRC_URI[md5sum] = "b33a82d393ed0a6c26ad0d952542d762"
> +SRC_URI[sha256sum] = "6f1720c2a8c2ce84b0020e144c2d77b56106a1fff45b44f8fcfd74d0f2559d8e"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMiJ9yMkyGM64RGpERAoK2AJ9SsjGBUCtYY5/BOE8FX9ZQq8in3wCgqhnk
H28hsB4lTTxnuJUwxpjcSJc=
=9LzQ
-----END PGP SIGNATURE-----



