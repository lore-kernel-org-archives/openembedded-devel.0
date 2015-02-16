Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f169.google.com (mail-yk0-f169.google.com
	[209.85.160.169])
	by mail.openembedded.org (Postfix) with ESMTP id D86AF606E8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Feb 2015 23:13:15 +0000 (UTC)
Received: by mail-yk0-f169.google.com with SMTP id 79so14439659ykr.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Feb 2015 15:13:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=Tve2Jn1MQr4cJbdx48KobILtnftpkCSWZi5oW2hwMCo=;
	b=1DAswMFlewJL725+McEblyh6yqBKWO+W4Aus36n91nYxXOkx8dewX/u4Ahrsr1nsKP
	aocXkC9v+gYzZKD3T1q1w3ftbwo1zv6PutSNo6DNG31guXSRtivfmotUOYn+Tc+JO0Cy
	vX1SKVDuPzD/U3MLciKihq8coEIXf5tXEZvCFbIKWB/zvyuB8L8gK1VtqztY3VKSoBg0
	/0vB+a3CAaCk60STiooGYsE715el1nKj37OTRLZkvQTmzlsMpD/e+YAas4kzNu+1IeOL
	AxKmbYdPsQRKDC2yqDKq+svN9WhEEl89AxNrSFJaYD4NNgitMHR4JVyu5JLytmcushgR
	Z2AQ==
MIME-Version: 1.0
X-Received: by 10.170.132.144 with SMTP id y138mr281788ykb.70.1424128396607;
	Mon, 16 Feb 2015 15:13:16 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.123.133 with HTTP; Mon, 16 Feb 2015 15:13:16 -0800 (PST)
In-Reply-To: <1424123733-16696-1-git-send-email-max.oss.09@gmail.com>
References: <1424123733-16696-1-git-send-email-max.oss.09@gmail.com>
Date: Mon, 16 Feb 2015 21:13:16 -0200
X-Google-Sender-Auth: ohW1a4OWq7mNy9OK4tGUjULoSZk
Message-ID: <CAP9ODKqN2iTwBSQUJW46YH8A-qSkV4FPbCsJ-Y2ArSr9mBTXFQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-java][PATCH 0/7] Allow build for multiple ARCH in the same builddir
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Feb 2015 23:13:16 -0000
Content-Type: text/plain; charset=UTF-8

Hello Max,

First I want to Thank you for all the hard work you've been putting in
the meta-java lately. This is an important step on the right direction
and fixes several things a lot the process...

On Mon, Feb 16, 2015 at 7:55 PM, Max Krummenacher <max.oss.09@gmail.com> wrote:
> Building a recipe which provides packages for allarch and ${TUNE_PKGARCH}
> fails if one builds in the same build directory for different TUNE_PKGARCHs.
>
> An example is rhino which fails as follows when one builds first for
> armv7at2hf-vfp and then for armv7at2hf-vfp-neon.
>     ERROR: The recipe rhino is trying to install files into a
>     shared area when those files already exist. Those files and their
>     manifest location are:
>        /.../ipk/all/librhino-java_1.7r4-r0_all.ipk
>     Matched in manifest-armv7at2hf-vfp-rhino-package_write_ipk
>
> The change in package arch is done in java-library.bbclass. Most of the
> users of java-library.bbclass don't install any files in the ${TUNE_PKGARCH}
> packages or install shell scripts which may also be deployed in an allarch
> package.
>
> Most of the recipes including java-library.bbclass no longer build with newer
> layer revisions.
> This patchset first update the recipes to build again, changes java-library
> build all packages in allarch by default and recipes which must have some
> of their packages in ${TUNE_PKGARCH} to have all of their recipes in
> ${TUNE_PKGARCH}.

All this is perfect. I agree with all here and it does move things on
a saner way.

> Finaly some of the recipes I tried did not build before and after the proposed
> changes. I document these in README.nonworking. I don't have the time to work
> on these and I guess no one has been interested in years.

This is the only thing I believe we can improve. We could use
PNBLACKLIST as done in meta-oe and put a short reasoning on why it
fails. I prefer this mostly because people don't read README often and
will end reporting it is failing...

What do you think?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

