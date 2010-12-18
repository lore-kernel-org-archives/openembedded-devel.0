Received: from mail-fx0-f42.google.com ([209.85.161.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1PTs7j-0003u4-HV
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Dec 2010 09:26:39 +0100
Received: by fxm11 with SMTP id 11so1349294fxm.29
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Dec 2010 00:26:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=W+jEAZAujfM2e4HLSrtmjpGt5EV4CDQGaIFdbs9EZXs=;
	b=aXvtUpH7lBoamX0AYJ4VG7knLRwdQUdYzyT8UyMhB5Txqr1QdDqQm3Edem+9pS+DQM
	VExWAQ51seg6QTY1+SDwXPbqEAyHK/4+NAawW/RAsl160XrgEFUI9W34igitlUllRJif
	zy3MzftRcNWd73L3XuiVDxn1WomQwguUP4UHE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=drl4MoFvuzGjvK8k2ElWXUNtOa96GwsPx+T0pTWrEq5+MeLbdWu9pcaA5S7Clbe+hy
	w0885FTvYpQwdClviTuhSQzpxh9sRoyhx04AQ6klx9Uvm5rPzbciFF97d4inQ2GCqVHK
	cvqo34FDyPA3CibepXZKmisikQmwSOFJKnjZY=
Received: by 10.223.95.203 with SMTP id e11mr1632835fan.60.1292660791807;
	Sat, 18 Dec 2010 00:26:31 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id l14sm318319fan.33.2010.12.18.00.26.30
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 18 Dec 2010 00:26:30 -0800 (PST)
Date: Sat, 18 Dec 2010 09:26:51 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101218082651.GH19482@jama>
References: <1292507333-20222-1-git-send-email-Martin.Jansa@gmail.com>
	<4D0B7C5B.2020302@cbnco.com>
MIME-Version: 1.0
In-Reply-To: <4D0B7C5B.2020302@cbnco.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [RFC] xorg: upgrade to X11R7.6 and remove preferred-xorg-versions*.inc files
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
X-List-Received-Date: Sat, 18 Dec 2010 08:26:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 17, 2010 at 10:06:03AM -0500, Michael Smith wrote:
> Martin Jansa wrote:
> > * X11R7.6-RC1 was already released
> >   http://www.x.org/releases/X11R7.6-RC1/doc/xorg-docs/ReleaseNotes.html
> >   so it's IMHO time to start migration there
> 
> >  .../include/angstrom-2010-preferred-versions.inc   |    1 -
> >  .../preferred-xorg-versions-X11R7.5-latest.inc     |  126 ------
> >  .../include/preferred-xorg-versions-X11R7.5.inc    |  286 -------------
> 
> Hi Martin,

Hi Michael,

thanks for comment.

> As someone who has to update an embedded X11 build maybe once or twice a 
>   year, but still wants to pull in other OE changes once in a while in 
> between, I'd prefer to see the X11R7.5 includes stick around. There are 
> many packages and it's hard for a non-expert to know which versions are 
> meant to be used together.

Well I understand your point, but imho it's valid only in case X11R7.6 
doesn't work on device you're supporting. I haven't seen any "dangerous" 
changes between 7.5 and 7.6.

In other words, my proposal was about single set of versions maintained
as most other recipes, just with keeping latest unless maintainer puts
negative D_P there, so no need for any non-expert to know which versions
are meant to be used together and keep one globally tested set with
"rolling" updates instead jumping whole X11R* release once a year.

Regards,

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


