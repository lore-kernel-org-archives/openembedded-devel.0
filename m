Received: from [209.85.132.243] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1LqwEp-00084P-2B
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Apr 2009 23:20:17 +0200
Received: by an-out-0708.google.com with SMTP id b2so3792438ana.42
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Apr 2009 14:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=qxIsdz6ko/WqgoCaEtQwgvz4fijCEut47Hbi8NAyp+g=;
	b=FHnxdxaLn5FkktlbSs8zA5bswq+11udFHqqsLX4qiF2Qy3elN6JgwRcw7uU8PH7+B/
	uH7QFw4RHQbj7S/hdZpfD7nf9e+mxj6N2anLwFPUGvviaE/KcVjEuEzb1M1lvm7BeJJl
	w8lrxhmt+xKFqeqilExxyYCRN1HaGTr/D3WhM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=iniBKbvIso9McwdZVP1KOTzPWwhHpZtudnPG8rcVKCWjQmnVBWY5r9fvIUT1T3vGCt
	HrdZTN9pamHcwWTuQmAbgCFgorOuzr01KxqtlbBoq3MNG+IDv8nCPkIBhOcK/GlHcqki
	TeZbHXiXs4IVMY7GpgZaFw4kgq3AqmE9IQNkI=
MIME-Version: 1.0
Received: by 10.100.248.4 with SMTP id v4mr9227299anh.57.1239052642338; Mon, 
	06 Apr 2009 14:17:22 -0700 (PDT)
In-Reply-To: <20090404192517.GP30840@smtp.west.cox.net>
References: <20090403221352.GH30840@smtp.west.cox.net>
	<20090403221721.GI30840@smtp.west.cox.net>
	<20090403221751.GJ30840@smtp.west.cox.net>
	<20090403221813.GK30840@smtp.west.cox.net>
	<20090404192517.GP30840@smtp.west.cox.net>
Date: Mon, 6 Apr 2009 14:17:22 -0700
Message-ID: <19c1b8a90904061417l34047f23md4e6175e39a22381@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.132.243
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=AWL,BAYES_00,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] task-slugos-toolchain-target: Add libstdc++-dev for C++ heades, bump PR
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 06 Apr 2009 21:20:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

yes indeed. looks ok

On 4/4/09, Tom Rini <trini@kernel.crashing.org> wrote:
> After checking with mwester, this is the correct thing to do.
> ---
>
> task-slugos-toolchain-target: Add libstdc++-dev for C++ heades, bump PR
>
> ---
>  recipes/tasks/task-slugos-toolchain-target.bb |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
>
> diff --git a/recipes/tasks/task-slugos-toolchain-target.bb
> b/recipes/tasks/task-slugos-toolchain-target.bb
> index 489a412..4f9df9b 100644
> --- a/recipes/tasks/task-slugos-toolchain-target.bb
> +++ b/recipes/tasks/task-slugos-toolchain-target.bb
> @@ -2,7 +2,7 @@ DESCRIPTION = "Packages for a standalone SDK or external
> toolchain"
>  LICENSE = "MIT"
>  ALLOW_EMPTY = "1"
>
> -PR = "r1"
> +PR = "r2"
>
>  PACKAGES = "${PN}"
>
> @@ -18,6 +18,7 @@ RDEPENDS_${PN} = "\
>      libcrypto \
>      openssl-dev \
>      libstdc++ \
> +    libstdc++-dev \
>      "
>
>  # Not sure if we need these or not...
> --
> 1.5.6.3
>
>
> --
> Tom Rini
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


