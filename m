Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by mail.openembedded.org (Postfix) with SMTP id 5EF6165CBC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2015 13:30:18 +0000 (UTC)
Received: (qmail 25730 invoked by uid 1003); 20 Aug 2015 13:30:18 -0000
Received: from unknown (HELO ?192.168.10.72?)
	(philip@opensdr.com@64.134.178.169)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	20 Aug 2015 13:30:18 -0000
To: openembedded-devel@lists.openembedded.org
References: <1440049155-4314-1-git-send-email-rongqing.li@windriver.com>
	<1440049155-4314-2-git-send-email-rongqing.li@windriver.com>
From: Philip Balister <philip@balister.org>
Message-ID: <55D5D65A.3090900@balister.org>
Date: Thu, 20 Aug 2015 09:30:02 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <1440049155-4314-2-git-send-email-rongqing.li@windriver.com>
Subject: Re: [PATCH 2/2][meta-oe] zeromq: upgrade to 4.1.3
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
X-List-Received-Date: Thu, 20 Aug 2015 13:30:25 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 08/20/2015 01:39 AM, rongqing.li@windriver.com wrote:
> From: Roy Li <rongqing.li@windriver.com>
> 
> 4.1.3 has the dependence on libsodium,
> 4.1.3 asks pkgconfig bbclass to configure,
> add a target to build ptest, since the orignial check will build and run
> which is not suitable for cross-compile, and change the ptest installation
> directories

Do you know if we need to update zmqcpp and the python bindings? A quick
scan of the c++ bindings suggest we need to. I can send in a patch to
update that (I should anyway regardless) and will double check the
python stuff when I finally get home.

Philip

> 
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>  .../zeromq/{zeromq_4.0.4.bb => zeromq_4.1.3.bb}            | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
>  rename meta-oe/recipes-connectivity/zeromq/{zeromq_4.0.4.bb => zeromq_4.1.3.bb} (62%)
> 
> diff --git a/meta-oe/recipes-connectivity/zeromq/zeromq_4.0.4.bb b/meta-oe/recipes-connectivity/zeromq/zeromq_4.1.3.bb
> similarity index 62%
> rename from meta-oe/recipes-connectivity/zeromq/zeromq_4.0.4.bb
> rename to meta-oe/recipes-connectivity/zeromq/zeromq_4.1.3.bb
> index 80907fa..5d0e2d5 100644
> --- a/meta-oe/recipes-connectivity/zeromq/zeromq_4.0.4.bb
> +++ b/meta-oe/recipes-connectivity/zeromq/zeromq_4.1.3.bb
> @@ -2,12 +2,13 @@ DESCRIPTION = "ZeroMQ looks like an embeddable networking library but acts like
>  HOMEPAGE = "http://www.zeromq.org"
>  LICENSE = "LGPLv3+"
>  LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=d5311495d952062e0e4fbba39cbf3de1"
> +DEPENDS = "libsodium"
>  
>  SRC_URI = "http://download.zeromq.org/zeromq-${PV}.tar.gz \
>             file://run-ptest \
>             "
> -SRC_URI[md5sum] = "f3c3defbb5ef6cc000ca65e529fdab3b"
> -SRC_URI[sha256sum] = "1ef71d46e94f33e27dd5a1661ed626cd39be4d2d6967792a275040e34457d399"
> +SRC_URI[md5sum] = "d0824317348cfb44b8692e19cc73dc3a"
> +SRC_URI[sha256sum] = "61b31c830db377777e417235a24d3660a4bcc3f40d303ee58df082fcd68bf411"
>  
>  S = "${WORKDIR}/zeromq-${PV}"
>  
> @@ -16,9 +17,14 @@ S = "${WORKDIR}/zeromq-${PV}"
>  #CFLAGS_append += "-O0"
>  #CXXFLAGS_append += "-O0"
>  
> -inherit autotools ptest
> +inherit autotools ptest pkgconfig
> +
> +do_compile_ptest () {
> +	echo 'buildtest-TESTS: $(check_PROGRAMS)' >> ${B}/Makefile
> +	oe_runmake buildtest-TESTS
> +}
>  
>  do_install_ptest () {
>          install -d ${D}${PTEST_PATH}/tests
> -        install -m 0755 ${B}/tests/.libs/* ${D}${PTEST_PATH}/tests
> +        install -m 0755 ${B}/.libs/test_* ${D}${PTEST_PATH}/tests
>  }
> 

