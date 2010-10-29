Received: from 30.mail-out.ovh.net ([213.186.62.213])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1PBpqr-0003ga-Ad
	for openembedded-devel@lists.openembedded.org;
	Fri, 29 Oct 2010 16:22:43 +0200
Received: (qmail 4847 invoked by uid 503); 29 Oct 2010 14:01:00 -0000
Received: from b9.ovh.net (HELO mail632.ha.ovh.net) (213.186.33.59)
	by 30.mail-out.ovh.net with SMTP; 29 Oct 2010 14:00:59 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 29 Oct 2010 16:21:55 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO ?192.168.1.15?)
	(ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 29 Oct 2010 16:21:53 +0200
Message-ID: <4CCAD881.8060900@eukrea.com>
Date: Fri, 29 Oct 2010 16:21:53 +0200
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; fr;
	rv:1.9.2.12) Gecko/20101027 Thunderbird/3.1.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1288361334-17427-1-git-send-email-thoughtmonster@gmail.com>
In-Reply-To: <1288361334-17427-1-git-send-email-thoughtmonster@gmail.com>
X-Ovh-Tracer-Id: 15600750584247790921
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 213.186.62.213
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
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
X-List-Received-Date: Fri, 29 Oct 2010 14:22:46 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

Le 29/10/2010 16:08, Alex Ferguson a écrit :
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
> Signed-off-by: Alex Ferguson<thoughtmonster@gmail.com>
Acked-by: Eric Bénard <eric@eukrea.com>
> ---
>   classes/rootfs_ipk.bbclass |    3 ++-
>   1 files changed, 2 insertions(+), 1 deletions(-)
>
> diff --git a/classes/rootfs_ipk.bbclass b/classes/rootfs_ipk.bbclass
> index a4a8563..dd8586a 100644
> --- a/classes/rootfs_ipk.bbclass
> +++ b/classes/rootfs_ipk.bbclass
> @@ -9,9 +9,10 @@ do_rootfs[depends] += "opkg-native:do_populate_sysroot"
>   do_rootfs[lockfiles] = "${DEPLOY_DIR_IPK}.lock"
>
>   IPKG_TMP_DIR = "${IMAGE_ROOTFS}-tmp"
> -IPKG_ARGS = "-f ${IPKGCONF_TARGET} -o ${IMAGE_ROOTFS} -t ${IPKG_TMP_DIR} ${@base_conditional("PACKAGE_INSTALL_NO_DEPS", "1", "-nodeps", "", d)}"
> +IPKG_ARGS = "-f ${IPKGCONF_TARGET} -o ${IMAGE_ROOTFS} -t ${IPKG_TMP_DIR} ${@base_conditional("PACKAGE_INSTALL_NO_DEPS", "1", "-nodeps", "", d)} ${@base_conditional("PACKAGE_FORCE_OVERWRITE", "1", "-force-overwrite", "", d)}"
>
>   PACKAGE_INSTALL_NO_DEPS ?= "0"
> +PACKAGE_FORCE_OVERWRITE ?= "0"
>
>   # What support to provide for online management of packages at run time?
>   #  full ->  traditional system, opkg is installed with all metadata



