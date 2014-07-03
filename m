Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4EB296AC78
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Jul 2014 01:45:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s631jF7x025446
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 2 Jul 2014 18:45:15 -0700 (PDT)
Received: from [128.224.162.181] (128.224.162.181) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.169.1;
	Wed, 2 Jul 2014 18:45:15 -0700
Message-ID: <53B4B5A9.3030808@windriver.com>
Date: Thu, 3 Jul 2014 09:45:13 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1404268492-3769-1-git-send-email-liezhi.yang@windriver.com>
In-Reply-To: <1404268492-3769-1-git-send-email-liezhi.yang@windriver.com>
Subject: Re: [meta-networking] [PATCH] memcached: use BPN in SRC_URI
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
X-List-Received-Date: Thu, 03 Jul 2014 01:45:16 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


Please drop this one, will include it in another thread.

// Robert

On 07/02/2014 10:34 AM, Robert Yang wrote:
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>   .../recipes-support/memcached/memcached_1.4.17.bb  |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-networking/recipes-support/memcached/memcached_1.4.17.bb b/meta-networking/recipes-support/memcached/memcached_1.4.17.bb
> index 6a01ec2..8ad264f 100644
> --- a/meta-networking/recipes-support/memcached/memcached_1.4.17.bb
> +++ b/meta-networking/recipes-support/memcached/memcached_1.4.17.bb
> @@ -17,7 +17,7 @@ inherit autotools
>   DEPENDS += "libevent"
>   RDEPENDS_${PN} += "perl perl-module-posix perl-module-autoloader perl-module-tie-hash"
>
> -SRC_URI = "http://www.memcached.org/files/${PN}-${PV}.tar.gz"
> +SRC_URI = "http://www.memcached.org/files/${BPN}-${PV}.tar.gz"
>
>   SRC_URI[md5sum] = "46402dfbd7faadf6182283dbbd18b1a6"
>   SRC_URI[sha256sum] = "d9173ef6d99ba798c982ea4566cb4f0e64eb23859fdbf9926a89999d8cdc0458"
>

