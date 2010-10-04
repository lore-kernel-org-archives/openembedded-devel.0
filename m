Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1P2tRd-0004bU-4W
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Oct 2010 00:23:42 +0200
Received: by iwn2 with SMTP id 2so7430203iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Oct 2010 15:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=Qc2rX+XWrO9Z0NZlGApibFS3gRulqgZmBuEGfKI61/w=;
	b=mFpGWaTIJOsFCVFVoFPEkMlvSUVa12z+OZGduRbexMtWUvzAfK/QqfogfWNy/YFKIW
	si0emuj/dyx0KTnDx8QObMnbiEwve2XWdokA7nwkvooRtellgoXsc7uDjLGoLLI6DVw6
	fl7Jgdg+ZM9WxDgc32GyEEhNjc3F4+t2ds/lc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=W59AMUg4r0a+U0vWNyz7LSI+vctBcdSN9e21KdUhjIyznVOUURoHhGUUymWkas9m6o
	EStMQ1qrkPrl4jQC02PUVVTpyIs6H3Bgtby/2gzfgbDHesLn7WUS6Dy8xv3G2PKbXkUp
	uVrlhktjm6dKddB6r4qshtqP3mKn3JQahhu6Y=
MIME-Version: 1.0
Received: by 10.231.190.203 with SMTP id dj11mr10817555ibb.93.1286231003291;
	Mon, 04 Oct 2010 15:23:23 -0700 (PDT)
Received: by 10.231.158.147 with HTTP; Mon, 4 Oct 2010 15:23:23 -0700 (PDT)
In-Reply-To: <AANLkTinpLXC9tZ0viEHhYPzjBt=0+nG6eRdrw2Ur1ey7@mail.gmail.com>
References: <AANLkTinpLXC9tZ0viEHhYPzjBt=0+nG6eRdrw2Ur1ey7@mail.gmail.com>
Date: Tue, 5 Oct 2010 08:53:23 +1030
Message-ID: <AANLkTinhhE8HU-aheVO_-DojZ5PoondyL3whd-4whM7w@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: trouble building gcc-cross-initial first time
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
X-List-Received-Date: Mon, 04 Oct 2010 22:23:42 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 4 October 2010 19:43, Jan Paesmans <jan.paesmans@gmail.com> wrote:
> Hello all,
>
> When building an image for one of my devices for the first time,
> bitbake always seems to have a problem with building
> gcc-cross-initial. It has the following error:
>
> | In file included from
> /home/jan/src/prodata_openembedded/build/tmp/armv5te/work/armv5te-angstrom-linux-gnueabi/gcc-cross-initial-4.3.3-r13.1/gcc-4.3.3/gcc/sparseset.c:22:
> | /home/jan/src/prodata_openembedded/build/tmp/armv5te/work/armv5te-angstrom-linux-gnueabi/gcc-cross-initial-4.3.3-r13.1/gcc-4.3.3/gcc/system.h:418:
> error: conflicting types for 'strsignal'
> | /usr/include/string.h:564: note: previous declaration of 'strsignal' was here
>
> However, when I restart the exact same bitbake command, the build
> continues without a problem.
>
> I run massive parallel builds with 8 bitbake threads and make -j 8, so
> I suspect that this has something to do with it. One of the tasks the
> is started before is linux-libc-headers_2.6.31.bb, do_package_stage.
> Could it be that this task hasn't finished yet while the
> gcc-cross-initial needs it?
>
> Regards,
>
> Jan
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

I've seen this with gcc 4.3.3 also. I've not seen it with 4.4.4 or 4.5.

-Graham


