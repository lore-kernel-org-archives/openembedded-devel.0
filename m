Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1QL0sU-0001Xx-7t
	for openembedded-devel@lists.openembedded.org;
	Sat, 14 May 2011 00:30:35 +0200
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id B8D5611003BE
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 May 2011 00:27:46 +0200 (CEST)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id C1A5F110039A
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 May 2011 00:27:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.1
Received: from rhein.familie-heinold.de (f052228110.adsl.alicedsl.de
	[78.52.228.110]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 May 2011 00:27:45 +0200 (CEST)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 4C9513C0D9; Sat, 14 May 2011 00:26:53 +0200 (CEST)
Date: Sat, 14 May 2011 00:26:52 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110513222652.GA3231@mail.familie-heinold.de>
References: <1305062085.9982.62.camel@mattotaupa>
	<1305133911.2421.29.camel@phil-desktop>
	<20110511202510.GG7657@mx.loc>
	<1305324915.7858.11.camel@mattotaupa>
MIME-Version: 1.0
In-Reply-To: <1305324915.7858.11.camel@mattotaupa>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: new uClibc srcrev fails with `unwind-resume.c:31:19: error: expected ')' before 'struct'` (was: minimal-uclibc: systemd fails with `src/manager.c:257:42: error: 'EPOLL_CLOEXEC' undeclared (first use in this function)`)
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
X-List-Received-Date: Fri, 13 May 2011 22:30:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Paul,

first,

Khem and I discovered it too and Khem had a fix for it and I think he will
push it soon into uclibc-gi tree.

Move the headers around:

mv include/unwind.h libc/sysdeps/linux/common/
mv ./libpthread/nptl/sysdeps/unix/sysv/linux/arm/unwind.h ./libc/sysdeps/linux/arm/

second
you wont be able to compile systemd, after working around as much as possible
there are to many CPU_ functions missing in uclibc.

Bye Henning


