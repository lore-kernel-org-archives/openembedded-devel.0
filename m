Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 55BF26DC90
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Dec 2013 09:34:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rBA9YGkU029922
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Dec 2013 01:34:16 -0800 (PST)
Received: from [128.224.162.204] (128.224.162.204) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Tue, 10 Dec 2013 01:34:15 -0800
Message-ID: <52A6E00D.5080306@windriver.com>
Date: Tue, 10 Dec 2013 17:34:05 +0800
From: Lu Chong <Chong.Lu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1386664325-15756-1-git-send-email-Chong.Lu@windriver.com>
In-Reply-To: <1386664325-15756-1-git-send-email-Chong.Lu@windriver.com>
X-Originating-IP: [128.224.162.204]
Subject: Re: [PATCH meta-networking] modphp: enable endian check
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
X-List-Received-Date: Tue, 10 Dec 2013 09:34:17 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Please ignore this one. I will resend.

Best Regards
Chong

On 12/10/2013 04:32 PM, Chong.Lu@windriver.com wrote:
> From: Chong Lu <Chong.Lu@windriver.com>
>
> Previously, modphp estimates endian on host rather than checks it on
> target. If the host is little-endian and the target is big-endian,
> modphp claims that endian is little. As a result, a memory location
> that it is not allowed to access when calling libphp5.so module on
> target. It will occur segmentation fault.
> This patch enables endian check support for modphp.
>
> Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
> ---
>   recipes-php/modphp/modphp5.inc |    2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/recipes-php/modphp/modphp5.inc b/recipes-php/modphp/modphp5.inc
> index 19f1be9..425faa2 100644
> --- a/recipes-php/modphp/modphp5.inc
> +++ b/recipes-php/modphp/modphp5.inc
> @@ -44,6 +44,8 @@ EXTRA_OECONF = "--with-apxs2=${STAGING_BINDIR_CROSS}/apxs \
>                   --enable-mbstring \
>                   --with-config-file-path=${sysconfdir}/php/apache2-php5"
>   
> +EXTRA_OECONF += "${@base_conditional('SITEINFO_ENDIANNESS', 'le', 'ac_cv_c_bigendian_php=no', 'ac_cv_c_bigendian_php=yes', d)}"
> +
>   PACKAGECONFIG ??= "mysql"
>   PACKAGECONFIG[mysql] = "--with-mysqli=${STAGING_BINDIR_CROSS}/mysql_config,--without-mysqli,mysql5"
>   PACKAGECONFIG[pgsql] = "--with-pgsql=${STAGING_DIR_TARGET}${exec_prefix},--without-pgsql,mysql5"


