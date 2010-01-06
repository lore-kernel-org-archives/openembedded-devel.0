Received: from mail-bw0-f217.google.com ([209.85.218.217])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NSYGP-0003lv-9B
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Jan 2010 16:57:40 +0100
Received: by bwz9 with SMTP id 9so10338770bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Jan 2010 07:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=3kQsIna1yemt5+wHtb5KTwyXcl6osVuSvSeXRGjwX7o=;
	b=s5+sfmyaTEHyCgGkRXIAAW6PekO7ZC69UdogPBewfoNHcXUydl9IXyymuxCHz71tI8
	Uy0eAkXvrv87cJjZHsfCTcTgxmKcjflboXaitg7kC+WsQPkj6AbP0sHSzbhlOTSAFzhj
	LlXhLjBLMEAVeL5VNlJHLuyqMHcP3IZlfNHuQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=VtBM3qj0vXyJAUGjF81Je1Hfs3za4XDqE8X0vBe4yEaR22kewERRAF5tPNfijN2OSJ
	oalvEQclvwD0/IrMDoSnjlPFJBgDOBFD9RuIDzfSk7rZltZ8iB4ubWoFagNsVm4NnJst
	NesPG4vt9UpGlfmbIp0weQ9Fm65QxiXGdQmtw=
Received: by 10.204.148.85 with SMTP id o21mr3444506bkv.134.1262793332877;
	Wed, 06 Jan 2010 07:55:32 -0800 (PST)
Received: from localhost ([72.14.240.163])
	by mx.google.com with ESMTPS id 13sm6318697bwz.14.2010.01.06.07.55.30
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 06 Jan 2010 07:55:31 -0800 (PST)
Date: Wed, 6 Jan 2010 16:55:29 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100106155529.GB3198@jama>
References: <201001060507.31754.holger+oe@freyther.de>
	<1262791601.32622.2.camel@dax.rpnet.com>
MIME-Version: 1.0
In-Reply-To: <1262791601.32622.2.camel@dax.rpnet.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.218.217
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: QA Goals for OpenEmbedded
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
X-List-Received-Date: Wed, 06 Jan 2010 15:57:40 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 06, 2010 at 03:26:41PM +0000, Richard Purdie wrote:
> On Wed, 2010-01-06 at 05:07 +0100, Holger Hans Peter Freyther wrote:
> > 	*) Koen reported that dependency loop reporting is not working anymore..
> >             anyone cares to invest thes five minutes to fix that?
> 
> In bitbake?

I've seen that too on the same case as Koen, for me it didn't fail
visibly, but after saying that it runs dependency loop detection it
hanged for about 20 mins still working.. then I killed it...

Dependency loop between bitbake tasks was resolved ok and fast (last
time I was changing do_deploy position in kernel.bbclass).

> > 	*) Sometimes we have pretty embarassing issues like some images switching
> >             from mdev back to udev and we don't notice for months(!!!)
> >             It would totally rock if one could change the rootfs.bbclass (or
> >             such) class and count the size of the image on the first run, store 
> >             it in the temp directory and report the diff's back to the 
> >             tinderbox and then we could have a view on the tinderbox?
> > 
> >             Inside the build summary we should see the new size of the image
> >             and the growth compared to the first built?
> > 
> >             The idea would be to have people look at the waterfall and go OMG 
> >             why did "minimal-image" grow by 2MB?
> 
> I started packagehistory.bbclass in Poky with ideas like this in mind.
> It stores data in a filesystem layout and checked package versions don't
> go backwards. Adding transports to send and receive data from a database
> server would be a nice improvement.
> 
> >           *) The next step would be to transfer packet sizes as well
> 
> package sizes? Again this was a goal for packagehistory.bbclass

Maybe not as much QA as above examples, but would be nice to add .md5
sums not only to downloaded sources but also to generated files in
deploy dir (feeds are safe but images are created without).

I've checked kernel.bbclass and image.bbclass and it seems quite easy to
implement, should I prepare patch for that or is there something already?

Cheers,

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


