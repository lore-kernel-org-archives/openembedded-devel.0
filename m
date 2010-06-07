Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OLQu9-0007w6-LD
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Jun 2010 03:13:31 +0200
Received: by pvh1 with SMTP id 1so770087pvh.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Jun 2010 18:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=gTofUD63QQFvxT4RniUkF2/evs28kA/y8oA2snWyz0c=;
	b=SsIZ3LoEA54Cx4gpXr3kNxwe4e6y6s7nVp2HzfP1SC+iUg5Td0Fa+I9cVR7AqCXPFk
	e3ez302XD2h9BAwSpZf9uDEgGQv4khaEPfo9VdEOiifG3PCFocy3ihuB863kyDVzEAAi
	OD2MgDl44A9x/TGlyhcix0BMcMp5Wrpy/m0F8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=nj6JBoCs0aNziU+CgsjZSw4MbB3hNwdf8CD9TyI1rkrwOqRWa77dppMRGoWdplUjWB
	reBcoWuoLljEv1gRjmLAvnfsHcExvfGzMniJDTprEQi+xyjO0NyUOzg9aB+wv8vUSf/t
	kh+pW/oZ7n8scM5Pk4c7+hulvU15cxd8kPXPM=
Received: by 10.114.4.14 with SMTP id 14mr10946396wad.121.1275872949218;
	Sun, 06 Jun 2010 18:09:09 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id 33sm33830634wad.20.2010.06.06.18.09.07
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 06 Jun 2010 18:09:08 -0700 (PDT)
Date: Sun, 6 Jun 2010 18:09:10 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100607010910.GE6723@gmail.com>
References: <BAY127-W96D63AA89D16355433704D8D30@phx.gbl>
	<20100605101418.GA7682@rhein.zuhause.netz>
MIME-Version: 1.0
In-Reply-To: <20100605101418.GA7682@rhein.zuhause.netz>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: glib configuration failed
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
X-List-Received-Date: Mon, 07 Jun 2010 01:13:31 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (05/06/10 12:14), Henning Heinold wrote:
> On Sat, Jun 05, 2010 at 03:34:59PM +0600, saleh usman wrote:
> > 
> >  Hello
> > I am bitbaking console-image and  getting an error of failing configuration of glib-2.0. Kindly tell me how to remove it.Terminal log follows.
> > Saleh
> > 
> > | checking for unistd.h... yes
> > | checking for inflate in -lz... no
> > | configure: error: *** Working zlib library and headers not found ***
> 
> Try bitbake zlib first.

zlib appears to be in DEPENDS list for this recipe. I wonder why it did not
get built.

> 
> 
> > | FATAL: oe_runconf failed
> > NOTE: Task failed: /sdr/build/tmp/work/armv5te-angstrom-linux-gnueabi/glib-2.0-2.23.6-r1/temp/log.do_configure.3044
> > ERROR: TaskFailed event exception, aborting
> > ERROR: Build of /sdr/openembedded/recipes/glib-2.0/glib-2.0_2.23.6.bb do_configure failed
> > ERROR: Task 1122 (/sdr/openembedded/recipes/glib-2.0/glib-2.0_2.23.6.bb, do_configure) failed
> > NOTE: Tasks Summary: Attempted 431 tasks of which 431 didn't need to be rerun and 1 failed.
> > ERROR: '/sdr/openembedded/recipes/glib-2.0/glib-2.0_2.23.6.bb' failed
> 
> Bye Henning
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


