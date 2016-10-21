Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9D1A171B71
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Oct 2016 07:23:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u9L7NYjb027756
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 21 Oct 2016 00:23:34 -0700 (PDT)
Received: from [128.224.162.161] (128.224.162.161) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 21 Oct 2016 00:23:32 -0700
To: <git@andred.net>
References: <20161020211630.2707-1-git@andred.net>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <eb06c3eb-f54e-12fe-c2e7-d30c67ac925b@windriver.com>
Date: Fri, 21 Oct 2016 15:23:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <20161020211630.2707-1-git@andred.net>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] c-ares: update 1.11.0 -> 1.12.0
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
X-List-Received-Date: Fri, 21 Oct 2016 07:23:44 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2016年10月21日 05:16, André Draszik wrote:
> Highlight:
> - fix CVE-2016-5180
>
> Other changes, from https://c-ares.haxx.se/changelog.html
>
> c-ares version 1.12.0 - Sep 29 2016
> Changes:
>      api: add ARES_OPT_NOROTATE optmask value
>
> Bug fixes:
>      CVE-2016-5180: ares_create_query single byte out of buffer write
>      configure: acknowledge --disable-tests [1]
>      man pages: fix typos detected by Lintian
>      test: add missing #includes for dns-proto.cc
>      test: avoid in6addr_* constants
>      test: Build with MinGW on AppVeyor
>      Makefile.m32: add support for extra flags
>      Makefile.m32: add support for CROSSPREFIX
>      configure: check if tests can get built before enabled
>      ares_library_cleanup: reset ares_realloc too
>      ahost.c: add cast to fix C++ compile
>      test: Only pass unused args to GoogleTest
>      build: commonize MSVC version detection
>      msvc_ver.inc: support Visual Studio 2015 Update 1, 2, 3
>      test: for AF_UNSPEC, return CNAME only for AAAA, but valid A record
>      ares_getnameinfo: explicitly clear struct servent before use
>      test: Update fuzzing function prototype
>      init: fix nsort initialization
>      test: add fuzzing check script to tests
>      web: http => https
>      read_tcp_data: remove superfluous NULL check
>      LICENSE.md: add a stand-alone license file
>      SECURITY.md: suggested "security process" for the project
>      ares_init_options: only propagate init failures from options [2]
>      headers: remove checks for and defines of variable sizes
>      test: fix gMock to work with gcc >= 6.x [3]
>
> Signed-off-by: André Draszik <git@andred.net>
> ---
>   .../recipes-support/c-ares/{c-ares_1.11.0.bb => c-ares_1.12.0.bb}     | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-networking/recipes-support/c-ares/{c-ares_1.11.0.bb => c-ares_1.12.0.bb} (76%)
>
> diff --git a/meta-networking/recipes-support/c-ares/c-ares_1.11.0.bb b/meta-networking/recipes-support/c-ares/c-ares_1.12.0.bb
> similarity index 76%
> rename from meta-networking/recipes-support/c-ares/c-ares_1.11.0.bb
> rename to meta-networking/recipes-support/c-ares/c-ares_1.12.0.bb
> index c98be7d..8b63972 100644
> --- a/meta-networking/recipes-support/c-ares/c-ares_1.11.0.bb
> +++ b/meta-networking/recipes-support/c-ares/c-ares_1.12.0.bb
> @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://ares_init.c;beginline=1;endline=3;md5=53f5ecf4c22c37c

A stand-alone license file is added. It is better to update 
LIC_FILES_CHKSUM.

--Kai

>   SRC_URI = "http://c-ares.haxx.se/download/${BP}.tar.gz \
>              file://0001-configure.ac-don-t-override-passed-cflags.patch \
>   "
> -SRC_URI[md5sum] = "d5c6d522cfc54bb6f215a0b7912d46be"
> -SRC_URI[sha256sum] = "b3612e6617d9682928a1d50c1040de4db6519f977f0b25d40cf1b632900b3efd"
> +SRC_URI[md5sum] = "2ca44be1715cd2c5666a165d35788424"
> +SRC_URI[sha256sum] = "8692f9403cdcdf936130e045c84021665118ee9bfea905d1a76f04d4e6f365fb"
>   
>   inherit autotools pkgconfig


-- 
Regards,
Neil | Kai Kang


