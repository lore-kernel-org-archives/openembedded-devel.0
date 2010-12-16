Received: from mail-gx0-f179.google.com ([209.85.161.179])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PT6PA-0000YY-JR
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Dec 2010 06:29:29 +0100
Received: by gxk21 with SMTP id 21so1946236gxk.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Dec 2010 21:27:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=1yrbZJS7bp5mCyoCPbUZfcbsvqhjFJvkImEwc3R51no=;
	b=Hyp5ApML6Ckg47nrzNd/vYE5lEwfqAdS60bSX8fQa0uXsAlT3N3HxHyxnYyfSTtnNP
	kCXJJuTEaPr6yEcvDp8b8UGq6T1m1CGW/asGuKI9xTc3DPKBmN3gNM0Wequ0SVzFoQU6
	+NE4MLYVeRbeP8jwlG/PtxiZPD2tmGJLYXhDA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=PcsWMvNArV6v7+nmxv8YYo7j1KODbAixRz+Eg5EjtZMDWCWjbLrbUpFEQWGsRLtnsF
	lbfUEIVW7hWizdqwkfODZLN/jpqJjKleXaza7JOECDJnjZKDgP/BBZvnkoHghUJqA2gy
	7u8zp9MNJFl5g9bV8ZEpLA8u23QoDgIE/igQ4=
Received: by 10.236.103.169 with SMTP id f29mr1552383yhg.15.1292477269828;
	Wed, 15 Dec 2010 21:27:49 -0800 (PST)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id l4sm1252234yhl.21.2010.12.15.21.27.48
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 15 Dec 2010 21:27:48 -0800 (PST)
Date: Wed, 15 Dec 2010 21:27:52 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101216052752.GC18068@gmail.com>
References: <1291813231-24536-1-git-send-email-obi@opendreambox.org>
	<4D0614C6.5060105@opendreambox.org>
MIME-Version: 1.0
In-Reply-To: <4D0614C6.5060105@opendreambox.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.179
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH resend] package.bbclass: call PACKAGESTRIPFUNCS before populate_packages
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
X-List-Received-Date: Thu, 16 Dec 2010 05:29:29 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (13/12/10 13:42), Andreas Oberritter wrote:
> Ping
> 
> On 12/08/2010 02:00 PM, Andreas Oberritter wrote:
> >   Introduce run_strip_funcs() to call the functions in
> >   PACKAGESTRIPFUNCS and place it before populate_packages().
> > 
> >   This allows users of do_split_packages() to package the .debug
> >   directories, which get created by do_runstrip().
> > 
> >   do_split_packages() is usually prepended to populate_packages().
> > 
> > Signed-off-by: Andreas Oberritter <obi@opendreambox.org>

looks ok to me. I thought .debug are automatically picked into -debug
packages 
In what cases will this help ?

> > ---
> >  classes/package.bbclass |   12 +++++++-----
> >  1 files changed, 7 insertions(+), 5 deletions(-)
> > 
> > diff --git a/classes/package.bbclass b/classes/package.bbclass
> > index 2769595..678ffa9 100644
> > --- a/classes/package.bbclass
> > +++ b/classes/package.bbclass
> > @@ -367,6 +367,12 @@ python perform_packagecopy () {
> >  	os.system('cp -pPR %s/. %s/' % (installdest, pkgcopy))
> >  }
> >  
> > +python run_strip_funcs() {
> > +	if (bb.data.getVar('PACKAGE_STRIP', d, True) != 'no'):
> > +		for f in (bb.data.getVar('PACKAGESTRIPFUNCS', d, True) or '').split():
> > +			bb.build.exec_func(f, d)
> > +}
> > +
> >  python populate_packages () {
> >  	import glob, errno, re,os
> >  
> > @@ -391,11 +397,6 @@ python populate_packages () {
> >  		else:
> >  			package_list.append(pkg)
> >  
> > -
> > -	if (bb.data.getVar('PACKAGE_STRIP', d, True) != 'no'):
> > -		for f in (bb.data.getVar('PACKAGESTRIPFUNCS', d, True) or '').split():
> > -			bb.build.exec_func(f, d)
> > -
> >  	pkgdest = bb.data.getVar('PKGDEST', d, True)
> >  	os.system('rm -rf %s' % pkgdest)
> >  
> > @@ -1011,6 +1012,7 @@ PACKAGE_PREPROCESS_FUNCS ?= ""
> >  PACKAGEFUNCS ?= "perform_packagecopy \
> >                  ${PACKAGE_PREPROCESS_FUNCS} \
> >  		package_do_split_locales \
> > +		run_strip_funcs \
> >  		populate_packages \
> >  		package_do_shlibs \
> >  		package_do_pkgconfig \
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


