Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vc0-f181.google.com (mail-vc0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id 9394E72607
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Dec 2014 23:25:49 +0000 (UTC)
Received: by mail-vc0-f181.google.com with SMTP id le20so6930415vcb.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Dec 2014 15:25:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Id645BXIK8xsy86iq9PxPkD1N8aXTOMuJbZLdRpOPgc=;
	b=Sl+XEhWDqr9J9S1yWqolbvwhJ3sUAeO6VXYW0p3ryZaQh1nFZimBs6/s/5EnA1SFDk
	3l4Yz6moTDn9OMYpDDqBS0nJDJ9UeIJnc6NRRjD66Dgk7P/cqIIwlH6S7Dh3OdGR3mfe
	4sJGy1kzNpqj2+l/ubzZC4DG6Lmap9Ahpya0WvCM5DuhBfLH34atCKbE3WfdstwaKJjc
	z0YzzkeziLzwXN40DaHocyVzHrR4VqVcmBhaU0fRzIdGpCibpwA860Q91apyj+NZzkdo
	W42FnR7bJ0jmmIutJOAdN067GPKSe0pCzFHMxDpadQ32KGFODHTFwwzjpy3DW/bXonyN
	4KrQ==
MIME-Version: 1.0
X-Received: by 10.220.238.12 with SMTP id kq12mr24609068vcb.62.1418772349962; 
	Tue, 16 Dec 2014 15:25:49 -0800 (PST)
Received: by 10.52.144.47 with HTTP; Tue, 16 Dec 2014 15:25:49 -0800 (PST)
In-Reply-To: <1418721193-12130-1-git-send-email-koen@dominion.thruhere.net>
References: <1418721193-12130-1-git-send-email-koen@dominion.thruhere.net>
Date: Wed, 17 Dec 2014 00:25:49 +0100
Message-ID: <CALbNGRSm90h5ym82GiAm2p38BsXBcx4cPU5ka9zG44J82yaaZg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-gumstix-community] linux-firmware bbappend: remove PR_INC
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
X-List-Received-Date: Tue, 16 Dec 2014 23:25:54 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Dec 16, 2014 at 10:13 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> OE-core errors out nowadays when encountering it:
>
> ERROR: Use of PRINC 1 was detected in the recipe
> /build/jenkins/angstrom-v2015.06/machine/arietta-g25/sources/openembedded-core/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
> (or one of its .bbappends)
>
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  recipes-kernel/linux-firmware/linux-firmware_git.bbappend | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/recipes-kernel/linux-firmware/linux-firmware_git.bbappend b/recipes-kernel/linux-firmware/linux-firmware_git.bbappend
> index e632dbe..6d656f0 100644
> --- a/recipes-kernel/linux-firmware/linux-firmware_git.bbappend
> +++ b/recipes-kernel/linux-firmware/linux-firmware_git.bbappend
> @@ -1,5 +1,3 @@
> -PRINC := "${@int(PRINC) + 1}"
> -
>  do_install_append() {
>         ln -sf libertas/lbtf_sdio.bin ${D}/lib/firmware/lbtf_sdio.bin
>  }
> --
> 1.9.0
>
applied - thanks

Andreas

