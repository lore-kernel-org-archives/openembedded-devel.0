Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LX9lz-0006My-UM
	for openembedded-devel@openembedded.org; Wed, 11 Feb 2009 08:44:47 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LX9ku-0002gD-Fv
	for openembedded-devel@openembedded.org; Wed, 11 Feb 2009 07:43:36 +0000
Received: from p5483a6b4.dip0.t-ipconnect.de ([84.131.166.180])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 11 Feb 2009 07:43:36 +0000
Received: from vjensen by p5483a6b4.dip0.t-ipconnect.de with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 11 Feb 2009 07:43:36 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Vitus Jensen <vjensen@gmx.de>
Date: Wed, 11 Feb 2009 07:43:22 +0000 (UTC)
Message-ID: <gmtviq$6l8$1@ger.gmane.org>
References: <gmg4k5$rdj$1@ger.gmane.org> <gmgvtg$1i9$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: p5483a6b4.dip0.t-ipconnect.de
User-Agent: Pan/0.133 (House of Butterflies)
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH] rcs_5.7.bb: The Revision Control System (RCS)
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
X-List-Received-Date: Wed, 11 Feb 2009 07:44:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Am Fri, 06 Feb 2009 10:29:20 +0100 schrieb Koen Kooi:

> On 06-02-09 02:43, Vitus Jensen wrote:
>> Please review and comment.
> 
> How valid is that conf.h for all architectures and machines in OE?

conf.h is copied from optware (http://trac.nslu2-linux.org/optware/
browser/trunk/sources/rcs/slug-src-conf.h?rev=2120), just moved /opt/bin 
to /usr/bin.  In my understanding all those settings are libc and syscall 
related, so different architectures and machines won't matter.  Switching 
from glibc to uclibc could make a difference but I have no experience 
with uclibc.

RCS uses a conf.sh script to produce conf.h which I find hard to modify 
to run it inside OE.  Is this really neccessary and if, would be some 
kind of do_after_configure() better than do_compile() to produce conf.h?

Best regards,
   Vitus

PS: sorry, had to remove the patch, pan insists in wordwrapping

-- 
Vitus Jensen, Hannover, Germany, Earth, Milky Way, Universe (current)



