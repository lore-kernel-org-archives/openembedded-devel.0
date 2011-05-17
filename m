Received: from smtprelay-h21.telenor.se ([195.54.99.196])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1QMR8v-0001TT-70
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 May 2011 22:45:25 +0200
Received: from ipb1.telenor.se (ipb1.telenor.se [195.54.127.164])
	by smtprelay-h21.telenor.se (Postfix) with ESMTP id B819AE9DA1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 May 2011 22:42:31 +0200 (CEST)
X-SENDER-IP: [83.227.57.42]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AtE6AMDc0k1T4zkqPGdsb2JhbAAMiRWOZ44WAQEBATfHXIYZBJARjnc
X-IronPort-AV: E=Sophos;i="4.65,227,1304287200"; d="scan'208";a="190502512"
Received: from c-2a39e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.244]) ([83.227.57.42])
	by ipb1.telenor.se with ESMTP; 17 May 2011 22:42:31 +0200
Message-ID: <4DD2DDB7.4030003@atmel.com>
Date: Tue, 17 May 2011 22:42:31 +0200
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110424 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1304974747-21466-1-git-send-email-schnitzeltony@gmx.de>
In-Reply-To: <1304974747-21466-1-git-send-email-schnitzeltony@gmx.de>
Subject: Re: [PATCH 1/2] u-boot: add 2011.03
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
X-List-Received-Date: Tue, 17 May 2011 20:45:25 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

2011-05-09 22:59, Andreas Mueller skrev:
> Signed-off-by: Andreas Mueller<schnitzeltony@gmx.de>
> ---
>   recipes/u-boot/u-boot_2011.03.bb |   19 +++++++++++++++++++
>   1 files changed, 19 insertions(+), 0 deletions(-)
>   create mode 100644 recipes/u-boot/u-boot_2011.03.bb
>
> diff --git a/recipes/u-boot/u-boot_2011.03.bb b/recipes/u-boot/u-boot_2011.03.bb
> new file mode 100644
> index 0000000..8ab385f
> --- /dev/null
> +++ b/recipes/u-boot/u-boot_2011.03.bb
> @@ -0,0 +1,19 @@
> +PR = "r0"
> +require u-boot.inc
> +
> +DEFAULT_PREFERENCE = "-1"
> +
> +SRC_URI = "ftp://ftp.denx.de/pub/u-boot/u-boot-${PV}.tar.bz2 "
> +SRC_URI[md5sum] = "91d02124c94368557d0e9ac05fb8c33f"
> +SRC_URI[sha256sum] = "08677f66d8d4ee542f6599f580cdffdf730544e1803f9d3739117d6f6d68083e"
> +
> +
> +TARGET_LDFLAGS = ""
> +
> +inherit base
> +
> +do_compile () {
> +       oe_runmake ${UBOOT_MACHINE}
> +       oe_runmake all
> +}
> +
I added support for building multiple u-boot targets in 2009.11
Suggest that this functionality is added in all new u-boot recipes.
There is a new include file which handles the install.


PR = "r2"
require u-boot_r2.inc

DEFAULT_PREFERENCE = "-1"
...
SRC_URI = "ftp://ftp.denx.de/pub/u-boot/u-boot-${PV}.tar.bz2 "
...

TARGET_LDFLAGS = ""

inherit base

do_compile () {
     if ! [ "x${UBOOT_MACHINES}" == "x" ] ; then
         for board in ${UBOOT_MACHINES} ; do
             if ! [ `grep ${board}_config Makefile | wc -c` == 0 ] ; then
                 mkdir -p binaries/${board}
                 oe_runmake O=binaries/${board} distclean
                 oe_runmake O=binaries/${board} ${board}_config
                 oe_runmake O=binaries/${board} all
             fi
         done
     else
            oe_runmake ${UBOOT_MACHINE}
            oe_runmake all
     fi
}

SRC_URI[md5sum] = "d94700614225f53c853dfe714eb5fa47"
SRC_URI[sha256sum] = 
"066615314fc90a314823ac975ca2a525a51fdad41802f4088a3a21ce073e8de6"



-- 
Best Regards
Ulf Samuelsson



