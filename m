Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id 68A4C60767
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Dec 2016 21:11:06 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id l126so14044854vkh.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Dec 2016 13:11:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=YdX7vrxXk20Dr0W4BMxNnuGaMu0eceBgi1tjQvopiXg=;
	b=rurWJEUGXmy0Aycst4k9OPmdzjtD4ZBAzOh3CCkdbC7AY7SenookWJ68hTlTXgiEGb
	+wuUimzoffDoEfFcb3h97Cso17ZKm3XpIEIQWtzDVN7QFH4PLXEDii7e04Q19K3S7o0o
	FhJr+E53z4WmHgyLVaEIjJYt4zTfVtgjNokhhBYRMcg7l+32vhQ45c6jQG7wBZDVjojB
	Z7g7lWH6KvE7V73ztzbid6kZnI7hHeCNxBj4f5cvvfeT8Qb2d60KuOQe//k3CnYoP9MR
	fGUISBqsTgNYIpWFKR6FmWvjqBcH8+nX32a2bByVz2O6flIZjtv0NNN3xgiaMki8BNfy
	h6KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=YdX7vrxXk20Dr0W4BMxNnuGaMu0eceBgi1tjQvopiXg=;
	b=Ke69qKjlV9Kma+sI/h2zrWfKYPX0vX98bI3Cxvzv9Gb66svHk+Nbc2vTYzzkZTXnBX
	RzF9w+PpPqa1cILTP4sdUckIO/Pa3ra4iy2V/J+XxWGQtkXDt8xeUgNAFrvdveCPUx97
	DA8dMCiVVfdiBouHHu+I1GIP5TYFTy7f3jpvhtWH+ExLRRsnUqmw/qcTNQxGkQRjR111
	WRkj4zPuvfT82o9r/qIwZmrQfo6WDohQlYooAi7/CUEB+4kEDVaqtZXQtRdeGy87Jgz/
	uLmrjraxG79Ohtsxgvf3cbH2clYR/cG1OHSBE5ZCoq+n+8l399iv1ZC9EkltGeQzjiyW
	ObiQ==
X-Gm-Message-State: AIkVDXL/XjLanw0S+OPkm0q/cdgJjRfaLm98/aCVq5Xz65ehGu4BcRW/2ufMbdggDjl+vT3v1qJO91N1zhlU3A==
X-Received: by 10.31.8.8 with SMTP id 8mr6636899vki.173.1482181867999; Mon, 19
	Dec 2016 13:11:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.87 with HTTP; Mon, 19 Dec 2016 13:10:37 -0800 (PST)
In-Reply-To: <CA+chaQeVHj6iwyku+wz5fiSg-R55r0msjwGsLSiYUR=2U35mcA@mail.gmail.com>
References: <20161123092209.23699-1-raj.khem@gmail.com>
	<20161123092209.23699-10-raj.khem@gmail.com>
	<CA+chaQeVHj6iwyku+wz5fiSg-R55r0msjwGsLSiYUR=2U35mcA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 19 Dec 2016 13:10:37 -0800
Message-ID: <CAMKF1sptY4L3x7zGDVC_bOkkP6ZZ6EYHB-8Hpj+HvQ4vb-YSSQ@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-oe][PATCH 10/49] libvdpau: Add recipe
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
X-List-Received-Date: Mon, 19 Dec 2016 21:11:07 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Dec 17, 2016 at 3:53 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> directfb seems to autodetect this as well:
>
> directfb-1.7.7: directfb rdepends on libvdpau, but it isn't a build
> dependency, missing libvdpau in DEPENDS or PACKAGECONFIG? [build-deps]
> directfb-1.7.7: directfb rdepends on libx11, but it isn't a build
> dependency, missing libx11 in DEPENDS or PACKAGECONFIG? [build-deps]
> directfb-1.7.7: directfb rdepends on libxau, but it isn't a build
> dependency, missing libxau in DEPENDS or PACKAGECONFIG? [build-deps]
> directfb-1.7.7: directfb rdepends on libxcb, but it isn't a build
> dependency, missing libxcb in DEPENDS or PACKAGECONFIG? [build-deps]
> directfb-1.7.7: directfb rdepends on libxdmcp, but it isn't a build
> dependency, missing libxdmcp in DEPENDS or PACKAGECONFIG? [build-deps]
> directfb-1.7.7: directfb rdepends on libxext, but it isn't a build
> dependency, missing libxext in DEPENDS or PACKAGECONFIG? [build-deps]
>

sent a patch for this

