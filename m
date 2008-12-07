Received: from [209.85.200.169] (helo=wf-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1L9RK4-0000Wj-GL
	for openembedded-devel@openembedded.org; Sun, 07 Dec 2008 22:37:52 +0100
Received: by wf-out-1314.google.com with SMTP id 25so885328wfc.6
	for <openembedded-devel@openembedded.org>;
	Sun, 07 Dec 2008 13:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=C7HQy8upTl4/DzvzSxhpdLLg7+P+MEahAaafaLvneps=;
	b=V8xUT9ydC78cbw2Fcoc99LSIcXvrgWW1V3MRiXLwZ7jqxBDW1PYEuJNFaKBiSPpZyN
	sW6HoGEVxS2PKHro4Ouw6U2mfEJ9VTra+oUmtPTMjWOqi2lACVxOJIvOddB2nizxrjU1
	2MT5HWxop3rXgXZkx+nMIrj2mL8sqraABaQ50=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=PFCE+tA4MwQOifYz0jCmgZ8Ef/utpzmHTSnjaju8k8f1qBhD1hOPlpw8B4dswq4aJT
	mHGHGsj10SG3QYkT8LnXzib3FHq0TvPXq6I/hUrB8K62KgJd5hfZF7MFIRwgz6upl8F6
	eXAiSu4woDMA+W/g/DW0Bhg3cYFw6U3V7Rils=
Received: by 10.142.172.12 with SMTP id u12mr1125558wfe.248.1228685642909;
	Sun, 07 Dec 2008 13:34:02 -0800 (PST)
Received: from localhost (adsl-71-146-4-209.dsl.pltn13.sbcglobal.net
	[71.146.4.209])
	by mx.google.com with ESMTPS id 22sm7990054wfi.38.2008.12.07.13.34.01
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 07 Dec 2008 13:34:02 -0800 (PST)
Date: Sun, 7 Dec 2008 13:34:00 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20081207213400.GD4642@gmail.com>
References: <20081207001050.GA1796@gmail.com>
	<20081207005017.GK16628@smtp.west.cox.net>
	<20081207205430.GA4642@gmail.com>
	<20081207211848.GG15204@smtp.west.cox.net>
MIME-Version: 1.0
In-Reply-To: <20081207211848.GG15204@smtp.west.cox.net>
User-Agent: Mutt/1.5.17+20080114 (2008-01-14)
Cc: openembedded-devel@openembedded.org
Subject: Re: mips site files update
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
X-List-Received-Date: Sun, 07 Dec 2008 21:37:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (07/12/08 14:18), Tom Rini wrote:
> On Sun, Dec 07, 2008 at 12:54:30PM -0800, Khem Raj wrote:
> > On (06/12/08 17:50), Tom Rini wrote:
> > > On Sat, Dec 06, 2008 at 04:10:50PM -0800, Khem Raj wrote:
> > > 
> > > > Hi 
> > > > 
> > > > Trying to build for mips based machines. I needed this patch to get the
> > > > console-image building. 
> > > > 
> > > > OK for .dev
> > > 
> > > Can we please please please start splitting things up into common-linux
> > > and common-glibc/uclibc instead?  That way we fix more than mips.
> > 
> > Good. I figured that I only needed this change to get it going.
> > 
> > Thanks
> > -Khem
> 
> > diff --git a/site/common-linux b/site/common-linux
> > index 8d915d0..17d7a8d 100644
> > --- a/site/common-linux
> > +++ b/site/common-linux
> > @@ -10,3 +10,7 @@ samba_cv_HAVE_IRIX_SPECIFIC_CAPABILITIES=${samba_cv_HAVE_IRIX_SPECIFIC_CAPABILIT
> >  # coreutils
> >  fu_cv_sys_stat_statfs2_bsize=${fu_cv_sys_stat_statfs2_bsize=yes}
> >  
> > +# popt
> > +ac_cv_va_copy=${ac_cv_va_copy=yes}
> > +ac_cv___va_copy=${ac_cv___va_copy=yes}
> > +
> 
> I've been thinking about this (but not found much time to act, sorry),
> but we should, at least for common-linux/glibc/uclibc stop grouping by
> package and start grouping by function.  And in this case, perhaps we
> should do:

Configure tests may differ for same function on different packages. Its
useful to know which package needs what defines. va_copy may be tested
in different ways in different package's configure scripts.

> # va_copy
> ac_cv_va_copy=${ac_cv_va_copy=yes}
> ac_cv___va_copy=${ac_cv___va_copy=yes}

> 
> And similar for *{get,set}*uid* and so on.
> 
> In both -glibc and -uclibc, as that's a glibc feature.

Thats why a common file is preferred most of defines could be common
for uclibc and glibc. Keeping two copies is unnessary. 
Anyway for now I will add this to both -uclibc and -glibc files.
How they should be organised logically I will leave for laters.

> feature, I know there's something like ac_cv__dev_is_files or so (about
> to head out the door and already late) and that would be a common-linux
> feature.
> 
> -- 
> Tom Rini
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


