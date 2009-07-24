Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MUJCC-0003Dx-Px
	for openembedded-devel@openembedded.org; Fri, 24 Jul 2009 13:44:16 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1MUIyI-0003ax-Vv
	for openembedded-devel@openembedded.org; Fri, 24 Jul 2009 11:29:55 +0000
Received: from iap-pxy-mow1.siemens.ru ([212.248.25.26])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Fri, 24 Jul 2009 11:29:54 +0000
Received: from dbaryshkov by iap-pxy-mow1.siemens.ru with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Fri, 24 Jul 2009 11:29:54 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Date: Fri, 24 Jul 2009 11:29:44 +0000 (UTC)
Message-ID: <h4c5v8$6a2$1@ger.gmane.org>
References: <20090109155223.GF400@smtp.west.cox.net>
	<gk7tkl$p1o$1@ger.gmane.org> <200907082008.01202.vapier@gentoo.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: iap-pxy-mow1.siemens.ru
User-Agent: Pan/0.132 (Waxed in Black)
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
X-List-Received-Date: Fri, 24 Jul 2009 11:44:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Mike Frysinger wrote:

> On Friday 09 January 2009 11:22:43 Koen Kooi wrote:
>> On 09-01-09 16:52, Tom Rini wrote:
>> > Hey all.  Has anyone built any of the blackfin boards recently?  I'm
>> > finding things like uClibc 0.9.29+ require -mfdpic which isn't in our
>> > gcc 4.1.x, is in gcc 4.2.x (but requires a patch to define __FDPIC__
>> > rather than __BFIN_FDPIC__) and other issues still.  Just seeing if
>> > anyone else has these things working before I start getting down and
>> > dirty.
> 
> the FDPIC change is already in mainline gcc and has been for a while
> 
>> I keep starting anew with blackfin support due to the current problems:
> 
> let's fix this wrong info shall we ...

I've started preparing update for bfin in OE. However I'm currently a bit stuck
due to the lack of time. I've pushed parts of it to the shared/blackfin branch.

Anybody is free to update/comment/fix, etc.

One of the problems I'm still facing is the lack of real fork() (i.e. not the
one from uClibc STUBS).

-- 
With best wishes
Dmitry




