Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LLKEV-0001qt-3Q
	for openembedded-devel@openembedded.org; Fri, 09 Jan 2009 17:29:15 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LLK8S-0006kA-Mg
	for openembedded-devel@openembedded.org; Fri, 09 Jan 2009 16:23:00 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Fri, 09 Jan 2009 16:23:00 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Fri, 09 Jan 2009 16:23:00 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 09 Jan 2009 17:22:43 +0100
Message-ID: <gk7tkl$p1o$1@ger.gmane.org>
References: <20090109155223.GF400@smtp.west.cox.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20081230 Shredder/3.0b2pre
In-Reply-To: <20090109155223.GF400@smtp.west.cox.net>
Sender: news <news@ger.gmane.org>
Subject: Re: Blackfin support
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
X-List-Received-Date: Fri, 09 Jan 2009 16:29:15 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09-01-09 16:52, Tom Rini wrote:
> Hey all.  Has anyone built any of the blackfin boards recently?  I'm
> finding things like uClibc 0.9.29+ require -mfdpic which isn't in our
> gcc 4.1.x, is in gcc 4.2.x (but requires a patch to define __FDPIC__
> rather than __BFIN_FDPIC__) and other issues still.  Just seeing if
> anyone else has these things working before I start getting down and
> dirty.  Thanks!

I keep starting anew with blackfin support due to the current problems:

* ADI uses their own 'distro', the rest of the world a custom buildroot
* You need to get gcc from blackfin SVN to get something to compile
* you need to choose either uclibc from blackfin svn or upstream uclibc

When you get to the point of building uclibc, the fun starts, since 
uclinux (not uclibc) has no proper shared library support, so you have 
to choose an emulation method (fdpic being one of the options).
 From that point on it's downhill, since various parts of uclibc have 
fork() in their code, gcc will ICE on other parts, etc.

My latest attempt was:

http://dominion.thruhere.net/koen/cms/blackfin-toolchain-progress

I still have the board, so if you make some progress I can test it :)

regards,

Koen




