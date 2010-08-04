Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OgVIr-0005cu-Gq
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 06:10:06 +0200
Received: by pzk2 with SMTP id 2so1902629pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Aug 2010 21:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=heG1tDp3oW5pj9qFKaZclJQG6o/QA9CR5V1r7CT3jj0=;
	b=EoPGT9Z8QbDchDusHbhVDptfD8kMpHAjPe6/aErHMGtpRw8VfobrBmJqAMHHw2cV4I
	A/i4VgI6p1RKdRcSgZVtcxkn6rUHviVu9QpUA01Sh8Rdhnqjtn07dnGqEDUG/y0dPGur
	jPUeoV9A83TT2fm41kQfQdDD56FEGt5Y+wLqE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=kIJSSnG4W5aNTfYcrGdCCz7Y5g8BbAPPqDEm6DRXOQJv2QCSdXp5G3EcCz2RFJow7r
	2uYGnkcpO95B+PCEev3Lg0xCkfzWVmgqyHW8tXXKnSNjC/3sUk92prlTUOKtw9F5qooM
	3ztwCcTWLf4ZJ4W90InhUBsu+AWMyQsQ36CuU=
Received: by 10.142.156.14 with SMTP id d14mr7265685wfe.248.1280894998718;
	Tue, 03 Aug 2010 21:09:58 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id n2sm10028108wfl.1.2010.08.03.21.09.57
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 03 Aug 2010 21:09:57 -0700 (PDT)
Date: Tue, 3 Aug 2010 21:09:49 -0700
From: Khem Raj <raj.khem@gmail.com>
To: Richard Purdie <rpurdie@rpsys.net>
Message-ID: <20100804040949.GA7085@gmail.com>
References: <1279290319.10837.1747.camel@rex> <1280842002.16235.83.camel@rex>
MIME-Version: 1.0
In-Reply-To: <1280842002.16235.83.camel@rex>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.210.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: bitbake-dev <bitbake-dev@lists.berlios.de>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [Bitbake-dev] A new bitbake extension: .bbappend files
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
X-List-Received-Date: Wed, 04 Aug 2010 04:10:07 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (03/08/10 14:26), Richard Purdie wrote:
> On Fri, 2010-07-16 at 15:25 +0100, Richard Purdie wrote:
> > Whilst our layers mechanism, is great it does have a drawback which has
> > bugged me for a while. If you have a recipe like pointercal which has
> > machine specific information in it and you have your new machine code in
> > a layer, how do you add a pointercal file for your machine?
> > 
> > Answer is you copy the whole pointercal recipe and files into your
> > layer, then add the single file for your machine. To me this is ugly,
> > ugly, ugly. We hate code duplication and as soon as you create two
> > copies of the same information, we've failed.
> > 
> > So how could we do this better? Somehow we need to say that a given
> > directory X has some information which should be merged with the
> > original recipe. I've thought through several different ways of doing
> > this and the best solution I found was "bbappend".
> > 
> > The idea is that if bitbake finds any X.bbappend files, when it loads
> > X.bb, it will also include these files after it parses the base .bb file
> > (but before finalise and the anonymous methods run). This means that
> > the .bbappend file can poke around and do whatever it might want to the
> > recipe to customise it.
> > 
> > I went ahead and tried it out as its quite simple to code this in
> > bitbake. I liked the result enough I've already merged this into Poky:
> > 
> > http://git.pokylinux.org/cgit.cgi/poky/commit/?id=63e6ba85677b8aa9f4cf9942a1fccbb8a8c72660
> > 
> > I'm proposing to push it to bitbake master if there are no serious
> > objections.
> 
> Whilst I think there were some initial concerns the consensus seemed to
> be that this was a good thing to have in bitbake, its something that has
> been on the feature wishlist since day one so I've merged the patch into
> bitbake master.

Now this fails.

$ bitbake -c clean -b virtual:native:/home/kraj/work/oe/openembedded/recipes/zlib/zlib_1.2.3.bb
Command execution failed: Traceback (most recent call last):
  File "/home/kraj/work/oe/bitbake/lib/bb/command.py", line 88, in
runAsyncCommand
    commandmethod(self.cmds_async, self, options)
  File "/home/kraj/work/oe/bitbake/lib/bb/command.py", line 174, in
buildFile
    command.cooker.buildFile(bfile, task)
  File "/home/kraj/work/oe/bitbake/lib/bb/cooker.py", line 640, in
buildFile
    the_data = self.bb_cache.loadDataFull(fn, self.get_file_appends(fn),
self.configuration.data)
  File "/home/kraj/work/oe/bitbake/lib/bb/cooker.py", line 897, in
get_file_appends
    if f in self.appendlist:
AttributeError: BBCooker instance has no attribute 'appendlist'


> 
> Cheers,
> 
> Richard
> 
> _______________________________________________
> Bitbake-dev mailing list
> Bitbake-dev@lists.berlios.de
> https://lists.berlios.de/mailman/listinfo/bitbake-dev


