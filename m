Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f170.google.com (mail-wr0-f170.google.com
	[209.85.128.170])
	by mail.openembedded.org (Postfix) with ESMTP id 7B14F77DCC
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Oct 2017 19:10:16 +0000 (UTC)
Received: by mail-wr0-f170.google.com with SMTP id l8so995644wre.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Oct 2017 12:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=vHuG1eqoaCJ3B57fRIqSIRuIPsRvYY8YzPD3erKbBnM=;
	b=nQyP1bwaRXc5in/geVWZ4otxk+o2+1IjP15MbcUX729IroH02HT2PmyAQMUaeKK5DX
	BPbidaNtWNv+4iqWdH1c2oobh3jdVQ5mGYaXK06dsjZXc3rlUuv8Ov+qYmK2e1IIzMUz
	JxoBwXujlwwZf0ui92Z92RHoalL6tOnVCNkMhTh4rsgAt9CHU960nxbGUYsrNZgCTG67
	yUkNotDRGJbYk9+XjiCNmSY5+GvCH31qXCOtuhE4c9iMomkK5RjmttSLqxhkTHvInvtJ
	mw+tEH1Uwa0FH+isvXBHu5Ii2ALVU2uSWGM47vjrBC3WWDSPB89kXIj+wkyRq7dCM2GV
	GU9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=vHuG1eqoaCJ3B57fRIqSIRuIPsRvYY8YzPD3erKbBnM=;
	b=R5LhrzaKcIZtrfbCEHqzXN6bYJtduqG6qUuY1NAGvyXQC75aTamuE6eJqxQhyiRl29
	NRrtcxNKkH8iYDVr/QS5IoQURyPNMwJJLBTYsN1ra8olCWFSzw8C8OcQK9AeXvjU+8nI
	cjlGnNvW73PPUanmv1JPiiJ4puZzLlU7UHfpOvRT/7I+nOY2rYbDMOfMOxvbvw38SCYc
	/jzZD/YRpY/vqAvaABN5iadLuGMVM8FOr9zaR9lBeCkYVcqa07FCisep+Wx8X3Sr+6v3
	RsNvRKRPPTrcCe+k7jPzGAKPyybLxCr0oc8koIh/XNuqkZeQFl8uAMmufAAAR7JP/I33
	RAVg==
X-Gm-Message-State: AMCzsaXXGi//O7DVKR7UOAfQJg1inxv5n/IRIyze9BE38TLDbMHBeMNs
	7Nkekw2tr6lHnMF45hGW0u0RUqRi7K+cO8M7I48=
X-Google-Smtp-Source: ABhQp+TGYHtrR98qkDkkrLyO4m117A0Anj+rNiKISKGv1QVXOnFycgPV7Ff1sOtyvK/nA8NeRRFx8KzTJbUrX7C/KnQ=
X-Received: by 10.223.158.129 with SMTP id a1mr3156090wrf.179.1508958617045;
	Wed, 25 Oct 2017 12:10:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.183.212 with HTTP; Wed, 25 Oct 2017 12:10:16 -0700 (PDT)
In-Reply-To: <1508957346-6324-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
References: <1508957346-6324-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 25 Oct 2017 21:10:16 +0200
Message-ID: <CA+chaQcB-cw8tRBPoVoGq0Dn54Czh7RMuHpSFRcHq=VgMWt08g@mail.gmail.com>
To: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2] whetstone_1.2.bb: Add whetstone benchmark
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
X-List-Received-Date: Wed, 25 Oct 2017 19:10:16 -0000
Content-Type: text/plain; charset="UTF-8"

Why don't you reference the license from the whetstone.c header?

Using COMMON_LICENSE_DIR won't really work for LIC_FILES_CHKSUM to catch
different license if this recipe is ever upgraded to different version.

The same does apply to your 2nd review.

On Wed, Oct 25, 2017 at 8:49 PM, Manjukumar Matha <
manjukumar.harthikote-matha@xilinx.com> wrote:

> The Whetstone benchmark is a synthetic benchmark for evaluating the
> performance of computers.
>
> https://en.wikipedia.org/wiki/Whetstone_(benchmark)
>
> Signed-off-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
> ---
>  meta-oe/recipes-benchmark/whetstone/whetstone_1.2.bb | 18
> ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 meta-oe/recipes-benchmark/whetstone/whetstone_1.2.bb
>
> diff --git a/meta-oe/recipes-benchmark/whetstone/whetstone_1.2.bb
> b/meta-oe/recipes-benchmark/whetstone/whetstone_1.2.bb
> new file mode 100644
> index 0000000..e9318eb
> --- /dev/null
> +++ b/meta-oe/recipes-benchmark/whetstone/whetstone_1.2.bb
> @@ -0,0 +1,18 @@
> +DESCRIPTION = "CPU benchmark to measure floating point performance"
> +LICENSE = "PD"
> +LIC_FILES_CHKSUM ="file://${COMMON_LICENSE_DIR}/PD;md5=
> b3597d12946881e13cb3b548d1173851"
> +
> +SRC_URI = "http://www.netlib.org/benchmark/whetstone.c"
> +SRC_URI[md5sum] = "d8eb2cd7104bb5a12d614ac6d3f1f9fb"
> +SRC_URI[sha256sum] = "333e4ceca042c146f63eec605573d1
> 6ae8b07166cbc44a17bec1ea97c6f1efbf"
> +
> +S = "${WORKDIR}"
> +
> +do_compile () {
> +       ${CC} ${CFLAGS} ${LDFLAGS} -Ofast -o whetstone whetstone.c -lm
> +}
> +
> +do_install () {
> +       install -Dm 0755 whetstone ${D}${bindir}/whetstone
> +}
> +
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

