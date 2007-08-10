Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1IJWnf-0006CN-5u
	for openembedded-devel@openembedded.org; Fri, 10 Aug 2007 17:53:20 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l7AFoU6s030617
	for <openembedded-devel@openembedded.org>;
	Fri, 10 Aug 2007 16:50:30 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 30452-04 for <openembedded-devel@openembedded.org>;
	Fri, 10 Aug 2007 16:50:26 +0100 (BST)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l7AFoLsl030608
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Fri, 10 Aug 2007 16:50:21 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <74d0deb30708100622mb2c048et188fca0c03e8117e@mail.gmail.com>
References: <74d0deb30708100622mb2c048et188fca0c03e8117e@mail.gmail.com>
Date: Fri, 10 Aug 2007 16:50:21 +0100
Message-Id: <1186761021.6405.45.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [RFC] a small bbclass for task recipes
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
X-List-Received-Date: Fri, 10 Aug 2007 15:53:23 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

On Fri, 2007-08-10 at 15:22 +0200, pHilipp Zabel wrote:
> while looking for the cause of several -dbg packages being included in
> my latest angstrom-x11-image builds, I noticed that some task packages
> have -dev, -doc and
> -dbg versions in the deploy directories because they don't set PACKAGES.
> 
> To improve consistency, I propose to add a small task.bbclass that does set
> ALLOW_EMPTY="1", PACKAGES="${PN}" and PACKAGE_ARCH="all".
> That way simple task recipes can just "inherit task".
> (If needed, this could be enhanced later with a python script to automatically
> add -dbg packages that RRECOMMEND the -dbg versions of packages that
> the main package RDEPENDs upon.)

Creating the -dev and -dbg packages for task packages is intentional.
The python code to create the RRECOMMENDS you mention already exists in
the form of depchains in package.bbclass.

I know this works in poky as its how we create development and debugging
images, I can't remember whether it was enabled in OE.dev or not but the
code is there...

Also, not all task packages are PACKAGE_ARCH = "all" although I guess
they'll be explicitly marked anyway.

Cheers,

Richard





