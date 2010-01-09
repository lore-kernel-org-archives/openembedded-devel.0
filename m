Received: from ey-out-1920.google.com ([74.125.78.148])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1NTjBv-0007kG-6T
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 Jan 2010 22:49:54 +0100
Received: by ey-out-1920.google.com with SMTP id 26so3150645eyw.4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Jan 2010 13:47:46 -0800 (PST)
Received: by 10.213.109.156 with SMTP id j28mr1136559ebp.79.1263073666050;
	Sat, 09 Jan 2010 13:47:46 -0800 (PST)
Received: from xora-vm1.xora.org.uk (188-220-34-37.zone11.bethere.co.uk
	[188.220.34.37])
	by mx.google.com with ESMTPS id 7sm1857790eyb.34.2010.01.09.13.47.45
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 09 Jan 2010 13:47:45 -0800 (PST)
Received: by xora-vm1.xora.org.uk (Postfix, from userid 500)
	id C13E42411E; Sat,  9 Jan 2010 21:47:41 +0000 (GMT)
Date: Sat, 9 Jan 2010 21:47:41 +0000
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100109214741.GA2150@xora-vm1.xora.org.uk>
References: <hiarul$ifi$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <hiarul$ifi$1@ger.gmane.org>
User-Agent: Mutt/1.5.20 (2009-08-17)
X-SA-Exim-Connect-IP: 74.125.78.148
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
X-List-Received-Date: Sat, 09 Jan 2010 21:49:55 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jan 09, 2010 at 10:20:20PM +0100, Rolf Leggewie wrote:
> Hi,
> 
> could it be that we are starting udev too early in the boot process?
> 
> http://bugs.openembedded.org/show_bug.cgi?id=5090
> http://bugs.openembedded.org/show_bug.cgi?id=5246
> 
> Above two bug reports whose effects I can confirm would suggest that to
> me.  But I'm not sure about the side-effects of starting udev later than
> where it currently is at.  Anybody care to comment?
> 
My opinion is the dev cache code is wrong, it should cache into /dev which
is the only place guaranteed to be writeable. There then should be a second
init script later in the boot process which moves this to /etc/

Graeme



