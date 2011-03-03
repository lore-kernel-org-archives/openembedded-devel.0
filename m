Received: from vms173003pub.verizon.net ([206.46.173.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1PvCQC-0006vS-SN
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Mar 2011 18:34:41 +0100
Received: from gandalf.denix.org ([unknown] [71.251.48.61])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LHH007NISQ0ZVJ1@vms173003.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	03 Mar 2011 11:32:38 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 96E1014AF6A; Thu,
	03 Mar 2011 12:32:24 -0500 (EST)
Date: Thu, 03 Mar 2011 12:32:24 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Ben Gardiner <bengardiner@nanometrics.ca>
Message-id: <20110303173224.GA16888@denix.org>
References: <AANLkTinJtQfjxd5PTN8oFWiMudqvPsyQgwDu3tt=C+++@mail.gmail.com>
	<1299170071-9268-1-git-send-email-bengardiner@nanometrics.ca>
MIME-version: 1.0
In-reply-to: <1299170071-9268-1-git-send-email-bengardiner@nanometrics.ca>
User-Agent: Mutt/1.5.16 (2007-06-09)
Cc: arago-devel@gforge.ti.com, openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] external-toolchain-csl: allow gdbserver
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
X-List-Received-Date: Thu, 03 Mar 2011 17:34:41 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Mar 03, 2011 at 11:34:31AM -0500, Ben Gardiner wrote:
> If PREFERRED_PROVIDER_gdbserver is defined as anything other than
> external-toolchain-csl then don't PROVIDE or install the gdbserver
> packaged with the CSL toolchain.

Ben,

I am now testing the same exact change in my local tree, as the result of last 
night testing. I should be pushing it to OE very soon. Thanks.

Denys

> Signed-off-by: Ben Gardiner <bengardiner@nanometrics.ca>
> 
> ---
> 
> This fixes the arago build 
> rm -rf arago-tmp ; MACHINE=da850-omapl138-evm bitbake
> arago-console-image
> 
> on the following checkouts:
> arago: d6634b5366be96e1d4c7ce12411e2058183d26cb
> arago-oe-dev: (merge of 414823a3c0a88a3c6ff0f3b0187626b1905bfca4 from
> git://git.openembedded.org/openembedded  into
> 0d7feb26d6d16da8327c258deb3260ac423813cd)
> arago-bitbake: 789382350344a40a3d7c094b5a96bee2a69d01fa
> 
> The arago distro uses a specific
> version of gdbserver and hence has PREFERRED_PROVIDER_gdbserver =
> "gdbserver". Changing the PREFERRED_PROVIDER_gdbserver to external-
> toolchain-csl does not fix the problem:
> 
> | Collected errors:
> |  * resolve_conffiles: Existing conffile
> /media/unixdata/src/oe-helios-next/arago-tmp/rootfs/arago-console-image/etc/device_table
> is different from the conffile in the new package. The new conffile
> will be placed at
> /media/unixdata/src/oe-helios-next/arago-tmp/rootfs/arago-console-image/etc/device_table-opkg.
> |  * file_md5sum_alloc: Failed to open file
> /media/unixdata/src/oe-helios-next/arago-tmp/rootfs/arago-console-image/etc/opkg/*:
> No such file or directory.
> |  * file_md5sum_alloc: Failed to open file
> /media/unixdata/src/oe-helios-next/arago-tmp/rootfs/arago-console-image/etc/opkg/angstrom/*:
> No such file or directory.
> |  * satisfy_dependencies_for: Cannot satisfy the following
> dependencies for task-arago-console:
> |  *    gdbserver *
> |  * opkg_install_cmd: Cannot install package task-arago-console.
> | ERROR: Function do_rootfs failed
> 
> ---
>  recipes/meta/external-toolchain-csl.bb |   12 ++++++++----
>  1 files changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/recipes/meta/external-toolchain-csl.bb b/recipes/meta/external-toolchain-csl.bb
> index e56b74f..d492d3c 100644
> --- a/recipes/meta/external-toolchain-csl.bb
> +++ b/recipes/meta/external-toolchain-csl.bb
> @@ -1,4 +1,4 @@
> -PR = "r9"
> +PR = "r10"
>  
>  INHIBIT_DEFAULT_DEPS = "1"
>  
> @@ -23,10 +23,13 @@ PROVIDES = "\
>  	virtual/libiconv \
>  	glibc-thread-db \
>  	${@base_conditional('PREFERRED_PROVIDER_linux-libc-headers', 'external-toolchain-csl', 'linux-libc-headers', '', d)} \
> -	gdbserver \
> +	${@base_conditional('PREFERRED_PROVIDER_gdbserver', 'external-toolchain-csl', 'gdbserver', '', d)} \
>  "
>  
> -DEPENDS = "${@base_conditional('PREFERRED_PROVIDER_linux-libc-headers', 'external-toolchain-csl', '', 'linux-libc-headers', d)}"
> +DEPENDS = "\
> +	${@base_conditional('PREFERRED_PROVIDER_linux-libc-headers', 'external-toolchain-csl', '', 'linux-libc-headers', d)} \
> +	${@base_conditional('PREFERRED_PROVIDER_gdbserver', 'external-toolchain-csl', '', 'gdbserver', d)} \
> +"
>  RPROVIDES_glibc-dev += "libc-dev libc6-dev virtual-libc-dev"
>  PACKAGES_DYNAMIC += "glibc-gconv-*"
>  PACKAGES_DYNAMIC += "glibc-locale-*"
> @@ -46,7 +49,7 @@ PACKAGES = "\
>  	nscd \
>  	ldd \
>  	localedef \
> -	gdbserver \
> +	${@base_conditional('PREFERRED_PROVIDER_gdbserver', 'external-toolchain-csl', 'gdbserver', '', d)} \
>  	glibc-utils \
>  	glibc-dev \
>  	glibc-locale \
> @@ -230,6 +233,7 @@ do_install() {
>  		|| true
>  	cp -a ${TOOLCHAIN_PATH}/${TARGET_SYS}/libc/usr/* ${D}/usr
>  	${@base_conditional('PREFERRED_PROVIDER_linux-libc-headers', 'external-toolchain-csl', '', 'rm -rf ${D}/usr/include/linux', d)}
> +	${@base_conditional('PREFERRED_PROVIDER_gsbserver', 'external-toolchain-csl', '', 'rm -rf ${D}${FILES_gdbserver}', d)}
>  	cp -a ${TOOLCHAIN_PATH}/${TARGET_SYS}/include/* ${D}/usr/include
>  
>  	rm -rf ${D}${sysconfdir}/rpc
> -- 
> 1.7.1
> 


