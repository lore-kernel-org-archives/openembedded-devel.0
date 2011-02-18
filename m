Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1PqNLh-0004fq-Qb
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Feb 2011 11:14:05 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 3002F3148B51
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Feb 2011 11:12:54 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id ko8J-X7eKMud
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Feb 2011 11:12:48 +0100 (CET)
Received: from [172.22.22.61] (ip-94-79-168-47.unitymediagroup.de
	[94.79.168.47])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.multimedia-labs.de (Postfix) with ESMTPSA id A2791314DD01
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Feb 2011 11:12:48 +0100 (CET)
Message-ID: <4D5E4620.5040901@opendreambox.org>
Date: Fri, 18 Feb 2011 11:12:48 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.14) Gecko/20110208 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTinKjwaC=aqTE2ouKF1VN-iHccUdOSwLG7CnV=ET@mail.gmail.com>
In-Reply-To: <AANLkTinKjwaC=aqTE2ouKF1VN-iHccUdOSwLG7CnV=ET@mail.gmail.com>
Subject: Re: is there a virtual/sysvinit to prevent hard-depends on	sysvinit?
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
X-List-Received-Date: Fri, 18 Feb 2011 10:14:05 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 02/17/2011 09:15 PM, AJ ONeal wrote:
> Is there a virtual/sysvinit?

I don't think so, because IMAGE_INIT_MANAGER is probably sufficient for
most other cases. In case it's going to be added, I think it should be
called virtual/init.

Fwiw, I'm currently evaluating upstart, too. I'm using COMBINED_FEATURES
to conditionally enable upstart, because it requires some minimum kernel
version, e.g.:

IMAGE_INIT_MANAGER ?= "${@base_contains('COMBINED_FEATURES', 'upstart',
'upstart upstart-sysvcompat util-linux-ng-blkid', 'sysvinit
sysvinit-pidof', d)}"

I've created a short-lived branch to show how I currently intend to
handle the coexistence of sysvinit and upstart in recipes (last 3 commits):

http://git.opendreambox.org/?p=obi/openembedded.git;a=shortlog;h=refs/heads/upstart

How do you handle that?

> task-proper-tools depends on sysvinit, which conflicts with upstart.
> 
> How could I specify that it should depend on a virtual package?

virtual/init could be provided by busybox, so if task-proper-tools
depended on that, it wouldn't achive its purpose.

You could use "${@base_contains('COMBINED_FEATURES', 'upstart',
'upstart', 'sysvinit', d)}", which isn't the best solution either,
considering that other init replacements like systemd might get added in
the future.

Regards,
Andreas



