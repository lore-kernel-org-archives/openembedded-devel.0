Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f66.google.com (mail-vk0-f66.google.com
	[209.85.213.66])
	by mail.openembedded.org (Postfix) with ESMTP id 2046377DCD
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Jul 2018 21:26:19 +0000 (UTC)
Received: by mail-vk0-f66.google.com with SMTP id h22-v6so7559294vke.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Jul 2018 14:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=G6KtYs+NNByweGgE4uPpi0eOThrx5Y3XgViOMKVdY/4=;
	b=dk1loEnerhLS8+yxoOiSEgG6hZzqh7RSWM5nv6YFvzf/K/P2KXBvL5JHem+SxB/JYo
	C0NmGMeKpQUbg06prn5bt1zfVzHnQ2OYAAZEbU5lVP1ubVxJZmkUM/kcASPCgenx/M2p
	liEdXVqxBY/2s3eLMsEiFwqwqsBRPHRZkr83mvVflmbHFqFje7ZlxFvd4AYOq0XvkPip
	qf5iUvVigsIqyqmQ+lCN3ytrIukrjsHdgX6iva0K82ZgQIr6c5ScBd44KckQcLdqnb4i
	TtWAUrxCxCyAnblZyZX2HcX18t+cXbAtLRdCQsi2MH5dX/RvCzWbaPhqdb6wviFVkYAS
	5JTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=G6KtYs+NNByweGgE4uPpi0eOThrx5Y3XgViOMKVdY/4=;
	b=VeSSWKhJrFJStQWL5h9+keHgySwJNVJ8n7ekHClIhS29icp2qCojpdNNV6MDI5lViI
	JrzNNKFT4AUrTDHADaJ1DuiqKM8Y1gKDk53DhI3fPM8Q+t+I3YhqymV/XZnMBHV+sZ7J
	g5F5b4YlVaSXNeilJuJ6D0sI9abP86Sl2AuHYaVGB8S3pxSIPwJsRTyTt94ek90iB4rf
	DcO2BCUCQJKCXGfEdMuYj1kQGokEkQtmilIOFGvvQvOTkwNYunwEItdkMTPnN76ok8+2
	ADZFeUcDVFTXtX4OigPa3b2KIiabdgDTuoLrkU9lujOemA/6heGJ0o3HMitpD8DfxRlY
	sCBA==
X-Gm-Message-State: APt69E3XUthLhe6ngqgo2vn3SawXkrIewt5su0adKGgaO1LG+lE9SHiX
	o9hfyQc28flq9p3KbN2i5QDV5BqVa/NcZxiQopY=
X-Google-Smtp-Source: AAOMgpfYEZDcjI8IxsA/lCoDldhF+91JLGmlbbCzneO6DZ6Jb8jdh8kgVvP3KhYdd9OywCCQIAC0deyYUSXr7CCPgvI=
X-Received: by 2002:a1f:2cce:: with SMTP id
	s197-v6mr6584736vks.106.1530912380855; 
	Fri, 06 Jul 2018 14:26:20 -0700 (PDT)
MIME-Version: 1.0
References: <9a8e4137ac914b168091b71d755d54281530789529-12623-1-git-send-email-jonathan.haigh@arm.com>
	<DB5PR08MB0888D243F1C828A518CBA90C93470@DB5PR08MB0888.eurprd08.prod.outlook.com>
In-Reply-To: <DB5PR08MB0888D243F1C828A518CBA90C93470@DB5PR08MB0888.eurprd08.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 6 Jul 2018 14:25:18 -0700
Message-ID: <CAMKF1soy4zSM3+c=iun_u6OsY4YsP2Sp0NWfB-zatsTdjFUxZg@mail.gmail.com>
To: Jonathan Haigh <Jonathan.Haigh@arm.com>
Cc: Jeremy.Johnson@arm.com,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] kernel-devicetree.bbclass: DTB make targets may contain path components
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
X-List-Received-Date: Fri, 06 Jul 2018 21:26:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 6, 2018 at 12:02 PM Jonathan Haigh <Jonathan.Haigh@arm.com> wro=
te:
>
> normalize_dtb() turns DTS and DTB paths into values that can be used as
> make targets. These make targets sometimes contain some directory compone=
nts
> so 'basename' is not suitable for turning the paths into make targets -
> we should only strip off leading directory components of the path up to
> and including the 'dts' directory (if it exists). For example:
> * 'overlays/at86rf233.dtbo' should not be changed.
> * 'some/directory/path/dts/overlays/at86rf233.dtbo' should be changed to
>   'overlays/at86rf233.dtbo' rather than just 'at86rf233.dtbo'
>
> Signed-off-by: Jonathan Haigh <jonathan.haigh@arm.com>
> ---
>  meta/classes/kernel-devicetree.bbclass | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/kernel-devicetree.bbclass b/meta/classes/kernel=
-devicetree.bbclass
> index 9866d84..0ffa8e9 100644
> --- a/meta/classes/kernel-devicetree.bbclass
> +++ b/meta/classes/kernel-devicetree.bbclass
> @@ -12,9 +12,10 @@ KERNEL_DEVICETREE_BUNDLE ?=3D "0"
>  normalize_dtb () {
>          DTB=3D"$1"
>          if echo ${DTB} | grep -q '/dts/'; then
> -               bbwarn "${DTB} contains the full path to the the dts file=
, but only the dtb name should be used."
> +               bbwarn "${DTB} contains the full path to the the dts file=
, but the path should be relative to the dts directory."
> +               DTB=3D`echo "${DTB}" | sed 's,^.*/dts/,,'`
>          fi
> -       DTB=3D`basename ${DTB} | sed 's,\.dts$,.dtb,g'`
> +       DTB=3D`echo "${DTB}" | sed 's,\.dts$,.dtb,g'`

This patch is fine however, you should rebase it on top of master as of tod=
ay.
secondly, this should be sent to oe-core mailing list since its
changing that layer

>          echo "${DTB}"
>  }
>
> --
> 2.7.4
>
>
> IMPORTANT NOTICE: The contents of this email and any attachments are conf=
idential and may also be privileged. If you are not the intended recipient,=
 please notify the sender immediately and do not disclose the contents to a=
ny other person, use it for any purpose, or store or copy the information i=
n any medium. Thank you.
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

