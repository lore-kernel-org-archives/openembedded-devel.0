Received: from www.xora.org.uk ([80.68.91.202] helo=xora.vm.bytemark.co.uk)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1PBq7W-00007b-4k
	for openembedded-devel@lists.openembedded.org;
	Fri, 29 Oct 2010 16:39:55 +0200
Received: from localhost (localhost [127.0.0.1])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTP id 210DCA53DA
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Oct 2010 15:39:10 +0100 (BST)
X-Virus-Scanned: Debian amavisd-new at xora.vm.bytemark.co.uk
Received: from xora.vm.bytemark.co.uk ([127.0.0.1])
	by localhost (xora.vm.bytemark.co.uk [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id x9SKnMKOUBlz
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Oct 2010 15:39:09 +0100 (BST)
Received: from [192.168.1.10] (188-220-34-37.zone11.bethere.co.uk
	[188.220.34.37])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTPSA id 681B3A53D7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Oct 2010 15:39:09 +0100 (BST)
Message-ID: <4CCADC8F.6080909@xora.org.uk>
Date: Fri, 29 Oct 2010 15:39:11 +0100
From: Graeme Gregory <dp@xora.org.uk>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-GB;
	rv:1.9.2.11) Gecko/20101013 Lightning/1.0b2 Thunderbird/3.1.5
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1288361334-17427-1-git-send-email-thoughtmonster@gmail.com>
In-Reply-To: <1288361334-17427-1-git-send-email-thoughtmonster@gmail.com>
X-Enigmail-Version: 1.1.1
X-SA-Exim-Connect-IP: 80.68.91.202
X-SA-Exim-Mail-From: dp@xora.org.uk
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] classes: Modify rootfs_ipk.bbclass for	-force-overwrite.
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
X-List-Received-Date: Fri, 29 Oct 2010 14:39:55 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

This is generally an unsafe way to do things, but I dont see an issue
with allowing a user or distro to force it.

Acked-by: Graeme Gregory <dp@xora.org.uk>

On 29/10/2010 15:08, Alex Ferguson wrote:
> Rationale: In Jlime we ship a package called jlime-extras which
> contains several files (configuration files, scripts, etc.), some
> of which conflict with files provided by other packages. This is
> intentional, and is for distro customization purposes. For example
> we ship a modified version of the /usr/bin/startx script, some
> alternative icons for applications, some modified .desktop files
> and so on. Building an image with this jlime-extras package fails,
> of course, due to conflicting files.
>
> To overcome this issue, I have added a base-conditional to
> rootfs_ipk.bbclass, adding the PACKAGE_FORCE_OVERWRITE variable
> to IPKG_ARGS which enables -force-overwrite for opkg, and which
> can be used in image recipes individually without affecting others.
>
> I believe this functionality might be useful for everyone and comes
> at almost no additional cost, which is why I'm sending this patch
> for consideration by the OE developers.
>
> I'd be more than happy to help in any way in order to get this in.
>
> Thank you.
>
> Signed-off-by: Alex Ferguson <thoughtmonster@gmail.com>
> ---
>  classes/rootfs_ipk.bbclass |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
>
> diff --git a/classes/rootfs_ipk.bbclass b/classes/rootfs_ipk.bbclass
> index a4a8563..dd8586a 100644
> --- a/classes/rootfs_ipk.bbclass
> +++ b/classes/rootfs_ipk.bbclass
> @@ -9,9 +9,10 @@ do_rootfs[depends] += "opkg-native:do_populate_sysroot"
>  do_rootfs[lockfiles] = "${DEPLOY_DIR_IPK}.lock"
>  
>  IPKG_TMP_DIR = "${IMAGE_ROOTFS}-tmp"
> -IPKG_ARGS = "-f ${IPKGCONF_TARGET} -o ${IMAGE_ROOTFS} -t ${IPKG_TMP_DIR} ${@base_conditional("PACKAGE_INSTALL_NO_DEPS", "1", "-nodeps", "", d)}"
> +IPKG_ARGS = "-f ${IPKGCONF_TARGET} -o ${IMAGE_ROOTFS} -t ${IPKG_TMP_DIR} ${@base_conditional("PACKAGE_INSTALL_NO_DEPS", "1", "-nodeps", "", d)} ${@base_conditional("PACKAGE_FORCE_OVERWRITE", "1", "-force-overwrite", "", d)}"
>  
>  PACKAGE_INSTALL_NO_DEPS ?= "0"
> +PACKAGE_FORCE_OVERWRITE ?= "0"
>  
>  # What support to provide for online management of packages at run time?
>  #  full -> traditional system, opkg is installed with all metadata



