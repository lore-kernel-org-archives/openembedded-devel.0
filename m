Received: from [209.85.198.249] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MdWUt-0001jV-Us
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Aug 2009 23:45:40 +0200
Received: by rv-out-0708.google.com with SMTP id l33so992353rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Aug 2009 14:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=OC/wGzKkaiOc8dtclJjvEy5t9cynNd3yB70f/iH4Iwo=;
	b=FuvNFc56//b9E9DVXJWDz9FyQP98FvndoNwM5xijVQK/jXxaEjPGTmK9W/g8JXqdRS
	ymBDoRW1iDgNmTu6yi54VkZdInrwzrvM955a/NLWHMWawYXcW3mrxlH+WX+F+PtCQgZX
	sqBrMTIYIKSJOX36T/zKtI3xXSHFkxS6zQLBg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=Z2DUCf24Q7u9WxlOU0cbEXOyuUv9VhhYLCdsCOOqrkGMV4UzKC1xPd1VPe3CD6l+00
	h1RKss3rnzRKlcU3odteB5oOeLzI/dOWuwZNN+75Un1h6nd10R2JiVO/sFFd/mfCX+AD
	n9yIqLR3lv1XePNy+aZXFsOYUEKZ1fBXfpNmo=
Received: by 10.140.199.16 with SMTP id w16mr1871988rvf.3.1250630913039;
	Tue, 18 Aug 2009 14:28:33 -0700 (PDT)
Received: from gmail.com (adsl-71-146-8-242.dsl.pltn13.sbcglobal.net
	[71.146.8.242])
	by mx.google.com with ESMTPS id c20sm1771838rvf.31.2009.08.18.14.28.31
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 18 Aug 2009 14:28:32 -0700 (PDT)
Date: Tue, 18 Aug 2009 14:28:27 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090818212827.GA26614@gmail.com>
References: <20090814215138.GB31011@gmail.com>
	<20090815022703.GH14883@smtp.west.cox.net>
	<19c1b8a90908151021s67bbdd9fh52a07dce6d51ace8@mail.gmail.com>
	<20090817234049.GH2227@smtp.west.cox.net>
	<19c1b8a90908172329p55250179od552cd94fa4cbff5@mail.gmail.com>
	<20090818154440.GQ2227@smtp.west.cox.net>
MIME-Version: 1.0
In-Reply-To: <20090818154440.GQ2227@smtp.west.cox.net>
User-Agent: Mutt/1.5.17+20080114 (2008-01-14)
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
X-List-Received-Date: Tue, 18 Aug 2009 21:45:40 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On (18/08/09 08:44), Tom Rini wrote:
> On Mon, Aug 17, 2009 at 11:29:31PM -0700, Khem Raj wrote:
> > On Mon, Aug 17, 2009 at 4:40 PM, Tom Rini<trini@embeddedalley.com> wrote:
> > > On Sat, Aug 15, 2009 at 10:21:31AM -0700, Khem Raj wrote:
> > >> On Fri, Aug 14, 2009 at 7:27 PM, Tom Rini<trini@embeddedalley.com> wrote:
> > >> > On Fri, Aug 14, 2009 at 02:51:38PM -0700, Khem Raj wrote:
> > >> >
> > >> >> Hi
> > >> >>
> > >> >> I would like to add minimal-eglibc and micro-eglibc distros on same
> > >> >> lines as -uclibc one's
> > >> >>
> > >> >> Any objections ?
> > >> >
> > >> > minimal-uclibc and micro-uclibc should go away and just pickup from LIBC
> > >> > being passed in / set.
> > >>
> > >> Ideally yes but there are other things like libintl libiconv etc which
> > >> needs special handling
> > >> for uclibc. So having uclibc counterparts is good.
> > >
> > > I don't follow.  LIBC, and the associated inc file set the preferred
> > > providers correctly.  Or are you talking about sharing the same TMPDIR
> > > for > 1 distro ?
> > 
> > If u dont set LIBC then by default glibc is picked. Now it will pick

> 
> If you don't set LIBC that's not a valid distribution configuration.

True however I was talking in context of minimal and micro distros, not in general.

> 
> > eglibc instead
> > not many users override LIBC in there local.conf this way eglibc will
> > get more tested
> 
> So the default should be: LIBC ?= "eglibc" then for minimal, to pull in
> the eglibc.inc file that sets libintl/iconv/etc.

yes

> 
> -- 
> Tom Rini
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


