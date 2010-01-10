Received: from mail-ew0-f209.google.com ([209.85.219.209])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1NU0pn-0002In-2T
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Jan 2010 17:40:14 +0100
Received: by ewy1 with SMTP id 1so2275098ewy.28
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jan 2010 08:38:03 -0800 (PST)
Received: by 10.213.48.75 with SMTP id q11mr1197163ebf.84.1263141483337;
	Sun, 10 Jan 2010 08:38:03 -0800 (PST)
Received: from xora-vm1.xora.org.uk (188-220-34-37.zone11.bethere.co.uk
	[188.220.34.37])
	by mx.google.com with ESMTPS id 13sm168770ewy.1.2010.01.10.08.38.02
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 10 Jan 2010 08:38:02 -0800 (PST)
Received: by xora-vm1.xora.org.uk (Postfix, from userid 500)
	id B797A2414A; Sun, 10 Jan 2010 16:38:02 +0000 (GMT)
Date: Sun, 10 Jan 2010 16:38:02 +0000
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100110163802.GB1893@xora-vm1.xora.org.uk>
References: <hiarul$ifi$1@ger.gmane.org>
	<20100109214741.GA2150@xora-vm1.xora.org.uk>
MIME-Version: 1.0
In-Reply-To: <20100109214741.GA2150@xora-vm1.xora.org.uk>
User-Agent: Mutt/1.5.20 (2009-08-17)
X-SA-Exim-Connect-IP: 209.85.219.209
X-SA-Exim-Mail-From: dp@xora.org.uk
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Are we starting udev too early in the boot process?
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
X-List-Received-Date: Sun, 10 Jan 2010 16:40:14 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jan 09, 2010 at 09:47:41PM +0000, Graeme Gregory wrote:
> On Sat, Jan 09, 2010 at 10:20:20PM +0100, Rolf Leggewie wrote:
> > Hi,
> > 
> > could it be that we are starting udev too early in the boot process?
> > 
> > http://bugs.openembedded.org/show_bug.cgi?id=5090
> > http://bugs.openembedded.org/show_bug.cgi?id=5246
> > 
> > Above two bug reports whose effects I can confirm would suggest that to
> > me.  But I'm not sure about the side-effects of starting udev later than
> > where it currently is at.  Anybody care to comment?
> > 
> My opinion is the dev cache code is wrong, it should cache into /dev which
> is the only place guaranteed to be writeable. There then should be a second
> init script later in the boot process which moves this to /etc/
> 
In fact to follow on from my mail, as 2.6.32 devfs has reapperred in the
kernel we could do away with the caching on modern kernels totally.

Graeme



