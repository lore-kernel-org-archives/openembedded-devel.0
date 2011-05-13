Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefan@datenfreihafen.org>) id 1QKwvW-0004X0-QA
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 May 2011 20:17:26 +0200
Received: from p4fc7654c.dip.t-dialin.net ([79.199.101.76]
	helo=excalibur.local) by sirius.lasnet.de with esmtpsa 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.69 #1)
	id 1QKwsm-0003uX-M3 by authid <stefan@sostec.de> with srv_auth_cram_md5;
	Fri, 13 May 2011 20:14:39 +0200
Received: from stefan by excalibur.local with local (Exim 4.76)
	(envelope-from <stefan@excalibur.local>)
	id 1QKwsk-0002Dn-J3; Fri, 13 May 2011 20:14:34 +0200
Date: Fri, 13 May 2011 20:14:34 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
Message-ID: <20110513181434.GK29302@excalibur.local>
References: <1305290080.2448.3.camel@gnutoo-laptop>
	<1305290588-7057-9-git-send-email-GNUtoo@no-log.org>
MIME-Version: 1.0
In-Reply-To: <1305290588-7057-9-git-send-email-GNUtoo@no-log.org>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.5
Cc: openembedded-devel@lists.openembedded.org,
	Stefan Schmidt <stefan@buglabs.net>
Subject: Re: [PATCH 09/12] task-bug: fix do_rootfs conflict
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
X-List-Received-Date: Fri, 13 May 2011 18:17:26 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Fri, 2011-05-13 at 14:43, Denis 'GNUtoo' Carikli wrote:
> Without that patch we have(at do_rootfs)
>   Configuring hostap-daemon.
>   Collected errors:
>    * extract_archive: Cannot create symlink from ./var/run to 'volatile/run': File exists.
>    * file_md5sum_alloc: Failed to open file .../rootfs/bug-image-production/etc/opkg/*.conf: No such file or directory.
>    * check_data_file_clashes: Package dnsmasq-dbus wants to install file .../rootfs/bug-image-production/etc/init.d/dnsmasq
>           But that file is already provided by package  * dnsmasq
>    * check_data_file_clashes: Package dnsmasq-dbus wants to install file .../rootfs/bug-image-production/usr/bin/dnsmasq
>           But that file is already provided by package  * dnsmasq
>    * opkg_install_cmd: Cannot install package task-bug-network.
>    * resolve_conffiles: Existing conffile .../rootfs/bug-image-production/etc/device_table is different from the conffile
>      in the new package. The new conffile will be placed at .../rootfs/bug-image-production/etc/device_table-opkg.
> 
> Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>

Good catch.

Acked-by: Stefan Schmidt <stefan@buglabs.net>


> ---
>  recipes/tasks/task-bug.bb |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes/tasks/task-bug.bb b/recipes/tasks/task-bug.bb
> index 1317a6e..f81c56a 100644
> --- a/recipes/tasks/task-bug.bb
> +++ b/recipes/tasks/task-bug.bb
> @@ -1,6 +1,6 @@
>  # Copyright (C) 2011 Bug Labs, Inc
>  
> -PR = "r88"
> +PR = "r89"
>  
>  ALLOW_EMPTY = "1"
>  
> @@ -25,7 +25,7 @@ RDEPENDS_${PN} = "${MACHINE_EXTRA_RRECOMMENDS} \
>  RDEPENDS_${PN}_append_bug20 = "bug2v4l2"
>  
>  RDEPENDS_${PN}-network = "\
> -                  dnsmasq \
> +                  dnsmasq-dbus \
>                    hostap-daemon \
>                    iptables \
>                    eject \
> -- 
> 1.7.0.4
> 


