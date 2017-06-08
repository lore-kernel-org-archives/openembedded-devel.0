Return-Path: <martin.jansa@gmail.com>
Received: from mail-yw0-f194.google.com (mail-yw0-f194.google.com
	[209.85.161.194])
	by mail.openembedded.org (Postfix) with ESMTP id A999E78208
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Jun 2017 12:58:32 +0000 (UTC)
Received: by mail-yw0-f194.google.com with SMTP id p144so2034932ywp.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Jun 2017 05:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=4QPZeyml98Uyb/DcFp1whoSKJ05mVWg7ftV8CJX9GYc=;
	b=lWJBmx1FSdmAMnnzb3zsTAdTBocdGGugljogdTbiVTv/zU5pTkkFmColPhMrlZSUWw
	NWRMAQi7RH1KgYhglZtHGxgLiYn5o697pg01CGZ882sqgJZreDbSOtHYAcyXUNMHdP2G
	5cbpld55h1dD4XwIplr5wkgIQcO30kJ6UiKDANWV/mkJS9jFS4bhEB/yRQ2gK7IccKgT
	GZM6IsAmn7djhjY70853DBxcttcd0SHfmzdzk8TEfkW5q6EyX7Kwz/0eZqS6vWQ+TfHK
	OAE2n7kbJb01owLJgcgR2DWndtp5W9cL4Fq3T3cN5X74vWRmPdA/Zi1vJH/7Pz9mNCgf
	CFOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=4QPZeyml98Uyb/DcFp1whoSKJ05mVWg7ftV8CJX9GYc=;
	b=dh+2hGrpyxmDak0IJr0xL5WTFmTOzCvz5IDfbBXldlVt8vKNensW6+LY4lIeCDdS5j
	728Z5OP7ZWlE4GNsshlD9PY2X74Thfig/64B6kLksmw4g0yeCRuMWmuLMpcIqamW23rF
	zAV4AWJpOXKYaFqLfKELOZuBKjXLDUObPwCvwDmloQK8xBytbFvyz88mqic67PNdav8a
	puTIajr0IBnn0+EFKTiXbjrMfNgs4OD3Q8zdcv/uXgGXPCIKClO5MzgSESqllO713dtT
	cGoddjF95FN8K7/EyW3pg28maQbx1HTcKfFDgP4zkVf+UPcPE3Z67EKuoXJG6MK9S2CF
	oF6A==
X-Gm-Message-State: AODbwcCWu/89YcqvPLgycyPRPPO27sbSU56qJ8HVrxabs+wVY9OUeEgm
	xVLdmIhescDSiUb6WS1j3N+AsPbAe+KZ
X-Received: by 10.129.37.11 with SMTP id l11mr8277404ywl.2.1496926713238; Thu,
	08 Jun 2017 05:58:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.181.204 with HTTP; Thu, 8 Jun 2017 05:58:32 -0700 (PDT)
In-Reply-To: <20170606164637.28029-1-krisztian.litkey@linux.intel.com>
References: <20170606164637.28029-1-krisztian.litkey@linux.intel.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 8 Jun 2017 14:58:32 +0200
Message-ID: <CA+chaQcyqndW4nvu+1BkvQADoYYe+=8JpGaCvG_7_auU6moHxw@mail.gmail.com>
To: Krisztian Litkey <krisztian.litkey@linux.intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Krisztian Litkey <krisztian.litkey@intel.com>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] fuse: let overriding base_sbindir have the proper effect.
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
X-List-Received-Date: Thu, 08 Jun 2017 12:58:32 -0000
Content-Type: text/plain; charset="UTF-8"

OE @ ~/meta-openembedded $ pwam 140508
2017-06-08 12:56:27 URL:
https://patchwork.openembedded.org/patch/140508/mbox/ [1562] ->
"pw-am-140508.patch" [1]
Applying: fuse: let overriding base_sbindir have the proper effect.
error: meta-filesystems/recipes-support/fuse/fuse_2.9.4.bb: does not exist
in index
Patch failed at 0001 fuse: let overriding base_sbindir have the proper
effect.
The copy of the patch that failed is found in: .git/rebase-apply/patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


is it still needed with 2.9.7 version? there is pending upgrade for that

commit b491a1528be4030c7bcab48536690ed326b40196
Author:     Kyle Russell <bkylerussell@gmail.com>
AuthorDate: Thu Jun 1 14:43:15 2017 -0400
Commit:     Martin Jansa <Martin.Jansa@gmail.com>
CommitDate: Mon Jun 5 11:14:58 2017 +0200

   fuse: update 2.9.4 to 2.9.7

   Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>


On Tue, Jun 6, 2017 at 6:46 PM, Krisztian Litkey <
krisztian.litkey@linux.intel.com> wrote:

> From: Krisztian Litkey <krisztian.litkey@intel.com>
>
> Set MOUNT_FUSE_PATH explicitly to ${base_sbindir} before configure.
> Making this explicit will let people override base_sbindir with the
> desired effect (for instance when building a distro with merged /
> and /usr).
>
> Signed-off-by: Krisztian Litkey <krisztian.litkey@intel.com>
> ---
>  meta-filesystems/recipes-support/fuse/fuse_2.9.4.bb | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/meta-filesystems/recipes-support/fuse/fuse_2.9.4.bb
> b/meta-filesystems/recipes-support/fuse/fuse_2.9.4.bb
> index 153fcb4..16fc807 100644
> --- a/meta-filesystems/recipes-support/fuse/fuse_2.9.4.bb
> +++ b/meta-filesystems/recipes-support/fuse/fuse_2.9.4.bb
> @@ -44,6 +44,11 @@ FILES_fuse-utils-dbg = "${bindir}/.debug
> ${base_sbindir}/.debug"
>  DEBIAN_NOAUTONAME_fuse-utils = "1"
>  DEBIAN_NOAUTONAME_fuse-utils-dbg = "1"
>
> +do_configure_prepend() {
> +    # Make this explicit so overriding base_sbindir propagates properly.
> +    export MOUNT_FUSE_PATH="${base_sbindir}"
> +}
> +
>  do_install_append() {
>      rm -rf ${D}${base_prefix}/dev
>
> --
> 2.9.3
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

