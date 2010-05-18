Received: from mail-fx0-f51.google.com ([209.85.161.51])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <top.grzechu@gmail.com>) id 1OEHng-0002jE-Sa
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 May 2010 10:05:18 +0200
Received: by fxm18 with SMTP id 18so722261fxm.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 May 2010 01:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=zbZf/8jq5izKUMhA+jLTmSYP0Bez4fDAYddRKEiM5A4=;
	b=Q+a7M+eYwlTj7ln1T2KFWkWfHXezmjq8U70Dqrv6/huQsQru9VK2dfpmDKh9BY3ktn
	CerKG0+jPPaAX3I8KLfIcEBXhaq+dMDPeMAm+xO7FzSfvJ/GzOBxOjE5fgBzRcGQI4Nx
	0ig5tXZbpnF0uTbP5KnA4YYBifDIwuCPjmqgs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=ahjB1QCpEidQSrPtwuWuHdnI7wug5NyEAYpe1901WeKo5ES/s4bkgMOeuaH0pe0q/C
	iw7gRwdJhj6I8FzsLA8ctsgqLNb03EeDwzz8xS80w0NZnPziIazfxhd+i9558MuwqGWt
	uhrDqTBOoEA9MUcj6gG0pViiiXz9BngRQQJH8=
MIME-Version: 1.0
Received: by 10.204.48.212 with SMTP id s20mr101688bkf.205.1274169676754; Tue, 
	18 May 2010 01:01:16 -0700 (PDT)
Received: by 10.204.76.131 with HTTP; Tue, 18 May 2010 01:01:16 -0700 (PDT)
In-Reply-To: <20100518074606.GA19476@gmail.com>
References: <AANLkTinL4kGrM6P5Di1N4KI-95sFuEwDn-RM_SZ32cjS@mail.gmail.com>
	<20100518074606.GA19476@gmail.com>
Date: Tue, 18 May 2010 10:01:16 +0200
Message-ID: <AANLkTiklA399rZKCKrzwJyt3i9DcKDrTF51uIF5WAXlm@mail.gmail.com>
From: Grzegorz Toporek <top.grzechu@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.51
X-SA-Exim-Mail-From: top.grzechu@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Problem at the very beginning
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
X-List-Received-Date: Tue, 18 May 2010 08:05:18 -0000
Content-Type: text/plain; charset=ISO-8859-1

>
> the python code in
> /home/grzesiek/tele/openembedded/recipes/tasks/task-shr-minimal.bb
>
> depends upon a metadata variable called LIBC and this is not set in your
> distro file. This could be one of 'glibc|eglibc|uclibc" depending upon
> what system library you want. In your case it seems to be glibc
>
> So if you set
>
> LIBC = "glibc" in your distro file then it should work.
>

Many thanks! It works like a charm!

I have one question. How can I update an old system on my board? Should I
delete it or just build new packages and upload them to my board?

Ones again many thanks.

Best Regads,
Grzegorz

2010/5/18 Khem Raj <raj.khem@gmail.com>

> On (18/05/10 09:03), Grzegorz Toporek wrote:
> > Hi all,
> >
> > I'm new to the mailing list so I would like to say hello to everyone. I'm
> > new to OE/bitbake as well so please be patient...
> >
> > I was trying to build busybox package but unfortunately I got this error.
> Is
> > it a type conversion problem?  I got this with "Simple Helloworld"
> either...
> >
> > What should be mentioned, there was no a problem to build this for
> > angstrom-2008.1 distribution (machine om-gta01). Now I have changed it to
> > colibri, which is my boar, and the problem occurred.
> >
> > I have attached all my .conf files to this e-mail.
> >
> > Please help me with this problem. Looking forward to your reply.
> >
> > ERROR:
> >
> > NOTE: Handling BitBake files: \ (7927/8366) [94 %]NOTE: <type
> > 'exceptions.TypeError'>:unsupported operand type(s) for +: 'NoneType' and
> > 'str' while evaluating:
> >   task-x11-illume   task-fonts-truetype-core   e-wm-menu-shr   shr-wizard
> > shr-theme-gry   xcursor-transparent-theme   xinput-calibrator
> > libx11-locale   ${@get_rdepends(bb, d)}   e-wm-config-illume2-shr
> > ERROR: unsupported operand type(s) for +: 'NoneType' and 'str' while
> parsing
> > /home/grzesiek/tele/openembedded/recipes/tasks/task-shr-minimal.bb
> > NOTE: Handling BitBake files: / (8366/8366) [100 %]
> > NOTE: Parsing finished. 7584 cached, 453 parsed, 328 skipped, 0 masked.
> > ERROR: Parsing errors found, exiting...
>
> the python code in
> /home/grzesiek/tele/openembedded/recipes/tasks/task-shr-minimal.bb
>
> depends upon a metadata variable called LIBC and this is not set in your
> distro file. This could be one of 'glibc|eglibc|uclibc" depending upon
> what system library you want. In your case it seems to be glibc
>
> So if you set
>
> LIBC = "glibc" in your distro file then it should work.
>
> -Khem
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

