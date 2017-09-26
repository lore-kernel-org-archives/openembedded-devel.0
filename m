Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 73CA47807C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Sep 2017 11:26:42 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id u48so2302003wrf.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Sep 2017 04:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=FZyikJ9Qrps7UBmo5RIMRmiYoOkz/L5sEcUDAENJuY4=;
	b=r6LYVxpu/LMGxnNaVzTWBnqHqT9FK4JHjzdvE/yZo00wJZdEEOf0nldkXIgnJUi+u3
	E549d0cLhK0JgI+lFo3vsiIqCa9qIpwW65m1epBDzt87RYv8UlBJssrBfi/3ZmPzbpfi
	fdS4xaUIvsqgsrpjdIjVvFiIFtNJfgeR7+6yCj7euyjdPtRctzk0rzDLM40CBSEq1+Yi
	bSgE+a32wqFb76JoG4upBR0jOuR4xmoNHtlqFCcrivojCQATXKVoYEmKc5JgVMCp6Dm/
	JI71TYdj0FdtIGY3cwG2pUIR6ivsf0tB9cVHuQ4MMxIzK6QZrXH6Wqaw5oaSdHd01Kv7
	4p9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=FZyikJ9Qrps7UBmo5RIMRmiYoOkz/L5sEcUDAENJuY4=;
	b=UIvqQocR6wXMyVoeYFV274nA8K3NcZyZ93seXIrvK+ktrGxVLSrq1l9BV5dOibqx/a
	BXmaEd88WqMSmr0q0E0KYukKzYGz2JIC1zj4HflGY31LO40JZr2q2u+WUVyDCqMILJgH
	g2iTJYmHIWBNUZlMgKyfAchmkSAsLAoIbCIMxQBfl7DQ1Tdpww4mQiXWrZgXFccj9C/+
	+iqntDLx/qfgyET3SBR8K2DAoNSyX7WvrLGRAZub3gg7AO7w803RjUy5csAssNVarvGU
	0vHv+M3czDoQuxweNkFiqz8GsLAgma6qpgVtU2TbS51sK0fowWU75+FD46xmN+a+GsyO
	wHNg==
X-Gm-Message-State: AHPjjUhpP14HIaog4+h4lL3skIwAkPjacDLC7eA7x7RX6g1APpPMdcpp
	tpRg1oMMCnKTmMAf9XVYDjdiJhZWl/jSrryEE8/99A==
X-Google-Smtp-Source: AOwi7QA6rItAFvd1ujigeFIWBVBvNSZPYDiONxOzgWyfzMuu00Xg3GYVuoemHJuR/I9NqKgxp3QUMsMUoJuzm0A3pic=
X-Received: by 10.46.25.23 with SMTP id p23mr4075025lje.37.1506425203034; Tue,
	26 Sep 2017 04:26:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.83.83 with HTTP; Tue, 26 Sep 2017 04:26:22 -0700 (PDT)
In-Reply-To: <20170907085136.20862-2-ricardo.ribalda@gmail.com>
References: <20170907085136.20862-1-ricardo.ribalda@gmail.com>
	<20170907085136.20862-2-ricardo.ribalda@gmail.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Tue, 26 Sep 2017 13:26:22 +0200
Message-ID: <CAPybu_08S-izqY3pUTisRRbX5MQSDcAskZpK209Kt5cC5jv48Q@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-java][PATCH 2/2] openjdk-8-native: Fix sigsegv with gcc7
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
X-List-Received-Date: Tue, 26 Sep 2017 11:26:42 -0000
Content-Type: text/plain; charset="UTF-8"

Ping?

On Thu, Sep 7, 2017 at 10:51 AM, Ricardo Ribalda Delgado
<ricardo.ribalda@gmail.com> wrote:
> OpenJDK does not build properly with GCC7. Add the same workaround that
> we have for GCC6.
>
> Without this patch:
>
> | #
> | # A fatal error has been detected by the Java Runtime Environment:
> | #
> | #  SIGSEGV (0xb) at pc=0x00007fcad0efcd5b, pid=17206, tid=0x00007fcab264c700
> | #
> | # JRE version: OpenJDK Runtime Environment (8.0_102-b14) (build 1.8.0_102-internal-b14)
> | # Java VM: OpenJDK 64-Bit Server VM (25.102-b14 mixed mode linux-amd64 compressed oops)
> | # Problematic frame:
> | # V  [libjvm.so+0x78bd5b]  Node::Node(unsigned int)+0x2b
> | #
> | # Failed to write core dump. Core dumps have been disabled. To enable core dumping, try "ulimit -c unlimited" before starting Java again
> | #
> | # An error report file with more information is saved as:
> | # /home/ricardo/curro/qt5022/build-qt5022-pyro/build/tmp/work/x86_64-linux/openjdk-8-native/102b14-r0/build/hs_err_pid17206.log
> | [thread 140508549912320 also had an error]
> |
> | [error occurred during error reporting , id 0xb]
> |
> | #
> | # If you would like to submit a bug report, please visit:
> | #   http://bugreport.java.com/bugreport/crash.jsp
> | #
>
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> ---
>  recipes-core/openjdk/openjdk-8-common.inc | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/recipes-core/openjdk/openjdk-8-common.inc b/recipes-core/openjdk/openjdk-8-common.inc
> index def779db4d59..0c5c2c3e3d2f 100644
> --- a/recipes-core/openjdk/openjdk-8-common.inc
> +++ b/recipes-core/openjdk/openjdk-8-common.inc
> @@ -218,10 +218,11 @@ EXTRA_OECONF_append = "\
>          --with-update-version=${OPENJDK_UPDATE_VERSION} \
>  "
>
> -# GCC 6 sets the default C++ standard to C++14 and introduces dead store
> -# elimination by default. OpenJDK 8 is not ready for either of these
> -# changes.
> +# Since v6, GCC sets the default C++ standard to C++14 and introduces
> +# dead store elimination by default. OpenJDK 8 is not ready for either
> +# of these changes.
>  FLAGS_GCC6 = "-fno-lifetime-dse -fno-delete-null-pointer-checks"
> +FLAGS_GCC7 = "-fno-lifetime-dse -fno-delete-null-pointer-checks"
>
>  # All supported cross compilers support the compiler flags that were
>  # added to make compilation with gcc6 work. But the host compiler for
> --
> 2.14.1
>



-- 
Ricardo Ribalda

