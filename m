Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vc0-f180.google.com (mail-vc0-f180.google.com
	[209.85.220.180])
	by mail.openembedded.org (Postfix) with ESMTP id 88D7460232
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Dec 2014 09:05:52 +0000 (UTC)
Received: by mail-vc0-f180.google.com with SMTP id im6so3434061vcb.39
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Dec 2014 01:05:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=1d14WGf7eGhjfXzJbb0cysPtDLwY7EZs95KLszYOlLY=;
	b=avaQARalRDIg7bceI2RIITzGTz8fBvEfMpwkAx7K4ZxyOgL29e0jIAKgvyAJVvgubP
	2LkbzxGGdxOOdPcOiWI0R2hby6PPvmaDKbmhYIcdZ0ApQP/CnvDcXTwQrj8JikREi59W
	d/W7HaI1z2WSvsuWLcfxAhrd+UTN/lTmrkbpYJi3K0ythxFsX0PP+HXLaJYJNjW2pHy+
	Y34Q6looZn2PkkS3DXwrDQRc15z0AYueNnTg5js1zDnDZ+I7ujbasIAk1d8e54NxsuVG
	PX0Y8KvDADorq+lT7QBe6COo6a784YS0WrjqNfJcHONIW7NEBHL/sJDK033h/AxiL7HQ
	8FoA==
MIME-Version: 1.0
X-Received: by 10.52.244.78 with SMTP id xe14mr8619969vdc.6.1418375152738;
	Fri, 12 Dec 2014 01:05:52 -0800 (PST)
Received: by 10.52.237.165 with HTTP; Fri, 12 Dec 2014 01:05:52 -0800 (PST)
In-Reply-To: <1418373159-29364-1-git-send-email-koen@dominion.thruhere.net>
References: <1418373159-29364-1-git-send-email-koen@dominion.thruhere.net>
Date: Fri, 12 Dec 2014 10:05:52 +0100
Message-ID: <CALbNGRSWebvs_559EMwOPpAFv2UiCxe0VVqfZL-XxaZW=uBbBw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-gumstix-community] u-boot-overo 2013.07: add missing LICENSE info
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
X-List-Received-Date: Fri, 12 Dec 2014 09:06:00 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Dec 12, 2014 at 9:32 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> OE-core moved the LICENSE info from the .inc to the .bb, update
> u-boot-overo to match.
>
> This fixes an error in bitbake-prserv-tool export.
>
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  recipes-bsp/u-boot/u-boot-overo_2013.07.bb | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/recipes-bsp/u-boot/u-boot-overo_2013.07.bb b/recipes-bsp/u-boot/u-boot-overo_2013.07.bb
> index df43372..348c933 100644
> --- a/recipes-bsp/u-boot/u-boot-overo_2013.07.bb
> +++ b/recipes-bsp/u-boot/u-boot-overo_2013.07.bb
> @@ -1,5 +1,9 @@
>  require recipes-bsp/u-boot/u-boot.inc
>
> +LICENSE = "GPLv2+"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb \
> +                    file://README;beginline=1;endline=22;md5=78b195c11cb6ef63e6985140db7d7bab"
> +
>  # SPL build
>  UBOOT_BINARY = "u-boot.img"
>  UBOOT_IMAGE = "u-boot-${MACHINE}-${PV}-${PR}.img"
> --
> 1.9.0
>
applied - thanks

Andreas

