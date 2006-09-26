Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <rpurdie@rpsys.net>) id 1GSEtv-0008E6-PJ
	for openembedded-devel@openembedded.org; Tue, 26 Sep 2006 17:31:15 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.6) with ESMTP id k8QFQRgi011120
	for <openembedded-devel@openembedded.org>;
	Tue, 26 Sep 2006 16:26:27 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 10936-05 for <openembedded-devel@openembedded.org>;
	Tue, 26 Sep 2006 16:26:25 +0100 (BST)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.6) with ESMTP id k8QFQMVU011113
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Tue, 26 Sep 2006 16:26:22 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@openembedded.org>
In-Reply-To: <74d0deb30609260757w5b4c2236nab1a8eafe527584e@mail.gmail.com>
References: <45190D58.2020807@adtelecom.es>
	<1865823264.20060926150138@gmail.com> <451948D7.6000904@adtelecom.es>
	<74d0deb30609260757w5b4c2236nab1a8eafe527584e@mail.gmail.com>
Date: Tue, 26 Sep 2006 16:26:23 +0100
Message-Id: <1159284383.5573.126.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: List of dependent packages
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Sep 2006 15:31:16 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2006-09-26 at 16:57 +0200, pHilipp Zabel wrote:
> > NOTE: multiple providers are available (task-bootstrap-unionroot,
> > task-bootstrap);
> > NOTE: consider defining PREFERRED_PROVIDER_task-bootstrap
> > NOTE: package bootstrap-image-1.0: started
> > NOTE: package bootstrap-image-1.0: completed
> > NOTE: build 200609261620: completed
> 
> I wonder if this NOTE should only be shown if there is no provider foo providing
> foo itself. If there is, PREFERRED_PROVIDER_foo ?= "foo" would then have
> to be set internally.
> It looks like now, every time somebody decides to provide an alternative to
> some existing package, everybody has to add PREFERRED_PROVIDER
> entries for this or live with the NOTEs.

Bitbake's behaviour in that regard is flawed. Its also dangerous as the
order it prints those options is significant and it will choose
task-bootstrap-unionroot in this case unless instructed otherwise.
Basically, the names have no significance to bitbake and it will choose
one, effectively at random :-/. When I remember, I will address this in
bitbake...

Richard




