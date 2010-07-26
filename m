Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1OdIOp-0005Em-I5
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Jul 2010 09:47:00 +0200
Received: from test3.ibr.cs.tu-bs.de ([134.169.35.210] helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1OdIOK-0001Q8-Qx by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jul 2010 09:46:40 +0200
Received: from stefan by excalibur.local with local (Exim 4.72)
	(envelope-from <stefan@excalibur.local>) id 1OdIOE-0007Ze-N6
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Jul 2010 09:46:22 +0200
Date: Mon, 26 Jul 2010 09:46:22 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100726074622.GB27921@excalibur.local>
References: <1279651497-20918-1-git-send-email-morphis@gravedo.de>
	<1279651497-20918-3-git-send-email-morphis@gravedo.de>
MIME-Version: 1.0
In-Reply-To: <1279651497-20918-3-git-send-email-morphis@gravedo.de>
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
Subject: Re: [PATCH 2/4] lvm2.inc: add patch to fix building
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
X-List-Received-Date: Mon, 26 Jul 2010 07:47:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, 2010-07-20 at 20:44, Simon Busch wrote:
> lvm2 fails to build cause there is a include of limits.h missing. The patch adds the
> include to the relevant file of the lvm2 source.
> 
> Signed-off-by: Simon Busch <morphis@gravedo.de>

Acked-by: Stefan Schmidt <stefan@datenfreihafen.org>

> ---
>  recipes/lvm2/files/include-limits.patch |   13 +++++++++++++
>  recipes/lvm2/lvm2.inc                   |    3 ++-
>  2 files changed, 15 insertions(+), 1 deletions(-)
>  create mode 100644 recipes/lvm2/files/include-limits.patch
> 
> diff --git a/recipes/lvm2/files/include-limits.patch b/recipes/lvm2/files/include-limits.patch
> new file mode 100644
> index 0000000..4987766
> --- /dev/null
> +++ b/recipes/lvm2/files/include-limits.patch
> @@ -0,0 +1,13 @@
> +diff -rpN LVM2.2.01.15-orig/lib/locking/cluster_locking.c LVM2.2.01.15/lib/locking/cluster_locking.c
> +*** LVM2.2.01.15-orig/lib/locking/cluster_locking.c	2010-03-16 20:16:45.806355964 +0100
> +--- LVM2.2.01.15/lib/locking/cluster_locking.c	2010-03-16 20:19:08.946345762 +0100
> +***************
> +*** 29,34 ****
> +--- 29,35 ----
> +  #include <sys/socket.h>
> +  #include <sys/un.h>
> +  #include <unistd.h>
> ++ #include <limits.h>
> +  
> +  #ifndef CLUSTER_LOCKING_INTERNAL
> +  int lock_resource(struct cmd_context *cmd, const char *resource, int flags);
> diff --git a/recipes/lvm2/lvm2.inc b/recipes/lvm2/lvm2.inc
> index a7e37b5..080f5ea 100644
> --- a/recipes/lvm2/lvm2.inc
> +++ b/recipes/lvm2/lvm2.inc
> @@ -6,7 +6,8 @@ INC_PR = "r2"
>  
>  S = "${WORKDIR}/LVM2.${PV}"
>  SRC_URI = "ftp://sources.redhat.com/pub/lvm2/old/LVM2.${PV}.tgz \
> -           file://crosscompile_fix.patch"
> +           file://crosscompile_fix.patch \
> +           file://include-limits.patch"
>  
>  # Unset user/group to unbreak install.
>  EXTRA_OECONF = "--with-user= --with-group= --disable-o_direct"
> -- 
> 1.7.0.4
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


