Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1HuAcJ-0000Wt-T4
	for openembedded-devel@openembedded.org; Fri, 01 Jun 2007 19:08:48 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l51H6t81030392
	for <openembedded-devel@openembedded.org>;
	Fri, 1 Jun 2007 18:06:55 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 30029-09 for <openembedded-devel@openembedded.org>;
	Fri,  1 Jun 2007 18:06:52 +0100 (BST)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l51H6niQ030383
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Fri, 1 Jun 2007 18:06:49 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <432beae0706010755m47a91208obc66cc688a6f6f90@mail.gmail.com>
References: <bdb0025f0705301542s7e64e43cjb5b737e7f1958806@mail.gmail.com>
	<1180705209.6390.39.camel@localhost.localdomain>
	<432beae0706010755m47a91208obc66cc688a6f6f90@mail.gmail.com>
Date: Fri, 01 Jun 2007 18:06:48 +0100
Message-Id: <1180717608.6390.200.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: strange error: missing depends...
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
X-List-Received-Date: Fri, 01 Jun 2007 17:08:48 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2007-06-01 at 07:55 -0700, Justin Patrin wrote:
> In the spirit of giving users more info, I've noticed that lately
> OE/bitbake will compile all of the packages and only start the
> do_package_write once almost everything is built, before the image I'm
> targeting gets built.
> 
> I've figured out that this is due to dependency handling as what
> depends on the packages being written to disk is the creation of the
> image, which installs from those packages. The packaging also seems to
> happen if I directly bitbake a provider. It seems somewhat strange
> that bitbaking something which depends on something else doesn't cause
> the dependency to create its package...

If A DEPENDS on B and you want A (you bitbake A), do you need the
package from B? The answer is you don't, you only need B to stage.

The dependency chains tell bitbake when it needs to build the package
and it only does thinsg which it needs.

This is totally configurable. You could add something to local.conf
which always caused dependent packages to build if you so wished...

Add some details about the options to the bitbake manual is on my todo
list and is one reason I've not made the imminent bitbake release.

Cheers,

Richard




