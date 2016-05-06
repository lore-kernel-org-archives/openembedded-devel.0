Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A5DC260745
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 May 2016 02:04:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u46248b2013200
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 5 May 2016 19:04:09 -0700 (PDT)
Received: from [128.224.162.236] (128.224.162.236) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 5 May 2016 19:04:07 -0700
To: <openembedded-devel@lists.openembedded.org>
References: <1461761346-22151-1-git-send-email-adrian.ratiu@ni.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <572BFB96.1090006@windriver.com>
Date: Fri, 6 May 2016 10:04:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.2
MIME-Version: 1.0
In-Reply-To: <1461761346-22151-1-git-send-email-adrian.ratiu@ni.com>
Subject: Re: [meta-oe][PATCH] openconnect: add missing dependencies
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
X-List-Received-Date: Fri, 06 May 2016 02:04:09 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit


Hi Ioan,

Is it possible to use PACKAGECONFIG to add these dependencies conditionally ?

On 04/27/2016 08:49 PM, Ioan-Adrian Ratiu wrote:
> They were autodetected and triggered QA warnings
>
> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> ---
>   meta-networking/recipes-connectivity/openconnect/openconnect_git.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-networking/recipes-connectivity/openconnect/openconnect_git.bb b/meta-networking/recipes-connectivity/openconnect/openconnect_git.bb
> index 0a8b875..6d3c252 100644
> --- a/meta-networking/recipes-connectivity/openconnect/openconnect_git.bb
> +++ b/meta-networking/recipes-connectivity/openconnect/openconnect_git.bb
> @@ -2,7 +2,7 @@ SUMMARY = "Open client for Cisco AnyConnect VPN"
>   LICENSE = "LGPLv2.1"
>   LIC_FILES_CHKSUM = "file://COPYING.LGPL;md5=243b725d71bb5df4a1e5920b344b86ad"
>
> -DEPENDS = "vpnc libxml2 gnutls"
> +DEPENDS = "vpnc libxml2 gnutls lz4 krb5 libproxy pcsc-lite"
>   RDEPENDS_${PN} = "vpnc"
>
>   PV = "7.06"
>

