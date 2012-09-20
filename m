Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1TEc9d-0004lC-Ki
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Sep 2012 10:30:37 +0200
Received: by iebc11 with SMTP id c11so2992098ieb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Sep 2012 01:17:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:content-type:x-gm-message-state;
	bh=EilUSEGeDRoBNEdRbRrJ4wsfODLCiM7UsJ/x/YUuxCM=;
	b=BfZDq/AHM/8KLCZ26XhlvwDt3aYjEZlZHTTYdVcrOjK3XvSluc1GOqbw698YKg7t4k
	q8/ZcYevnI5S6AHxLwEjaRJlBXdRsnhKRLyIqqCFX0CcSq1zKoxnJEsLlaoHG9moEvoj
	fT6eTbiCsCML7cVpXWXgGX0ymXbQswFZaM92i1JuLEbgGC9qQVGioKPWlSZ7mqOl1Kry
	bv7GeN/jrE6VDcODHznzzKOy/YcRCmz3hr7ExVMeE4eYXXQ55niJfoICgphPymdWDRg8
	YhnfGBhG878vpVuI9DmMw7xcvSgTFf2pCuG8rIxik8pkdOhP3PvW4cUoSgKkPz9LfR58
	ow+A==
Received: by 10.50.40.133 with SMTP id x5mr919297igk.57.1348129074761; Thu, 20
	Sep 2012 01:17:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.52.8 with HTTP; Thu, 20 Sep 2012 01:17:34 -0700 (PDT)
X-Originating-IP: [89.121.200.106]
In-Reply-To: <k3eim5$mre$2@ger.gmane.org>
References: <1347996907-22852-1-git-send-email-andrei@gherzan.ro>
	<k3eim5$mre$2@ger.gmane.org>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Thu, 20 Sep 2012 11:17:34 +0300
Message-ID: <CAK18fxFOfGdeN7gZdvNsBfk69FacEBS-qxPxcC9xrVFOQ4yKtQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQmCR5R0U138Ngmp93qrQZjTvbbpndvvY2DahsDRnjTyBC3yh4xX0Spv4hDtRwMLL7Agxdkz
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe][PATCH][V2] zram: Integrate an init script
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
X-List-Received-Date: Thu, 20 Sep 2012 08:30:38 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Sep 20, 2012 at 11:04 AM, Koen Kooi <koen@dominion.thruhere.net>wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Op 18-09-12 21:35, Andrei Gherzan schreef:
> > Signed-off-by: Andrei Gherzan <andrei@gherzan.ro> ---
> > meta-oe/recipes-extended/zram/zram/init         |   28 +++++++++++++++++
> > meta-oe/recipes-extended/zram/zram/zram-load.sh |   37
> > +++++++++++++++++++++++ meta-oe/recipes-extended/zram/zram_0.1.bb
> |
> > 24 +++++++++++++++ 3 files changed, 89 insertions(+) create mode 100644
> > meta-oe/recipes-extended/zram/zram/init create mode 100644
> > meta-oe/recipes-extended/zram/zram/zram-load.sh create mode 100644
> > meta-oe/recipes-extended/zram/zram_0.1.bb
> >
> > diff --git a/meta-oe/recipes-extended/zram/zram/init
> > b/meta-oe/recipes-extended/zram/zram/init new file mode 100644 index
> > 0000000..7bd8bcc --- /dev/null +++
> > b/meta-oe/recipes-extended/zram/zram/init @@ -0,0 +1,28 @@ +#!/bin/bash
> > +### BEGIN INIT INFO +# Provides: zram +# Required-Start: +#
> > Required-Stop: +# Default-Start: 2 3 4 5 +# Default-Stop: 0 1 6 +#
> > Short-Description: Increased Performance In Linux With zRam (Virtual Swap
> > Compressed in RAM) +### END INIT INFO +set -e + +case "$1" in +
> > start) +        zram-load.sh --load +        ;; +    stop) +
> > zram-load.sh --unload +        ;; +    restart) +        zram-load.sh
> > --unload +        sleep 3 +        zram-load.sh --load +        ;; +
> > *) +        echo "Usage: $0 {start|stop|restart}" +        RETVAL=1
> > +esac +exit $RETVAL diff --git
> > a/meta-oe/recipes-extended/zram/zram/zram-load.sh
> > b/meta-oe/recipes-extended/zram/zram/zram-load.sh new file mode 100644
> > index 0000000..786cd0c --- /dev/null +++
> > b/meta-oe/recipes-extended/zram/zram/zram-load.sh @@ -0,0 +1,37 @@
> > +#!/bin/sh + +num_cpus=$(grep -c processor /proc/cpuinfo) +[ "$num_cpus"
> > != 0 ] || num_cpus=1 + +last_cpu=$((num_cpus - 1)) + +mem_by_cpu=$(awk -v
> > cpus=$num_cpus '/MemTotal/ { print (($2 * 1024) / cpus) }'
> > /proc/meminfo) + +if [ "$1" = "--load" ] ; then +     echo zram: Trying
> to
> > load kernel module. + +       # Linux 3.2 workaround - value name
> changed :o. +
> > modprobe -q zram zram_num_devices=$num_cpus + +       # Linux < 3.2. +
> > #modprobe -q zram num_devices=$num_cpus + +   echo zram: Enable in-memory
> > compressed swap of $mem_by_cpu bytes. +       for i in $(seq 0
> $last_cpu); do +
> > echo 1 > /sys/block/zram$i/reset +            echo $mem_by_cpu >
> > /sys/block/zram$i/disksize +          mkswap /dev/zram$i +
>  swapon -p 100
> > /dev/zram$i + done +fi + +if [ "$1" = "--unload" ] ; then +   echo zram:
> > Disable in-memory compressed swap. +  for i in $(seq 0 $last_cpu); do +
> > grep -q "/dev/zram$i" /proc/swaps && swapoff /dev/zram$i +    done + +
>      sleep
> > 1 +   echo zram: Unload kernel module. +      rmmod zram +fi diff --git
> > a/meta-oe/recipes-extended/zram/zram_0.1.bb
> > b/meta-oe/recipes-extended/zram/zram_0.1.bb new file mode 100644 index
> > 0000000..dd59784 --- /dev/null +++
> > b/meta-oe/recipes-extended/zram/zram_0.1.bb @@ -0,0 +1,24 @@
> +DESCRIPTION
> > = "Linux zram compressed in-memory swap" +LICENSE = "MIT"
> > +LIC_FILES_CHKSUM =
> > "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58" +
> > +inherit allarch update-rc.d + +RDEPENDS_${PN} = "util-linux-swaponoff
> > kmod kernel-module-zram"
>
> You are never allowed to RDEPEND on a kernel-module, imagine what happens
> when it's builtin. Also R* variables go below do_install
>
>
Very true. About R* after do_install i didn't know that this was a rule.
But i will obey. :)


> > + +PR = "r0"
>

Remove that
>
> Next patch coming.

ag

