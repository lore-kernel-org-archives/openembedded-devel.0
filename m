Received: from [209.85.162.179] (helo=el-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <dfarning@gmail.com>) id 1IsvGJ-0002JJ-Dh
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Nov 2007 08:05:11 +0100
Received: by el-out-1112.google.com with SMTP id z25so363341ele
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Nov 2007 23:03:27 -0800 (PST)
Received: by 10.70.52.8 with SMTP id z8mr2112609wxz.1195175791870;
	Thu, 15 Nov 2007 17:16:31 -0800 (PST)
Received: from lenovo ( [69.179.85.165])
	by mx.google.com with ESMTPS id h17sm6194539wxd.2007.11.15.17.16.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 15 Nov 2007 17:16:31 -0800 (PST)
Received: by lenovo (sSMTP sendmail emulation); Thu, 15 Nov 2007 19:16:27 -0600
Date: Thu, 15 Nov 2007 19:16:27 -0600
From: David Farning <dfarning@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20071116011627.GA7192@lenovo>
References: <472216E5.6060708@student.utwente.nl>
	<20071115080222.2c3a597f@cimmeria>
MIME-Version: 1.0
In-Reply-To: <20071115080222.2c3a597f@cimmeria>
User-Agent: Mutt/1.5.15+20070412 (2007-04-11)
Subject: Re: [RFC] adding CONFLICTS
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 16 Nov 2007 07:05:11 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 15, 2007 at 08:02:22AM +0000, Graeme Gregory wrote:
> On Fri, 26 Oct 2007 18:33:41 +0200
> Koen Kooi <k.kooi@student.utwente.nl> wrote:
> 
> > -----BEGIN PGP SIGNED MESSAGE-----
> > Hash: SHA1
> > 
> > Hi,
> > 
> > Since we don't have packaged staging yet, what do people thing about
> > adding CONFLICTS to packages the interfere with eachother like e.g.
> > medialibraries like sdl and their hacked-up qte versions, multiple
> > kernels (linux-foo and linux-foo-devel) etc...
> > 
> > regards,
> > 
> > Koen
> 
> This sounds good in theory as long as bitbake actually chokes with
> a sensible error message.
> 
> Hopefully then it makes uses more aware what went wrong.
>
A good way to look at this issue is to study how Seth Vidal sovled the
issue in YUM, Fedora's updater.  It is written in python, so easy for
BitBake developers to understand.

It seems that it would add a good deal of complexity to the current
design of bitbake.

Although useful this might be an idea for bitbake 2.0

Thanks
David Farning


