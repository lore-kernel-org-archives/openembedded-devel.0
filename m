Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (unknown [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B722E6AE86
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 May 2014 02:03:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s4M23f7t002159
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 21 May 2014 19:03:42 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.169.1;
	Wed, 21 May 2014 19:03:41 -0700
Message-ID: <537D5AFA.6000800@windriver.com>
Date: Thu, 22 May 2014 10:03:38 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Tim Orling <ticotimo@gmail.com>
References: <1400658223-15804-1-git-send-email-ticotimo@gmail.com>
	<1400658223-15804-11-git-send-email-ticotimo@gmail.com>
In-Reply-To: <1400658223-15804-11-git-send-email-ticotimo@gmail.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [meta-perl][PATCH v4 10/10] libtest-harness-perl: add 3.30
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
X-List-Received-Date: Thu, 22 May 2014 02:03:47 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 05/21/2014 03:43 PM, Tim Orling wrote:
> From: Tim Orling <TicoTimo@gmail.com>
>
> Test::Harness - Run Perl standard test scripts with statistics
>
> * Uses ${CPAN_MIRROR} option
> * RPROVIDES based on v3.28 recipe:
>          Paul Eggleton <paul.eggleton@linux.intel.com>
> 	http://github.com/bluelightning/public_bb_recipes
> * which is forked from
>          Emil Petersen <erp@movis.dk> repo
>          http://github.com/EmilRP/public_bb_recipes/
>
> Signed-off-by: Tim Orling <TicoTimo@gmail.com>
> ---
>   .../libtest/libtest-harness-perl_3.30.bb           | 79 ++++++++++++++++++++++
>   1 file changed, 79 insertions(+)
>   create mode 100644 meta-perl/recipes-perl/libtest/libtest-harness-perl_3.30.bb
>
> diff --git a/meta-perl/recipes-perl/libtest/libtest-harness-perl_3.30.bb b/meta-perl/recipes-perl/libtest/libtest-harness-perl_3.30.bb
> new file mode 100644
> index 0000000..169931b
> --- /dev/null
> +++ b/meta-perl/recipes-perl/libtest/libtest-harness-perl_3.30.bb
> @@ -0,0 +1,79 @@
> +SUMMARY = "Test::Harness - Run Perl standard test scripts with statistics"
> +DESCRIPTION = "Although, for historical reasons, the Test::Harness \
> +distribution takes its name from this module it now exists only to provide \
> +TAP::Harness with an interface that is somewhat backwards compatible \
> +with Test::Harness 2.xx. If you're writing new code consider using \
> +TAP::Harness directly instead. \
> +\
> +Emulation is provided for runtests and execute_tests but the \
> +pluggable 'Straps' interface that previous versions of Test::Harness \
> +supported is not reproduced here. Straps is now available as a stand \
> +alone module: Test::Harness::Straps. \
> +\
> +See TAP::Parser, TAP::Harness for the main documentation for this \
> +distribution."
> +
> +SECTION = "libs"
> +
> +HOMEPAGE = "http://testanything.org"
> +
> +LICENSE = "Artistic-1.0 | GPL-1.0+"
> +LIC_FILES_CHKSUM = "file://README;beginline=29;endline=30;md5=b08db4360eec119e875dddd7cb8a5ddd"
> +
> +SRC_URI = "${CPAN_MIRROR}/authors/id/L/LE/LEONT/Test-Harness-${PV}.tar.gz"
> +SRC_URI[md5sum] = "c1ff25da5dfdf77adea13dc3465638dd"
> +SRC_URI[sha256sum] = "ff1900f3b3e61321d3c4b3283298f3106d43d55446605e9cfcf1dcec036acec1"
> +
> +S = "${WORKDIR}/Test-Harness-${PV}"
> +
> +inherit cpan
> +
> +RPROVIDES_${PN} += "libapp-prove-perl \
> +                    libapp-prove-state-perl \
> +		    libapp-prove-state-result-perl \
> +		    libapp-prove-state-result-test-perl \
> +                    libtap-base-perl \
> +                    libtap-formatter-base-perl \
> +                    libtap-formatter-color-perl \
> +                    libtap-formatter-console-perl \
> +                    libtap-formatter-console-parallelsession-perl \                                 libtap-formatter-console-session-perl \

This is a typo.
The others is fine to me

//Hongxu


> +                    libtap-formatter-file-perl \
> +                    libtap-formatter-file-session-perl \
> +                    libtap-formatter-session-perl \
> +                    libtap-harness-perl \
> +		    libtap-harness-env-perl \
> +                    libtap-object-perl \
> +                    libtap-parser-perl \
> +                    libtap-parser-aggregator-perl \
> +                    libtap-parser-grammar-perl \
> +                    libtap-parser-iterator-perl \
> +                    libtap-parser-iterator-array-perl \
> +                    libtap-parser-iterator-process-perl \
> +                    libtap-parser-iterator-stream-perl \
> +                    libtap-parser-iteratorfactory-perl \
> +                    libtap-parser-multiplexer-perl \
> +                    libtap-parser-result-perl \
> +                    libtap-parsser-result-bailout-perl \
> +                    libtap-parser-result-comment-perl \
> +                    libtap-parser-result-plan-perl \
> +                    libtap-parser-result-pragma-perl \
> +                    libtap-parser-result-test-perl \
> +                    libtap-parser-result-unknown-perl \
> +                    libtap-parser-result-version-perl \
> +                    libtap-parser-result-yaml-perl \
> +                    libtap-parser-resultfactory-perl \
> +                    libtap-parser-scheduler-perl \
> +                    libtap-parser-scheduler-job-perl \
> +                    libtap-parser-scheduler-spinner-perl \
> +                    libtap-parser-source-perl \
> +                    libtap-parser-sourcehandler-perl \
> +                    libtap-parser-sourcehandler-executable-perl \
> +                    libtap-parser-sourcehandler-file-perl \
> +                    libtap-parser-sourcehandler-handle-perl \
> +                    libtap-parser-sourcehandler-perl-perl \
> +                    libtap-parser-sourcehandler-rawtap-perl \
> +                    libtap-parser-yamlish-reader-perl \
> +                    libtap-parser-yamlish-writer-perl \
> +                    "
> +
> +BBCLASSEXTEND = "native"


