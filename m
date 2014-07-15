Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A886C70247
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jul 2014 07:23:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s6F7NS6q007112
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 15 Jul 2014 00:23:28 -0700 (PDT)
Received: from [128.224.162.159] (128.224.162.159) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.169.1;
	Tue, 15 Jul 2014 00:23:27 -0700
Message-ID: <53C4D6EF.6050708@windriver.com>
Date: Tue, 15 Jul 2014 15:23:27 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1405385986-27334-1-git-send-email-rongqing.li@windriver.com>
In-Reply-To: <1405385986-27334-1-git-send-email-rongqing.li@windriver.com>
Subject: Re: [PATCH] vsftpd: fix install warning
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
X-List-Received-Date: Tue, 15 Jul 2014 07:23:32 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

It should be in meta-networking

On 07/15/2014 08:59 AM, rongqing.li@windriver.com wrote:
> From: Wenzong Fan <wenzong.fan@windriver.com>
>
> WARNING: QA Issue: vsftpd: Files/directories were installed but not shipped
>    /run
>    /run/vsftpd
>    /run/vsftpd/empty
>
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>   meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.0.bb |   16 +++++++++++++++-
>   1 file changed, 15 insertions(+), 1 deletion(-)
>
> diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.0.bb b/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.0.bb
> index 0698a63..5df8211 100644
> --- a/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.0.bb
> +++ b/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.0.bb
> @@ -70,7 +70,11 @@ do_install() {
>           sed -i "s:/lib/security:${base_libdir}/security:" ${D}${sysconfdir}/pam.d/vsftpd
>           sed -i "s:ftpusers:vsftpd.ftpusers:" ${D}${sysconfdir}/pam.d/vsftpd
>       fi
> -    install -d ${D}${localstatedir}/run/vsftpd/empty
> +    if ${@base_contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
> +        install -d ${D}${sysconfdir}/tmpfiles.d
> +        echo "d /var/run/vsftpd/empty 0755 root root -" \
> +        > ${D}${sysconfdir}/tmpfiles.d/${BPN}.conf
> +    fi
>   }
>
>   INITSCRIPT_PACKAGES = "${PN}"
> @@ -82,3 +86,13 @@ USERADD_PARAM_${PN} = "--system --home-dir /var/lib/ftp --no-create-home -g ftp
>                          --shell /bin/false ftp "
>   GROUPADD_PARAM_${PN} = "-r ftp"
>
> +pkg_postinst_${PN}() {
> +	if [ -n "$D" ]; then
> +		exit 0
> +	fi
> +	if type systemd-tmpfiles >/dev/null; then
> +		systemd-tmpfiles --create
> +	elif [ -e ${sysconfdir}/init.d/populate-volatile.sh ]; then
> +		${sysconfdir}/init.d/populate-volatile.sh update
> +	fi
> +}
>

-- 
Best Reagrds,
Roy | RongQing Li

