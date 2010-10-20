Received: from helsinki.digox.de ([87.106.28.129] helo=digox.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mok@mnet-online.de>) id 1P8Tjz-0004cv-Ts
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Oct 2010 10:09:45 +0200
Received: from gonzales.localnet by digox.de with esmtp (emil_Fk.fnHvuqfpv9);
	Wed, 20 Oct 2010 10:04:32 +0200
From: "Klaus 'mrmoku' Kurzmann" <mok@mnet-online.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Oct 2010 10:04:32 +0200
User-Agent: KMail/1.13.5 (Linux/2.6.34.7-56.fc13.x86_64; KDE/4.4.5; x86_64; ; )
References: <1287427884-1517-1-git-send-email-morphis@gravedo.de>
	<1287427884-1517-14-git-send-email-morphis@gravedo.de>
In-Reply-To: <1287427884-1517-14-git-send-email-morphis@gravedo.de>
MIME-Version: 1.0
Message-Id: <201010201004.33331.mok@mnet-online.de>
X-SA-Exim-Connect-IP: 87.106.28.129
X-SA-Exim-Mail-From: mok@mnet-online.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 13/15] initscripts-shr: add mountdevtmpfs init script for palmpre machine
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
X-List-Received-Date: Wed, 20 Oct 2010 08:09:45 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Acked-by: Klaus Kurzmann <mok@fluxnetz.de>

> On the palmpre machine we are currently come into the SHR rootfs through
> mounting it from /boot and switch the rootfs via pivot_root. So we can't
> automatically mount devtmpfs on /dev. Instead we do this right after SHR
> begins to boot and before any other filesystem is mounted on the new
> rootfs.
> 
> Signed-off-by: Simon Busch <morphis@gravedo.de>
> ---
>  .../shr/initscripts-shr/palmpre/mountdevtmpfs.sh   |    9 +++++++++
>  recipes/shr/initscripts-shr_0.0.1.bb               |    9 ++++++++-
>  2 files changed, 17 insertions(+), 1 deletions(-)
>  create mode 100644 recipes/shr/initscripts-shr/palmpre/mountdevtmpfs.sh
> 
> diff --git a/recipes/shr/initscripts-shr/palmpre/mountdevtmpfs.sh
> b/recipes/shr/initscripts-shr/palmpre/mountdevtmpfs.sh new file mode
> 100644
> index 0000000..dbeb7c0
> --- /dev/null
> +++ b/recipes/shr/initscripts-shr/palmpre/mountdevtmpfs.sh
> @@ -0,0 +1,9 @@
> +#!/bin/sh
> +
> +mount -t devtmpfs -o mode=0755,nr_inodes=0 devtmpfs /dev
> +
> +# Create additional nodes which devtmpfs does not provide
> +test -c /dev/fd || ln -s /proc/self/fd /dev/fd
> +test -c /dev/stdin || ln -s fd/0 /dev/stdin
> +test -c /dev/stdout || ln -s fd/1 /dev/stdout
> +test -c /dev/stderr || ln -s fd/2 /dev/stderr
> diff --git a/recipes/shr/initscripts-shr_0.0.1.bb
> b/recipes/shr/initscripts-shr_0.0.1.bb index e4dc736..ce76fbd 100644
> --- a/recipes/shr/initscripts-shr_0.0.1.bb
> +++ b/recipes/shr/initscripts-shr_0.0.1.bb
> @@ -5,7 +5,7 @@ DEPENDS = ""
>  RDEPENDS_${PN} = "procps"
>  LICENSE = "GPL"
>  PV = "0.0.1"
> -PR = "r20"
> +PR = "r21"
> 
>  RCONFLICTS_${PN} = "initscripts"
> 
> @@ -32,6 +32,8 @@ SRC_URI = "file://alignment.sh \
>  	   file://umountnfs.sh \
>  	   "
> 
> +SRC_URI_append_palmpre = " file://mountdevtmpfs.sh"
> +
>  inherit base
> 
>  do_install () {
> @@ -74,6 +76,11 @@ do_install () {
>  	install -m 0755	${WORKDIR}/umountfs		${D}${sysconfdir}/init.d
>  	install -m 0755	${WORKDIR}/umountnfs.sh		${D}${sysconfdir}/init.d
> 
> +	if [ "${MACHINE}" == "palmpre" ]; then
> +		install -m 0755 ${WORKDIR}/mountdevtmpfs.sh ${D}${sysconfdir}/init.d
> +		ln -sf ../init.d/mountdevtmpfs.sh
> ${D}${sysconfdir}/rcS.d/S03mountdevtmpfs.sh +	fi
> +
>  #
>  # Create runlevel links
>  #
-- 
Klaus 'mrmoku' Kurzmann


