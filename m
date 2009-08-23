Received: from [209.85.222.185] (helo=mail-pz0-f185.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Mf8Bx-0006zi-7K
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 Aug 2009 10:12:45 +0200
Received: by pzk15 with SMTP id 15so510095pzk.24
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Aug 2009 00:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=fovE/pxcPIat0/3+pF7ofRw+o8bB03Gzm8fdykSK3T0=;
	b=BpzPe5PtRULu3RakIUjGMmhLPA3FgzOHBNFDw3/y5ZlgZE0ofnYdTZlaX2ZrOCOy6k
	wsVkEUCNGceSox4EX/A/zwB2AT57jgZ3K6tBplmyl2o2S+/FOA8JffrDfDwP7KenJIek
	w37TL43WWa5aSNVuHmAivlXRR9o1apiZSW4V8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=dcL/jrqoNQYma7pi6cE22tDiBZUYCYeEI8DH961MFszb3POaCoJXXuvWFIY4IKz7yJ
	YrNR9aeZDJOUUaGldlg4ymlZSoNpkHY097Vaa/b86Zh/HGNLjVgUN1KD3HZNeIGDVqcR
	MIlF5p61VfwoburvkYd3sgyKXeiY5vTrRFNjY=
Received: by 10.115.67.30 with SMTP id u30mr4828637wak.119.1251014105521;
	Sun, 23 Aug 2009 00:55:05 -0700 (PDT)
Received: from gmail.com (adsl-71-146-29-169.dsl.pltn13.sbcglobal.net
	[71.146.29.169])
	by mx.google.com with ESMTPS id 23sm1432955pxi.5.2009.08.23.00.55.03
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 23 Aug 2009 00:55:04 -0700 (PDT)
Date: Sun, 23 Aug 2009 00:54:54 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090823075454.GA12300@gmail.com>
References: <20090815022703.GH14883@smtp.west.cox.net>
	<19c1b8a90908151021s67bbdd9fh52a07dce6d51ace8@mail.gmail.com>
	<20090817234049.GH2227@smtp.west.cox.net>
	<19c1b8a90908172329p55250179od552cd94fa4cbff5@mail.gmail.com>
	<20090818154440.GQ2227@smtp.west.cox.net>
	<20090818212827.GA26614@gmail.com>
	<20090818232002.GZ2227@smtp.west.cox.net>
	<19c1b8a90908181648nb43120bg978baa4ac0faa2cb@mail.gmail.com>
	<20090820053123.GD4952@smtp.west.cox.net>
	<19c1b8a90908201258s1d1ba49aice5020132e2e5ba0@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <19c1b8a90908201258s1d1ba49aice5020132e2e5ba0@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [RFC] Adding eglibc versions of minimal and micro distro
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
X-List-Received-Date: Sun, 23 Aug 2009 08:12:45 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On (20/08/09 12:58), Khem Raj wrote:
> On Wed, Aug 19, 2009 at 10:31 PM, Tom Rini<trini@embeddedalley.com> wrote:
> > On Tue, Aug 18, 2009 at 04:48:20PM -0700, Khem Raj wrote:
> > [snip]
> >> > So are we on the same page again, micro/minimal-uclibc can go away and
> >> > micro/minimal can ?= LIBC? :)
> >>
> >> no. LIBC provides other packages too which is different for uclibc
> >> its same for glibc and eglibc so having same for glibc and eglibc is ok but not
> >> for uclibc
> >
> > You've lost me, again.  What does uclibc.inc not set correct for uclibc?
> >
> 
> e.g.
> 
> PREFERRED_PROVIDER_virtual/libintl      = "proxy-libintl"
> PREFERRED_PROVIDER_virtual/libiconv     = "libiconv"
> 
> but if we move these to sane-toolchain-uclibc inc then yes
> we could basically use LIBC knob with some little work

I have committed the change to switch defaulting to eglibc in minimal micro and
sane-toolchain. If you see issues yell at me. I will try to fix ASAP

On Tom's suggestion I also added necessary PREFERRED_PROVIDERS to
sane-toolchain-uclibc and now by selecting correct LIBC with distro
minimal and micro we can have a system built which means we do not
need the -uclibc versions of the minimal and micro distros. 

For now I have left then in there as it is. They will be deleted
if I dont here someone using them.

Thanks

-Khem



