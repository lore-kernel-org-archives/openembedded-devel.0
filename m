Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LkaRW-0000V4-Pp
	for openembedded-devel@openembedded.org; Fri, 20 Mar 2009 09:51:06 +0100
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1LkaQU-0003EV-6J
	for openembedded-devel@openembedded.org; Fri, 20 Mar 2009 08:50:02 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Fri, 20 Mar 2009 08:50:02 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Fri, 20 Mar 2009 08:50:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 20 Mar 2009 09:46:36 +0100
Message-ID: <gpvl5d$cbl$1@ger.gmane.org>
References: <49C2BAEA.8050205@gmx.net> <49C2BC74.3090204@gmx.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20090225 Shredder/3.0b3pre
In-Reply-To: <49C2BC74.3090204@gmx.net>
Sender: news <news@ger.gmane.org>
Subject: Re: RFC: extension of policy on removing recipes
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
X-List-Received-Date: Fri, 20 Mar 2009 08:51:07 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19-03-09 22:43, Robert Schuster wrote:
> Hi,
> this is not directly related to the topic. I just want to demonstrate
> what the removal of automake-native 1.10 causes here:
>
> /bin/sh: /home/rob/oe/beagle/tmp/staging/x86_64-linux/usr/bin/mkdir: No
> such file or directory
>
> The problem is that there is no mkdir in STAGING_BINDIR_NATIVE. :( No
> idea, why automake thinks it must be there. Ideas?

It's an interaction between coreutils-native and the new automake. I 
have the exact same problem with angstrom. This problem shows exactly 
why we had weeks of testing when changing the automake version the last 
time (and that was only on a per distro basis!)


regards,

Koen



