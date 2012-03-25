Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SBwRx-0001J1-At
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Mar 2012 01:02:13 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 25 Mar 2012 15:53:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="81460677"
Received: from unknown (HELO helios.localnet) ([10.252.123.226])
	by AZSMGA002.ch.intel.com with ESMTP; 25 Mar 2012 15:53:12 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Mar 2012 23:53:09 +0100
Message-ID: <2528658.TKgTc9yPJL@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.0 (Linux/3.0.0-16-generic-pae; KDE/4.8.1; i686; ; )
In-Reply-To: <1332029635-5078-1-git-send-email-andrea.adami@gmail.com>
References: <1332029635-5078-1-git-send-email-andrea.adami@gmail.com>
MIME-Version: 1.0
Subject: Re: [meta-handheld][PATCH] keymaps: edit script to reuse 2.6 kernel keymaps
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
X-List-Received-Date: Sun, 25 Mar 2012 23:02:13 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Sunday 18 March 2012 01:13:55 Andrea Adami wrote:
> * The keymap.sh script installed by oe-core recipe has a check
> * for KERNEL_MAJMIN=`uname -r | cut -d '.' -f 1,2`
> * so the keymaps-2.6.map's are ignored when running 3.x kernels
> * Thus, we replace the suffix of the runtime kernel with "2.6" in the
> .bbappend. * Bump PR
> 
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ---
>  recipes-bsp/keymaps/keymaps_1.0.bbappend |    7 ++++++-
>  1 files changed, 6 insertions(+), 1 deletions(-)
> 
> diff --git a/recipes-bsp/keymaps/keymaps_1.0.bbappend
> b/recipes-bsp/keymaps/keymaps_1.0.bbappend index d3310c1..039b30c 100644
> --- a/recipes-bsp/keymaps/keymaps_1.0.bbappend
> +++ b/recipes-bsp/keymaps/keymaps_1.0.bbappend
> @@ -1,4 +1,4 @@
> -PRINC = "1"
> +PRINC = "2"
> 
>  FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
> 
> @@ -20,6 +20,11 @@ SRC_URI_append_jornada6xx   = "
> file://keymap-uk-620-660.map \ file://keymap-uk.map \
>  				"
> 
> +# we still use keymap-2.6.map files
> +do_configure_append () {
> +    sed -i -e 's/KERNEL_MAJMIN=.*$/KERNEL_MAJMIN="2.6"/'
> ${WORKDIR}/keymap.sh +}
> +
>  do_install_append () {
>      case ${MACHINE} in
>          c7x0 | tosa | akita | spitz | collie | poodle | h2200 | h4000 |
> hx4700 | jornada6xx )

Merged to meta-handheld master, thanks.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


