Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f52.google.com (mail-lf0-f52.google.com
	[209.85.215.52])
	by mail.openembedded.org (Postfix) with ESMTP id 8853F6067D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 May 2018 08:51:19 +0000 (UTC)
Received: by mail-lf0-f52.google.com with SMTP id h9-v6so3035776lfc.13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 May 2018 01:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=GdYgR1aZJz7HzWHQF/kz7ULjXpEZiU+TufMyWqSjbi8=;
	b=EJOQEkv219oouiUcQVJ4QtsU808/IqvOJrTIYzl6wI+ZbPVlpSsvmPCBaBPx8lljZn
	d6BMNPOLvyAgUOHhs2dGQobYhFZ40hjzB/2JvOFpu4s94QsY98l7/gPiqg2vB9TRXV2O
	IoTTjFW8ijeDCfyzcJ+wufOuQjzlySglO+/XHA3wa4/Dd13LTb4EAfOw2se2egn7owEu
	5ISCL8GKeG8CYj/BY1Sw5lJZWr42FmlfDlE8Fv33RA/Fbh40BCAbt7xAyimfab53Hgzu
	ntKPUfDAl5RyeI6ugYnv/137fiZbDqcGf5nYwH4UCPeHyOr293NKqL/mIo48nQB/ml5j
	m2hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=GdYgR1aZJz7HzWHQF/kz7ULjXpEZiU+TufMyWqSjbi8=;
	b=qvAzEDtnlHladbYl/vJ6ISb4J27ji1DpPnSc8/T/g+kcOkia9gZIhnHOZSADj4cEUb
	iG2ovBmwObCMfyjC4jfx4tVsOVs+gXSyzXzDyfUSgU6SLx1W8Z++p1XD0CkE1Mz/i7w6
	JZ57R8h/SvLzbIuwqKKtEGBwPOguRyojkPTjQYBvqwRuflpK71P525CEZYnVF+2jycbg
	pmiaffcOrJ/dmHnWYY2xwI1ASv2CWl7/7XRBaei4fSTOQu/hixDrCLcDZP3DIv27dW5v
	aE7TkQw7lJuBWqGzZjQkNzJ6Osvt3BBoCmfmwct2QrE0r7gBVeNt7+TmflRUu2Z/vcUc
	/vug==
X-Gm-Message-State: ALKqPwfSZcYpGZPSIFeYsGLUnzTg6mYF1xxizeHSp6A/hm6V1ETmLd9j
	BYCjsVnnlk0VZWMfXFi2uDU/vlN8NmrlRxFXAEKyfA==
X-Google-Smtp-Source: ADUXVKLhHptUsXyfRiDBUwp/7iV+9papxnHg7pVxbkMQbXjS1LiEtTaXsSeY+6LtPK0B9RKdnpVRLDCxqMY+txTDcT8=
X-Received: by 2002:a2e:1dd9:: with SMTP id
	w86-v6mr1389638lje.110.1527670279481; 
	Wed, 30 May 2018 01:51:19 -0700 (PDT)
MIME-Version: 1.0
References: <20180530084937.19662-1-ricardo.ribalda@gmail.com>
In-Reply-To: <20180530084937.19662-1-ricardo.ribalda@gmail.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Wed, 30 May 2018 10:51:02 +0200
Message-ID: <CAPybu_0xcxOS4n_srFpPfejbFE6Zk5ts=9Rp+xVMrtqrkbzu+A@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Khem Raj <raj.khem@gmail.com>
Subject: Re: [meta-clang][PATCH] clang: Fix sigsegv of llvm-config on the target
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
X-List-Received-Date: Wed, 30 May 2018 08:51:20 -0000
Content-Type: text/plain; charset="UTF-8"

Sorry for the spam. The SOB is missing this this patch. Shall I resend?
On Wed, May 30, 2018 at 10:49 AM Ricardo Ribalda Delgado <
ricardo.ribalda@gmail.com> wrote:

> llvm-config is, by default, broken by the SSTATE_SCAN_CMD. This patch
> removes llvm-config from SSTATE_SCAN_FILES.
> ---
>   recipes-devtools/clang/clang_git.bb | 3 +++
>   1 file changed, 3 insertions(+)

> diff --git a/recipes-devtools/clang/clang_git.bb b/recipes-devtools/clang/
clang_git.bb
> index 5730b9b..3e2d2c7 100644
> --- a/recipes-devtools/clang/clang_git.bb
> +++ b/recipes-devtools/clang/clang_git.bb
> @@ -158,3 +158,6 @@ FILES_${PN}-dev += "\

>   INSANE_SKIP_${PN} += "already-stripped"
>   INSANE_SKIP_${PN}-dev += "dev-elf"
> +
> +#Avoid SSTATE_SCAN_COMMAND running sed over llvm-config.
> +SSTATE_SCAN_FILES_remove = "*-config"
> --
> 2.17.0



-- 
Ricardo Ribalda

