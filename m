Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LxRSB-0005FE-OP
	for openembedded-devel@openembedded.org; Fri, 24 Apr 2009 21:52:55 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LxRNX-0004qn-Ty
	for openembedded-devel@openembedded.org; Fri, 24 Apr 2009 19:48:08 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Fri, 24 Apr 2009 19:48:07 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Fri, 24 Apr 2009 19:48:07 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 24 Apr 2009 21:47:56 +0200
Message-ID: <gst51d$67b$1@ger.gmane.org>
References: <gsst4a$cvj$1@ger.gmane.org>
	<49F1FCFB.9000205@balister.org>	<gst2dn$u4j$1@ger.gmane.org>	<20090424191413.GB15489@smtp.west.cox.net>
	<20090424192435.GC15489@smtp.west.cox.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090415 Shredder/3.0b3pre
In-Reply-To: <20090424192435.GC15489@smtp.west.cox.net>
Sender: news <news@ger.gmane.org>
Subject: Re: reverting some csets that kill package upgrade paths
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
X-List-Received-Date: Fri, 24 Apr 2009 19:52:55 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24-04-09 21:24, Tom Rini wrote:
>  But I don't think updating dev on a
> live system from a few months ago to a few months in the future has to
> absolutely work with no human intervention.

I don't think that either, but those 3 csets from today don't fix 
anything, they just introduce breakage. the 'problem' they try to 
address (soname change) is a non-problem from a package manager POV, the 
only breakage with ecore not packaging files had been fixed already.

Sometimes there are good reasons to rename packages, and OE can't have 
some cases with RPROVIDES, since debian.bbclass is too helpfull in some 
cases, e.g:

package (not recipe!) foo renamed to libfoo (e.g by inheriting 
lib_package). You add RPROVIDES_libfoo = "foo" -> debian.bbclass turns 
that into: Provides: libfoo

But this revert request is not about that, it's about reverting breakage 
that serves no use.

regards,

Koen



