Return-Path: <joe@deserted.net>
Received: from mail-vk0-f67.google.com (mail-vk0-f67.google.com
	[209.85.213.67])
	by mail.openembedded.org (Postfix) with ESMTP id C8A28771B2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Feb 2016 02:26:41 +0000 (UTC)
Received: by mail-vk0-f67.google.com with SMTP id e6so6111951vkh.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Feb 2016 18:26:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=deserted-net.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to; 
	bh=nY9aQU/Vtei4q/U362ohBGVb9p0sDINuAKTWcTErdSQ=;
	b=iW/TEkfhefqA1IJSlfD6Vx2/j0AsmUiEGDcQgLxk+lvJbHuBQNVTg1cQsPrF8aocd6
	rLYxfzCbR0NqzHIpf9uktom2aOM+mfTVSbM8ZyrQBrbSgSmEbnCDsUZLu4/r/FWepTEV
	1grTjhHXSpw9uKykYMtyomm+e7gEmguUe21VUNxkih0ZiJNBSMR5bQ3eKivZNkgiigcu
	Sq8TZUfWlqCDYqmkLpsdCfdvXl3N0HjJu8lsZels2Vz9L64dgm9d92E2pgU/pAm4MMAB
	JhM26IH/ndofkJOwf25j8VR398Ja+EudhsK+dc0977BVtPgIy3TFnA8hU1s0HILPjUen
	qMyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to;
	bh=nY9aQU/Vtei4q/U362ohBGVb9p0sDINuAKTWcTErdSQ=;
	b=VGdP83wVmZlIRuBt2bXQ61HP8IX7yhO103iF95F4M1Lxc/yy/Y3Dw09cWciTdJicTY
	VtDl4NFQ1kQv06+UfLwddrVCR6WzWiYG+LeqBuXA1BiN5YiBJKMZipX0pIerOqp+uzBl
	VelDlNBj8ivtfqx2CRe5bKpG1MWJdDPUI2ra/E0RU6rMWtnD+uc2j5u57JOR/QVZW3dM
	+245o2YMVn1o891cjLb1/rDVvpLlvFilrWbNSnoftcrTYamdA7Y5Bc4sRzb7uPCwIbOr
	5a/y0hLCYKYrDk6GkSoUuGs6rT9hHsHInm019vsJy798K3QnnANsj8z10J1RhF8AZ25R
	0GRg==
X-Gm-Message-State: AD7BkJKnz2e1ACa7ZnC3qOViA4KKQwj+aSp2Xzq8K3V6de84U7YKACJukqiIyqW8Tk2N+p5vPRC72Br3n/LUpQ==
MIME-Version: 1.0
X-Received: by 10.31.54.80 with SMTP id d77mr3194577vka.138.1456540002039;
	Fri, 26 Feb 2016 18:26:42 -0800 (PST)
Received: by 10.31.228.5 with HTTP; Fri, 26 Feb 2016 18:26:41 -0800 (PST)
In-Reply-To: <1448440079-4533-2-git-send-email-jackie.huang@windriver.com>
References: <1448440079-4533-1-git-send-email-jackie.huang@windriver.com>
	<1448440079-4533-2-git-send-email-jackie.huang@windriver.com>
Date: Fri, 26 Feb 2016 21:26:41 -0500
Message-ID: <CANBf+V2nZwQ-UGi3wDnKyzHHU8wCoO6i74D5tYxjfwv+g1TAtQ@mail.gmail.com>
From: Joe MacDonald <joe@deserted.net>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	"Huang, Jie (Jackie)" <jackie.huang@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH 2/2] iscsitarget: skip the arch test for kernel modules
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
X-List-Received-Date: Sat, 27 Feb 2016 02:26:44 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Nov 25, 2015 at 3:27 AM, <jackie.huang@windriver.com> wrote:

> From: Jackie Huang <jackie.huang@windriver.com>
>
> Kernel modules may not have the same architecture as user space.
> So we tell INSANE_SKIP to skip checking the arch for the modules.
> This is consistent with other kernel modules and the kernel recipe.
>

This one still hasn't been merged and since iscsitarget is currently
unbuildable, I'm not in a rush to merge this one particularly since I'm not
really clear on the logic underlying the change.  I searched the archives
and found your response to Martin was essentially "see my netmap-modules
patch for an explanation" and in that one the explanation was basically
"this is the way other kernel modules do it".  I merged that one but now
I'm thinking I shouldn't have without more careful consideration.  Am I
correct in thinking that this problem only shows up when you're building
for multilib?  I've reverted "netmap-modules: Modules may not have the same
arch as userspace" in my contrib tree at
http://git.openembedded.org/meta-openembedded-contrib/log/?h=joeythesaint/meta-networking-next
and my initial test builds showed no QA issues related to netmap-modules
and the arch checks.  So I started looking around for other kernel modules
doing something similar and I don't actually see this
"INSANE_SKIP_kernel-module-*" construct being used anywhere else in meta-oe
or poky (and at the least I would expect something like cryptodev-module to
need it, it looks like an analogue to me).  Can you fill me in on what's
special with iscsitarget and netmap, because even if it is a multilib
issue, why wouldn't that be showing up for other kernel modules built in
poky?

Thanks.

-J.


>
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  .../recipes-extended/iscsitarget/iscsitarget_1.4.20.3+svn502.bb        |
> 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git
> a/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+
> svn502.bb
> b/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+
> svn502.bb
> index 9d49759..9db16bc 100644
> --- a/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+
> svn502.bb
> +++ b/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+
> svn502.bb
> @@ -54,3 +54,6 @@ FILES_${PN} += "${sbindir} \
>
>  RDEPENDS_${PN} = "kernel-module-iscsi-trgt"
>  RRECOMMENDS_${PN} = "kernel-module-crc32c kernel-module-libcrc32c"
> +
> +# Skip the arch test for kernel modules
> +INSANE_SKIP_kernel-module-iscsi-trgt = "arch"
> --
> 2.3.5
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>



-- 
Joe MacDonald
:wq

