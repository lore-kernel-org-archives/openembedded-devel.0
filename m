Received: from fg-out-1718.google.com ([72.14.220.157])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Nl5ej-0002kj-8P
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Feb 2010 20:15:25 +0100
Received: by fg-out-1718.google.com with SMTP id e21so87696fga.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Feb 2010 11:12:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=zQlVp9eZleiywzZYx4i5GvPz+AATKoWv80DBf2lvo5M=;
	b=OUQzgJGSW8e3/QhAvOV2UpxiAB7GSs/rLmETYKJJXR+0im5Q+Ieq6sfZgiDVOKnOtd
	rWpMlepDJ/vSLUy45Zf0jIuIn+1iMmHcOL/Fg9ejK5VbB77lrsL48UohP8kWSJNUUa7G
	8Bx0M1XgExRgvWBgOuHsQLLdSTvCi5zCUOS2k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=NTMFYsnT2v+6ppsFSgG3Mtziy11x9hwFBxcbtl/ObBX1H2znQnlIP8H/QWWBMAIuDs
	qJ7UTDBWeRJLm0wX/jJS4Mk4ED9J+EMpmQffRiWMTXmU2X6+v5AUx+D2Jz6b2+tTu7cw
	7qT2H7DCRi7VsO7rOwksw6yE33xRj9/2h4LmM=
Received: by 10.87.63.3 with SMTP id q3mr1627528fgk.53.1267211555739;
	Fri, 26 Feb 2010 11:12:35 -0800 (PST)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id 15sm363514fxm.0.2010.02.26.11.12.32
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 26 Feb 2010 11:12:34 -0800 (PST)
Date: Fri, 26 Feb 2010 11:11:05 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100226191105.GB25079@gmail.com>
References: <4B75781F.4000202@cbnco.com> <hl4148$3v3$1@ger.gmane.org>
	<20100212181441.GA27392@denix.org>
MIME-Version: 1.0
In-Reply-To: <20100212181441.GA27392@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 72.14.220.157
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_PASS autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] package.bbclass and aggressive library stripping
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
X-List-Received-Date: Fri, 26 Feb 2010 19:15:25 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (12/02/10 13:14), Denys Dmytriyenko wrote:
> On Fri, Feb 12, 2010 at 05:54:34PM +0100, Koen Kooi wrote:
> > On 12-02-10 16:47, Josh Mahonin wrote:
> > > Hi all,
> > > 
> > > I was attempting to use GDB on an OE build, but was given various
> > > warnings about threads being disabled.  I've traced the problem to
> > > package.bbclass stripping out necessary symbols in 'libpthread.so.0',
> > > referenced as section 6 in http://sourceware.org/gdb/wiki/FAQ
> > > 
> > > I'm admittedly using an out of date OE checkout, but the problem still
> > > appears to be present in trunk as well.  Is it better to create a
> > > special case in package.bbclass just for libpthread, or should a
> > > blacklist be created for other potentially affected libraries as well?
> > 
> > Installed the appropriate -dbg package works for me
> 
> In other words - all the debug symbols are in the corresponding -dbg packages. 
> The main packages are stripped to save space on the target - so there is no 
> real need to do separate release/debug builds.

libthread_db is special and should not be stripped. I am not sure if gdb is
able to read the symbols from separate debug file for this shared lib. 
similarily libpthread.so.1 should not be stripped of the symbol table.
I dont know if we strip out symbol tables too if we do then we should spare
these two libraries.

> 
> -- 
> Denys
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


