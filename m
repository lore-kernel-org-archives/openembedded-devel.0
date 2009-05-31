Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MAlLR-0001qZ-Q7
	for openembedded-devel@openembedded.org; Sun, 31 May 2009 15:45:02 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1MAlD4-0003e8-CP
	for openembedded-devel@openembedded.org; Sun, 31 May 2009 13:36:22 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sun, 31 May 2009 13:36:22 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sun, 31 May 2009 13:36:22 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 31 May 2009 15:36:08 +0200
Message-ID: <gvu149$nlk$1@ger.gmane.org>
References: <1243774077-19022-1-git-send-email-k.kooi@student.utwente.nl>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1pre) Gecko/20090526 Shredder/3.0b3pre
In-Reply-To: <1243774077-19022-1-git-send-email-k.kooi@student.utwente.nl>
Sender: news <news@ger.gmane.org>
Subject: Re: [STABLE][PATCH] xserver-common: add 1.24 from .dev
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
X-List-Received-Date: Sun, 31 May 2009 13:45:03 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 31-05-09 14:47, Koen Kooi wrote:
> From: Koen Kooi<koen@openembedded.org>

Grrrrr. git send-email stripped the comment again:
* This makes xdg autostart applications autostart

Note that the checksum is already in.


>
>
> Signed-off-by: Koen Kooi<koen@openembedded.org>
> ---
>   recipes/xserver-common/files/89xdgautostart.sh |    9 +++++++++
>   recipes/xserver-common/xserver-common_1.24.bb  |   19 +++++++++++++++++++
>   2 files changed, 28 insertions(+), 0 deletions(-)
>   create mode 100644 recipes/xserver-common/files/89xdgautostart.sh
>   create mode 100644 recipes/xserver-common/xserver-common_1.24.bb
>
> diff --git a/recipes/xserver-common/files/89xdgautostart.sh b/recipes/xserver-common/files/89xdgautostart.sh
> new file mode 100644
> index 0000000..9886f9f
> --- /dev/null
> +++ b/recipes/xserver-common/files/89xdgautostart.sh
> @@ -0,0 +1,9 @@
> +#!/bin/sh
> +
> +XDGAUTOSTART=/etc/xdg/autostart
> +if [ -d $XDGAUTOSTART ] ; then
> +    for SCRIPT in $XDGAUTOSTART/*; do
> +        CMD=`grep ^Exec= $SCRIPT | cut -d '=' -f 2`
> +        $CMD&
> +    done
> +fi
> diff --git a/recipes/xserver-common/xserver-common_1.24.bb b/recipes/xserver-common/xserver-common_1.24.bb
> new file mode 100644
> index 0000000..1059160
> --- /dev/null
> +++ b/recipes/xserver-common/xserver-common_1.24.bb
> @@ -0,0 +1,19 @@
> +DESCRIPTION = "Common X11 scripts and support files"
> +LICENSE = "GPL"
> +SECTION = "x11"
> +RDEPENDS_${PN} = "xmodmap xrandr xdpyinfo"
> +PR = "r3"
> +
> +PACKAGE_ARCH = "all"
> +
> +# we are using a gpe-style Makefile
> +inherit gpe
> +
> +SRC_URI_append = " file://setDPI.sh \
> +                   file://89xdgautostart.sh \
> +"
> +
> +do_install_append() {
> +	install -m 0755 "${WORKDIR}/setDPI.sh" "${D}/etc/X11/Xinit.d/50setdpi"
> +	install -m 0755 "${WORKDIR}/89xdgautostart.sh" "${D}/etc/X11/Xsession.d/89xdgautostart"
> +}




