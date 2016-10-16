Return-Path: <gary@mlbassoc.com>
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id 7EE9D71A68
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Oct 2016 13:43:03 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id 6ACD968A01C; Sun, 16 Oct 2016 14:43:03 +0100 (BST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=ALL_TRUSTED,BAYES_20,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id 19A9D68A019;
	Sun, 16 Oct 2016 14:43:03 +0100 (BST)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id B060367402B0;
	Sun, 16 Oct 2016 15:43:02 +0200 (CEST)
To: openembedded-devel@lists.openembedded.org
References: <1476620149-25938-1-git-send-email-mario.goulart@gmail.com>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <278c88df-7054-8cb9-5af6-3f3637dfc1fe@mlbassoc.com>
Date: Sun, 16 Oct 2016 15:43:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <1476620149-25938-1-git-send-email-mario.goulart@gmail.com>
Subject: Re: [meta-oe][PATCH] postgresql.inc: Fix do_configure error (could not find Python.h)
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
X-List-Received-Date: Sun, 16 Oct 2016 13:43:03 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-10-16 14:15, Mario Domenech Goulart wrote:
> Fixes:
>
> | checking for Python.h... no
> | configure: error: header file <Python.h> is required for Python
> | NOTE: The following config.log files may provide further information.
> | WARNING: exit code 1 from a shell command.
> | NOTE: .../tmp/work/armv5e-poky-linux-gnueabi/postgresql/9.4.8-r0.0/build/config.log
> | ERROR: configure failed
>
> Signed-off-by: Mario Domenech Goulart <mario.goulart@gmail.com>
> ---
>  meta-oe/recipes-support/postgresql/postgresql.inc | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/meta-oe/recipes-support/postgresql/postgresql.inc b/meta-oe/recipes-support/postgresql/postgresql.inc
> index 9592c79..454624c 100644
> --- a/meta-oe/recipes-support/postgresql/postgresql.inc
> +++ b/meta-oe/recipes-support/postgresql/postgresql.inc
> @@ -40,6 +40,8 @@ export LDFLAGS_SL = "${LDFLAGS}"
>
>  inherit autotools pkgconfig perlnative pythonnative useradd update-rc.d systemd
>
> +CFLAGS += "-I${STAGING_INCDIR}/${PYTHON_DIR}"
> +
>  SYSTEMD_SERVICE_${PN} = "postgresql.service"
>  SYSTEMD_AUTO_ENABLE_${PN} = "disable"
>
> @@ -109,12 +111,6 @@ python populate_packages_prepend() {
>  }
>
>  do_configure() {
> -    # do_configure_prepend
> -    # make sure configure finds python includdirs with these envs
> -    export \
> -           STAGING_INCDIR=${STAGING_INCDIR} \
> -           STAGING_LIBDIR=${STAGING_LIBDIR}
> -
>      # do_configure
>      autotools_do_configure
>
>

Why is this needed?  I just built the existing recipe in a bare build
without any problems.  Perhaps I'm missing something?

Also, would it not be better to just add python to DEPENDS?

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

