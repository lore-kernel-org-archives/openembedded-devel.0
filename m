Return-Path: <andrea.adami@gmail.com>
Received: from mail-wr0-f169.google.com (mail-wr0-f169.google.com
	[209.85.128.169])
	by mail.openembedded.org (Postfix) with ESMTP id 228E0746D8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Apr 2018 08:58:07 +0000 (UTC)
Received: by mail-wr0-f169.google.com with SMTP id o15-v6so20886871wro.11
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Apr 2018 01:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=1SfAQOtr1WaaRiIpb79IhDH/TkzZlYeZKKGhQ9aru6k=;
	b=WnPwAaN2hpMjx+8zYfir5KHxujMAcvU8BLRGeBWWfCIwuHNIQmmUeJvb/L+OOfqZ9L
	zkTp9Tfcnp9lHEVt4KYIa5ICAlp5MTJrYVA9PrObyxed/I6KhwSEJL4P8dbv+JZJaeI6
	fepXihQzb+qdMsrfSghHz1hgyOi9YigyNg6F4YchVyUA8UcpjHW+K+LNWIl/JXuypuLu
	FNgdK2+bDYYqm/D0BVF3GUA3tNHbmrTufEMwniQ84HJhr43W7/PcO70U2EOnALPB8COG
	hSC0d8bIGJ43XJsm2Hf4NV6O3wjVuSVYKWyHh3ZVcdSkwybrF6Ta9KHoCdnsPD7RPCfu
	XuIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=1SfAQOtr1WaaRiIpb79IhDH/TkzZlYeZKKGhQ9aru6k=;
	b=VpHLNLuG0NaxKNyQbKnPSGuMsX6R/oHnxc5+Zy2kq/Qyc6Tlmc/G6mTQ7BxVJm8UH5
	iVLUGVhYxT9BH5o/Bp2wled2K3X+vba+5Pw832LxafgOFhQMqHgHdAUVwc4Hws4K5ZBv
	LvXJ1zv30RJ7QZN+SAlcmls0sC5QtDO4JX7af3bSnY+/Q1CeG1CwCI5KrBXWFdETQeak
	vsIevp+g/F3F/t3/n0YUQZKFbnx78kmnSL+AEN0/RVzTIA8MXWR9/tSmOx23DaIupjik
	StwA3aI5gdse2YUhUE9+buqsN35QJ2KQRvK/IPYoDlCWX6XxechasZ7/S3QKcBu3Ox4i
	YhIw==
X-Gm-Message-State: ALQs6tDNerc3Tx6xd6VD3HXFkKkoxROQKoEggkwMQoIo4THlmsVB4NzR
	abGA2I7PLDvOPsM3ba0X2VwdkUr+Jj/22U+IHLU=
X-Google-Smtp-Source: AIpwx4/m9obn+srU2wvx5Q+W3xUprv1lavx0M+eDdn1VcKCLnQPQhNpJXFCRnEdPYiUS89vlu0wkYL/uh8pVeMsNq/g=
X-Received: by 10.80.161.165 with SMTP id 34mr6567895edk.273.1524214688333;
	Fri, 20 Apr 2018 01:58:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.157.197 with HTTP; Fri, 20 Apr 2018 01:58:07 -0700 (PDT)
In-Reply-To: <07949a94-62c1-6ad2-3cc7-aca3fab033e9@gmail.com>
References: <07949a94-62c1-6ad2-3cc7-aca3fab033e9@gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
Date: Fri, 20 Apr 2018 10:58:07 +0200
Message-ID: <CAAQYJAvxUyds8-qNhajS8imrRBmnsf4bq4FtYL-RJApBr=9Rcg@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>, Khem Raj <raj.khem@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: State of the world, Failed tasks 2018-04-11
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
X-List-Received-Date: Fri, 20 Apr 2018 08:58:08 -0000
Content-Type: text/plain; charset="UTF-8"

(cut)
> === qemuarm64 (8) ===
>     * meta-openembedded/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb:do_compile
>     * meta-openembedded/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb:do_configure

Hi,
I am working on the coming 2.0.17 version and the recipe now builds
for all supported archs.

https://github.com/LinuxPDA/meta-openembedded/tree/master/meta-initramfs/recipes-kernel/kexec

There are still nasty compile warnings to fix, some could lead to
runtime errors...I uploaded the logs.
Please review, thanks.

Andrea

