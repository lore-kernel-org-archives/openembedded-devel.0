Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id DC6ED76294
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2015 02:22:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tAB2MPN8013891
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Nov 2015 18:22:26 -0800
Received: from [172.25.44.6] (172.25.44.6) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 10 Nov 2015 18:22:25 -0800
To: <openembedded-devel@lists.openembedded.org>
References: <1447208258-28688-1-git-send-email-Randy.MacLeod@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <5642A660.2000905@windriver.com>
Date: Tue, 10 Nov 2015 21:22:24 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1447208258-28688-1-git-send-email-Randy.MacLeod@windriver.com>
X-Originating-IP: [172.25.44.6]
Subject: Re: [meta-networking/jethro][PATCH] lldpd: fix PN -> BPN SRC_URI for multilib build
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
X-List-Received-Date: Wed, 11 Nov 2015 02:22:30 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 2015-11-10 09:17 PM, Randy MacLeod wrote:
> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> ---
>   meta-networking/recipes-daemons/lldpd/lldpd_0.7.17.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-networking/recipes-daemons/lldpd/lldpd_0.7.17.bb b/meta-networking/recipes-daemons/lldpd/lldpd_0.7.17.bb
> index ba7f09e..bd207ad 100644
> --- a/meta-networking/recipes-daemons/lldpd/lldpd_0.7.17.bb
> +++ b/meta-networking/recipes-daemons/lldpd/lldpd_0.7.17.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/ISC;md5=f3b90e
>   DEPENDS = "libbsd libevent"
>
>   SRC_URI = "\
> -    http://media.luffy.cx/files/${PN}/${PN}-${PV}.tar.gz \
> +    http://media.luffy.cx/files/${BPN}/${BPN}-${PV}.tar.gz \
>       file://lldpd.init.d \
>       file://lldpd.default \
>       file://fix-libevent-configure.patch \
>

Should be applied to both jethro and master even with the pkg uprev.

-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON, 
Canada, K2K 2W5

