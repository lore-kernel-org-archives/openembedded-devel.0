Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1IXYKw-0006gk-Fj
	for openembedded-devel@openembedded.org; Tue, 18 Sep 2007 10:21:42 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l8I8HnhY027777;
	Tue, 18 Sep 2007 09:17:49 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 27688-02; Tue, 18 Sep 2007 09:17:41 +0100 (BST)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l8I8HchQ027765
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO);
	Tue, 18 Sep 2007 09:17:38 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <20070918014128.GA760@thegnar.org>
References: <1189985156.9658.38.camel@localhost.localdomain>
	<20070918014128.GA760@thegnar.org>
Date: Tue, 18 Sep 2007 09:17:38 +0100
Message-Id: <1190103458.6159.13.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Ross Burton <ross@openedhand.com>
Subject: Re: RFC: Staging layout and pkgconfig sysroot support
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
X-List-Received-Date: Tue, 18 Sep 2007 08:21:45 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2007-09-17 at 18:41 -0700, mark gross wrote:
> On Mon, Sep 17, 2007 at 12:25:56AM +0100, Richard Purdie wrote:
> > The sed code in pkgconfig.bbclass has always struck me as ugly. In an
> > ideal world we shouldn't have to rewrite the contents of the pkgconfig
> > files to make them work with OE.
> > 
> > Packages like dbus and eds are starting to add paths to runtime module
> > and state directories into the pkgconfig files and OE's current approach
> > totally breaks these.
> 
> Then shouldn't we beet on the dbus guys to not break things?

I don't think the dbus guys are doing anything wrong and this is an
entirely an artifact of our own design choices. The problem is that
dbus-1.pc contains:

session_bus_services_dir=/media/data1/builds/poky/eabi/tmp/staging/arm-poky-linux-gnueabi/share/dbus-1/services

and evolution-data-server.pc has things like:

libdir=/media/data1/builds/poky/eabi/tmp/staging/arm-poky-linux-gnueabi/lib
extensiondir=${libdir}/evolution-data-server-1.2/extensions

The above was created by our sed "magic" in pkgconfig.bbclass. EDS
modules then use this to decide where to install its plugins which
results in broken packages. The dbus entry is just asking for trouble
too.

You could argue our sed magic is wrong and just needs improving. What do
you make it do in the eds case though? First replace all ${libdir} with
an expanded version, then change libdir?

The best alternative idea I've seen is to hack pkgconfig to make the sed
expansions at runtime for the -L and -I options pkgconfig returns. You
have to admit its a pretty ugly solution though. 

The sysroot patch is simpler and has a good chance of being accepted
upstream and solves the problem once and for all.

I have really mixed feelings and can see the arguments both ways
really...

Cheers,

Richard




