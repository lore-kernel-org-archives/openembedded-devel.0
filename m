Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 416DC601A8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Aug 2014 06:48:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7B6mdVP014201
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Aug 2014 23:48:39 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Sun, 10 Aug 2014 23:48:39 -0700
Message-ID: <53E86741.7000200@windriver.com>
Date: Mon, 11 Aug 2014 14:48:33 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1407511191-28246-1-git-send-email-TicoTimo@gmail.com>
	<1407511191-28246-2-git-send-email-TicoTimo@gmail.com>
In-Reply-To: <1407511191-28246-2-git-send-email-TicoTimo@gmail.com>
Subject: Re: [meta-perl] [PATCH 2/2] libmodule-build-tiny-perl: fix RDEPENDS
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
X-List-Received-Date: Mon, 11 Aug 2014 06:48:44 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Acked-by: Hongxu Jia <hongxu.jia@windriver.com>

//Hongxu

On 08/08/2014 11:19 PM, Tim Orling wrote:
> * CPAN::Meta is provided by perl-module-cpan, NOT perl-module-cpan-meta
> * Module::Load is provided by perl-module-load, NOT perl-module-module-load
> * Fixes QA build-deps warning
>
> * libtap-harness-env-perl is bogus, already have perl-tap-harness-env
>
> Signed-off-by: Tim Orling <TicoTimo@gmail.com>
> ---
>   meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.036.bb | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.036.bb b/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.036.bb
> index 2e725a8..761f17c 100644
> --- a/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.036.bb
> +++ b/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.036.bb
> @@ -29,14 +29,13 @@ do_install () {
>   RDEPENDS_${PN} = " libextutils-config-perl \
>                      libextutils-helpers-perl \
>                      libextutils-installpaths-perl \
> -		   libtap-harness-env-perl \
>                      perl-module-xsloader \
>                      perl-module-file-spec \
>                      perl-module-io-handle \
>                      perl-module-tap-harness-env \
>                      perl-module-ipc-open3 \
>                      perl-module-file-path \
> -                   perl-module-cpan-meta \
> +                   perl-module-cpan \
>                      perl-module-extutils-cbuilder \
>                      perl-module-getopt-long \
>                      perl-module-extutils-makemaker \
> @@ -44,7 +43,7 @@ RDEPENDS_${PN} = " libextutils-config-perl \
>                      perl-module-carp \
>                      perl-module-test-more \
>                      perl-module-text-parsewords \
> -                   perl-module-module-load \
> +                   perl-module-load \
>                      perl-module-file-temp \
>                      perl-module-data-dumper \
>                      perl-module-extutils-parsexs \


