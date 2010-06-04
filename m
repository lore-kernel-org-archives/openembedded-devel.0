Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OKfAM-0002YK-Fj
	for openembedded-devel@lists.openembedded.org;
	Sat, 05 Jun 2010 00:15:03 +0200
Received: by pvh1 with SMTP id 1so321432pvh.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Jun 2010 15:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=cfZUlG3Nr0xxxfJKayB0n/5Q0FWY5MrG01GbAyIEwcs=;
	b=K2V2BrxbZaiW3QiShM/E3S6Kjhl6HSDJKlBB7/klGfT0w5kcOxMvb8khXoIBoMcStR
	/0ngevH/+rTo313PVv3J8zwkwW/GsEibu9rkm62/hLBrfz7nUnbQcf3Vp5/+skFVms24
	wB9B4ooWy79bGKW5PdmSEgYMDsBmldyEnSc+c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=etfAlVbQHmPcgr7v4MxynGkPMXb2wJmb4hM3am4vAkXJNhLJVOC97pncTyT4DL3egk
	Rtp++bgTbV257FdZ9LcI+JI8NyY2oWkori7wPfu5vzgW+N+vc6MkBnqBn5NJJ6cjCFgm
	c+D+nffmsNrmIHhUhkyvK3OJBQM1ByHuEP7yA=
Received: by 10.142.122.4 with SMTP id u4mr8447536wfc.202.1275689434896;
	Fri, 04 Jun 2010 15:10:34 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id d16sm12281543wam.0.2010.06.04.15.10.33
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 04 Jun 2010 15:10:33 -0700 (PDT)
Date: Fri, 4 Jun 2010 15:10:03 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100604221003.GB27712@gmail.com>
References: <1275673345-16778-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
MIME-Version: 1.0
In-Reply-To: <1275673345-16778-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
	David-John Willis <John.Willis@Distant-earth.com>
Subject: Re: [PATCH] encodings/font-util: swapped inter-DEPENDS
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
X-List-Received-Date: Fri, 04 Jun 2010 22:15:04 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (04/06/10 19:42), Enrico Scholz wrote:
> 'encodings' uses font-util's pkg-config file to determine location of
> the X11 font directory.  When 'font-util' is not staged yet (as it was
> the case), it will use buildhost information which point to something
> like /usr/share/X11 (which is outside of the staging dir) and which are
> not writable.
> 
> This results into an empty 'encodings' package on first bitbake run in a
> pristine tree; 'encodings' must be rebuilt so that it can use font-util
> information from previous runs.
> 
> As 'font-util' itself does not require 'encodings' during build-time,
> there were swapped the DEPENDS.
> 
> Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>

Acked-by: Khem Raj <raj.khem@gmail.com>


