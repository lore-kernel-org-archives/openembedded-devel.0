Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id EF4657BED6
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Mar 2019 06:50:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x256nZ3Q000536
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 4 Mar 2019 22:49:46 -0800
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Mon, 4 Mar 2019 22:49:24 -0800
To: Khem Raj <raj.khem@gmail.com>, <openembedded-devel@lists.openembedded.org>
References: <20190304042758.30133-1-raj.khem@gmail.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <5C7E1D80.3060405@windriver.com>
Date: Tue, 5 Mar 2019 14:56:00 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <20190304042758.30133-1-raj.khem@gmail.com>
X-Originating-IP: [128.224.162.194]
Subject: Re: [meta-oe][PATCH] mariadb: Upgrade to 5.5.63
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
X-List-Received-Date: Tue, 05 Mar 2019 06:50:12 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Khem,

I sent out another patch to upgrade mariadb to 10.3.13 as 5.5.x series 
is only supported until next year April 2020 per 
https://mariadb.org/about/maintenance-policy/, please help to review.

Thanks,

On 2019年03月04日 12:27, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   .../{mariadb-native_5.5.62.bb => mariadb-native_5.5.63.bb}  | 0
>   meta-oe/recipes-dbs/mysql/mariadb.inc                       | 6 +++---
>   .../mysql/{mariadb_5.5.62.bb => mariadb_5.5.63.bb}          | 0
>   3 files changed, 3 insertions(+), 3 deletions(-)
>   rename meta-oe/recipes-dbs/mysql/{mariadb-native_5.5.62.bb => mariadb-native_5.5.63.bb} (100%)
>   rename meta-oe/recipes-dbs/mysql/{mariadb_5.5.62.bb => mariadb_5.5.63.bb} (100%)
>
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_5.5.62.bb b/meta-oe/recipes-dbs/mysql/mariadb-native_5.5.63.bb
> similarity index 100%
> rename from meta-oe/recipes-dbs/mysql/mariadb-native_5.5.62.bb
> rename to meta-oe/recipes-dbs/mysql/mariadb-native_5.5.63.bb
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
> index 8ca5b2ba42..f715542038 100644
> --- a/meta-oe/recipes-dbs/mysql/mariadb.inc
> +++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
> @@ -4,7 +4,7 @@ SECTION = "libs"
>   LICENSE = "GPLv2"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
>
> -SRC_URI = "https://downloads.mariadb.org/f/${BP}/source/${BP}.tar.gz \
> +SRC_URI = "https://downloads.mariadb.org/interstitial/${BP}/source/${BP}.tar.gz \
>              file://fix-cmake-module-path.patch \
>              file://remove-bad-path.patch \
>              file://fix-mysqlclient-r-version.patch \
> @@ -18,8 +18,8 @@ SRC_URI = "https://downloads.mariadb.org/f/${BP}/source/${BP}.tar.gz \
>              file://change-cc-to-cc-version.patch \
>              file://0001-disable-ucontext-on-musl.patch \
>             "
> -SRC_URI[md5sum] = "6375d577e9539b839f44d857e70f82b9"
> -SRC_URI[sha256sum] = "56a365af71b8a9ec8bfee0801e2dec95011da8ee7507986ca329be11296411db"
> +SRC_URI[md5sum] = "f91b31638d4dc47ed43172e56bec2cb7"
> +SRC_URI[sha256sum] = "ef1cf79eec32ced9d1051998a8e458bb33dfbc62de297cba37ee8e9f952b21ea"
>
>   UPSTREAM_CHECK_URI = "https://github.com/MariaDB/server/releases"
>
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb_5.5.62.bb b/meta-oe/recipes-dbs/mysql/mariadb_5.5.63.bb
> similarity index 100%
> rename from meta-oe/recipes-dbs/mysql/mariadb_5.5.62.bb
> rename to meta-oe/recipes-dbs/mysql/mariadb_5.5.63.bb
>

