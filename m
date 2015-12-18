Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CD4D4731B1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Dec 2015 07:19:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tBI7Jb5d018979
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Dec 2015 23:19:37 -0800 (PST)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 17 Dec 2015 23:19:36 -0800
To: <openembedded-devel@lists.openembedded.org>
References: <D2648347-D3B8-420B-8527-0FEBE36BFD0C@gmail.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <5673B389.7090401@windriver.com>
Date: Fri, 18 Dec 2015 15:19:37 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <D2648347-D3B8-420B-8527-0FEBE36BFD0C@gmail.com>
Subject: Re: [meta-networking][PATCH 2/6] talloc: rename to libtalloc and cleanup dependency mess
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
X-List-Received-Date: Fri, 18 Dec 2015 07:19:38 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2015年11月20日 03:44, Jens Rehsack wrote:
> diff --git a/meta-networking/recipes-support/talloc/talloc_2.1.1.bb b/meta-networking/recipes-support/libtalloc/libtalloc_2.1.1.bb
> similarity index 70%
> rename from meta-networking/recipes-support/talloc/talloc_2.1.1.bb
> rename to meta-networking/recipes-support/libtalloc/libtalloc_2.1.1.bb
> index 89c390f..9016f42 100644
> --- a/meta-networking/recipes-support/talloc/talloc_2.1.1.bb
> +++ b/meta-networking/recipes-support/libtalloc/libtalloc_2.1.1.bb
> @@ -3,7 +3,9 @@ HOMEPAGE ="http://talloc.samba.org"
>   SECTION = "libs"
>   LICENSE = "LGPL-3.0+ & GPL-3.0+"
>   
> -SRC_URI ="http://samba.org/ftp/${BPN}/${BPN}-${PV}.tar.gz"
> +DEPENDS += "libbsd"
> +
> +SRC_URI ="http://samba.org/ftp/${BPN}/talloc-${PV}.tar.gz"

Both the ${BPN} are needed to be replaced with talloc.

--Kai


>   LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/LGPL-3.0;md5=bfccfe952269fff2b407dd11f2f3083b \
>                       file://${COREBASE}/meta/files/common-licenses/GPL-3.0;md5=c79ff39f19dfec6d293b95dea7b07891"
>   


-- 
Regards,
Neil | Kai Kang


