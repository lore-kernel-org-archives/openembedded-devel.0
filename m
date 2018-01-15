Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id BF6187869A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jan 2018 19:28:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id CA06620B99;
	Mon, 15 Jan 2018 19:28:27 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id wldR1ibNlJc5; Mon, 15 Jan 2018 19:28:27 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id AA5C620B98;
	Mon, 15 Jan 2018 19:28:26 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 34F8816325F; Mon, 15 Jan 2018 14:28:26 -0500 (EST)
Date: Mon, 15 Jan 2018 14:28:26 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Isaac Nickaein <nickaein.i@gmail.com>
Message-ID: <20180115192826.GN9657@denix.org>
References: <CA+NJmkdfNKmdi=6RZDtBt2tiZfp3nqZ=Nd5jy=+fGPXKGNODHw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+NJmkdfNKmdi=6RZDtBt2tiZfp3nqZ=Nd5jy=+fGPXKGNODHw@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-qt5] [rocko] qtbase fails at do_compile for i.MX7
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
X-List-Received-Date: Mon, 15 Jan 2018 19:28:27 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Quoting someone from irc:
"this is an error introduced by meta-fsl"
"honestly, meta-fsl is a mistery for me"


On Sat, Jan 13, 2018 at 08:01:30PM +0330, Isaac Nickaein wrote:
> Hi,
> 
> I've been trying to build the qt5 using meta-qt5 layer for Colibri
> i.MX7 modules.
> I've cloned meta-oe and related layers on rocko branch and also
> meta-qt5. The list of all layers are mentioned down below.
> 
> The compile error I am getting is apparently related to
> mis-configuration of recipes that don't exactly know the i.MX7
> hardware. For instance:
> 
> /opt/yocto/rocko-poky/poky/build-saba/tmp/work/cortexa9hf-neon-mx6qdl-poky-linux-gnueabi/qtbase/5.9.3+gitAUTOINC+4d8ae444c2-r0/recipe-sysroot/usr/include/EGL/eglplatform.h:146:10:
> fatal error: X11/Xlib.h: No such file or directory
>  #include <X11/Xlib.h>
>           ^~~~~~~~~~~~
> compilation terminated.
> Makefile:621: recipe for target '.obj/qeglstreamconvenience.o' failed
> 
> 
> Apparently something is wrong with Qt 5 configuration which tries to
> use X11 while I have removed it.
> 
> I've tried various settings in my setup but none of them help to
> resolve the issue.
> I think there is a problem either in meta-oe or meta-qt5 that
> mis-configures the qt build.

Actually, the problem is in your mis-understanding of the different 
configuration parameters - see below.


> Here is the conf/local.conf:
> 
> MACHINE = "colibri-imx6"
> DISTRO = "poky"
> 
> PACKAGECONFIG_remove = " x11 wayland wifi 3g bluetooth irda nfc ipv6
> largefile pam pci pcmcia ppp smbfs"

Well, PACKAGECONFIG is a per-recipe variable. Each recipe defines own set of 
those. You cannot just globally tweak them like this from local.conf.


> DISTRO_FEATURES_remove = " x11 wayland wifi 3g bluetooth irda nfc ipv6
> largefile pam pci pcmcia ppp smbfs"
> 
> PACKAGECONFIG_append_pn-qtbase = " gles2 eglfs linuxfb "
> 
> DISTRO_FEATURES_append = " opengles2 egl"

These are not the standard distro features! (*) Adding them here won't do 
anything to qtbase. There is, however, standard "opengl" distro feature, which 
qtbase_git.bb recipe tries to honor. But since you only need "gles2" and not 
full desktop "gl", you can do PACKAGECONFIG_GL_pn-qtbase = "gles2 linuxfb" to 
tweak it. You may still need "opengl" DISTRO_FEATURES, as many recipes require 
it even for "gles2" support.

* theoretically, distros may potentially extend the list and add own features.


Anyway, you can check what the resulting PACKAGECONFIG list looks like for 
qtbase by inspecting the environment:

$ bitbake qtbase -e | grep "^PACKAGECONFIG="



> Here is the bblayers.conf:
> 
> 
> BBLAYERS ?= " \
>   ${BSPDIR}/meta \
>   ${BSPDIR}/meta-poky \
>   ${BSPDIR}/meta-openembedded/meta-oe \
>   ${BSPDIR}/meta-openembedded/meta-python \
>   ${BSPDIR}/meta-openembedded/meta-networking \
>   ${BSPDIR}/meta-openembedded/meta-webserver \
>   ${BSPDIR}/meta-freescale \
>   ${BSPDIR}/meta-freescale-3rdparty \
>   ${BSPDIR}/meta-freescale-distro \
>   ${BSPDIR}/meta-toradex-bsp-common \
>   ${BSPDIR}/meta-toradex-nxp \
>   ${BSPDIR}/meta-swupdate \
>   ${BSPDIR}/meta-qt5 \
> "
> 
> 
> qtbase configuration log:
> https://pastebin.com/GLv04BAZ
> 
> qtbase compile log (with errors):
> https://pastebin.com/JxnRx6nT
> 
> Here is the env variables (outptut of bitbake -e qtbase):
> http://www.pastebin.xyz/p?q=eEIyNW8
> -- 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

