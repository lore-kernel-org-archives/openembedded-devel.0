Received: from mail-oa0-f47.google.com ([209.85.219.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1TDzxM-0001g8-7r
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Sep 2012 17:43:24 +0200
Received: by oagn9 with SMTP id n9so6301461oag.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Sep 2012 08:30:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=h4oIlfiKvYv/Y+tFeujDI/gIPAFMS/lMWxV3DC9MvCs=;
	b=Ven2ehmbiU/QDug5qox9fnKcrBqyAgwsgOTu1Y0CZmPyHd/p8W251aaXeYBof0mp1f
	oBvkJ/HsdtUGxMfbWM0CIl+3Xeckd19rgCDan4awu9NOl12JXjHpnpBH3LnBlDszvAMw
	+hCvMhfyy1x7Wqk2NtKHqoaaCaQXD6BINiZi1xyoGFvPyZn0lH0JstTYZJzwkm34g7X3
	WKdUc/CCJvrUHuQuyAmRJzsCy0fWMt3LDygN43+bYXvDzgTog07NF66XcGpt2QJdjK34
	T05EOiMbnfajruTxYbniT1bYHrBzKmnqseHgjcr0zSdtJvbrki1mdXq+lGhrbbJ3hV87
	ASew==
Received: by 10.60.32.136 with SMTP id j8mr432772oei.0.1347982243560; Tue, 18
	Sep 2012 08:30:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.76.93.35 with HTTP; Tue, 18 Sep 2012 08:30:23 -0700 (PDT)
X-Originating-IP: [89.121.200.106]
In-Reply-To: <1347981706-22287-1-git-send-email-andrei@gherzan.ro>
References: <1347981706-22287-1-git-send-email-andrei@gherzan.ro>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Tue, 18 Sep 2012 18:30:23 +0300
Message-ID: <CAK18fxGoXx2gwqi4cGJM-y1aYV49-sP6Jfw7bx_Dyne0BMTorA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQm79CDsXsOLkSp6uLcerm+m5DiAnO238mHoFOeZDi31T3AgJHTysmeTRcFXBotPCGoNd9kN
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] zram: Integrate an init script
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
X-List-Received-Date: Tue, 18 Sep 2012 15:43:24 -0000
Content-Type: text/plain; charset=ISO-8859-1

git send-email with --subject-prefix won't overwrite the subject. As well
"man" says nothing about that flag. So i will resend with
format-patch --subject-prefix... Probably this should be changed in README
as well?

ag

On Tue, Sep 18, 2012 at 6:21 PM, Andrei Gherzan <andrei@gherzan.ro> wrote:

> Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
> ---
>  meta-oe/recipes-extended/zram/zram/init   |   85
> +++++++++++++++++++++++++++++
>  meta-oe/recipes-extended/zram/zram_0.1.bb |   23 ++++++++
>  2 files changed, 108 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/zram/zram/init
>  create mode 100644 meta-oe/recipes-extended/zram/zram_0.1.bb
>
> diff --git a/meta-oe/recipes-extended/zram/zram/init
> b/meta-oe/recipes-extended/zram/zram/init
> new file mode 100644
> index 0000000..d126169
> --- /dev/null
> +++ b/meta-oe/recipes-extended/zram/zram/init
> @@ -0,0 +1,85 @@
> +#!/bin/bash
> +### BEGIN INIT INFO
> +# Provides: zram
> +# Required-Start:
> +# Required-Stop:
> +# Default-Start: 2 3 4 5
> +# Default-Stop: 0 1 6
> +# Short-Description: Increased Performance In Linux With zRam (Virtual
> Swap Compressed in RAM)
> +# Description: Adapted from systemd scripts at
> https://github.com/mystilleef/FedoraZram
> +# Included as part of antix-goodies package by anticapitalista <
> antiX@operamail.com>
> +# This script was written by tradetaxfree and is found at
> http://crunchbanglinux.org/forums/topic/15344/zram-a-good-idea/
> +# Copy this script (as root) from /usr/local/bin to /etc/init.d and then
> #update-rc.d zram defaults
> +# After booting verify the module is loaded with: lsmod | grep zram
> +### END INIT INFO
> +set -e
> +
> +start() {
> +    # get the number of CPUs
> +    num_cpus=$(grep -c processor /proc/cpuinfo)
> +    # if something goes wrong, assume we have 1
> +    [ "$num_cpus" != 0 ] || num_cpus=1
> +
> +    # set decremented number of CPUs
> +    last_cpu=$((num_cpus - 1))
> +
> +    #default Factor % = 90 change this value here or create
> /etc/default/zram
> +    FACTOR=90
> +    #& put the above single line in /etc/default/zram with the value you
> want
> +    [ -f /etc/default/zram ] && source /etc/default/zram || true
> +    factor=$FACTOR # percentage
> +
> +    # get the amount of memory in the machine
> +    memtotal=$(grep MemTotal /proc/meminfo | awk ' { print $2 } ')
> +    mem_by_cpu=$(($memtotal/$num_cpus*$factor/100*1024))
> +
> +    # load dependency modules
> +    modprobe zram zram_num_devices=$num_cpus
> +    echo "zram devices probed successfully"
> +
> +    # initialize the devices
> +    for i in $(seq 0 $last_cpu); do
> +       echo 1 > /sys/block/zram$i/reset
> +       echo $mem_by_cpu > /sys/block/zram$i/disksize
> +       # Creating swap filesystems
> +       mkswap /dev/zram$i
> +       # Switch the swaps on
> +       swapon -p 100 /dev/zram$i
> +    done
> +}
> +
> +stop() {
> +    # get the number of CPUs
> +    num_cpus=$(grep -c processor /proc/cpuinfo)
> +
> +    # set decremented number of CPUs
> +    last_cpu=$((num_cpus - 1))
> +
> +    # Switching off swap
> +    for i in $(seq 0 $last_cpu); do
> +       if [ "$(grep /dev/zram$i /proc/swaps)" != "" ]; then
> +               swapoff /dev/zram$i
> +               sleep 1
> +       fi
> +    done
> +    sleep 1
> +    rmmod zram
> +}
> +
> +case "$1" in
> +    start)
> +        start
> +        ;;
> +    stop)
> +        stop
> +        ;;
> +    restart)
> +        stop
> +        sleep 3
> +        start
> +        ;;
> +    *)
> +        echo "Usage: $0 {start|stop|restart}"
> +        RETVAL=1
> +esac
> +exit $RETVAL
> diff --git a/meta-oe/recipes-extended/zram/zram_0.1.bbb/meta-oe/recipes-extended/zram/
> zram_0.1.bb
> new file mode 100644
> index 0000000..8526264
> --- /dev/null
> +++ b/meta-oe/recipes-extended/zram/zram_0.1.bb
> @@ -0,0 +1,23 @@
> +DESCRIPTION = "Linux zram compressed in-memory swap"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM =
> "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
> +
> +inherit allarch update-rc.d
> +
> +RDEPENDS_${PN} = "util-linux-swaponoff kmod kernel-module-zram"
> +
> +PR = "r0"
> +
> +SRC_URI = " \
> +           file://init \
> +          "
> +
> +do_install () {
> +       # Sysvinit
> +       install -d ${D}${sysconfdir}/init.d
> +       install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/zram
> +}
> +
> +FILES_${PN} = "${sysconfdir}/init.d"
> +INITSCRIPT_NAME = "zram"
> +INITSCRIPT_PARAMS = "start 05 2 3 4 5 . stop 22 0 1 6 ."
> --
> 1.7.9.5
>
>

