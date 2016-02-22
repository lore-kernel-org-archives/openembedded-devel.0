Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by mail.openembedded.org (Postfix) with SMTP id F31596E5CC
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 16:01:43 +0000 (UTC)
Received: (qmail 14608 invoked by uid 1003); 22 Feb 2016 16:01:44 -0000
Received: from unknown (HELO ?192.168.11.140?)
	(philip@opensdr.com@71.171.13.83)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	22 Feb 2016 16:01:43 -0000
To: openembedded-devel@lists.openembedded.org
References: <1456146596-6976-1-git-send-email-Martin.Jansa@gmail.com>
	<1456146596-6976-8-git-send-email-Martin.Jansa@gmail.com>
From: Philip Balister <philip@balister.org>
Message-ID: <56CB30E7.2010700@balister.org>
Date: Mon, 22 Feb 2016 11:01:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.0
MIME-Version: 1.0
In-Reply-To: <1456146596-6976-8-git-send-email-Martin.Jansa@gmail.com>
Subject: Re: [PATCH][meta-oe 08/10] zeromq, cppzmq, python-pyzmq: Blacklist, zeromq is broken
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
X-List-Received-Date: Mon, 22 Feb 2016 16:01:44 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Updating zeromq to 4.1.4 resolves this problem. I'm preparing a patch.
Thanks for catching this!

Philip

On 02/22/2016 08:09 AM, Martin Jansa wrote:
> * http://errors.yoctoproject.org/Errors/Details/35121/
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb          | 2 ++
>  meta-oe/recipes-connectivity/zeromq/zeromq_4.1.3.bb        | 3 +++
>  meta-python/recipes-devtools/python/python-pyzmq_14.7.0.bb | 2 ++
>  3 files changed, 7 insertions(+)
> 
> diff --git a/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb b/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
> index 1a59716..3c1eb26 100644
> --- a/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
> +++ b/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
> @@ -17,3 +17,5 @@ do_install () {
>  PACKAGES = "${PN}-dev"
>  
>  RDEPENDS_${PN}-dev = "zeromq-dev"
> +
> +PNBLACKLIST[cppzmq] ?= "Depends on broken zeromq"
> diff --git a/meta-oe/recipes-connectivity/zeromq/zeromq_4.1.3.bb b/meta-oe/recipes-connectivity/zeromq/zeromq_4.1.3.bb
> index 5d0e2d5..bd6c1ef 100644
> --- a/meta-oe/recipes-connectivity/zeromq/zeromq_4.1.3.bb
> +++ b/meta-oe/recipes-connectivity/zeromq/zeromq_4.1.3.bb
> @@ -28,3 +28,6 @@ do_install_ptest () {
>          install -d ${D}${PTEST_PATH}/tests
>          install -m 0755 ${B}/.libs/test_* ${D}${PTEST_PATH}/tests
>  }
> +
> +# http://errors.yoctoproject.org/Errors/Details/35121/
> +PNBLACKLIST[zeromq] ?= "BROKEN: zeromq-4.1.3/src/curve_client.cpp:61:18: error: ignoring return value of 'int sodium_init()', declared with attribute warn_unused_result [-Werror=unused-result]"
> diff --git a/meta-python/recipes-devtools/python/python-pyzmq_14.7.0.bb b/meta-python/recipes-devtools/python/python-pyzmq_14.7.0.bb
> index b5baf82..8aeb1b6 100644
> --- a/meta-python/recipes-devtools/python/python-pyzmq_14.7.0.bb
> +++ b/meta-python/recipes-devtools/python/python-pyzmq_14.7.0.bb
> @@ -22,3 +22,5 @@ do_compile_prepend() {
>      echo libzmq_extension = False >> ${S}/setup.cfg
>      echo no_libzmq_extension = True >> ${S}/setup.cfg
>  }
> +
> +PNBLACKLIST[python-pyzmq] ?= "Depends on broken zeromq"
> 

