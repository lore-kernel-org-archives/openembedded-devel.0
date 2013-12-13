Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 0C03E6E243
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Dec 2013 10:34:16 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 13 Dec 2013 02:33:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,477,1384329600"; d="scan'208";a="451747206"
Received: from junemccl-mobl.ger.corp.intel.com (HELO helios.localnet)
	([10.252.122.17])
	by orsmga002.jf.intel.com with ESMTP; 13 Dec 2013 02:33:56 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Joe MacDonald <joe@deserted.net>
Date: Fri, 13 Dec 2013 10:33:55 +0000
Message-ID: <27197377.bBKUcS7Jmv@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-34-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <1386874857-8596-1-git-send-email-joe@deserted.net>
References: <1386874857-8596-1-git-send-email-joe@deserted.net>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] vsftpd: install volatiles file based on init system
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Dec 2013 10:34:18 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Joe,

On Thursday 12 December 2013 14:00:57 Joe MacDonald wrote:
> The sysvinit populate-volatile.sh scans for volatiles in
> /etc/default/volatiles.  systemd expects the same format files to live in
> /etc/tmpfiles.d.  Depedning on the DISTRO_FEATURE list, install vsftpd's
> volatiles file to the expected location.  While we're here, drop the
> creation of the empty ${localstatedir}/run/ hierarchy since they should be
> created by the volatiles processing.
> 
> Signed-off-by: Joe MacDonald <joe@deserted.net>
> ---
>  meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.0.bb |   10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.0.bb
> b/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.0.bb index
> 0698a63..9d82fd7 100644
> --- a/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.0.bb
> +++ b/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.0.bb
> @@ -59,8 +59,13 @@ do_install() {
>      install -m 600 ${WORKDIR}/vsftpd.conf ${D}${sysconfdir}/vsftpd.conf
>      install -d ${D}${sysconfdir}/init.d/
>      install -m 755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/vsftpd
> -    install -d ${D}/${sysconfdir}/default/volatiles
> -    install -m 644 ${WORKDIR}/volatiles.99_vsftpd
> ${D}/${sysconfdir}/default/volatiles/99_vsftpd +    if
> ${@base_contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then +
>        install -d ${D}/${sysconfdir}/tmpfiles.d
> +        install -m 644 ${WORKDIR}/volatiles.99_vsftpd
> ${D}/${sysconfdir}/tmpfiles.d/99_vsftpd +    else
> +        install -d ${D}/${sysconfdir}/default/volatiles
> +        install -m 644 ${WORKDIR}/volatiles.99_vsftpd
> ${D}/${sysconfdir}/default/volatiles/99_vsftpd +    fi
> 
>      install -m 600 ${WORKDIR}/vsftpd.ftpusers ${D}${sysconfdir}/
>      install -m 600 ${WORKDIR}/vsftpd.user_list ${D}${sysconfdir}/
> @@ -70,7 +75,6 @@ do_install() {
>          sed -i "s:/lib/security:${base_libdir}/security:"
> ${D}${sysconfdir}/pam.d/vsftpd sed -i "s:ftpusers:vsftpd.ftpusers:"
> ${D}${sysconfdir}/pam.d/vsftpd fi
> -    install -d ${D}${localstatedir}/run/vsftpd/empty
>  }
> 
>  INITSCRIPT_PACKAGES = "${PN}"

I think there might be a problem with this: the DISTRO_FEATURES options aren't 
mutually exclusive - both can be enabled at the same time (usually where you 
want sysvinit for some rescue/initramfs image and systemd for the main image).

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

