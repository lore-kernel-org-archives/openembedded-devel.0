Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1IlXfD-00058D-KK
	for openembedded-devel@openembedded.org; Sat, 27 Oct 2007 00:28:23 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l9QMKrEe011545
	for <openembedded-devel@openembedded.org>;
	Fri, 26 Oct 2007 23:20:53 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 11183-09 for <openembedded-devel@openembedded.org>;
	Fri, 26 Oct 2007 23:20:43 +0100 (BST)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l9QMKgUe011528
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Fri, 26 Oct 2007 23:20:42 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <CA5EEB08-2B31-4DC9-A7C7-2CB56243E808@selfish.org>
References: <E1IlBjn-00084R-Qk@linuxtogo.org>
	<47217083.4000103@student.utwente.nl>
	<CA5EEB08-2B31-4DC9-A7C7-2CB56243E808@selfish.org>
Date: Fri, 26 Oct 2007 23:20:44 +0100
Message-Id: <1193437245.6177.123.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [oe-commits] org.oe.dev packages/webkit: Build and	package naming fixes (when using debian renaming)
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
X-List-Received-Date: Fri, 26 Oct 2007 22:28:23 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2007-10-26 at 15:42 +0200, Holger Freyther wrote:
> Am 26.10.2007 um 06:43 schrieb Koen Kooi:
> 
> > -----BEGIN PGP SIGNED MESSAGE-----
> > Hash: SHA1
> >
> > freyther commit schreef:
> >> packages/webkit: Build and package naming fixes (when using debian  
> >> renaming)
> >>     We do not want the package to be named libwebkitgtk-launcher  
> >> but want to
> >>     keep the webkit-gtklauncher names.
> >
> > Do we? I created and maintain those recipes, and I made the  
> > decision to
> > name it libwebkitgtk-launcher when using debian naming. I would have
> > used DEBIAN_NOAUTONAME_webkit-gtklauncher otherwise. Which brings  
> > me to
> > my second point:
>
> please enlighten me. I want to put webkit-gtklauncher into my image.  
> Due the package renaming do_rootfs will fail. Do you want people to  
> put webkit-gtklauncher into their image? How can they do it?

In theory, package renaming should be accounted for in package creation.
We write package renaming data to the staging area in the form of
pkgmaps and pkgdata and this is then used when creating packages to
remap the Dependency and similar fields. Extremely ugly but it does
work.

Dredging the depths of my memory I think there is a bug where
IMAGE_INSTALL (or whatever the field is called) is not remapped before
processing and it should be. Most people work around or don't see this
by using task packages.

Cheers,

Richard



