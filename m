Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TRtmr-0000Fo-Io
	for openembedded-devel@lists.openembedded.org;
	Sat, 27 Oct 2012 01:58:01 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 26 Oct 2012 16:44:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,657,1344236400"; d="scan'208";a="211414571"
Received: from unknown (HELO helios.localnet) ([10.252.122.40])
	by orsmga001.jf.intel.com with ESMTP; 26 Oct 2012 16:44:28 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Andrea Adami <andrea.adami@gmail.com>
Date: Sat, 27 Oct 2012 00:44:26 +0100
Message-ID: <9586416.7d8ddFxKUP@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.2 (Linux/3.2.0-32-generic-pae; KDE/4.9.2; i686; ; )
In-Reply-To: <1351291300-4591-1-git-send-email-andrea.adami@gmail.com>
References: <1351289773-25205-1-git-send-email-andrea.adami@gmail.com>
	<1351291300-4591-1-git-send-email-andrea.adami@gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-handheld][PATCH v2] udev_164: update .bbappend to 182 as in oe-core
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
X-List-Received-Date: Fri, 26 Oct 2012 23:58:01 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Saturday 27 October 2012 00:41:40 Andrea Adami wrote:
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ---
>  recipes-core/udev/udev_164.bbappend |    9 ---------
>  recipes-core/udev/udev_182.bbappend |    9 +++++++++
>  2 files changed, 9 insertions(+), 9 deletions(-)
>  delete mode 100644 recipes-core/udev/udev_164.bbappend
>  create mode 100644 recipes-core/udev/udev_182.bbappend
> 
> diff --git a/recipes-core/udev/udev_164.bbappend
> b/recipes-core/udev/udev_164.bbappend deleted file mode 100644
> index 4d263b0..0000000
> --- a/recipes-core/udev/udev_164.bbappend
> +++ /dev/null
> @@ -1,9 +0,0 @@
> -
> -FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> -
> -PRINC := "${@int(PRINC) + 2}"
> -
> -# check only for ABS_X (0x00) and ABS_Y (0x01), ignore ABS_PRESSURE (0x18)
> -do_configure_append () {
> -        sed -i -e 's/"input:*-e0*,3,*a0,1,*18,*"/"input:*-e0*,3,*a0,1,*"/'
> ${WORKDIR}/local.rules -}
> diff --git a/recipes-core/udev/udev_182.bbappend
> b/recipes-core/udev/udev_182.bbappend new file mode 100644
> index 0000000..4d263b0
> --- /dev/null
> +++ b/recipes-core/udev/udev_182.bbappend
> @@ -0,0 +1,9 @@
> +
> +FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> +
> +PRINC := "${@int(PRINC) + 1}"
> +
> +# check only for ABS_X (0x00) and ABS_Y (0x01), ignore ABS_PRESSURE (0x18)
> +do_configure_append () {
> +        sed -i -e 's/"input:*-e0*,3,*a0,1,*18,*"/"input:*-e0*,3,*a0,1,*"/'
> ${WORKDIR}/local.rules +}

v2 merged to meta-handheld master, thanks.

I've also created a danny branch before this commit.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


