Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1HbHRh-0006sv-4H
	for openembedded-devel@openembedded.org; Tue, 10 Apr 2007 16:35:45 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l3AEZi4P027321
	for <openembedded-devel@openembedded.org>;
	Tue, 10 Apr 2007 15:35:44 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 26916-10 for <openembedded-devel@openembedded.org>;
	Tue, 10 Apr 2007 15:35:42 +0100 (BST)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l3AEZbh1027312
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Tue, 10 Apr 2007 15:35:37 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <20070410093818.GC4456@zfr01-2138.crm.mot.com>
References: <20070330133719.GF4796@zfr01-2138.crm.mot.com>
	<1175383645.5852.24.camel@localhost.localdomain>
	<20070410093818.GC4456@zfr01-2138.crm.mot.com>
Date: Tue, 10 Apr 2007 15:35:37 +0100
Message-Id: <1176215737.5809.87.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Problem for building glibc (ipkg-build: command not found)
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
X-List-Received-Date: Tue, 10 Apr 2007 14:35:46 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2007-04-10 at 11:38 +0200, Jeremy Dufour wrote:
> On 04/01/07 at 00:27:25 (+0100), Richard Purdie wrote:
> > [...]
> > It looks like a dependency issue, there is no way to tell bitbake that
> > ipkg-utils-native must have run do_populate_staging before it can run
> > do_package_write tasks.
> 
> If I understand well, the problem here is that glibc is trying to do a
> "do_package_write" before ipkg-utils-native is built?

Correct.

> But I did not understand exactly why we can not "just" said that glibc
> depend on ipk-utils-native?

In bitbake 1.8 we've enabled multithreading and we've chosen to do this
on a per task basis rather than a per .bb file basis. We therefore need
task level dependencies rather than the higher per file .bb
dependencies.

Regards,

Richard




