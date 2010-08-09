Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <aspnair@gmail.com>) id 1OiQl7-000100-4G
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Aug 2010 13:43:31 +0200
Received: by gxk2 with SMTP id 2so3615743gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Aug 2010 04:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=Q5M1s3xRsLnA8ZhWozpef7Ol+sswHlZ5M+5EUv114Sw=;
	b=it0vmAHLLUDHqj9vg03/XyssdlfCfdoRThbULyFxQeaMifuLtOscFUGGsdFy1aDAiA
	/WpaHa3vWnIJkrfic+jy0r6k/PIClxmeuk0uSAvXDxoYMQx2LIlzLvHMjH+umzThRXhY
	9cQ0oobRVWtD0g7MMJFSaE3eytFF5luHC4+eM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=WVaV2a/9k4E/tCiKKu6t3m+h4qthW/cIeqXSpNy8RuPIMcbKJVpN+H5W+kRM4UaCkh
	1mwa+NCSqZLEA7M20BBdqAB/FBHDoq2OLv+J/SxKL2Lmgse92hfkqmGf5z8A6i8ciYxb
	jS17H1FTTYCvHnrEkzDzYTG9U8uRiRKFDPhFA=
MIME-Version: 1.0
Received: by 10.101.185.6 with SMTP id m6mr17821154anp.22.1281354183288; Mon, 
	09 Aug 2010 04:43:03 -0700 (PDT)
Received: by 10.231.145.69 with HTTP; Mon, 9 Aug 2010 04:43:03 -0700 (PDT)
In-Reply-To: <AANLkTi=vY5==A3XoJfhpp4Qjgbur+fy46L_gPacNhT6d@mail.gmail.com>
References: <AANLkTikW-PHOKKuz1fOiocuU8gGiwFRk3CmTfYtU_gZf@mail.gmail.com>
	<AANLkTi=vY5==A3XoJfhpp4Qjgbur+fy46L_gPacNhT6d@mail.gmail.com>
Date: Mon, 9 Aug 2010 17:13:03 +0530
Message-ID: <AANLkTin9dRBe8r_-gqQagZSZGTfPy2jT08Nvt12Nr+3w@mail.gmail.com>
From: Anand Sivaram <aspnair@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: aspnair@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: application not getting loaded
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
X-List-Received-Date: Mon, 09 Aug 2010 11:43:31 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Aug 9, 2010 at 05:12, Graham Gower <graham.gower@gmail.com> wrote:

> On 8 August 2010 20:25, Anand Sivaram <aspnair@gmail.com> wrote:
> > Dear All,
> >
> > I wrote a custom gstreamer application on ARM (dm6446) angstrom.
> > Whenever I try to run the application, I am getting the following error,
> > that looks
> > as if the shell is treating the application as a shell script.
> >
> > /usr/bin/app: line 1: syntax error: word unexpected (expecting ")")
> >
> > I made sure that the application is having 755 permission and
> readelf/file
> > etc. from
> > a linux pc shows this as an ELF 32 bit ARM executable.
>
> This error message is typical when the system is trying to execute a
> binary built for a different architecture.
>
>
> > These are the dynamic library dependencies during compilation.
> > pkg-config --libs gtk+-2.0 gstreamer-0.10 gstreamer-interfaces-0.10
> >
> > Is it due to some shared library loading problem?  In that case is there
> > any arm "ldd" available on openembedded target or on build host to
> > verify what is missing?
>
> You can invoke the dynamic linker and have it print out the dependent
> dynamic libs. e.g.
> $ /lib/ld.so.1 --list /path/to/bin
>
> But this will execute the binary to make the list, so if your system
> doesn't recognise the binary, this won't work.
>
> -Graham
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

Thanks Graham,  I am looking into that.

Also I noticed the following error while linking, but still the executable
is getting built.

/mnt/project/angstrom-dev/cross/armv5te/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/../../../../arm-angstrom-linux-gnueabi/bin/ld:
warning: libc.so, needed by
/mnt/project/angstrom-dev/cross/armv5te/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/../../../../arm-angstrom-linux-gnueabi/lib/libgcc_s.so,
not found (try using -rpath or -rpath-link)

Any idea?

Thanks and Regards

Anand

