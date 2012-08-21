Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1T3rNA-0000WN-TX
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Aug 2012 18:32:09 +0200
Received: by yenm1 with SMTP id m1so6500760yen.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Aug 2012 09:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=LxRlW5rmiE6SC81EHKAaqixEZbO5pgZTlUTmx+6sC3k=;
	b=a4VIZapEtlrjNKNNySaiypfp52zuO5CKkyOuglwzNTwsZRy+ZaQXXFFWsaP1vY37Hy
	r1sde6FpFGbJQOo2jnIfGCoChCqEknLSe3kywYzShn+f6RM/mbQhXNkd6OxSIA4Pd/8e
	uzdZi+ZpiqvIpeaxKW+JsJBoD95ExsZ3X4ATFB67Azvmj22G6fvAaFw3yTUQ/d/1HJs3
	58U6gmPINgzYEQsLVAOHb+ZM52cpnixj1whC5gKn/mkyoAe4lB5gZcRxiLjSUzYRhIuA
	Bmv28FqGPVxT6pOktR2n38BUD9/J6AKKJj5cehCIAAjmFJ6/d1Dbees89QsdNjhpvbq0
	Sinw==
MIME-Version: 1.0
Received: by 10.50.34.131 with SMTP id z3mr14273758igi.45.1345565998023; Tue,
	21 Aug 2012 09:19:58 -0700 (PDT)
Received: by 10.64.18.13 with HTTP; Tue, 21 Aug 2012 09:19:57 -0700 (PDT)
In-Reply-To: <20120821120021.GB3029@jama.jama.net>
References: <1345386709-19033-1-git-send-email-schnitzeltony@googlemail.com>
	<20120821120021.GB3029@jama.jama.net>
Date: Tue, 21 Aug 2012 18:19:57 +0200
Message-ID: <CALbNGRScGweVhd_yS++X1sceqy1kPqQEXJp=qLmjiae4yXpy8Q@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] pixman: remove append from meta-oe
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
X-List-Received-Date: Tue, 21 Aug 2012 16:32:09 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Aug 21, 2012 at 2:00 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> Sorry I haven't noticed/tested it before merging your updated patches to
> meta-oe (before [1] is applied), but your updated patch
> 0001-ARM-qemu-related-workarounds-in-cpu-features-detecti.patch
>
> does not work and emacs is failing again:
> | LC_ALL=C qemu-arm -cpu cortex-a8 -s 1048576 -L
> /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/emacs-23.4-r1/qemu-treedir
> temacs -batch -l loadup dump
> | qemu: uncaught target signal 11 (Segmentation fault) - core dumped
> | Segmentation fault (core dumped)
>
> Cheers,
>
My fault - sorry for that. Will try to take care tomorrow.

Andreas


