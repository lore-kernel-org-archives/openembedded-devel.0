Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id DD8A4771EB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Feb 2017 10:42:36 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id u63so2430225wmu.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Feb 2017 02:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=CmSqwWgFRWGY2kGb4wcEsBjSf55SpdJ7bpYOe+4ENPI=;
	b=UcHNNWRvnPT4VAkPH1O3ImOp6thxufYacKQc9DRcw2x1k0H0xHYZyeewgHKVS9cGx0
	CcIQRp9EgCZRrUYryHBLt/302el+3wOvkQd7zgCTcojg/DTCRdxU6ccNW+DZrSlFfZnH
	8/YVOTmPOUUPFAgY9x2Tpq5/Tx2X6jBzhhhmcV4xoKXsh5FvMI86Edlp+3DoHjFxUdvH
	gTz+LTaKPMmqqO2Ka7WdgAO2Y7IwBE0PqNZotYogePCKHSOswhUSzKiCYlymDyXXe/rR
	SxI7UtEsetlbQAEGlevkzsRJ7WbNax3Z/lCNwWkuXzAcYEMwB7CtaKnbEaXQbYn4kH34
	t7vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=CmSqwWgFRWGY2kGb4wcEsBjSf55SpdJ7bpYOe+4ENPI=;
	b=oKmNNe/fO4XZiPpfZ8P3Zqic+s9QENvth0/U2WfpcWsbbQBExCM91AWUPkdwYgFGfS
	/6+wr5E/jSSaGCeDWMC2WsAKPkqp9fzeucGuCMPGxDsTKYKqcsQjEoWc0IioiQV+u0rh
	nq7Wmo4x3bDbEBASg0QSYRh6zLsfqRBvKZ+9tZ/iROxiFDCq1aRn9p+BEClXtOwQMH0Q
	M5KeFw9sAgsXFVZB1kzAFAVNNWRijYF9yc31Dd1eM1M0gHnJpal5Bxe1u4FZSA7fGV4p
	glRHI8cIDCgrnqepatRoRGiZvwGHYTGdzgePWIZtFObByDTtt+Wk2NvKUgCd1K93ABW8
	jnyw==
X-Gm-Message-State: AMke39knJuwwGMit+1lMTBoh9vMzFIr64NrBnoK1UWd43OZy3tJYHZhUvraS0D0xqngOq0iBxxymcFdXMqIOLQ==
X-Received: by 10.28.209.202 with SMTP id i193mr1955227wmg.20.1487241756101;
	Thu, 16 Feb 2017 02:42:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.174.82 with HTTP; Thu, 16 Feb 2017 02:42:35 -0800 (PST)
In-Reply-To: <b0a782f34afd1a1157936114a7288ef963521bd2.1487240872.git-series.patrick.ohly@intel.com>
References: <b0a782f34afd1a1157936114a7288ef963521bd2.1487240872.git-series.patrick.ohly@intel.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 16 Feb 2017 02:42:35 -0800
Message-ID: <CAJ86T=XTw9wjbXf1GGq=i6gxKuSLFhcvHGvKpD9mhFg2bnRubw@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] multipath-tools: fix ARM build failure
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
X-List-Received-Date: Thu, 16 Feb 2017 10:42:37 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Feb 16, 2017 at 2:29 AM, Patrick Ohly <patrick.ohly@intel.com> wrote:
> Updating to 0.6.4 introduced a build failure on ARM when thumb was
> enabled because of the embedded valgrind.h macro calls. The easiest
> solution and thus the one used here is to disable thumb for this
> particular recipe.
>
> The more elaborate solution would be to patch the macro calls out of
> the code when compiling for ARM with thumb.
>
> Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
> ---
>  meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb |  9 +++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb b/meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb
> index 6706bec..a3b33b6 100644
> --- a/meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb
> +++ b/meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb
> @@ -27,6 +27,13 @@ PV = "0.6.4+git${@'${SRCPV}'.split('+')[-1]}"
>
>  TARGET_CC_ARCH += "${LDFLAGS}"
>
> +# multipath-tools includes a copy of the valgrind.h header
> +# file and uses the macros to suppress some false positives. However,
> +# that only works on ARM when thumb is disabled. Otherwise one gets:
> +#   Error: shifts in CMP/MOV instructions are only supported in unified syntax -- `mov r12,r12,ror#3'
> +#   ../Makefile.inc:66: recipe for target 'debug.o' failed
> +ARM_INSTRUCTION_SET = "arm"

Since the problem is presumably Thumb1 specific, you should only force
the ARM instruction set for ARM cores which don't support Thumb2, ie
use:

ARM_INSTRUCTION_SET_armv4 = "arm"
ARM_INSTRUCTION_SET_armv5 = "arm"


>  # The exact version of SYSTEMD does not matter but should be greater than 209.
>  #
>  EXTRA_OEMAKE = 'MULTIPATH_VERSION=${PV} DESTDIR=${D} syslibdir=${base_libdir} \
> @@ -59,5 +66,3 @@ FILES_kpartx = "${base_sbindir}/kpartx \
>                 "
>
>  RDEPENDS_${PN} += "kpartx"
> -
> -PNBLACKLIST[multipath-tools] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130529/"
>
> base-commit: 044e5189549de11b2a94efd29a6009a76162b8f1
> --
> git-series 0.9.1
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

