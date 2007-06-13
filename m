Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1HyOUz-0007Fk-Sz
	for openembedded-devel@openembedded.org; Wed, 13 Jun 2007 10:46:42 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l5D8heCN012292
	for <openembedded-devel@openembedded.org>;
	Wed, 13 Jun 2007 09:43:40 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 11983-05 for <openembedded-devel@openembedded.org>;
	Wed, 13 Jun 2007 09:43:37 +0100 (BST)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l5D8haMo012285
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Wed, 13 Jun 2007 09:43:36 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <466EB2BD.5040506@dominion.kabel.utwente.nl>
References: <bdb0025f0706111249n4b28df89p9cbaffa43de7ee06@mail.gmail.com>
	<1181645855.5628.4.camel@localhost.localdomain>
	<bdb0025f0706120718r1f90eadfoc5fccadb3d7263ed@mail.gmail.com>
	<1181659316.5628.29.camel@localhost.localdomain>
	<466EB2BD.5040506@dominion.kabel.utwente.nl>
Date: Wed, 13 Jun 2007 09:43:35 +0100
Message-Id: <1181724216.6126.0.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: strange error when coding a bbclass
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
X-List-Received-Date: Wed, 13 Jun 2007 08:46:42 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2007-06-12 at 16:50 +0200, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Richard Purdie schreef:
> > On Tue, 2007-06-12 at 11:18 -0300, Rodrigo Vivi wrote:
> >> On 6/12/07, Richard Purdie <rpurdie@rpsys.net> wrote:
> >>> On Mon, 2007-06-11 at 16:49 -0300, Rodrigo Vivi wrote:
> >>>
> >>> addtask inserts a dependency so if you add
> >>>
> >>> addtask blah before do_configure
> >>>
> >>> You are saying that say "patch" must run, followed by "blah" followed by
> >>> "configure". Bitbake will check the task dependencies and build them if
> >>> they're missing. If a subsequent task has a timestamp older than its
> >>> dependencies it will rerun them too (just on a per recipe basis at
> >>> present). There have been requests to extend that so if you rebuild gtk
> >>> +, all the gtk apps will rebuild and we will probably optionally allow
> >>> that in due course (it should be easy with the new bitbake core).
> >> I've noticed that and it makes sense. What I really cannot understand
> >> is how a very simple function that does anything but a print can break
> >> that packages?
> > 
> > Try "bitbake busybox", then "bitbake busybox -c package -f". You will
> > find that either it will fail outright or the busybox packages will
> > become corrupt (empty). This is because install must always be (re)run
> > before package. I suspect you're seeing side-affects from that area of
> > breakage (and you're not the only one)...
> 
> Didn't we have a proposed fix for that?

My original suggestion broke do_deploy tasks if I recall correctly. I
therefore proposed copying files rather than moving them but I've not
written that patch yet :/.

Cheers,

Richard



