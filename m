Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 4A2DC78307
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Aug 2017 15:45:44 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id c28so2583211pfe.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Aug 2017 08:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BC/Yv2IlOAzL1jY/JMSn7Wq87jhWemw5S6d9F49sMDA=;
	b=E8mbmw/5IFhm1FBVssXX9OEMbAsabUt0qQWjA2E7mWaLSjCEgIwEjeH43ivBB8vm4w
	bEgMv6prEDK4TVMmEJDagg3iCdQkk/WIRCF3olbewZLiFEu9rK5FtW40pkPH3sPXIDHx
	gWE9mzMyKQzs+5AoHYnGgX08Nl8+n7mwrLXNzPlbq7+kWndjSIcTZM0hnnjfmRB2IXyu
	PD04ay5UQd+qpVsnCIdIrmDpXvnvoXJ0ABXJM/YYiD4FngDveB6SjssovA+gtO1LPCwP
	sn4Mab7Nhd84LHoB+FPZ/2yFEu/1g+o3vqW3LL5gQOUgDoOw7XQIM+to6R2sfJrcmAWT
	Z8sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BC/Yv2IlOAzL1jY/JMSn7Wq87jhWemw5S6d9F49sMDA=;
	b=o4XgCSBAxpixhDYHik1p20c/ePWW6rSfzVfr0z2cpQs2L4gcTPmohTTyAFTWWE3xY1
	rDXC0ATWp+25EqcNVmRVoITNpHPr8R6b1czL8zHs0XCgI0dVGcHbHA4DiVZN5/zlcQGv
	XpZuPSY+5FW0sALSbAZjMZgRUa1u4OT1e77Smlt4HVhzcKcqBbM6o/VG3tuC4up7ncH1
	NbqBi+7iWcDnawWGq+DF5N0yd/b/y2kuuGO8bqP19w0M8FthATswEMtspsh7k1zNJxwj
	Z31uZpyacxE6KSwRG2rZ30KxMHCfGSnQvuhtVUaNSJvLlm+MIhWAUXdewd2udYhqgghH
	0kWQ==
X-Gm-Message-State: AHYfb5i6b2uOp/v9vUg6VUs5AyvoNrol9Uk83+0DMiZ7NE7K0AjldgbM
	/KXvtcDED5e74WqbySrGwQOGSzWZkw==
X-Received: by 10.99.125.26 with SMTP id y26mr710621pgc.341.1504021545567;
	Tue, 29 Aug 2017 08:45:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.167.2 with HTTP; Tue, 29 Aug 2017 08:45:14 -0700 (PDT)
In-Reply-To: <20170828163937.29460-3-adrian.ratiu@ni.com>
References: <20170828163937.29460-1-adrian.ratiu@ni.com>
	<20170828163937.29460-3-adrian.ratiu@ni.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 29 Aug 2017 08:45:14 -0700
Message-ID: <CAMKF1soDqjV2xP1-+XyC23okmZaGPgXV+Z08tH1k9gi2hXd7+A@mail.gmail.com>
To: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 3/3] smbnetfs: unblacklist recipe
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
X-List-Received-Date: Tue, 29 Aug 2017 15:45:45 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 28, 2017 at 9:39 AM, Ioan-Adrian Ratiu <adrian.ratiu@ni.com> wrote:
> All its dependencies have been fixed and it builds correctly.
>

I see
ERROR: smbnetfs-git-r0 do_fetch: Fetcher failure for URL:
'file://configure.patch'. Unable to fetch URL from any source.

> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> ---
>  meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb b/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb
> index 6995ad3f5..f1420fbed 100644
> --- a/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb
> +++ b/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb
> @@ -24,5 +24,3 @@ PACKAGECONFIG ??= ""
>  PACKAGECONFIG[gnome-keyring] = "--with-gnome-keyring=yes,--with-gnome-keyring=no,libgnome-keyring"
>
>  S = "${WORKDIR}/git"
> -
> -PNBLACKLIST[smbnetfs] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/132827/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
> --
> 2.14.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

