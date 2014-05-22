Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (unknown [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AF5D765D0E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 May 2014 02:02:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s4M22oBQ008472
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 21 May 2014 19:02:50 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.169.1;
	Wed, 21 May 2014 19:02:50 -0700
Message-ID: <537D5AC7.8040302@windriver.com>
Date: Thu, 22 May 2014 10:02:47 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Tim Orling <ticotimo@gmail.com>
References: <1400658223-15804-1-git-send-email-ticotimo@gmail.com>
In-Reply-To: <1400658223-15804-1-git-send-email-ticotimo@gmail.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [meta-perl][PATCH v4 00/10] add perl modules
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
X-List-Received-Date: Thu, 22 May 2014 02:02:52 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 05/21/2014 03:43 PM, Tim Orling wrote:
> From: Tim Orling <TicoTimo@gmail.com>
>
> Changes since v3:
>    * Use ${CPAN_MIRROR} for all recipes
>        * See patches for oe-core:
>            http://patches.openembedded.org/patch/72457/
>            http://patches.openembedded.org/patch/72459/

It seems these patches for oe-core have not been merged.

//Hongxu

>    * Upstream has continued to move forward
>    * Update the following:
>        libcapture-tiny-perl from 0.23 -> 0.24
>        libmodule-runtime-perl from 0.013 -> 0.014
>        libextutils-helpers-perl from 0.021 -> 0.022
>        libmodule-build-tiny-perl from 0.030 -> 0.036
>    * Add libtest-harness-perl which RPROVIDES libtap-harness-env-perl
>      now required by libmodule-build-tiny-perl
>
> Tim Orling (10):
>    libtext-diff-perl: add 1.41
>    libcapture-tiny-perl: add 0.24
>    libmodule-runtime-perl: add 0.014
>    libextutils-config-perl: add 0.007
>    libextutils-helper-perl: add 0.022
>    libextutils-installpaths-perl: add 0.010
>    libmodule-build-tiny-perl: add 0.036
>    libextutils-cppguess-perl: add 0.07
>    libalgorithm-diff-perl: add 1.15
>    libtest-harness-perl: add 3.30
>
>   .../libalgorithm/libalgorithm-diff-perl_1.15.bb    | 23 +++++++
>   .../libcapture/libcapture-tiny-perl_0.24.bb        | 36 ++++++++++
>   .../libextutils/libextutils-config-perl_0.007.bb   | 24 +++++++
>   .../libextutils/libextutils-cppguess-perl_0.07.bb  | 38 +++++++++++
>   .../libextutils/libextutils-helpers-perl_0.022.bb  | 29 ++++++++
>   .../libextutils-installpaths-perl_0.010.bb         | 25 +++++++
>   .../libmodule/libmodule-build-tiny-perl_0.036.bb   | 55 +++++++++++++++
>   .../libmodule/libmodule-runtime-perl_0.014.bb      | 35 ++++++++++
>   .../libtest/libtest-harness-perl_3.30.bb           | 79 ++++++++++++++++++++++
>   .../recipes-perl/libtext/libtext-diff-perl_1.41.bb | 27 ++++++++
>   10 files changed, 371 insertions(+)
>   create mode 100644 meta-perl/recipes-perl/libalgorithm/libalgorithm-diff-perl_1.15.bb
>   create mode 100644 meta-perl/recipes-perl/libcapture/libcapture-tiny-perl_0.24.bb
>   create mode 100644 meta-perl/recipes-perl/libextutils/libextutils-config-perl_0.007.bb
>   create mode 100644 meta-perl/recipes-perl/libextutils/libextutils-cppguess-perl_0.07.bb
>   create mode 100644 meta-perl/recipes-perl/libextutils/libextutils-helpers-perl_0.022.bb
>   create mode 100644 meta-perl/recipes-perl/libextutils/libextutils-installpaths-perl_0.010.bb
>   create mode 100644 meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.036.bb
>   create mode 100644 meta-perl/recipes-perl/libmodule/libmodule-runtime-perl_0.014.bb
>   create mode 100644 meta-perl/recipes-perl/libtest/libtest-harness-perl_3.30.bb
>   create mode 100644 meta-perl/recipes-perl/libtext/libtext-diff-perl_1.41.bb
>


