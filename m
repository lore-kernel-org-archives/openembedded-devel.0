Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UcwKE-0004Su-7p
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 May 2013 13:26:22 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 16 May 2013 04:08:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,683,1363158000"; d="scan'208";a="303330920"
Received: from unknown (HELO helios.localnet) ([10.255.12.131])
	by azsmga001.ch.intel.com with ESMTP; 16 May 2013 04:07:47 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 May 2013 12:07:46 +0100
Message-ID: <35097503.pfpZKaxdO7@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.8.0-19-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <1368701701-1918-1-git-send-email-paul.eggleton@linux.intel.com>
References: <1368701701-1918-1-git-send-email-paul.eggleton@linux.intel.com>
MIME-Version: 1.0
Subject: Re: [PATCH] collectd: fix build failure with libnotify in sysroot
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
X-List-Received-Date: Thu, 16 May 2013 11:26:23 -0000
X-List-Received-Date: Thu, 16 May 2013 11:26:23 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 16 May 2013 11:55:01 Paul Eggleton wrote:
> If libnotify is in the sysroot, collectd will try to use it and then
> fail at do_compile because gtk/gtk.h can't be found. Since this is
> functionality that's not likely to be needed in the embedded context as
> far as collectd goes, just disable it.
> 
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>  meta-oe/recipes-extended/collectd/collectd_5.2.2.bb | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta-oe/recipes-extended/collectd/collectd_5.2.2.bb
> b/meta-oe/recipes-extended/collectd/collectd_5.2.2.bb index
> a508840..8641530 100644
> --- a/meta-oe/recipes-extended/collectd/collectd_5.2.2.bb
> +++ b/meta-oe/recipes-extended/collectd/collectd_5.2.2.bb
> @@ -26,6 +26,7 @@ EXTRA_OECONF = " \
>                  ${FPLAYOUT} \
>                  --disable-perl --with-libperl=no --with-perl-bindings=no \
>                  --with-libgcrypt=${STAGING_BINDIR_CROSS}/libgcrypt-config \
> +                --disable-notify_desktop \
>  "
> 
>  do_install_append() {

I missed out the subject prefix, sorry, this is meant for the meta-oe layer in 
case it wasn't obvious.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


