Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f44.google.com (mail-qg0-f44.google.com
	[209.85.192.44])
	by mail.openembedded.org (Postfix) with ESMTP id 017017680A
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Apr 2016 22:48:22 +0000 (UTC)
Received: by mail-qg0-f44.google.com with SMTP id f52so76799240qga.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Apr 2016 15:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ieeFPlFu32gRpsnZDNAowrpysTUrF2rway82NiuV9K8=;
	b=fwNnhZmYtWbhE0svOEl/tfsJ6WTQo59631W1xrtyldsT+0CKeAumUZRJkRWgpn87pO
	k8n8CrNJ6H16xyDhYTu1Ah/LIMtFJANd/s0G75rId3qY6A3Isd4392U4BhxOKjo10L80
	IhguDpga7Nq8S0uI5TO4RLjp2LQIERVgSNahTnT2sIJThIk5UFEPsxiOtyAxHD6CWEWh
	o3qXWepQcthr4JyIXXUS1fKPPZEwan/geg6FX6BBvQDtxCQexhJrPm8W5Em0hJbqDveS
	svam7f0PG5cDi6I/Zzf9zTyDepkYtFkoKXJUZ/VbPm3TuRa6xPL+y7iuoQSdu4I1vS56
	+0yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ieeFPlFu32gRpsnZDNAowrpysTUrF2rway82NiuV9K8=;
	b=CYJQLrl2FYkz0NpsuXs9zpdXWNk6US51qZIpDmFhd15s6KFrhIoqtZF9dqSMcDl6wk
	rNlV+nzmJtNnHl5nvUSc6nc7euGqzlxzheYNUnXA20nXTUo5ecV5Klzy9ndHEHsvGqiy
	m0k+RetvppryDKgdW7ZgCVPPJ2bMpQXe9Krd7SjuJM3x0CzeP/0JJMgqmPFXIx7zykiW
	eR9HYiAJPRq18pGS4K0M023w2QvXOqeeaXj+6nhdHCuuiKHSmjjzqbgxAaZztkMdloVU
	a04Hg+bRdNQRFJPEHJZ7IGCI/SQa47K4cEEdeV/hfjD7+tWFsK+HZ4IOM6BxwlrF8TsG
	vRAQ==
X-Gm-Message-State: AD7BkJLwEh8d2nk2dSr+eZEnTUasA8nt/Q+TCG2F0pkTMJl5XNXbVEKa1tSczO524/lTqJrGnzwd9I8XgYdeCg==
X-Received: by 10.141.4.69 with SMTP id g66mr7874571qhd.31.1460069303228; Thu,
	07 Apr 2016 15:48:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.130.196 with HTTP; Thu, 7 Apr 2016 15:47:53 -0700 (PDT)
In-Reply-To: <1460061600-28075-1-git-send-email-denis@denix.org>
References: <1460061600-28075-1-git-send-email-denis@denix.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 7 Apr 2016 15:47:53 -0700
Message-ID: <CAMKF1spQd9C1GuyB=eLbZNbaqMzntA9sMycfschRBL4zWT6zXA@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: Re: [PATCH] ne10: use bb.debug for debug messages
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
X-List-Received-Date: Thu, 07 Apr 2016 22:48:23 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Apr 7, 2016 at 1:40 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> From: Denys Dmytriyenko <denys@ti.com>
>
> Moreover, the messages are misleading, saying "Building for arch blah",
> even when this recipe is not being built. It merely checks if the recipe
> is cmaptible with the currently used architecture.
>

LGTM, I have been seeing these notes too.

> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  meta-oe/recipes-support/ne10/ne10_1.2.1.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-support/ne10/ne10_1.2.1.bb b/meta-oe/recipes-support/ne10/ne10_1.2.1.bb
> index 4d753a0..de97982 100644
> --- a/meta-oe/recipes-support/ne10/ne10_1.2.1.bb
> +++ b/meta-oe/recipes-support/ne10/ne10_1.2.1.bb
> @@ -20,10 +20,10 @@ COMPATIBLE_MACHINE_armv7a = "(.*)"
>  python () {
>      if any(t.startswith('armv7') for t in d.getVar('TUNE_FEATURES', True).split()):
>          d.setVar('NE10_TARGET_ARCH', 'armv7')
> -        bb.note('Building Ne10 for armv7')
> +        bb.debug(2, 'Building Ne10 for armv7')
>      elif any(t.startswith('aarch64') for t in d.getVar('TUNE_FEATURES', True).split()):
>          d.setVar('NE10_TARGET_ARCH', 'aarch64')
> -        bb.note('Building Ne10 for aarch64')
> +        bb.debug(2, 'Building Ne10 for aarch64')
>      else:
>          raise bb.parse.SkipPackage("Incompatible with archs other than armv7 and aarch64")
>  }
> --
> 2.2.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

