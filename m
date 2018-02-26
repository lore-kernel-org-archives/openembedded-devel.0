Return-Path: <zboszor@pr.hu>
X-Greylist: delayed 912 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 26 Feb 2018 05:52:39 UTC
Received: from mail7.pr.hu (mail7.pr.hu [87.242.0.7])
	by mail.openembedded.org (Postfix) with ESMTP id D6D2578687
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Feb 2018 05:52:39 +0000 (UTC)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1eqBTb-0002UL-Uj; Mon, 26 Feb 2018 06:37:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203;
	h=Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=XvMjsekqRmSM6mYymCzyzh5K9V0RbWRiH0015vnN69c=;
	b=gKDAlcZ8mO00chis4iBAiJgNO/
	h0naKzqgML0+VhspgZK//fTvyspKXjgF8LU/fsh+zqzeZLK37vijrN1JYIumdSk6EOr9ERNjjGudh
	FyyFsJD6xtxOOphV62wPWWFqnVSAOHSRsH5TBNTJ/niMx9yXimWdIH9RE4f4Hut8bOO32/oFEp90S
	ohlMRJZznNzub5bf8W8KjehB40sTQCubgKHO0f5ql8nxhRWBvBk0ZT1ltg3Pw2Fqgm4vIbiw+tjgf
	IYnrNPi78MSHhFLPnY+/GaU+x5hqzl6bIVwqURbjrSBfDi+qFeYDjrgaxcvnTvqkG8vDFkZcMzkTX
	e+qrkV0Q==;
Received: from [2a02:808:1:101:250:56ff:feb3:f9e6] (helo=webmail.prtelecom.hu)
	by mail.pr.hu with esmtpa (Exim 4.89) (envelope-from <zboszor@pr.hu>)
	id 1eqBTX-0002if-DV; Mon, 26 Feb 2018 06:37:25 +0100
Received: from host-88-132-200-166.prtelecom.hu ([88.132.200.166])
	by webmail.prtelecom.hu
	with HTTP (HTTP/1.1 POST); Mon, 26 Feb 2018 06:37:21 +0100
MIME-Version: 1.0
Date: Mon, 26 Feb 2018 06:37:21 +0100
From: zboszor@pr.hu
To: Martin Jansa <martin.jansa@gmail.com>
In-Reply-To: <20180224105155.14511-1-Martin.Jansa@gmail.com>
References: <20180224105155.14511-1-Martin.Jansa@gmail.com>
Message-ID: <f95e15a0e40deb7eb0d3f579fb5740d7@pr.hu>
X-Sender: zboszor@pr.hu
User-Agent: Roundcube Webmail/1.1.2
X-Remote-Browser: Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:58.0)
	Gecko/20100101 Firefox/58.0
X-Originating-IP: 88.132.200.166
X-RoundCube-Server: 87.242.47.26
X-Host-Lookup-Failed: Reverse DNS lookup failed for
	2a02:808:1:101:250:56ff:feb3:f9e6 (failed)
X-Spam-Score: 0.6 (/)
X-Scan-Signature: 495dd38594254b4b369437c5c51728fb
X-Spam-Tracer: backend.mail.pr.hu 0.6 20180226053725Z
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] vboxguestdrivers: upgrade to 5.2.6
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 26 Feb 2018 05:52:40 -0000
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

2018-02-24 11:51 időpontban Martin Jansa ezt írta:

> * 5.1.26 doesn't build with 4.15 kernel

But 5.1.32 does IIRC.

Anyway, kernel 4.15 includes the vboxguest and vboxvideo
drivers which has the advantage that these drivers are
signed properly (in case you have set it in the kernel config)
unlike the drivers coming from vboxguestdrivers.

> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
> .../linux-4.15.0-rc8-VBoxGuestAdditions-amd64.diff | 90 
> ++++++++++++++++++++++
> ...drivers_5.1.26.bb => vboxguestdrivers_5.2.6.bb} | 22 ++++--
> 2 files changed, 107 insertions(+), 5 deletions(-)
> create mode 100644 
> meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/linux-4.15.0-rc8-VBoxGuestAdditions-amd64.diff
> rename 
> meta-oe/recipes-support/vboxguestdrivers/{vboxguestdrivers_5.1.26.bb => 
> vboxguestdrivers_5.2.6.bb} (69%)
> 
> diff --git 
> a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/linux-4.15.0-rc8-VBoxGuestAdditions-amd64.diff 
> b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/linux-4.15.0-rc8-VBoxGuestAdditions-amd64.diff
> new file mode 100644
> index 0000000000..23a9021f04
> --- /dev/null
> +++ 
> b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/linux-4.15.0-rc8-VBoxGuestAdditions-amd64.diff
> @@ -0,0 +1,90 @@
> +Based on:
> +https://raw.githubusercontent.com/mjmaravillo/misc/master/linux-4.15.0-rc8-VBoxGuestAdditions-amd64.diff 
> [1]
> +
> +Upstream-Status: Pending (hopefully new vbox will be released soon 
> with proper 4.15 support, this patch isn't backwards compatible)
> +
> +--- vbox_module.orig/vboxvideo/vbox_mode.c 2018-02-18 
> 16:42:47.000000000 +0000
> ++++ vbox_module/vboxvideo/vbox_mode.c 2018-02-18 16:55:14.466029313 
> +0000
> +@@ -396,7 +396,7 @@
> +
> + /* pick the encoder ids */
> + if (enc_id)
> +- return drm_encoder_find(connector->dev, enc_id);
> ++ return drm_encoder_find(connector->dev, NULL, enc_id);
> +
> + return NULL;
> + }
> +--- vbox_module.orig/vboxguest/VBoxGuest-linux.c 2018-02-18 
> 16:42:28.000000000 +0000
> ++++ vbox_module/vboxguest/VBoxGuest-linux.c 2018-02-18 
> 16:54:36.793049118 +0000
> +@@ -1058,7 +1058,7 @@
> + #if LINUX_VERSION_CODE >= KERNEL_VERSION(2, 6, 0)
> +
> + /** log and dbg_log parameter setter. */
> +-static int vgdrvLinuxParamLogGrpSet(const char *pszValue, struct 
> kernel_param *pParam)
> ++static int vgdrvLinuxParamLogGrpSet(const char *pszValue, const 
> struct kernel_param *pParam)
> + {
> + if (g_fLoggerCreated)
> + {
> +@@ -1073,7 +1073,7 @@
> + }
> +
> + /** log and dbg_log parameter getter. */
> +-static int vgdrvLinuxParamLogGrpGet(char *pszBuf, struct kernel_param 
> *pParam)
> ++static int vgdrvLinuxParamLogGrpGet(char *pszBuf, const struct 
> kernel_param *pParam)
> + {
> + PRTLOGGER pLogger = pParam->name[0] == 'd' ? RTLogDefaultInstance() : 
> RTLogRelGetDefaultInstance();
> + *pszBuf = '\0';
> +@@ -1084,7 +1084,7 @@
> +
> +
> + /** log and dbg_log_flags parameter setter. */
> +-static int vgdrvLinuxParamLogFlagsSet(const char *pszValue, struct 
> kernel_param *pParam)
> ++static int vgdrvLinuxParamLogFlagsSet(const char *pszValue, const 
> struct kernel_param *pParam)
> + {
> + if (g_fLoggerCreated)
> + {
> +@@ -1098,7 +1098,7 @@
> + }
> +
> + /** log and dbg_log_flags parameter getter. */
> +-static int vgdrvLinuxParamLogFlagsGet(char *pszBuf, struct 
> kernel_param *pParam)
> ++static int vgdrvLinuxParamLogFlagsGet(char *pszBuf, const struct 
> kernel_param *pParam)
> + {
> + PRTLOGGER pLogger = pParam->name[0] == 'd' ? RTLogDefaultInstance() : 
> RTLogRelGetDefaultInstance();
> + *pszBuf = '\0';
> +@@ -1109,7 +1109,7 @@
> +
> +
> + /** log and dbg_log_dest parameter setter. */
> +-static int vgdrvLinuxParamLogDstSet(const char *pszValue, struct 
> kernel_param *pParam)
> ++static int vgdrvLinuxParamLogDstSet(const char *pszValue, const 
> struct kernel_param *pParam)
> + {
> + if (g_fLoggerCreated)
> + {
> +@@ -1123,7 +1123,7 @@
> + }
> +
> + /** log and dbg_log_dest parameter getter. */
> +-static int vgdrvLinuxParamLogDstGet(char *pszBuf, struct kernel_param 
> *pParam)
> ++static int vgdrvLinuxParamLogDstGet(char *pszBuf, const struct 
> kernel_param *pParam)
> + {
> + PRTLOGGER pLogger = pParam->name[0] == 'd' ? RTLogDefaultInstance() : 
> RTLogRelGetDefaultInstance();
> + *pszBuf = '\0';
> +@@ -1134,7 +1134,7 @@
> +
> +
> + /** r3_log_to_host parameter setter. */
> +-static int vgdrvLinuxParamR3LogToHostSet(const char *pszValue, struct 
> kernel_param *pParam)
> ++static int vgdrvLinuxParamR3LogToHostSet(const char *pszValue, const 
> struct kernel_param *pParam)
> + {
> + if ( pszValue == NULL
> + || *pszValue == '\0'
> +@@ -1152,7 +1152,7 @@
> + }
> +
> + /** r3_log_to_host parameter getter. */
> +-static int vgdrvLinuxParamR3LogToHostGet(char *pszBuf, struct 
> kernel_param *pParam)
> ++static int vgdrvLinuxParamR3LogToHostGet(char *pszBuf, const struct 
> kernel_param *pParam)
> + {
> + strcpy(pszBuf, g_DevExt.fLoggingEnabled ? "enabled" : "disabled");
> + return strlen(pszBuf);
> diff --git 
> a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.1.26.bb 
> b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.2.6.bb
> similarity index 69%
> rename from 
> meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.1.26.bb
> rename to 
> meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.2.6.bb
> index fdefe03172..c018b789f2 100644
> --- 
> a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.1.26.bb
> +++ 
> b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.2.6.bb
> @@ -12,22 +12,27 @@ COMPATIBLE_MACHINE = "(qemux86|qemux86-64)"
> VBOX_NAME = "VirtualBox-${PV}"
> 
> SRC_URI = 
> "http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}.tar.bz2 
> [2] \
> - file://Makefile.utils [3] \
> + file://Makefile.utils [3] \
> "
> -SRC_URI[md5sum] = "d3aec8190c649d7e0d92ba374779dfe3"
> -SRC_URI[sha256sum] = 
> "b5715035e681a11ef1475f83f9503d34a00f0276b89c572eebec363dda80c8a9"
> +
> +# For default linux-yocto 4.15
> +SRC_URI += "file://linux-4.15.0-rc8-VBoxGuestAdditions-amd64.diff [4]"
> +
> +SRC_URI[md5sum] = "4490d6929dfae41cdf05e34f583318c8"
> +SRC_URI[sha256sum] = 
> "fe705288ee50efcce10ff4c80e461a1c7091e461a7b55f98842fa1c9772ca4e7"
> 
> S = "${WORKDIR}/vbox_module"
> 
> export BUILD_TARGET_ARCH="${ARCH}"
> export BUILD_TARGET_ARCH_x86-64="amd64"
> -export KERN_DIR="${STAGING_KERNEL_DIR}"
> +
> +EXTRA_OEMAKE += "KERN_DIR='${WORKDIR}/${KERNEL_VERSION}/build'"
> 
> addtask export_sources before do_patch after do_unpack
> 
> do_export_sources() {
> mkdir -p "${S}"
> - ${WORKDIR}/${VBOX_NAME}/src/VBox/Additions/linux/export_modules 
> ${T}/vbox_modules.tar.gz
> + ${WORKDIR}/${VBOX_NAME}/src/VBox/Additions/linux/export_modules.sh 
> ${T}/vbox_modules.tar.gz
> tar -C "${S}" -xzf ${T}/vbox_modules.tar.gz
> 
> # add a mount utility to use shared folder from VBox Addition Source 
> Code
> @@ -38,6 +43,13 @@ do_export_sources() {
> 
> }
> 
> +do_configure_prepend() {
> + # 
> vboxguestdrivers/5.2.6-r0/vbox_module/vboxguest/Makefile.include.header:99: 
> *** The variable KERN_DIR must be a kernel build folder and end with 
> /build without a trailing slash, or KERN_VER must be set. Stop.
> + # 
> vboxguestdrivers/5.2.6-r0/vbox_module/vboxguest/Makefile.include.header:108: 
> *** The kernel build folder path must end in <version>/build, or the 
> variable KERN_VER must be set. Stop.
> + mkdir -p ${WORKDIR}/${KERNEL_VERSION}
> + ln -snf ${STAGING_KERNEL_DIR} ${WORKDIR}/${KERNEL_VERSION}/build
> +}
> +
> # compile and install mount utility
> do_compile_append() {
> oe_runmake 'LD=${CC}' 'LDFLAGS=${LDFLAGS}' -C ${S}/utils
> --
> 2.15.1



Links:
------
[1] 
https://raw.githubusercontent.com/mjmaravillo/misc/master/linux-4.15.0-rc8-VBoxGuestAdditions-amd64.diff
[2] http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}.tar.bz2
[3] file://Makefile.utils
[4] file://linux-4.15.0-rc8-VBoxGuestAdditions-amd64.diff

