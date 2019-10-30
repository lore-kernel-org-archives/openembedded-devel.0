Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 62E287F95B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Oct 2019 21:52:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 473Md16bP7z4D;
	Wed, 30 Oct 2019 22:52:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1572472358;
	bh=znD4So4VDVGKxi7ROGeOEXs0OmhFrufmIfJ+W3m4HZg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NUGcDOf1PbPGtgYyciJHoj0j8ZFzbAqnt/qKVViyHseCh32jKMkR99w67uwatzxku
	NwiTBDqcwlGEE/p3rwTj4h9TY6hJ+vSIcIPyiGIey8s9ltWhX24xQZlxfYSvC6/eer
	8K8SoKDIuefSB8w192XKEVQYpLECkBw7FXwML/4BCaQwEEXLXb0SA/qUUrVDaFc2B9
	PZieB9LWf7JyNcRmCoAy9K6Yjmj5yLiSWyuUabUpj448IJ8+I7lqDGBHD7DzdklOxA
	Mie9+d5ctidQLLHtxcmX0PCyugk1bE6Yygkk550uD1LqEVKhc0jjFqoCbnZzGZUUQi
	99RoalJha0DXZ1t/cPsjgxTR13LBZCqXgpbQCDAMX6LhqoPGOMR+0uHue2bKS8MT/R
	ZuSVdv9MVHV/BB9h2gWyHKU3D5Zm5BX8VGOQswI6CzQ1fN4pNtsAA7q+v10qFw1HdI
	mAlTd6IZujpuS3u1Si88WsnTm9kataYdXUOC2PSG5tpXi7T8zojXw95iGyYhDWjKNy
	wcrv9C5ExQxs7blL++D+3aENloz+mB8oTLy502JSVlrrK8+kte2r5dUOFkxQ2FUxSl
	ylvaR/IgrGjnzwpSK5kCOMTJFX85arusxFoC+C2Wr/vkzGXSVcBKzomjf6mAbyq79O
	FCS6t5BShuHs9sKInhEv5J/A=
Date: Wed, 30 Oct 2019 23:52:35 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Message-ID: <20191030215235.GA7373@localhost>
References: <1572468965-36724-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1572468965-36724-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] libowfat: upgrade 0.31 -> 0.32
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
X-List-Received-Date: Wed, 30 Oct 2019 21:52:38 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

This breaks the build of ncp:
| ncp.c:8:10: fatal error: dns.h: No such file or directory
|     8 | #include "dns.h"
|       |          ^~~~~~~

The reason is the following upstream change:
  move headers to <libowfat/> upon install

The recipe was already doing this, so now we got 
the header files in /usr/include/libowfat/libowfat

Fix in the libowfat recipe:
 do_install() {
     make install \
         DESTDIR=${D} \
-        INCLUDEDIR=${includedir}/${BPN} \
+        INCLUDEDIR=${includedir} \
         LIBDIR=${libdir} \
         MAN3DIR=${mandir}/man3
 }
:


cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


