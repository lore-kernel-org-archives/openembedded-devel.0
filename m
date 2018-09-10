Return-Path: <martin@geanix.com>
Received: from mail.hundeboll.net (mail.hundeboll.net [88.198.92.70])
	by mail.openembedded.org (Postfix) with ESMTP id 4C6E97970D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Sep 2018 06:13:25 +0000 (UTC)
Received: from [10.0.0.246] (unknown [85.184.147.232])
	by mail.hundeboll.net (Postfix) with ESMTPSA id E658A1C17C4;
	Mon, 10 Sep 2018 08:13:22 +0200 (CEST)
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	openembedded-devel@lists.openembedded.org,
	Joe MacDonald <joe_macdonald@mentor.com>, Armin Kuster
	<akuster808@gmail.com>, Khem Raj <raj.khem@gmail.com>
References: <20180907105515.18840-1-brgl@bgdev.pl>
From: =?UTF-8?Q?Martin_Hundeb=c3=b8ll?= <martin@geanix.com>
Message-ID: <79931a1c-6b19-e1ef-7eb3-57a1bc3e1509@geanix.com>
Date: Mon, 10 Sep 2018 08:13:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20180907105515.18840-1-brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [meta-networking][PATCH v2] networkd-dispatcher: new package
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 10 Sep 2018 06:13:25 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US-large
Content-Transfer-Encoding: 8bit

Hi,

On 07/09/2018 12.55, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> This adds a recipe for networkd-dispatcher.
> 
> It's a simple package containing a python script that needs to be
> installed together with a systemd service and an example config
> file. There's nothing to build.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
> NOTE: resending with a proper tag
> 
> v1 -> v2:
> - skip the package if systemd is not in DISTRO_FEATURES
> - use -D in install for new directories
> - use deltask instead of an empty do_compile() function
> - define PV in the recipe as <version>+git${SRCPV}
> 
>   .../networkd-dispatcher.bb                    | 33 +++++++++++++++++++
>   1 file changed, 33 insertions(+)
>   create mode 100644 meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher.bb
> 
> diff --git a/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher.bb b/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher.bb
> new file mode 100644
> index 000000000..7bb2347a8
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher.bb
> @@ -0,0 +1,33 @@
> +python __anonymous() {
> +    features = d.getVar('DISTRO_FEATURES')
> +    if not features or 'systemd' not in features:
> +        raise bb.parse.SkipPackage('networkd-dispatcher needs systemd in DISTRO_FEATURES')
> +}
> +
> +SUMMARY = "Dispatcher service for systemd-networkd connection status changes"
> +DESCRIPTION = "This daemon is similar to NetworkManager-dispatcher, but is much \
> +more limited in the types of events it supports due to the limited nature of \
> +systemd-networkd(8)."
> +AUTHOR = "Clayton Craft and others"
> +
> +LICENSE = "GPLv3"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=84dcc94da3adb52b53ae4fa38fe49e5d"
> +
> +RDEPENDS_${PN} = "systemd python3 python3-pygobject python3-dbus"
> +
> +SRC_URI = "git://gitlab.com/craftyguy/networkd-dispatcher.git;protocol=https"
> +SRCREV = "c7e25623a161b64618ea778541c064d2a1df086b"
> +PV = "1.7+git${SRCPV}"
> +
> +S = "${WORKDIR}/git"
> +
> +# Nothing to build, just a python script to install
> +deltask do_compile

I think the proper way to do this is:
do_compile[noexec] = "1"

And you could probably do the same for configure:
do_configure[noexec] = "1"

// Martin

> +
> +do_install() {
> +    install -D -m 0755 ${S}/networkd-dispatcher ${D}${sbindir}/networkd-dispatcher
> +    install -D -m 0644 ${S}/networkd-dispatcher.service ${D}/${systemd_system_unitdir}/networkd-dispatcher.service
> +    install -D -m 0644 ${S}/networkd-dispatcher.conf ${D}/${sysconfdir}/conf.d/networkd-dispatcher.conf
> +}
> +
> +FILES_${PN} += "${systemd_system_unitdir}/networkd-dispatcher.service"
> 

-- 
Kind regards,
Martin Hundebøll
Embedded Linux Consultant

+45 61 65 54 61
martin@geanix.com

Geanix IVS
https://geanix.com
DK39600706

