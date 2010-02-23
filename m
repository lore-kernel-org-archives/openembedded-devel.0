Received: from us194mx009.tycoelectronics.net ([198.175.154.211])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jay.snyder@tycoelectronics.com>) id 1NjvDw-0004L6-1h
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Feb 2010 14:54:56 +0100
Received: from [163.241.71.52] (163.241.71.52) by
	us194mx009.tycoelectronics.net (163.241.185.250) with Microsoft SMTP
	Server id 8.1.393.1; Tue, 23 Feb 2010 08:52:06 -0500
Message-ID: <4B83DC88.7070705@tycoelectronics.com>
Date: Tue, 23 Feb 2010 08:47:52 -0500
From: Jay Snyder <jay.snyder@tycoelectronics.com>
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <mailman.3988.1266916925.14961.openembedded-devel@lists.openembedded.org>
In-Reply-To: <mailman.3988.1266916925.14961.openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 198.175.154.211
X-SA-Exim-Mail-From: jay.snyder@tycoelectronics.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Openembedded-devel Digest, Vol 43, Issue 98
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
X-List-Received-Date: Tue, 23 Feb 2010 13:54:56 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

>
>
> try the following:
> TARGET_CC_ARCH += "${LDFLAGS}"
> This should resolve your problems if you build your executable from
> within your OE buildsystem.
> In very rare cases (e.g. when you build some programs outside of OE
> but use OE to package all) it could be useful to use the following:
> INSANE_SKIP_objc = "True"
> AFAIK that sould not be commonly used, but it worked for me.
>
> majo
>

Updating my GCC recipe with a "git pull" worked (the INSANE_SKIP_obj 
line got added sometime recently).

The TARGET_CC_ARCH += "${LDFLAGS}"  fix is the first thing that I try 
when i get this problem, and usually fixes it, although there are some 
packages that required patching Makefile.ac files throughout the 
project.     As I just stated in another reply, when I get beyond the 
current project time crunch (coming up on a release deadline), I will 
submit my recipe patches for inclusion in the OE git repository.

Thanks,
Jay


