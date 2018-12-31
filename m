Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 391A6603FE
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Dec 2018 19:30:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wBVJTl6s029295
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 31 Dec 2018 11:29:58 -0800
Received: from [172.25.44.4] (172.25.44.4) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Mon, 31 Dec 2018 11:29:37 -0800
To: <openembedded-devel@lists.openembedded.org>, Khem Raj
	<raj.khem@gmail.com>, <iipeace5@gmail.com>
References: <20181230165033.8850-1-raj.khem@gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <b9c25a20-eee6-c603-87a7-324bfca98587@windriver.com>
Date: Mon, 31 Dec 2018 14:29:36 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181230165033.8850-1-raj.khem@gmail.com>
X-Originating-IP: [172.25.44.4]
Subject: Re: [meta-oe][PATCH 1/3] guider: add a new runtime profiler package
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
X-List-Received-Date: Mon, 31 Dec 2018 19:30:24 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Neat tool! I'll have to play with it a bit more.

On 12/30/18 11:50 AM, Khem Raj wrote:
> From: Peace Lee <iipeace5@gmail.com>
> 
> guider [1] is a system-wide performance analyzer for platforms based

Well, it seems to be more of a meta-tool that uses standard tools.
In addition, it improves usability at the cost of defining policy
such as immediately analyzing some data collection on target.
It would be nice to succinctly summarize that if you can.
> on linux kernel. it can measure vary system resource usage and
s/it/It/
s/vary/a variety of/
> trace thread/process activities. and it reports vary meaningful
> output to analyze system status.
It reports very meaningful output to analyze system status.
> 
> [1] https://github.com/iipeace/guider
> 
> Signed-off-by: Peace Lee <iipeace5@gmail.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   .../recipes-devtools/guider/guider_3.9.3.bb   | 34 +++++++++++++++++++
>   1 file changed, 34 insertions(+)
>   create mode 100644 meta-oe/recipes-devtools/guider/guider_3.9.3.bb
> 
> diff --git a/meta-oe/recipes-devtools/guider/guider_3.9.3.bb b/meta-oe/recipes-devtools/guider/guider_3.9.3.bb
> new file mode 100644
> index 0000000000..96d6c62ae2
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/guider/guider_3.9.3.bb
> @@ -0,0 +1,34 @@
> +SUMMARY = "runtime performance analyzer"
> +HOMEPAGE = "https://github.com/iipeace/guider"
> +BUGTRACKER = "https://github.com/iipeace/guider/issues"
> +AUTHOR = "Peace Lee <ipeace5@gmail.com>"
> +
> +LICENSE = "GPLv2+"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=2c1c00f9d3ed9e24fa69b932b7e7aff2"
> +
> +SRC_URI = "git://github.com/iipeace/${BPN}"
> +SRCREV = "ac05a2ce0ab480957d642d947d8f617bd224031d"
> +
> +S = "${WORKDIR}/git"
> +R = "${RECIPE_SYSROOT_NATIVE}"
> +
> +inherit distutils
> +
> +GUIDER_OBJ = "guider.pyc"
> +GUIDER_SCRIPT = "guider"
> +
> +do_install() {
> +    python ${S}/setup.py install
> +
> +    install -d ${D}${bindir}
> +    install -v -m 0755 ${R}/${bindir}/${GUIDER_SCRIPT} ${D}${bindir}/${GUIDER_SCRIPT}
> +
> +    install -d ${D}${datadir}/${BPN}
> +    install -v -m 0755 ${R}/${datadir}/${BPN}/${GUIDER_OBJ} ${D}${datadir}/${BPN}/${GUIDER_OBJ}
> +}
> +
> +RDEPENDS_${PN} = "python-ctypes python-shell \
> +                  python-json python-subprocess"

Shouldn't the packages that guider uses be recommended at least?
I'm not familiar with the app so maybe it can do useful things without
top, perf, etc.

Should we add a kernel cfg fragment?

> +
> +FILES_SOLIBSDEV = ""
> +#FILES_${PN} = "usr"
Drop that line?

> 



-- 
# Randy MacLeod
# Wind River Linux

