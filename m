Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OfgKZ-0001f7-Nu
	for openembedded-devel@lists.openembedded.org;
	Sun, 01 Aug 2010 23:44:28 +0200
Received: by pxi12 with SMTP id 12so1197986pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 01 Aug 2010 14:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=6CYCVxCta+pXZSEj8cpi2sR7FwOIJNP6SA7IZ7DFYrc=;
	b=Rqt+xHXkZuCcfsB96BauvvLdoo/Ynt50LKoH9kUjPSyQhlbT6E9PFpwHXt95Pdt8BL
	oxe+YzRX6rbu0VNmlHiFwLNFBNeVD0kT+hhjdLsDWuyvE2L4LAL4zJd+mow2gx/Czv+o
	Elpn0dgHQXCQQUhTj1V+SbH3cI2YQvmmRflz4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=AVFAQdFo1sv3sK6HJiPiZ9j4tXplkL/VsT8606eKFYmLtzuAjDnufrwecUz9QWGt4n
	lB/++zSjfmmij13bS5GevbaPHPqkjPuFt7afwgGzQi/sHHYB/n2lTFLLrdxXGJl71m3P
	NZUzd++sz6fRDWHaoj/SD7ASRuAyNey5hbsAM=
Received: by 10.114.127.11 with SMTP id z11mr6263951wac.7.1280699043386;
	Sun, 01 Aug 2010 14:44:03 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id g4sm9896458wae.14.2010.08.01.14.44.01
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 01 Aug 2010 14:44:01 -0700 (PDT)
Date: Sun, 1 Aug 2010 14:43:56 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100801214356.GB30928@gmail.com>
References: <76E258664B189C4CBEF125491CA11ECC9455F8DE76@KCINPUNHJCMS01.kpit.com>
MIME-Version: 1.0
In-Reply-To: <76E258664B189C4CBEF125491CA11ECC9455F8DE76@KCINPUNHJCMS01.kpit.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Could not find dbus-daemon in our root file system
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
X-List-Received-Date: Sun, 01 Aug 2010 21:44:28 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (17/07/10 13:11), Soumya R wrote:
> Hi All,
>    
>     I am working on openembedded form past few days for Au1350 mipsel architecture. I need to include
> dbus-daemon where should i include this?. I have included dbus-deamon-proxy_git.bb in dbus in recipes and also
> in task-qte-toolcain-target.bb..I have build a root file system and toolchain from it.. But i could not find the dbus-deamon 
> binary in our rfs.. Please suggest me if i am doing anything wrong..

you need to add dbus to your image task thru RDEPENDS

> 
> 
> Regards,
> soumya 
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


