Received: from [64.233.182.189] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <matthijs.van.de.water@gmail.com>) id 1JoYgB-0005EN-89
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Apr 2008 08:42:07 +0200
Received: by nf-out-0910.google.com with SMTP id h3so1822868nfh.22
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Apr 2008 23:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	bh=KEzQkorlFmf/32IM7+7ptswXrs5LWoFk31Iz7HAQ7Gs=;
	b=ODSsbAkZQ+0wZuTvFuhGxjwMPxCUfSwfYZ9tsJXZPi9tmcMbbyHqK5KHUxdJlqWexcQeYmuAviVrWhONfL1LKsPQ/FfNjklPKRC6v902QRGAOVsnxOmjzkdfCUk8MivZIJDnKB0VGwYb8dpM//aa9Lc2p5dXcouJJL5kX0ZXJ5c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=nsR77kTOcwhckL/y8bQBW4UUsOw5ONb4RlsQfMAaL8TjvJAyjQs/w1OOms3kBj8SJV30L4bncxfT4aO6UfwAYhflWSpxxm5FICnZ31WRDPYy0cWoVyQsKBrsFzqp8HOGWZKAuRPoESulAxrIyYhafbxFV1Gp+6adUxVGkVDYUOA=
Received: by 10.78.132.2 with SMTP id f2mr458967hud.19.1208932919964;
	Tue, 22 Apr 2008 23:41:59 -0700 (PDT)
Received: by 10.78.161.14 with HTTP; Tue, 22 Apr 2008 23:41:59 -0700 (PDT)
Message-ID: <35a670560804222341m1b8168ebg1291613873151b9f@mail.gmail.com>
Date: Wed, 23 Apr 2008 08:41:59 +0200
From: "Matthijs van de Water" <matthijs.van.de.water@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <ftqqja$qdg$1@ger.gmane.org>
MIME-Version: 1.0
References: <35a670560804100650w7de4cec0gae583d5ae73b8fad@mail.gmail.com>
	<47FE2530.2@gmx.net>
	<35a670560804101007m1d787b4ai97927bb42fcbfe5d@mail.gmail.com>
	<4800DC3B.9080007@gmx.net> <ftqqja$qdg$1@ger.gmane.org>
Subject: Re: gcc 4.3.0 status, was: Re: Building ubuntu/gcc-4_2-branch to get GCJ for arm EABI
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Wed, 23 Apr 2008 06:42:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Sat, Apr 12, 2008 at 7:13 PM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
>  There are still a few problems, one of which is the includes-fixed
>  problem, the other that gcc refuses to find stdlib.h even when passed
>  the correct -I${STAGING_INCDIR}. Gcc also likes to ICE like crazy on
>  *_Load.c in libmikmod. It's also lacking the uclibc patches.

Any news on this?

I would be interested to have a look at this, but I'd appreciate a bit
more details on the errors you get and (where appropriate)
workarounds. I'd rather start from where you are than from scratch :)
Did http://sourceware.org/ml/libc-alpha/2007-03/msg00017.html solve
the "include-fixed" problem for glibc?

Thanks,
Matthijs


