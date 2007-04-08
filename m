Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1Haa1e-0007Nn-BH
	for openembedded-devel@openembedded.org; Sun, 08 Apr 2007 18:13:58 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l38GDv1J019630
	for <openembedded-devel@openembedded.org>;
	Sun, 8 Apr 2007 17:13:57 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 19513-01 for <openembedded-devel@openembedded.org>;
	Sun,  8 Apr 2007 17:13:55 +0100 (BST)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l38GDqHT019621
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Sun, 8 Apr 2007 17:13:52 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <46176E51.2030608@dominion.kabel.utwente.nl>
References: <46176E51.2030608@dominion.kabel.utwente.nl>
Date: Sun, 08 Apr 2007 17:13:52 +0100
Message-Id: <1176048832.5844.1.camel@localhost.localdomain>
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
X-List-Received-Date: Sun, 08 Apr 2007 16:13:58 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

On Sat, 2007-04-07 at 12:11 +0200, Koen Kooi wrote:
> I want to propose making rm_work inherited by default with the following changes:
> 
> * a KEEP_WORK = "1" var in bitbake.conf so it is opt-in
> * a KEEP_WORK_pn-${PN} option to mark packages in local.conf
> * a KEEP_WORK option in recipes to mark them, e.g. for llvm
> 
> Summary: it will default to 'off' (keep the workdir), but can be switched globally and per
> package.
> 
> In the last few weeks that I've used rm_work, I haven't found any big problems with it,
> but as Graeme points out, there is no easy way to disable yet.
> 
> What do you think?

As I see it, rm_work is a policy which can be applied by an individual
or a distro. I don't think it should be mandatory but if certain distros
wish to use it be default, that is up to them and I'm fine with that.

Cheers,

Richard







