Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1Hy475-000701-2w
	for openembedded-devel@openembedded.org; Tue, 12 Jun 2007 13:00:42 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l5CAvhNs031573
	for <openembedded-devel@openembedded.org>;
	Tue, 12 Jun 2007 11:57:43 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 31433-03 for <openembedded-devel@openembedded.org>;
	Tue, 12 Jun 2007 11:57:40 +0100 (BST)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l5CAvaLO031566
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Tue, 12 Jun 2007 11:57:36 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <bdb0025f0706111249n4b28df89p9cbaffa43de7ee06@mail.gmail.com>
References: <bdb0025f0706111249n4b28df89p9cbaffa43de7ee06@mail.gmail.com>
Date: Tue, 12 Jun 2007 11:57:35 +0100
Message-Id: <1181645855.5628.4.camel@localhost.localdomain>
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
X-List-Received-Date: Tue, 12 Jun 2007 11:00:54 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2007-06-11 at 16:49 -0300, Rodrigo Vivi wrote:
> I have this dummy function in dummyclass.bbclass
> 
> python do_blah () {
>     print "teste"
> }
> 
> just it...
> 
> The strangest thing is that the error depends where I add this task:
> * addtask blah before do_patch  # it breaks do_patch of quilt-native
> * addtask blah before do_configure # it breaks do_stage of quilt-native
> * addtask blah before do_install # it breaks do_configure of linux-libc-headers
> # All logs are in the end of this e-mail.
> 
> This is a very stupid and almost empty function that does nothing
> important but the build breaks...

Its not stupid, its by design.

addtask inserts a dependency so if you add 

addtask blah before do_configure

You are saying that say "patch" must run, followed by "blah" followed by
"configure". Bitbake will check the task dependencies and build them if
they're missing. If a subsequent task has a timestamp older than its
dependencies it will rerun them too (just on a per recipe basis at
present). There have been requests to extend that so if you rebuild gtk
+, all the gtk apps will rebuild and we will probably optionally allow
that in due course (it should be easy with the new bitbake core).

Cheers,

Richard




