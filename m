Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 25F4D7067B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Jul 2014 10:18:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s6PAIIVi008815
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 25 Jul 2014 03:18:23 -0700 (PDT)
Received: from [128.224.162.159] (128.224.162.159) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.169.1;
	Fri, 25 Jul 2014 03:18:18 -0700
Message-ID: <53D22EE9.1090208@windriver.com>
Date: Fri, 25 Jul 2014 18:18:17 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>, Joe MacDonald
	<joe@deserted.net>
References: <1406283404-30311-1-git-send-email-rongqing.li@windriver.com>
In-Reply-To: <1406283404-30311-1-git-send-email-rongqing.li@windriver.com>
Subject: Re: [PATCH] tnftp: add openssl PACKAGECONFIG and inherit pkgconfig
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
X-List-Received-Date: Fri, 25 Jul 2014 10:18:25 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

it should meta-networking

On 07/25/2014 06:16 PM, rongqing.li@windriver.com wrote:
> From: Roy Li <rongqing.li@windriver.com>
>
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>   meta-networking/recipes-support/tnftp/tnftp_20130505.bb |    5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/meta-networking/recipes-support/tnftp/tnftp_20130505.bb b/meta-networking/recipes-support/tnftp/tnftp_20130505.bb
> index 80690c5..ae2bc67 100644
> --- a/meta-networking/recipes-support/tnftp/tnftp_20130505.bb
> +++ b/meta-networking/recipes-support/tnftp/tnftp_20130505.bb
> @@ -18,7 +18,7 @@ SRC_URI = "ftp://ftp.netbsd.org/pub/NetBSD/misc/tnftp/${BPN}-${PV}.tar.gz \
>   	   file://tnftp-autotools.patch \
>   	  "
>
> -inherit autotools update-alternatives
> +inherit autotools update-alternatives pkgconfig
>
>   ALTERNATIVE_PRIORITY = "100"
>
> @@ -31,3 +31,6 @@ FILES_${PN} = "${bindir}/tnftp"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=6d6796cb166a9bb050958241dad9479e"
>   SRC_URI[md5sum] = "66e218d02ec7d9fc39ab70ba2900305a"
>   SRC_URI[sha256sum] = "6f650e25f6fd51538f677b789b49379f367ae9f1dee74c94cfe24d92abc2cffb"
> +
> +PACKAGECONFIG ?= "openssl"
> +PACKAGECONFIG[openssl] = "--enable-ssl, --disable-ssl --with-ssl=no, openssl"
>

-- 
Best Reagrds,
Roy | RongQing Li

