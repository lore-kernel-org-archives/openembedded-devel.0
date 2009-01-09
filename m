Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LLOQp-00038v-AZ
	for openembedded-devel@openembedded.org; Fri, 09 Jan 2009 21:58:15 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LLOKo-00013r-GV
	for openembedded-devel@openembedded.org; Fri, 09 Jan 2009 20:52:02 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Fri, 09 Jan 2009 20:52:02 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Fri, 09 Jan 2009 20:52:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 09 Jan 2009 21:51:53 +0100
Message-ID: <gk8dd9$447$1@ger.gmane.org>
References: <20090109155223.GF400@smtp.west.cox.net>	<gk7tkl$p1o$1@ger.gmane.org>
	<20090109183512.GK400@smtp.west.cox.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20081230 Shredder/3.0b2pre
In-Reply-To: <20090109183512.GK400@smtp.west.cox.net>
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
X-List-Received-Date: Fri, 09 Jan 2009 20:58:15 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09-01-09 19:35, Tom Rini wrote:
> On Fri, Jan 09, 2009 at 05:22:43PM +0100, Koen Kooi wrote:
>> On 09-01-09 16:52, Tom Rini wrote:
>>> Hey all.  Has anyone built any of the blackfin boards recently?  I'm
>>> finding things like uClibc 0.9.29+ require -mfdpic which isn't in our
>>> gcc 4.1.x, is in gcc 4.2.x (but requires a patch to define __FDPIC__
>>> rather than __BFIN_FDPIC__) and other issues still.  Just seeing if
>>> anyone else has these things working before I start getting down and
>>> dirty.  Thanks!
>> I keep starting anew with blackfin support due to the current problems:
>>
>> * ADI uses their own 'distro', the rest of the world a custom buildroot
>> * You need to get gcc from blackfin SVN to get something to compile
>> * you need to choose either uclibc from blackfin svn or upstream uclibc
>
> Oh joy of joys.  Would it be a problem to import the ADI magic versions
> of thing (and SRC_URI_append_bfin) ?

Not at all, my local diff for that got blown away during the git 
transition, but it's a one liner for gcc_4.<something>.inc where you 
override SRC_URI to point to svn://bf.ucl.org
I hope you get the semi-shared lib thing to work, since that's what 
would be usefull for OE, but I can see the use for static binaries.
Did Richard merge his darwin stuff yet that allows shared libs to have 
custom extensions (.e.g .dylib for OSX)? That would make this a bit 
easier to handle.

regards,

Koen




