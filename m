Return-Path: <rapphil@gmail.com>
Received: from mail-qa0-f52.google.com (mail-qa0-f52.google.com
	[209.85.216.52])
	by mail.openembedded.org (Postfix) with ESMTP id E9F3860601
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Dec 2014 15:09:18 +0000 (UTC)
Received: by mail-qa0-f52.google.com with SMTP id dc16so12166457qab.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Dec 2014 07:09:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=3f+/euuowRaGAfcpb0lVF4V1qNhjC0xCVLRlL1ckjKY=;
	b=OK5GC5Jqmx9rVMDCiH3ASyd0Dh+RSsky8sXfPsqmERsFX88Qn3UKOotvmbD+P9l7wO
	nwZysdaSbGBsl+J0Df8PAeW2X3+D6YdFRquUtelkO+eTfjZJgEr5/YciATWlbJJWj3DU
	wQoLMCHZ4hTJuhB9wyKIkz7TP/F8gvWd4I8ca4o9CkmQ5AWyNpSooAc+TAmCEUPcpjx5
	WP0VCX+VvR+2ix+BwVP6GKZukcDX4tslw/QcH/pefDX4IU36XguAIoTMux+RZWlJZU0s
	0hMTmcvy8OrcmSG+xCya7bQBZBBKyJC73Q4RBGNtubZz3Th2gnJXU4KoI7Z26zeiWXXv
	d+Rw==
MIME-Version: 1.0
X-Received: by 10.140.88.100 with SMTP id s91mr17080138qgd.65.1417705758757;
	Thu, 04 Dec 2014 07:09:18 -0800 (PST)
Received: by 10.140.142.134 with HTTP; Thu, 4 Dec 2014 07:09:18 -0800 (PST)
In-Reply-To: <1417697009-9094-1-git-send-email-rapphil@gmail.com>
References: <1417697009-9094-1-git-send-email-rapphil@gmail.com>
Date: Thu, 4 Dec 2014 13:09:18 -0200
Message-ID: <CAENGNheKVaQD13gwSFU-cjm7K_aUAHujZLQMMs=nq=fR6nWxWg@mail.gmail.com>
From: Raphael Philipe <rapphil@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] acpitest: fixing failing recipe
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
X-List-Received-Date: Thu, 04 Dec 2014 15:09:26 -0000
Content-Type: text/plain; charset=UTF-8

I noticed two typos in my patch. First i didn't use the prefix
[meta-oe], and second, in the subject, it is acpitestS the name of the
module.

It will not happen again :)
regards,

On Thu, Dec 4, 2014 at 10:43 AM, Raphael Silva <rapphil@gmail.com> wrote:
> Removed from blacklist and fixed do_compile error due to sysroot poisoning.
> Fixed removing the redefinition of CC.
>
> Signed-off-by: Raphael Silva <rapphil@gmail.com>
> ---
>  meta-oe/recipes-extended/acpica/acpitests_20140828.bb | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-extended/acpica/acpitests_20140828.bb b/meta-oe/recipes-extended/acpica/acpitests_20140828.bb
> index 75e10f6..93c20af 100644
> --- a/meta-oe/recipes-extended/acpica/acpitests_20140828.bb
> +++ b/meta-oe/recipes-extended/acpica/acpitests_20140828.bb
> @@ -6,7 +6,6 @@ LIC_FILES_CHKSUM = "file://tests/aapits/atexec.c;beginline=1;endline=115;md5=e92
>
>  DEPENDS = "bison flex"
>
> -PNBLACKLIST[acpitests] = "fails to find string.h since sysroot poisoning was added in internal toolchain"
>
>  SRC_URI = "https://acpica.org/sites/acpica/files/acpitests-unix-${PV}.tar.gz;name=acpitests \
>             https://acpica.org/sites/acpica/files/acpica-unix2-${PV}.tar.gz;name=acpica \
> @@ -20,7 +19,7 @@ SRC_URI[acpica.sha256sum] = "01d8867656c5ba41dec307c4383ce676196ad4281ac2c9dec9f
>
>  S = "${WORKDIR}/acpitests-unix-${PV}"
>
> -EXTRA_OEMAKE = "'CC=${TARGET_PREFIX}gcc ${HOST_CC_ARCH}' 'OPT_CFLAGS=-Wall'"
> +EXTRA_OEMAKE = "'${HOST_CC_ARCH}' 'OPT_CFLAGS=-Wall'"
>
>  # The Makefiles expect a specific layout
>  do_compile() {
> --
> 1.9.1
>

