Return-Path: <Dengke.Du@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 15C696FF69
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Sep 2016 08:30:14 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u8S8UGnj021638
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Sep 2016 01:30:16 -0700 (PDT)
Received: from [128.224.163.135] (128.224.163.135) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 28 Sep 2016 01:30:15 -0700
Reply-To: <openembedded-devel@lists.openembedded.org>
References: <1475048656-83199-1-git-send-email-dengke.du@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
From: Dengke Du <dengke.du@windriver.com>
Message-ID: <8674409e-104f-3128-d789-0e46332c15d6@windriver.com>
Date: Wed, 28 Sep 2016 16:30:12 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1475048656-83199-1-git-send-email-dengke.du@windriver.com>
Subject: Re: [meta-oe][PATCH] edac-utils: add systemd init script for edac
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
X-List-Received-Date: Wed, 28 Sep 2016 08:30:16 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Please ignore!

Thanks

//Dengke


On 2016年09月28日 15:44, Dengke Du wrote:
> In order to add the systemd init script for edac, we need to add
> some perl module to make sure the correct startup.
>
> (LOCAL REV: NOT UPSTREAM) -- Send to meta-openembedded 20160928
>
> Signed-off-by: Dengke Du <dengke.du@windriver.com>
> ---
>   meta-oe/recipes-support/edac-utils/edac-utils_git.bb  | 14 +++++++++++++-
>   meta-oe/recipes-support/edac-utils/files/edac.service | 11 +++++++++++
>   2 files changed, 24 insertions(+), 1 deletion(-)
>   create mode 100644 meta-oe/recipes-support/edac-utils/files/edac.service
>
> diff --git a/meta-oe/recipes-support/edac-utils/edac-utils_git.bb b/meta-oe/recipes-support/edac-utils/edac-utils_git.bb
> index c0ad665..b3ff1cc 100644
> --- a/meta-oe/recipes-support/edac-utils/edac-utils_git.bb
> +++ b/meta-oe/recipes-support/edac-utils/edac-utils_git.bb
> @@ -14,9 +14,10 @@ S = "${WORKDIR}/git"
>   SRC_URI = "git://github.com/grondo/edac-utils \
>       file://make-init-script-be-able-to-automatically-load-EDAC-.patch \
>       file://add-restart-to-initscript.patch \
> +    file://edac.service \
>   "
>   
> -inherit autotools-brokensep
> +inherit autotools-brokensep systemd
>   
>   do_configure_prepend () {
>       touch ${S}/ChangeLog
> @@ -31,4 +32,15 @@ RDEPENDS_${PN}_powerpc = "dmidecode"
>   RDEPENDS_${PN}_powerpc64 = "dmidecode"
>   RDEPENDS_${PN}_append = " \
>       perl-module-file-basename perl-module-file-find perl-module-getopt-long perl-module-posix \
> +    perl-module-overload \
> +    perl-module-overloading \
> +    perl-module-file-glob \
>   "
> +
> +do_install_append() {
> +	install -d ${D}${systemd_unitdir}/system
> +	install -m 644 ${WORKDIR}/edac.service ${D}/${systemd_unitdir}/system
> +	sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}/${systemd_unitdir}/system/edac.service
> +}
> +
> +SYSTEMD_SERVICE_${PN} = "edac.service"
> diff --git a/meta-oe/recipes-support/edac-utils/files/edac.service b/meta-oe/recipes-support/edac-utils/files/edac.service
> new file mode 100644
> index 0000000..9f687a8
> --- /dev/null
> +++ b/meta-oe/recipes-support/edac-utils/files/edac.service
> @@ -0,0 +1,11 @@
> +[Unit]
> +Description=Initialize EDAC Drivers For Machine Hardware
> +
> +[Service]
> +Type=oneshot
> +ExecStart=@SBINDIR@/edac-ctl --register-labels
> +ExecStop=@SBINDIR@/edac-ctl --unload
> +RemainAfterExit=yes
> +
> +[Install]
> +WantedBy=multi-user.target


