Received: from [85.37.17.113] (helo=smtp-out113.alice.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1MQ5Sh-0008GD-Mu
	for openembedded-devel@lists.openembedded.org;
	Sun, 12 Jul 2009 22:15:51 +0200
Received: from FBCMMO01.fbc.local ([192.168.68.195]) by smtp-out113.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Sun, 12 Jul 2009 22:02:42 +0200
Received: from FBCMCL01B03.fbc.local ([192.168.69.84]) by FBCMMO01.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Sun, 12 Jul 2009 22:02:41 +0200
Received: from [192.168.1.166] ([79.51.85.54]) by FBCMCL01B03.fbc.local with
	Microsoft SMTPSVC(6.0.3790.3959); Sun, 12 Jul 2009 22:02:40 +0200
From: GNUtoo <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1247149089-23480-1-git-send-email-msmith@cbnco.com>
References: <1247149089-23480-1-git-send-email-msmith@cbnco.com>
Date: Sun, 12 Jul 2009 22:02:35 +0200
Message-Id: <1247428960.24399.6.camel@port4>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.4 
X-OriginalArrivalTime: 12 Jul 2009 20:02:41.0227 (UTC)
	FILETIME=[B668A9B0:01CA032B]
Subject: Re: [PATCH] openssh.inc: cleanup
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
X-List-Received-Date: Sun, 12 Jul 2009 20:15:52 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2009-07-09 at 10:18 -0400, Michael Smith wrote:
> Because of leading slashes in FILES_*, some files were being installed
> twice: e.g. /etc/ssh/moduli was in both openssh and openssh-sshd. Now
> openssh is an empty metapackage, which I think was the plan.
> 
> Other cleanups:
> * switch to INC_PR
> * remove dangling slogin symlink to ssh to fix warning
> * remove FILES_openssh-dbg line, which had a syntax error and doesn't
>   appear necessary to keep debug out of the openssh-misc package anymore.
> * rename package ssh-keygen to openssh-keygen for consistency
> * use ${PN} in variable names
> 
> Tested with 5.2p1.
Did you test it at runtime?
if so maybe we should remove that line(that was added because I didn't
have time to test it extensively I only tested the ssh client...):
DEFAULT_PREFERENCE = "-1" 
in 5.2p1



