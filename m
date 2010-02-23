Received: from mail-fx0-f220.google.com ([209.85.220.220])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1Njqxt-0004id-8b
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Feb 2010 10:22:04 +0100
Received: by fxm20 with SMTP id 20so3270331fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Feb 2010 01:19:17 -0800 (PST)
Received: by 10.223.100.214 with SMTP id z22mr6250268fan.104.1266916756629;
	Tue, 23 Feb 2010 01:19:16 -0800 (PST)
Received: from xora-eee.xora.org.uk (188-220-38-49.zone11.bethere.co.uk
	[188.220.38.49])
	by mx.google.com with ESMTPS id 26sm6746273fks.52.2010.02.23.01.19.15
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 23 Feb 2010 01:19:15 -0800 (PST)
Received: by xora-eee.xora.org.uk (Postfix, from userid 500)
	id 88C3F21470; Tue, 23 Feb 2010 09:19:54 +0000 (GMT)
Date: Tue, 23 Feb 2010 09:19:54 +0000
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100223091954.GA3050@xora-eee.xora.org.uk>
References: <18e217241002221429m1939c786u52da4672f626ca07@mail.gmail.com>
	<hm05ln$2cr$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <hm05ln$2cr$1@dough.gmane.org>
User-Agent: Mutt/1.5.20 (2009-08-17)
X-SA-Exim-Connect-IP: 209.85.220.220
X-SA-Exim-Mail-From: dp@xora.org.uk
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: using initramfs with openembedded.
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
X-List-Received-Date: Tue, 23 Feb 2010 09:22:04 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 23, 2010 at 10:03:51AM +0100, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> On 22-02-10 23:29, C Michael Sundius wrote:
> > We'd like to put our initial boottime file system into the initramfs in the
> > kernel. But we also need to build some separate drivers to put into that
> > filesystem image.
> > 
> > Of course we can't build those drivers without the kernel staging dir
> > populated. (which doesn't happen until after the build of the kernel).
> > 
> > Has anyone run into this problem? how did you solve it? do I need to stage
> > the headerfiles and config info before the kernel build?
> > 
> > maybe this problem is solved some other way.. I haven't really tried this so
> > I'm just speculating here.
> > 
> > If anyone has some experience with this it would be great to hear how to go
> > about this. thanks for you help
> 
> The common way right now is to use 2 kernel recipes. Not an optimal
> situation, but it will get you there.
> 

I think it should be possible to write an initramfs.bbclass and use
BBCLASSEXTEND to make it simpler.

Graeme



