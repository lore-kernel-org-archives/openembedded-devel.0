Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 96B4179D25
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 Oct 2018 23:29:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w9KNSdOu014278
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 20 Oct 2018 16:29:01 -0700
Received: from [172.25.44.4] (172.25.44.4) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Sat, 20 Oct 2018 16:28:31 -0700
To: Anders Roxell <anders.roxell@linaro.org>,
	<openembedded-devel@lists.openembedded.org>
References: <20181019145416.8021-1-anders.roxell@linaro.org>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <407614ae-de48-8832-e3ad-1ab130f8c826@windriver.com>
Date: Sat, 20 Oct 2018 19:28:30 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181019145416.8021-1-anders.roxell@linaro.org>
X-Originating-IP: [172.25.44.4]
Subject: Re: [meta-oe][PATCH] add a storage I/O benchmark test suite
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
X-List-Received-Date: Sat, 20 Oct 2018 23:29:27 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 10/19/18 10:54 AM, Anders Roxell wrote:
> Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
> ---
>   .../recipes-benchmark/s-suite/s-suite_git.bb  | 30 +++++++++++++++++++
>   1 file changed, 30 insertions(+)
>   create mode 100644 meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
> 
> diff --git a/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb b/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
> new file mode 100644
> index 000000000000..77d172814065
> --- /dev/null
> +++ b/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
> @@ -0,0 +1,30 @@
> +SUMMARY = "Small collection of benchmarks for storage I/O"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=b529aaa6a0c50f15d29f89609b5c22f3"
> +
> +SRCREV = "79698f645bfb28d0d966484ddad3a1efb562246d"
> +PV = "0.0+git${SRCPV}"
> +SRC_URI = "git://github.com/Algodev-github/S.git;protocol=https;branch=master"
> +
> +S = "${WORKDIR}/git"
> +
> +# installing in /opt/S-suite since the package has
> +# dependencies to the directory structure.
> +do_install() {
> +    install -d ${D}/opt/S-suite
> +    for i in $(find ${S}/* -type d); do
> +        install -d ${D}/opt/S-suite/$(basename $i)
> +        install -m0755 -p ${S}/$(basename $i)/* ${D}/opt/S-suite/$(basename $i)
> +    done
> +
> +    install -m0755 ${S}/config_params.sh ${D}/opt/S-suite
> +    install -m0755 ${S}/def_config_params.sh ${D}/opt/S-suite
> +}
> +
> +RDEPENDS_${PN} = "bash bc coreutils gawk g++ gcc fio libaio libaio-dev sysstat"
> +
> +FILES_${PN} = "/opt/S-suite/"
> +
> +# added to INSANE_SKIP since s-suite have an runtime
> +# dependency (RDEPENDS) on libaio-dev.
> +INSANE_SKIP_${PN} += "dev-deps"
> 

Thanks for the submission but from:

    https://github.com/Algodev-github/S

    "These benchmarks have been written just for internal use,
     and are more a yard than a well-finished work."


That doesn't lead to a lot of confidence that these suite will
be maintained for years. What's the value to meta-oe users to add
this recipe compared to something that has been around for years
if not decades such as Bonnie++:
    https://layers.openembedded.org/layerindex/recipe/864/


-- 
# Randy MacLeod
# Wind River Linux

