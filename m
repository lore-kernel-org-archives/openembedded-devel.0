Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id E17CF77E1B
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  2 Apr 2017 07:14:54 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id w43so25532578wrb.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 02 Apr 2017 00:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=S8J4XL16rf5Ne3wiYpl8+/7IfqQoo94023asmHNSqXE=;
	b=fRF0Iu0UOE9+8k7POCLEdU3i0mwN7Z4qqS2g2fGbcXJUR/eQwluHkqk+nJ2bRK9jQZ
	D9Oeu4BfkkeP2YWTqiFLDNB1MmGbyP+Avoim/o0xIhLMC642EaUmX0Vsfu4Ni2O556IT
	VGj/FT75EcU1AcFTp2t9MZdS5I7IZOX2TxAdVPeFOo6yTemgL6luNva8B0yFtIKBpUx4
	u1n8uXZfS5QtQBDop4JjALWBUNFky4dxyw8SYFPEDSdah6H94RLzFzVoU5TAypzQIBMm
	PIqHsu+UTNJnAVw63bZS2yrSsZvB/HjL8RhWx1n1OA7ypTiOCwiJOKTbXQOB7alw5IqM
	DMVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=S8J4XL16rf5Ne3wiYpl8+/7IfqQoo94023asmHNSqXE=;
	b=CudK3qiERh9X4QI5cj5q6NmIdFdfEgCfduLLpr570Ogs+ognZLQfFPPLfitaMD9bZK
	ITRzwDf7nS3U9Ev/d8CrjQrbPgc3RGvIaHAOeyil65gPr5i9zbBM3aWZQoO5nPzffVQd
	/jT2hXOoav/w3/1qjNml+I1r7B6LS+ncdXvQs4S3M1WwP4TigDSCBTbBvRiUwMI+r4tp
	rot0FB4dCa2CQvVySG28TaIpN0pfhv5lwb4qilT1k6HFT3WeSJLYDUQPriGSWuSbIYcR
	FLbbS/qePjDa26PX/KfGeS7GJbQ7m7zZSKCt8P5XB/AhUzim1CPNa+NvfaSx/JcqAqYU
	eHGA==
X-Gm-Message-State: AFeK/H1Y2vpLNJxseneYzqR5CdlFTPg+SIp4af7Bx8+wJJuQuzAz9zTEcmXabX20kX+Glc+V3LtUvqEfZ+rv9Q==
X-Received: by 10.223.136.125 with SMTP id e58mr10245689wre.14.1491117295667; 
	Sun, 02 Apr 2017 00:14:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.145.24 with HTTP; Sun, 2 Apr 2017 00:14:55 -0700 (PDT)
In-Reply-To: <20170331164247.5052-18-raj.khem@gmail.com>
References: <20170331164247.5052-1-raj.khem@gmail.com>
	<20170331164247.5052-18-raj.khem@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 2 Apr 2017 09:14:55 +0200
Message-ID: <CA+chaQcx810httXF=Ypgc9Hei5hS2meva6MRP=TkPpjSGk6OSw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 18/43] ttf-inconsolata: Move copying of .otf to .ttf into do_compile
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
X-List-Received-Date: Sun, 02 Apr 2017 07:14:56 -0000
Content-Type: text/plain; charset=UTF-8

mv: cannot stat
'TOPDIR/tmp-glibc/work/all-oe-linux/ttf-inconsolata/20100526-r0/Inconsolata.otf':
No such file or directory
WARNING: exit code 1 from a shell command.

http://errors.yoctoproject.org/Errors/Details/138841/



On Fri, Mar 31, 2017 at 6:42 PM, Khem Raj <raj.khem@gmail.com> wrote:

> Fixes errors like
>
> | mv: cannot stat '/mnt/b/build/tmp-musl/work/
> all-oe-linux/ttf-inconsolata/20100526-r0/Inconsolata.otf': No such file
> or directory
> | WARNING: /mnt/b/build/tmp-musl/work/all-oe-linux/ttf-inconsolata/
> 20100526-r0/temp/run.do_configure.2485:1 exit 1 from 'mv
> /mnt/b/build/tmp-musl/work/all-oe-linux/ttf-inconsolata/20100526-r0/Inconsolata.otf
> /mnt/b/build/tmp-musl/work/all-oe-linux/ttf-inconsolata/
> 20100526-r0/ttf-inconsolata-20100526/Inconsolata.ttf'
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-oe/recipes-graphics/ttf-fonts/ttf-inconsolata_20100526.bb | 7
> ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-inconsolata_
> 20100526.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-inconsolata_
> 20100526.bb
> index 20041bb7b..0d6df242a 100644
> --- a/meta-oe/recipes-graphics/ttf-fonts/ttf-inconsolata_20100526.bb
> +++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-inconsolata_20100526.bb
> @@ -13,13 +13,14 @@ S = "${WORKDIR}/ttf-inconsolata-${PV}"
>  FILES_${PN} = "${datadir}/fonts/truetype/Inconsolata.ttf \
>      ${datadir}/doc/ttf-inconsolata/*"
>
> -do_configure() {
> +deltask do_configure
> +
> +do_compile_prepend() {
>      mv ${WORKDIR}/Inconsolata.otf ${S}/Inconsolata.ttf
>  }
>
>  do_install_append() {
> -    install -d ${D}${datadir}/doc/ttf-inconsolata/
> -    install -m 0644 ${WORKDIR}/OFL.txt ${D}${datadir}/doc/ttf-
> inconsolata/
> +    install -D -m 0644 ${WORKDIR}/OFL.txt ${D}${datadir}/doc/ttf-
> inconsolata/OFL.txt
>  }
>
>  SRC_URI[md5sum] = "0fbe014c1f0fb5e3c71140ff0dc63edf"
> --
> 2.12.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

