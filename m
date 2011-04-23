Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QDcSF-0003pP-3o for openembedded-devel@lists.openembedded.org;
	Sat, 23 Apr 2011 15:00:55 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QDcPu-0004zH-QY for openembedded-devel@lists.openembedded.org;
	Sat, 23 Apr 2011 14:58:30 +0200
Received: from 77.126.199.51 ([77.126.199.51])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Apr 2011 14:58:30 +0200
Received: from dzvernik by 77.126.199.51 with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Apr 2011 14:58:30 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: DmitryZ <dzvernik@gmail.com>
Date: Sat, 23 Apr 2011 12:58:16 +0000 (UTC)
Message-ID: <loom.20110423T144701-128@post.gmane.org>
References: <1302979061.3780.6.camel@mattotaupa>
	<1303062425.23572.31.camel@mattotaupa>
	<4DACB16C.6050303@eric-weiss.de>
	<loom.20110423T113131-855@post.gmane.org>
	<1303553742.4551.2.camel@mattotaupa>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: sea.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 77.126.199.51 (Mozilla/5.0 (X11; U; Linux i686;
	en-US) AppleWebKit/534.16 (KHTML, like Gecko) Chrome/10.0.648.205
	Safari/534.16)
Subject: Re: [RFC] [PATCH] schroedinger: add version 1.0.10
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
X-List-Received-Date: Sat, 23 Apr 2011 13:00:55 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Paul Menzel <paulepanter <at> users.sourceforge.net> writes:

> please update to latest master and make a new build from scratch, i. e.,
> remove your build directory beforehand.
> 
> You could also use `bitbake -c clean yourprogramname` before the upgrade
> to try to get rid of the wrong versions.
> 
> Thanks,
> 
> Paul
> 

Dear Paul,

Thanks for advice. I'm just trying your suggestions. But just to let you know 
that I was updated to the master about three days ago. I just double checked 
which of the orc versions the OE downloaded in order to build the problematic 
package and it was 0.4.13. At the beginning of this thread it was said to try to 
build it instead of 0.4.12 with 0.4.10 where the defines for different types 
still exist. However, it looks that the OE trying to build it with 0.4.13 where 
the types still omitted. Do you know about some patches that were applied in a 
last three days or something.
Just to let you know, I have been building the Angstrom console-image with 
eglibc for mini6410 machine. The preffered kernel version that came with OE git 
is 2.6.28 with stable patch 6, however it is impossible to build it since the 
make oldconfig fails with ERROR that says that it mixes the implicit and normal 
rules, so I just needed to upgrade to some newer kernel. So I just upgraded it 
to the 2.6.37 and specifically kernel build succeeded.
As being newbie to the whole stuff I was wondering if the all things somehow 
have been in connection with one to other.





