Received: from mail.reciva.com ([82.71.203.194] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1NPui5-0000s7-Ax
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Dec 2009 10:19:20 +0100
Received: from [85.210.12.93] (helo=[192.168.2.155])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1NPugC-0007h4-HS
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Dec 2009 09:17:20 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <op.u5qsujbtmn1qzu@guohr-laptop-ubuntu>
References: <> <1262160936-28480-1-git-send-email-camelguo@gmail.com>
	<200912300930.12895.holger+oe@freyther.de>
	<op.u5qsujbtmn1qzu@guohr-laptop-ubuntu>
Date: Wed, 30 Dec 2009 09:17:17 +0000
Message-ID: <1262164637.2553.6.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-Broken-Reverse-DNS: no host name found for IP address 85.210.12.93
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] Remove the micro distro specific overridding of variables
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
X-List-Received-Date: Wed, 30 Dec 2009 09:19:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2009-12-30 at 16:36 +0800, Guo Hongruan wrote:
> The micro/micro-uclibc specific check does cause the miss of the  
> /etc/default directory, which is required by the following installation.  
> So the installation of base-file failed when DISTRO=micro or  
> DISTRO=micro-uclibc.

Can you give any more details of the problem you are trying to solve?
Which exact installation step requires /etc/default?  

That directory is indeed not wanted for micro and, per my previous email
on this topic, all the commands which install into it ought to be
wrapped in a specific check against ${DISTRO}.  

Plus, I have recently built for micro-uclibc without seeing this problem
so I am a little baffled as to why it would be failing for you.

p.




