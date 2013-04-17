Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1USNly-0002oQ-UQ
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Apr 2013 10:31:24 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 17 Apr 2013 01:13:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,492,1363158000"; d="scan'208";a="323519669"
Received: from unknown (HELO helios.localnet) ([10.255.14.28])
	by fmsmga002.fm.intel.com with ESMTP; 17 Apr 2013 01:13:21 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Apr 2013 09:13:19 +0100
Message-ID: <2367395.UoCBAx5Bxq@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.5.0-27-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <1366144550-1493-1-git-send-email-raj.khem@gmail.com>
References: <1366144550-1493-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: Re: [meta-networking][PATCH V2] ntp: Create a separate package for sntp
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
X-List-Received-Date: Wed, 17 Apr 2013 08:31:40 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 16 April 2013 13:35:50 Khem Raj wrote:
> sntp provides the functionality of obsoleted ntpdate
> so we have option of using ntpd as well as sntp
> sntp does the immediate one time sync with time
> server and corrects the tme immediately. it
> replaces ntpdate nicely.
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-networking/recipes-support/ntp/ntp.inc        |   13 +++++++++++--
>  meta-networking/recipes-support/ntp/ntp/sntp       |    1 +
>  .../recipes-support/ntp/ntp/sntp.service           |   11 +++++++++++
>  3 files changed, 23 insertions(+), 2 deletions(-)
>  create mode 100644 meta-networking/recipes-support/ntp/ntp/sntp
>  create mode 100644 meta-networking/recipes-support/ntp/ntp/sntp.service
> 
> diff --git a/meta-networking/recipes-support/ntp/ntp.inc
> b/meta-networking/recipes-support/ntp/ntp.inc index a604b9c..004dc9b 100644
> --- a/meta-networking/recipes-support/ntp/ntp.inc
> +++ b/meta-networking/recipes-support/ntp/ntp.inc
> @@ -20,6 +20,8 @@ SRC_URI =
> "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-${PV}.tar.g
> file://ntpdate.default \
>             file://ntpdate.service \
>             file://ntpd.service \
> +           file://sntp.service \
> +           file://sntp \
>  "
> 
>  inherit autotools update-rc.d systemd
> @@ -52,15 +54,18 @@ do_install_append() {
> 
>      install -d ${D}/${sysconfdir}/default
>      install -m 644 ${WORKDIR}/ntpdate.default
> ${D}${sysconfdir}/default/ntpdate +    install -m 0644 ${WORKDIR}/sntp
> ${D}${sysconfdir}/default/
> +
>      install -d ${D}/${sysconfdir}/network/if-up.d
>      ln -s ${bindir}/ntpdate-sync ${D}/${sysconfdir}/network/if-up.d
> 
>      install -d ${D}${systemd_unitdir}/system
>      install -m 0644 ${WORKDIR}/ntpdate.service
> ${D}${systemd_unitdir}/system/ install -m 0644 ${WORKDIR}/ntpd.service
> ${D}${systemd_unitdir}/system/ +    install -m 0644 ${WORKDIR}/sntp.service
> ${D}${systemd_unitdir}/system/ }
> 
> -PACKAGES += "ntpdate ${PN}-tickadj ${PN}-utils"
> +PACKAGES += "ntpdate ${PN}-tickadj ${PN}-utils sntp"
>  # NOTE: you don't need ntpdate, use "ntpd -q -g -x"
> 
>  # ntp originally includes tickadj. It's split off for inclusion in small
> firmware images on platforms @@ -71,9 +76,10 @@ RPROVIDES_${PN}-utils =
> "${PN}-bin"
>  RREPLACES_${PN}-utils = "${PN}-bin"
>  RCONFLICTS_${PN}-utils = "${PN}-bin"
> 
> -SYSTEMD_PACKAGES = "${PN} ntpdate"
> +SYSTEMD_PACKAGES = "${PN} ntpdate sntp"
>  SYSTEMD_SERVICE_${PN} = "ntpd.service"
>  SYSTEMD_SERVICE_ntpdate = "ntpdate.service"
> +SYSTEMD_SERVICE_sntp = "sntp.service"
> 
>  RPROVIDES_${PN} += "${PN}-systemd"
>  RREPLACES_${PN} += "${PN}-systemd"
> @@ -94,6 +100,9 @@ FILES_ntpdate = "${bindir}/ntpdate \
>      ${sysconfdir}/default/ntpdate \
>      ${systemd_unitdir}/system/ntpdate.service \
>  "
> +FILES_sntp = "${bindir}/sntp \
> +              ${sysconfdir}/default/sntp \
> +             "
> 
>  CONFFILES_${PN} = "${sysconfdir}/ntp.conf"
>  CONFFILES_ntpdate = "${sysconfdir}/default/ntpdate"
> diff --git a/meta-networking/recipes-support/ntp/ntp/sntp
> b/meta-networking/recipes-support/ntp/ntp/sntp new file mode 100644
> index 0000000..f8c5895
> --- /dev/null
> +++ b/meta-networking/recipes-support/ntp/ntp/sntp
> @@ -0,0 +1 @@
> +NTPSERVER="ntpserver.example.org"
> diff --git a/meta-networking/recipes-support/ntp/ntp/sntp.service
> b/meta-networking/recipes-support/ntp/ntp/sntp.service new file mode 100644
> index 0000000..0f09e43
> --- /dev/null
> +++ b/meta-networking/recipes-support/ntp/ntp/sntp.service
> @@ -0,0 +1,11 @@
> +[Unit]
> +Description=Simple Network Time Service Client
> +After=network.target
> +
> +[Service]
> +Type=oneshot
> +EnvironmentFile=-/etc/default/sntp
> +ExecStart=/usr/bin/sntp -s $NTPSERVER
> +
> +[Install]
> +WantedBy=multi-user.target

Acked-by: Paul Eggleton <paul.eggleton@linux.intel.com>

-- 

Paul Eggleton
Intel Open Source Technology Centre


