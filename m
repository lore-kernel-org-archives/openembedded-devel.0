Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1HKDQ1-0004aP-LA
	for openembedded-devel@openembedded.org; Thu, 22 Feb 2007 13:51:29 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l1MCpTU2031711;
	Thu, 22 Feb 2007 12:51:29 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 31703-01; Thu, 22 Feb 2007 12:51:26 +0000 (GMT)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l1MCpNnn031681
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO);
	Thu, 22 Feb 2007 12:51:23 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <erjv1k$sm8$1@sea.gmane.org>
References: <erjv1k$sm8$1@sea.gmane.org>
Date: Thu, 22 Feb 2007 12:51:23 +0000
Message-Id: <1172148683.5837.60.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Rob Kramer <robk@starhub.net.sg>
Subject: Re: How to specify RDEPENDS properly?
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
X-List-Received-Date: Thu, 22 Feb 2007 12:51:30 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2007-02-22 at 19:32 +0800, Rob Kramer wrote:
> I'm trying to build my custom image after updating OE (it worked several
> months back :). I've already converted several things to the new style, but
> I can't get my RDEPENDS right. There are about 4 problematic packages, but
> let's pick readline.
> 
> I want libreadline.so in my image, so I include readline as follows: 
> 
> export PACKAGE_INSTALL = "... readline ..."
> RDEPENDS = "${PACKAGE_INSTALL}"
> 
> That doesn't work though:
> 
> | Collected errors:
> | Cannot find package readline.
> | Check the spelling or perhaps run 'ipkg update'
[...]
> export PACKAGE_INSTALL = "... libreadline ..."
> RDEPENDS = "${PACKAGE_INSTALL}"
> 
> That doesn't work either:
> 
> BB>> build display-image
> SHELL: This command needs to parse bbfiles...
> NOTE: Using cache in '/bulk/home/rob/oe/dev/build-epia/tmp/cache/rob-epia'
> NOTE: Handling BitBake files: | (4243/4243) [100 %]
> NOTE: Parsing finished. 3315 cached, 1 parsed, 196 skipped, 731 masked.
> 
> SHELL: Building display-image
> ERROR: Nothing provides runtime dependency libreadline
> NOTE: no buildable providers for display-image
> 
> Neither does 'libreadline4'.
> 
> I looked at how all the other images/tasks do this, but it seems readline is
> not RDEPENDed anywhere...?
> 
> How should I do this, or where to RTFM, if explained there?

Paul's explanation is nearly correct although not quite.

There are two namespaces in OE, (build) DEPENDS and (runtime) RDEPENDS.
DEPENDS comes from the package names (PN), RDEPENDS comes from PACKAGES.
Anything you put in RDEPENDS should match something in PACKAGES.

The correct line is therefore:

export PACKAGE_INSTALL = "... libreadline ..."
RDEPENDS = "${PACKAGE_INSTALL}"

but as you point out, this didn't work. The reason is debian.bbclass 's
package renaming which changes libreadline_4.3-r3_i586.ipk into
libreadline4_4.3-r3_i586.ipk.

You therefore need libreadline4 in PACKAGE_INSTALL but readline in
RDEPENDS.

This highlights a nice bug since its not possible to easily add
debian.bbclass renamed packages directly to an image in PACKAGE_INSTALL.
People have hinted at there being some problem for a while but I only
now realise exactly what it is (nobody shown me a failure case until
now).

The reason most people don't hit this is they declare tasks eg:

PACKAGES = "task-myimage"

RDEPENDS_task-myimage = "readline"

in some task-myimage.bb and then use PACKAGE_INSTALL = "task-myimage".
There is magic behind the scenes which will convert readline into
libreadline4 when its written out to a package.

Armed with the above info, you should at least be able to work around
this. I'll give some thought to processing PACKAGE_INSTALL so we can
convert references in it into proper package names...

Cheers,

Richard




