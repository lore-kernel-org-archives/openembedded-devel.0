Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f171.google.com (mail-pd0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id C1E4360017
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Sep 2014 23:17:39 +0000 (UTC)
Received: by mail-pd0-f171.google.com with SMTP id p10so2213069pdj.30
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Sep 2014 16:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=T9K3rSdRFR8iAqj+pPbJ9GHlgIs+ZF9rWGIUgCsAfy0=;
	b=eWYbBxaitSQtFchBJrYi7CZGKXDq9DgEE0mW3bOsR2KKG088i9HDICvybWE6TqKq7R
	GKCHQfsNWmkbwwQ5dkzF4R2hKqiR5edB3R25zWqMpFBvMtCZ4gz+gZvhFj0/UNriZaiN
	HqmK8rKHcxySedy/yDw5g6aruf0ChIq4kIsXvGpexIErqHmP0ltC3lAeVu2pEkG5ckyZ
	uGsfc6ix6HqMS1l15XZkpWx+cFneuRqW1xueIKk0hwfqCFwR52oW6cAcYa3Tt74aAf3r
	pmqkw64LPBbq+tCCrlf1lUCaJ++c5Mbiy8EZnGgFHTVgwytysb9kbHCsndESB/qDD4En
	Lqgw==
X-Received: by 10.68.95.163 with SMTP id dl3mr16666410pbb.143.1410563860789;
	Fri, 12 Sep 2014 16:17:40 -0700 (PDT)
Received: from ?IPv6:2601:c:9380:601:dc21:3125:9e4b:12a0?
	([2601:c:9380:601:dc21:3125:9e4b:12a0])
	by mx.google.com with ESMTPSA id o2sm4899598pde.30.2014.09.12.16.17.38
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 12 Sep 2014 16:17:39 -0700 (PDT)
Message-ID: <54137F0F.8000409@gmail.com>
Date: Fri, 12 Sep 2014 16:17:35 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.1
MIME-Version: 1.0
To: jslater@windriver.com
References: <1410563058-3288-1-git-send-email-jslater@windriver.com>
In-Reply-To: <1410563058-3288-1-git-send-email-jslater@windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH 1/1] ptpd: update to version 2.3.1-rc2
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
X-List-Received-Date: Fri, 12 Sep 2014 23:17:49 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 09/12/2014 04:04 PM, Joe Slater wrote:
> Add a little processing to find correct directory
> for source upstream.
>
> Signed-off-by: Joe Slater <jslater@windriver.com>
> ---
>   .../ptpd/{ptpd_2.3.0.bb => ptpd_2.3.1-rc2.bb}      |   23 ++++++++++++++++---
>   1 files changed, 19 insertions(+), 4 deletions(-)
>   rename meta-networking/recipes-daemons/ptpd/{ptpd_2.3.0.bb => ptpd_2.3.1-rc2.bb} (58%)
>
> diff --git a/meta-networking/recipes-daemons/ptpd/ptpd_2.3.0.bb b/meta-networking/recipes-daemons/ptpd/ptpd_2.3.1-rc2.bb
> similarity index 58%
> rename from meta-networking/recipes-daemons/ptpd/ptpd_2.3.0.bb
> rename to meta-networking/recipes-daemons/ptpd/ptpd_2.3.1-rc2.bb
> index 54679dc..2a23995 100644
> --- a/meta-networking/recipes-daemons/ptpd/ptpd_2.3.0.bb
> +++ b/meta-networking/recipes-daemons/ptpd/ptpd_2.3.1-rc2.bb
> @@ -5,18 +5,33 @@ and PTP Version 2 implements IEEE-1588-2008. PTP was developed to provide very p
>   time coordination of LAN connected computers."
>   HOMEPAGE = "http://sourceforge.net/projects/ptpd"
>   SECTION = "network"
> +
> +# COPYRIGHT is gone, but maybe it will come back
> +#
>   LICENSE = "BSD"
> -LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=4019cad2b3cd55f22ea819ffad6ccd41"
> +#LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=4019cad2b3cd55f22ea819ffad6ccd41"

I think your 'COPYRIGHT' comment should be in the header, then you can 
remove the commented out code.

- Armin

> +LIC_FILES_CHKSUM = "file://README;md5=2452033fe374283f29579898663b1aa8"
>
>   DEPENDS = "libpcap"
>
>   inherit autotools
>
> -SRC_URI = "http://downloads.sourceforge.net/project/ptpd/ptpd/${PV}/ptpd-${PV}.tar.gz"
> +# return something like '1.2.3' or '1.2.3/rc1'
> +#
> +def get_sub(d):
> +    parts = d.getVar('PV',True).split('-')
> +    try:
> +        return parts[0] + '/' + parts[1]
> +    except:
> +        return parts[0]
> +
> +SRC_URI = "http://downloads.sourceforge.net/project/ptpd/ptpd/${@get_sub(d)}/ptpd-${PV}.tar.gz"
> +
> +SRC_URI[md5sum] = "1ef2f1f2825080a865bbce0eb61246d4"
> +SRC_URI[sha256sum] = "2802aab758649bb222859dfcb62a5d282709ccb4d3f1df3f26f739cc091d0c8d"
>
>   S = "${WORKDIR}/ptpd-${PV}"
> -SRC_URI[md5sum] = "f5e931b4a229705ff0dbdfe22490566b"
> -SRC_URI[sha256sum] = "1a4e90496f004bfd91657ccc49209101dc25b787e540648c07c0973469f1d8f7"
> +
>
>   EXTRA_OEMAKE = ""
>
>

