Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id D3CDA759B4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Oct 2015 00:44:17 +0000 (UTC)
Received: by iofz202 with SMTP id z202so64396642iof.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Oct 2015 17:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=k1m/IkQcOvoYGQs4Nj0HQ6TyLk8sOd53c3lxic36x0E=;
	b=QK6pNR7aif8CxLOGcaNdI7Qbp2S1syPxYH0uRkB5dLGHnIncwbpkeCBfT8Vy/X+uNR
	4jSJZCjQFM6xCHHGBqNT0+mLs2WyQZJo6O0DLhi85ks2GE2spVnx2PAajvVSgepWbdWL
	IHY4J81sDRL6ULW6+EhY+PgLP/XOHzioQs4TakN4AXUBtXpirE4GdWXNNEpivU0IkalV
	BMrfKwfe4FdIImq+sdxiuRqurUM+LFH73dVCm8AE1CuFJTqDFCuRr9EUjLBQ0LUMa+K5
	DtTxO68sy6jdZuw9/A7+TRCgFQ9kRK/RiJ1E1PEDSP32dQ0gv6mpvffT1RSaZtnRAd26
	0cDQ==
X-Received: by 10.107.3.77 with SMTP id 74mr6636664iod.49.1446165857468; Thu,
	29 Oct 2015 17:44:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.38.133 with HTTP; Thu, 29 Oct 2015 17:43:47 -0700 (PDT)
In-Reply-To: <F81DC1078564A34BB4DA30CAE03814D12D4EB65D@ORSMSX104.amr.corp.intel.com>
References: <F81DC1078564A34BB4DA30CAE03814D12D4EB65D@ORSMSX104.amr.corp.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 29 Oct 2015 17:43:47 -0700
Message-ID: <CAMKF1sqT-fxjZ5TPMrDEGjMq7MVttucqjDxUf7vp4zVdwusw2A@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: openjdk-7 and gcc v5
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
X-List-Received-Date: Fri, 30 Oct 2015 00:44:18 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Oct 29, 2015 at 4:00 PM, Bruce, Henry <henry.bruce@intel.com> wrote:
> Many thanks to contributors who fixed openjdk build issues introduced by gcc v5 and for maintainers for pushing the updates.
> However one problem remains: openjdk build fails in openjdk/jdk/make/java/nio due to -static compiler flag being used in conjunction with -pthread giving error
> /usr/bin/ld: cannot find -lpthread
> /usr/bin/ld: cannot find -lc
>

its not clear how the -static flag can cause this. may be its using CC
for LD or wise versa ?

> I fixed this by removing -static flag from Makefile. Not sure of this was the right thing to do (so I didn't submit patch) but it worked for me.
> I added the following to the an openjdk bbappend and it fixed the build and resulting jre is running OK.
>
> do_configure_append() {
>         gcc -v 2>&1 | grep 5\..
>         if [ "$?" == "0" ]; then

why this check for gcc ?

>                 sed -i s/-static// ${B}/openjdk/jdk/make/java/nio/Makefile
>         fi
> }
>
> Regards,
>
> Henry Bruce
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

