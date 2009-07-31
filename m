Received: from [74.125.92.145] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1MWoFd-0003zp-C5
	for openembedded-devel@lists.openembedded.org;
	Fri, 31 Jul 2009 11:18:09 +0200
Received: by qw-out-1920.google.com with SMTP id 4so1013227qwk.36
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jul 2009 02:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=Du4coCmO+oLC0XPPs6+VX4BNCHpkeghJsZ6N8JroaIY=;
	b=MQTuteMmKe4vYo6rWd6nO8W0ROAgo0V8CLrLENbeW5zwwlRtDONgq1/hv8u6PG6T9w
	xlo8ByfxRRkW82QuaX+L39DHTv/oX5kDIBetKNKSRv0dpTwbJ2Q8EwevNv49nLz39md1
	v8mnAKhE1EuZVEUJuWIuFJo6hlDm6IToucUUU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=tw+1ofGwOB9rgturPd1KG4uBSCkV9WCW/Fs8glstk5sNOYZao9WCUPeKznhZg2gA78
	0GlYG+NN1/IBPa3KJmaz/s+yh9EF5sKQi/A7tMgraFiD6VmK1rlmIjeeXzFaS2NoHMne
	qZ3u0vkXCinD1G5mxg45MKsz53K2Ya8Azp8r4=
MIME-Version: 1.0
Received: by 10.229.96.13 with SMTP id f13mr422210qcn.36.1249030983574; Fri, 
	31 Jul 2009 02:03:03 -0700 (PDT)
In-Reply-To: <d1b08f940907310050s59fa5675ud222f117a7a49468@mail.gmail.com>
References: <4A6FD077.1060001@gmail.com> <4A700A74.7040507@xora.org.uk>
	<200907291131.04967.marcin@juszkiewicz.com.pl>
	<6ec4247d0907292211w6afc1f60s9fcf21bc7b2d56d3@mail.gmail.com>
	<20090730053353.GF25691@smtp.west.cox.net>
	<6ec4247d0907292249k42c582ddid3d53e847c5f835d@mail.gmail.com>
	<4A7160F2.8030000@xora.org.uk> <4A7255D3.9020703@gmail.com>
	<4A729943.4060200@xora.org.uk>
	<d1b08f940907310050s59fa5675ud222f117a7a49468@mail.gmail.com>
Date: Fri, 31 Jul 2009 18:33:03 +0930
Message-ID: <6ec4247d0907310203t385723d7o857adeac50a6bfa3@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] remove duplicated code from linux.inc
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
X-List-Received-Date: Fri, 31 Jul 2009 09:18:09 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

2009/7/31 Andrea Adami <andrea.adami@gmail.com>:
>>> Graeme Gregory wrote:
>> Looks good to me, do you fancy moving that do_compile_append into
>> kernel.bbclass? You can then have the added kudos of fixing OE core files
>
> Graeme, do you remember "[oe] [PATCH] Automate uboot entry/load
> addresses detection" [*] from Ihar (booxter) ?
> Perhaps Graham could try it.
>
> I tested it but had strange results...
>
> Regards
>
> Andrea
>
>
> [*] http://thread.gmane.org/gmane.comp.handhelds.openembedded/20843/focus=25154

Well, the objdump command(s) work on the mipsel kernel that I'm
building, but on my i686 host vmlinux,

[grg@rak linux]$ objdump -p vmlinux | sed -n 's/LOAD.*vaddr \([^ ]*\).*/\1/p'
    0xc0100000
    0xc08f0000

Multiple lines beginning with 'LOAD'. I don't know whether this is
typical of other architectures also. I'll keep playing on Monday and
report back.

-Graham


