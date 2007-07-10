Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1I8MvX-0004qC-Fm
	for openembedded-devel@openembedded.org; Tue, 10 Jul 2007 23:07:35 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l6AL1ag1025880
	for <openembedded-devel@openembedded.org>;
	Tue, 10 Jul 2007 22:01:36 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 25415-10 for <openembedded-devel@openembedded.org>;
	Tue, 10 Jul 2007 22:01:33 +0100 (BST)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l6AL1TVn025869
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Tue, 10 Jul 2007 22:01:29 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <48239d390707100845o17a49392vcbf74fd5991b77f3@mail.gmail.com>
References: <48239d390707100845o17a49392vcbf74fd5991b77f3@mail.gmail.com>
Date: Tue, 10 Jul 2007 22:01:28 +0100
Message-Id: <1184101289.3683.7.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [RFC] Palms commits.
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
X-List-Received-Date: Tue, 10 Jul 2007 21:11:04 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

On Tue, 2007-07-10 at 19:45 +0400, Sergey Lapin wrote: 
> I just had raging argument with Paul Sokolovsky about my commits,
> so I'd like to RFC them, and also I'd like to ask if all these changes
> should be passed through RFC.
> 
> Please, see attachments. Sorry for post-factum.

I looked at the attachment and it does give me cause for concern.

What's missing from your email is a clear piece of text saying why
you're making the changes you are. Your commits are also a bit confused.
Updating a kernel defconfig in "Palm Zire 72 machine update" isn't very
obvious.

As for comments on specific things in the patch, in principle I agree
with common machine files and kernel updates. The
MACHINE_EXTRA_RRECOMMENDS in the patch looks horrendous however and it
does go against the principles of task-base and friends. 

Problems with the MACHINE_EXTRA_RRECOMMENDS include:

* the modules should have dependency information which removes the need
for all sound modules to be listed for example, you only need the ones
at the tips of the chains.
* duplication with entries already in task-base

The module_autoload statements also look scary. Is the device totally
incapable of loading some of them for itself? I know for a fact you
don't need all the sound ones.

Regards,

Richard



