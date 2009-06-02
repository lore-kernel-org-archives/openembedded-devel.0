Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MBUVz-00061e-JI
	for openembedded-devel@openembedded.org; Tue, 02 Jun 2009 15:58:57 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1MBUNR-00051O-5j
	for openembedded-devel@openembedded.org; Tue, 02 Jun 2009 13:50:05 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 02 Jun 2009 13:50:05 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 02 Jun 2009 13:50:05 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 02 Jun 2009 15:49:51 +0200
Message-ID: <h03alv$1cg$1@ger.gmane.org>
References: <1243950214-11794-1-git-send-email-marcin@juszkiewicz.com.pl>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1pre) Gecko/20090526 Shredder/3.0b3pre
In-Reply-To: <1243950214-11794-1-git-send-email-marcin@juszkiewicz.com.pl>
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH 1/1] fbprogress: BUG only tool to show boot progress on built-in monochrome LCD
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
X-List-Received-Date: Tue, 02 Jun 2009 13:59:01 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02-06-09 15:43, Marcin Juszkiewicz wrote:
> From: Marcin Juszkiewicz<marcin@buglabs.net>

Acked-by: Koen Kooi <koen@openembedded.org>


>
>
> Signed-off-by: Marcin Juszkiewicz<marcin@juszkiewicz.com.pl>
> ---
>   recipes/fbprogress/fbprogress/fbprogress-init |   34 +++++++++++++++++++++++++
>   recipes/fbprogress/fbprogress_1.1.bb          |   32 +++++++++++++++++++++++
>   2 files changed, 66 insertions(+), 0 deletions(-)
>   create mode 100755 recipes/fbprogress/fbprogress/fbprogress-init
>   create mode 100644 recipes/fbprogress/fbprogress_1.1.bb
>
> diff --git a/recipes/fbprogress/fbprogress/fbprogress-init b/recipes/fbprogress/fbprogress/fbprogress-init
> new file mode 100755
> index 0000000..c1dd378
> --- /dev/null
> +++ b/recipes/fbprogress/fbprogress/fbprogress-init
> @@ -0,0 +1,34 @@
> +#!/bin/sh
> +
> +. /etc/init.d/functions
> +
> +case "$1" in
> +    start)
> +    # We don't want this script to block the rest of the boot process
> +    if [ "$2" != "background" ]; then
> +	$0 $1 background&
> +    else
> +	. /etc/profile
> +
> +	echo "Starting FBProgress"
> +	fbprogress.sh&
> +    fi
> +    ;;
> +
> +    stop)
> +    echo "Stopping FBProgress"
> +    killproc fbprogress.sh
> +    ;;
> +
> +    restart)
> +    $0 stop
> +    sleep 1
> +    $0 start
> +    ;;
> +
> +    *)
> +    echo "usage: $0 { start | stop | restart }"
> +    ;;
> +esac
> +
> +exit 0
> diff --git a/recipes/fbprogress/fbprogress_1.1.bb b/recipes/fbprogress/fbprogress_1.1.bb
> new file mode 100644
> index 0000000..8d603b8
> --- /dev/null
> +++ b/recipes/fbprogress/fbprogress_1.1.bb
> @@ -0,0 +1,32 @@
> +DESCRIPTION = "Bug framebuffer progress indicator"
> +AUTHOR = "Angel Roman"
> +HOMEPAGE = "http://www.buglabs.net/"
> +LICENSE = "GPL"
> +DEPENDS = "freetype zlib virtual/kernel"
> +SRCREV = "9118"
> +PR = "r1"
> +
> +SRC_URI = "svn://svn.buglabs.net/bug/trunk;module=com.buglabs.bug.native.fbprogress;proto=svn \
> +           file://fbprogress-init"
> +
> +S = "${WORKDIR}/com.buglabs.bug.native.fbprogress"
> +
> +inherit update-rc.d
> +
> +EXTRA_OEMAKE = "BUG_LINUX_SRC=${STAGING_KERNEL_DIR}"
> +
> +do_install() {
> +  install -d ${D}/${sysconfdir}/fbprogress
> +  install -m 0644 ${S}/images/* ${D}/${sysconfdir}/fbprogress/
> +  install -d ${D}${layout_bindir}
> +  install -m 0755 fbprogress ${D}${layout_bindir}
> +  install -m 0755 fbprogress.sh ${D}${layout_bindir}
> +  install -d ${D}/${sysconfdir}/init.d
> +  install -m 0755 ${WORKDIR}/fbprogress-init ${D}/${sysconfdir}/init.d/fbprogress
> +}
> +
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +COMPATIBLE_MACHINE = "bug"
> +
> +INITSCRIPT_NAME = "fbprogress"
> +INITSCRIPT_PARAMS = "start 01 S . stop 15  0 1 2 3 4 5 6 ."




