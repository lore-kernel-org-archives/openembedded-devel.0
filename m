Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Sp4YZ-00076b-55
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Jul 2012 23:34:47 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 11 Jul 2012 14:23:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="170669686"
Received: from unknown (HELO helios.localnet) ([10.252.121.5])
	by orsmga002.jf.intel.com with ESMTP; 11 Jul 2012 14:23:33 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 11 Jul 2012 22:23:32 +0100
Message-ID: <1944811.VoTLKehAUd@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.4 (Linux/3.2.0-26-generic-pae; KDE/4.8.4; i686; ; )
In-Reply-To: <1342028002-4580-1-git-send-email-andrea.adami@gmail.com>
References: <1342028002-4580-1-git-send-email-andrea.adami@gmail.com>
MIME-Version: 1.0
Subject: Re: [meta-handheld][PATCH] formfactor: add machine-specific /etc/rotation for psplash
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
X-List-Received-Date: Wed, 11 Jul 2012 21:34:47 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 11 July 2012 19:33:22 Andrea Adami wrote:
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ---
>  recipes-bsp/formfactor/formfactor_0.0.bbappend |   15 ++++++++++++++-
>  1 files changed, 14 insertions(+), 1 deletions(-)
> 
> diff --git a/recipes-bsp/formfactor/formfactor_0.0.bbappend
> b/recipes-bsp/formfactor/formfactor_0.0.bbappend index e406684..aaa24f5
> 100644
> --- a/recipes-bsp/formfactor/formfactor_0.0.bbappend
> +++ b/recipes-bsp/formfactor/formfactor_0.0.bbappend
> @@ -1,4 +1,17 @@
> -PRINC := "${@int(PRINC) + 1}"
> +PRINC := "${@int(PRINC) + 2}"
> 
>  FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
> 
> +do_install_prepend () {
> +	# provide machine-specific /etc/rotation for psplash
> +	sed -n 's/^[ \t]DISPLAY_ORIENTATION[ \t]*//p' ${S}/machconfig | tr -dc
> '[0-9]' > ${S}/rotation +	printf "\n" >> ${S}/rotation
> +}
> +
> +do_install_append () {
> +	# Only install file if it has a content
> +	if [ -s "${S}/rotation" ]; then
> +	install -d ${D}${sysconfdir}
> +	install -m 0644 ${S}/rotation ${D}${sysconfdir}/rotation
> +	fi
> +}

Merged to meta-handheld master, thanks.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


