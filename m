Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1HcTwp-0004Iy-40
	for openembedded-devel@openembedded.org; Sat, 14 Apr 2007 00:08:51 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l3DM8o2B009242
	for <openembedded-devel@openembedded.org>;
	Fri, 13 Apr 2007 23:08:50 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 09031-04 for <openembedded-devel@openembedded.org>;
	Fri, 13 Apr 2007 23:08:47 +0100 (BST)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l3DM8jJH009235
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Fri, 13 Apr 2007 23:08:45 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <461FD9AF.6050403@dominion.kabel.utwente.nl>
References: <46176E51.2030608@dominion.kabel.utwente.nl>
	<D93C49B4-4326-49E1-981A-C3EA65F49070@selfish.org>
	<1176049069.5844.6.camel@localhost.localdomain>
	<200704110850.48209.openembedded@hrw.one.pl>
	<461FD9AF.6050403@dominion.kabel.utwente.nl>
Date: Fri, 13 Apr 2007 23:08:46 +0100
Message-Id: <1176502126.5836.24.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [RFC] rm_work
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
X-List-Received-Date: Fri, 13 Apr 2007 22:08:51 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2007-04-13 at 21:27 +0200, Koen Kooi wrote:
> Marcin Juszkiewicz schreef:
> 
> > Maybe rm_work.bbclass should do:
> > 
> > BB_DEFAULT_TASK = "rm_work"
> > addtask rm_work after do_build
> 
> This patch works for me:

This makes me very nervous since thats not how that variable was
intended to be used and I don't think its a good idea in the long term.
Can we try and fix bitbake to allow the correct syntax needed and then
write the metadata in a less invasive way?

That trick works precisely once if you want an illustration of why its
bad.

Richard



