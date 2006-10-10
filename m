Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <rpurdie@rpsys.net>) id 1GXFKn-0005qQ-6s
	for openembedded-devel@openembedded.org; Tue, 10 Oct 2006 12:59:41 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.6) with ESMTP id k9AArVdM016864
	for <openembedded-devel@openembedded.org>;
	Tue, 10 Oct 2006 11:53:31 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 16794-02 for <openembedded-devel@openembedded.org>;
	Tue, 10 Oct 2006 11:53:29 +0100 (BST)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.6) with ESMTP id k9AArRR3016858
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Tue, 10 Oct 2006 11:53:28 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@openembedded.org>
In-Reply-To: <452B5D2B.3000806@dominion.kabel.utwente.nl>
References: <452B5D2B.3000806@dominion.kabel.utwente.nl>
Date: Tue, 10 Oct 2006 11:53:27 +0100
Message-Id: <1160477607.5565.60.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [RFC] removing pre-modular X from .dev
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Oct 2006 10:59:41 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2006-10-10 at 10:43 +0200, Koen Kooi wrote:
> A number of users have been seeing problems with their builds due to mixing pre-modular X
> stuff with Xorg 7.x stuff. I want to propose the following:
> 
>   'Remove all pre-modular X servers, libraries, proto's and extentsions from .dev'
> 
> There are a number of reasons to do this:
> 
>  * premodular X is using unsupported releases
>  * when pulling from cvs, we use a unsupported and obsoleted cvs tree
>  * Xorg 7.x is present and supported in distributions like debian and suse, while the
> premodular X stuff we use is not
>  * Accidentily building xextensions will break your Xorg 7.x build in non-obvious ways.
> 
> I've been wanting to send this RFC to this list for a long while, but was prompted by
> something on IRC: The git-version didn't fetch due to firewall issues, so let's use the
> cvs version.
> 
> The change will basically consist of removing the recipes mentioned in
> http://www.openembedded.org/repo/org.openembedded.dev/conf/distro/include/preferred-x-versions-pre-X11R7.inc

FWIW, I've started this process in poky too and I wouldn't object to it
in .dev. The biggest issue is breaking the nokia770 machine as
xserver-omap needs the older libs. I'm tempted to say to remove it for
now as I'm hopeful other solutions might present themselves in the
medium term. An alternative would be to patch it to use the newer x
versions which might or might not be difficult - I haven't tried.

Cheers,

Richard



